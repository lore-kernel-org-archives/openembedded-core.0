Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E775CF6BFF
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1460.1767773370126243902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pxjH3Nk9;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso12421175e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773368; x=1768378168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUn3rENbn7HTzGdhT8hQw9EMgGnYycmxd2oxYUY3qsw=;
        b=pxjH3Nk9eQHSWsjGdQMhsz1YSMHgz98MOFI1bq9sm2upFJyDYnkFnBaqLcPKjdepmj
         VAGARz7DFi0DrlFRE9Mysbxq74eBziWaWfzMlnVccsgTCyfaqPH5NtBhlRaEY6CN32Lr
         Cn+PZKbnbo2wJMWl687TGO82G22brwEJkQOrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773368; x=1768378168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUn3rENbn7HTzGdhT8hQw9EMgGnYycmxd2oxYUY3qsw=;
        b=J1pfLI+WQ2KatmLHCPKpsfpzdB/75ptu+nBk5SrVsNaAsXb40455CtOKQoGbjDfmHy
         PaPx0UyRKSiHGWOtGQmeer6pYBauo/PRcGG0BcexwQ8/1Za2Iq0O+OqHYaXi50nsExO5
         psi4Tbnv2l9x+v8AIMwEG93SSVQEsCXp0vNNsd/eQwutdWdQmU0mZhuX0Fmn30nQfPS2
         1yKaoQe32J6qEukVutyfZytCT4xReO9GcMHWDlrMRSIprznjgfyPT3nmPfb0RU7tWfzI
         b351jJ3ldsUIgmEtZApTQS3oGZbMZTOm3uVSV+0iqUx/474tx42GGJA0bI+scooKwk1E
         uUFQ==
X-Gm-Message-State: AOJu0Yx191lKUowmyMA+2lR8FVLPRpoG3zsoPb53DAyuCtB2bO0u7uZn
	IUio5fm/hMu7uRgPo0eyhAzJsMPK8EQ1Vrf4w/79UtPmblkQGuBCb1EDTw9Ox7orRFgnWmQILYC
	0TJ2F
X-Gm-Gg: AY/fxX72nDLf0p1O5Wnl1/j7AfauAb188tAuB4JMbj2oqP7KIZD8Ks+20XRrWDRQPay
	iq4Bexo7xuGosqLE/Nm+r7HuAivxUUUH0AOatmSi12P6rbxkTOw5IlfNGwJQ8qMGEyqwPc3Qf4E
	LigNylraWytiA5+HqSYxML2ts2m3no0PmhjIPJW1OETEPkP08tNJNt0FRfjGqJlXa4YICvi7G5U
	c5HaYOPNMSGpfnkwxXVUU/PPV3W9F6wnjxM/moZIqQ7Skf7uLdYvjyPILpgC3hmFdbDPnlUFrez
	2IMSaSsryBW+17QP7jX43AzS5xJqsjJLCa4z30zLMuP5QgqtqMrN8Y5WAxe01+oKGs6Ui4NsbLX
	fPNSCNHcTyKiYnDD+10MdW0ymMbTcIhpnbpWweaQEOOiGJTgeNwro5biY7N/uVd0rpVWoqfT9iw
	6HofxKZGhGcYX3Ieg7e3l34A8Qn1WeGKd8xS8l5mTCG3EJvtPZ00rXUc9aB3uJBQ/b6pyg6X+m7
	6FYShoxnJkzmik=
X-Google-Smtp-Source: AGHT+IEXeLy5NgK0lcrLv2ruV4KPJ3+OVnUfKm+TH+JHJzSdd9MwsyGzbkIQBbdNvDJazHJAm+Aheg==
X-Received: by 2002:a05:600c:470c:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47d84b0a5bemr14053175e9.8.1767773368246;
        Wed, 07 Jan 2026 00:09:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/11] Revert "populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs"
Date: Wed,  7 Jan 2026 09:08:59 +0100
Message-ID: <e0476e2c2a890ab5797c2195b570372b1fd04be6.1767772758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228957

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

