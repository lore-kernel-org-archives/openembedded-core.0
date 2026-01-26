Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18B7D1950F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 17:26:08 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26121.1769448358766441599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 09:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qGOwOKp3;
 spf=pass (domain: baylibre.com, ip: 209.85.160.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-5014e8a42aeso68662531cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769448356; x=1770053156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQoIk0SeACjR8Lo4m43TeOZ7xe223yLTuNxCLcRzuxM=;
        b=qGOwOKp3WqMq1+qdH+Mmg//ihMwQdGVQA8qweKuK8gfu2RxsHQhCEx4uzCFwnoXjU9
         vc8GWgBPLGdxV8TrHVHMa/CYfeWXeVuPHlQ6LIgYrGlLMHiZEDdnLx9ZmKgQ94CiccCd
         s8NhqqRb2GEGZlqZ7dlI0ZOdsLhtG4FkePrNRLRBQQyJhe3JxrSetR0gRgZIBaqIL2H/
         PYlRirTkch79dRsKVMWBvT95uFiy19Lj/zrOr1adz44pttJjKMc0rNmXtYgeuAcu6aZi
         9huO5FiY5OE1AQ1z3TMKtNDDBa3bLdnib9aGeMIzrPjhW8V2CzUeYwxmjoFEhin3yslU
         Ocsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448356; x=1770053156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQoIk0SeACjR8Lo4m43TeOZ7xe223yLTuNxCLcRzuxM=;
        b=oNewHrV72KpC9jiHghm3PhhPlDPkZPN457e48lfkLxlCnToSJU4FdWhKu8mLMi1/x4
         O1D1BGsz/bOg1TT65Z5qp/K5kBSSAZJT73Ecgbw9/ZJVDe45PNFWU4Rnjz8/SjyKsjza
         zRYXiGZYaqFuWQ6BhOvmV7MKUj0nOdTpPm8TH5ijVMuQXJPIsDFxOGUGn3BZG4KTq1sN
         dwYAi6cFVkOkbI1FilRtF8A0mVaBd8wRPiErR/mzwmWalMq5ZAGFdv8kOXIFb5LXB6wP
         fHZXN3jyMqbMSydhlT8RmgJ6h2Tf3Y4cEyZJawB7yVSqRICfdvz1S0nSVUaAPj4cWSbi
         0GIg==
X-Gm-Message-State: AOJu0Ywuhw5td+grBZtr4bRgdilMygwT0FYAlTp1wfqd6C+5nOpOtSl8
	xBARCAiX0VcpMclYC2scfg0epH3pRE3vp21F9m9T9XswFagMLn/myQ4InsaWtT5uqWK5cKN2G7U
	h/QjZGHE=
X-Gm-Gg: AZuq6aLjQ11ZyIP9JLvhFdRtgqx4ZsKIFt9nbJcvZnvLFXrpOZnrxBqEVxElAjcsim1
	Ua6SkLx1iD9RDkJgXHdof63P0fkCUbawxM1njN/GBAJBh06Y3AaS7QdboyBkmk2zPDe3a/a9h99
	UzIF1kIcei6aNMZVSBiEi4QnYBapeGaT/wYMam3krEvy5pFnVytnEFrHPklx6pfd7C3sPllq76H
	+Y8fxL4FDWZUkNlezz1abyqXqW6FoDp0ks2nOY6KxfigW1C4CjhKuJpN9RY0g3xK2Ms2dU69KV5
	nNOjRS72bpp553Vkyru8ZJGFpU1hAyL4lNKKEnw9Fz1d6B6Zz5OhcWwhlhQpE2UPReYzNpJto6s
	YLbOEIQt/zWh6IUewl7dA1KHGZRkL4tAKCLYpoIoRxaTIbJikRWsOzM3rB8jjXp90KbtkX4pvTo
	QtVTHQBrlE5aoV0oM=
X-Received: by 2002:ac8:5902:0:b0:4ee:2721:9ebe with SMTP id d75a77b69052e-50314c68786mr75640691cf.53.1769448356102;
        Mon, 26 Jan 2026 09:25:56 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f747dasm91537611cf.19.2026.01.26.09.25.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:25:53 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] report-error.bbclass: replace 'codecs.open()' with 'open()'
Date: Mon, 26 Jan 2026 12:25:48 -0500
Message-ID: <20260126172548.2402273-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126172548.2402273-1-tgamblin@baylibre.com>
References: <20260126172548.2402273-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 17:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230022

With newer Python versions, codecs.open() is deprecated:

https://docs.python.org/3/library/codecs.html#codecs.open

Replace it with the preferred call to open().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes/report-error.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2b880c8b0c..01ac1f2a37 100644
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
-- 
2.52.0


