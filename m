Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F35C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18506.1721395529692784072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B90AD1042
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00B583F762
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] ruby: upgrade 3.3.0 -> 3.3.4
Date: Fri, 19 Jul 2024 14:25:20 +0100
Message-Id: <20240719132523.976790-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719132523.976790-1-ross.burton@arm.com>
References: <20240719132523.976790-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202261

3.3.4:

This release fixes a regression in Ruby 3.3.3 that dependencies are missi=
ng in
the gemspec of some bundled gems: net-pop, net-ftp, net-imap, and prime [=
Bug
like Heroku. If your bundle install runs correctly now, you may not have =
this
issue.

3.3.3:

This release includes:

RubyGems 3.5.11
Bundler 2.5.11
REXML 3.2.8
strscan 3.0.9
--dump=3Dprism_parsetree is replaced by --parser=3Dprism --dump=3Dparsetr=
ee
Invalid encoding symbols raise SyntaxError instead of EncodingError
Memory leak fix in Ripper parsing
Bugfixes for YJIT, **{}, Ripper.tokenize, RubyVM::InstructionSequence#to_=
binary,
--with-gmp, and some build environments

3.3.2:

This release includes many bug-fixes. See the GitHub releases for further=
 details.

3.3.1:

This release includes security fixes. Please check the topics below for d=
etails.

CVE-2024-27282: Arbitrary memory address read vulnerability with Regex se=
arch
CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc
CVE-2024-27280: Buffer overread vulnerability in StringIO

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-extmk-fix-cross-compilation-of-external-gems.patch | 6 +++---
 ..._dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch | 2 +-
 .../0003-rdoc-build-reproducible-documentation.patch     | 2 +-
 ...kmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...k-Gemspec-reproducible-change-fixing-784225-too.patch | 9 +++------
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch      | 2 +-
 .../ruby/{ruby_3.3.0.bb =3D> ruby_3.3.4.bb}                | 2 +-
 8 files changed, 12 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.0.bb =3D> ruby_3.3.4.bb} (98=
%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compila=
tion-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-=
fix-cross-compilation-of-external-gems.patch
index 7402e763331..bd8f736247e 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of=
-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of=
-external-gems.patch
@@ -1,4 +1,4 @@
-From caa03f46a3204a7e0f0e5d9d9cc9113304dc0382 Mon Sep 17 00:00:00 2001
+From b74950d4f06bbfb91b2e68044147a226c15f4639 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
@@ -16,10 +16,10 @@ Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.=
com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 428ffc9..87eff71 100755
+index d9c2417..da14c49 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -420,8 +420,8 @@ else
+@@ -428,8 +428,8 @@ else
  end
  $ruby =3D [$ruby]
  $ruby << "-I'$(topdir)'"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1=
-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-v=
m_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 67054d65533..bc1744da82d 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-RE=
G_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-RE=
G_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 980dcc5380db6f03451357140ae1487117300156 Mon Sep 17 00:00:00 2001
+From f4edf72c76bc06fa92c61f6cb9163cc777912a1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-li=
nk-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-f=
or-the-link-of-libruby.patch
index f3a65e785d6..6f95685917b 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-l=
ibruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-l=
ibruby.patch
@@ -1,4 +1,4 @@
-From 7f7facb85bd65adec24230fe8ca7f6a9863a1fd0 Mon Sep 17 00:00:00 2001
+From e6267676addd27f3c02667116185211d711ef940 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible=
-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-re=
producible-documentation.patch
index e2d5b57c25c..abbbd35702d 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
@@ -1,4 +1,4 @@
-From 5079e678ce2a81416088c04f9123cd8207d5def2 Mon Sep 17 00:00:00 2001
+From 09a6df0d32e2177406ed391e536c0c7c4b503c5d Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-o=
f-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/000=
4-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index b14a731cfb6..f08aaf555f3 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-objec=
t-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-objec=
t-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 99734381652602f76075017576a819c427ebb5f2 Mon Sep 17 00:00:00 2001
+From f491fff7d006954c1c51eb7a513a85bdbab0fe5a Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Mak=
efile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducib=
le-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-=
Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 24268625a28..5570cdfcaaf 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 3bc324379aa3e322bad9353da8c0064cd671cc74 Mon Sep 17 00:00:00 2001
+From 91304f26dd4153ecae752ea875eec9ce2d5d3963 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.=
rb
-index a0c7faa..f0722d9 100644
+index 05ce483..5f2dbd1 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1774,7 +1774,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1698,7 +1698,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.ins=
pect}")
                end
@@ -26,6 +26,3 @@ index a0c7faa..f0722d9 100644
                Time.utc(date.year, date.month, date.day)
              else
                TODAY
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproduci=
ble.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducib=
le.patch
index 21604dfc349..8a1daba7bdb 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
@@ -1,4 +1,4 @@
-From 1dc7ef09c3c567c4adb09ccfd97e0e59c58edb9f Mon Sep 17 00:00:00 2001
+From 42f8019e62f392f5bc09c25e90cc63123eb764fe Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.0.bb b/meta/recipes-devt=
ools/ruby/ruby_3.3.4.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.4.bb
index 657fc31b4df..ebff4136c9c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
=20
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-SRC_URI[sha256sum] =3D "96518814d9832bece92a85415a819d4893b307db5921ae1f=
0f751a9a89a56b7d"
+SRC_URI[sha256sum] =3D "fe6a30f97d54e029768f2ddf4923699c416cdbc3a6e96db3=
e2d5716c7db96a34"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
--=20
2.34.1


