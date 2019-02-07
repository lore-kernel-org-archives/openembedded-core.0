Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC8AC79DCC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 00:35:46 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id gn14so3936555plb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 16:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=05RlairwE7G+mGiiUbbSHdWMctRuaHGDwFUOTY8+/D8=;
	b=bKTF5G+iulnuRQR6xHg5YdezOvhk68L9xDjEF3EcI2d7TNTLbncMC/p2tqZyzNI5n6
	zmLWd1u2Np1CPN6VIvayduGThugr0nfg+m2mWD6OEJrOy9NvH1e1h09tpdJzX8P9vmry
	wVBkaLbO4Qj9Q6iMxLEJXSszA1FrluNPQ06HaAl3QyITTRrpjx2GKAxK2wkhLtpdhfRo
	qUfPV6fJyEHlu6+pWkmqQF+7x3BUFJHjgUdT6MNeer+3bwyW7Zgmm8fFTlfs2El3bX8h
	0p3sEAbqd962bwofcADu6w5pX09ewxYqJrtITqfy8atPJC0axjCG0AZY6LOOxwDme/uO
	oSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=05RlairwE7G+mGiiUbbSHdWMctRuaHGDwFUOTY8+/D8=;
	b=pnXQsZt/EgrUbuEI3RjkfWJWU1feZTrBAuWs0GbnJzu/nV7yd9fKCK2LF5/BC3IbUD
	KKs+PRtzqBwwY9pMemLkzZTMEkbQNL92qrbSDLTJwX4b/kk5tNWGv4GY6llS2L5H+1i8
	4ckXQvFQ2EJVXzWoirgmeLKLE/LUX8llzeWvCkd9PIjABFiObqghq9zAT2SKkyltTOOB
	My9Cg1NCtRiUqt8LKlFnEeYhiRGjg8vho6+yPrYpDKOFBfAOCgDZDrBWk3teN9n3V5hg
	MNHW/ObJs0uwcrSE0XgG3w3uVcLABGZfeot7X02EQuJlYZA8br2gcZKB7tO1hRUEN1SV
	Er8w==
X-Gm-Message-State: AHQUAuZby/hgXQnw30nUfgbmgPMPfMUHOpoXnom7IlKMh33UJPjhguyV
	F0lq00/vcFOdvONNwUimdOGNvcnF
X-Google-Smtp-Source: AHgI3Ib4Vye+7HiBsfSqhjaGL4YU08KveT4o6tan858dIZG4ohD7t1aUYBpGdK7oQWKKD0q4u1Olrw==
X-Received: by 2002:a17:902:bd86:: with SMTP id
	q6mr13300879pls.16.1549499746942; 
	Wed, 06 Feb 2019 16:35:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id q3sm8023602pgv.74.2019.02.06.16.35.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 16:35:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2019 16:35:37 -0800
Message-Id: <20190207003537.7135-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 00:35:46 -0000
Content-Transfer-Encoding: 8bit

This has been a constant source of trouble for build failures due to host-user-contaminated QA
errors of sort

ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

So far we have tried to mould cp command into not carrying the build
user permissions into install area but it is never entirely fixed since
the issue keeps popping up in various scenes

This patch replaces use of cp with install utility and specifies install
mode for files explcitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 6384f9cbf1..9b256a5108 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
 do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir}
-	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
-	fi
-	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
-		mkdir -p ${D}${localedir}
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
-	fi
+        install -d ${D}${bindir}
+        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
+        -exec install -m 0755 -t "${D}${bindir}" {} \;
+
+        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -printf '%P ') ; do
+                install -d "${D}${localedir}/$d"
+                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1 -type f \
+                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
+        done
 	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
-		mkdir -p ${D}${libdir}
-		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
-		fi
-		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
-			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
-		fi
-	fi
-	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
+                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv" -type d -printf '%P ') ; do
+                        install -d "${D}${libdir}/gconv/$d"
+                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -maxdepth 1 -type f \
+                        -exec install -m 0755 -t "${D}${libdir}/gconv/$d" {} \;
+                done
+                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n" -type d -printf '%P ') ; do
+                        install -d "${D}${datadir}/i18n/$d"
+                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -maxdepth 1 -type f \
+                        -exec install -m 0644 -t "${D}${datadir}/i18n/$d" {} \;
+                done
 	fi
-	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
+        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type d -printf '%P ') ; do
+                install -d "${D}${datadir}/locale/$d"
+                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1 -type f \
+                -exec install -m 0644 -t "${D}${datadir}/locale/$d" {} \;
+        done
+	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
 }
 
 inherit libc-package
-- 
2.20.1


