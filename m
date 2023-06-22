Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCF2C001DF
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17340.1687453875155044877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hK80sg74;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-988a5383fd4so160792866b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453873; x=1690045873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3df61MYi+55dGP4LdMIHzdCVPIeyFhIvYYv4ioRG6YY=;
        b=hK80sg74Hi9XPI4HOqfUwIHB5gDaXicq0S3zdsKgRwg3kALNZ76XwEs3BrU2QlYggR
         LOTNMh/R2tAGggreZVpBmaDJUddbVwR3LDEIasblzqxq1rZQywPeQh5gQsPUjrEsUj6f
         NbLd2XxBpqv8gWTWHh4zpw1qQ/cyJnRP6569jIdeK+K6j5rw7r1V0bekT0Rccsd/W0ru
         6MqC9tXWwYHw0NkHJPkun4KZ1cxvm9gZnJcpTiKaGDqrlApDFdeeOqE/hK6FBk+ZKOue
         2t+WZT/OhUqgki8QcT7//cl5lbI0vObqQ/Ubt5vJPquPRkasTAis2pyN9esGe62C0MTT
         67xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453873; x=1690045873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3df61MYi+55dGP4LdMIHzdCVPIeyFhIvYYv4ioRG6YY=;
        b=UvG09f5xmfBKvX+hp+jkaYT3vf6baPhvCDdT8ATkuOhnpE7UyKKYyEELEEbZABybH2
         KeRiTcdFwOc9xq4Qj4QftIElU8k2XQkh2reAMvwIWCKPo9ij2wR6Wio+klLne+tlcCFT
         wq+BXBSHlRBAMFNbD6fSiD63+PcLwXu2UpxSdeqgvOuuuDL3ndBw61cltYJGBVxsBwpy
         uxXnyl/0LgsQQCor6ewMOJws5jlukQmYGk5fn3WzWAmhXL1039eRrV/pT8lhgcGGB0Yz
         0TSNisUaQkVgF4yhHQCyyT68mhsAdmRUqG9HcKEjPmAtczaSkhtL7xanaNxRzcS9wNG5
         XOEQ==
X-Gm-Message-State: AC+VfDyNvrstGl7KWr8g5UGKd0J2z+FmCcEGD3h0CecJyQb9zl0f9psR
	A5/1QIL0r2EKTDCvNziDtjl7W0w5AnA=
X-Google-Smtp-Source: ACHHUZ4hkP4eDU9ng/hxi3O3KJiJsVItyVdYSaV76M9k6Jhc2kJNGk+yoNJWB7aBu6QHqtlUEHJ3uw==
X-Received: by 2002:a17:907:3e27:b0:978:8685:71d5 with SMTP id hp39-20020a1709073e2700b00978868571d5mr19165749ejc.30.1687453873071;
        Thu, 22 Jun 2023 10:11:13 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:12 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 8/9] runqemu-gen-tapdevs: remove only our taps
Date: Thu, 22 Jun 2023 19:01:28 +0200
Message-ID: <20230622170946.10082-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183285

Ignore itnerfaces with other names than what the runqemu scripts created.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-gen-tapdevs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index cbf80089290..a00c79c4420 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -68,7 +68,7 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 fi
 
 if interfaces=`ip tuntap list` 2>/dev/null; then
-	interfaces=`echo "$interfaces" |cut -f1 -d: `
+	interfaces=`echo "$interfaces" |cut -f1 -d: |grep -E "^$OE_TAP_NAME.*"`
 else
 	echo "Failed to call 'ip tuntap list'" >&2
 	exit 1
-- 
2.41.0


