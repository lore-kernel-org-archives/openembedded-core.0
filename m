Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E705EC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2249.1743577875932577204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHFvBkx1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so41793855e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577874; x=1744182674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bPP7tm5VDasDguPU9BUwCA4Q91eiEoe3dXmq9Gq/aE=;
        b=VHFvBkx1vLIzmy7F7MdjYo+rwJ+sZfrUh5QyvAXrL5xJ/QVbuQI10yI05wmMkG0njN
         nNNLTJsHeSYbwsWJA4695+bHl0cmQNT+eT3g5fEUvM+xo5s8RTxRCiCuj5Ci8Tve1hGO
         OL8QbzDU+1mAL8PxGrXYtLjCtX0XIEpPFqobM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577874; x=1744182674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bPP7tm5VDasDguPU9BUwCA4Q91eiEoe3dXmq9Gq/aE=;
        b=TnVggBFI5dYRQmHCRGj2cLmCfEiqCZIDsRRUKCS/Vb3f/EK16G7rSAEeMhIMSWTo92
         C+Wh9pnW3AcIFwXomy4NasYess9Z41AA8FdYsD2if6pEwFnF8cU8EyXLjM7tGQSRXVSK
         JN9wqtJDiBShfT2mopUtJKye9QuKvvkBXySs59RAUynFez4HSHSKdzKTWrAkOL4Iggi/
         haDxataEmQ56iQ9Ntmd4t7Eqz8W0SbLjm8cYbCBwrQ4WQx7SvZ+XniRulfRX7mv6Umjx
         anLpqPLExiRBmTOFScB+rX68ogbXuV2O6LQ4BOK0sh1qVn/TJGerBwB3IHd95L0zFcKF
         HvNA==
X-Gm-Message-State: AOJu0YwF9hGVu5SRq9Y5OkZGZpztCLLmFRrvk16lVxCyNkT0dQE8zkSf
	zSryw1Vd5oGMNxWH4Ir97l3uxizeQNLaTGZqFwr2uv+DGvYQGzkeGc1c6oXJKklvLAVtGVhwAyT
	l
X-Gm-Gg: ASbGncvR4xMUTR68RDkK5MHNTOpqQKPj/PqQusVle5YX31IDHf/tTWdhJvq56aeYUFb
	T1mMfjSodMVYKu/bpN9PsOj062nI9767xCG1NesKlJOFWkx1P6IwVO3/pKevTximUB2ofsjBpGk
	NRuXt30lKecPi/qQhGyPzlByAq/usfwW8o+redoYULKcnPkMCdnVUfriXLpuGs3BMd16DVCB8Qv
	0soZLx1fTvUlF/pu0pqpUZ2WW+FniQw9yOm2E/3BdbM6bOcLIobm5M0iq7wJhUc/7lmX3zHs8hY
	IbBhb513dzhNPk2PoJrrYISVyjhrSUHMoeNwvuWrEGNXaAZRESiRBuiyDNmRmeoLk9TtVIFq2g=
	=
X-Google-Smtp-Source: AGHT+IFtKodUo7xC6vS7BFQh00G+cl7V52XnDFI5m6nPtjXpitAIpkytO5sfoqA9hPeQ4VF/+83Hjg==
X-Received: by 2002:a05:600c:b9b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43db62bdfecmr134006045e9.25.1743577873885;
        Wed, 02 Apr 2025 00:11:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/48] lighttpd: upgrade 1.4.77 -> 1.4.78
Date: Wed,  2 Apr 2025 08:09:51 +0100
Message-ID: <20250402071017.2157620-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214195

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lighttpd/{lighttpd_1.4.77.bb => lighttpd_1.4.78.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.77.bb => lighttpd_1.4.78.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
index 2e248a6b11c..1d9b4e517c8 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce"
+SRC_URI[sha256sum] = "3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e"
 
 DEPENDS = "virtual/crypt"
 

