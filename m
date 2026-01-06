Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC805CEFD0C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 23:36:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3487.1767742601143031026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 15:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM6Dj4qC;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79e7112398so248702266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767742599; x=1768347399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srcfT1rlyhKI+YRmab0v5zR9WC1NwWP1vGmJyWFklgE=;
        b=VM6Dj4qCGLA1tPXPm+wJVUroTNzQV+gNcbDgu/hJbQPP4Gbn+WLzWB2rt24QrmZYOH
         6+m7H87FtgVsV64RtBAOY/R4PhxljbeGNHqEA1qiPSHfggxmXykrclLe8aKutYJUNKWp
         uDnuqapaCGCEq8PbPqIUnou9Q/kbmdbp9KXZaR0ex7i6am4R3JOW/W+kiDdrQ3LU6CSw
         5jO1E2TN8lgtzTmTs6bibbkVEjPktPT5TFohmsrUmuJd1PI/mwA0wb6O31TwW/hDA6gf
         LbwV1d6qAEJqnrTpiIJPwDdjF3QmaETBjJM3WdfuXlP8/Yn4G5Kt9gDQiIBmpZQL1oy7
         WJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767742599; x=1768347399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srcfT1rlyhKI+YRmab0v5zR9WC1NwWP1vGmJyWFklgE=;
        b=R/lI7dEB8CNH96uYCxfC8zGBLVxmeTa5PiCqvzvwGuUyr/rwG6JR8ARvK5dQME1GPV
         MnQgGEKFznXxqmtgARjsL+iTCiKtCNA76zi0hgFCUdmGX0kZreRlLRp5qrLbPLfRsm+5
         Q3Y6y/tJQVbSKSUqY3yonjx6REjVQFvNaQq/owM6Y6WqtWBFQ47U8O3jO4Lz51KYrY/R
         zSjFPYgwAmljd1Z+qYM+GDWetW/mN1u+EWbouhL9iMVYlf7lJEzXt/PfxxX+MesIwIlW
         8IRaWb5W7pZ7KWvuQ7OwBnWfAEQUkZ7WtfR3X/n/2edKQnlQ1p3xQPqHneQX42+CPN8J
         8jGg==
X-Gm-Message-State: AOJu0Yxzl75+DzMtlY0WEcVpyfeLEeB+ZNhY04m5RQBsNSXNdCiojf0O
	ci7rUal6+Ff+T+L2b0Wlsz/bdUEj5VFxgaC+t9zkfzT970Ed+5CVw00d34gTzPyE
X-Gm-Gg: AY/fxX4mFCeIflC3NtOMjZ8Kfm1NBV8NqR19fIUiwokKdChyHZtx63rNwt+8RTQcd4g
	snio25Ju+t81FnCzrCZdg2bmp1zxHA+X4vg5LhpTJCek0yOZu/9oSw7VVetJpnBcvcV+G8hScJo
	oMoQdUHVXjX8ta8kdE7rP8fIpdFoywB/c1WceNNBeavCkXLzuRqJMSZcPkpkRRWV2O2pvfJpwiG
	c8PcIwHWl0+SrL5Ss7vOiSxgAbAkVa0QS+P0un+uYXo/Jc5FwELBWg2PQt0IvRH5ntlRsSvfDuY
	LZ1oKOcBOd02FAcuAHAlcFJklkEZWYeKnHmIPPW3Q1dagTyaFHr2zCLKFTa9y9t1reWANYK31id
	4dU50cG9wo8O5FzU9FRAYnZel6kRnykFNo1O4uuwuo4cH6OvO6yzOUVah6L33A+dKVOh4rEVmup
	F8dUbPGThiM4WdRSg8XBf9MwHBeXrjYEHzEAD3OtN/GhmzitgsfkmvnIY8DKDubdOx
X-Google-Smtp-Source: AGHT+IFuhjhhyWojO647nAPXhf4+RXqs/REsbQmV0WgxXqaDEnPn7HEpIoDZdXRoi3vRdb7TdhZ/4w==
X-Received: by 2002:a17:906:d54a:b0:b73:75ea:febf with SMTP id a640c23a62f3a-b84453fea5dmr74976266b.55.1767742598562;
        Tue, 06 Jan 2026 15:36:38 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2338cbsm339208166b.14.2026.01.06.15.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 15:36:38 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kanavin <alex.kanavin@gmail.com>,
	Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH] Devtool: Make qmp detection for qemurunner more robust.
Date: Wed,  7 Jan 2026 00:35:40 +0100
Message-ID: <20260106233539.1886869-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 23:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228941

As discussed here: https://lists.yoctoproject.org/g/yocto-patches/message/2762 the detection of QMP is currently based on the fact that it expects `qmp` 
to always be available under the same directory as where the logfiles are stored. 
However tools like AUH might adjust TEST_LOG_DIR to another location. This causes qemurunner to no longer boot as it cannot find qmp anymore.

This patch addresses this by using the available information with qemurunner:
- we have the rootfs name for the qemu image
- we have the folder structure where we expect qmp to be present.
Based on this we can construct the path where qmp is actually located.

For backwards-compatibility the old path detection is:
- still working
- always tried first before the new method.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 39 +++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c4db0cf038..579f7a572b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,6 +20,7 @@ import string
 import threading
 import codecs
 import tempfile
+import glob
 from collections import defaultdict
 from contextlib import contextmanager
 import importlib
@@ -186,17 +187,35 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
-        # use logfile to determine the recipe-sysroot-native path and
-        # then add in the site-packages path components and add that
-        # to the python sys.path so the qmp module can be found.
-        python_path = os.path.dirname(os.path.dirname(self.logfile))
-        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
-        sys.path.append(python_path)
+        # Discover qmp module location robustly.
+        # 1) Try path derived from logfile (historical behavior)
+        # 2) Fallback: search TMPDIR/work/*/<rootfs>/recipe-sysroot-4native for qemu-python or site-packages
+        candidates = []
+        base_from_log = os.path.dirname(os.path.dirname(self.logfile))
+        candidates.append(os.path.join(base_from_log, "recipe-sysroot-native", "usr", "lib", "qemu-python"))
+
+        # We can deduce the location for qmp also from the image which is being called as we know:
+        # - this will have qmp in recipe-sysroot-native
+        # - this will need to be called as this will derive TESTIMAGE
+        for p in glob.glob(os.path.join(self.tmpdir, "work", "*", os.path.basename(self.rootfs).split('.')[0], "*", "recipe-sysroot-native", "usr", "lib", "qemu-python")):
+            candidates.append(p)
+        # Print all candidates to the debugger
+        for candidate in candidates:
+            self.logger.debug("qmp candidates : %s", candidate)
+
         importlib.invalidate_caches()
-        try:
-            qmp = importlib.import_module("qmp")
-        except Exception as e:
-            self.logger.error("qemurunner: qmp module missing, please ensure it's installed in %s (%s)" % (python_path, str(e)))
+        qmp = None
+        for candidate in candidates:
+            if os.path.isdir(candidate):
+                try:
+                    sys.path.append(candidate)
+                    qmp = importlib.import_module("qmp")
+                    self.logger.debug("qemurunner: loaded qmp from %s" % candidate)
+                    break
+                except Exception:
+                    continue
+        if not qmp:
+            self.logger.error("qemurunner: qmp module missing; tried paths: %s" % ", ".join(candidates))
             return False
         # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
         qmp_file = "." + next(tempfile._get_candidate_names())
-- 
2.43.0


