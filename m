Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B54C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3088.1639000799162085628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=djPbjxzQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d9so6507515wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=djPbjxzQw351nYJqA/RAf0AZg61tJEt40Ql0C7CPGLxRhbXrkQJhdS9yrX9Sbi//+w
         +SpFMDvWVY1TsdYZOYUC4gJBxOip1BrBhdmhRNxfnXRTVbVRfyZoG8w8k9oc2p190XLA
         m2OJLlpSNS/yXS66o3FFA96ZU3p0LDFZ7zc89UkPmZmybRrHeL7X8OQ6Xk3DvHEQ6aCn
         np0BSFMfu6+h0jvPIPuAJ3TlhO8wP8A/NC2OdHYlgYQl/4z332WhKZRcZoRvKXHUT12O
         k09SoA8E1ajzrRZa5YA2UmZlUp7/agy5MVLNhlIKyG6HlqWWz+FCScLZK1KzjCzhj6vX
         uOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=1CjGv81Cs3kGDNPuFzoWklxaWYYUE3dFlnlNyV/4lZmRzVQ1Sw+z9gtB9SrX5BYi5n
         rgUmMMwm8YckwZl/Sb03volKS004n4I+T+TaYAwYnzP+oNK/yVGljMQC4aiFIa9OTJGs
         2BOnwfuNT735nDCDHXmnPPkJu0lTT5nVQer3M8VRiJAvAHhKsKuSry7eYIwzddMWf1x4
         s4kM8wQ6gjTG/0crnStiM25W6vxaWNqC4U3NIQIGbl/CXmAn1cZHa2dG2dCr4B/6gtRm
         WcC8w8NucxEVxN8W2yqn008QbSh7qSegAlwtPi/rkMPVYdOtVtF1mrQk7xzOXYEoS8hX
         ZBYA==
X-Gm-Message-State: AOAM533wScyDD9aVh3G7GOo7F8/HtS1iRepdTSZD3//W/EkTDbqpHUPz
	rxOoGB1LYzeGkjhQ9qXh6s3dCZQJvkENuA==
X-Google-Smtp-Source: 
 ABdhPJzpw7j9Htt/mXi2TrMlmmftQTX9Ks47AakFn9eF+75RnEdmZvWQ8oZcflkutIZ9KceYI3Pvhg==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr1537009wrl.181.1639000797810;
        Wed, 08 Dec 2021 13:59:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 13:59:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/29] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
Date: Wed,  8 Dec 2021 22:59:20 +0100
Message-Id: <20211208215947.1979470-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159368

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..8a47da5a09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1176,7 +1176,9 @@ python do_qa_patch() {
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
+       match_oecore = oecore_re.search(fullpath)
+       if not match_oecore:
            continue
 
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
-- 
2.20.1


