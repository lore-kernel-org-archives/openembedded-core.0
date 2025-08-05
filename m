Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070B6C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 16:43:56 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.4198.1754412227506008128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 09:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g0TKcbhB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4239091facso2891236a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754412227; x=1755017027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xI29tis/zq4yh2cJ8xeO6J3AalT9ondU+45XoignnXI=;
        b=g0TKcbhB4lujGERjaevcI+JVE54tMRPBDfDZkboCc4ZnnNnW2mExDODjFPNcphfHl9
         0QpJCW3ZgPwdVRZsjJn1XfbN6e3JiIGiGkNWiRoEm0vblec1ifxoUDB9u8IQkUKWGhc9
         YePNxe2shNWyz1CkvpD0v3O3z0/iqL1FiC/KQcAzoYReN/r3KRhYOiUlF2GT3YDLL/aK
         KFwFBn3WxgyVd+X/X2wmw4wXBlZlZSIqY6qyuPs+RgXtO7WZ7qOvK/GStYAvYqaoPcUE
         iRObl4EasTGG3ZttyOWnjOk0MzLDoTqqHsO9NYCPvM7o6vH1U2J92GEE7A+JXzTv3+Xd
         KSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412227; x=1755017027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI29tis/zq4yh2cJ8xeO6J3AalT9ondU+45XoignnXI=;
        b=g4CLl02GCucXSybhpsWdL+XPFaPFDlMrjJLTZToeB31ssWC/w1rJh8AZSXspEz+bd0
         KmTpFLArGpyTFOytXvZ07rPQazBy/E2m3qEtfX6dGSfIAYK77puf3JJW1zapVPmbm5wo
         2IHx/k2g73SyDiAMWhf/kQqedqnHIxmfEMNQ3J8CwasoW9naRkvElstYgAfmqf0rbQ4w
         aan0Z5BG0yJYLRsOzzN5LxjrSOAcSqSe8drEFzRxo9PpLMGANeTMHi+Zk+GBoYhQLbWr
         0ZlJhcGi1HzrdUQSCV/kBRpBw+l4axPSF28iYPUgvmS7WELBDBWcTqzoUYhK9gIvoIE0
         cl5A==
X-Gm-Message-State: AOJu0YzEn+etECA2zq8anwsr+IxcIT5Skyx7InfQop7y5v2cI0aW7G5J
	ugHtFtkNlwTZqjM6saTQiUKGRDgpnX0Kp/VETN7XEfpbBEKTLe9h6rkU2GyNLFPD2WcKB8TzJ6H
	q3XZs
X-Gm-Gg: ASbGncvXm85i3j6AzPEsKm0cpqGPFxF83QTN/P5PSAst8RFCDp/L43KTgDlWqP1D1O/
	3Svg36jPQqAHWDLetsvQm/s+eL8zIo/S/ZqdEZjg2jKyHpJKlqzrs8/x5pGqsQgIU4EXoiusiu1
	C7kyZEyj2+eHrAPL8pbiqh+I6C6PgdUjaOc2Q57DNl8muS+eaewiyNd0C2KHitZoklSkqMnSA6W
	905RBzncNpjNdMK+wtA/3mz130QjPFZwOEnEhVdBerIFeTTHquBMbl96Pc1lG9writItZJ+BWJ4
	JcP3zQF68TUPLBaqCL/XriQmVCXCSeAqP8vrBAdFUWLBnhVsNm6yxvKP0EENF5OZom8kVs2qsKi
	AJxkTGG2pk9wOwF6RL+M81tQ=
X-Google-Smtp-Source: AGHT+IEMbg/MP+AYbSAV/ZYVugHSm0SNZoMA6ZpEnvXyi9fU3nNShE943SoNVa9bLsyB2Ao9ZZ5/xA==
X-Received: by 2002:a17:903:1c8:b0:240:9f9:46b1 with SMTP id d9443c01a7336-2424701d55cmr194153835ad.37.1754412226786;
        Tue, 05 Aug 2025 09:43:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3554:164c:182:30f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e7d8sm137633135ad.42.2025.08.05.09.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:43:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] sqlite3: ignore CVE-2025-3277
Date: Tue,  5 Aug 2025 09:43:35 -0700
Message-ID: <ebacd5cd2827c1a9a45a92353518f9d976597526.1754412086.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754412086.git.steve@sakoman.com>
References: <cover.1754412086.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 16:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221482

From: Peter Marko <peter.marko@siemens.com>

The vulnerable code was introduced in 3.44.0 via [1].
(See fix commit [2])
Also Debian says "not vulnerabele yet for 3.40.1 in [3]

[1] https://github.com/sqlite/sqlite/commit/e1e67abc5cf67f931aab1e471eda23d73f51d456
[2] https://sqlite.org/src/info/498e3f1cf57f164f
[3] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 86d9b4b33b..280342204a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -21,3 +21,5 @@ CVE_CHECK_IGNORE += "CVE-2019-19242"
 CVE_CHECK_IGNORE += "CVE-2015-3717"
 # Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
 CVE_CHECK_IGNORE += "CVE-2021-36690"
+# Issue was introduced in 3.44.0
+CVE_CHECK_IGNORE += "CVE-2025-3277"
-- 
2.43.0


