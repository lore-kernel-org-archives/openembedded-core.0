Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE751C6FA82
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 11:25:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1.1662722727383369591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 04:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGFebugl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b17so2225497wrq.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=CPDLD6ehGGFD15TO1o5cweSo6L4+KfgGe+M6KcGFmas=;
        b=QGFebuglCT+5TOaXV7/X8+cAtrRxHeHZEvO84vMEpCVWC0yT/CgLzB5OWsIB4V0jhA
         9jAqE40+lFba7FFPLlSfxygGXX+RMFcjDJyDn9KiUre+O49PhkXEKclxyCvaTaraOQ+U
         D5y9TEJpblwml0HV1w2KFMQIHXCIv1PiVvt+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CPDLD6ehGGFD15TO1o5cweSo6L4+KfgGe+M6KcGFmas=;
        b=rokRfErtyTLeA6y+8H6nBSOUtm1ygoizvvozM807U4h/xqDIE+Tq1yaTxJ4XVAbNT1
         sd2g9mHkKmp7byTwt1BG6XIIsu6LqENd1qjZkbN052QN+HWpXl7DDMV00hbxkCINqLoL
         7lb09zfEGCfhoP0sX437EID2ueBk9WPgGLx6ucfC0uC5BiSxPARsMRQJXlEuSE+3fFWC
         tQuOUfNQU9Nwts0b+i34B5ykleQb0HvW1/XfEqQimX5tCysrECfLVpviDP5qUkZhnf7s
         8L46/xDOCQZY1R2dziRnjQ0gTF49UPaUR8KtDZFOFGOZuyZMs6z+d33vscIhGLy4iVRt
         AR/g==
X-Gm-Message-State: ACgBeo1i/yWSRTqo3rnoPg5qNBdw6IcFbDs1LF1da3MKhd5cPNHbFpil
	CSvJ4pRb0AY0zFd2nJ01b2TE7vIrn8THvA==
X-Google-Smtp-Source: 
 AA6agR75mGL7rUwmmAtGbK+h/n+wV+n87crb59VbaF0098VQMUSvm4S3I/wE6KTFrGqNnb03EMkL6A==
X-Received: by 2002:a5d:60ca:0:b0:228:d77e:4b25 with SMTP id
 x10-20020a5d60ca000000b00228d77e4b25mr7893554wrt.139.1662722725551;
        Fri, 09 Sep 2022 04:25:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b003a540fef440sm527625wmp.1.2022.09.09.04.25.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 04:25:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Update to match qmp changes
Date: Fri,  9 Sep 2022 12:25:23 +0100
Message-Id: <20220909112523.648717-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909112523.648717-1-richard.purdie@linuxfoundation.org>
References: <20220909112523.648717-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 11:25:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170487

Upstream made changes to the qmp module. We need to use the legacy one
for now since that matches the interface we use, ultimately we likely
need to update our code.

Also fix the generic exception handler to show the actual exception
which helps debugging when something does break.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4c3d2010fb6..07018b7de8b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -188,8 +188,8 @@ class QemuRunner:
         importlib.invalidate_caches()
         try:
             qmp = importlib.import_module("qmp")
-        except:
-            self.logger.error("qemurunner: qmp.py missing, please ensure it's installed")
+        except Exception as e:
+            self.logger.error("qemurunner: qmp.py missing, please ensure it's installed (%s)" % str(e))
             return False
         # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
         qmp_file = "." + next(tempfile._get_candidate_names())
@@ -325,7 +325,8 @@ class QemuRunner:
         try:
             os.chdir(os.path.dirname(qmp_port))
             try:
-               self.qmp = qmp.QEMUMonitorProtocol(os.path.basename(qmp_port))
+               from qmp.legacy import QEMUMonitorProtocol
+               self.qmp = QEMUMonitorProtocol(os.path.basename(qmp_port))
             except OSError as msg:
                 self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
-- 
2.34.1


