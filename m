Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C231AD5E366
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22781.1765892170928255413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CC371516
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CE743F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] ruby: upgrade 3.4.5 -> 3.4.7
Date: Tue, 16 Dec 2025 13:35:57 +0000
Message-ID: <20251216133603.1003572-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227950

Upstream changes:

- Merge URI-1.0.4 for Ruby 3.4 by hsbt
- Bug #21313: it in rescue/ensure on prism
- [3.4] compile.c: Handle anonymous variables in outer_variable_cmp by by=
root
- Bug #21610: Use ec->interrupt_mask to prevent interrupts.
- Bug #21611: Ruby 3.4.6 can't be built with GCC 15.2.1
- Bug #21342: Segfault: invalid keeping_mutexes when using Mutex in Threa=
d then Fiber after GC
- Bug #21569: [armv7, musl] SIGBUS in ibf_load_object_float due to unalig=
ned VFP double load when reading IBF
- Bug #21568: Requiring core libraries when already requiring multiple us=
er defined libraries with the same name can error
- Bug #21514: Rust deprecation warning building ruby-3.4.5/yjit/src/codeg=
en.rs
- Bug #21259: The Prism compiler wrongly creates a line number of zero
- Bug #21188: PRISM does not end reading from tty with ^D twice
- Bug #21546: prefix in ruby.pc is wrong when --enable-load-relative
- Bug #21402: ruby2_keywords affects methods/procs with post arguments
- Bug #19417: Regexp \p{Word} and [[:word:]] do not match Unicode Other_N=
umber character
- Bug #21535: NoMethodError becomes NameErrorwhen using ... delegation an=
d method call indirection
- YJIT: Add more information to an assert message by k0kubun
- Bug #21567: Crash when $LOADED_FEATURES is modified during require
- Bug #21561: Wrong encoding for File.dirname result on Windows
- Bump Prism version to 1.5.1 by k0kubun

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...001-extmk-fix-cross-compilation-of-external-gems.patch | 4 ++--
 ...m_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch  | 4 ++--
 .../ruby/0003-rdoc-build-reproducible-documentation.patch | 8 ++++----
 ...mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 4 ++--
 ...rk-Gemspec-reproducible-change-fixing-784225-too.patch | 2 +-
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch       | 4 ++--
 ...07-Skip-test_rm_r_no_permissions-test-under-root.patch | 5 +----
 .../ruby/{ruby_3.4.5.bb =3D> ruby_3.4.7.bb}                 | 2 +-
 9 files changed, 17 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.5.bb =3D> ruby_3.4.7.bb} (98=
%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compila=
tion-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-=
fix-cross-compilation-of-external-gems.patch
index f17970e9c9b..dc33fa9d802 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of=
-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of=
-external-gems.patch
@@ -1,4 +1,4 @@
-From 03700ec256789e02de20b58bca080c6fef592336 Mon Sep 17 00:00:00 2001
+From 2d19806e1d221df9400b25bd67f3e0b7a21bb702 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
@@ -16,7 +16,7 @@ Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 8b6b365..3048f75 100755
+index 1d16545..ad971ea 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
 @@ -434,8 +434,8 @@ else
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1=
-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-v=
m_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 799324caeaa..4f81d0a19d3 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-RE=
G_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-RE=
G_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f992d781e05b61489bdf5a2a9aee6cc616f1742a Mon Sep 17 00:00:00 2001
+From a5c27826e7561eafcb8dab061e07349232457f10 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
=20
 diff --git a/vm_dump.c b/vm_dump.c
-index 5873e52..9eb4db1 100644
+index 99339fd..8c5bb03 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-li=
nk-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-f=
or-the-link-of-libruby.patch
index 84fe9aee3d6..8ef0c903e8b 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-l=
ibruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-l=
ibruby.patch
@@ -1,4 +1,4 @@
-From 2625f6c155105d352d6a1ff3a722e7896431ff91 Mon Sep 17 00:00:00 2001
+From 3949b3ff01c642b6b9ada9b12dd3083cc930544a Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,7 +10,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 8f996b8..c708b64 100644
+index 6b97279..a49b53d 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
 @@ -120,7 +120,7 @@ ENABLE_SHARED =3D @ENABLE_SHARED@
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible=
-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-re=
producible-documentation.patch
index 87a1e82516e..90b2aee7ea9 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
@@ -1,4 +1,4 @@
-From 98071c0b28a45cd21a2cbe6746ce39067932b62f Mon Sep 17 00:00:00 2001
+From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -14,10 +14,10 @@ Signed-off-by: Christian Hofstaedtler <zeha@debian.or=
g>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_=
index.rb
-index c454910..24feab0 100644
+index 065caa4..cfa1f33 100644
 --- a/lib/rdoc/generator/json_index.rb
 +++ b/lib/rdoc/generator/json_index.rb
-@@ -178,7 +178,7 @@ class RDoc::Generator::JsonIndex
+@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
 =20
      Zlib::GzipWriter.open(outfile) do |gz|
@@ -26,7 +26,7 @@ index c454910..24feab0 100644
        gz.orig_name =3D search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -196,7 +196,7 @@ class RDoc::Generator::JsonIndex
+@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
          debug_msg "Writing gzipped file to %s" % outfile
 =20
          Zlib::GzipWriter.open(outfile) do |gz|
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-o=
f-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/000=
4-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 4b6771fd268..5ca182313b5 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-objec=
t-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-objec=
t-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 0887facc4ca5bcb0280b025b35bbc18528e52914 Mon Sep 17 00:00:00 2001
+From 932489b67ce9cdf5590a17927ea40d9ea6623668 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Mak=
efile
@@ -17,7 +17,7 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/lib/mkmf.rb b/lib/mkmf.rb
-index 768a152..f16cdd8 100644
+index 99f3764..62377b6 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
 @@ -2480,7 +2480,7 @@ LOCAL_LIBS =3D #{$LOCAL_LIBS}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducib=
le-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-=
Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 190eb7d7288..fd7d3340f3c 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 97051be9cb9317d2c4d61a82d6d953809e962f13 Mon Sep 17 00:00:00 2001
+From 410331577481f331074405e9629ca8db5303aaa8 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproduci=
ble.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducib=
le.patch
index 121bdcf3abf..e2c80e2f6f2 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
@@ -1,4 +1,4 @@
-From d58bdaca3d5379afcb954bb57c690c7736807ec5 Mon Sep 17 00:00:00 2001
+From 2f3d8359ffd1ab07d578c1e991180bc31dc7d143 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -64,7 +64,7 @@ index 5719f83..fe76260 100644
    spec.email         =3D ["knu@idaemons.org", "ume@mahoroba.org"]
 =20
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 3144df5..65c313f 100644
+index 47f4802..cf0b5f7 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permi=
ssions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-=
test_rm_r_no_permissions-test-under-root.patch
index e3574f1a810..780b59092f2 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-=
test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-=
test-under-root.patch
@@ -1,4 +1,4 @@
-From 9c4748aae4f69390a36875aa27d70c3c632ae944 Mon Sep 17 00:00:00 2001
+From eb5a5db74d29fd6369e9871ba1bb254aa0f22f42 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
@@ -27,6 +27,3 @@ index d2096a0..80e3368 100644
 =20
      mkdir 'tmpdatadir'
      touch 'tmpdatadir/tmpdata'
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.5.bb b/meta/recipes-devt=
ools/ruby/ruby_3.4.7.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.7.bb
index b77d76578e1..2fbcfd1f1b5 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
=20
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-SRC_URI[sha256sum] =3D "1d88d8a27b442fdde4aa06dc99e86b0bbf0b288963d84331=
12dd5fac798fd5ee"
+SRC_URI[sha256sum] =3D "23815a6d095696f7919090fdc3e2f9459b2c83d57224b2e4=
46ce1f5f7333ef36"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
--=20
2.43.0


