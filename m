Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CA3C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.9484.1715082407648621227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAWZwe4r;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so3997072e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082406; x=1715687206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCGqm3ObVK1AKU+eEmtnRmX2xq7TtVO4XadeBblwsNw=;
        b=cAWZwe4r/1Bt2ygMxe+8YH+PYWCvEzIW9anoZvGw98tLHYs4TnGLQH4OncM/iGUAow
         n/5KrwU3bbv67tRzJnjhhNiydYJpUaVdFi6NIkggzxGwFT3gvB8zGFirPTGpMRVhMWOD
         SG7vdRMhveLWUNFF6TOIxYUwObmH1wThOzlB9IqXxHGnBg7F5l2W1WhoYEV57w4w4TkL
         kqgyM+xljDm4VX+VJD4XUARAt6WQ+nmW/QVsO2VQuDhyaeQUdFU062V31oO82lcrLBiW
         pBUYiJJBrmfgLiVADnSxFYhlxB0C9WQ0ecOF/tM6aBzg3l1VtLU8fRNSfA/6VGVXsZdc
         6FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082406; x=1715687206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCGqm3ObVK1AKU+eEmtnRmX2xq7TtVO4XadeBblwsNw=;
        b=U3Y8OY+vPyr+geWSPF9zr2VWfnboLhJWyMPG/7u4Zq8VKqkgPrwvcm+/Ou3xdS1tuv
         LfDDkAnu0ZtKwM5mzdBbTWI9wGjtWHfRKcVt9W/Lbo/tFZdzAjhC06Q2xImtknRFy2YH
         A4J2s5wP9QQ7M1UtyUmQI549OeOHFDZjKRPCN8oL2jd+BVQWlzf0yieouABOWwliXk13
         SUkk9BL4ErF/1RmagmeLaFQ/VtnrRodOfaQAs0GWjn9Ch1GHy6bO5L6C7v6IKBjplaEu
         q36o8hEmJy68C6VNvk9Bf4ausHQVRTd9c4pM/xAsVKBoKM6+Nh9eU6mRFvzXcdwxJfZo
         bXrQ==
X-Gm-Message-State: AOJu0YzCMz37dcMOy3EID+365KWxWC7NZu+KxmmR2Vg8AiOE/jQp0EII
	u6KJbObSTg5DCp5cbP2RXBxCNb0PLZb6drKT/1GLmYHtKLuOQSue5nRGgw==
X-Google-Smtp-Source: AGHT+IHEJgvZ2GB1RJvhA9SnHZE5ykb44lltJ/oCx7iZO6qJUX1oGwFyH1SpTq+8jwfnR7TXFFv16Q==
X-Received: by 2002:a05:6512:32ac:b0:51e:543c:a45d with SMTP id q12-20020a05651232ac00b0051e543ca45dmr8810641lfe.20.1715082405732;
        Tue, 07 May 2024 04:46:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/9] sstatesig/dump_sigs: allow setting output directory explicitly from command line option
Date: Tue,  7 May 2024 13:46:26 +0200
Message-Id: <20240507114629.2591882-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199089

From: Alexander Kanavin <alex@linutronix.de>

The default (current directory) is unfortunately non-deterministic, as
the operation is performed from bitbake-server and not from bitbake
process directly. If the server was started in a different directory
it will write the files there, and not where bitbake command requesting
those files was started.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5dfd180e7f2..f885bb54f64 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -143,14 +143,19 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         super().set_taskdata(data[3:])
 
     def dump_sigs(self, dataCache, options):
+        outdir = os.getcwd()
+        for o in options:
+            if o.startswith('outdir'):
+                outdir = o.split('=')[1]
+
         if 'lockedsigs' in options:
-            sigfile = os.getcwd() + "/locked-sigs.inc"
+            sigfile = outdir + "/locked-sigs.inc"
             bb.plain("Writing locked sigs to %s" % sigfile)
             self.dump_lockedsigs(sigfile)
         if 'unihash-cache-copy' in options:
-            cachefile = os.getcwd() + "/bb_unihashes.dat"
+            cachefile = outdir + "/bb_unihashes.dat"
             bb.plain("Writing unihash cache to %s" % cachefile)
-            bb.parse.siggen.copy_unitaskhashes(os.getcwd())
+            bb.parse.siggen.copy_unitaskhashes(outdir)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
 
-- 
2.39.2


