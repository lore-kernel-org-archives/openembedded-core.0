Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.29821.1629982826617970272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=INORCv8Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id o39-20020a05600c512700b002e74638b567so2185447wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pP2EqI0f8ez77kz/9KxHk/vYvpDm9Mw3PfEJ2r3wAc=;
        b=INORCv8YmKt9d0+3SK0m8y1DvRu+tJcHtFM5thqbB3D+hxsi2sVX0aOGVo+TRWzNME
         Dh3ESV50lu4bM8MsbaqjqfrLNzwLOqu/UplFITLtolmShmqNiuuQYYbHOhfCxxpG4gTE
         bQ2vQARmbIvlJKTXUsxR9EfKaEN4BwSIPZC+ExpeWTr23+eFXSALxW8cy04t58rQ4EzV
         mRDUjQcQgJ24i0eAh8L3guPfYbXCPb80WuGkgBCFUzEqMA0KUJ3g2LFMb8rPLGAtKkH/
         AMOkvQJvBcDT/hiA+mZgKd+g0bbl7yoZ3UR0ophtUoyIZlkEGaNC1Y8qPcZU99+LA3FG
         mi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pP2EqI0f8ez77kz/9KxHk/vYvpDm9Mw3PfEJ2r3wAc=;
        b=b4SGbiBuyM+DoCPOp8L16hlztNyiWE1RdlmB4sDI7bbNTZTjF+Z6Kq+W8YF6RRK4vU
         wceBDKZx5cG/uL+PBhHA6nXaTWO8vLrV3JXJQCzA3lrxehCkbvc7KeiVOefR7qgxu8fp
         UvJKUC1nreyk97IaZ6qVaj/HazONHA6pgu45uLo65VU9gTKUCGmMI2l4VgpuhoUbVQiq
         iHRzyw7/RQiBl+6RdbdGDiXjYnuspTPSVqsQdOjoarS/EdvlM905N9Ge/A9jkWERkTIq
         XBVmDlGivcQFd4NWPmKeSrhDjGH6kSj8k0M4yISt/dh8E5rNNwpjW4y9GSrtZ68kXRJy
         jINw==
X-Gm-Message-State: AOAM5300V5jqKYUaGL17D/3jEwfLbPK8qgNJfCUEGNiEjkpDCbbNsj7d
	b3z7ZNJyJka0aEaOGK8HSqXn0h32ZXa/Ww==
X-Google-Smtp-Source: ABdhPJycZY2cVURmJuC8UEamJkO4d/OWQ3iJV9Vjzxra+xv+43oXdNbQaKHnYlXkewq9IhnIglTMtg==
X-Received: by 2002:a05:600c:1551:: with SMTP id f17mr14066204wmg.44.1629982825098;
        Thu, 26 Aug 2021 06:00:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id f7sm8255396wmh.20.2021.08.26.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:00:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] qemurunner.py: print output from runqemu/qemu-system in stop()
Date: Thu, 26 Aug 2021 15:00:18 +0200
Message-Id: <20210826130019.818320-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is done when starting up qemu has failed, but is not done
when qemu started ok, but fails later in QMP communication.

Output from runqemu does contain valuable information to find out
why, so rather than fix all the QMP fails to include it, let's just
print it in stop().

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5c9d2b24a3..204ad8b918 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -535,6 +535,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            if not self.runqemu.stdout.closed:
+                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu_exited = True
-- 
2.31.1

