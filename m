Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3688C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:19:17 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.27562.1707862749474413396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qg36CiqO;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso6321519a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707862748; x=1708467548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQq/fgAiBn3MnGnm6WSJQVwUXDARnoqHMVynFyYeALk=;
        b=Qg36CiqOd8ua4VuWnMlSuSorQhawFYY4P2LFi/uTxxeHtxJYugqtW6GjIdVSxGT6zN
         UtDIVZ4Jeo2MX03FxQC98cEYeW3T2gfEcjxnaRgxfAIQWZtJFDVwPbvdFk+08spYvcO2
         GqSHytI4Vs+W/sywKe1ypFtsDRR9FV+KZH5qeUaV9PYEhSOWV7P6i5eKrDWyHB9XiaA8
         mhQFVVa2EWagxXTzA8rpTnXl8tre/i+qJ2KJMGJdBduc920Jca9PcLEgVM/xP+B1Fszt
         0klAU1VhAtq1M0wtB91nfq0CubB7eNmj6BzFun6oLwQ694WENlvzYR7Tt8VeBQcdjJz6
         DOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862748; x=1708467548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQq/fgAiBn3MnGnm6WSJQVwUXDARnoqHMVynFyYeALk=;
        b=Z0JrSZSfcm7LIuMjFcRDcj8nZHtDR+S9VsBWHs5V2NU2zkAsr4lQEcz5+FaHrD2cwP
         fByFVknSJVZ/yNC30DvXp1jFtd1wjdzCQQuFntQpOT+ePdm3YGIwC5nAN/joot8+BhnO
         2yXoQWlFsK4DWT7BhY0ZPGuKsn/OaCMjQk1JaNtHGt844KZVJkems3R9zlRjLEhxuaP0
         4wgCGue2WX4I5zoWoIshUefTcTmaN1tQ3VRtelzKsdyVE6BYUGvHuh6x2ZWx24rzWoUs
         bDeeCM8DUzxq7K+fijkIAb80jmp1Zw4XRYcwRqTwgo9mavPPQVCFB1qzDLsc5yxg/cn1
         aEOQ==
X-Gm-Message-State: AOJu0YwtfQNtSJP14pdV2EVDmgU+uw2GthcZkO3XCY1pO8VFtCuSKcz7
	H1Y0tymzLC3qoeNfk3qiH9yXgiCwvtzJZb+wEgN7vh8Ebrkw0xNzTDdsEE6i
X-Google-Smtp-Source: AGHT+IEk0XM+aX84wehr69UXNAd59U3xHL/tGp8fyxVBqXyy/sFCgL9UcNd6D2juLwWWljOG4SGgfg==
X-Received: by 2002:aa7:d354:0:b0:55f:e9ce:7406 with SMTP id m20-20020aa7d354000000b0055fe9ce7406mr628497edr.29.1707862747698;
        Tue, 13 Feb 2024 14:19:07 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b005612987a525sm4027137edx.89.2024.02.13.14.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:19:07 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/4] oe-init-build-env: generate .vscode/extensions.json
Date: Tue, 13 Feb 2024 23:18:08 +0100
Message-ID: <20240213221846.109260-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213221846.109260-1-adrian.freihofer@siemens.com>
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195443

Configure VSCode to ask the user if the yocto-bitbake extension should
be installed.
---
 meta-poky/conf/templates/default/vscode/extensions.json | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-poky/conf/templates/default/vscode/extensions.json

diff --git a/meta-poky/conf/templates/default/vscode/extensions.json b/meta-poky/conf/templates/default/vscode/extensions.json
new file mode 100644
index 00000000000..6d65ba99c1d
--- /dev/null
+++ b/meta-poky/conf/templates/default/vscode/extensions.json
@@ -0,0 +1,5 @@
+{
+    "recommendations": [
+        "yocto-project.yocto-bitbake"
+    ]
+}
-- 
2.43.0


