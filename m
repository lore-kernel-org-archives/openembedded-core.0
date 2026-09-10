Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA95C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:33:34 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9073.1789029209407821473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 01:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ff9Wp/3y;
 spf=pass (domain: mvista.com, ip: 209.85.161.42, mailfrom: sdoshi@mvista.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso5563207eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789029208; x=1789634008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6uHyAcWDiRS2B7t/WcCHO7d+U70zrynWpLVatVX6gU=;
        b=ff9Wp/3yh18DQi37Fu5djZG36BiNDG7M1/WBPITV4cCZzg60w+BZUX/KPM0e7gtzwn
         46EwjAmHvgPP/QnS4PXtTshdBldfU8mDyGDyevujA8amH8vA3Vv3wZ0a/woxVmNZnsya
         99HLNAkknc46zG06W7FdFbQA7lx/KKgcF4vPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029208; x=1789634008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6uHyAcWDiRS2B7t/WcCHO7d+U70zrynWpLVatVX6gU=;
        b=mOAUCPlhHH893hJkCUNQHQAW5JDUATljN1HWRAaOVny4QvtoiL0Zud5enwYXES+44U
         0JNVmlf4AyNODY+MRy4FCQasCDtPvReVl81aY4/hxr0yM5PMyKqS0khJQx22MK1kpcag
         /pxxHhaMKMQZAPbuu2W6d3waIwl+qWotB1RZQJ0NUrLsK6C/UikYGa/OF1zua7VQo549
         49e1QsXuto8J1i7hNmyqdSK/AlUMTuT1axqD4b/sDqP7RSvsc1fCVmVERTQS9v3gyf2/
         2Aqa1/jXjW3kHEmR6djQqeAXsDuJpy10HJy3UAbKiLdgf1U/IJC2YUYeZwD7DdvK5KWS
         TKBw==
X-Gm-Message-State: AFuF++kd7UiOTFnQSkUep3W4cJhPIMWfVkN1O9Q66qKG7bIUVSM5iZNS
	uAE3YVZo7ortr9C/AMGHaQ03XbgpnBYV4oZ4xKtERz/I3zM2Pq+nUk3dK0ydasKypwsMSpb4t4M
	FLWCIaKU=
X-Gm-Gg: AYBFou0rNv/AYrMPQCmNeKa75ZTJ8EI9S7T1jAAu1bjqqFg0a84CzLv1XlAR+jotmeJ
	qauqyrkLB8F4/5jhwu6+MuthGlrN5wtphQ7paJqSLlgalNr8MXDDyk8MP3X75VeZm9Hb4o9tpcr
	9YaGQaEfT0UPV1yJ6s6jeqx7lhOfNcUmaTF/vtpIKQNO0MZWuxc2oWcUyrBL+3x5Z/TPqZQ2QLP
	5OGZbeyOsn2i5lz5ujYA6QdI8VF75yoEqM+bSzFwe+KnrfaZxtZH2ZsmcYk9nU26TFKqfgAWn07
	7NVjSFGAf0HNxeMlUBTK8/1rreYdRTvAEvorUzt3K2xXTXt5NJsMY5x3Fky3q+270t7/wMQn9Rt
	jddkgZCtKRb+phIHE+aCFAJiAI4JZVMQt1LTpXYk92lpWVf8iXM23OVA5VpFR3KGp/eHvCMyqGu
	RMICkA3Hn2i2LMGBmaVrVLhr/jg8M5vJkP4qr1Z8XnkBSXOYaDZFptRdxAzGXvskN2gy0LX7A5g
	vS1VSai3o62OttAnEk=
X-Received: by 2002:a05:6820:571c:20b0:6be:e96d:73fb with SMTP id 006d021491bc7-6bee96d8664mr2970987eaf.66.1789029208502;
        Thu, 10 Sep 2026 01:33:28 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm28004672c88.9.2026.09.10.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:33:28 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 3/3] curl: set CVE_STATUS for CVE-2026-82209
Date: Thu, 10 Sep 2026 14:00:55 +0530
Message-Id: <20260910083055.208955-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910083055.208955-1-sdoshi@mvista.com>
References: <20260910083055.208955-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245543

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The problem only exists when curl is built with libpsl support enabled.[1]
- The recipe is built with "--without-libpsl" option.
- Hence, ignoring the CVE for this recipe.

Reference:
[1] https://curl.se/docs/CVE-2026-82209.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6fde65d0a6..04255afa7a 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -59,7 +59,7 @@ CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of conten
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
-
+CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.34.1


