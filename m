Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CBAC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:35:20 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3205.1790156109766193924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xk7QWE+0;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so3556175e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790156108; x=1790760908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl6i2CcSqM0OzLJpdqdWDFQROL/Xt/d0vq4JpJy4UkU=;
        b=Xk7QWE+0VHz5V8YoZCKYZeh1BVWp4ne3NZ4qqzH43Rfw93kt9Cru9p8RzTQik84Odn
         zAUlB23g/rQbQsp6gZQAiNVxir8L5qkz+UqAAggMESxgBXTf2YFjWcQO9KJZ4FrLEJzh
         zHIA0U76yJ4R3uphMy7sO8McSqkIyeR6l+NNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156108; x=1790760908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jl6i2CcSqM0OzLJpdqdWDFQROL/Xt/d0vq4JpJy4UkU=;
        b=yj5OMPMmVK9WNU9DhDqu5ieNoHIJKGxcx88ULH/FOL+qaZPAszTlxMrYJ9ZiXrrl6V
         +J4On1zdPFTzwcKS4Zl2cYxxC9ogiDo3RcoyanVV2OPhhfx/LSvA04oOH6bac7G5lHIA
         nGAb1i5wJPccgTdVCnNpPM6TmsZnKnFNf+BfisToWpGW1UKRA4PH32dCpzKOThJ/XbwX
         xOT2cVjHS1kPRUexZEsq7v61CXsNMus8/ls7uyKDZKHJfQkw5tOR7jg1A3grnBBWfYHn
         8CZLFWr8hOPb1hBj+QE8/8GhV1gIS0EhObxChfo4vP3OAqf+sVauShrWntA8iWlfWn4u
         T+rw==
X-Gm-Message-State: AFuF++n6XRNf2z9Pr4s2nNNHpx/eJNHZcG/sJoT6759RQJlzVUrjeyrj
	B2LJDMG/Qnbt+kfZCye7j0fw3uC3hYeFDrn7pTR6rd+51ym83zJbk4cpWYxuSZgBxn5vIbQMvEY
	JvhCdW5s=
X-Gm-Gg: AYBFou08OZnpCbjGe46xOKLEd3JBaqn/Ku05tMRyMArIqLoisUIJ7YisSCmiE6OWTcE
	QBcvce/hhPeq6Afp1nj96JHxTeGSoojnC24a7FeWvr86dbg5ElcpubP14VYzOOoZj/wcdKMn2Y7
	4SLdH0lrFo6R+PL3YhBRh9jsQIrlZxLNEdu2qd67qDX0Kr3cJg9btxbt/MXfVYXT0ab7BZ+YeAv
	oE+tzPFWrt93neIRWzmbt7sFApUcZNU3OEkDZKQRCP8q5iDGFq4n1+mXwYF7xdiNKSNxeHoKEPf
	jBkQCZ4xea0iWFQA5PSQAGveJlt/Bv6lJtpaE6rkgvl/QfRVXL7TIbwKU6mscZljvuvedQRmUB3
	3XxwhZfhLamzwhoqAf7BBB4WILKSNSmFIRW8O9qYCBswVSQ7p0I0Eeme5C37WKsVGyVjIKieo/8
	pWHCUkfSFjMsC8qT/gHX2MEnS/Nk+rIb0BgACE8hRo5156dSKggmY9dqB4/Uqlcw3Lu8Mnl5ZoX
	j8oLWZuAC/mhBtZFSWGU38SSDDxDsxPMLyvTw==
X-Received: by 2002:a05:600c:3548:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fdee0a316mr25563615e9.20.1790156107600;
        Wed, 23 Sep 2026 02:35:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm15166445e9.4.2026.09.23.02.35.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:35:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Drop wrynose from CORENAMES ready for release
Date: Wed, 23 Sep 2026 10:35:03 +0100
Message-ID: <20260923093503.3490632-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246512

Prepare for release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b91ce3e4371..13c920be6cf 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "wrynose blacksail"
+LAYERSERIES_CORENAMES = "blacksail"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers

