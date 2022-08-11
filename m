Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E32C48BEA
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.2536.1660247897885408748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+dF6pWQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z20so22353600edb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AtkvL6iJWSNFiz7OB7TXQQtoYzQaYLAM1KWzt0KKdpc=;
        b=o+dF6pWQja5aYkssZtn429+SoVd84peajkLTR7/Gp71dG2bw/5vMVq1yj6pp0K8RYC
         jW9bMmSs8nHSkltElXzPqRAJ0FU8TLPXFqcsvzt7jV88/WT9E8Wq+qMh8uWrKAyE3AKe
         4/mtGC0roBGqw6qiTe4F7ePHsyY+2Ta54sNxSbsSCPKbVDU25tR+64eepDQC5fohx/Xn
         Q84FbSEUb8L5RQsdvaSCkYNgabiQ+9X2nbUEb52jmvX3S8GXMtIAlRV/GCf0j05p8xFl
         I1XtgnkEG/86mVAFool9UrzV8K5Q6aXW7n8jnEY+HHjCsXOpYBlW6vCnnxnTiUuk3TUN
         T/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AtkvL6iJWSNFiz7OB7TXQQtoYzQaYLAM1KWzt0KKdpc=;
        b=aQr4FPal/rmjQs2fvhUW0tWkpdsOHoTLzzLFavoMekWr8Gsftb0mnVKpGad1kz3KRD
         YckFzc0cCL4EfSOy7IrlMtWIr5z22Zn7A+QPOKXwgUR2avnKAze+Z2NlEqtpI3sC5Y1W
         l/h9lTIYA1NDi2VDxn57oPv5TsOE3MxAG70kUNW4CGGWvAX6qFVIqqVpHsgBSsc811Vd
         OSR/L5V2F515wc5y++mbI4lAMm9aNmXawWqE25iXJG4BeN0NJ4DOWQIU9nAg+/mx5Swt
         fiZfNM5qLRZ2ZO5uJd3L42k8rcF4zJHqlhfYiyxdCYKqmYX0QN1PaVgBm6Bo6Mf8fQEk
         Ya/A==
X-Gm-Message-State: ACgBeo11MGg1kxL5D8D+zPJ5i7Fy55Jzy4NIlO2Yas/dnEYoOYAPWBEQ
	y36d583Pev1Ox5MT+2xnLM1BiX3b7SA=
X-Google-Smtp-Source: 
 AA6agR66cgDOdelOF47+NQZCS39YU6pX+bDWUVev5S0nblTMOTo+mCvqFnETMqDgaKUKc+sVNFSLjA==
X-Received: by 2002:a05:6402:194e:b0:442:c81c:ca25 with SMTP id
 f14-20020a056402194e00b00442c81cca25mr641963edz.137.1660247896294;
        Thu, 11 Aug 2022 12:58:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] weston: exclude pre-releases from version check
Date: Thu, 11 Aug 2022 21:58:06 +0200
Message-Id: <20220811195806.1571221-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811195806.1571221-1-alex@linutronix.de>
References: <20220811195806.1571221-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169269

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/weston_10.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.2.bb b/meta/recipes-graphics/wayland/weston_10.0.2.bb
index f81a33fd1e..786d12be61 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
 SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig useradd
 
-- 
2.30.2


