Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83A9CEFD0D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:47:02 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100229.1767732419661580201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsVeDF9C;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8887e471148so1094626d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767732419; x=1768337219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsCmgxLTmhR7vzse6zQX5HnO+P0hIojb9r6NQIid2cQ=;
        b=RsVeDF9ClUbIjry1UIuuZyRIWU1YF3EKPnAyapfr94x+WYUvX1RrbzwckI4luZFA99
         xWZ4XeA9Hmi7Ioy7vLvEKjaW6S+T/wYbUaTawOeJOB3duLS99uZmKfIHBf57AU2SXLpS
         GIBQpAIQSg4GU2vqESV/nqzjeuw9FqTfYOHoL/GiaDLRdL0GczbkK52zYZWh0LaA6kJj
         ozYhkSSAun1iZPINQVCyY4PH+W8rzSGXgut+kgoRX3NqnRx2fP/ZY0xGW9a7KXQXLrsL
         oG2UKbB3bltuU9waOgdKgc4cbAu2gXJjSBsaU95rjEUmPyWPwlselROwkpd+VujSRLfq
         AA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732419; x=1768337219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsCmgxLTmhR7vzse6zQX5HnO+P0hIojb9r6NQIid2cQ=;
        b=P/4WnC6OlRCT+K+Yd5Hbf7SgmUDNhBlJRe7MdcwK4pCpazuAT8sjwaQLnIvtyBi3aB
         7V2jzcYwCyfCDS0L25fpr52DxMaRiUMzsxlwZYZ8ObwIlDwgifqD+8iVBjzTKOBVMDwq
         3kJoXv72R/rz8xX6pCIbZz7htYLqEYW6GIWw+enjAbEx5k/7NkKah63jdJAO7Pi5RD72
         9IoEjV/dAD4b2uMrg5TFlPmvL2twji9Lwd2tDeqJN0WLYVoU6k50aLTUCAjXuNNOKafl
         XWGK7bwJe2c105GzYszopl6pfNFzF49DhSSXyqMrN5XtXFXF4SelcTSwB7uoM6tQ5EWX
         UHhQ==
X-Gm-Message-State: AOJu0YzHYaYe6jrUvGQ4poUpWx8n91XMOl6EZE/MNt69qvA++LW5XFEq
	NG0LlZq5ZvQSu5jls28EwrK994n8m7ezqlN+2eLx3T997oyjv23cvjp9crts/h00+SE=
X-Gm-Gg: AY/fxX653wi2cHAcSQf2rdLfFUAOiugYkaNr0QrPYeNGoece46Sq6kg760oNivr/Wo+
	sdPYApjp/PNOJKIAsJ0eTVP48YIOAMDCaM811qU6/smG41PQkS593/REv4UqaVpKTye4y8IAzRK
	n2etHb7I5xF1/YTOtRfxH5NNHRb9l0uohKGi06E2RnkodBjE7hpLJhh0YLMFuIEKiBmoCBpYwwF
	7JNUMREx9knqSDr9Q8GuEdsSpKF4zZXYqU3EN/7AreVi7B7WQBpa463eO6eN9MpGJdGorf013Gf
	1PcKcOqcIK9QLQXs8+QbKtXsU+JGnk/H79oRTgxCXwECEeYZSZMLOqG8SeB/TRLKXcnVue83xKE
	yACJKjyzMy/h9WuwVxOPVMn6zKTI4gwD2sAJunVvB7FJwyWwjCzwwRem1GbhdRfjWK/XJg42YHA
	G8V1HiQ/JL8lm84nFtC7efQBBMv3vtsAj7w1A10oEJBoyp/xMa0zkkoZQDELSrayOnPQ==
X-Google-Smtp-Source: AGHT+IGvGpjYJZ2graF7YRLTnPYwkCihjSt5L71yw3wZgYz+uGY0hV2BLTn/BisdAUL1fjKPtFGInA==
X-Received: by 2002:a05:6214:f66:b0:888:2032:4ad2 with SMTP id 6a1803df08f44-8908430f0bfmr2292276d6.8.1767732418603;
        Tue, 06 Jan 2026 12:46:58 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm20361976d6.8.2026.01.06.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:46:58 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 4/4] linux: Add inherit on generate-cve-exclusions
Date: Tue,  6 Jan 2026 15:46:46 -0500
Message-ID: <20260106204646.3417382-5-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
References: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228928

Update linux-yocto.inc to inherit the new generate-cve-exclusions class.

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..f6a1161940 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -5,6 +5,9 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"

