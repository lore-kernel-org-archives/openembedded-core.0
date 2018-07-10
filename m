Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id EAFF4605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:47:35 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w6A7lZtg012451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:47:35 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w6A7lZI2019290;
	Tue, 10 Jul 2018 09:47:35 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7DE9862539B;
	Tue, 10 Jul 2018 09:47:35 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:46:52 +0200
Message-Id: <20180710074654.16213-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180710074654.16213-1-andrej.valek@siemens.com>
References: <20180710074654.16213-1-andrej.valek@siemens.com>
In-Reply-To: <20180709125657.13192-1-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
Subject: [PATCH v5 1/3] openssl-1.1: fix c_rehash perl errors
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
X-List-Received-Date: Tue, 10 Jul 2018 07:47:36 -0000

Patch original c_rehash script with Debian patch instead
of overriding it with own version.

Error output from c_reshah without patching:
  Unknown regexp modifier "/b" at ./c_rehash line 15, at end of line
  Unknown regexp modifier "/W" at ./c_rehash line 28, at end of line
  Unknown regexp modifier "/3" at ./c_rehash line 28, at end of line
  Unknown regexp modifier "/2" at ./c_rehash line 28, at end of line
  No such class installdir at ./c_rehash line 63, near "Prefix our
  installdir"
    (Might be a runaway multi-line // string starting on line 28)
  syntax error at ./c_rehash line 63, near "Prefix our installdir"
  Can't redeclare "my" in "my" at ./c_rehash line 68, near ""
  Execution of ./c_rehash aborted due to compilation errors.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 ...-dofile.pl-only-quote-stuff-that-actually.patch | 29 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch b/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
new file mode 100644
index 0000000000..81a9b2d060
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
@@ -0,0 +1,29 @@
+openssl-1.1.0h: Fix c_rehash perl errors
+
+[No upstream tracking] -- https://github.com/openssl/openssl/issues/5772
+
+dofile.pl: Revert only quote stuff that actually needs quoting
+
+This wasn't a good solution, too many things depend on the quotes being
+there consistently.
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/00701e5ea84861b74d9d624f21a6b3fcb12e8acd]
+bug: 5772
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/util/dofile.pl b/util/dofile.pl
+index 955224df7d..b0e20681dd 100644
+--- a/util/dofile.pl
++++ b/util/dofile.pl
+@@ -99,9 +99,9 @@ package main;
+ # This adds quotes (") around the given string, and escapes any $, @, \,
+ # " and ' by prepending a \ to them.
+ sub quotify1 {
+-    my $s = my $orig = shift @_;
++    my $s = shift @_;
+     $s =~ s/([\$\@\\"'])/\\$1/g;
+-    $s ne $orig || $s =~ /\s/ ? '"'.$s.'"' : $s;
++    '"'.$s.'"';
+ }
+ 
+ # quotify_l LIST
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 64b8a997d0..3e068669b7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.11.0


