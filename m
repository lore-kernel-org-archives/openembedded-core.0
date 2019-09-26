Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0DC7ED64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 06:55:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46f5KR4Rzmz3S;
	Thu, 26 Sep 2019 08:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569480925;
	bh=DkKOJx3BMKQjxs2nfIqTeyXK8gTk27mgeTKJcRzys1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/Uk+2sz1IkxfO6vZ399+U4yNBN3eYaYGROosEBL+gNRpLjIsgXexa5AYVHT832so
	3AxvMh/rjWrL0TIQEz+n4/wzs/Lg4aR+lAp8fyNDpzX7SuMsx5SWJZebZree4QD9yP
	vPEHD700r3WLZVS5pr9Kfs9F/LaVexLNddypDxnVSKgZhVxZahUZdkGPAEb26rP7C1
	zwcp/XFfRyNA2F7KeA7sdCcQ+8PQm2aIODOZTSlN4pkg4cQIA3c8YGJNC/X+23k8iA
	QLKeLQxOUKkqiN5396HqAQ4oZyqmi/UamMTHE5P43kgqVSEVjICkVwoVN9vvxrpy70
	nxnBFzvhUecrzjqnUnSj3uEboDnwydP9LvYVw51mzK74lLTrq0niP0pmxgzSL9EtTa
	tILZJ+SfsQn0oC9+0XAh5DhIhMo5rmpV+jc4pzVbGAz567EZZPYwpigQKAvoG3nYox
	1W4s2veoXzId64iTua6ILUftVilLjZkiwAoqXv3CuJjSQPJ1IoxETCkcselik/Mqxz
	im757wnF4mdwJTAuXgVBGS9FOH+V25OhmwA7sQjpV3iadGcxTNOB5OIS8YP0L7fZAP
	09ivq3FuiMLv4xoKqwrWq+rd8L4DVzpE1iUpWFK0Rv99T9m4UVipgXxfHwcZMnda/e
	Xj1UDpTzNtkj1SidScUPT8sg=
Date: Thu, 26 Sep 2019 09:55:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20190926065519.GA16297@localhost>
References: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
	<20190924101823.GC16793@localhost>
	<f0d73756-d4ad-e011-5dcd-8ac21f54a6f1@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f0d73756-d4ad-e011-5dcd-8ac21f54a6f1@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/3] Move rust from meta-rust to oe-core
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
X-List-Received-Date: Thu, 26 Sep 2019 06:55:26 -0000
X-Groupsio-MsgNum: 129520
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 25, 2019 at 01:52:08PM -0400, Randy MacLeod wrote:
> On 9/24/19 6:18 AM, Adrian Bunk wrote:
> > On Mon, Sep 23, 2019 at 10:45:05PM -0400, Randy MacLeod wrote:
>...
> > There are also related topics like how to provide security support
> > for vendored libraries - this is the main reason why vendored libraries
> > shipped by upstream are rarely used by distributions in the C ecosystem.
> 
> Yes, we need to have a plan for security and bug fixes.
> Of course Rust is largely impervious to such 20th century problems.
> (mostly joking!)

vendor/ in the librsvg 2.46.0 tarball are 145 crates (157 MB).
vendor/ in the rust 1.37.0 tarball are 350 crates (308 MB).

>...
> > > 5. make rust-hello-world install for qemuriscv64
> > >     https://github.com/meta-rust/meta-rust/issues/252
> > 
> > LLVM in meta-rust is too old for RISC-V.
> 
> Right.
> I'm away Thursday to Sunday but
> I'll work on a fix for that when I'm back.

It needs LLVM 9, plus RISC-V support that is not yet in upstream Rust.

Not sure whether the latter requires more than just a target definition,
but this will likely just work if you wait a few months.

>...
> > Using an own LLVM recipe might makes sense for an external layer, but in
> > oe-core the llvm recipe that is already there should be used instead of
> > another copy of LLVM.
> 
> I agree that the goal should be to have a single llvm package but
> it's an upstream Rust decision.

For upstream it is better to have an own copy of LLVM,
but for a distribution it can be beneficial to avoid having
mesa/rust/clang/... each shipping and building own copies
of LLVM.

> I did look at the differences between the 'forks' and they are significant.

In Debian Rust uses the same LLVM as everything else.

>...
> > 2.44 built for me a few months ago with meta-rust.
> 
> Can you share the recipe so I can use it and update it to 2.46?

Attached, the only other noteworthy change was that upstream
removed rsvg-view.

>...
> > > What have I missed?
> > > ...
> > 
> > 9. Ensure that there are no non-optional dependencies on the target
> >     librsvg since users will build for targets not supported by Rust.
> >     The one in webkitgtk seems to be optional or obsolete.
>...
> To deal with such targets, we'd keep the old version of librsvg
> around for a while longer. That could cascade into several
> packages with duplicate versions in oe-core so it may be best handled
> with a separate layer.

This sounds unsustainable, similar to meta-gplv2.

Right now the only dependencies on librsvg in oe-core are webkitgtk 
(unused, I'll submit a patch removing it after the Yocto 3.0 branching) 
and an optional dependency in gstreamer1.0-plugins-bad, so likely no 
problem at the moment.

But with software like bzip2 also moving to Rust this is something
that that might need continued attention.

There are people submitting patches for e.g. big endian arm to OE,
and there is value in ensuring that OE stays usable for such usecases.

> > 10. Review the whole contents of the layer.
> >      There are several things where I hope there are better solutions,
> >      and I expect that what will land in oe-core will look quite
> >      different from the current meta-rust.
> >      See item 5 above for an example.
> 
> Yes, if we require separate bitbake recipes for each package
> that would require significant changes to the current layer.

This is not about specific issues.

There are plenty of other cases like for example rust.inc being
the wrong place for OE target -> LLVM target mappings in oe-core, 
if they are needed at all.

> Thanks,
> 
> ../Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=patch-librsvg

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
deleted file mode 100644
index 954bb60880..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 2001
-From: Brion Vibber <brion@pobox.com>
-Date: Sun, 25 Feb 2018 18:42:36 -0800
-Subject: Auto-detect -Bsymbolic, fixes configure on macOS
-
-The -Bsymbolic linker option is ELF-specific, and was breaking
-configure on macOS unless --disable-Bsymbolic was explicitly passed.
-
-Switching the behavior from requiring -Bsymbolic to be available
-by default to just warning and continuing on without.
-
-Fixes https://gitlab.gnome.org/GNOME/librsvg/issues/211
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 15b26b2d..9f8dce29 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test "$enable_pixbuf_loader" = "yes"])
- AC_ARG_ENABLE([Bsymbolic],
-   [AS_HELP_STRING([--disable-Bsymbolic],
-                   [disable linking with -Bsymbolic])],
--  [],[enable_Bsymbolic=yes])
-+  [enable_Bsymbolic=no],[enable_Bsymbolic=auto])
- 
- BSYMBOLIC_LDFLAG=
- if test "$enable_Bsymbolic" != "no"; then
--- 
-2.20.1
-
diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
deleted file mode 100644
index 6c23071cd3..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4e0ce3f22d45033a108cbacca3e5ec6728bd44f3 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 11 Aug 2015 16:25:38 +0300
-Subject: [PATCH] configure: add option to enable/disable use of GTK+
-
-Distro packagers like predictability and automatically detected optional
-dependencies are not predicable.  Add a --with-gtk3 option (default to "auto")
-for forcibly controlling whether GTK+ will be used or not.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e61a952..c3aae84 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -130,17 +130,22 @@ AC_CHECK_FUNCS(strtok_r)
- # GTK
- # ===========================================================================
- 
--PKG_CHECK_MODULES([GTK3],[gtk+-3.0 >= $GTK3_REQUIRED],[have_gtk_3=yes],[have_gtk_3=no])
--
- GTK3_BINARY_VERSION=
- 
--if test "$have_gtk_3" = "yes"; then
--    GTK3_BINARY_VERSION="`$PKG_CONFIG --variable=gtk_binary_version gtk+-3.0`"
-+AC_MSG_CHECKING([whether to use GTK+ 3])
-+AC_ARG_WITH([gtk3],
-+  [AS_HELP_STRING([--without-gtk3],[Don't build GTK+3 tools (default=auto)])],
-+  [],[PKG_CHECK_EXISTS([gtk+-3.0 >= $GTK3_REQUIRED],[with_gtk3=yes],[with_gtk3=no])])
-+AC_MSG_RESULT([$with_gtk3])
-+
-+if test "$with_gtk3" = "yes"; then
-+  PKG_CHECK_MODULES(GTK3, [gtk+-3.0 >= $GTK3_REQUIRED])
-+  GTK3_BINARY_VERSION="`$PKG_CONFIG --variable=gtk_binary_version gtk+-3.0`"
- fi
- 
- AC_SUBST([GTK3_BINARY_VERSION])
- 
--AM_CONDITIONAL([HAVE_GTK_3],[test "$have_gtk_3" = "yes"])
-+AM_CONDITIONAL([HAVE_GTK_3],[test "$with_gtk3" = "yes"])
- 
- dnl ===========================================================================
- dnl GDK-Pixbuf SVG loader
-@@ -298,6 +303,6 @@ librsvg-$VERSION
- 	Build introspectable bindings:  ${found_introspection}
- 	Build Vala bindings:            ${enable_vala}
- 	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
--        GTK+ $GTK3_REQUIRED or later:           ${have_gtk_3}
-+        GTK+ $GTK3_REQUIRED or later:           ${with_gtk_3}
- 	Build miscellaneous tools:      ${build_misc_tools}
- "
--- 
-2.1.4
-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.44.14.bb
similarity index 67%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.44.14.bb
index 6a798e6a91..07cc1bb955 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.44.14.bb
@@ -2,32 +2,26 @@ SUMMARY = "Library for rendering SVG files"
 HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-RECIPE_NO_UPDATE_REASON = "Versions from 2.41.0 requires Rust compiler to build it"
-
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
+                    file://librsvg/rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
 
 SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND = "native"
 
-inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection
+inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection cargo
 
-SRC_URI += "file://gtk-option.patch \
-            file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch \
-"
+SRC_URI[archive.md5sum] = "7570d139148f3554fa60fb2a0ecfc4f8"
+SRC_URI[archive.sha256sum] = "6a85a7868639cdd4aa064245cc8e9d864dad8b8e9a4a8031bb09a4796bc4e303"
 
-SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
-SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
-# GTK+ test application (rsvg-view)
-PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
 
 do_install_append() {
 	# Loadable modules don't need .a or .la on Linux
-- 
2.17.1


--G4iJoqBmSsgzjUCe--
