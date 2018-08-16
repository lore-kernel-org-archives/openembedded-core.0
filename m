Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id AB2CE79267
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:28:14 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w7GCSFFn010437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:28:15 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w7GCSEvS017621;
	Thu, 16 Aug 2018 14:28:14 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B6FE3922F1D;
	Thu, 16 Aug 2018 14:28:14 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 14:27:57 +0200
Message-Id: <20180816122757.4178-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180816122757.4178-1-andrej.valek@siemens.com>
References: <20180816122757.4178-1-andrej.valek@siemens.com>
Subject: [PATCH 2/2] openssl: update 1.1.0h -> 1.1.0i
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
X-List-Received-Date: Thu, 16 Aug 2018 12:28:15 -0000

Please see this security advisory:
https://www.openssl.org/news/secadv/20180612.txt

Remove obsolete patch.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...-dofile.pl-only-quote-stuff-that-actually.patch | 29 ----------------------
 .../{openssl_1.1.0h.bb => openssl_1.1.0i.bb}       |  5 ++--
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
index 8b3d92203f..7929d81b45 100644
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
 
 inherit lib_package multilib_header ptest relative_symlinks
 
-- 
2.11.0


