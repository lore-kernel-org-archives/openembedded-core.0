Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C596C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:24:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.1358.1668021888264666505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9TbmBL2;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bs21so27416025wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 11:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2QGAVzB434ou3/XeQiSufAPQsffYyjAoQaSApkKNio=;
        b=f9TbmBL2OpiLuuSjCl8DfNgcba6nF2frDrMVzJRPcu+ieY9SJ8g9Rn3pKF7WFjVqNo
         GQFom4tK2WSqYvjksQQvxTKdysmolzKqB7v0w8KljWKxs6RtqoDGUBpcE3WrndUQ3Svn
         zoYrPMoCLVmYg7Eczs13h4d4yZu4cBdXRtimUIWBnirLeFQftJFge67yY9UxP0FRazA6
         NfBoIqDLHIgCJ84ArJOytVMnkg5nvxbDR5+3/+aWDvAQe+yJwMdns3ESFyR68/sZVzIX
         NbAsD6sBMVveB5Ykbq/xH5ZA/VQOu5Hxs+oi8HngMO21iah46IRY1PzK6Ql9IH/PbmMp
         92Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2QGAVzB434ou3/XeQiSufAPQsffYyjAoQaSApkKNio=;
        b=vENky11O9uD7Oa3NxqEzsrYkVYJBmiNcn1MhoGl86xueH7mEVrS+IxYpIFAp/lAmIL
         VZ+kgatA0YnU57iu5XqgmWj+3FVBWoJ9d+hzQVRmTnJQbaHTPSb/CGbETF9MvuStUg/v
         jlJNABlnj4uYmajcf3oE5O5+cU1fL9bHMGvxXOaz8mUBd8u1cv718R5rI0F79cRHPow1
         jGTw8X07mPeipLHH++6NVMzE1yDefgVevFbYajTsXbz3lmX758XNQ4zJVVHanfwEpA86
         csLr4F/0kXWdhRCTPpXMMRMdX1Eq0wjNb0eia96+1xYtz7sMfoL8yh4FUPl2tAMXt9M2
         2C/w==
X-Gm-Message-State: ACrzQf0lhFzytrTaLMCoJzxAS9Jrl3cuDxj/IDm53eETTpNg0h5ncdJw
	P6g3mRwnk6rudE3hPlxldFsL6pnfz+M=
X-Google-Smtp-Source: AMsMyM6D2335CR9eyqjGJ4AIRgpCNVQ2POofl2N4SzLaxY9dtAG3s7ZIc1Al/nTUWzVm9SRss5Jbqg==
X-Received: by 2002:adf:fdce:0:b0:236:f543:2fd9 with SMTP id i14-20020adffdce000000b00236f5432fd9mr25797454wrs.511.1668021886158;
        Wed, 09 Nov 2022 11:24:46 -0800 (PST)
Received: from localhost ([2a01:4b00:d307:1000:f1d3:eb5e:11f4:a7d9])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b003cf47fdead5sm2853214wmq.30.2022.11.09.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 11:24:45 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: Re: [PATCH v3] systemd: Fix 252 release build on musl
Date: Wed,  9 Nov 2022 19:24:31 +0000
Message-Id: <20221109192431.1913633-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109002306.853567-1-raj.khem@gmail.com>
References: <20221109002306.853567-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173033

Acked-by: Luca Boccassi <luca.boccassi@microsoft.com>

