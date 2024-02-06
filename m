Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE459C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:02:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.18241.1707213736316635714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKRlI77m;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d93ddd76adso4898485ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 02:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707213735; x=1707818535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzYeqZgg1gWY6TwC60aiNk71XhcV8/ICYe3tznAsGWA=;
        b=KKRlI77m/rtcdZgm5rZK0Iw23viSaz1AtliHPazBvcDpKxzCy8s72qtV2tUoU/NJSC
         TumnEvlX9x079wkJA6VuppGG8SNZtiOTlQW3kFLWhFtiX0DjcDBJ4zdHo6ZlTlXFUzt4
         6vAudNoDw39qU+27GBfAzN2b5Ymvt19gJjpt0OOWYMnxG43PGVD2Wz5VErLCeFx/Jhs0
         W6qKhfd07oDp1LMSyHhjuOlsH/wwCYIo+pURBgBpT/JutXDspI0jRsWW3n66GOu1FcDX
         YjMqrWqykvZyUvr3Ull+uDB1tJApbA1O/ptLUl/U7GiI8QQ9pPhyzrE+BnIRG9r3onao
         M9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213735; x=1707818535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzYeqZgg1gWY6TwC60aiNk71XhcV8/ICYe3tznAsGWA=;
        b=BKPnUZVvcEUyUSxpHMKSGtLuXPUQmN/vGhbV/rqC3aaWSxC/zbfw4QGSoqEzHquEo+
         BTlvFav1m738NodRtKJCmJcxkAunxafh0Geux12GsHsIbzV3nktm49VpQluU2EV2QnQW
         9OZzBqtgMYfUt9/ILboCcOpuODEtHT+xRMGZSpyFWoDGREqHRAlc+XQXNhSmyDhoSC1I
         j2OYS/sReMq+dMj7sz6bgek9eJYqhJ5TL97O4JwDnCifb2/AT/DSq1ZK6Zdr5iob1Pp+
         YQmvSm13SJPDgCIvKZaW6HrdpT3K/NXWgUqxpoeJfJok6nh0788tjTVeTjmHe4D35Ikx
         BT2w==
X-Gm-Message-State: AOJu0YwidOyUXTDTiUbvTk7iwBrRyhPhqD/Jk7Yjdorc6W6OsJ0nJpn8
	tQxvFGVQIe8xLKE22ZqbuOOV3thv+IP6KBQd1TqzxKpkd+naIDm9F/wJCnZC
X-Google-Smtp-Source: AGHT+IEs4fkVG3cyt5yQaI1wC2JTH4cmjUGouG/VN7nOMDfBn49pfJ9ctx4WmfdwOYumrOZCd3i/7g==
X-Received: by 2002:a17:903:11c6:b0:1d9:91a0:da43 with SMTP id q6-20020a17090311c600b001d991a0da43mr1321113plh.31.1707213735157;
        Tue, 06 Feb 2024 02:02:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVnHwt1054xa08ycSjeZRFgBFCJ/MsefU/R5WOXvkh82Lc1gZ1tn83LmaT7DEpBltS3xxaoGyKnC0H1VWrqvzeRGeCOH1Oj
Received: from L-18076.kpit.com ([2401:4900:1c45:feed:a533:3380:80c4:e8d3])
        by smtp.gmail.com with ESMTPSA id jz15-20020a170903430f00b001d88d791eccsm1449736plb.160.2024.02.06.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:02:14 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Subject: [dunfell][PATCH] perl: Whitelist CVE-2023-47039
Date: Tue,  6 Feb 2024 15:31:58 +0530
Message-Id: <20240206100158.69281-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194978

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-47039

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 4b5a4a5619..bf81a023b8 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -46,6 +46,10 @@ SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d159055
 
 S = "${WORKDIR}/perl-${PV}"
 
+# This is windows only issue.
+# https://ubuntu.com/security/CVE-2023-47039
+CVE_CHECK_WHITELIST += "CVE-2023-47039"
+
 inherit upstream-version-is-even update-alternatives
 
 DEPENDS += "zlib virtual/crypt"
-- 
2.25.1


