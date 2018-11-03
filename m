Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1DC7A077
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:35 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9BB1BFF802;
	Sat,  3 Nov 2018 16:45:34 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:25 -0700
Message-Id: <20181103164427.16125-24-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 23/25] openssl-1.1: fix c_rehash perl errors
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:36 -0000

From: Andrej Valek <andrej.valek@siemens.com>

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

(From OE-Core rev: f8a826f497073533a3e4c390255ae197d65d6ef3)

(From OE-Core rev: 4524d1f916b55db6d280ff51a41933b8ec9046b0)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...le.pl-only-quote-stuff-that-actually.patch | 29 +++++++++++++++++++
 .../openssl/openssl_1.1.0h.bb                 |  1 +
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
index 3a702388ce..0ddcf856a8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://0002-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.18.1


