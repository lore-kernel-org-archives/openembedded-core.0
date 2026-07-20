Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7995DC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:33:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4619.1784536386528671730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bn1bEmXr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so40308525e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784536385; x=1785141185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GjZIFUiQ82rCFMqGHttyTSaPJrwlXAbWloPu+uE0Ky4=;
        b=Bn1bEmXr/ZvZW3cCyDDEjqUYBeP4v6V/2FXO/UeKeQpNH6NBaER3XPLSI7/1/42Q3u
         +m7SJrLviwu7vI16z/1qtR2e/T+SeffBlCOufzJ6mSi5RyKbKuPOK8xFoLb/SIh2rhsb
         TX9baaIaz6hJ9AZJT+54v3SzQWp0KdnaDSduc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536385; x=1785141185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjZIFUiQ82rCFMqGHttyTSaPJrwlXAbWloPu+uE0Ky4=;
        b=dfeOVJoEpiEcLeHvjUQ/i2m5Tg58uoDpbrvdDGmQQCED+aJfhbPa+HXYszObzc6JQY
         2bXnNAgdVkjOsNHGOV0fcSJS2HVobsvPhtd7BHMOmu4gt0YCDcZRZNkUllnb0GaOC2mf
         oR46XKkNDcGZwqVe6/7NMP1BV6uneCapMbMmRqzCQMUlMxvtVBgUcIkw9dme1+UhmZ88
         I6xI4PVqb6l1GKuKQWXBovbfvDtEJelySULdRKkRwmFPZLJAyzzAljMOuF3UtZ6D2qLU
         gbw3zkwsyqSebWAh7eKsDRdxgKzpM5WoFdq5IISerV5IAB2lYsXLoWIWwhNK4rNgKezO
         +qcw==
X-Gm-Message-State: AOJu0YyT9FN+NRfsCYj3q7kLvbp3YmaSqS4ssaY0yV/m5UJySwedWQMR
	CrwAIynd1ObuxyYywU5ALgj/9isoU6QNPb4xftbM31Pj2iWOXvFgfCgpRhhBnMhii26q1adUqan
	smcIGQMA=
X-Gm-Gg: AfdE7cnAoEd7uYj/59RbnN1k3F6gNAPSERCZb9k5WBB9keQjpmYtbtlfieJgHE5svXh
	uMRmp6bzxYuZGYXKW+Csaa6VdJocYERXsQlgJB07sDBszUCGY00fJngIb7cTU3K3RVmFdDaGaSh
	2f3JCQcU4ad/lF7gay/iPErE7Q6GPKqPKflivEjAw1DscDOfO090dixrAkaZZiYuQUNs5LGVrWO
	rDPMAtm+oGPHmpnGsG1ehDl+IOMOxsjvTqiX+IQNYmIEw1bSxFVGEZxf1/14yn1XhTY0loCLSTX
	PPEkJWmUNejpjDn1oIF4Hco5xIE/qElnUa4WFMZtk34RR1Ryzb1V0ePETHohvbs1os1mAdzSkRQ
	PWKe7Xn/cE7fndKG62DknJfTyqmKfnzp6lrGijOZmwiqd5vjaXaCcKczDNtCVAnFdpi1tEIRQB/
	XpPvNFLq7Ext1zMrNWQ8PzzrcsSCyST3g=
X-Received: by 2002:a05:600c:3b8c:b0:495:5039:391c with SMTP id 5b1f17b1804b1-495503939b1mr102756365e9.26.1784536384736;
        Mon, 20 Jul 2026 01:33:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f231:f082:3d95:2084])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm241732125e9.4.2026.07.20.01.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:33:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3-websockets: upgrade 16.1 -> 16.1.1
Date: Mon, 20 Jul 2026 09:32:55 +0100
Message-ID: <20260720083258.770582-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
References: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241342

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.bb b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_16.1.bb
rename to meta/recipes-devtools/python/python3-websockets_16.1.1.bb
index 0f819aecfd6..2e2eb0c3ed1 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "299468cbe42e2b9981134c7c51d99387d8a7bf562b00183b3eec53f882846dad"
+SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
 
 BBCLASSEXTEND = "native nativesdk"
 

