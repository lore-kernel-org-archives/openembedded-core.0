Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71867F88077
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7732.1776322127326794353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=golavCTr;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso117139635e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322125; x=1776926925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7+oiW+E7TFCEvgg7t8LoFkNmsqgnc8T2/jUJQznBMw=;
        b=golavCTrO2oDk37Y7GIpD8Xybl4PognO1o229HmU10CT/OaC6YE/9qGUoCPe6V7odk
         k/lFLr8ZbJPVQkC/9Pk0uHarPGw5p1YTUxy1Dg6v1RBCSD2qJZRJtgyzQHizt3k3xkfV
         cu4kCovSDq2udoaxI4bswrON4Uw30ntdOFrvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322125; x=1776926925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7+oiW+E7TFCEvgg7t8LoFkNmsqgnc8T2/jUJQznBMw=;
        b=C6W8CW3eZYuwjYIvpXT2ZB4iNNaX32/EwBKEvpbkbqPLUxEGQhVxLsSXnrYf6xRHHZ
         4pYtPUOQnshfbEiCO6rRkrKGjdJvLpe7sm0HDCb5QLXVqplhxrEY/XE2+k1fjXBJIOzM
         utD9k9VSxtAdih+JjBTtjVvnh6BkJGgz5GMR68+ogfYUFI9D187du7MfwzXS4KhrND+c
         WkFT3EN3oLEhEVs8qA05cUSxLcRYmdrV+9GUHKfMH1bQRryi8wP4CZhgnVch3/GlTMjy
         zIrDUE4QoM7CIVuzypUhezzfHrt+Y0m/u5XWG3VwdaRtvFC3MLUxsLBe0XNuipXITzgj
         w1xA==
X-Gm-Message-State: AOJu0Yzy7kzxCgdQeQJsgTw0a4VptCMKtDZlHMBzaDO0btN0jwWNwCLW
	arwAoPemHoIYwmYW/sX3bHSNkpFHzRWaCFy75cePKQHboVHZObLqUe9ZS9Wvfm2F4lVUP0FbWhZ
	ZruOSWjyLzA7H
X-Gm-Gg: AeBDievz7pRm4/uSSNfavf3q1eLI6KiJ+Haa4IV6YXYmUhduFQpSp8bC/mLfCQrBSeB
	dFc1NqAcSqpdyv++tyPWh8EDUU1pdgx0RSNDhd9HTN3WIsb4daACne1ehWxqoPQTEv9Fz9pdQeD
	DZQSo7o33aabSmw/5SpLnuChDeX+dRxLBhWMhMT+uMvlyMXgGhcoUSheaKl7IJOsDgBaLkX49w1
	77iNGaw/5/QIvRXMVXuLIXjO/a76GvrZ/xIAFjB7cAHIx3NU9VLNCsYOQ2m4Q7NP5Q+AxZwvzGM
	vJMw7Zn385ow5/Eh5TEjBORog9V/suTRQj2Gr2UKn8gLx1WKCDZjJDZthmEKbOhkNTnk3DUrJX1
	dbifIgO6e6Q2GEuUvhzhyKXkhCp8i/IfYl+ELLgo6QAP9Jq2sO5Z12xlAIuUaQuNT4u6qtY+iYl
	GEvSnOKK9A6Sa2q/rDfwi9NaZohmfBTXRPe2Je4Y+3uUFj1+DzCloz1TkXggfwttsI2fw9OhZ92
	0JN3LZdrNInZCYz8Rk6AQbgCM5d6t/IqVkmYA==
X-Received: by 2002:a05:600c:3149:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488d684319emr336687495e9.14.1776322125422;
        Wed, 15 Apr 2026 23:48:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 41/47] report-error.bbclass: replace 'codecs.open()' with 'open()'
Date: Thu, 16 Apr 2026 08:47:42 +0200
Message-ID: <52d542285b3345d474eb5246e178d268138a443d.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235383

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

