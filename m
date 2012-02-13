Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rwy9T-00071u-1p
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 16:49:15 +0100
Received: by eaal10 with SMTP id l10so1514696eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NS3CpLVgDl9pIJRmuroSuI4dcySyqVsz2KiDiCAedJ4=;
	b=IMEuyVRUy7hETXMAt5tBni3hVcFUlFBZtB9fzabrdI9852S5qLQaFhpMgsOOFHXkGN
	IpRrX/coQ4cgtW0Osze3PvK80zwS5OasPuZm5SaPbudmTblEHjuAX22qIlwSslNOoSka
	iQ1g1xcqqU48T+k/GD+Hw1CpfRzmRuBOmNAnE=
Received: by 10.14.28.71 with SMTP id f47mr5447202eea.38.1329147665503;
	Mon, 13 Feb 2012 07:41:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm2804672eea.5.2012.02.13.07.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:41:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:40:47 +0100
Message-Id: <b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Mon, 13 Feb 2012 15:49:15 -0000

* seems like config/config in -L was also wrong

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index b5746ce..bac63b7 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -10,12 +10,18 @@ RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
 
 EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
 
+NATIVESDK_NAME = "oecore-${SDK_ARCH}-${SDK_ARCH}"
+NATIVESDK_PATH = "/usr/local/${NATIVESDK_NAME}"
+NATIVESDK_PATHNATIVE = "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
+NATIVESDK_LIBDIR = "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
+NATIVESDK_INCLUDEDIR = "${NATIVESDK_PATHNATIVE}${includedir_nativesdk}"
+
 do_configure_prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
-        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
         --exec-prefix) echo "/usr" ;;
         *) exit 1 ;;
 esac
-- 
1.7.8.4



