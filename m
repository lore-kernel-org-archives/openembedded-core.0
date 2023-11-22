Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8758FC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.18524.1700657118239540516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWQYbOX7;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a03a9009572so134669366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657117; x=1701261917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NcP/VXozG9LfoelsKgobdvP+9t34jAtx0mBcSR/fXc=;
        b=fWQYbOX7hjm6tLy62Ucgqv92/BKcPbz6XgvBV/93jXZqikhm49je7qlZqN46NgQEzc
         NFpHQhUBuxogcFnFDLsC7M3hNOpBzWxnaFRR9x82Y3rr274BfsVfJjazXN3zoU0AltkH
         Ss4/ulz8AxbyYTcpE7TRjMtBsWAE4tzdC6ci4Pyr/4OpyOfz1qLFX+7aSEWkTtDLg847
         aY/SQX8LodggKqzK4y4VF4kcUv1dJT6gZlogybEvFN6iHzrnXYl1vEV29S9EP5c6jwi+
         UZ5bPUmbWN/CzWwfIZFpcg3rR+/2m72Gd+MhgVuO4C489W+SX4jvP5373nNMDd05NGSD
         ps7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657117; x=1701261917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NcP/VXozG9LfoelsKgobdvP+9t34jAtx0mBcSR/fXc=;
        b=J6qypihdHatefJ7gI2nMyqwMrp1PR2bOYCYQSiliI/RTshWNLAD7wxUMD6pS6GDJCh
         R2SeVHEGanjSw8SgVYUMfwK5GFSjRYIap0ORh4QK3y2PckhgpK3NhiLy9oaLAPytPFxb
         mSbAKLgTeEVSkwzxWaP0tIFuQexOUHrfFovAVWzjmCIPeycVMkBPkngR5rVkrnDNAI7N
         Udridvigz4t74sWy2CqBYR6H/7GjkCxtUnMJIUXGAIbCKrPVUZLFPeBruhJF59qvtiLp
         POrgZ8lr4wALe3KKeZX7A8LD9vilPsCqc2UlpclH3k1gldzUFkS/RQmUa+5VsUgxjg30
         qSFw==
X-Gm-Message-State: AOJu0YwayZ6xw0UyX41BjQzUixQsbZ+bXs0xqZ8mkGzm42DyBThql/eF
	rt06LBTNlrA1p5cvd4fKT177GAHvgkM=
X-Google-Smtp-Source: AGHT+IHG7Jjk7XH7V17exoyXLwXUHc27vBS/Gw/oXDIk8MP//aV8uUSeynuVdLiIm3rGCm1J65CcWA==
X-Received: by 2002:a17:906:7482:b0:a01:a299:fa3 with SMTP id e2-20020a170906748200b00a01a2990fa3mr1692633ejl.8.1700657116647;
        Wed, 22 Nov 2023 04:45:16 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906490b00b009fcf9f8e526sm4323455ejq.25.2023.11.22.04.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/21] oeqa: wic: use just isfile() instead of islink()
Date: Wed, 22 Nov 2023 13:44:41 +0100
Message-ID: <d9c1c98aad5f337e3d53719c4274fea60e772be6.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191088

* with [YOCTO #12937] changes the manifest is hardlink not symlink

* fixes:
2023-11-18 23:48:55,695 - oe-selftest - INFO -  ... FAIL
2023-11-18 23:48:55,696 - oe-selftest - INFO - Traceback (most recent call last):
  File "/OE/build/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/OE/build/poky/meta/lib/oeqa/selftest/cases/wic.py", line 836, in test_wic_image_type
    self.assertTrue(os.path.islink(path), msg="Link %s wasn't generated as expected" % path)
AssertionError: False is not true : Link tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.rootfs--1.0-r0-20110405230000.wic wasn't generated as expected
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b4866bcb32..fdff3e846e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -833,7 +833,7 @@ class Wic2(WicTestCase):
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
             path = prefix + suffix
-            self.assertTrue(os.path.islink(path), msg="Link %s wasn't generated as expected" % path)
+            self.assertTrue(os.path.isfile(path), msg="Link %s wasn't generated as expected" % path)
             self.assertTrue(os.path.isfile(os.path.realpath(path)), msg="File linked to by %s wasn't generated as expected" % path)
 
     # TODO this should work on aarch64
-- 
2.43.0


