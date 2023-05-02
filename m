Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA561C7EE2C
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.304.1683048903010468111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MMYgbr7I;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: ernstp@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so4823107e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048901; x=1685640901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8wG0XMEEvozZO5ppbuWl5GYkYo3AcTbaeHGCUuj2LQ=;
        b=MMYgbr7IoZaEw4c8d9RcuH5YhlpglxHSC8EUZlIg4Qof3Vu2NIQ2y1jO7lYCWzjcPk
         2l77Gga8VgazW79bGVHeQ2yqRMRbm6Ku8QmefiATqF/dt1l7BEWK8g53VJGrk5YKVWpM
         gTvdBb2Kwg87qISmRO28ODWhJL7D3RHwDtDz4u8vNxYDz2KXKrlFaP/Gotb3bQI9mxjN
         6SFBEzhfgP3S436dc9sJdFLggwuHTgghpf50Y4bD5r5Bvqn9uR5VvsSW+4DhaUAAGwtg
         UHp+rIeERz0F++BvfEctsbtrr0tYCjMFKqILcatkuO94P95XqdbcdQdrlo9PDoYu3WWd
         3OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048901; x=1685640901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8wG0XMEEvozZO5ppbuWl5GYkYo3AcTbaeHGCUuj2LQ=;
        b=hLh1NuFv6D+j7pCa8FPEu04q3i9/E7gLY4bRmeowKOTECigAmKtAqxk+evXqANxVvQ
         KktDxKgX92D7tC6/NQyRFxXRg3qCiiFPrEMFarB/BtU+g1HK3zBfyjcFtqO4HCKQ66TA
         VmHvgpE0NvVfTUcfEXE+BCgnFHWc2y1X+shloIErvfrzq+1WGUTpErNd20f1yaxmM5+G
         kulwjt5wsK8HwL8lLt+M+eatleNhT2GgZBu/qxD92GQ7rWj+5qrBAuoKMiKbKseZZGxk
         Nw8z21Q9BZMh2EhRbQ73ZKOF8uVjPL+w05tLDllS7RDoTR3K6+vQIcI0NWSkkt5sHOx1
         RfYQ==
X-Gm-Message-State: AC+VfDyiYewwZceriJMzXdO1LuN79p2dZzcyslqUHKRSQL7WLfFWYzmH
	o23x7eFdZEnLDI+dheXbkbBr7R7Qh12fWw==
X-Google-Smtp-Source: ACHHUZ6KP7y/fIaLSAmmL2RJjA67awCV0M+usCX0+fZ9+9rGlwdDGf7wS/LZISiuWIET/aHLzycdvw==
X-Received: by 2002:ac2:5a4a:0:b0:4eb:40d4:e0d2 with SMTP id r10-20020ac25a4a000000b004eb40d4e0d2mr177353lfn.38.1683048901181;
        Tue, 02 May 2023 10:35:01 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:35:00 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 4/6] python3-charset-normalizer: add recipe
Date: Tue,  2 May 2023 19:34:20 +0200
Message-Id: <20230502173422.1439794-4-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502173422.1439794-1-ernstp@gmail.com>
References: <20230502173422.1439794-1-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180759

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 .../python/python3-charset-normalizer_3.1.0.bb         | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb b/meta/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
new file mode 100644
index 00000000000..9fda99b7ca6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Truly universal encoding detector in pure Python"
+HOMEPAGE = "https://charset-normalizer.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
+
+SRC_URI[sha256sum] = "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


