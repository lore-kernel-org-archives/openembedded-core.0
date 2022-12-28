Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F667C54EBE
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.177176.1672213055248940389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJyErdnQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id y8so14198133wrl.13
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BVf3SX9v7OgtQKdBPPw/0ZwE2kbMyY4M7w6zKwFVdc=;
        b=TJyErdnQDIG1O7G6/EYgLz10i/TAN6sKyD0y/D32w0Fqe2g7R98z+MvCfhcbtBNc9f
         LYGRixpREc5a66WLeTgb7NDSa94C477MI0ECJrW23MbcL7Ptrztc7RuSvO3ORT1j4aJW
         HpT2Km8rIsWc2uo/8eeGuuke3b0UGIYb/CAL3gSHY5uQEMSx8WH7w0+H0q4D7hjl5OZm
         2NdMmE64MC8oSGRR7X1aH2p4Ote1rB7JpL5h16equj9sq3AvkjeDYLynwnl3UqfgxJf1
         Ty5PJRR2lWEi0it8JgN7mOxFZeKgx0Ca8Io18eIqdR4JufuxTth7V2ZphcE0vBFA6F9a
         6RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BVf3SX9v7OgtQKdBPPw/0ZwE2kbMyY4M7w6zKwFVdc=;
        b=ompX9jVyRqKlPpmvtG5ggzuRQwpWjVWG1jF9AX3X5CcbPqMT663z83y7MREvbymDKW
         2wTUEReryCmxMqyjpwoI9pEMBF1hmL4cJUAxY4pW483jdDZVX9k243XCjCHGAgywsbA3
         +Qi0Yu5NeQ1LxXcGG8uo3WX3mj1aYmtxJ6pOzTwHIHyLqAEHp0jCizCAXbcpbAbx5cJ5
         91nrtgJkJjhTz9tX4AeIL0bErpMKTneq70WhQ/CiPaSpH4ZkiE1IDYk4zArNMBAcjQ/u
         i1WpYFz7ApfClZKk2MFjoJVEKbTPglfCrnrfwrjdyMHXtm665+slbI3dfNUkdnZm11tm
         DzGA==
X-Gm-Message-State: AFqh2kpDaL/qFcUYiMeL5ZfHlbc99enXUGGQLJLUtjUmCesPv5uta10e
	ZWll4NL20RlSyRJl/51ANICmgspSKVY=
X-Google-Smtp-Source: AMrXdXtJ1NT79gvwAGNHe0zk7trxB9YWW7QoKiC8pVJXqEftXoEE91fCWC1kHVMN4rTGDTUG6LN/pA==
X-Received: by 2002:adf:eb02:0:b0:265:faec:7086 with SMTP id s2-20020adfeb02000000b00265faec7086mr15456911wrn.9.1672213053752;
        Tue, 27 Dec 2022 23:37:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/25] xinit: update 1.4.1 -> 1.4.2
Date: Wed, 28 Dec 2022 08:37:03 +0100
Message-Id: <20221228073721.3454255-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175046

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xinit_1.4.1.bb => xinit_1.4.2.bb}              | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.4.1.bb => xinit_1.4.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
index e6ebf273e8..82c0b0d833 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
@@ -14,8 +14,9 @@ PE = "1"
 
 SRC_URI += "file://0001-Make-manpage-multilib-identical.patch"
 
-SRC_URI[md5sum] = "6d506ab2efc17a08e87778654e099d37"
-SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9"
+SRC_URI_EXT = "xz"
+
+SRC_URI[sha256sum] = "b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
2.30.2


