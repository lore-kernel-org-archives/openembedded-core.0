Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoF6-000273-HL
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80F6b017307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:15 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:15 -0700
Message-ID: <6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Mon, 18 Jul 2011 14:34:08 +0800
Date: Thu, 21 Jul 2011 16:00:23 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] dropbear: Support PAM
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:24 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I make a patch and some changes in dropbear.inc for supporting pam.
- Enable pam in configure
- Modify file option.h to open pam supporting

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |    6 ++++-
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1b51e1a..48cefb6 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -9,13 +9,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
 
 DEPENDS = "zlib"
 RPROVIDES = "ssh sshd"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 	         file://urandom-xauth-changes-to-options.h.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
 	         file://allow-nopw.patch;apply=no \
-	         file://init"
+	         file://init \
+		 file://dropbear-enable-pam.patch "
 
 inherit autotools update-rc.d
 
@@ -28,6 +30,8 @@ LD = "${CC}"
 SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+EXTRA_OECONF += "\
+	${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
new file mode 100644
index 0000000..b941db5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
@@ -0,0 +1,21 @@
+dropbear: We need modify file option.h besides enabling pam in \
+configure if we want dropbear to support pam.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/options.h	2011-07-12 13:27:39.008819183 +0800
++++ b/options.h.new	2011-07-12 13:37:37.780819308 +0800
+@@ -149,9 +149,9 @@
+  * but there's an interface via a PAM module - don't bother using it otherwise.
+  * You can't enable both PASSWORD and PAM. */
+ 
+-#define ENABLE_SVR_PASSWORD_AUTH
++//#define ENABLE_SVR_PASSWORD_AUTH
+ /* PAM requires ./configure --enable-pam */
+-/*#define ENABLE_SVR_PAM_AUTH*/
++#define ENABLE_SVR_PAM_AUTH
+ #define ENABLE_SVR_PUBKEY_AUTH
+ 
+ /* Wether to ake public key options in authorized_keys file into account */
-- 
1.7.5.1.300.gc565c



