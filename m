Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut2-0001jN-0Y
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQgm7017889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:12 -0500
Message-ID: <bfd0dd2db21a502b11842c0a692b89f6d110bc08.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 13/30] lrzsz: use new update-alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:52 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb |   30 +++++++++++++-----------------
 1 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 7f86157..12ac5ff 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
 DEPENDS = ""
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://autotools.patch \
@@ -27,20 +27,16 @@ do_install() {
 	install -m 0755 src/lrz src/lsz ${D}${bindir}/
 }
 
-pkg_postinst_${PN}() {
-	for util in rz rx rb; do
-		update-alternatives --install ${bindir}/$util $util lrz 100
-	done
-	for util in sz sx sb; do
-		update-alternatives --install ${bindir}/$util $util lsz 100
-	done
-}
+inherit update-alternatives
 
-pkg_postrm_${PN}() {
-	for util in rz rx rb; do
-		update-alternatives --remove $util ${bindir}/lrz
-	done
-	for util sz sx sb; do
-		update-alternatives --remove $util ${bindir}/lsz
-	done
-}
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "rz rx rb sz sx sb"
+
+ALTERNATIVE_TARGET[rz] = "${bindir}/lrz"
+ALTERNATIVE_TARGET[rx] = "${bindir}/lrz"
+ALTERNATIVE_TARGET[rb] = "${bindir}/lrz"
+
+ALTERNATIVE_TARGET[sz] = "${bindir}/lsz"
+ALTERNATIVE_TARGET[sx] = "${bindir}/lsz"
+ALTERNATIVE_TARGET[sb] = "${bindir}/lsz"
-- 
1.7.3.4



