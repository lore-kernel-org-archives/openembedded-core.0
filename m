Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnd-000367-4j
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:08:17 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so8947887bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OmpL384hoQs2exWd9gGpP+1gyKiWjXb1UwDyHrlY2lc=;
	b=krDUIwoh/2xl4aKd9VRK1aG9VGVsS7XxPSLGK7fCleOIJ+j2Ap0t9w3tCplwl9QCwh
	i6dFxOltETGtHop0OzIdWgNCSp0FKFK+Kor0eYPu8IOj9IbuZQVBgrLjmVCkEw8mEsmL
	rfZ50uORuIPmLjT5/y+BP34fV4YnkBkSvpYzI=
Received: by 10.204.141.2 with SMTP id k2mr46497743bku.81.1322550100726;
	Mon, 28 Nov 2011 23:01:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm31502685bkv.9.2011.11.28.23.01.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:55 +0100
Message-Id: <a3d738155db5af1ff330b03b59f63d41a35e0e64.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
References: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 05/10] ppp-dialin: use useradd.bbclass instead of hardcoded adduser/deluser calls
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
X-List-Received-Date: Tue, 29 Nov 2011 07:08:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ppp-dialin/ppp-dialin_0.1.bb                   |   23 +++++--------------
 1 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index d4ac77e..d239c20 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -2,7 +2,7 @@ SECTION = "console/network"
 DESCRIPTION = "Enables PPP dial-in through a serial connection"
 DEPENDS = "ppp"
 RDEPENDS_${PN} = "ppp"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 SRC_URI = "file://host-peer \
            file://ppp-dialin"
 
-inherit allarch
+inherit allarch useradd
 
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
@@ -20,18 +20,7 @@ do_install() {
 	install -m 0755 ${WORKDIR}/ppp-dialin ${D}${sbindir}
 }
 
-pkg_postinst_${PN} () {
-if test "x$D" != "x"; then
-	exit 1
-else
-	adduser --system --home /dev/null --no-create-home --empty-password --ingroup nogroup -s ${sbindir}/ppp-dialin ppp
-fi
-}
-
-pkg_postrm_${PN} () {
-if test "x$D" != "x"; then
-	exit 1
-else
-	deluser ppp
-fi
-}
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home /dev/null \
+                       --no-create-home --shell ${sbindir}/ppp-dialin \
+                       --no-user-group --gid nogroup ppp"
-- 
1.7.8.rc3



