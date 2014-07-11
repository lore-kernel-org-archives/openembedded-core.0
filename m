Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C749370428
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1pPEg020661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:51:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 18:51:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 18:51:23 -0700
Message-ID: <5912151dc1b33e4b1c156e50d02e3a426fb880ad.1405043280.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405043280.git.liezhi.yang@windriver.com>
References: <cover.1405043280.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] file: fix perl reported as awk
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
X-List-Received-Date: Fri, 11 Jul 2014 01:51:28 -0000
Content-Type: text/plain

The awk pattern was checked *before* the Perl pattern, so the perl
script with BEGIN{...} would be reported as awk, this patch fixes it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/file/file/debian-742262.patch |   16 ++++++++++++++++
 meta/recipes-devtools/file/file_5.18.bb            |    4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/debian-742262.patch

diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
new file mode 100644
index 0000000..5cfe380
--- /dev/null
+++ b/meta/recipes-devtools/file/file/debian-742262.patch
@@ -0,0 +1,16 @@
+The awk pattern was checked *before* the Perl pattern, so the perl
+script with BEGIN{...} would be reported as awk, this patch fixes it.
+
+Upstream-Status: Backport [debian]
+
+diff --git a/magic/Magdir/commands b/magic/Magdir/commands
+--- a/magic/Magdir/commands
++++ b/magic/Magdir/commands
+@@ -50,6 +50,7 @@
+ 0	string/wt	#!\ /usr/bin/awk	awk script text executable
+ !:mime	text/x-awk
+ 0	regex		=^\\s{0,100}BEGIN\\s{0,100}[{]	awk script text
++!:strength - 12
+ 
+ # AT&T Bell Labs' Plan 9 shell
+ 0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
diff --git a/meta/recipes-devtools/file/file_5.18.bb b/meta/recipes-devtools/file/file_5.18.bb
index a7db410..ba61f22 100644
--- a/meta/recipes-devtools/file/file_5.18.bb
+++ b/meta/recipes-devtools/file/file_5.18.bb
@@ -13,7 +13,9 @@ DEPENDS_class-native = "zlib-native"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
-           file://filesystems"
+           file://filesystems \
+           file://debian-742262.patch \
+          "
 
 SRC_URI[md5sum] = "d420d8f2990cd344673acfbf8d76ff5a"
 SRC_URI[sha256sum] = "6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07"
-- 
1.7.9.5


