Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8D06AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 02:24:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K2OJHq029499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Feb 2017 18:24:19 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 19 Feb 2017 18:24:19 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
	<5c9fb24fb0118322b6ef212808eb7fe2c1fcd171.1487139819.git.liezhi.yang@windriver.com>
	<CAJTo0LZaQj9383VjtQOWzj00_sVX9jvCYyDDOTGvUEuE8p3Wxg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <2704380d-d35f-f8bf-7cf6-53dc719df6e9@windriver.com>
Date: Mon, 20 Feb 2017 10:24:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZaQj9383VjtQOWzj00_sVX9jvCYyDDOTGvUEuE8p3Wxg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] btrfs-tools: remove udev from DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 02:24:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/17/2017 11:14 PM, Burton, Ross wrote:
>
> On 15 February 2017 at 06:25, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The log said that udev was added to DEPENDS because btrfs-tools installs
>     a udev rule, this was incorrect, and it caused a side effect:
>
>     $ bitbake btrfs-tools-native
>
>     ERROR: Nothing PROVIDES 'udev-native' (but
>     virtual:native:btrfs-tools_4.8.5.bb <http://btrfs-tools_4.8.5.bb> DEPENDS on
>     or otherwise requires it). Close matches:
>     [snip]
>
>
> Are you sure?  The configure.ac <http://configure.ac> does this:

Sorry, I only looked at the log, now updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/6fixes
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/6fixes

Robert Yang (6):
   python-native: PROVIDES python-io-native
   btrfs-tools: remove udev from DEPENDS
   tcl: extend to nativesdk
   gawk/json-glib/libcheck: extend to nativesdk
   tcl: fix sed in do_install()
   binconfig.bbclass: fix get_binconfig_mangle()




Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Feb 8 19:30:30 2017 -0800

     btrfs-tools: only target requires udev

     The native doesn't have to depend on udev, fixed:

     $ bitbake btrfs-tools-native

     ERROR: Nothing PROVIDES 'udev-native' (but 
virtual:native:btrfs-tools_4.8.5.bb DEPENDS on or otherwise requires it). Close 
matches:
     [snip]

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb 
b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
index 7047c434024..8a85933fe5b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
@@ -10,7 +10,8 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
  LICENSE = "GPLv2"
  LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
  SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
+DEPENDS = "util-linux attr e2fsprogs lzo acl"
+DEPENDS_append_class-target = " udev"
  RDEPENDS_${PN} = "libgcc"

  SRCREV = "144a19145e248513c7a676defad59836830535c6"

// Robert

>
> UDEVDIR=
> if pkg-config udev --atleast-version 190; then
>         UDEVDIR="$(pkg-config udev --variable=udevdir)"
> fi
> AC_SUBST(UDEVDIR)
>
> Ross

