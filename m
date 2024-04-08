Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36773C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 13:20:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.106153.1712582413735488132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 06:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=auBB7ku9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4168a5d75c4so3729025e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712582412; x=1713187212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPFqEiBUGZXYeqh1wSwnErJijnMHlYjJb0KWRIqSR1w=;
        b=auBB7ku9Cj6iSQhCWaSqQo35V2R53dU41UfK5ci3e9MErh4sTCH6AkQSm9pBy3ottb
         dt/NtJvU5I3PQXqeLjwzPBYHI24geT9FCnFF9CvFRiu6O3btHMZ5vt5Ool4W7vWlAsQd
         ROVG0xUdacPwGfKTrh5zRi9x2HtkX+T9vRpDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582412; x=1713187212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPFqEiBUGZXYeqh1wSwnErJijnMHlYjJb0KWRIqSR1w=;
        b=Eeo1N3KpGqT0XYFDn5hG/h1Po63zLMPeLqLI7dGjDt/chqQ7dwgt4+tEP9VBr8KWTq
         RZH28KYyUix1HXfblPxhCRIMK7YRiEMrGwgLEJJp9QxhFyqXjbsXMX7skRhl46qMX09f
         Tb2w1Er59TFfF1LLI5t8HsmSDho258IJTiwPgiOakj1NmRA2cYYE54PepvmCxbIZfgJE
         ZZAkMYjJVpmp+V3JT1nV6vyNfmBAuZSbdLRC4N+2ixuB7w6i6SQ7s82vBtjElnHCU+7o
         g749j9N+bsFY3pAwX6Jjm/VAi44iQCsNmzsAQGPgzSY9g+XVHLwff6vKJ4uTfhTPerci
         8Lsg==
X-Gm-Message-State: AOJu0Yz/BWHq4GRI8pCqUkw99meADIczJtDNyai0oOsB4AiPxZvCux+Z
	h88whNSpNS/xhTygGLHq+Zwn2vbCv8p6WCK5IMmeOvTrnycFLJptqPz0zvjMTs1Uh6jS1OwH1PL
	b
X-Google-Smtp-Source: AGHT+IF0t92aurPr/BP5YGaA40agDzjAcwhO91B/RRMmf0vhLTI+Zf+wzr9aciZAZj9urzDJnlSlYQ==
X-Received: by 2002:a05:600c:4451:b0:416:2441:eac6 with SMTP id v17-20020a05600c445100b004162441eac6mr8187354wmn.0.1712582412017;
        Mon, 08 Apr 2024 06:20:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d5:82ce:9fe1:f44f])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b004162b578d8bsm13139748wmb.1.2024.04.08.06.20.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:20:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] nghttp2: Upgrade 1.60.1 -> 1.61.0
Date: Mon,  8 Apr 2024 14:20:09 +0100
Message-Id: <20240408132009.1763710-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408132009.1763710-1-richard.purdie@linuxfoundation.org>
References: <20240408132009.1763710-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 13:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198013

Includes a fix for CVE-2024-28182.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../nghttp2/{nghttp2_1.60.0.bb => nghttp2_1.61.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.60.0.bb => nghttp2_1.61.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.60.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
index cf62c32d8b8..ad85576dcbc 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "625d6c3da1d9ca4fd643a638256431ae68fd1901653b2a61a245eea7b261bf4e"
+SRC_URI[sha256sum] = "c0e660175b9dc429f11d25b9507a834fb752eea9135ab420bb7cb7e9dbcc9654"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.40.1


