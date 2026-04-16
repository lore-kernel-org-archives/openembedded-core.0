Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF5F8E486
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:37 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28280.1776378807994121215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rEgo1rhA;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so474585e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378806; x=1776983606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7+oiW+E7TFCEvgg7t8LoFkNmsqgnc8T2/jUJQznBMw=;
        b=rEgo1rhAMn9GPwgFNHLKsVvWqmKnH87IVAFKXPSajO530XvTzAIYgqiepAC/EZpYtk
         G6n9uBUVBPP69oOl72VkGpbb1dCR8MN477pH80OoLTaJpYTpy6jYBLi6yKfq+hqyez7O
         y1g2gbcCgeoUjErZrHe2HcMSmxTGTCwuCaGi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378806; x=1776983606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7+oiW+E7TFCEvgg7t8LoFkNmsqgnc8T2/jUJQznBMw=;
        b=V9E+APHT6T5VszStAC8H/hC83yr+MBi/YcxRJ9mWXMceB0rEJaA+836TkusTmEpO/D
         GA/K4ADGE+irxiSqSrAb9XyDFl4UhAvrnRhhoyvKI49TyNmw3DJfJvWJLwRWLy7FaN49
         mWQsx6phnJ+HJC09RFhyRwvcpcGkZ21FmXFa1n8X6BjlSo6rFRnVQUcf1/TwYAbuegY2
         8yI4X8vEyxMZmCJZGiwodviUeG7621VsblYpJWhkq+aL74RnLmOYBjZGRWG6ubD1u/MP
         we6cH0N1dQyXPS7FawBC+SXnnibTiyOSVNdZBH2p4r5eUz8QL1H0bORXxeWSi3XKOyV3
         9+5g==
X-Gm-Message-State: AOJu0Yxi0g6zzKNUk/W25hN7EiSXOvV9656Pb2td39MkVat2TasJF0Gj
	LR9Qyu0bpNdC4jtOz3K3KFRG/bWTqnf444Bb07O0P/7SsslZj6EQ3b0w2U6yVrQfOBEs2IFtY+b
	Hup2Ph634LNgg
X-Gm-Gg: AeBDietbyM342/jwh5rp3M2f4ev2lr8+Z73T3PcGKM5lImLxVUeN9p11H/kSrP+/FZ8
	SpMAdKjYeL+sAmJU74uIArg+9u+JbzwhSk02SQ9/5Y68a+pT+hvVyJgcq8hm6Ur6F98kWfoaSzV
	Ov7H/MPXe3PaOZx9kLeKESWB1vEw0MveKzSTmUhWLi6DzCIjKbrZ+rEfivSmsP0e7j6ejnxfw+9
	FV+jrWC1sZ4mEUfcn652ET6PCYRZYdqmTLQZGehbR/vgAv+2t1BzG9ACZD4phPD3YTzh2k4WN45
	HMklIp4xk484SQsa4CHugLNESKaAM8DJp+YFGc8/bKNlnAuF0RBgKGElvO6B2a9CKcBoUcgwGck
	MZq2AcikJ/Nql1ZnDUO2eaC/PJtMh1YDsx5TUskId5NWptI4DzOjOoZ7gQmVnd6wzgtis0gZGAI
	Cvh0O9z5etmMydzqewvwV637f1tRkIkE/yk3a6YVtznZhmgw2Im7mcrll9UkglN9MThrwQz4LTf
	OVQtwnLXmv1gd504Mkmz73lIMLPzgzRsd4cKQ==
X-Received: by 2002:a05:600c:4e0e:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-488fb74d67dmr5170865e9.12.1776378806132;
        Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 41/51] report-error.bbclass: replace 'codecs.open()' with 'open()'
Date: Fri, 17 Apr 2026 00:30:24 +0200
Message-ID: <52d542285b3345d474eb5246e178d268138a443d.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235470

From: Trevor Gamblin <tgamblin@baylibre.com>

With newer Python versions, codecs.open() is deprecated:

https://docs.python.org/3/library/codecs.html#codecs.open

Replace it with the preferred call to open().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 58b9f90779d1227e30a7de4948b10e49fb5b5ac1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/report-error.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2b880c8b0c7..01ac1f2a37f 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -10,19 +10,17 @@
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
-    import codecs
     logpath = e.data.getVar('ERR_REPORT_DIR')
     datafile = os.path.join(logpath, "error-report.txt")
-    with codecs.open(datafile, 'r', 'utf-8') as f:
+    with open(datafile, mode='r', encoding='utf-8', errors='strict') as f:
         data = f.read()
     return data
 
 def errorreport_savedata(e, newdata, file):
     import json
-    import codecs
     logpath = e.data.getVar('ERR_REPORT_DIR')
     datafile = os.path.join(logpath, file)
-    with codecs.open(datafile, 'w', 'utf-8') as f:
+    with open(datafile, mode='w', encoding='utf-8', errors='strict') as f:
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
@@ -86,7 +84,7 @@ python errorreport_handler () {
             taskdata['task'] = task
             if log:
                 try:
-                    with codecs.open(log, encoding='utf-8') as logFile:
+                    with open(log, encoding='utf-8') as logFile:
                         logdata = logFile.read()
                     # Replace host-specific paths so the logs are cleaner
                     for d in ("TOPDIR", "TMPDIR"):

