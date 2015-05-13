Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 417D27404C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 01:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D1Vm6m003641
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 May 2015 18:31:48 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 18:31:47 -0700
Message-ID: <5552A982.3090100@windriver.com>
Date: Wed, 13 May 2015 09:31:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
	<CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>
	<55516887.5080908@windriver.com>
	<CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>
In-Reply-To: <CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Wed, 13 May 2015 01:31:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2015 10:21 PM, Burton, Ross wrote:
>
> On 12 May 2015 at 03:42, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Thanks, updated it in the repo:
>
>
> Please check with a clean sysroot:
>
> | checking for XWAYLANDMODULES... no
> | checking whether to build Xwayland DDX... yes
> | configure: error: Xwayland build explicitly requested, but required modules
> not found.

Sorry, libepoxy is also required:

configure:32059: checking for XWAYLANDMODULES
configure:32066: $PKG_CONFIG --exists --print-errors "wayland-client >= 1.3.0 
libdrm epoxy"
Package epoxy was not found in the pkg-config search path.
Perhaps you should add the directory containing `epoxy.pc'
to the PKG_CONFIG_PATH environment variable
No package 'epoxy' found


I've updated it in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/3fixes

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc 
b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 30299c2..3d16d3a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -115,7 +115,9 @@ EXTRA_OECONF += "--with-fop=no \
                   ac_cv_file__usr_share_sgml_X11_defs_ent=no \
  "

-PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri 
dri2 glx', '', d)}"
+PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri 
dri2 glx', '', d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", 
"xwayland", "", d)} \
+"

  PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
  PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa 
xf86driproto"
@@ -128,6 +130,7 @@ PACKAGECONFIG[xshmfence] = 
"--enable-xshmfence,--disable-xshmfence,libxshmfence"
  PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native 
docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
  PACKAGECONFIG[systemd-logind] = 
"--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
  PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland libepoxy"

  do_install_append () {
         # Its assumed base-files creates this for us

// Robert

>
> Ross

