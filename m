Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63B9460577
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 09:23:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s339NssN018875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Apr 2014 02:23:54 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Apr 2014 02:23:54 -0700
Message-ID: <533D28A8.1090107@windriver.com>
Date: Thu, 3 Apr 2014 17:23:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1396175372.git.liezhi.yang@windriver.com>
	<f54eb96dbc54cf4fce2cfee8e865a1e6cc41c905.1396175372.git.liezhi.yang@windriver.com>
	<CAJTo0LYNZB5MGTFctAHD6nA_m+yQeuTiYyztmeFLLF6NPBuQAw@mail.gmail.com>
In-Reply-To: <CAJTo0LYNZB5MGTFctAHD6nA_m+yQeuTiYyztmeFLLF6NPBuQAw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+3: set proper FLAGS for native
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
X-List-Received-Date: Thu, 03 Apr 2014 09:23:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/31/2014 10:07 PM, Burton, Ross wrote:
> On 30 March 2014 11:30, Robert Yang <liezhi.yang@windriver.com> wrote:
>> ++CFLAGS = @CFLAGS_FOR_BUILD@
>> ++CPPFLAGS = @CPPFLAGS_FOR_BUILD@
>> ++LDFLAGS = @LDFLAGS_FOR_BUILD@
>
> So the problem is that the environment is providing a CFLAGS variable
> that automake is then using for native builds alongside
> CFLAGS_FOR_BUILD.  Instead of replicating the variables, which this
> will do, would it be better to unset CFLAGS/CPPFLAGS/LDFLAGS in this
> makefile so the environment variables are not used? (as makefile
> assignments override environment assignments).
>

Sounds good, updated:

   git://git.openembedded.org/openembedded-core-contrib rbt/gtk
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gtk

diff --git a/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch 
b/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
new file mode 100644
index 0000000..9ae1088
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
@@ -0,0 +1,33 @@
+From 5e16904f94b5f5961f8f6e75716e6d7d228de119 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 28 Mar 2014 03:10:12 +0000
+Subject: [PATCH] gtk/native/Makefile.am: unset target FLAGS for native build
+
+The target gtk+3 does a native build in its "native" directory, we need
+unset the target FLAGS for native build, otherwise, there might be build
+failures.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ gtk/native/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gtk/native/Makefile.am b/gtk/native/Makefile.am
+index 64899e9..a1c814a 100644
+--- a/gtk/native/Makefile.am
++++ b/gtk/native/Makefile.am
+@@ -3,6 +3,9 @@ AM_CFLAGS = @CFLAGS_FOR_BUILD@
+ CPP = @CPP_FOR_BUILD@
+ AM_CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+ AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
++CFLAGS =
++CPPFLAGS =
++LDFLAGS =
+
+ if CROSS_COMPILING
+ if !USE_EXTERNAL_ICON_CACHE
+--
+1.8.3.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb 
b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
index 9f8c6ab..d0174f6 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
@@ -4,7 +4,9 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"

  SRC_URI = 
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
             file://hardcoded_libtool.patch \
-           file://fix-build-when-wayland-backend-enabled.patch"
+           file://fix-build-when-wayland-backend-enabled.patch \
+           file://fix-flags-for-native.patch \
+          "

  SRC_URI[md5sum] = "18a81944a8506231529a76bf2b68372b"
  SRC_URI[sha256sum] = 
"b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427"
-- 
1.8.3.1

// Robert

> Ross
>
>

