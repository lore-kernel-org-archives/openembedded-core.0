Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.12689.1594996752981407283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wmtD8yKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id p1so5530087pls.4
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WWqymzcaKS6vqQEodJwLCxnbf/76Hc4OnTcetoVxn1Q=;
        b=wmtD8yKP+a2l+bGFyoEnM4ThtCdvjZIr8IDNHuEviZ2dO/F/gGPPk3TW2ul4M1TYzh
         pFj89j3GOaq6Mv1Y2whhCEWXOth8s7OohoSH9aM4FxcmWulIu8VlNLcWlv7hNXZgcaGs
         NFHPjDOBVAt3Vn3Uz0dYxA4WUue1OB8WBEz+aXfDl9OMhDx3iwPPpdmxjcSpYL8pLGx+
         CbEWTpBVRWCjytEyI6vLzS1w/dyeVSaUIPUDc/N3R3pTVZBy3gnda5T0dCmp0YurURCG
         5EVyzYx+3zyGZW98GQht06jUSWvYKPjI5FRABTfwcNUxXFE/bb52P/g2oXCuaROTSSf0
         dlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WWqymzcaKS6vqQEodJwLCxnbf/76Hc4OnTcetoVxn1Q=;
        b=b55AG5hkK7+UGYjz4EEPL47vbDD78T+JvEo01md2nY2LFAv5PSxF1RS1Kcq6AIbw4O
         9TubFa9d8U+W0KbvH5xclKDqPiI02SBy+0jYBAa+rhm38l7/PFx1KHImTXijhKk2vic2
         M72no8HLuuiE7K8URJkUNenKqxP2dAeaURhwHnSuMUDZSJzxOId8zARIyE4hDQ5XBDm0
         rhIv18GYDaAS3aTWtoQO7VdCmEs2sqYAVsrqSuvBxXY8ZFi5GpfVCbqqzm1KnuuNZ5xe
         DgmdsxQzd2lMS7bJ2m8hgJu62YvltdrS64Pdh6Oq+BPULhYAZm+8Ua5OGVrdpDhE2FyC
         qRGA==
X-Gm-Message-State: AOAM531fBmu+cR+QTa//jf2jOmvm5j9kho8Ck9F63sTj+Jax00Kefes3
	QjOPl7ID+Pad/+78wyplX4J60MB/Yz0=
X-Google-Smtp-Source: ABdhPJxPfHI2FXGwFRe5yegMoDOfWao6MpoHon0V17lPZyQ4WNUSdxT6Fr6xqhkwHGl3+2lyo3ALgQ==
X-Received: by 2002:a17:90a:266f:: with SMTP id l102mr10075850pje.144.1594996752049;
        Fri, 17 Jul 2020 07:39:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/20] qemurunner: Add extra debug info when qemu fails to start
Date: Fri, 17 Jul 2020 04:37:24 -1000
Message-Id: <797f7e0c3ff0610a4de321eaf82f84bca610624e.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When qemu fails to start we're struggling to work out why. Add more debug
info which can at least confirm/rule out various things.

This code is only on the error handling path and more info shoudl help
us debug issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3001d0d8f3429e5ff0c37ea7192e85e7001cdb32)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 486d2bb893..41c6bb33d6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -254,6 +254,15 @@ class QemuRunner:
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
                               (self.runqemutime, time.strftime("%D %H:%M:%S")))
+
+            qemu_pid = None
+            if os.path.isfile(self.qemu_pidfile):
+                with open(self.qemu_pidfile, 'r') as f:
+                    qemu_pid = f.read().strip()
+
+            self.logger.error("Status information, poll status: %s, pidfile exists: %s, pidfile contents %s, proc pid exists %s"
+                % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + qemu_pid)))
+
             # Dump all processes to help us to figure out what is going on...
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
-- 
2.17.1

