Return-Path: <wbeasley@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A2CC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:21:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88398.1782724875786927572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 02:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=q+NPuttU;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.221.47, mailfrom: wbeasley@thegoodpenguin.co.uk)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474560436c3so340183f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782724874; x=1783329674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIUbJp6CJYEIs9pPWR4EVebVk3/gE3doWo1aY9oUXyo=;
        b=q+NPuttU/NmXL8BHhF9RlMa3QmhxxL1OjETVmZO1Z1XbUUyY50SN1wr8WTPMVyl0v5
         70sgPv/LTJfNm5J5o+XZ3jiS/fyitdOtxJClY3kotZR/4ghnIrjw8I5bl0T78IAfv02Z
         +LOL5T1lKSloPTmgyZyQLqT1D+o3DUUWPjQzQqLJxBmpCi9rC3YpvTCiKULJ391nVHJe
         J44g37iVvw8djG2bGwGeiQGsDrYbtp2NCQmrTM1jVN0JH6xSgIB8mRpmYNGFrB4xQiqc
         TrhHYnOqLxWjvO/561Q+u3T0LVt0u8B1CMQoR6XfMi7A4W8u+1xjiWF0/WobwmUsS2Sc
         gvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724874; x=1783329674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIUbJp6CJYEIs9pPWR4EVebVk3/gE3doWo1aY9oUXyo=;
        b=O52VCsd5Tm0JsoMe0moGihlCzhYsAcrHGLqfCNxEUc/bAIECa/26MG2Hr55vHQ9cw8
         G11wsAw7V+72MM2P4yynvs23eD1Nmo3mbYdGeM9N57AGDjm+EnNtAOGYUibW7+QaV9Dl
         KYYH238pdhy1QOMzay5PBnwdFNUOG5CCozKPON1fB23GQts3z949Ra7btUVGHc1vP/Qr
         PQMCcubHFRlyxy1avONlVCUKbSM1ABryMdHAdE0N771O6uzzTYR9WdhKzFaUs5R8oiCU
         QRE5hO1ALo3ue1d9d3Dd1a2dAq/PZqGGtqK/bAs/mI6KWEdWdo3C5xqyPekRIuXMzIp0
         e2Ww==
X-Gm-Message-State: AOJu0YzgSfTbc03wiXzLObRQirfi3Q5WlrtZo9ecAu4fGfLxoLELuT9T
	L7pUD33ahQ9v8q+Syo/AzGggmrlnqOQTlWOV7SIYNtSINWSoOPSK1w93LOT+xZgBix5Agz/j/2i
	WlyGWsWA=
X-Gm-Gg: AfdE7cm7WYINKHCjQu2iiH06QNqamaDFNkKOltD+QFlETFIfNYrJM2cdj9y2XvDDkT9
	YSzDbQEwKZx5wyCaPJvUJLk+Q2x2k5OTInF6mzrGauLz3AaRBpESg3MDr6+LUYEXe7PFfRuY9Sm
	zBDeNMsCJgmN/0kCfTRELSoTVsyrJwlt25qAVOGynPaPsgkQoFjkgU5sCPAj4WfBqus2rsIJ7Kb
	/BqQPDO+C6Gb+iXObOg+Pg6C/rzHcS07mEOvrOMfORF3HWkRciFGiYztKsybuLPild9LnfSqDHI
	Udz4Xfo+gW7tRAnX2qF4VbBCc1SNVDE9bAYkCGht3+u/ypAZASKgbYcsbbDtzZ4DklASdiczlEc
	kVu58w5T2hHzx/WLav+6Hwew5FbkA9j34xgyrX/Pm3GZsbyDAjhamH5ACnl01juELHePSyqyFTz
	1xkwdfucZZSNoGpxNCR0MTyp4gs7hqlByR7FCzBR8sfvCclClzyJwon8rbU+paFCE=
X-Received: by 2002:a05:6000:29db:b0:46d:d5da:f0a8 with SMTP id ffacd0b85a97d-46dd5daf20amr17408315f8f.47.1782724873977;
        Mon, 29 Jun 2026 02:21:13 -0700 (PDT)
Received: from will-XPS-16-9640.basilisk-stairs.ts.net ([154.61.152.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm27984144f8f.7.2026.06.29.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:21:13 -0700 (PDT)
From: William Beasley <wbeasley@thegoodpenguin.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: William Beasley <wbeasley@thegoodpenguin.co.uk>
Subject: [PATCH] sbom-cve-check: Fix sbom timestamp mismatch when it is restored from sstate
Date: Mon, 29 Jun 2026 10:21:04 +0100
Message-ID: <20260629092104.104890-1-wbeasley@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 09:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239739

When do_create_image_sbom_spdx is restored from sstate the filename of the sbom
will not match the IMAGE_NAME format as the timestamp will not match.

This causes a failure when the CVE databases have updated, so do_sbom_cve_check
misses sstate cache and is run fresh. This expects an sbom with the current
IMAGE_NAME timestamp.

Revert sbom_path back to using IMAGE_LINK_NAME (introduced in commit 2a80840),
falling back to IMAGE_NAME when IMAGE_LINK_NAME is empty.

Signed-off-by: William Beasley <wbeasley@thegoodpenguin.co.uk>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 451595f1d7..3a9fb39df6 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,9 +14,9 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
     image_name = d.getVar("IMAGE_NAME")
     link_name = d.getVar("IMAGE_LINK_NAME")
+    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/%s.spdx.json" % (link_name or image_name))
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
 }
 

