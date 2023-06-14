Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB097C001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.7345.1686734968845820209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YtZPZMND;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-977e83d536fso72799166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734967; x=1689326967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxM999Z2pJtxumDhwVQPgT+r8Z5UGSwom9Mv8PFtw74=;
        b=YtZPZMND+l0jl5IbNnFKsMTke32pmjCpjnTGpQzuOCTUQYUnpIILf6dUbt0Tn4sbWM
         oOEdwldxlkPUv8iSD6QvZXeMZiyM6E6GcZ2didl8oyZtCEKZZabqpo7KFVhCw6scY64v
         ze/02mwb8MkMDIzsRvTWUl+L2Xwp57t+JkUkQcA6dMQxS7Ru7E9gl5rMz1yXpivDRvac
         meH87Qz4jz1my2ecxjJucdBqOCCj+KiJQvD05kiAqk5x4xF+m0cmyaNBLtzxSU1RYoFa
         XAoAUhX/+rOSey25uvTfM/K/2+ab3RKpotl3xBhb5q8ZrRituVDnkMqmPNNoAbNT5ANg
         diQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734967; x=1689326967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxM999Z2pJtxumDhwVQPgT+r8Z5UGSwom9Mv8PFtw74=;
        b=F8vsMy6HHAUZOUfL6P2PC1dKG58YP5Z4e6cFY/u+cFASWZTf3kc0b6xzyELFXw3NGu
         vG2hVp6F67RmdBitamN1kU9ReaXxyEFaA94wY8hx7679rsonPL71D2ofuIiICnLjvGq6
         xuWQYwf0KhJDBcs77rYaZXZ0FFufDhHgwiyiLPwYhj8qul8NCd9gXcYM2Yvwk5zNpwIe
         gmG8yU+uSuWoddkF93dF93fgDJgs2lYa7bFS21VedNSQGumvrnJjhoExmKn4iu4dyfjp
         clfdoGoFOlmy/yGgsKxZ2rmfdYZKlknwONm9zJTQWfLBIAy5HuTTd6AlOXtdi02K4bvB
         x3gQ==
X-Gm-Message-State: AC+VfDweNMCEhAabx8ssyiJNT0//zsp/ZuwIVA3n68glKLcrHeXwsZS8
	aQRO1hg3jP9ShXRuLVPoQjo3FCmQEwo=
X-Google-Smtp-Source: ACHHUZ4hQj7yZR6pZabDZpamORzv7MvbvHpJoEs1uln7s8Nvae4+3JMvjNoMNEET4EojQc4PKlWhjA==
X-Received: by 2002:a17:907:1c0e:b0:97d:eb04:9bdf with SMTP id nc14-20020a1709071c0e00b0097deb049bdfmr14449104ejc.71.1686734967299;
        Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/55] grub: submit determinism.patch upstream
Date: Wed, 14 Jun 2023 11:28:30 +0200
Message-Id: <20230614092918.4065570-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182752

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/grub/files/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index 2828e809756..852b95a856c 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -14,7 +14,7 @@ missing sorting of the list used to generate it. Add such a sort.
 Also ensure the generated unidata.c file is deterministic by sorting the
 keys of the dict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-06/index.html]
 Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
-- 
2.30.2


