Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2F7C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:46:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18142.1754315187908618549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 06:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hBxkXW5Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so23891145e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754315186; x=1754919986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyhNyAAXbAo4145GkTRU1ps4jqUlYkzCQ76tI1a/Kb4=;
        b=hBxkXW5QS6mj24iPk5ho3DErW/etScK719tvD9PPbnfdczyx1AFAY32c7aKpucjSOZ
         4wXxn1ezlAZcULxjA5gJg6IIZcGtkpZDQP0CYQSGEw1AadVGjUEu2GE24+B2wsW6SM13
         krTaiy0yBIihSk7gR3SniuGW3PrB74CJlGW2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315186; x=1754919986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyhNyAAXbAo4145GkTRU1ps4jqUlYkzCQ76tI1a/Kb4=;
        b=wAvVva2hm4jcV4Srf4S4dkWi5QhE4YAUthAMBj/ARAs52EJdJPA2zJotGBpNPYvcUK
         h8Xr87WCjl9L6ABNzU5Ti0M2XZfW4e9Py8AI1DRFYlDFgocDy/FFtyImRpbzmwygmf4H
         HAEPK5u8LsnR3KOuSNCPX4rsQO8tgocyRqmd/tewatt2o25ShvQkkK66ctuQSh6rOvpD
         jhplppCGT2SqJQ9Oo0/ms28WnFmStkSZdMMrJjycOKfar/U0hXcy/nHHGtI9zBhjx3mD
         KestVTfZGtE8sKgjWeQQptU5+wRXIzVDcgL/Ks3FJV8RCX2OmwoEcT02/kOOmUM8pedD
         +Lug==
X-Gm-Message-State: AOJu0YwoYsKjgG3vnTktpTdN9weS9lvsWC5FvBV3CScGyIL+DG+KAtVz
	mGIbv+umH4OCa9PZ+hlbnWwo0jb7AkWKnvmRXMLxGAm/hC5sArCE6YpaeO1oAZgB/IUrEHPRy2x
	J2avF
X-Gm-Gg: ASbGnctFHyfx/t8y/ADlF1VxkBvNAbuf3FdM/pod5dDoIQ9DyV86GUa/mFaUz1OkBvr
	zmpD9tcwFgskHbLXnah21ejqhSPc7oJGcqOZXTQdiK5hhnA0Si1TifsJujbgJ8MbjiDe+zhvG81
	MJdOXNHdYtOJQUnM0O+St7e8EBTTBwtk8gAGZ65+zqz9IMN0/Kr6wCdNkMNT+qzxOQQiZy1U/uR
	9Z8kBppSfjyuv5sNAkR2cZBJrFPGL5rPQ0Qhpi9OA+gAOhSsFUHBADvjcGuC5qFGQLKiHqurBO5
	ahRedgPRMIhh28ly4ezWzPqHy2HA9AXQOZnCVmpBtUlfZGdrUx9o6t/BrIA6/M1keConJa9NY9z
	L1U2e9WasIYLGONn1FTeoK1LctWGXDcIgg4pvNiHfLt8whhPbYc4=
X-Google-Smtp-Source: AGHT+IGgY1rkmWRIPxkBIBomMLDRQ4rTVRlOPJoRU9j/6h8DnmTABMXmUF/0RgDwy4TWG87gP/hW7w==
X-Received: by 2002:a05:600c:1608:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-458b7d10520mr50908305e9.3.1754315185769;
        Mon, 04 Aug 2025 06:46:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b4f9e952sm104869005e9.9.2025.08.04.06.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:46:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oeqa/qemu: Add compressed image types that are now supported
Date: Mon,  4 Aug 2025 14:46:21 +0100
Message-ID: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 13:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221428

Add compressed image types that are now supported to the supported
fstypes list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/qemu.py | 2 +-
 meta/lib/oeqa/targetcontrol.py    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index d93b3ac94a2..769a6fec7e0 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -15,7 +15,7 @@ from collections import defaultdict
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
-supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
+supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'wic.zst', 'ext3.zst', 'ext4.zst']
 
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, server_ip, timeout=300, user='root',
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index cdf382ee216..a9080077e2e 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -86,7 +86,7 @@ class BaseTarget(object, metaclass=ABCMeta):
 
 class QemuTarget(BaseTarget):
 
-    supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
+    supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'ext3.zst', 'ext4.zst', 'wic.zst']
 
     def __init__(self, d, logger, image_fstype=None, boot_patterns=None):
 

