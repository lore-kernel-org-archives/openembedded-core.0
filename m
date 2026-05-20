Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464B4CD5BB0
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7286.1779265275433365107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J9kGH9QF;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2361019f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265274; x=1779870074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1GXrRW342AwGA2SuNA1VeBk7ja6+XtkxSDW1/dFPa8=;
        b=J9kGH9QF2UkRWe0sDPZRdDT68rEvYR5ihSD7ql0KYhlLKkPLse8VXNxPxiAnGRuz5r
         dYViHyMV2+RGZpK4fqgSPo2HxfL1qu95eT1aW2/4yv4bmmBHyh8o8rEbGQbT3gGjWWPR
         RzsRP/GjBRbYxSBX6SDUuvucNIPdfQiFSzWWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265274; x=1779870074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1GXrRW342AwGA2SuNA1VeBk7ja6+XtkxSDW1/dFPa8=;
        b=NHWm5Pq4KYEUUm1IRwVs/biHORfRbCFs4b0qBadyiEYFl9TpjRmdFHrp62yM52c+57
         3kZgp65N//DoerX0/gi42nfqoHR79tDIw4aqRBJIqCLayqX8FWTNs+ek59EhYF7gGK+F
         Z6Lu0IDsLWVY0yIgnhlps7YZzf2/avb/I5obbI2i2EUZAFWR0WMgfJlKUFIhPjmXic/M
         OvU/AK/eOaGW2gs6FG/Q+6Q90aD/lypvfcg1/sUYjakS1XMZ/hB/NBggk+ttEY++OFIK
         /lu2yO+khUVKdM6hXnHBVKnLAI6jsJ6gz6gMovB4XRF8CMxHafYBkZh6aoLd90M0Z9ZW
         9FXg==
X-Gm-Message-State: AOJu0Yy1dG0dfnxi3wtWotl+xYjgHMRjr0ym4O2CvXJ9HEpDyUloczlr
	aibkQuttprOp1UITsiF2dcHk0VVjSblwaHnrIOPgVHhQeRrzrFTPKDqQodBLwUTBV0NjrMyHZa+
	VMpg6
X-Gm-Gg: Acq92OHN83X7foug5yp+PZ7AoEzpTRrlzdv+2BYU8wWNsbVonTvE/7OFSHfSLdc99Yl
	hGfQPboCJC+q8y3uYbGlB72nisEDFDhbP8ApwbHWD1RYbJWl+OhS0y9eiAr9LtP0PD8jVMFObP6
	+bi92fYBbVSIhDp07o0+tDnJLIrQbAoG9JjFZAUJYGNIioYoHp9RPTNWjDyXPDoxlLzX01k9JE8
	VCUNFORuOQKge4eWsTIDvM9pfKPOKHnYsmoH9Zh0JJp1I8jkR6KCBuZ0WWzhTIAYloFfQlfec+j
	TmG3TeEmqGrHe9LteOxanYo+JLWJvDXE0KmXQF79K19yLcWJGX8bSd6kN8ZE9Wfp21pXzomAem/
	YnX7TN4CG3BKyru54I/3+UkjIPH+RD1VqXPWV3dCZvw84Z79fSQLgQXnqvskNVRWvatA/tNclwR
	50FhB5RrFeKvRJd4hkVSDpc5z8CBwPYbcg/yYR3hk9TGayEBapY+Wgk1by8UdYBZgkpNDWSMuVx
	ahDWYNqMPtdJuSI3aOenv4Br4MG
X-Received: by 2002:a05:600c:6992:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48fe60ea533mr341072195e9.10.1779265273750;
        Wed, 20 May 2026 01:21:13 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 20/28] shadow-native: Change upstream status of disable_syslog.patch
Date: Wed, 20 May 2026 10:20:21 +0200
Message-ID: <1348a20d64b400db893ceda947255c68ac3ccc45.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237419

From: Dmitry Sakhonchik <frezidok1@gmail.com>

Upstream has accepted configure option and merged it into their master branch.

https://github.com/shadow-maint/shadow/pull/1618

After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

Fixes [YOCTO #15785]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0ce3150e43cb6fb0d726cf86725715b8fd06147)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/shadow/files/disable_syslog.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61cd..9f8ffcd379d 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -2,8 +2,9 @@ When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
-Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Upstream-Status: Inappropriate [upstream has accepted a better patch at https://github.com/shadow-maint/shadow/pull/1618]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
 
 Index: shadow-4.17.2/lib/defines.h
 ===================================================================

