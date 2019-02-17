Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7DF7C77E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 10:18:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c8so15016824wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=oMMsYT4O5h/HomRy/LmR79RHchcwtQQjhC0ci/F/1TI=;
	b=g5b/JCkAP61OjO6QrrV1GFaFAtkUOcpyCVznj/kzCjW2DWsPHviyR4LTl1TDwagemL
	zT+EWgKCR0RmEYqXXtfDxrJlfzF2cT5obLEroM8kX1GDGZ7S5JrD7GPRvOIoqgn9Fc1Y
	jDo88EkBqNl8kJE5QkmliQysuYd2AHQSXTpH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oMMsYT4O5h/HomRy/LmR79RHchcwtQQjhC0ci/F/1TI=;
	b=VYeg1QDmasZQcAe4z0YgaoM0tx3S0Giw9LAyzWfnEpFUaoRXkZOa5f4pWM3n2uRwuw
	1gAKP0MnwVEI9gGHNlx5fIfdQyVdUhHaD2BZn0vTGY1b/SNgcJDTXuZnfhBtoEDcUiGr
	wLSPwflXHIM0feXV1WkkPQ8V58ApliOQmZ5ZjlFWaOt9dx9Aqds/1GTkSwh2RLM2mt34
	puxfFPeE3yNsnuACUpHTNFenNn4OkujXdc/oyIRghtT2Pw6OwntPqpvnD/VZ5ZVz+RXf
	HvLfYRSS642taT1SXIPB6rdw1XSTmm/mcggV4IAO8Dt74+SzfDJOhJeZhiXFVcWFYa+J
	YZbQ==
X-Gm-Message-State: AHQUAuasm6Se7gRaCZGysO3AOq0bTfBQV7MTI/teJIWTPRvrX8E3tO3U
	tSC7AwAcW/d378myde5e6z/jXQOaENs=
X-Google-Smtp-Source: AHgI3IZT4UxaaM2SbRU3q5ubipS5uI+4x7DfRyARvj2Ebq8yTrqLDmWLP+4PFFtcUVV8uWmHq8UUjA==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr12987347wro.249.1550398692471;
	Sun, 17 Feb 2019 02:18:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n3sm12024491wrs.10.2019.02.17.02.18.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 02:18:11 -0800 (PST)
Message-ID: <d525b0bc8235c7b3d9248be82e74a180805f0a5e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 10:18:10 +0000
In-Reply-To: <20190216214638.11456-6-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
	<20190216214638.11456-6-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 6/7] native: Enable RDEPENDS handling
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
X-List-Received-Date: Sun, 17 Feb 2019 10:18:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 21:46 +0000, Richard Purdie wrote:
> Native recipes don't currently honour their RDEPENDS. In the case of
> some python scripts this has started causing problems since whilst they're
> not needed at build time (DEPENDS), they are needed at runtime.
> 
> We put off making this change due to circular dependency issues. I believe
> the two such problems in OE-Core are now fixed, as is the dependency loop
> identfication code in bitbake so its time to improve this situation.
> 
> [YOCTO #10113]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/native.bbclass | 3 +++
>  1 file changed, 3 insertions(+)

Just for interest, the diff for core-image-sato before/after this patch
is included below. Ideally we'd bubble the dependency to
do_prepare_recipe_sysroot rather than do_populate_sysroot but that
isn't the way the system works. In reality this shouldn't make a huge
difference to build performance other than changing task order a
little.

Cheers,

Richard

--- task-depends.dot	2019-02-17 10:11:12.216746214 +0000
+++ task-depends1.dot	2019-02-17 10:10:20.682055039 +0000
@@ -3055,6 +3055,8 @@
 "autoconf-native.do_populate_lic" -> "autoconf-native.do_patch"
 "autoconf-native.do_populate_sysroot" [label="autoconf-native do_populate_sysroot\n:2.69-r11\nvirtual:native:/media/build1/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb"]
 "autoconf-native.do_populate_sysroot" -> "autoconf-native.do_install"
+"autoconf-native.do_populate_sysroot" -> "gnu-config-native.do_populate_sysroot"
+"autoconf-native.do_populate_sysroot" -> "m4-native.do_populate_sysroot"
 "autoconf-native.do_prepare_recipe_sysroot" [label="autoconf-native do_prepare_recipe_sysroot\n:2.69-r11\nvirtual:native:/media/build1/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb"]
 "autoconf-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_fetch"
 "autoconf-native.do_prepare_recipe_sysroot" -> "gnu-config-native.do_populate_sysroot"
@@ -3079,6 +3081,7 @@
 "automake-native.do_populate_lic" [label="automake-native do_populate_lic\n:1.16.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/automake/automake_1.16.1.bb"]
 "automake-native.do_populate_lic" -> "automake-native.do_patch"
 "automake-native.do_populate_sysroot" [label="automake-native do_populate_sysroot\n:1.16.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/automake/automake_1.16.1.bb"]
+"automake-native.do_populate_sysroot" -> "autoconf-native.do_populate_sysroot"
 "automake-native.do_populate_sysroot" -> "automake-native.do_install"
 "automake-native.do_prepare_recipe_sysroot" [label="automake-native do_prepare_recipe_sysroot\n:1.16.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/automake/automake_1.16.1.bb"]
 "automake-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
@@ -15498,6 +15501,7 @@
 "flex-native.do_populate_lic" -> "flex-native.do_patch"
 "flex-native.do_populate_sysroot" [label="flex-native do_populate_sysroot\n:2.6.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/flex/flex_2.6.0.bb"]
 "flex-native.do_populate_sysroot" -> "flex-native.do_install"
+"flex-native.do_populate_sysroot" -> "m4-native.do_populate_sysroot"
 "flex-native.do_prepare_recipe_sysroot" [label="flex-native do_prepare_recipe_sysroot\n:2.6.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/flex/flex_2.6.0.bb"]
 "flex-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
 "flex-native.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
@@ -17567,6 +17571,7 @@
 "gdk-pixbuf-native.do_populate_lic" -> "gdk-pixbuf-native.do_patch"
 "gdk-pixbuf-native.do_populate_sysroot" [label="gdk-pixbuf-native do_populate_sysroot\n:2.36.11-r0\nvirtual:native:/media/build1/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb"]
 "gdk-pixbuf-native.do_populate_sysroot" -> "gdk-pixbuf-native.do_install"
+"gdk-pixbuf-native.do_populate_sysroot" -> "shared-mime-info-native.do_populate_sysroot"
 "gdk-pixbuf-native.do_prepare_recipe_sysroot" [label="gdk-pixbuf-native do_prepare_recipe_sysroot\n:2.36.11-r0\nvirtual:native:/media/build1/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb"]
 "gdk-pixbuf-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
 "gdk-pixbuf-native.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
@@ -19362,6 +19367,7 @@
 "gobject-introspection-native.do_populate_lic" -> "gobject-introspection-native.do_patch"
 "gobject-introspection-native.do_populate_sysroot" [label="gobject-introspection-native do_populate_sysroot\n:1.58.3-r0\nvirtual:native:/media/build1/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb"]
 "gobject-introspection-native.do_populate_sysroot" -> "gobject-introspection-native.do_install"
+"gobject-introspection-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
 "gobject-introspection-native.do_prepare_recipe_sysroot" [label="gobject-introspection-native do_prepare_recipe_sysroot\n:1.58.3-r0\nvirtual:native:/media/build1/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb"]
 "gobject-introspection-native.do_prepare_recipe_sysroot" -> "autoconf-archive-native.do_populate_sysroot"
 "gobject-introspection-native.do_prepare_recipe_sysroot" -> "bison-native.do_populate_sysroot"
@@ -20028,6 +20034,7 @@
 "groff-native.do_populate_lic" -> "groff-native.do_patch"
 "groff-native.do_populate_sysroot" [label="groff-native do_populate_sysroot\n:1.22.3-r0\nvirtual:native:/media/build1/poky/meta/recipes-extended/groff/groff_1.22.3.bb"]
 "groff-native.do_populate_sysroot" -> "groff-native.do_install"
+"groff-native.do_populate_sysroot" -> "perl-native.do_populate_sysroot"
 "groff-native.do_prepare_recipe_sysroot" [label="groff-native do_prepare_recipe_sysroot\n:1.22.3-r0\nvirtual:native:/media/build1/poky/meta/recipes-extended/groff/groff_1.22.3.bb"]
 "groff-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
 "groff-native.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
@@ -23986,6 +23993,7 @@
 "intltool-native.do_populate_lic" -> "intltool-native.do_patch"
 "intltool-native.do_populate_sysroot" [label="intltool-native do_populate_sysroot\n:0.51.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/intltool/intltool_0.51.0.bb"]
 "intltool-native.do_populate_sysroot" -> "intltool-native.do_install"
+"intltool-native.do_populate_sysroot" -> "libxml-parser-perl-native.do_populate_sysroot"
 "intltool-native.do_prepare_recipe_sysroot" [label="intltool-native do_prepare_recipe_sysroot\n:0.51.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/intltool/intltool_0.51.0.bb"]
 "intltool-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
 "intltool-native.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
@@ -44211,6 +44219,8 @@
 "meson-native.do_populate_lic" -> "meson-native.do_patch"
 "meson-native.do_populate_sysroot" [label="meson-native do_populate_sysroot\n:0.49.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/meson/meson_0.49.0.bb"]
 "meson-native.do_populate_sysroot" -> "meson-native.do_install"
+"meson-native.do_populate_sysroot" -> "ninja-native.do_populate_sysroot"
+"meson-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
 "meson-native.do_prepare_recipe_sysroot" [label="meson-native do_prepare_recipe_sysroot\n:0.49.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/meson/meson_0.49.0.bb"]
 "meson-native.do_prepare_recipe_sysroot" -> "meson-native.do_fetch"
 "meson-native.do_prepare_recipe_sysroot" -> "python3-native.do_populate_sysroot"
@@ -44527,6 +44537,7 @@
 "mkfontdir-native.do_populate_lic" -> "mkfontdir-native.do_patch"
 "mkfontdir-native.do_populate_sysroot" [label="mkfontdir-native do_populate_sysroot\n1:1.0.7-r8.0\nvirtual:native:/media/build1/poky/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb"]
 "mkfontdir-native.do_populate_sysroot" -> "mkfontdir-native.do_install"
+"mkfontdir-native.do_populate_sysroot" -> "mkfontscale-native.do_populate_sysroot"
 "mkfontdir-native.do_prepare_recipe_sysroot" [label="mkfontdir-native do_prepare_recipe_sysroot\n1:1.0.7-r8.0\nvirtual:native:/media/build1/poky/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb"]
 "mkfontdir-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
 "mkfontdir-native.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
@@ -58742,6 +58753,7 @@
 "python3-setuptools-native.do_populate_lic" [label="python3-setuptools-native do_populate_lic\n:40.0.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb"]
 "python3-setuptools-native.do_populate_lic" -> "python3-setuptools-native.do_patch"
 "python3-setuptools-native.do_populate_sysroot" [label="python3-setuptools-native do_populate_sysroot\n:40.0.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb"]
+"python3-setuptools-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
 "python3-setuptools-native.do_populate_sysroot" -> "python3-setuptools-native.do_install"
 "python3-setuptools-native.do_prepare_recipe_sysroot" [label="python3-setuptools-native do_prepare_recipe_sysroot\n:40.0.0-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb"]
 "python3-setuptools-native.do_prepare_recipe_sysroot" -> "python3-native.do_populate_sysroot"
@@ -59411,6 +59423,7 @@
 "qemu-helper-native.do_populate_lic" -> "qemu-helper-native.do_patch"
 "qemu-helper-native.do_populate_sysroot" [label="qemu-helper-native do_populate_sysroot\n:1.0-r1\n/media/build1/poky/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb"]
 "qemu-helper-native.do_populate_sysroot" -> "qemu-helper-native.do_install"
+"qemu-helper-native.do_populate_sysroot" -> "qemu-native.do_populate_sysroot"
 "qemu-helper-native.do_prepare_recipe_sysroot" [label="qemu-helper-native do_prepare_recipe_sysroot\n:1.0-r1\n/media/build1/poky/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb"]
 "qemu-helper-native.do_prepare_recipe_sysroot" -> "qemu-helper-native.do_fetch"
 "qemu-helper-native.do_prepare_recipe_sysroot" -> "qemu-native.do_populate_sysroot"
@@ -60626,6 +60639,8 @@
 "rpm-native.do_populate_lic" [label="rpm-native do_populate_lic\n1:4.14.2.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb"]
 "rpm-native.do_populate_lic" -> "rpm-native.do_patch"
 "rpm-native.do_populate_sysroot" [label="rpm-native do_populate_sysroot\n1:4.14.2.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb"]
+"rpm-native.do_populate_sysroot" -> "perl-native.do_populate_sysroot"
+"rpm-native.do_populate_sysroot" -> "python3-native.do_populate_sysroot"
 "rpm-native.do_populate_sysroot" -> "rpm-native.do_install"
 "rpm-native.do_prepare_recipe_sysroot" [label="rpm-native do_prepare_recipe_sysroot\n1:4.14.2.1-r0\nvirtual:native:/media/build1/poky/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb"]
 "rpm-native.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"


