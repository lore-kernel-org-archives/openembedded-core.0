Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.7174.1594552630219147467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 04:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QWSJbLdZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id f2so10042702wrp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 04:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2wC0vOEgM3tLM+OyyfM6UlxS1cBYdt1rk0E0V4qHaMw=;
        b=QWSJbLdZ64fVUk0f396iG+R0zXFcmmc77wYF8tHyMn/95aELBYxwTchVMKRZUh3clz
         GQBOAYiRDtEQ+Q9qsIjYRG99/Bk3zUmC9HJcWX+MIhHRupygoq0CRk50iT/AhawpGurU
         73+8XDJSGUTsu0aXnc+tBapNzbViMFnrhHQ+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wC0vOEgM3tLM+OyyfM6UlxS1cBYdt1rk0E0V4qHaMw=;
        b=p1h3HMqkeDbib94lZVXHIWcOF2XJZcp1ND6239/IkUbfAwL4zwDL7CqTaxOBayqoZs
         De57zyD1G5yT8C8/7aEPdM3Ub41KVDSadhXvvEpNesH38UdTKLMQVnHY5lD8xbbXuVb7
         0+ecTxKj+tlKCRoygonfOLhymZdco8cIky4ylJoWEjOla2J23pzJyhLMstdSfWzffNta
         GhhbbE5Ni+RoESzZuQDJUpKfarbO9/cMPL3XAAoQC0KqBU9wz+Y0RiOCgcP3OpCRpyi6
         13eESsAcEUVifetRC982+gA1hUxvTxK1fJwJqCb6Rz54gtBQj7o9f4hWriEDG45TtJb4
         rVyQ==
X-Gm-Message-State: AOAM530dBKREkrQsg4+LYhvsUJqge9OIHKQUTVTPEUxFP9hlCMSsSYXn
	rTc3iFCRd4V5lTlPSUR+7RBR9juWRzdDNQ==
X-Google-Smtp-Source: ABdhPJyCDc6JhTYt7KsACDKX3bVAllSr1eBbTQKwGu7uwdeM/AKlgnem3aYJA8DreNs5RCIEy2CvIA==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr78377876wrn.9.1594552628550;
        Sun, 12 Jul 2020 04:17:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w13sm18847760wrr.67.2020.07.12.04.17.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 04:17:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Add extra debug info when qemu fails to start
Date: Sun, 12 Jul 2020 12:17:05 +0100
Message-Id: <20200712111705.509644-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200712111705.509644-1-richard.purdie@linuxfoundation.org>
References: <20200712111705.509644-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When qemu fails to start we're struggling to work out why. Add more debug
info which can at least confirm/rule out various things.

This code is only on the error handling path and more info shoudl help
us debug issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 486d2bb8932..41c6bb33d62 100644
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
2.25.1

