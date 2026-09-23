Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21895C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:20:50 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1799.1790148045478030203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 00:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ih2HhGI0;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so3163765e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790148044; x=1790752844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4rWCWJa/I+RxHaMrlNBXfs6oOo9PsYK0IG+pv5q5yr8=;
        b=Ih2HhGI08H9EBagiWxnl3lrgK6Jb+D5qTfo5aXK5DNfXbOQFiOlsI5rEe2aFZhHCjU
         fYcAA4cWeQo2mhrkgR2w10xAw0r85uiFMJnqdy1QpFF7E76zEqxL+3qg4sHulK7REYMe
         eCQT/z/Y6FLAAlncKK1L8IisRWbemuXmoT/Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148044; x=1790752844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4rWCWJa/I+RxHaMrlNBXfs6oOo9PsYK0IG+pv5q5yr8=;
        b=n5btrJJm5ULTTq6x4tqVUAoljsT3FDExelSLXX2sNAudENd8xHPxYOgfVOe86tgpQg
         M830L+clPWivw2orlwpSuQhOEFI3xdMR94Ggy1ZuvlC9z0WJi4yFjbn7959Ue6mEzBiW
         Xl2IsGQhl7qkuhsfPb4uQ8Juc20c9+a6MUQPoOdfgbk5Jh1RlcldgyQ/A1Xh/9oL5KgU
         42EBCsaP68H58P/MQFnRcO4uPiTGnCRBAk2z/7rd8TsjVHspfbqtN6fJbwmS93+QFQ9z
         j2Dhlz/utUR7Y8poY+eQc+v9Klt+htkNC/uyv/T+iuTruozBlVSOKyhu0eoUNXtW7RWj
         ElfA==
X-Gm-Message-State: AFuF++nMRFR2V1pmKGJcKif0xoNC1bfvH9dTpAbK3LZYFuUFvnKyTA6r
	ILvHNt7Agt7i4iCUpLD00j0j+M7kScLvPE5SHZgHoLGt7Pgay0t/CshzWfbF9NSQIhIg4ZPtYSC
	c5UOP/lg=
X-Gm-Gg: AYBFou2aw7e7IG+HRhRdcW/z8f7KOOI+Z6rzmu4kw76j+mIpJoa3V9lCO/eQPsKZW2O
	tKRdPIoJ0n8540Aoz/PJSfBDRig6IHVzCyXmf1nGR8McmEImNQRATyvICzRzEpbD+ox3tcArE7s
	oDPlThQIa2+Y/CVNMnP45WUxtj4k98yuYAShvHKgmIth+jDmWzrc7pfJUvpPOBg3KHM8SQVxhI0
	kLjmxZJDwLPSa5T8k7v+atuNjf/PVj1ZI0x30WuYibHWzNGoGg9tkpFTBGPyFOmbMQq5EzwV+m/
	kCpa2OZbXcohN8hPC6uA57bDcORkFg/L43D47wHX2NBZSlhNw/v+RR0MFyUI0MpVGylH7BLou+H
	QSxrcglvht634GrO/vLlK0kUjE/zdbTPjiUkTJ3x4bFgU/VqXECF38trbI/FUxQtS+eDSBISabQ
	MBAFQB2Ve5m/MKpGD+yUStQdlvFZs0eD3mVs48XqL38/li8PHrfHPlZBj9mN/UKF4W5vJGDSwRN
	ko7GXVOxAQ4uAjoMLhJLjggsiM=
X-Received: by 2002:a05:600c:4712:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fdf24f928mr19177555e9.30.1790148043552;
        Wed, 23 Sep 2026 00:20:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm5427800f8f.14.2026.09.23.00.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libsolv: upgrade 0.7.39 -> 0.7.40
Date: Wed, 23 Sep 2026 08:20:36 +0100
Message-ID: <20260923072039.3153452-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
References: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246454

Version 0.7.40
- selected bug fixes:
  * improve SUSE product link dependency generation if there are
    multiple release packages for the same product
  * fix possible segfault in the SUSE namespace dependency generation

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsolv/{libsolv_0.7.39.bb => libsolv_0.7.40.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.39.bb => libsolv_0.7.40.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb b/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.39.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.40.bb
index 8215a2fb2f6..96b889d6cd9 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
 "
 
-SRCREV = "2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc"
+SRCREV = "0e6eea45c9ffc7dd0756060f2b0f5527df02efa7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

