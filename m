Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U78bc-000773-1p
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 19:05:23 +0100
Received: by mail-gg0-f175.google.com with SMTP id l1so434408ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gzugNI6+xs9RP4UsF5naJm8uyMlDEnFa+946W4WU/cY=;
	b=eeBfcAo7VLdBX/nONEwAX5zei2sOmLr2PWPXQ1hWKxdX9ZVl2xX+9HXIPCzZ6XqJ3p
	Mpy72AoLx2oHQtUd4+/k80ACj0ZB/IEaEjO/ZzvNu0+r6ESdg5J0SsU90wOfOjeL0GJt
	abcruOLXsUCNIFeeZhW68yeoHCnwJ8ATVWYjeFTQaenuGOzgl98wCrDb7/a08FhO+JXT
	GvP1R1X01rkGhImWmkAl+N14GWCKkK/5T6xwnVrLv9HrBJ5v9G2gtoYTP+geHAx2HjVI
	qnFtz4k931TCdPIK4w9JxMic0wBh4t8gfdDaSgwZctYzIkcjBgtTRMzwpndg2FGNpgis
	bhdg==
X-Received: by 10.236.151.52 with SMTP id a40mr15952764yhk.9.1361123325089;
	Sun, 17 Feb 2013 09:48:45 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id j1sm108579298yhn.3.2013.02.17.09.48.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 09:48:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 14:53:12 -0300
Message-Id: <1361123592-32572-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 5/5] meta-toolchain-qt.inc: Use CXX when linking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 18:05:28 -0000

We should use CXX compiler when linking objects as done in regular
builds inside of OE-Core. This fixes issues we've been seeing in field
where we needed to change it byhand so the toolchain could work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 107ba19..abf12fb 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -12,7 +12,7 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
     echo 'export OE_QMAKE_CC=$CC' >> $script
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=$LD' >> $script
+    echo 'export OE_QMAKE_LINK=$CXX' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=${SDKTARGETSYSROOT}/${libdir}' >> $script
     echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}/${includedir}/${QT_DIR_NAME}' >> $script
-- 
1.8.1



