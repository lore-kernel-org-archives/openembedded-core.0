Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8FE62134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:52:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n25so525812wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z72BqTXlIHt68vzDrjBGwHmpbTULMWwh+Sl9WFJwSDs=;
	b=LkXclpBg7i5ADkvaDOtxx5BMj7Y1yeGZJW2WTHIGslUr0TAmYgl4HQR0BHwx3KNdG/
	vcJ+HRKpMRJyPzW16N4lyIaeG4kuzqbHJ1lOVNDb+2OV4luBwaFaVfLTyUUJwVFIQsAG
	D5SyCjGo5vUHdQngTxa5WK0PA6yQX1MAB6ULU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z72BqTXlIHt68vzDrjBGwHmpbTULMWwh+Sl9WFJwSDs=;
	b=qD2FXFbrJA47RuFsPN7wqdxX8KO21fo3jbd4AJn0Yfeif/smdQEycbMrnPdhiumbFl
	wNqimvsF/TrXdEto1GuB/z99bx6Qv6FWW+YGEERBN0yBRI6NwE9V5juIQ9sPh+iTwSBL
	feTvt13IzwQ+k3JWnAC1QOc7sY9rvVN97+gr++BZmBKm7v6NonNfrc3LeTuiEDgNVQc4
	F9tH+cjJbTT0l2xmOfpSELlNJ/+N0/qq3txUynWURRsGpDSunCLw2Zb/urlzdV3IMZ5S
	t40ZSZXodJxRNnVh/BDFv8mKi5jiDRPS8FxABu2sa043Qz6d5ETe1x/zZTZZRgcINnPA
	Ba/Q==
X-Gm-Message-State: APjAAAUmhY1MHQTKYr/l6OVxcyhQDuUuYusdgtHtvRWZd6CN68+PPAcH
	sU+N6pPOKZd3cTBKpw/5Xj8PGcCZ8xc=
X-Google-Smtp-Source: APXvYqyXbv/2G3nhU+WtdeIEL1biLAofURmOq7SmgurD63LKGgmSeQCahhUpPJeIz+5RfcfSIjMdVQ==
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr10751283wml.29.1557870742015; 
	Tue, 14 May 2019 14:52:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 6sm193160wms.23.2019.05.14.14.52.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 14:52:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 22:52:20 +0100
Message-Id: <20190514215220.24533-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] valgrind: Include debugging symbols in ptests
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
X-List-Received-Date: Tue, 14 May 2019 21:52:21 -0000
Content-Transfer-Encoding: 8bit

About half the ptests will fail if the executables deployed
as part of the ptest package are stripped. We therefore need
to add a dependency on the dbg symbols package and silence the
QA test which would complain about this since we really do want
it in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 9749fdb2442..3b3d0f02f7b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -108,12 +108,13 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob"
+RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob ${PN}-dbg"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
 # Skip file dependency check
 SKIP_FILEDEPS_${PN}-ptest = '1'
+INSANE_SKIP_${PN}-ptest = "debug-deps"
 
 do_compile_ptest() {
     oe_runmake check
-- 
2.20.1


