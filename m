Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id D70B97E0CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 18:20:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d12so8883306wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=84PJ28l1pNeI80eckJzZxRRm59PbBeWYCoKADTc0u0A=;
	b=mjmTWudCX9npkviWS+e2ivNqEocXTNmd1dblqqMSgdHdV9RYLl8lE6nnjVhbK1whUb
	ZV0hxMp424NzUPJ9cK8vtbXoMP85BekbtQ7bvchWVIRx80VYpwHz0FRgk/U4d9h623yH
	ar/fuqw7bXM0KsSfD4eMdDeMCekIbRPM/KTGL1Vl9cVkYkLsUCO1gwcVCT/D/dVn8OlV
	nzfWLoRL/INXlCICQW4wRXqbZBxfNq3MCG89jSs/RBcyEMAPlvx/tQcupdNrZQ9ycy4/
	ABFPCfwdRtxyNNBAkDg+sDQJ+mRe/9/oahjJzYYzY93yGQ2AjPYQkUSKJDqKeoJwRfRx
	qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=84PJ28l1pNeI80eckJzZxRRm59PbBeWYCoKADTc0u0A=;
	b=qr+XBHxQJYA6q4mZoUTuAsd1Jhs60z+L4Ch+7t07ImQrXgdl9IUqJ8Tob+wdxYPPhp
	1CEydSftchY2WDmTVZPsLP8pEYWK1sMUi1Wi+tqbc0gc2jFWkOIvGLfQJxKIFSq4ReQV
	j2QqZOBL4QcbwTHrPre8CTjxmZbEZEp7yupDphS9xKVGRLQRWSSVM3FNq98sEC4AaJ6C
	pm4xezQ7/C2J8QQ2jRBHFwyi3dvf43TdSWyI1Uw1BEc8Kgw5eCTmNPlzYOP2x5vrjk3e
	cr98IRCa/74E7scdv/KGE2UhcBPzemqH2+28tCZW7acez7Gf0JKcoV3f872I0zX5hEva
	WFVA==
X-Gm-Message-State: APjAAAVNQYROBN+eKAKSn3+/fZUWGU5GmLIbOhlWj2eN38FUT9KRsOp4
	Xy0p4f2TKuOl8NAVjsTxzK5RgXlC
X-Google-Smtp-Source: APXvYqz5zP/dpEk54DANKvKILZIUV+pzPjgz7x51AfcgICK/rRkbnqJaNzX1HCoCPrfyIo89vROhVA==
X-Received: by 2002:a5d:434c:: with SMTP id u12mr9258217wrr.92.1557512413008; 
	Fri, 10 May 2019 11:20:13 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c20sm8806315wre.28.2019.05.10.11.20.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 11:20:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 18:20:18 +0000
Message-Id: <20190510182018.15979-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] opkg: fix ptest packaging when OPKGLIBDIR == libdir
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
X-List-Received-Date: Fri, 10 May 2019 18:20:13 -0000

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


