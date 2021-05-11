Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.12290.1620737505432187492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MhLQw2pZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso1152485wmj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7d9cGSW+JMvi1CSAESwFGpnspN8AVW0Yo/mfnM3Fc1E=;
        b=MhLQw2pZtHIROmjwMRwcq9y7zoBeJLhik8ciCuBLApIl7swpRBihgKRPMcTNNWHAex
         EHfm+7YKwaYZOrnB04O2VG6SCLsXUwsPPi9b3GP92YeWGr55vZMurCoAychpJcidatK3
         guhszuGNL7toZaefifJ7GQ5H8XBdOtF9aLVfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7d9cGSW+JMvi1CSAESwFGpnspN8AVW0Yo/mfnM3Fc1E=;
        b=Tvqw+Qrq6hW3eP1Go6Sgpg8UCj9Rl9aIK6ty6mG/m9xu/MQXpaqZyQ4NBNnOZwivaa
         ESF3Js6ka4wXUn9ssZFxspOuuUeoLiLxMuSjCLMyHlJERQ5clwHpnwr9Z7L4nq5x+QeD
         m4kzbIscMHu+UF6T7qW+ZCXG48p2kg4RtMrwNzo0wjdV9jJqBYaDgb7/9a8Wy8Q34UVH
         0tFlEQ8FT+71KrQp3Y0yTKHItRK+JOz4RuyDa3tlT5AXzwKWByWL7B4CCxr5NQ25JLB0
         WLcxk/6Mnoq41unIdFwCc98tjsG412i/3jUZ/6cT1OinJZjE4oV3PUlZzS0mKoyUbth0
         ScRQ==
X-Gm-Message-State: AOAM533bbvDgGTWidP0H1lkrygv76nw9d5Mp/5ASCKMUtQnWcYnwyyAQ
	TQAMjXElPNZj7vEXh9SL38qVWsvFepNMNA==
X-Google-Smtp-Source: ABdhPJwtCuta2ydK+DWkwy9gRnd92baceGDXwN4WIdfW0NT/3F56eL/bAMT/yhxPHZOgBGuJ3v/SBg==
X-Received: by 2002:a05:600c:354b:: with SMTP id i11mr1326179wmq.102.1620737503671;
        Tue, 11 May 2021 05:51:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] bluez: Exclude CVE-2020-12352 CVE-2020-24490 from cve-check
Date: Tue, 11 May 2021 13:51:38 +0100
Message-Id: <20210511125138.2232637-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs are fixed with kernel changes and don't affect the bluez recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.58.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
index 186a621c445..eb8475ec1e2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
@@ -2,6 +2,9 @@ require bluez5.inc
 
 SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
 
+# These issues have kernel fixes rather than bluez fixes so exclude here
+CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-- 
2.30.2

