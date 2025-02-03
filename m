Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBFDC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:29:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.86376.1738585750046426819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ap7ey18g;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54021daa6cbso4624345e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738585748; x=1739190548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOZKZ70JhuiusihIr9nY+XaBni0CDMcq12Txc1iHojA=;
        b=Ap7ey18gxvqDibI1l3MSdzUwsdsY/bBq4CKNfyE2wRz3zV9lS78V42GTLYBz3Y5gqs
         BMU5DVJJS7jWH4VjT3JBno/XwF9VKjRMc+a+b0mT2OfNnTWzPIO+0wQACRKwICb8ZS1K
         mRTnuNnmkILthey1Ek0fnvh5TNPbSwyldI7jKZJdXUnBNSrhLaQHoerhz5900yvDSmvx
         kv74wEuhiGTDjU3zDaj8mpLSXAU8HpywDJEp6v0NDdIAHM9QEmTsGPOuCFMGVYL4aWCd
         FUPdGlzRB2Q/+ojSERer3AQRU+NVS16E0sSNiYr8cHwRkFO8DtsER0r4css0QmZndswA
         Bypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585748; x=1739190548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOZKZ70JhuiusihIr9nY+XaBni0CDMcq12Txc1iHojA=;
        b=PpEk/lOSWvr1F322T5QfYyOF5qZ8sn+ix1XJeJXOa+eM3n+fUjS7lA2UxJRgDJp483
         6BqwA4Z/+Cykp9PJ0kvHM63wpWoZSiW23eB9VOQQFmUy7NA0OMiMFDqAInB5boklKF0g
         PqUXRfyCN/DB1NOZegkE4RhQuT8Qj2M+LCYyXUJfO0Zo6btPd9hCwzl3xB/4JFcgYw2L
         2VFER2KZabESKJ65s6ctyH6IXLWjOy13/zbOnOTbOytkZ0axcG+k30QIHuwyu4MaBgak
         3SNzHd2AoC3VKjfBOPkHyN3A+Ogiudgq67W48ZVS05kgf1xWOXDMptgpDfGOE/FmJmqO
         KAew==
X-Gm-Message-State: AOJu0YyHCJL+LDxtWxZ3PSFzi1ammuGd9k6w5GhKcBAnMlrhLuLZU5hp
	QzR0A4l2/RKGbRzofvVXBxjg7yVBO6qHzIa9X9/vG5JAor2+KD+rwSb5xP96j4gNybHkfQFTDuD
	19KU=
X-Gm-Gg: ASbGnctd9ppjYrVRG8be5Jr7QZpRxRkprCZdgLAvCqiUaYUKQFjpEhUwFy3EbVoutb4
	ezQgpd1Qc/dWSA3DdvoGi8BphO88DMy/sfdsqaeraXexOKH0PEyf/g488b52rFa9ERUmfQOecZy
	ErazzM33Ck93Axg/HXiV7WDoEiIPjuA/175vcQjVeT09mjYLMhORg+YNG/9dHtRglJXLVJujNd2
	x+Po7itOfquAerbQydsZ4omJNjlQgUmMymKOeGzqV92oBsVtpRb003tJDPoDi4LpSBDhCMO1ztw
	26qFzuL3t+eL4shL4UCZxn5rwx7g9iOl6UHK93TOYsXGWO1dPsWll7kozvBQ
X-Google-Smtp-Source: AGHT+IEs5Ne4LZx19/XpznGVP++BWupJM6+1zPP4vsk56maBMqcgScFNPGyf79yeOda+NwUeQweeBw==
X-Received: by 2002:a05:6512:3409:b0:541:1c5f:bf85 with SMTP id 2adb3069b0e04-543e4c3c3b2mr7852723e87.50.1738585747942;
        Mon, 03 Feb 2025 04:29:07 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebec0a42sm1268218e87.259.2025.02.03.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:29:07 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] testimage.bbclass: fix logDetails() call on error path
Date: Mon,  3 Feb 2025 14:28:51 +0200
Message-ID: <20250203122851.1161503-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210650

This happens when testimage task runs and bitbake is interupted
twice with ctrl-c/SIGINT:

QMP Available for connection at /home/builder/src/base/repo/meta-arm/build/tmp/.xjik9srq
QMP connected to QEMU at 01/31/25 10:36:19 and took 0.55 seconds
QMP released QEMU at 01/31/25 10:36:19 and took 0.07 seconds from connect

Keyboard Interrupt, closing down...

Second Keyboard Interrupt, stopping...

WARNING: Exiting due to interrupt.
NOTE: Sending SIGTERM to remaining 1 tasks
ERROR: core-image-base-1.0-r0 do_testimage: testimage interrupted, shutting down...
Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 6230788.40

tput: No value for $TERM and no -T specified

ERROR: core-image-base-1.0-r0 do_testimage: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_testimage(d)
     0003:
File: '/home/builder/src/base/repo/meta-arm/build/../poky/meta/classes-recipe/testimage.bbclass', lineno: 122, function: do_testimage
     0118:    dump-guest-memory {"paging":false,"protocol":"file:%s.img"}
     0119:}
     0120:
     0121:python do_testimage() {
 *** 0122:    testimage_main(d)
     0123:}
     0124:
     0125:addtask testimage
     0126:do_testimage[nostamp] = "1"
File: '/home/builder/src/base/repo/meta-arm/build/../poky/meta/classes-recipe/testimage.bbclass', lineno: 389, function: testimage_main
     0385:
     0386:    # Show results (if we have them)
     0387:    if results:
     0388:        configuration = get_testimage_configuration(d, 'runtime', machine)
 *** 0389:        results.logDetails(get_json_result_dir(d),
     0390:                        configuration,
     0391:                        get_testimage_result_id(configuration),
     0392:                        dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
     0393:        results.logSummary(pn)
Exception: AttributeError: 'TestResult' object has no attribute 'logDetails'

ERROR: Logfile of failure stored in: /home/builder/src/base/repo/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.2771735

Summary: 1 task failed:
  /home/builder/src/base/repo/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 97ed4223c4..e090b1ef4b 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -378,7 +378,6 @@ def testimage_main(d):
             bb.error('runqemu failed, shutting down...')
         if results:
             results.stop()
-        results = tc.results
     finally:
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
         tc.target.stop()
@@ -400,7 +399,7 @@ def testimage_main(d):
 
     if not results or not complete:
         bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
-    if not results.wasSuccessful():
+    if results and not results.wasSuccessful():
         bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
-- 
2.43.0


