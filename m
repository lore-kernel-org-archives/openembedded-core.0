Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.8808.1632493010303958324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lADHak6Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id bj3-20020a17090b088300b0019e6603fe89so6155953pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eMNpy2AwnQkgy2nb730zfr40A3NYWZvj8dDlIcJz5XY=;
        b=lADHak6ZK52cRVA27wHVx4n2KLtzw4ptN8zZ2NFkENcsOsR6AxmY6/E3AAw2c+/upg
         7EWu2iSFkVQbBjsgAxYMX17mfqtnQ1BmMZV2TeNbZF8y0Xd8B6Ii40sLaTUzP35cBxBw
         LBbV8BSwrDG3MSKbegtVfVsEZnkwX4owLdZNoLvvGZ87LEz/X2RiRSU11Hh51ZLKpkXs
         nRK7yViNxd9cV3gnRskzEw2BBuoDgp6oMqc86ovTX3tXEN04pktRZbh3oy6h8ZvKITEO
         pBc2cHe7AK0ZGVS/QabR/hZFNUk4LyzAUoF/R1u1GJSazhKk57G8LhXi6KxOEgeHvBuB
         izFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eMNpy2AwnQkgy2nb730zfr40A3NYWZvj8dDlIcJz5XY=;
        b=dYgcAYt+Gpfd6m22JTvBo/bWYKohj+eeVDerIaC4MQth/GDQom5hhmAnHZJq96jQb3
         oj8Ik17Tc+ztvAyBVCLMr2WoTr/AVQEn2FoAxnDeC7R8i0P6GSl6x5lpWU1P3JpIVKzB
         6H2q3GeLCkSyfaxA2+dqaVBt0cpVhVBc+VKMKkk6WApcy41GaooeP3VLcxylM/cTchmV
         kB00Gs7IDtuRRYMmc9EdaFFk8lSM0TRuvCl7aH8RRCMu1UJ9P0iqdtEqUzLtoYaHcAxE
         paMaAscdCfJszfG/7cHRFfoZiStbR/6L8YBzFAcDrOZawE/+g2sYWXNc4HeitSz0qaCN
         +lBQ==
X-Gm-Message-State: AOAM530NXm8GVVjyInem0pW++xFjbuL9T8mrA/Hn63ulncoYL08248ax
	RG9HuJTK6id0B4jkPNgUQuRThK6sWYSLuvAp6tk=
X-Google-Smtp-Source: ABdhPJxgaC6IjfYL/eXMnDqVF7n0m3x0XLHw99saygEN8/czbVurJRTQ43vSMVVCLX4KWRPH62JmUQ==
X-Received: by 2002:a17:90b:605:: with SMTP id gb5mr2515657pjb.51.1632493009292;
        Fri, 24 Sep 2021 07:16:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/25] testimage: symlink the task log and qemu console log to tmp/log/oeqa
Date: Fri, 24 Sep 2021 04:15:27 -1000
Message-Id: <4cf9f677386456d37345fd17c699bc7eda53b829.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This makes it easier for the AB scripts (particularly, collect-results)
to access and archive these items, as they can contain useful information
when ptests or other qemu tests fail (and also if they don't fail).

[YOCTO #14518]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1965b344abcff0ba584136f929b4a14645f1585e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c709384b91..db1d54e5cb 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -193,6 +193,7 @@ def testimage_main(d):
     import json
     import signal
     import logging
+    import shutil
 
     from bb.utils import export_proxies
     from oeqa.core.utils.misc import updateTestData
@@ -397,10 +398,17 @@ def testimage_main(d):
                         get_testimage_result_id(configuration),
                         dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
         results.logSummary(pn)
+
+    # Copy additional logs to tmp/log/oeqa so it's easier to find them
+    targetdir = os.path.join(get_testimage_json_result_dir(d), d.getVar("PN"))
+    os.makedirs(targetdir, exist_ok=True)
+    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
+
     if not results or not complete:
-        bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
+        bb.fatal('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if not results.wasSuccessful():
-        bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
+        bb.fatal('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
     """
-- 
2.25.1

