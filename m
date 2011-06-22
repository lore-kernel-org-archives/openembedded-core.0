Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZTNA-0004SD-Vo
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:46:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MJgPdh019342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:42:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 12:42:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 14:53:49 -0500
Message-ID: <1b97ce47a3a7cf758de135ff63e6746d077fd8df.1308771739.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308771739.git.mark.hatle@windriver.com>
References: <cover.1308771739.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 36/40] unzip: Avoid stripping binaries (v3)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 19:46:01 -0000
Content-Type: text/plain

Not only do we have to override things on the make line, but we
need to hack on configure as well to avoid certain behavior.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-extended/unzip/unzip/avoid-strip.patch |   48 ++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |    7 ++-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/avoid-strip.patch

diff --git a/meta/recipes-extended/unzip/unzip/avoid-strip.patch b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
new file mode 100644
index 0000000..0ef6363
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
@@ -0,0 +1,48 @@
+unix/Makefile: remove hard coded strip commands
+
+Remove the hard coded strip commands, both LF2 (used in linking) and
+STRIP used alone.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur unzip60.orig/unix/configure unzip60/unix/configure
+--- unzip60.orig/unix/configure	2009-04-16 14:25:12.000000000 -0500
++++ unzip60/unix/configure	2011-06-21 11:23:36.822849960 -0500
+@@ -17,7 +17,7 @@
+ IZ_BZIP2=${3}
+ CFLAGS="${CFLAGS} -I. -DUNIX"
+ LFLAGS1=""
+-LFLAGS2="-s"
++LFLAGS2=""
+ LN="ln -s"
+ 
+ CFLAGS_OPT=''
+diff -ur unzip60.orig/unix/Makefile unzip60/unix/Makefile
+--- unzip60.orig/unix/Makefile	2009-01-18 16:41:18.000000000 -0600
++++ unzip60/unix/Makefile	2011-06-21 11:12:22.900003388 -0500
+@@ -52,7 +52,7 @@
+ CF = $(CFLAGS) $(CF_NOOPT)
+ LFLAGS1 =
+ LF = -o unzip$E $(LFLAGS1)
+-LF2 = -s
++LF2 = 
+ 
+ # UnZipSFX flags
+ SL = -o unzipsfx$E $(LFLAGS1)
+@@ -70,7 +70,7 @@
+ CHMOD = chmod
+ BINPERMS = 755
+ MANPERMS = 644
+-STRIP = strip
++STRIP =
+ E =
+ O = .o
+ M = unix
+@@ -776,7 +776,6 @@
+ #
+ gcc:		unix_make
+ 	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="-O3" LF2=""
+-	$(STRIP) $(UNZIPS)
+ 
+ # Heurikon HK68 (68010), UniPlus+ System V 5.0, Green Hills C-68000
+ hk68:		unix_make
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index ccdd372..b9eff43 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -4,14 +4,17 @@ SECTION = "console/utils"
 LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz"
+SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
+	file://avoid-strip.patch"
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 S = "${WORKDIR}/unzip60"
 
+EXTRA_OEMAKE += "STRIP=true LF2=''"
+
 export LD = "${CC}"
 LD_virtclass-native = "${CC}"
 
-- 
1.7.3.4



