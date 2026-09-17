Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D7C982D8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:27 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1693.1789682897484171736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FEKEhSr7;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso779575e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682896; x=1790287696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jx06CbSppKSUW9ph1rTd6PV3f+5T3VQKWk+Zqecs5Yw=;
        b=FEKEhSr7m7S5BmKjHWQE502WvgWZ0IhhSy8Dd9vJitanCDq0zVnjDaphQLKszz8Na0
         G+5RvLYp+8MFeQla+S/WaE3VbT/66PbdH/ZoZkQpKkynHkX9BoYNc6+4R9V/0LofbDFs
         +Snm5kuTL0G3vveTrXSc/TGjIsWd+p6vciJoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682896; x=1790287696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jx06CbSppKSUW9ph1rTd6PV3f+5T3VQKWk+Zqecs5Yw=;
        b=KJpMWUhat/NoXbJk4eTYA7qGPVORQYW2gYsY5D/QZWRL/SIqihu3d8Dr/vVH5GP9sQ
         5HrRpMi2QqCe96ox1Jug/ZWdbmLoj+udGpPDoHYbPpmgQSaRxbYXlhxMRN2LR+jMhLrs
         lN0OvDh+s0bLDcD0Rg7NcmaB/uV0LC/zNy8BPMrjPOTrR8hThAyPA9pAhqrSLLMf+y83
         BUsQeG9bT7yDJrMLh+Ys1rT6Dpzf38QpdTg40k+od4vKs53PSMX+ZUe4wujsKmNfio8h
         2sar1Xq/PHW8TeIv05bWsCnzYVza7WXds/vtLooRR4zbqFVlhKdzXulb8c7UljK0l2JV
         ARaQ==
X-Gm-Message-State: AFuF++mJvhiXvQTqQqXsdBxfyzc8erlEU5ylyEWfeLeqlBonmvvaSZ75
	DSkwhsFN5DY390A8HcktkhzTsvdpQTUoV0nMFXsbwcFS2Ksj5ifeh4aOh5gIyQWkLs8gkeSsaR5
	OCKAq1gs=
X-Gm-Gg: AYBFou27tsQOShJyP5I3jxahiWRLvXCZgEJTb9KTBF3KEmuMT5zLJxvyhHwV0OJjUoR
	E7u9xj+iR3sZQeYdb3ZRJrWdBzLOavPIBuqgrRWi2sxd7Pduo8GnyYRud5zMdLqHUbKCYG+eZ0F
	M+3FB3hgvtbiDrW/X8fsjbSo1xSyVZQ3zKg2d1yP0dIxS5P/Hym4KkKftQHSlkca2EIJFRE0WA5
	CayuFGhdQHx3waAUbYHA74EubCWq8v1+5NKNkxMNhfLoOZBixDWl1I/VpgCtuc5/n4iANdWOtyd
	5bgqzVsSwJn5cnZJ2UoHTOd5v1VL5Z9HwS4G/ZkZcxrAdVDRdwZZlmCJnzWYAdU6MWorceDvtZB
	LEqLn/5hmPaNlSnqUA4lbrOsi2fX+Kd6oS0I0Kmii08WXxWWkUmm2CMUaAfe3dxeuVbbMjzGS4y
	VXrWkbjwqRYxRDHjK6Ma3Ehon0FGE1fN04PivUowfhvHYgYI2P85scfnV+xWsTRFBaWJrYcjfmv
	vomokxx8GxiiSGKRlQUK2GnZqFjNzGphMgz44Q4jC6M0kAIOh4jXeBANcfAoBc/SgbBxz0jTBk=
X-Received: by 2002:a05:600c:19cb:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49fc573d965mr3158695e9.23.1789682895785;
        Thu, 17 Sep 2026 15:08:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 49/79] libslirp: add tag in SRC_URI
Date: Fri, 18 Sep 2026 00:06:34 +0200
Message-ID: <842f88435f104aedd9dff2680935d42af3be79ea.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246144

From: Peter Marko <peter.marko@siemens.com>

This is partial cherry-pick for single recipe:
* 00864cf5bcb6d85ec73d338c3e17e263512409a4

It will allow future cherry-picks from mastear and also uses single
filename in downloads mirror between master and wrynose (tag is added to
filename).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/slirp/libslirp_4.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 734e59a59b1..1b45fd32479 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
 SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

