Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC325782AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 22:34:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8LMYbp1017137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 21 Sep 2017 23:34:38 +0100
Message-ID: <1506033277.18640.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 23:34:37 +0100
In-Reply-To: <20170921140819.21292-1-otavio@ossystems.com.br>
References: <20170921140819.21292-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] mesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Thu, 21 Sep 2017 22:34:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-21 at 11:08 -0300, Otavio Salvador wrote:
> Upgrade to a new stable release and drop patches applied on upstream.
> 
> For a full release notes, please see:
> https://mesa3d.org/relnotes/17.2.0.html
> https://mesa3d.org/relnotes/17.2.1.html
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v2:
>  - update to 17.2.1

The trouble is this isn't just a "stable release", I didn't check the
patch fully enough initially but now I see this was a 17.1.X -> 17.2.X
change.

When I tried building it locally I get:

| checking for x11 xext xdamage >= 1.1 xfixes x11-xcb xcb xcb-glx >= 1.8.1 xcb-dri2 >= 1.8 xxf86vm... yes
| checking for wayland-scanner... /media/build1/poky/build/tmp/work/core2-64-poky-linux/mesa/2_17.2.1-r0/recipe-sysroot-native/usr/bin/wayland-scanner
| checking for wayland-client >= 1.11 wayland-server >= 1.11... yes
| configure: error: wayland-protocols >= 1.8 is needed to compile the wayland platform
| NOTE: The following config.log files may provide further information.

and basically I just wiped out a round of autobuilder testing of a
larger patchset due to this.

If people want us to be more flexible about taking "point version"
changes later into the release cycle, we really need to start getting
better about how these things get tested and how we refer to them in
the commit messages.

[and yes, the fix is trivial and included below, that isn't really the
point though]

Cheers,

Richard

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4f31ed255c3..cab8e4bfe73 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -45,7 +45,7 @@ X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage li
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 

