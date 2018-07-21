Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 979266E688
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:24 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id 94-v6so6454015ple.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4o9QSEbLMG8Jlwq+tnmF2z95sw4bqzkBRGcewnU7w9U=;
	b=Zh25wGvG/WXZ8zIhbFCnrqXCQyXCtfTaQKLS71kVSBhwDCFnQ2mihtC4E4Wd96FKg2
	pNUkFfJY6UECsNrD4HSJaH9GDHQ6Fv0Btc1oERoCV+14V4mcxCUtpJUlortPmPvuRewh
	+d7PfuYZkZaKU6WLYS9PByLrrxI+GgYPqMFb2QG4Voi212tRQA0AZokTYww3lfThLH/z
	AGjnaG14tuwVqgn3ZFAtLnaqxtar07El1+xugs6hEcf4Ay0mMf6Lpbf56Y2aSOaKPf4J
	ocwsBvH0fLyGlgC7+9x3H4hYBGfYSRX58A/Vg08kTDhgN7WpdBZfGtEQSwHt/mVJGKpe
	0DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4o9QSEbLMG8Jlwq+tnmF2z95sw4bqzkBRGcewnU7w9U=;
	b=ckPqwv01xzaVu0cslwmvmDltV0Vi/hD+9y0izL/5rDLo+evEhvYUI7cLRXKOa12c2s
	5CrEfOWWnvyBfKHXYu87d4OrSUbRaDBeyjDGvVHtQcuvxwl7B2CLFoyxg/RMUA1Q2ggP
	OJaXnLIhLQ2vNPo2jWIZ38XOsnNvOrei6tIoMlb3ijD8CXibcwWgB6shbdblzLbis57f
	4DP7UnMRWWrLP2Sx8lienGvA7xOCaUwwZUQVBGFGbnU4dNw4Aqu/89W0GEFkhq5g3huf
	3+KeR5RnNB+ATKIXZ51efqRxKcM+lmPltuPEy8Vb5FgB/zO9XDl5TjfgTH716O9vBhTN
	GUTw==
X-Gm-Message-State: AOUpUlFi/+MIlLPB9VrbVtcgY+aPrYLwpxaVoZ9NDdMC/wuXTlJPN3NQ
	R5VDozhUpRi6BJSmwbuF2fFZ44st
X-Google-Smtp-Source: AAOMgpdwYrZORaSP6ZwTZ3FfCQg+M88IptrED6eUnTKK625H7KjuYM9YqkmLxWF7GerorX1VBNKx9Q==
X-Received: by 2002:a17:902:968c:: with SMTP id
	n12-v6mr6356897plp.15.1532190445203; 
	Sat, 21 Jul 2018 09:27:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:09 -0700
Message-Id: <20180721162715.12611-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/7] glibc-locale: Fix host-user-contaminated QA errors
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:24 -0000

Fixes

ERROR: glibc-locale-2.27-r0 do_package_qa: QA Issue: glibc-locale: /glibc-binary-localedata-hy-am/usr/lib/locale/hy_AM/LC_MEASUREMENT.tmp is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index b3cb10b87a..e50e5cf5e3 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -74,23 +74,22 @@ LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 do_install () {
 	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
 	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
-		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
+		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
 	fi
 	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
 		mkdir -p ${D}${localedir}
-		cp -fpPR ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
+		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
 	fi
 	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-		cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
+		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
 	fi
 	if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
-		cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
+		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
 	fi
 	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
-		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
+		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
 	fi
-	chown root:root -R ${D}
-	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
+	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
 }
 
 inherit libc-package
-- 
2.18.0


