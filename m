Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A50ACEFD1C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 23:01:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2904.1767740480765429059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 15:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l5tHYLtG;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-431048c4068so155020f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767740479; x=1768345279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUn3rENbn7HTzGdhT8hQw9EMgGnYycmxd2oxYUY3qsw=;
        b=l5tHYLtGU9z1GibtfaPgocU+7t4Xikg/vx50rfohu+/utd0Zy5TRjYGycsVH2fpY4P
         pOnnXSj/hA2A65tPE56k+/4nCLCA6OxF0xSHx5m2Fp2T5yTHK4xvMJlwRYtJIqixToqD
         NrGJtFKxdsKlv4g0tEP8Yc1WVfEwUbV2f4U/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767740479; x=1768345279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUn3rENbn7HTzGdhT8hQw9EMgGnYycmxd2oxYUY3qsw=;
        b=jPT7x1+u8jTfGoaWDFluEggoq3l0iHhtdp5lizvibCAF6Ib7uc1Zm6NAuia+xDaoE3
         7xiiK4D+7jSccIaGtympAtWYwcM51Drn2XL17qg9jSBzdq/tMz1dNwFemn68BtOMzn6H
         FeIiqxgqxEOe/XAXIr7TMF+HkzAaZmDxquPJYM7nQLYAQ3sNg6OKoPh3ku032cKYbB+z
         xwK0DKwGsmFjQjmSK2hmBm2+u+WFozzmh0nD+OnNw1VcVNNW54EMpqBC1HdlqW9eOVk4
         ub1GL6YrFttkLncJFhznpNbNNtR0lX0dHBGHjrlBjn1TYuEECACp3LIxKU3JlpQSvV9b
         2b4g==
X-Gm-Message-State: AOJu0YzJJV3g33m5fjVeEwsfoYYu9erWeQQoxtTjCj1WDxRR8R5qQbYa
	890+qZTn8G1gnhG+Gwz/Ooxhn3lsKh3WSQte+kDmeQHB/Gu8oGXbND0dchAuPNvI8DmnpFVa5ax
	z+ltc
X-Gm-Gg: AY/fxX5e/OtkgGgJWl1p6mZpZmOzMm8mjp6uWvmeS1d5+Od2oSi26eD8+3Ruy16Y7+C
	MTK/cpmgymWliVDcFfV5r58+ZJNDSGTvv6Bn+lxqN/SrU4hhkbMm4mNc0YRJ5eHtA1ghFAhX5ui
	ZlLLN+lucvyI0mn8JI2vRRDRMzoVZRsqOeZrod8MnSjnDbKAw2O68aOY9c4oPTxl2Nefz+u0Zuv
	T8Hdb8/AX/9GWmg5KjMomaAhSJLLwff/0ZyAbnSZR2UWfgXJQbWodJUnzSInQDUf7K6N+Cu0Osd
	Ooaih+rbhEVcutWkgPzXyPyhzi2kmsx8QYroBXjyr6qz3+RhXDYx4loTnEHdn1GVw4D5TW7lgad
	tX5JwjuKFxy7S8w9eEUWGilEPx8/H+YrNILoEv6Ay7rA3MJev+14b72ajKxhnWzkVxvrY87i4pp
	yDMFNlqKjfkzfFCAKzEJXNdJnKdPHmMz/CZPE7zytbNHNTXNSSby8QfQBRMqMgUp9YCNL95e9LO
	3n8zLcgvxDAO7k=
X-Google-Smtp-Source: AGHT+IGBZUBHF4CM/2u46b3iArfjr4fd0FVCxL/P5kqU7mWwIVM9Eg+X9Mrm3DgJWzwEW3Y1LzBdjQ==
X-Received: by 2002:a5d:414d:0:b0:432:5b18:2cd0 with SMTP id ffacd0b85a97d-432bcf99f5bmr4198509f8f.5.1767740478790;
        Tue, 06 Jan 2026 15:01:18 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa006e79022da706e1a0.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6e79:22d:a706:e1a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm6908933f8f.33.2026.01.06.15.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 15:01:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [patch][whinlatter 1/2] Revert "populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs"
Date: Tue,  6 Jan 2026 23:59:56 +0100
Message-ID: <20260106225956.207106-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 23:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228938

From: Yoann Congal <yoann.congal@smile.fr>

This reverts commit 9964fa3da2fa1e7243fba1a826e59f7bb1813706.
This commit was not in master before landing in whinlatter.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2838ca1a03..2859320ddf 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,15 +460,6 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
-    sdk_targets = d.getVar('SDK_TARGETS')
-    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
-    excluded_set = set(excluded_targets.split())
-
-    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
-    # as they are required during eSDK installation.
-    filtered_excluded_set = excluded_set - ext_sdk_target_set
-    excluded_targets = ' '.join(filtered_excluded_set)
-
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc

