Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C486CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9390.1777739439843841152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NS/DW/bK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44c350a5b87so197967f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739438; x=1778344238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjzErleXeTsMd7mizI1i3vAzqf3+0HnaCHXZ/In1Cwg=;
        b=NS/DW/bKR8mNBv/2v8SaXSh2wg3ihichC4yxT6Tvil/MqjHnWNJ6RD8yNP54iWDH3w
         W71l56UpexE/6bBFnQiut7iFarYwVwXjoiMiewRB18txAAt2U5sdrjvWlpqN5GW4M0jx
         qL9pZL8FGMuEc1HzAWTLqy/6vmza1IKsqDtoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739438; x=1778344238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjzErleXeTsMd7mizI1i3vAzqf3+0HnaCHXZ/In1Cwg=;
        b=mu72tPG4lWuhA8pt4H9SFeL6oWQygMOXa8VQ4ST6aAN9k7tBwt25pD5AFNbw0hYwj9
         TMzevattLOxMJj+TstgxP0XBuskMFyRQjCD7TXvJsiLpSp+TAiRAjGdaMia56CjAiDDz
         jMQGej+DGAM6kaMaR2HFARIcFENrbRD1djYssq2xVR6L0bQgCHbLHBmyT4q9MHu3U0Mh
         w/bomxtSHNW9v6YNkIGq4huKvzlrdzXrhZ/stM/W20KZpn7F50rVSRc9GnDpUuJkkWmt
         rHjj2rLNNy2mm4P4PpnGmGEWWNHZLUxPR0ixaOdMmDcVTOFXqNPDn/xGWrezeHyHIvci
         Uhpg==
X-Gm-Message-State: AOJu0YzwGih0Tc5RDLLNicNYAuJNU8U1PLryH0zfUEGS1JajNQKmcVYT
	mnITRMND1sLO6SRpbRmtlM0tR9llN/s1ZyTo5hhv7MkD5iQbsuIS+hA+TQtnrqR2t0c99iuHQhP
	COhdfI9oSRRq2q82rLegMKUV2yPA0QmStn/dCPLhQfWUKLn4RIdtpoPKtAEi7g4gXJSa6goCBsS
	Yl9/pdkXgTX0opdH4=
X-Gm-Gg: AeBDieuce7rAY0WvG8tWVQwycfA14J0nHYAni33qnvBTol/5SYo9nSt0TByO5eif48/
	Q4/eBPb8Fb9fFr3ZsWXJHRyHmllIIQA31Sdsv9pdQebLrGdQ0QzPun0emSJ95Agb2FF+xP8ZdkD
	CXJs4viD+Yg7aF80h8cvU+ctRK0sf85MKcSGKHYhoIMo2exEEiZeGNTJWK6mJnmeaNfhj3u+4+S
	dJp/rUCMA+HP8bbGkNPgb/+YXhpR4Q09UaKAv2C9c+CNSBWHP9ZkJPfQp/V96I9wyjITZC6G3J2
	GogtfoI/faCtWfRH/YJePTE1tJ56ehW23p16iNgF1C5nBFhSfzS99Bz0iLmkkZMGJZt7yYhzjfM
	GpSeye6wfw8N7+70a5mZpcE+6zpYnVW7UbUH8RH+X/MLs2rTYlTQIzsXkWErKxPQziwSkuN/HIE
	MtlUWnQv+WRAQoFjtkGuYJCTUFabezBvmh1XikCpNmc2MPIUgYi5YVr1ec8vSc+Kg=
X-Received: by 2002:a05:6000:2011:b0:43f:dc54:9493 with SMTP id ffacd0b85a97d-44bb5495b60mr5159014f8f.21.1777739437772;
        Sat, 02 May 2026 09:30:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/62] python3-certifi: upgrade 2026.2.25 -> 2026.4.22
Date: Sat,  2 May 2026 17:28:53 +0100
Message-ID: <20260502162929.1377831-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236342

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-certifi_2026.2.25.bb => python3-certifi_2026.4.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.2.25.bb => python3-certifi_2026.4.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
index 7034f7a6f13..990e37d8012 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
+SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
 
 inherit pypi python_setuptools_build_meta
 

