Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC684D3ABD3
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 17:34:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.65305.1731346485451433440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 09:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGxqv6n9;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431695fa98bso36984845e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731346483; x=1731951283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHgmGUCtGEyiL5ASqgCrxTFOJUfw12OR+MTOUNBVkYc=;
        b=NGxqv6n99cGa8VlB4FrQ333/hmQCwX+taw34C8msiiskTByrKcpFSdV/RksuIg8kul
         Fxth8aNO4TzF96Z/v4mockX5eAXsSBmMWLxbpU8fB8KM6U/7Lm6U5FtL04u3S7ypQk9L
         osN4d5vsHvAObBFyfSdXixFVAiM2+f9qnaweUJtrWAAk1Tw4UO5zgy8j/8dtVUqjzJY6
         lRKdoNACkjQb4/b5cwZwzcwf6anpJMcLVs5zm25itlVs3e1JEpajT0gXkuZWkgrqpbuH
         8R8IC0qiT6yYGqy9IOTqBWygZi4mb4KnE4F9JIup+lA+FEDkkYFoYhtiuTsNQshZ+snn
         NsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731346483; x=1731951283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHgmGUCtGEyiL5ASqgCrxTFOJUfw12OR+MTOUNBVkYc=;
        b=QXN5NmtFmjRRU6zctG+rpnbVOemr90eKiif1grDuQ/sKRSNUoJKvMTgHduaSoSmVWs
         /GYXJ7cxIbTLmqftzzbqJP1o0DvCxWjbsVyXzyHUrg0KVrH9ycGba9ZizB7cp26CkcNZ
         Jnte4XEVozLNeN2ugt43VgrLJ8URXtk6Q5oKLBH2J6/Va4bpm9VQI3iTDnTuNSGOV2/Y
         iXtTajtAziQ4WoNtBYtoXDVwTpT+91dx+InB+9upYvNkz6/Ujc64I5kc4z4Me5C/a6qJ
         EWiuMRp6/xTG5n9k/0jKqSK3g4RDGxqoJKhbymkCl8TKuVmVU2NNEH/OCn8BqPUBIeQ2
         HcHQ==
X-Gm-Message-State: AOJu0YxV6xzuefzE11lDZBvDha+q9QgBiKAtshmAPd0eAK5idFiFXOBY
	JtmXtS5YERGT8RccXJs/S8PJyT1DDss5vMLx5bspH//K2oiJ0SWyY5bICQ==
X-Google-Smtp-Source: AGHT+IHUQQX9jTv4urHSEDUHhhj24bNU5DoUIL+2QxYKuxLQKv8unhp+eC6/OO4QvDuosJX2WZWZmg==
X-Received: by 2002:a05:600c:3582:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-432b75035camr109806865e9.10.1731346483127;
        Mon, 11 Nov 2024 09:34:43 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b04753d5sm190057575e9.0.2024.11.11.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 09:34:42 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 0/2] Add support for Bluetooth sockets in Python
Date: Mon, 11 Nov 2024 17:34:19 +0000
Message-ID: <20241111173421.44377-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 17:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206963


Guðni Már Gilbert (2):
  bluez5: add PACKAGECONFIG for library
  python3: add bluez5-native to DEPENDS conditionally

 meta/recipes-connectivity/bluez5/bluez5.inc    | 8 +++++++-
 meta/recipes-devtools/python/python3_3.13.0.bb | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.43.0


