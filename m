Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57288C44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1856.1783701428993274554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OefmqOFW;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ba701891so9983085e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701427; x=1784306227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2NMAT89X0pOYDzdDZblvU1/M7EvlW2+wR33hHTCjrc=;
        b=OefmqOFW+Q7NVPFbuu0XbSviyGmkLc32A/B3b4C0oY7iyy9px/2AXlgsC5+HgU80sT
         Ax8pTSQ+R6GIAhLdTYmvc8zUoeHEot+C09JLgwku173/FJbNLgohtuzMgVsrniOGb4yc
         ffkoRyfNW1Y2h//D26Um68MuBGUtes7EDLYnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701427; x=1784306227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K2NMAT89X0pOYDzdDZblvU1/M7EvlW2+wR33hHTCjrc=;
        b=XvXwDv547Up6lGbXxbl4qEaYthvl/W1Mc7gar+3X5Tvj6lYJLCHyO90pVKwRtlqk7k
         hfKFrVvyZ5GuWO/mBYX5QZ6V0DOqZjVwwxBBCDt2gp435jSMTk7RuaBfnbkz5ZF6yP/t
         svKvDEAknXjFJjgJc81nUhpHRT0nEVeilVARaun2oirrPyZLXOpTwRbxA3fcKHVqEvFd
         fbay4sRwWi4ZGPgQVB5To1+K/Yois67uCzMAVyLtNsD0T6Z3+fR73uao6o6QC0LCxzF2
         aDsG4MxhidKCKfagx8VJ/OxCyVc5m/aW2nGub+KiTTrGL8utQl2HZp4amjyp9Q6v82LF
         GeOg==
X-Gm-Message-State: AOJu0Yyl+keXil5pO1Lz5gsH2AtPOX55uqH6jdt4JEw4ujQuKW9c8eLs
	9XKBvi7HQMW0eULnwmVjSa8m9oCYGPQeFeGpnu3pdmx2/EJwI5ElBfXkZc2lg74XSX1yN1jGzAY
	Vz8OvGqo=
X-Gm-Gg: AfdE7clvUj/8bpYgerL8h5g+6knW+mGISPMSWOxNQ1Z8Duph+ISLrOdTD/XgTGsMHLZ
	q1iBSd0//pZ8hs10ozslFdYFO8hsGyAzj8xPFbK/jAhdtLpBg96LQyR+Odn8FrP87QX31sDxamm
	DIM0DRpeksBlX+6DmoywKqSsHqyFsA5d1kAtd+TI3Wu/803AZjmOYn4Y/z0fV47nacM2VqEqWvs
	s1b8Uf/DzVkqLlb59Bxo4tJ4j6b+mXQVggY6GDNvLfZh8lBxee3KVgqiSR19Y176LVlU13iFr57
	X4tSww9aVB+u4kxOYOr8qHFYrBB2YW+y+2zGmCn9R3f7RaergzXd4uAfQ3RKe559hQUd7FcBLU2
	bc46ZIAKPfaGQ2byQNWtiGWbQf7yy6tAX6fZtIln/GSuuQQzBUDsOBfRSYdOI05OUDm0dyMkhV1
	jbgezeKVncegLOe9giEF5tMrkXklRzuBnNG9X2nIXyj7k3Xm6OxypuGCQKB6tQw1rm8BwLoE2SI
	bAUWu2T/5pqMb/CUD6TvNnfMb/SgQ==
X-Received: by 2002:a05:600c:e557:10b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493e68d05e3mr88371275e9.30.1783701427171;
        Fri, 10 Jul 2026 09:37:07 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/18] create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
Date: Fri, 10 Jul 2026 18:36:24 +0200
Message-ID: <cc8896b5a3fcb82570593f5677777422dfae941d.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240670

From: Eric Meyers <eric.meyers15310@gmail.com>

The override was "task-create-image-sbom" but BitBake derives it as
"task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
SBOM in sstate, letting a stale spdx.json be restored via setscene. A
later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
"No such file or directory" on the missing timestamped SBOM. Correct the
key so the image SBOM is always regenerated, never restored from sstate.

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45302ff5cfaf91ece74d4065acf710507f27da15)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/nospdx.bbclass                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e26..cf79ef5b013 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
 }
 addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
-SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
+SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 925dc7c5b7a..6ccb93ba018 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -11,4 +11,4 @@ deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
-deltask do_create_image_sbom
+deltask do_create_image_sbom_spdx

