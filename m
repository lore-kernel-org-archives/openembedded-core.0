Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA414C0219B
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.92320.1738600932689952904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H7F/SI2j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so28624215e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600930; x=1739205730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvcUqAcpSOAM7gMJr2E+05J03vki05rmxFsr1wvnXzc=;
        b=H7F/SI2joLbHcVLnS7NuH7UleaTCuc+st7hn5Ahm74aY+lFnYhl7/LMP5WHuvcUnMD
         bQaiFq6OYVTI4IH7/O5QQXZOBCCQBiJASWzZaN3VToJXnkxNKQd8sxbsvd8V6kTh50l5
         UB36VR1+iowWHbQK2bkOgQFOlpg9BZjjY4zU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600930; x=1739205730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvcUqAcpSOAM7gMJr2E+05J03vki05rmxFsr1wvnXzc=;
        b=DCj6gNy1LtNvCJeTZawAfs2huStwzXC1b4BWYLmJTG3dSiNqwYLy1v6237DxVruhv2
         ssKP2z/pHnwqBHgfaKGWZ8Nmhhn8zHU/S3AYRbl9JT3iRtGHeW2CU3Xlbo1WcUvvsrDM
         APFsNJ6MElI2H0jK57fI0VYl7iK8Hc1ZLK28nmikxw1Zpz1CmeXhQ2tpRDkdoF1dYGSQ
         iQpPvom/MfyoYCSKwnHL8sFNqh5CvlDCCQ3RZLNPxVgn1qxvea+H/rhddtDPae72RPZp
         Ew7Z48Up0eanVWwESHoMNbZsHM0fBt1sGrSCzy22qB+CbUWRI21HUoa8O00q0HsbReOl
         9TpQ==
X-Gm-Message-State: AOJu0YxV5XzSVoKZLQOPj0OVJeBdYPmecbnv1kI+D5giIVYGWzfEZk+n
	HVGq5euCrCN4/Amc24WOEc2ZpvcRSnWCSOXJicrL4A6M6B5aTVl/UhKPNJ2Y4b7vPDzQzYOVbHQ
	5
X-Gm-Gg: ASbGncsSwGm+KtfA0f7gZSlL7jnLIXuyKGMZxIG2vxZ/hioNJG7F5tM9yIBoTVczMuw
	VLRIEXRGF0gTG3awaIxcz1L5mZ9aTFqVUXnq0yljzbFH3ZNEkfEoH/tCFZAFWfk45lX0er09V8S
	KQlGgCzNCsi8jIggjQL9KCGxVfIEyCBalrieiFagOX87FMMzaXbB6ogSdVGMoABfKQQBF+Qf7wM
	zzS2RALLtdZ5xQafXb2FLG3wDMh9aVfvV8hj3VLpr/MH6Z37UbmcvPCmS8D2S6wIOVZu2JR3IYY
	2L1pDmj0PLd/q8gp3H6xff1zvGVBxxEVYnjn7ku85L9z
X-Google-Smtp-Source: AGHT+IGpe3OIKJndFU181PtxlOS4YP3cUoR7SbZalJdyMAZYrqokFix0fK1oEyZyl+4oqO4ReM8faQ==
X-Received: by 2002:a05:600c:34c6:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-438e6ed5faamr111690535e9.8.1738600930521;
        Mon, 03 Feb 2025 08:42:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/46] python3-referencing: upgrade 0.35.1 -> 0.36.2
Date: Mon,  3 Feb 2025 16:41:21 +0000
Message-ID: <20250203164130.3403325-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210710

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-referencing_0.35.1.bb => python3-referencing_0.36.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.35.1.bb => python3-referencing_0.36.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.35.1.bb b/meta/recipes-devtools/python/python3-referencing_0.36.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.35.1.bb
rename to meta/recipes-devtools/python/python3-referencing_0.36.2.bb
index 3e2a3806071..388c1887fbe 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.36.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
+SRC_URI[sha256sum] = "df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa"
 
 inherit pypi python_hatchling
 

