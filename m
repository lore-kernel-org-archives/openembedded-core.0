Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy716-0004kU-9e
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:36 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=rIb4E0TbkGjcuZ8rlaZ6M3I94s2S3DOGHF/6Ug0FCN8=;
	b=BnBjV2VWFdcwdHt9uPB4PwBGFpsBR03MtuNguNskzrZmP38QY8zCKYVfM5+j1R0HF4
	MpkqCJoAMCQBwSpDl7go5SBhDA2J4f0MCTD/JjvkiEJrs2BfGixRD6FUByv3sSeaxFr2
	SuE+VH/3l/E3csv/mpHPT1YnwsjY0WLgQYTsOYDh2tfQh5xzlgVhEQ2fbXVKC6aQeUUp
	zsT6oDFnAKjOAokXc5iCNRwpctittcEGxk7D2GAjFVoHIwutq2d5Jf1sUb3o1n9OWfJz
	HgCEx1kkhPXG3o7fdQPrI3EIB+NzXhpcee6yfsPbAdglrGmmsFuKaqs3YYMDhybJYNOd
	KyVg==
Received: by 10.216.255.146 with SMTP id j18mr4161114wes.163.1344196194904;
	Sun, 05 Aug 2012 12:49:54 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:54 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:39 +0200
Message-Id: <1344196136-7643-12-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQk+DzS5PetrVGvO3OnX038y3Wr6dQ6sU2v1EPR8ENMc3jPXvrQ4jsJGJmGXgHsOqEp/xxQS
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 11/28] lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:36 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |   62 +++++++++++++++++-----------------
 1 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index 15dbeaa..513998c 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r3"
+PR = "r4"
 
 # lsb_release needs getopt
 RDEPENDS_${PN} += "util-linux"
@@ -23,54 +23,54 @@ S = "${WORKDIR}/lsb-release-${PV}"
 
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
-	mkdir -p ${D}/bin
+	mkdir -p ${D}${base_bindir}
 	mkdir -p ${D}/${baselib}
-	mkdir -p ${D}/etc/lsb-release.d
-	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}/etc/lsb-release
+	mkdir -p ${D}${sysconfdir}/lsb-release.d
+	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 	
 	if [ "${TARGET_ARCH}" = "i586" ];then
-		echo -n "core-4.1-ia32" >>  ${D}/etc/lsb-release
+		echo -n "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
-		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}/etc/lsb-release
+		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
 	fi
-	echo "\"" >> ${D}/etc/lsb-release
-	echo "DISTRIB_ID=${DISTRO}" >> ${D}/etc/lsb-release
-	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}/etc/lsb-release
-	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}/etc/lsb-release
+	echo "\"" >> ${D}${sysconfdir}/lsb-release
+	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
+	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
+	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 	
 	if [ "${TARGET_ARCH}" = "i586" ];then
-		mkdir -p ${D}/etc/lsb-release.d
-		touch ${D}/etc/lsb-release.d/graphics-4.1-noarch
-		touch ${D}/etc/lsb-release.d/graphics-${PV}-noarch
-		touch ${D}/etc/lsb-release.d/desktop-${PV}-noarch
-		touch ${D}/etc/lsb-release.d/graphics-4.1-ia32
-		touch ${D}/etc/lsb-release.d/graphics-${PV}-ia32
-		touch ${D}/etc/lsb-release.d/desktop-${PV}-ia32
+		mkdir -p ${D}${sysconfdir}/lsb-release.d
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ia32
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ia32
+		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ia32
 	elif [ "${TARGET_ARCH}" = "x86_64" ];then
-		touch ${D}/etc/lsb-release.d/graphics-4.1-noarch
-		touch ${D}/etc/lsb-release.d/graphics-4.1-amd64
-		touch ${D}/etc/lsb-release.d/graphics-${PV}-amd64
-		touch ${D}/etc/lsb-release.d/desktop-${PV}-amd64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-amd64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-amd64
+		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-amd64
 	fi
 	if [ "${TARGET_ARCH}" = "powerpc" ];then
-		touch ${D}/etc/lsb-release.d/graphics-4.1-noarch
-		touch ${D}/etc/lsb-release.d/graphics-4.1-ppc32
-		touch ${D}/etc/lsb-release.d/graphics-${PV}-ppc32
-		touch ${D}/etc/lsb-release.d/desktop-${PV}-ppc32
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ppc32
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc32
+		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc32
 	elif [ "${TARGET_ARCH}" = "powerpc64" ];then
-		touch ${D}/etc/lsb-release.d/graphics-4.1-noarch
-		touch ${D}/etc/lsb-release.d/graphics-4.1-ppc64
-		touch ${D}/etc/lsb-release.d/graphics-${PV}-ppc64
-		touch ${D}/etc/lsb-release.d/desktop-${PV}-ppc64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ppc64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
+		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
 	fi
 }
 
 do_install_append(){
-       install -d ${D}/etc/core-lsb
+       install -d ${D}${sysconfdir}/core-lsb
        install -d ${D}/${baselib}/lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
        do
-           install -m 0755 ${WORKDIR}/${i} ${D}/etc/core-lsb
+           install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
        done
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
        if [ "${TARGET_ARCH}" = "x86_64" ];then
-- 
1.7.7.6



