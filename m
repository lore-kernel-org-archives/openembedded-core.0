Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.55.1612806786453422534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 09:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=1mQhN8m3;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id l12so18314429wry.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 09:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LHMcjwrsjXZFyYQ2JOEnSCZPSpJGbtdA66/4AMdbWw=;
        b=1mQhN8m3Yy7VeGc/tWnPR413Jt1NXP18E5eZgC70snGQnngRHRNVf7uCFksj4yQLJQ
         462Jw7rSV82Kyto3c5UVdRKD6cHqNaXFzTJ14EubWmBLkcn642Nq0E+bB1dJalVfRMSS
         G79JTkKnt7cdX16SvwVoCAnqaetGA0Hx3X55irdQtRHtdq8CHxzdiBpGuGY8VmPnrJwd
         l02yzzUgjRersnXG9y/a19h3JeJzn3LSWDqr37Eve3v7pzFnWm27qknISouRgmT4jPFw
         sMPQupt1qQL7AKCHxfywoGK70Zj3JBbQeV/XDlaq0pnfSHXN2Eq3d1D3F6kGvHnxnUNj
         rUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LHMcjwrsjXZFyYQ2JOEnSCZPSpJGbtdA66/4AMdbWw=;
        b=j8bJEQgANWEpCCvZLx/5jwCB0hx1K/1sPQhmN7AbtZY+tv3IFCQwLlIzh9cA/MqLKV
         Vqu+wr0GJ+BwBikClotv4E9KPUC7slibohd06azvP/pKdQFeAcyW+F27ssdc49tpqmAz
         H5CEyrHbkDDq/HG5+x96wn6+RBPm1l6rgZ3pVOE+WX5HSf9g34xv1Q6RpUNkwYXyj3Kz
         QhZYIpSaJPP2Q2oimBbgSdYUSVjffJVaKwXoijQHPUlxoAI9anZR0qsWcQTPNkeflMXz
         mlDGb/1EBmSa/n33W9koNF1zSbvWK0mANmTBTnIBfVOAOwFLFEvZLM4SJMrJBhZfmqb5
         K//g==
X-Gm-Message-State: AOAM533PqMn8S342JNmOgI5kHXSa5Ux5sc97D2hcNXHHyxaGvXh8/c7c
	QZyYfcM0TJbaNNjDiDVVmecK+JsYqnsSvg==
X-Google-Smtp-Source: ABdhPJyVEbTXKt0imn6SaljwPqTU5g/wdvsJERT3uV/ngneF++AHMZ1Bd4k3SQ+p0+ykSVE7L6LDFg==
X-Received: by 2002:adf:82ad:: with SMTP id 42mr11139822wrc.116.1612806784596;
        Mon, 08 Feb 2021 09:53:04 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.idf.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o8sm6568771wmc.34.2021.02.08.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 09:53:04 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta][PATCH] npm.bbclass: avoid building target nodejs for native npm recipes
Date: Mon,  8 Feb 2021 18:52:26 +0100
Message-Id: <20210208175226.4081-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current recipe unconditionally RDEPENDS on nodejs (the target one).
When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
the target nodejs is unnecessarily built.

This patch fixes this by only RDEPENDS on nodejs when building for the target.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 79f55febcc..61d16cf23d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,7 +20,7 @@
 inherit python3native
 
 DEPENDS_prepend = "nodejs-native "
-RDEPENDS_${PN}_prepend = "nodejs "
+RDEPENDS_${PN}_class-target_prepend += "nodejs"
 
 NPM_INSTALL_DEV ?= "0"
 
-- 
2.20.1

