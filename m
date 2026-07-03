Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0C8C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 09:59:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88976.1783072773998227864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=raO1Ak5P;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so261556a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783072773; x=1783677573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3AQimZY3SYVIw5Wtw9iCePvam6Xynj8otSzh5Iy+Cs=;
        b=raO1Ak5Pgyji1NmYD5Wu/zSddr80x/nNMlN5fO6N39eomiG0X9vkPeaNnDUi7ntxUB
         nEtpAz9/Rj8Se22405Q3etJ0M+LPrT92i52yToEX5KO+n+rPYId4EBkiZhaPqhGsjpP9
         b2lyN8Rnv67ZH92MFvHIT5dsH0T6hGyrq0ozk8NIqDJy8MbeXY6K+TjsA1TfftKF3QSw
         7NtkRpobJunQuN2KYmgfzLdcND/lG2rhXY+n8bQq6bsSwh9SjETTQLNlAYN3a4OP0cOp
         R59Tpb9HjzPNOTUlnbVXrzrAIER2F3E3B2Fk6W/q2XQFqGUugNXkHnw+ESEMis2RGzmY
         0/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072773; x=1783677573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3AQimZY3SYVIw5Wtw9iCePvam6Xynj8otSzh5Iy+Cs=;
        b=RZycj7wSo5HhyiSzrj+aZ/6J2rAvhZ7D5fTSe2x70Ck3nP/Aj04MWXAt2qd+1FFHjQ
         6qZOIgXEIW+Y66FlBwwsznxwKF+BkgIkbJvLxdvjUj/yQnWi0xTUBpMyI4SqVKYWgNj0
         OXN+ScJvMm+eSJZw4X21eG4X3cTmj+OkF+WHw9oyNhei0HoKMXGoQtkdlUXLavcKw+wV
         2MBy1CIkHZT+SlRULdgjwcqXAwwsXSt0t6ngIH7uWWtEZZi5oWZY2lyUMsOqQM7/zTEh
         2e2f5MHMD0yjbuso9hhVUs7Yi2CAbJmF1Txx8v7TScN4ZjYFi5rEBYYHI9uBIXJJeUt9
         aAzQ==
X-Gm-Message-State: AOJu0Yy6rcMSB0ADphlKHUCREib8zFxeyOGi3hczOZpb5ANPwRnwnXNQ
	JCSKeLXKMjGKQoNWMqsxIA26Un0rKRuR0hq2JxHvmpV4F8evSub2Z2VgpXtjiRVNTYE77Q==
X-Gm-Gg: AfdE7cl+dewt66zLLV1PajYyBxP/9eGTucCEz/N3StywPvFln336YjbnfWCE2R0T1P5
	pu4df0b+iGGiTiMNm0PNUR1nNHs+1VM28hk++WESu3tKmjKVhKiJYdQMZkYzdB7DJT9EWrzk4aD
	xcXgAtDZSNrZSxsEcnr0qVJw6/n+noeHhJ2zqm6wBam/5fjAGg2NKotkNH1L55BCJet+Jgdjwmi
	LHIB4/oO4Y3/ooGTjmyBy197uPvDLygJ75ycpkhpdsH6X0lA2wCOxNKcg+1IBRVBp4WOL0ADhC2
	ZRX7KxSKmnGxpIiYumB9jMXcAcxKGY0miqTpyYeortLoQJ70bIzJ2sKV61D4FFOGra+IptrZUn2
	SrY4UpdXcYFckxU5TPE0KJIlcr5WcjUIW9SzkYFkw1mpoei/PdnUjKQmsNMHLv/fTyedvauU/Vp
	Ug9gfcs10nXEq8gpbfKHVYZ2TJ501IUdV+hcGbIsfUk3Eb9asbRwBzUB02qA==
X-Received: by 2002:a05:6a21:2c12:b0:3bf:b60b:da95 with SMTP id adf61e73a8af0-3bfed6492cemr10917557637.60.1783072773235;
        Fri, 03 Jul 2026 02:59:33 -0700 (PDT)
Received: from naduvan.timesys.com ([117.98.163.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc3ea61sm20189025eec.30.2026.07.03.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:59:32 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex@linutronix.de,
	mathieu.dubois-briand@bootlin.com,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][PATCH] boost: install CMake config for header-only system library
Date: Fri,  3 Jul 2026 15:29:25 +0530
Message-Id: <20260703095925.265641-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 09:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240102

In 1.91.0 (4981f3087a30) boost-system became a header-only "modular"
library with no separate shared object, and was therefore dropped from
BOOST_LIBS. As a side effect its CMake package config is no longer
installed: the top-level b2 install target only ships configs for the
libraries selected via --with-<library>, and 'system' can no longer be
named there (b2 errors out with "wrong library name 'system'").

Downstream software that does find_package(Boost COMPONENTS system) then
fails to configure and has to be patched.

Install the modular 'libs/system//install' target explicitly from
do_install so that lib/cmake/boost_system-<ver>/ is shipped again in the
-dev package. The target is header-only, so no library is built or
packaged; only the CMake config (and already-present headers) are added.

Verified with a from-scratch build: boost_system-config.cmake is packaged
into boost-dev and find_package(Boost REQUIRED COMPONENTS system)
succeeds against the installed tree again.

[YOCTO #16346]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7a343e54f6..3cd71c4d6e 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -203,6 +203,17 @@ do_install() {
 		--libdir=${D}${libdir} \
 		--includedir=${D}${includedir} \
 		install
+
+	# In 1.91 boost-system became a header-only "modular" library and is no
+	# longer selectable through --with-system, so it is not part of BOOST_LIBS
+	# and the top-level install target no longer ships its CMake package
+	# config. Install that modular target explicitly so downstream
+	# find_package(Boost COMPONENTS system) keeps working.
+	b2 ${BJAM_OPTS} \
+		--libdir=${D}${libdir} \
+		--includedir=${D}${includedir} \
+		libs/system//install
+
 	for lib in ${BOOST_LIBS}; do
 		if [ -e ${D}${libdir}/libboost_${lib}.a ]; then
 			ln -s libboost_${lib}.a ${D}${libdir}/libboost_${lib}-mt.a
-- 
2.34.1


