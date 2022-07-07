Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18311C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 16:43:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.182.1657212198755763244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 09:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DA4106F;
	Thu,  7 Jul 2022 09:43:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97AD23F792;
	Thu,  7 Jul 2022 09:43:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ltp: remove open-posix-testsuite build logs
Date: Thu,  7 Jul 2022 17:43:13 +0100
Message-Id: <20220707164313.2697033-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 16:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167792

We don't need to package the open-posix-testsuite build logs. Typically
these are just lines of "SUCCESS" but sometimes there will be compile
warnings, which will include build paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/ltp/ltp_20220527.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-ext=
ended/ltp/ltp_20220527.bb
index b3ef8f59105..e3abfd01e1c 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -79,6 +79,9 @@ do_install(){
     # The controllers memcg_stree test seems to cause us hangs and takes=
 900s
     # (maybe we expect more regular output?), anyhow, skip it
     sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
+
+    # We don't need to ship the compile logs that open_posix_testsuite w=
rites
+    rm -f ${D}${prefix}/testcases/open_posix_testsuite/logfile.*
 }
=20
 RDEPENDS:${PN} =3D "\
--=20
2.34.1


