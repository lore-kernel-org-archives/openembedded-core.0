Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30864EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 17:05:56 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.398.1688490349576819513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 10:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DFs9NZrK;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-39ca48cd4c6so4005179b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688490349; x=1691082349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8vFjI3LBnw7MEPveYy6oqhTuoUAhWo43cRktdkMbYs=;
        b=DFs9NZrKTB12+r/TbRhBQKQCMALoE5ekcTYt11WVp3r9TWEjQsJ3EUmILS9af135RR
         4kR7OOpH4O7kvXkXVaGnavCTXPKinGRte6nNM1KLtiTSblyARANPkV3n3JZBZZvrpkwM
         Dqgm5FGkDTT5/YmRXN4cpu/1GxzVdoua03ExQCs36zBa/gPEgjG5fMEAiL+mQlumIEFM
         5l0sXagK9XGSGnVJpEpYzNAHUXX5jUlfCuHaax2CvWkBjhCPlHK3balLo5EJBv2XGczg
         figQSClfy47JIroQMK/D8i+QMf968zYQB+mDZ2TGcbf9+WEgD8kOGt5k51GZ1Sk4U7lC
         D7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688490349; x=1691082349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8vFjI3LBnw7MEPveYy6oqhTuoUAhWo43cRktdkMbYs=;
        b=BwkUALDidTzdq5qPfFw5U7F3xp36Nt7gRbtRpuOmr5Ei5UnQLUNYHlldLvPIR3nNPI
         76HsElD9HgU2iQ3vk6Otn4xowy6GbH+jg76voSAoxbFNsyDdbP1HgYcTLZh2lh1p3PBY
         1TTKvaN6upDRyj1Z85YzntvUdhcqP1pBai7GXQchkgQebjt7fUQvUhV7sez7wb2+HXBq
         sJInZWP6Btd+FrIwESCWcX9QnGXIkgy4dTuZwsuj8MFtEursL8aRJCdJW7NbdtUSbEXc
         DWW6F7Uxq3IoGSUVCHraznlb4Ki+NR+DlXcQvLoG+XEJKGYbQkKvVTM6LpkMDNIlA1kC
         fZPw==
X-Gm-Message-State: AC+VfDwLxqJeJgiaD1QzrY1J8eLiSvN+vj++oMmon1U08jsCZO+D9Im/
	S3tUMD4j0TThvf9z5h31eNQ=
X-Google-Smtp-Source: ACHHUZ5h4Cp5gYA2Y1Fu+mcPZraLcBi7tJKwCfVzseOjbdAc3VDqPHVHZ9/neA+jEVxERVkYCrSKsw==
X-Received: by 2002:a54:4114:0:b0:3a3:7b77:bb2d with SMTP id l20-20020a544114000000b003a37b77bb2dmr11184554oic.13.1688490348799;
        Tue, 04 Jul 2023 10:05:48 -0700 (PDT)
Received: from build4.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id cy11-20020a05621418cb00b0062ffcda34c6sm12699073qvb.137.2023.07.04.10.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:05:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: fix buildpaths QA warning in 6.4+
Date: Tue,  4 Jul 2023 17:05:46 +0000
Message-Id: <20230704170546.1016441-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 17:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183869

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel version 6.4 introduces a new file that need to have
absolute paths removed, so we can avoid the buildpaths QA
warning and have relocatable packages.

We add pmu-flex.h to the processing, and the issue is resolved.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2d803381bb..7d90ac3612 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -383,7 +383,7 @@ PACKAGESPLITFUNCS =+ "perf_fix_sources"
 
 perf_fix_sources () {
 	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
-			util/expr-flex.h util/expr-flex.c; do
+			util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do
 		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
 		if [ -e $f ]; then
 			sed -i -e 's#${S}/##g' $f
-- 
2.39.2


