Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F40F7226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 07:02:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4E72Vdn021680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 May 2015 00:02:32 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 00:02:31 -0700
Message-ID: <55544886.4040206@windriver.com>
Date: Thu, 14 May 2015 15:02:30 +0800
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
	<5552A982.3090100@windriver.com>
	<CAJTo0LZTnpZ6jkWO1aQFSVK54g=0wOaSLUFUVkwcu2iqbjXTFw@mail.gmail.com>
In-Reply-To: <CAJTo0LZTnpZ6jkWO1aQFSVK54g=0wOaSLUFUVkwcu2iqbjXTFw@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 May 2015 07:02:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/14/2015 07:38 AM, Burton, Ross wrote:
>
> On 13 May 2015 at 02:31, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I've updated it in the repo:
>
>        git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> rbt/3fixes
>
>
> Actually looked at the build output this time...  we should have each xserver in
> a separate package really, so can the xwayland binary go into an xwayland
> package?  We don't really want to force the xwayland binary (and extra
> dependencies) on everyone's X11-based images just because wayland is a default
> distro feature.

Sounds good, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/3fixes



commit 913aba210698327a099fd2c43af63fba3545d868
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Mon May 11 00:12:01 2015 -0700

     xserver-xorg: add PACKAGECONFIG for wayland and add xserver-xorg-xwayland

     Fixed do_compile error:
     hw/xwayland/xwayland.h:36:28: fatal error: wayland-client.h: No such file 
or directory
      #include <wayland-client.h>
                                 ^
     compilation terminated.

     Conditionally add xserver-xorg-xwayland pkg which contains
     /usr/bin/Xwayland.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc 
b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 30299c2..ee5041f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -62,7 +62,9 @@ PACKAGES =+ "${PN}-security-policy \
               ${PN}-module-exa \
               ${PN}-module-xaa \
               ${PN}-module-libxf1bpp \
-             ${PN}-module-libxf4bpp"
+             ${PN}-module-libxf4bpp \
+             ${@bb.utils.contains("DISTRO_FEATURES", "wayland", 
"${PN}-xwayland", "", d)} \
+"

  RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb 
xserver-xf86-config xkbcomp"
  RDEPENDS_${PN}-xvfb += "xkeyboard-config"
@@ -97,6 +99,7 @@ FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
  FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
  FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
  FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
+FILES_${PN}-xwayland = "${bindir}/Xwayland"

  EXTRA_OECONF += "--with-fop=no \
                   --with-pic \
@@ -115,7 +118,9 @@ EXTRA_OECONF += "--with-fop=no \
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
@@ -128,6 +133,7 @@ PACKAGECONFIG[xshmfence] = 
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

