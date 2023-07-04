Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BE8EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:19 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.61493.1688484614828806854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vDG5RBtO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6b73b839025so4750381a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484613; x=1691076613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25untzWNkgHLcfCscIKyrHI4tFG3+kU85i7fqN7uYxI=;
        b=vDG5RBtOGuKLO3M2eEwMQIpFlnD+1ty+rl+9ClkBHE5Iejg+PbSoOpGJrzMfPVOfin
         tso0njqPfMrSY2riLj3ex4LVehUkgk1Tz4wmIH1bxSMIGsKbciTMoVcTB4XvfgXpaeI9
         1hZIWVaBx0UKN41GGWPZNhU+yf19cVEgx3ZT6wHrs0EjP9xOxDlLjAcG7FcWKoObWMRe
         pdrNO/w1z3aRj1AdHGv1KMTwTCr8Q2JQc78leuldKbd+9xEsk3R8PhbZznldkvytf0ze
         0x2jZZvmtqlbl8JSvr6V1FS9NHxr9gPbclrP9QnmqTN20eCM3QtwtitZmiBOBvle7xgo
         yFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484613; x=1691076613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25untzWNkgHLcfCscIKyrHI4tFG3+kU85i7fqN7uYxI=;
        b=k+IKPmM+yUBzIkA1Zx8q15xfq/va+Mr8efPJlta+OJISwGkUP0Evq0EeO5xDXuWXOa
         AiI0yMZQaBYa1RJ5fNcGjY35k6wB3AOYNo8vHN85lYueht0Zhs12HKRix3BOfTi05ETa
         ydNV7+l7kLZcCz6AnkullqgWjVIhO1NsQ6oEOBJSrhmUvkUdShU7+DMu0alokdatMfjX
         P/AhKB+TeweEXqv7Tr8/HvkOFlBVkwM1BjYE4+PtTrc8jCc6nnMCKOsK1NACCb84PgBP
         HW58MYtNliRAs0lF6UgacyDQMCLE5289Gnb3ZjaUX4WtaV4U9OVZ2jTIDPD3ewIdlx/C
         SLyA==
X-Gm-Message-State: ABy/qLYoVzeux427uG/xquph/Kqml8HKrB+TfiSUwFKRYBZFxVB2dgsk
	lqIarZ3+bLwN/e9aNSWDdqdx6KTzkKnYvEdBPRQMIw==
X-Google-Smtp-Source: APBJJlFJsiJcurc9haSNFSai6ZmDwigAZmHeFzYbWWuGD0KWqFd0jt2ny5qjXN0mEVllVHhHEUnpnQ==
X-Received: by 2002:a05:6359:baa:b0:12b:c378:b090 with SMTP id gf42-20020a0563590baa00b0012bc378b090mr8760430rwb.26.1688484613604;
        Tue, 04 Jul 2023 08:30:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/30] rpm: write macros under libdir
Date: Tue,  4 Jul 2023 05:29:19 -1000
Message-Id: <2a13a671910cad68ab962ce369b9ed60a9bf7eea.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183852

From: Chen Qi <Qi.Chen@windriver.com>

If we create a macros file under etc/, the populate_sdk task would
fail if 'package-management' is in SDKIMAGE_FEATURES and nativesdk-rpm-build
is installed.. The error message is like below:

  unable to place /.../sdk/image/etc/rpm in final SDK location

This is because it's trying to move the etc/rpm dictory into the
host sysroot but the <host_sysroot>/etc/rpm has already exists.

To solve this problem, avoid creating /etc/rpm/macros for nativesdk-rpm-build,
use ${libdir}/macros instead. In this way, the macros file is hold
in nativesdk-rpm. As nativesdk-rpm-build depends on nativesdk-rpm,
the 'rpmbuild' command inside SDK can still correctly find find-debuginfo
binary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fde0eadf16d34d88a599009013913fe55d89283)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 6da2edddf3..83537d4761 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -134,8 +134,8 @@ do_install:append:class-target() {
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-    mkdir -p ${D}${SDKPATHNATIVE}/etc/rpm
-    echo "%__find_debuginfo   ${SDKPATHNATIVE}/usr/bin/find-debuginfo" >> ${D}${SDKPATHNATIVE}/etc/rpm/macros
+    mkdir -p ${D}${libdir}/rpm
+    echo "%__find_debuginfo   ${SDKPATHNATIVE}/usr/bin/find-debuginfo" >> ${D}${libdir}/rpm/macros
 }
 
 do_install:append () {
@@ -173,7 +173,6 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
 "
-FILES:${PN}-build:append:class-nativesdk = " ${SDKPATHNATIVE}/etc/rpm/macros"
 
 FILES:${PN}-sign = "\
     ${bindir}/rpmsign \
-- 
2.34.1


