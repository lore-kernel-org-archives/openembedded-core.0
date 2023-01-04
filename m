Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A738C63707
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9354.1672830355694061789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QS5LwGM3;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so27211981wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WnyahyFgfqPj0UJlsXBRwpuBCnlKGplkhqRX3yC8Fc=;
        b=QS5LwGM31mtBRJrLT9YuX7UMlOaOWeX7tr5oZ7v0Ner/aHZISS8sqzi3pusNXLwhY4
         deRW/rlWBn5Hpcn+5aLauShgIWpdnwzn4Urohp9WmNSJ6yDxkWKapuRDHOW07nolkGwc
         bZUC4hfPt3s7JNGSYbAix2PBFdWJl96fkl3+oWbsLx9ZobLRfe050Wh7WUvVJaIdiqnW
         2+4RaEN6/9hAMgVSPrqdlGAuF+nh1rw3KPwwrBZlc5C6hIzfLFSsj4EU/Db+f/Pz393o
         l6H/ns7qmjzp/eSbEWTBzA6CrLdVt+yGf9rq3LQ10HJT+dTJ1t4jMRl5Qx8Yoffq8l2P
         ENgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WnyahyFgfqPj0UJlsXBRwpuBCnlKGplkhqRX3yC8Fc=;
        b=klBlau64uq+YYimzd050FJRYU4vTTRGWC/psi6AFEt2AQJj7UsmTSljqRumi+4Zjgg
         g+aWollkxrVPJii/rN/rM/G9ysKIshSR8EFIt0Y/TDP3AXtJ0wuWyaRNaRyXY6qjuans
         xbz8DiEZ0fOdfg5mNclQmOFiCgdivrP1Hul0GON16udttCLM7R09IWEg/5CjDsOSInIc
         bhPckzifzzrlSmPnikk7JmPesC3IPE/h4v5ni4M+gyd5H8Lg/Es9x8i4fX6JZTalMG3M
         0zFAKB0x8de3v31WDiqqIGaE50BE9douA95sKrsAuVvXsbpun+CU/34AeUTCofC3LcW4
         rbGQ==
X-Gm-Message-State: AFqh2kq25lXz3nOxEDF4nhs1mkE10YJt9FTPmwEfzYDF9emhAxgSVSpX
	V/Ft3T66AOQrd6OpT+dLkAg05cZb0t4=
X-Google-Smtp-Source: AMrXdXtHhj310Qe0Vn/IT70OiktrqV9sR392cNpfQLIzfKHeQtFfcqGJhoarBzZKdi5Tdhy/dwuL6g==
X-Received: by 2002:a5d:668f:0:b0:24f:dbcd:7726 with SMTP id l15-20020a5d668f000000b0024fdbcd7726mr28446185wru.5.1672830406280;
        Wed, 04 Jan 2023 03:06:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 70/77] libsndfile1: upgrade 1.1.0 -> 1.2.0
Date: Wed,  4 Jan 2023 12:05:41 +0100
Message-Id: <20230104110548.2537259-70-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175455

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsndfile/{libsndfile1_1.1.0.bb => libsndfile1_1.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.1.0.bb => libsndfile1_1.2.0.bb} (92%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
similarity index 92%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
index 1f1a40160d..b8001f4618 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-SRC_URI[sha256sum] = "0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41"
+SRC_URI[sha256sum] = "0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.30.2


