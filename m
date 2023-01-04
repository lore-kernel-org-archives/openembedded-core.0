Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0C5C63797
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9374.1672830397768050219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pH077w+r;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so19362315wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFNP9Wyhs+k9/Ssrj8MaSz6GXu60a0/6bssqncgmra4=;
        b=pH077w+rY1JKjfAZAE+nHZRw/dAvWC/x/kT8Xob7UvQkU11Aq2R46kVYcYi70twNQa
         Avjp4KC1RLJrCnyw9TlNmoFMa4xh6I4qVIeB1q+kNZc+cxNBsBRT4zeQr5CcvTawtimp
         IKiBPXORaQP3joQTq+kXMWrVvugV+RzD8iyEiQUd8RM2NGiF7bxpwC7b5ZLCrKjYrJeF
         2w+XD+aSn2P79c56A4bppuXbmDJb2AKQ1OIZhmJRJTZjS06LQXXVpT8sdR64USCfbeOx
         7t3WSFhxbY6cO5OOpQMMQNsxvukWVc1oHl/JJIwE3viq37+nCJb3fDJ6Vta2HDP4sVz5
         Z1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFNP9Wyhs+k9/Ssrj8MaSz6GXu60a0/6bssqncgmra4=;
        b=sUEY4a/WW8CN33H2ZA0ZIvAXGpw3z7XzOuVX/8IMM0SEMQ8tQpoT0jE+5lgNM/Ibnp
         aFtSwQgKxJlrAIC1gsxekIhyC4XlKd+UIKzXzro4ipwJ+auhx6PomWnxyKecFjOtBW+i
         oGGUGzLX3Pq8mr95GO9n8FNEdOPFlo88JpXgvmGY/E4GvNBczRN0uYRC4Dvi8QQ4a3d4
         +mUDXSPXQjHYm0TPzLdhHQkirnU5rZxQmIIKJlnGdEDNH/AGdRtujVXcKMJGTCP3kFU0
         TpdOEjFmVTgxTTeupCVIUbQBwXCZqr7ixMmdy/fXtgtMscXwnG4ggaLbRDwDiCRmO134
         L8vw==
X-Gm-Message-State: AFqh2krzIjkTJ40Y5UbKiCEJa4bKmPL42DV+t1Mrtan6HQBXswdVPTpf
	lgin+GPrNYqbX4dtmh0lmPoieuRdCZw=
X-Google-Smtp-Source: AMrXdXt7h06Es7qp+mmS/7D0w2FaxyZ9M78AKqSYQp2zxLZkIj7x2nzQfnobMtkgPbiGBL8yXjAdNQ==
X-Received: by 2002:adf:f402:0:b0:270:c07e:56 with SMTP id g2-20020adff402000000b00270c07e0056mr24750487wro.53.1672830396257;
        Wed, 04 Jan 2023 03:06:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 57/77] curl: upgrade 7.86.0 -> 7.87.0
Date: Wed,  4 Jan 2023 12:05:28 +0100
Message-Id: <20230104110548.2537259-57-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175443

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/curl/{curl_7.86.0.bb => curl_7.87.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.86.0.bb => curl_7.87.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.87.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_7.86.0.bb
rename to meta/recipes-support/curl/curl_7.87.0.bb
index f5e3e7235d..a3ad66f1aa 100644
--- a/meta/recipes-support/curl/curl_7.86.0.bb
+++ b/meta/recipes-support/curl/curl_7.87.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "2d61116e5f485581f6d59865377df4463f2e788677ac43222b496d4e49fb627b"
+SRC_URI[sha256sum] = "ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.30.2


