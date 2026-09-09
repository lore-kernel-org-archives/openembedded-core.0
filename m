Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF835C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.752.1788986025341983832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kcuHHYW3;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dcff8f44f2so14925415ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986025; x=1789590825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUecncBeesDqZHKvSRVwqCAHdPTBx216kGrwmkcjhu4=;
        b=kcuHHYW31Ze8WA+C/1PcqP/eUSt6g6NbKmz+36JhUqeA9Hd+TRs4xQvzn/odXVMWrt
         C0fpTHCCdLfhbkRENsi8ZuVIpR2J3m73SSwrnzPlm0486qhrd5D0/Pl3hN3v//sTWJoI
         Jfs+dfc9T6ppkEWA39FbrIldFUs+BbfZIddTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986025; x=1789590825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUecncBeesDqZHKvSRVwqCAHdPTBx216kGrwmkcjhu4=;
        b=mpiH3sYGvECZXlXkcUY9u7/d+u+opJ816EcQET9FjfmSiBbzcywsQ+Wo9RI5knqVQo
         lYBrRqvTQTE+r4DzF0iBFfYmjjXLswmY/Tq58hVUmMM4GvJNV+iaHeuIfQ3WYL4LsHtA
         R9yHz6uspkRV2aNoAU7smD2Z9iCS+I4k7Sy4yJ9zd+hmTPLlmZ8vZjWXE287YzN4+apB
         +RWvPT48JA5UWITpMB79ztbkPTTOFU0W8GA0cwpCImwjGEyYoDw+UfUKJnJ2jqtP0WSJ
         3xUpo5RpSLqHloXRgDxxWQJkJwX2SonthsKYk8FmWTuVNq4d6DB/RDTE0qmGiONQXx47
         9gUw==
X-Gm-Message-State: AFuF++kN/WglkSLyI17uZkGQrYgSbQPCYIbnbeEC2/s0p5iqujwBuq9r
	aEOPm51rChXP7YbBUY4C8HVj7hoA7G267XjXVrqkg7IyRsxQTwJY4g+WXbcwdFzf3fZDewrfXXH
	BqbXAdb0=
X-Gm-Gg: AYBFou18FY0ZWwRMcAVa1gVbvrImv+Gsp8zWqcJ+swY9ZTgRqzTPR69XWXCNizesmMH
	snLhPz30qL3xaPAS30D1zZpGSYTELA1b/78AR/5kTWdT+LuAPi+UKK0yNt8G1K5xvnZ9z9nMSxs
	+f9Pqk/N0Au2nYreCrfUkURAvJgnf/AZYwheFbwunejqr+CFR9RwLugFWtbUH8uB75WvaoGNLUS
	zR6xMwUKzwoLQSFphMC55RDrngDWJQfvIxAGU4ddju7kDvUBldYGIqtBcgt+VFyxH9okEipDRJi
	0wcF1xrSBlvOcnI7KpzxXfC2nuMcBuEQC412BaiqsoBpnX8Ho7svwI21BKXChgT0bTzh75cc2Qq
	kMqn2m/7l2wmRdU2yy18GvMvVSYyWtM4QZ2Sn6ivQ9nbtASZXaygxUxkMYYwTF56B6V7kVd6hE0
	q/AR+wZi5ldVSa5ZE/Vh5uvcykc6TP0tMZvOEmE/guMwLgVu3zloKTV/V1t0akfDT+3/HA6+ThJ
	xLuYFU=
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr59579495a91.2.1788986024465;
        Wed, 09 Sep 2026 13:33:44 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:44 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 5/6] curl: set CVE_STATUS for CVE-2026-82208
Date: Thu, 10 Sep 2026 02:03:23 +0530
Message-Id: <20260909203324.765094-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909203324.765094-1-sdoshi@mvista.com>
References: <20260909203324.765094-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245498

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The problem only exists when curl is built to use the wolfSSL TLS backend.[1]
- The recipe is built with OpenSSL and not wolfSSL.
- Hence, ignoring the CVE for this recipe.

Reference:
[1] https://curl.se/docs/CVE-2026-82208.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index a5606c5eb1..68baac1a15 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -46,6 +46,7 @@ CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support i
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-82208] = "not-applicable-config: vulnerable wolfSSL backend is not enabled by the recipe"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.34.1


