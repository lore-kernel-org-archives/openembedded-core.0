Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BABE7D0DD
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.16342.1695367478139719348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwShZu5x;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae75ece209so37687366b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367476; x=1695972276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb2s+hn5TYNDfCxjCfJm2a0AxFBLeClCE8kgpbMwKM0=;
        b=kwShZu5xYBhbvKAFxVb2ErLA44ma3MvcXiFyGlPaLYf4M/knzmaoMvJ8hYdrJGnylh
         RG57Znio7TsfkFCwpAV3pIcdPDf/Z3oWGs3ehnjEN0ioFqDrKEKMhzHz+EtlMRzKYggy
         DVU3uXcako4fkdynjXXzzEocFOkDSN4is8EIg4AMbaylZqN/hG7ip5vwhyFAY+uN4JeE
         62QTBHisOzdvwcra+2paeYRetZ2Qy+kWWHpBFY5lot+qe9ES3PW+L0kqkT8DT4SlHMsl
         /MGb+XrTLNSDEzHfnDWzzg2epi8RDKArevjzvqeVcdPqI6wEKvH+9ryNu1jpjF6wxNeV
         B4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367476; x=1695972276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb2s+hn5TYNDfCxjCfJm2a0AxFBLeClCE8kgpbMwKM0=;
        b=n6yEn0M0Fq9wNPO1U0uCiiWezd0d9+Egh7KcbIp3s35pEoFmWNSN2wjRRt2uAG/npB
         aGOAftu3YYvKhW4qrL/1FEzUcVa6v1NdUp29uoYKIln+HeO/aoRZg27BwTxT/nN/SAfA
         HodgeAeHTAfAh/+g+s7WUdHqnTwHr7fjpg8aUQo5Kp7imVR7R9K+uXRdWWiodiwOOCm4
         v+EiCXQvc0fRNv5+PNbklfstLqsSvmeodhIirH3plEsvCg8pP0nLetiMCRLaZLWzPszK
         B3xin2k85IfPag38/PK6ziec0amkiS7iZCvGOZQfrizFVs1R8TWjt18sMap0VwbBxFRP
         hUAQ==
X-Gm-Message-State: AOJu0YyDzzHnQyEdolAtmEXI/UFRjYuIAG2GPM1Tv6Kd3CPp8nCb04Cs
	vHtunJUQzfKvas5rno4HvjVRySIk3dI=
X-Google-Smtp-Source: AGHT+IHQcSpg7PDqQ+8VzjEl39Z9c0Jn50e+i9d6gAiTITavHPCu+AHah3cS+NVhT3N3FuQyjcN0gA==
X-Received: by 2002:a17:906:73da:b0:9ae:4cb8:85 with SMTP id n26-20020a17090673da00b009ae4cb80085mr5616053ejl.31.1695367476464;
        Fri, 22 Sep 2023 00:24:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/40] jquery: upgrade 3.7.0 -> 3.7.1
Date: Fri, 22 Sep 2023 09:23:55 +0200
Message-Id: <20230922072431.1481743-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188048

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jquery/{jquery_3.7.0.bb => jquery_3.7.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.7.0.bb => jquery_3.7.1.bb} (81%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.7.0.bb b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
similarity index 81%
rename from meta/recipes-devtools/jquery/jquery_3.7.0.bb
rename to meta/recipes-devtools/jquery/jquery_3.7.1.bb
index eceed9c9dd4..33147b493c5 100644
--- a/meta/recipes-devtools/jquery/jquery_3.7.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "265a924c42de4784cba8fd0e1bd77133bc833ea5f5a31fc77e08922c18fcfa43"
-SRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"
-SRC_URI[map.sha256sum] = "cae47e834ee977975a48c851b165cc52ea916cc968ba7d280b1293f573cd1a48"
+SRC_URI[js.sha256sum] = "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b499f740d6744dc8962cfe"
+SRC_URI[min.sha256sum] = "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a"
+SRC_URI[map.sha256sum] = "5e7d6d9c28b7f21006535e8875eb47e9667852a14c4624eed301c6cea19ae62b"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.30.2


