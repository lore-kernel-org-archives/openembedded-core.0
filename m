Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id B20837A06C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:39 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 26BB6FF807;
	Sat,  3 Nov 2018 16:45:38 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:27 -0700
Message-Id: <20181103164427.16125-26-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 25/25] openssl: update 1.1.0h -> 1.1.0i
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:40 -0000

From: Andrej Valek <andrej.valek@siemens.com>

Please see this security advisory:
https://www.openssl.org/news/secadv/20180612.txt

Remove obsolete patch.

(From OE-Core rev: 0d19caefeeca14f44c80ccb716c30b17f14255a5)

(From OE-Core rev: 784059db22d763ca9f579a10a34fd90c68542e82)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...le.pl-only-quote-stuff-that-actually.patch | 29 -------------------
 .../{openssl_1.1.0h.bb => openssl_1.1.0i.bb}  |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0h.bb => openssl_1.1.0i.bb} (95%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch b/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
deleted file mode 100644
index 81a9b2d060..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-openssl-1.1.0h: Fix c_rehash perl errors
-
-[No upstream tracking] -- https://github.com/openssl/openssl/issues/5772
-
-dofile.pl: Revert only quote stuff that actually needs quoting
-
-This wasn't a good solution, too many things depend on the quotes being
-there consistently.
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/00701e5ea84861b74d9d624f21a6b3fcb12e8acd]
-bug: 5772
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/util/dofile.pl b/util/dofile.pl
-index 955224df7d..b0e20681dd 100644
---- a/util/dofile.pl
-+++ b/util/dofile.pl
-@@ -99,9 +99,9 @@ package main;
- # This adds quotes (") around the given string, and escapes any $, @, \,
- # " and ' by prepending a \ to them.
- sub quotify1 {
--    my $s = my $orig = shift @_;
-+    my $s = shift @_;
-     $s =~ s/([\$\@\\"'])/\\$1/g;
--    $s ne $orig || $s =~ /\s/ ? '"'.$s.'"' : $s;
-+    '"'.$s.'"';
- }
- 
- # quotify_l LIST
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 0ddcf856a8..806fec1eea 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -14,15 +14,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
-           file://0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
-SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
+SRC_URI[md5sum] = "9495126aafd2659d357ea66a969c3fe1"
+SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99"
 
 inherit lib_package multilib_header ptest
 
-- 
2.18.1


