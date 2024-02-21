Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AB8C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 13:22:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.12571.1708521721168534654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 05:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VP5xUiDt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412698ac6f9so16754395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 05:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708521719; x=1709126519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GvDYnkDsFBcMD0ly80hXAS6Po1ufFiEM0yVnVJ/2ci4=;
        b=VP5xUiDtaWdCh/BQ+ZWOo0PFXQvIZI7sKLh1KtIlt12FdXOGVXLzzJXZymBi95o+5W
         1tgOHLVptUpw1B5VGRtgYkCFWR00Gt9dhdZ9ZFSc/y+5+epZF2LpKjLAbSB2rz46dAw6
         r75Ksj7ezUFSoZf+Gdx87cJlIRBnVSffIpD6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708521719; x=1709126519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvDYnkDsFBcMD0ly80hXAS6Po1ufFiEM0yVnVJ/2ci4=;
        b=Xww9uKslloD+Bwbl+KEgbgCpwciiNtt++sD2XxRaO5knZDf3JHl7xM4RjXWuh/XlLk
         r27JseVTsVgWokKUzVhMptczH+teplDsIEQNq9T9ybYNXDyHy2XA568cbu8p0cYXImd0
         h3K4o8czhCrVSSsD2ubOvVjmEGKHxkQ20+xF4UfKV6orJmKgON/ewpn6eI7zGyy20HO8
         njtuinSGp8EEY7F2vgL3bEaVRM4zPWxRtKpCd5x+vIbHgZCddtxEzvxeOCqlaaKM7mkM
         uvi7C5kAJjPdz27xojLOLJjw1gIrtZ39t64E9CaVE3xVeh41BnV2rFE6zumF+ipZJlFr
         f8jA==
X-Gm-Message-State: AOJu0YzZcOG6J2Rx+g6K+sYBEJhss6vNTKIEVtBPokbRVfw4ejkrbgCv
	jfqNscMF2fBK2T9WezM/kBQD69Iw/jKVyMgEs1ViUW1kWmwH/meYBEBfp2rnlPZ9EhkZ0gPTHju
	V
X-Google-Smtp-Source: AGHT+IGuIpKPEjqJP7wikoTijV4aGpFX2KMkjAqGN2Rhs736KbtzxrjOC2snx724yB8FH5/sm6nsXQ==
X-Received: by 2002:a5d:53d0:0:b0:33d:31ec:e09c with SMTP id a16-20020a5d53d0000000b0033d31ece09cmr10455521wrw.11.1708521719004;
        Wed, 21 Feb 2024 05:21:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f7eb:cc84:5778:9052])
        by smtp.gmail.com with ESMTPSA id co18-20020a0560000a1200b0033d4c3b0beesm11372404wrb.19.2024.02.21.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:21:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	Yash.Shinde@windriver.com
Subject: [PATCH] oeqa/selftest/rust: Simplify the rust testsuite output gathering/processing
Date: Wed, 21 Feb 2024 13:21:57 +0000
Message-Id: <20240221132157.794842-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 13:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195970

The rust testsuite was redirecting command output to a file, which made it
hard to debug failure cases since the logs were not available to print to
the console.

Rework the code so it uses the existing popen logging and hence allows us
to improve the error logging situation and make debugging failures easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/rust.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 120be6454fa..ad14189c6df 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -216,13 +216,16 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
-            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
-            runCmd(cmd)
+            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s" % (builddir, testargs, targetsys)
+            retval = runCmd(cmd)
             end_time = time.time()
 
+            resultlog = rustlibpath + "/results-log.txt"
+            with open(resultlog, "w") as f:
+                f.write(retval.output)
+
             ptestsuite = "rust"
-            self.ptest_section(ptestsuite, duration = int(end_time - start_time), logfile = builddir + "/summary.txt")
-            filename = builddir + "/summary.txt"
-            test_results = parse_results(filename)
+            self.ptest_section(ptestsuite, duration = int(end_time - start_time), logfile=resultlog)
+            test_results = parse_results(resultlog)
             for test in test_results:
                 self.ptest_result(ptestsuite, test, test_results[test])
-- 
2.40.1


