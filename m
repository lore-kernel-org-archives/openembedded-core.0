Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68207C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.92313.1738600928076851956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mw+4+1NA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385eed29d17so2251011f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600926; x=1739205726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrzboxWnPiT1vGn0xtHEIOB59ghNlW1n6IGlv3srRt4=;
        b=Mw+4+1NAq+xoEymgQxTi7uiytluL8h3VTPy6NTlu2IHTpLVU9yuX3ttDaChenyc0aZ
         z04W81ajwdoli6rHbjboK+sP01vi+mbfmZot2hPYN2WuBNbMK5mHmGop05r/Mkifl9yf
         Qin5Vt2vKEUI1cFBz4krzST7wY66foAjEN1aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600926; x=1739205726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrzboxWnPiT1vGn0xtHEIOB59ghNlW1n6IGlv3srRt4=;
        b=Ef5tkCev2yxK4ybVcEk9c6ZHyrhL4dVhAzeOZA59on8+DszJDmJenk8XGGYWScbMkV
         LXyfojGDH417JyoExkZaSk8G3DimzjgSOoZmVuXg4fLlL8VPg7lQsQ13gC3h3GbsBtrl
         sGWXDJE50UcdNsDwtHJyztchQNSMNHP47fCtCOvtoaoyj79gVIvkgQIRVXxhLgFH+3r4
         agpvWL+xgTGWEFRTZVtcbVhGIQicI+rxf9HfBGTQLPDhPL2esuFjvOpDxFregq/SF0HC
         fLm1ZDKjQplTQQZcTG7sdCXXFJ0Tr99lI+mxZgcP4IpcE9tSg2dUL6tx8gipvb9sf31X
         h7FA==
X-Gm-Message-State: AOJu0Yw+cml8dBSctvqXK0uVwU+4PZrSlTJvd/T1K91tLdbQV2q/wnNG
	uznUcPdcYzTg0FRrkVhrFcnLi2iuRqI7r117h4mOJmFGjv9is8s3e5vrJu8AonKd8bqhXQxzgMB
	h
X-Gm-Gg: ASbGncswmefm96vR41sbqwhTQ+NiXXnO3Ze5Oqub1eGHjAbNziKNKbjFmALn0dZC/qe
	uq7Ch5ckRs3GmEQ8wphb84rTmAIK7DBbMxO4DoxngAjvYHWZb8S33XmJRFFBv1xp0/kTwJhbuFA
	0gc1zRp5E9ZZFbhmAYrAZDgxs9CIKBfVF/TFvzKhHzeYeuUSlKUUztUQr/OsITuCxK+s0UM/VzV
	FRfhC2Ug+9XdyI7+etYjtcPdO/0EgMD34F+KYiSgup+JLrx9DtwvS5ShBAf/9gneLsNUvzzr8jh
	WJ+6MpaTlvMIKZdUmIvyfnT5Mc21sMI8pTssUKC2eg0I
X-Google-Smtp-Source: AGHT+IH/KR13/9hru9PTVO5AeR8GmoqNnQrDY4lkmlnHlH5qEYHcZC7uAUxcjpNK73XteGCdfn6jBw==
X-Received: by 2002:a5d:544a:0:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-38c520b71aamr14667854f8f.53.1738600926173;
        Mon, 03 Feb 2025 08:42:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/46] python3-poetry-core: upgrade 2.0.0 -> 2.0.1
Date: Mon,  3 Feb 2025 16:41:17 +0000
Message-ID: <20250203164130.3403325-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210706

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
index 09b1a2340d4..8fb39a7d67f 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f"
+SRC_URI[sha256sum] = "10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157"
 
 inherit python_poetry_core pypi
 

