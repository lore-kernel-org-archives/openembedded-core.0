Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 704356057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:34:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K5Yc3Q020234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:34:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 22:34:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 22:34:36 -0700
Message-ID: <4dbdeb4846fec52c1f1927e60862ed4e6e2be038.1474349633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474349633.git.liezhi.yang@windriver.com>
References: <cover.1474349633.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssl: fix do_configure error when cwd is not in @INC
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
X-List-Received-Date: Tue, 20 Sep 2016 05:34:38 -0000
Content-Type: text/plain

Fixed when building on Debian-testing:
| Can't locate find.pl in @INC (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.2 /usr/local/share/perl/5.22.2 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at perlpath.pl line 7.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../openssl/openssl-util-perlpath.pl-cwd.patch     | 34 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
new file mode 100644
index 0000000..065b9b1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
@@ -0,0 +1,34 @@
+From e427748f3bb5d37e78dc8d70a558c373aa8ababb Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 19 Sep 2016 22:06:28 -0700
+Subject: [PATCH] util/perlpath.pl: make it work when cwd is not in @INC
+
+Fixed when building on Debian-testing:
+| Can't locate find.pl in @INC (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.2 /usr/local/share/perl/5.22.2 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at perlpath.pl line 7.
+
+The find.pl is added by oe-core, so once openssl/find.pl is removed,
+then this patch can be dropped.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ util/perlpath.pl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/util/perlpath.pl b/util/perlpath.pl
+index a1f236b..5599892 100755
+--- a/util/perlpath.pl
++++ b/util/perlpath.pl
+@@ -4,6 +4,8 @@
+ # line in all scripts that rely on perl.
+ #
+ 
++BEGIN { unshift @INC, "."; }
++
+ require "find.pl";
+ 
+ $#ARGV == 0 || print STDERR "usage: perlpath newpath  (eg /usr/bin)\n";
+-- 
+2.9.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index 4f91e55..c8444d3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://parallel.patch \
             file://CVE-2016-2177.patch \
             file://CVE-2016-2178.patch \
+            file://openssl-util-perlpath.pl-cwd.patch \
            "
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
 SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
-- 
2.9.0


