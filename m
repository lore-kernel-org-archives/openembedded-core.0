Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEk-0000RX-0O
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC8IZ000679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:08 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:07 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:29 -0500
Message-ID: <4da378412f0dceff4b3c3757a185ffa67997599c.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 16/17] lrzsz: sz, sx and sb were linked incorrectly
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:34 -0000
Content-Type: text/plain

The sz, sx and sb links were created incorrectly to lrz, they should
point to lsz.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 414f2f4..7f86157 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
 DEPENDS = ""
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://autotools.patch \
@@ -28,13 +28,19 @@ do_install() {
 }
 
 pkg_postinst_${PN}() {
-	for util in rz rx rb sz sx sb; do
+	for util in rz rx rb; do
 		update-alternatives --install ${bindir}/$util $util lrz 100
 	done
+	for util in sz sx sb; do
+		update-alternatives --install ${bindir}/$util $util lsz 100
+	done
 }
 
 pkg_postrm_${PN}() {
-	for util in rz rx rb sz sx sb; do
+	for util in rz rx rb; do
 		update-alternatives --remove $util ${bindir}/lrz
 	done
+	for util sz sx sb; do
+		update-alternatives --remove $util ${bindir}/lsz
+	done
 }
-- 
1.7.3.4



