Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M7-0007v6-2B
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:03 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so822968wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=mUvV4MYepDUDOgA1dSFhDp2kdmsJfWv5O4yi6caasQk=;
	b=JmWgDABCP0C5/M7lml3/3mQl0sNbUs26seaZVxa0Z3feQLYs54WsjwElENImRhxG+i
	zfTarjtJl0x/rGKGJ/ZBrkyV0P6+MbiAgmssxBKjbupcxm17erUoLm3dR/CU3fbxcC9O
	VTep104TTMZsUkU48dbSdkQQaOplzghZaOZ1MsNkE0xQj5TBOT3/lwGZ6514t3BWCufn
	0Dne9kviOShOIWE4PwjgXehs/cFvWKT2nR8rqTXqur4jOpxSaMp3GmFeQDXE/+yPdc1L
	RaqSrZ5Vsa9gdL7YcAH+UZN4fAkv6C/2G1F+zIGQwQZeTY+cfSxwFD3kIacpzFn4En3i
	XIVw==
Received: by 10.180.106.137 with SMTP id gu9mr11434205wib.20.1344182121684;
	Sun, 05 Aug 2012 08:55:21 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:20 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:08 +0200
Message-Id: <1344182057-15981-22-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlL5w349It6VzNxTZ+OaWJdHbj8ooJS86cCQLJ0TNYo5MCfW3ZGvuPDL+07gxsvYR11hfaa
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/30] lsb: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:04 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |   58 +++++++++++++++++-----------------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index 5734c5c..7243151 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -25,52 +25,52 @@ do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
 	mkdir -p ${D}${base_bindir}
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



