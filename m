Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D9DC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:25:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.17385.1702031136180853731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=LCA9EJTd;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.43, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c31f18274so8512215e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1702031134; x=1702635934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO+SmRreLpFn5u+XpGHMJFHA0gPtq1Zbvx/YUKobRho=;
        b=LCA9EJTd2wrVhOAqYOd1RdSo/gUdm6DZsQg2iQFwPJpzz0FUKEQ/M0lkSu8wXrhsVu
         8zhYsju3FIkAad6W56PIrDpXyzxd7SHbRzJPUGkrGGUv2a2Q7Z1Elk1cKc04BML643u1
         lYX7zFfqgL3cGx8CxPlENhkS8BlWnB/ACPWqV8Zb/clAUT429mam+BWwulbVB0mIjFaW
         Td/UcpNBzUZBcU6T2F2FxUDBlkHL0BvRC4BCv4/uxRRK6/KteJYtNdyKzaBMXCEjOrfd
         aFfYYTEdsGzNQFqyWjBuTDgGx79qQLkDnpUidm6fUdUD52Q0Q7QmurTQJlXvkQZY2nwA
         b3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031134; x=1702635934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kO+SmRreLpFn5u+XpGHMJFHA0gPtq1Zbvx/YUKobRho=;
        b=So9TbdD9GogPmBh4VZgphySY/eJMOAxWoCD/a6AvqAkbiHVzXU1wzd2jbFwRH0EyWf
         M6xZWI+QZcVLXmDjkq7yQwDx9CVsViV+39JIMwShdeNlaTOwzrI8CJM70+pYwJSFfHML
         ARpLMD2pNARm+0pTJMqJvoejF5RWHtJjTjUPLZq/Fa87SwGHMuhzeweeAezKfrVzziNV
         yd0raPCOfH7VxMCotY+3naBAFuVe7sOx+Ky1VBoQcoXxijPXxUeqESjAgVTB2iNIof28
         MXz+36UdTbkTt3F76RJIim4TeQAPkIwvqJf3ZptibSzS/JpUellPjO+QJv+gQ3xpC5fU
         7jCg==
X-Gm-Message-State: AOJu0YyTX+Y6XTz9NQNTXP4PzHN7rz0zt8UUvmXWiP/GA+AEEeFnyu6k
	NBbSXRayrXhljqDVNtTGxfFj0oLKnfZNTUGRBx4=
X-Google-Smtp-Source: AGHT+IFrO/vv6Y5CXIhUdZNR25N8bN9EbrixbYCzVzWY1KzTfKJHMmFwMgnPTd8r/Z0w+RIjhl6LdQ==
X-Received: by 2002:a05:600c:4455:b0:40b:5e21:bdeb with SMTP id v21-20020a05600c445500b0040b5e21bdebmr2153904wmn.122.1702031134451;
        Fri, 08 Dec 2023 02:25:34 -0800 (PST)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id fa23-20020a05600c519700b0040b34720206sm2401105wmb.12.2023.12.08.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:25:34 -0800 (PST)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Unpack .7z files with p7zip
Date: Fri,  8 Dec 2023 11:25:24 +0100
Message-Id: <20231208102524.1716492-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192035

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/classes-global/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac84312a87fc..0999b42daaa8 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -674,6 +674,10 @@ python () {
         elif path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
+        # *.7z should DEPEND on p7zip-native for unpacking
+        elif path.endswith('.7z'):
+            d.appendVarFlag('do_unpack', 'depends', ' p7zip-native:do_populate_sysroot')
+
     set_packagetriplet(d)
 
     # 'multimachine' handling
-- 
2.39.2


