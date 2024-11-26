Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC20ED5A6C5
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:55:28 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.36124.1732586122724548801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxNw3B+o;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a79911ac70so18281035ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 17:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732586121; x=1733190921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQdGz2Pxdg5jiOKF3MdEDLrd6BT+hD249fkAsmu3ev0=;
        b=PxNw3B+oxBY+oL2z2Q6CGYS736DDPxi7qKINEDZnTucb8FjB1CjWLHvRr6/UqCOHqI
         fiCvh+QvAvzHVLGcFDEPco02AJl72nY/Y7L+O+BvuJYI9JHom3Y3qJAsbpwBnwwI/l6w
         iVwAFVdUMw9eV7M6Zt9Wrw5kHvoTt/YJkj4Oy0NfrKYLCBlN0QYGY4F+sQgm3yzj6XFK
         k2fJ9mQyBkjCRMAarsyjbwoBMo1O/y09Er2h5nuyZdZHDOXYjpfEaYx2s6D5ED03phYE
         nYAUAPGPd1VgbNPovz5Jwf7eSDDwsoEGBiHTvL0yYE1Kgi5xg4ZlE5/woTr+6qRMILbW
         TDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732586121; x=1733190921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQdGz2Pxdg5jiOKF3MdEDLrd6BT+hD249fkAsmu3ev0=;
        b=vruKiUf8FVZVzHz3pg8hXsc57olT0bKpPiI1K2ZINSxS50ugc9ImmvgH9YgkfTEXrq
         hzWiQgn8xjdEkEzkAabCp71ZdxMyyo4Yao5ZrvZzJJpgoKrBxSjVA/oDAa22u5IQSiEm
         PTP3XLTrn7FtUfZclKPUUCduqmU77HNmbzX58tCJIaNWPMuWEFqBaWWl/mC9yhdK5ZuH
         y0rIp11BCytwd7caZYoxNvJepYVxUaEDz9Itc1pHOBKs+BBJIY5eIuS3eh/m8Rr7UJbP
         IazclZH7PUhk6ZPKPXX+ByC3E3FmFoOZ/MRdcczAKFgBR+U5am8E7UMCi7nqqSydUX0i
         fNQQ==
X-Gm-Message-State: AOJu0YwSI6VtOdy7KXlplp679bFIGvaAi+IknL6aFZpuTU8VDWvWTqn7
	C/F6cxeatlbjuZ9rjzRHTKcOfiK/tYz5hDlInNIlfzkM6//uAb2gAWLXXg==
X-Gm-Gg: ASbGnctmpW5qsudJcI0FqFbc2ETiZB1Zu9AWW1TAklIaoWaggyfga2mEFb0/jVOEVx8
	yJxjPGkAc2BeYrc8qn+2myQTXD6Mhoa/LNCSJRLSKbxbtC5CUzCpXbieJcDjNwtDZqqbipCM3LN
	03aWwRLt0X0rRV/mj666J1+YnRlYjB1P2VGZ4bt+u11FCg3ISbv8dyj7fAT7iSq7lysbFWAWTZ9
	HYlIighOLYYZ4g0C/Pv09mRZH9F+4S6ooqYP0M6hOliTTV3VX7bGAJqeo/beYhfUTWTyKl1VH21
	sXx7AQ==
X-Google-Smtp-Source: AGHT+IFDHtEoKWhyWgp11p2lhlUbR9sKN31Kj8oO3hTbn8i0wgCh6I/ZotGYL02TNrxGB3cSDogmHw==
X-Received: by 2002:a05:6e02:18ce:b0:3a7:86ab:be6c with SMTP id e9e14a558f8ab-3a79af54861mr174924995ab.15.1732586121597;
        Mon, 25 Nov 2024 17:55:21 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1ebbbe159sm1635698173.161.2024.11.25.17.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 17:55:20 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] python3: package tkinter's shared objects
Date: Mon, 25 Nov 2024 19:55:18 -0600
Message-ID: <20241126015518.2463257-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207824

From: Dan McGregor <dan.mcgregor@usask.ca>

Seems every time python is updated this gets removed. That's likely
because the tk option can't be enabled in python3-native without
creating a dependency loop.

For now, re-add the tkinter packaging info to the manifest.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 4b7f9cc7e33..3ed99b9012d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1092,6 +1092,7 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
-- 
2.47.0


