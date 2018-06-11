Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DF697753D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:30:36 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w5BDUaRw023818
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:30:37 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w5BDUafK011964;
	Mon, 11 Jun 2018 15:30:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D69E48ED3C5;
	Mon, 11 Jun 2018 15:30:32 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 15:30:03 +0200
Message-Id: <20180611133005.27521-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180608140403.27855-1-andrej.valek@siemens.com>
References: <20180608140403.27855-1-andrej.valek@siemens.com>
Subject: [PATCH v4 1/3] openssl-1.1: fix c_rehash perl errors
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
X-List-Received-Date: Mon, 11 Jun 2018 13:30:37 -0000

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
 ...le.pl-only-quote-stuff-that-actually-need.patch | 29 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch
new file mode 100644
index 0000000000..25d3093e40
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch
@@ -0,0 +1,29 @@
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Wed, 28 Mar 2018 14:05:53 +0200
+Subject: Revert "util/dofile.pl: only quote stuff that actually needs
+ quoting"
+
+This reverts commit 77ba00bc. We ended up without the quotes.
+
+BTS: #894282
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+---
+ util/dofile.pl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util/dofile.pl b/util/dofile.pl
+index fc72989b0fd9..a932941cd5ad 100644
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
index 94b75eb92a..eddf53c992 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch \
            "
 
 S = "${WORKDIR}/openssl-${PV}"
-- 
2.11.0


