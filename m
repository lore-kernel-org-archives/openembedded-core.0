Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3F4CD80D9
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:50:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.92075.1696945813870152316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=sgeer162;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32615eaa312so5179187f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945812; x=1697550612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mau0haoJjBC1WjHzh+a17Vs5spftJdeJ0CaYUvaMe0M=;
        b=sgeer162vpbzLN7+YqYdckrqzpvzefXkBzAQiMrKiOVMNqS6xWW8YUdcJCO216rSr1
         ECqnWPiQ6VAdbNYirL1EBAaCCHtwTBo+4O5ylSd30OAVJWS2tcKsmb5XPyVOR19jHVeC
         MnRQ/tEVFvRItbNwMMWjUxfjDsQsH7DMEBm/uY1hS/nDTX9IERAdTD8kRa3w9OAWqTgJ
         ucR5MWomDnCwGw5J6RPSNaQ2ByQ8X2vV5ANVzl6X1ZIiUpRBCd7+PLc5X7e1lJ2cC/Wd
         xRFa2M+fJjyvsy+o33S2KIb/1g7TvKyVIWqrxQ71fNvfgsy5d1fuVl6k4PJlcfF5b9u1
         eNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945812; x=1697550612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mau0haoJjBC1WjHzh+a17Vs5spftJdeJ0CaYUvaMe0M=;
        b=gxBxvS0fyZpzQIi3ALa8lfC9MjcWNYDOjmg6t+Ifkjonq0tSXx0WZMxE47kdQdGLnl
         48ygU/5Sh+wLvOdszp7RdD+VknyXhh0V0K4VTpOiSIXs1bgB/UVULstbizpyCAyTNIzm
         uJBMl4QZVZ1byen5PPP56b1Tb41L0/LYP5Gg475is98+ERlA60VPJM3ZganVVUubfUm9
         /HmyMDkWiotrZGxBDZF8Pz5PkXbFI6cJXSGupBSyzI1a3nLo8xTgFefksOwlTmlsBSNJ
         rmk3RRsvPB9sWV9LVXq3zi/UP6o8jQ7IrvBgEibB6KB1MRJdPTXeP5nhRVuF+7LbEn1w
         dvmw==
X-Gm-Message-State: AOJu0Yx3l5jNcHMYFkMnma/89sLhlrmwOi2XGo/K5yLXUDqbTXrsdJg4
	hfjGvEm7BIWiFwH9jFH83epf4fo8HK19q5nJbCQ=
X-Google-Smtp-Source: AGHT+IEQRrjM9ekLhwKS+wpAxYMQseOltWrLhbURx7Bgqn3zokXd3wiBTruynrrcSuUThTThtr1hfw==
X-Received: by 2002:a05:6000:60f:b0:329:6b3e:d87d with SMTP id bn15-20020a056000060f00b003296b3ed87dmr11213541wrb.42.1696945812127;
        Tue, 10 Oct 2023 06:50:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b00317b0155502sm12716070wro.8.2023.10.10.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:50:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 4/4] insane: Add a naive heuristic to detect test subdirectories
Date: Tue, 10 Oct 2023 15:49:31 +0200
Message-Id: <20231010134931.3994720-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231010134931.3994720-1-yoann.congal@smile.fr>
References: <20231010134931.3994720-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188896

From: Jérémy Rosen <jeremy.rosen@smile.fr>

if there is a "test" or "tests" subdirectory at toplevel, this usually
means we have some unit tests available.

This test is very good at detecting handcrafted tests and I was not able
to find any false positive.

False positive can be dealt with the usual INSANE_SKIP mechanism

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 3fa9da8aff..07de974a54 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1391,6 +1391,10 @@ python do_qa_patch() {
     elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
         oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
 
+    # Last resort, detect a test directory in sources
+    elif any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
+        oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


