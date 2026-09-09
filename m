Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC83C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:53 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.753.1788986027543808802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RRz3eymY;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso6072423a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986027; x=1789590827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tKcTJvvxst+yCS+eA60gLgVmiAFA0rAiCyluSFDnAM=;
        b=RRz3eymYcEGjJvSRDZoB/YheIsKyIcaQxvnuh78nvGQYKR6KKOw03x4t8qiswsr6ed
         4sM3MgcUrHuloBvgGB4jAgSivHLs83Jh4lXhsPMuwSn2dJM6xnv3ABKY6R8UYsOudKP6
         1I8fMdc+ZZqK4TJCr15dWAJAMovQ2skjgfjp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986027; x=1789590827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7tKcTJvvxst+yCS+eA60gLgVmiAFA0rAiCyluSFDnAM=;
        b=pG96R0LLHHKMrzHrOgCZNfW2k4ISh3r/Yyx99XLN9AioMxQsHic/6ojTHxvOPFaqfM
         iFFijiCc/W6CF24B5zW4O41xO+RHTyRX6m/+AK94Ox+Syr3IlZUKWOvyVpA/UPsEYib8
         sfBGrytzGfgnbu02m3okhLGV7bpVBf0N5bAlmLH9ja0DU6vL/FUb4XbTaT6tbwUpwdV6
         sE0oqtgFIrDoh+q9zwytgfrsZB0mJ9rG5Y+pikoZ1RVsW8obFPh5HEWstx9SgDcdBp+L
         ydVWrYwjx5xglCw+funve56l8ARmqO5CU4eXeKtVrjiiGwmIBeTByH7NFhm0hoyCIhF1
         g+ag==
X-Gm-Message-State: AFuF++l+9B1o0xSOKgDf2Q4STMzVsT++w1zAMkqBSNExp8UZnUlusgSr
	jOYvnWye1d/P/eXGj2w3kuGccX1kGYsciy7acN/TFCgKBSH6pVxa1YMwqCVorjbLim91rmmnPv2
	mz/CN
X-Gm-Gg: AYBFou01gxYHGNCUntlMKDRbcD7fitAc4Htlk1FjRcX4pgYnTpncNmCQ7bdpSpHbAU5
	PGr7naP+5GCj7mY0uNzbsXEgo8dXy/h0EG5V74J+XUvgVOD/jn5qIiGNfsNoidQ6tnd9LaR5HZ8
	AZ8kSYZdkJZyqDRCp7vcv7XStYaJWne09KZCGo9SF5vOjy9LQmRRsA4bAeZVk9FVtNZCv8TbKr+
	Sk0VtqFH08qxS66ZJjwWnW8hs4HMxU1HL6Bail0qekwQzIzE5hyo/UTFB/Dt2LxOC6nF451DZkn
	nlFSzQfcgtOs0V9/BDWZyop7MroDUsBA8bhv7rfFS4l2p6CqWDXGcMeYzmtAO0nxZYPzXxGFKFD
	Q+ThSz85W1Ld4mlnK9+G1OZu84obLqzL5q2q0KdbfpjHIj8y6sHDOXNlRpAnn+nZ/E4my4q84FG
	yLt+VAyalYRulnVGjDgdeKGkQKMtA8sX5WnTGVND5KmZE+q+cNmJfnMgXSbNMpCsquU4TltZhnP
	Nt5WeM=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr52132691a91.25.1788986026933;
        Wed, 09 Sep 2026 13:33:46 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:46 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 6/6] curl: set CVE_STATUS for CVE-2026-82209
Date: Thu, 10 Sep 2026 02:03:24 +0530
Message-Id: <20260909203324.765094-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909203324.765094-1-sdoshi@mvista.com>
References: <20260909203324.765094-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245499

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The problem only exists when curl is built with libpsl support enabled.[1]
- The recipe is built with "--without-libpsl" option.
- Hence, ignoring the CVE for this recipe.

Reference:
[1] https://curl.se/docs/CVE-2026-82209.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 68baac1a15..2ba3708714 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -47,6 +47,7 @@ CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', '
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 CVE_STATUS[CVE-2026-82208] = "not-applicable-config: vulnerable wolfSSL backend is not enabled by the recipe"
+CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.34.1


