Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71FBC4321E
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.7.1668103990323682848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e3fPA6A2;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1696942wmo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/UBWpECVpgVUmqoIEw9SEO3OzDae3NlVIyCzqMRbSU=;
        b=e3fPA6A2DFDG53qMGb9nH5AYLV57R9lYufngP1d76u9KwUCwIfch4sZwA3icFf3ghW
         lThkiDiU5x354O7uwJG6NfSqpJW1FcJpQc/0VOTLV563TAhAtw2JtPeeHvXATnRzOzPe
         zE1OdILU8cz8aRsOJmUt6yu/dzCczE85R6rDVyVEsHRXSF3mfbQyTU5utHab6Eo+d/uM
         5FTw9R1Te6O2m9rA7x19fk8LB/gAk3owHH+6UL1QyWTLGgIkxYX9MNue8eiKEK0zGTD+
         mRwcjUV3JkQrn/Uwvkq8BTY1NMHmuMTptdh+1I4d4kfhjJEI381LBREIfzpN+oOvAM8w
         99fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/UBWpECVpgVUmqoIEw9SEO3OzDae3NlVIyCzqMRbSU=;
        b=LoJdvsH2i8KVECM1/LSWAkkMYKt9NpWKDI0/PcWNHv3G5qEiVyWCwck+xqhakjuAos
         MJLx1m33QREPI7+/lQlYsVKh2hxXenZ3Ov0DFfhVByBD0bxMw3zy47Ekk8WF7XmLbQ6q
         QCjKlH6gQzxpOPb1SZcbUJ6CL1+NMNMr+lpV26mHASPofLIeC5kwH7CQj29+sgwUwrGS
         dhPLLSFEWIMiY7kFPEoTP9Lfh0afZaTCvux5EeqBAzEzk8BztQPXpVYFliZg0kR5nobg
         zMMLyR2AYyAMhTPXetlpjL0JrAZFOsFLlwJuQOogL23D36zlILtHKQK1aS0SGn3JRhp1
         WLgQ==
X-Gm-Message-State: ACrzQf1OhTNsZxZOQD/MNIPTtbkNED2EYbkTOpCpt4I0Ub9omshj4n6r
	q0awNdlCRFdp2cceKIUbqma1LdwUz9g=
X-Google-Smtp-Source: AMsMyM7oJmaK7jXOQNX0AgUmb36oEO6cWqEh9qPsaz1U34ftWJ8ZYnpxItmCKIzgzeOcy74wu546jQ==
X-Received: by 2002:a05:600c:4e45:b0:3cd:f141:b7d8 with SMTP id e5-20020a05600c4e4500b003cdf141b7d8mr44221335wmq.196.1668103988542;
        Thu, 10 Nov 2022 10:13:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/19] gnomebase.bbclass: return the whole version for tarball directory if it is a number
Date: Thu, 10 Nov 2022 19:12:43 +0100
Message-Id: <20221110181249.1240200-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173096

E.g. if version is '43' without any dots, existing code would return ''.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/gnomebase.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gnomebase.bbclass
index 805daafa40..5e72f549a3 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -5,7 +5,7 @@
 #
 
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1])
+    return ".".join(v.split(".")[:-1]) or v
 
 
 GNOME_COMPRESS_TYPE ?= "xz"
-- 
2.30.2


