Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFB27DA87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 13:52:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e9so3523098wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=84PJ28l1pNeI80eckJzZxRRm59PbBeWYCoKADTc0u0A=;
	b=YLKnCkHePjXcYrcVHRZiWrESn4ZECpXdPDo6tlXSvAE0smW6Frwc3fXwnIHNb3ehAT
	q9+5tdVAGJOfSIT4uKp47yEv20JdcPinduAiGSUXBAuTGWeUbEZKejZep2Woeveterfh
	8pTluEeHrzxaZlqljnDmJQoPePAjgMqckL+7tt/DTqf0Gz1XCranuiF+dUq+C4jTqYit
	Wc6rqWJ4LiyyEE6mdoL9EqvYu2tbM8fBJxXKhm8Gkwt4rLBfyeu6Wq0NcGzum6Z9pmU1
	Mj7wqVi8BFXLsI5zbVTgiH6dPxgdAjTgan+9Et5Pr0OxelqCDfUl7CeV3FowMaWt5d5M
	gZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=84PJ28l1pNeI80eckJzZxRRm59PbBeWYCoKADTc0u0A=;
	b=G8bx/4uZugDpO0yEcon0JEgandok8/S1narFvO+AGpLIitS5DJtodkGA1CM/zTkcif
	c4hKSRn1JSUkXCZ3vHGKoyfuOeXk++tbhl/ihrrJK1U/cyU80HaKq7S7xS1P+/l3KkpK
	30mcEpVhwd5+cA4iArSLQgKAKFFk8Eo/MLKbBwo+UA64z8wKKP/zQdkVL3qNiy5kTAm5
	WAfx4i+4cCdCsLyj6EqPeuI+wdbhtkQPdHjqeSWr7EitN08irCv1t+8/tY16ZgoYQWBP
	Rz+jvoN0OBffn6nOj0YhrGJomRBWcN5SlslaLGqLugiUcsrmHrVOHpu31gigTVShfroh
	9MqA==
X-Gm-Message-State: APjAAAWdbgGiPBIu3n0pbikYPgeffOdLRGxv4OJtpL13d6ZpY1tc0gp9
	jNCM2h969AbDDZZ9oWm/KUA7MY/F
X-Google-Smtp-Source: APXvYqw/O6GwnEgNvBTs33bjjlRq7S9D6/MhoHy8PTp1Y0sKppuzmn6ErZ+S7yk419UImyuaEax4Rg==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr3180621wrl.154.1556805132659; 
	Thu, 02 May 2019 06:52:12 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y7sm2869920wrg.45.2019.05.02.06.52.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 06:52:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 13:52:22 +0000
Message-Id: <20190502135222.133-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] opkg: fix ptest packaging when OPKGLIBDIR == libdir
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
X-List-Received-Date: Thu, 02 May 2019 13:52:12 -0000

there is small issue with ptest packaging in cases where
OPKGLIBDIR is set to /usr/lib.

Then all ptest files get packaged in libopkg instead of opkg-ptest and correct QA error is triggered:
ERROR: QA Issue: /usr/lib/opkg/ptest/tests/opkgcl.py contained in package libopkg requires /usr/bin/python3, but no providers found in RDEPENDS_libopkg? [file-rdeps]

  # $FILES_libopkg
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/opkg_0.4.0.bb:62
  #     "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
  FILES_libopkg="/usr/lib/*.so.* /usr/lib/opkg/"

  # $FILES_opkg-ptest [2 operations]
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:9
  #     "${PTEST_PATH}"
  #   rename from FILES_${PN}-ptest data.py:117 [expandKeys]
  #     "${PTEST_PATH}"
  # pre-expansion value:
  #   "${PTEST_PATH}"
  FILES_opkg-ptest="/usr/lib/opkg/ptest"

  # $PACKAGES [4 operations]
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/conf/bitbake.conf:292
  #     "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/conf/documentation.conf:314
  #     [doc] "The list of packages to be created from the recipe."
  #   prepend /jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:20
  #     "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
  #   prepend /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/opkg_0.4.0.bb:60
  #     "libopkg"
  # pre-expansion value:
  #   "libopkg ${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)} ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
  PACKAGES="libopkg opkg-ptest opkg-src opkg-dbg opkg-staticdev opkg-dev opkg-doc opkg-locale  opkg"

The easiest fix should be to reorder PACKAGES (the _prepends) so that ${PN}-ptest is prepended later -> ends before libopkg).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
index 20c2e0b72a..e2305d096a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
@@ -23,6 +23,11 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
 SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
 
+# This needs to be before ptest inherit, otherwise all ptest files end packaged
+# in libopkg package if OPKGLIBDIR == libdir, because default
+# PTEST_PATH ?= "${libdir}/${BPN}/ptest"
+PACKAGES =+ "libopkg"
+
 inherit autotools pkgconfig systemd ptest
 
 target_localstatedir := "${localstatedir}"
@@ -57,8 +62,6 @@ RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS_${PN} = "opkg-collateral"
 RPROVIDES_${PN} = "opkg-collateral"
 
-PACKAGES =+ "libopkg"
-
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


