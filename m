Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.7102.1594552629813257316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 04:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5svZRJ5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id o8so10461569wmh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qc98/RZnfxBmDJAIgHff0I88/cuZDuMgoxIUx2cOBBM=;
        b=D5svZRJ5rVjTdfrW457uwyXtWMMF5kidl00i6IZAqhl76/1v9hY60+tsUPSfs8nZut
         YacxOlK5PlxphhIuUPdUV3tJT2SO1q0K6ndgDMOurA7aOiwPJaYHXDuRXaNAioKdbbX7
         J2fQ93KHqlVY0dRMkLRUyQbkUUMgddmOtIiEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qc98/RZnfxBmDJAIgHff0I88/cuZDuMgoxIUx2cOBBM=;
        b=bWt0bw5yzdPCzzKZfORIq0k7K74nE0hYnxqsGlYfkBeOv//dB881ZRziikhhKTvHPs
         sezWPXmSmzbxgZ6LbPNe49VU6Ho2jJ4Z+pTuRUh+62dCZzrIVBupug8xKVTXplv1d4l0
         Nz7sV26THPRwiZMcPsW6kfMXsHL9pO16/smXCbJNb7nmRADFUAaNeE6uspDMw/oW/Q8j
         tIT7g8sOMC9YjbFECPvEqFxu1rDZyazK/W30jUi4KTUZGeiXL79FMs/aL/tBt0tnDUVC
         vUsLuRotoO41Lf+prINAIuVSip8eZ5YcTaVmFxlpoju9dS4XvvsmtcOjnR+lT2gIrvy+
         kkZg==
X-Gm-Message-State: AOAM530l3T/zAyYaTcCzw2uuzggKhc+E8A/MDDoFYlb1nuGCw60BPx4B
	FSCeZdjG2D8uvSBqK03g4LUwmnN+g060/Q==
X-Google-Smtp-Source: ABdhPJygszT9Ur34njHHRhehk6t4A49ldtJEJne94E4f8QfvTxZZmQ1osGGx9rxZmwBeW2U3B7F1hg==
X-Received: by 2002:a1c:6887:: with SMTP id d129mr13764197wmc.179.1594552627742;
        Sun, 12 Jul 2020 04:17:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w13sm18847760wrr.67.2020.07.12.04.17.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 04:17:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemurunner: Ensure pid location is deterministic
Date: Sun, 12 Jul 2020 12:17:04 +0100
Message-Id: <20200712111705.509644-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pid location could vary due to changes in cwd as only a filename
is specified, not a full path. This in theory could be resulting in
some of our autobuilder failures. Whilst its difficult to know if this
is causing a problem, Using a full path removes any question of such an
issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 992fff9370a..486d2bb8932 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,7 +32,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -63,7 +63,9 @@ class QemuRunner:
         self.boot_patterns = boot_patterns
 
         self.runqemutime = 120
-        self.qemu_pidfile = 'pidfile_'+str(os.getpid())
+        if not workdir:
+            workdir = os.getcwd()
+        self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
         self.monitorpipe = None
 
-- 
2.25.1

