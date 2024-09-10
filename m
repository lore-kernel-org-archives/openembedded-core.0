Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81AECE58D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 15:01:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.25622.1725980508424525541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 08:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EA97Lwy7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cae102702so31676915e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725980506; x=1726585306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8dbPzBC/BxoogBmSv3KV/XK7ufrClRF+tFmwbVFRTs=;
        b=EA97Lwy7fQ9sJjPk/HHsVjs1yQ9l/OFNpR3952SMjU77sJPz5Cj8hCnqi4xieDiEeD
         ubisiIqyZiZ0k0Vcsm2xjToamM6sYhZAidP6xx3kUkdniElhxP6kZRZxsLxVoEYL2Dmr
         SC+zInW/qUvuykUjCHwnLOGfDuamdOW9qZjr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980506; x=1726585306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8dbPzBC/BxoogBmSv3KV/XK7ufrClRF+tFmwbVFRTs=;
        b=pcpu2JXjIT57LRI0Kl0LzP4Jd5bWs7SOhTCtOI5zCkPVCVuYa11z4vs3l1Arg31US6
         klrXDqSbSaM6/HXmUFLs/uccXgbRidSCVw+Z1mr6Uy771virfYWnwQm3vjiVgVEvjTud
         UgzbIZE0s+mt8Uzq6oIdpPrFIsHS7mCnCEKZoseghNBURrzmy/SOFnMpZ0zlOK5ALo2q
         3EOs+5XyqUh0tJEOJM8ojosOzNOpOHlVeml8TFMZtEsAup1DeGWbpRoO+dhWSTywDgjB
         NqmaA5GqJ2GL8yLxxnKJ2b7I3DJs6htks2r/ItQyrw4CpsZmPMAftmC4dW/UNMc16nR9
         ooGA==
X-Gm-Message-State: AOJu0Ywbgac1cjsGRspgB1qxqQp1URGbS4g+KcSpRauIPFyGJ1TSNjuQ
	sYAk/7cY6dHH+2DPg1lh1FS/W0VRjq8k9d7DXuEhv1XWKutR+WltSTftMc/KGt8IQPo2PN4dcgH
	J
X-Google-Smtp-Source: AGHT+IGNvp+ddqqpq58uIn1ZFv+cQ8F2rE5hz/KnQ3sCjyZbL4x1VfoKddwxgXvHpsY43qkkEGIS5w==
X-Received: by 2002:a05:600c:1e27:b0:42c:a7cc:cb64 with SMTP id 5b1f17b1804b1-42cae709f46mr79754535e9.3.1725980505472;
        Tue, 10 Sep 2024 08:01:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:589a:f003:f773:164e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a73sm116072995e9.3.2024.09.10.08.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 08:01:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libedit: Make docs generation deterministic
Date: Tue, 10 Sep 2024 16:01:43 +0100
Message-ID: <20240910150143.2816039-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910150143.2816039-1-richard.purdie@linuxfoundation.org>
References: <20240910150143.2816039-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204355

The presence or lack of nroff on the host was changing the doc type. Stop
the code from looking at host paths outside HOSTTOOLS and hence cause the
doc type to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libedit/libedit_20240808-3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
index 932e5a1485a..bf6ec8ebd3c 100644
--- a/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
@@ -15,4 +15,11 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
           "
 SRC_URI[sha256sum] = "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f"
 
+# configure hardcodes /usr/bin search path bypassing HOSTTOOLS
+CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 BBCLASSEXTEND = "native nativesdk"

