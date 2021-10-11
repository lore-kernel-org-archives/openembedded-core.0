Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5174DC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.9425.1633945270913179736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=grkK2RnK;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id o20so54023302wro.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6LldwA/MwBqFbm5j/ZGEnYrGFLD3euNbEnuYUAI++60=;
        b=grkK2RnKqqKCfKM2N47iuPb/J81a0VZLHvfTCIhBDlWbiOn0IpDs0NqZTtpDRRkG18
         Bj/3AnwuOAV2qcDQE8KBVwH1Bl3HRfJltzqmd1dZmyp2HvdOQANCvy7w/+GIiXWMcf3a
         sYKhb1lEQnRzRtG8D2Elm+DsePxwdjxVqjNm2JrtzPRmHWgjn2KOCA/LEDzFVJIgcOcs
         tftd38gwbVpbvLmMJYN26b8ryEu6eJtKjmGqE+lhG0Xn+TI+b2nyye9dsdUmkLKvfrGp
         Lmz9DgrXv9YZW4/0yEH1TV00aO1WqtOwo1UgxeCIqgaYNb8A6VDz7mUhJ2f58di7W8X3
         6H+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LldwA/MwBqFbm5j/ZGEnYrGFLD3euNbEnuYUAI++60=;
        b=hmuRwnuvgTfrjjmb0mkEkHH8J6WTvArEQFtyHjaLkymk6OM2Q/r6ccDjtbCaQ9WoSa
         zExhaNvdcyugafBMGbDmxFYpH5gbmEv8vUgtUb4QG8E386eNHKX1Hw61jcV6KrmBg1sC
         ni5n/IoXPjWiaSS+rr5ZF+6T2S1L5lJGLsKOQS9BEHii+HMVMf4twfChB4kxBEmqEsoh
         U3lD1ZccWBTZScX4nL4Kkx+Qy6vcuwwfGbes7yCOMNw4qGp29N0VFGQtFulQ+pkAqQz0
         470R3iZlpTL3NsI4hMVxkVPpt6Bc7Qp3ArO7/ZqdBdlFahiboOQbvp9Tt2xnDULs9Zu5
         0jPA==
X-Gm-Message-State: AOAM530jcdjuqmj2qpSnJvq7FrEX5EDl5SvYfFKgQFixFhvwFksuQhSa
	uFNGk3851slMh6HNUQF1GLZbs2CH6yU=
X-Google-Smtp-Source: 
 ABdhPJz5WooYdGLiMDLj0o5g3wyvdFEGhyK+BCa3HHydyl4TSCv0OoxKFLna2PnT2T8G2+OsjFCQiA==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr4773603wru.290.1633945269517;
        Mon, 11 Oct 2021 02:41:09 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/25] ruby: disable openssl extension
Date: Mon, 11 Oct 2021 11:40:44 +0200
Message-Id: <20211011094059.4184654-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156823

It is incompatible with openssl 3 in currently released versions, and given
very marginal use of ruby in oe, I do not think not having it matters.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index c953a270424..2b5caf35f56 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -37,3 +37,8 @@ do_configure:prepend() {
     sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
     rm -rf ${S}/ruby/
 }
+
+# Disable openssl extension until it becomes compatible with openssl 3
+do_configure:prepend() {
+    rm -rf ${S}/ext/openssl/extconf.rb
+}
-- 
2.20.1


