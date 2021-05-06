Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.6378.1620287462814879769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 00:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y1bFp9D5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id x5so4504332wrv.13
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 00:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3dBpaU0t6iZ4bp6Tkm5oTRqdoilrr1hL5YgvewAkaD8=;
        b=Y1bFp9D5OcuyM9PwLEBscvLZneIwddXOAQD0ZOJ3TffTnEhW00q08qHzYrWd6mMZHQ
         Dilr/Q3j1o7dT+CtEsRCyiyW7Vi2JjRZia6Gr8uNw9X2XGJBN8oLW/SlUoqTeVEcqD6t
         CBVMXwKToSsCBLkulxJtwqvn10pTFhGg0AXxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dBpaU0t6iZ4bp6Tkm5oTRqdoilrr1hL5YgvewAkaD8=;
        b=FVQSL2Jrfj/os2hiT127QwdIo1LfPYgU8JV6FDzR6rigJ2lZSrB8g4l8AnPiKR9YgW
         SzBC7B70KpdS0BHzYZA+qSPfTTg4TXvfLG4FQE+kL/e/CU06IraTNEJGavYT6q2li2ug
         ssctNFWIfJ680VxkDlXw2JrwhPXlaqU2XtMI1JOJPfIAAkP/FeJUO+TrK/EEczXr7ijX
         ngPNE0MAh/85Iq5BE6OnZRHqlS8XAPB/VPqq2Mtnj1nsg9Ov6C0LxdphuDNr5kGbCj8a
         8FRkK15MMM9RL3zurApZ8enzUQyAYixTocjmw6juhIGohVK3KLFB/fZrrZtq2KZKSN/O
         xWRg==
X-Gm-Message-State: AOAM533aZC6i9qA9IEx7MHks8aeWoSE81dnVEAWJ4H84WRn2ww3a3pK+
	S9BLGMYD1GDQx4VdVMwoUMlpkZJdPFV2Cg==
X-Google-Smtp-Source: ABdhPJwmRnvSfXxIsUHKphXdgvw6oFk+dH2yK9KhADe+e346pfc+7z7biBtFEBeUXjzNQVdbnSCbXg==
X-Received: by 2002:a05:6000:cb:: with SMTP id q11mr3400145wrx.13.1620287461277;
        Thu, 06 May 2021 00:51:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id q16sm2251437wmj.24.2021.05.06.00.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 00:51:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/qemurunner: Handle path length issues for qmp socket
Date: Thu,  6 May 2021 08:50:59 +0100
Message-Id: <20210506075100.1984260-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
References: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the addition of the qmp socket, runqemu started failing:

ERROR - Failed to run qemu: qemu-system-aarch64: -qmp unix:/home/yocto/actions-runner-meta-openembedded/_work/meta-openembedded/meta-openembedded/yoe/build/tmp/.3eg5fiid,server,wait:
UNIX socket path '/home/yocto/actions-runner-meta-openembedded/_work/meta-openembedded/meta-openembedded/yoe/build/tmp/.3eg5fiid' is too long
Path must be less than 108 bytes

To avoid this, run qemu within tmpdir and use a relative path to the socket.
This avoids having to patch the socket code within qemu.

Update the client code to chdir and only use a relative path to the socket
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 56 ++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cb0be5603c0..3d3213d3d31 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -186,8 +186,10 @@ class QemuRunner:
         except:
             self.logger.error("qemurunner: qmp.py missing, please ensure it's installed")
             return False
-        qmp_port = self.tmpdir + "/." + next(tempfile._get_candidate_names())
-        qmp_param = ' -S -qmp unix:%s,server,wait' % (qmp_port)
+        # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
+        qmp_file = "." + next(tempfile._get_candidate_names())
+        qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
+        qmp_port = self.tmpdir + "/" + qmp_file
 
         try:
             if self.serial_ports >= 2:
@@ -224,7 +226,7 @@ class QemuRunner:
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
         # to be a proper fix but this will suffice for now.
-        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env)
+        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env, cwd=self.tmpdir)
         output = self.runqemu.stdout
 
         #
@@ -287,31 +289,37 @@ class QemuRunner:
         # This will allow us to read status from Qemu if the the process
         # is still alive
         self.logger.debug("QMP Initializing to %s" % (qmp_port))
+        # chdir dance for path length issues with unix sockets
+        origpath = os.getcwd()
         try:
-            self.qmp = qmp.QEMUMonitorProtocol(qmp_port)
-        except OSError as msg:
-            self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
-            return False
+            os.chdir(os.path.dirname(qmp_port))
+            try:
+               self.qmp = qmp.QEMUMonitorProtocol(os.path.basename(qmp_port))
+            except OSError as msg:
+                self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
+                return False
 
-        self.logger.debug("QMP Connecting to %s" % (qmp_port))
-        if not os.path.exists(qmp_port) and self.is_alive():
-            self.logger.debug("QMP Port does not exist waiting for it to be created")
-            endtime = time.time() + self.runqemutime
-            while not os.path.exists(qmp_port) and self.is_alive() and time.time() < endtime:
-               self.logger.warning("QMP port does not exist yet!")
-               time.sleep(0.5)
+            self.logger.debug("QMP Connecting to %s" % (qmp_port))
             if not os.path.exists(qmp_port) and self.is_alive():
-                self.logger.warning("QMP Port still does not exist but QEMU is alive")
-                return False
+                self.logger.debug("QMP Port does not exist waiting for it to be created")
+                endtime = time.time() + self.runqemutime
+                while not os.path.exists(qmp_port) and self.is_alive() and time.time() < endtime:
+                   self.logger.warning("QMP port does not exist yet!")
+                   time.sleep(0.5)
+                if not os.path.exists(qmp_port) and self.is_alive():
+                    self.logger.warning("QMP Port still does not exist but QEMU is alive")
+                    return False
 
-        try:
-            self.qmp.connect()
-        except OSError as msg:
-            self.logger.warning("Failed to connect qemu monitor socket: %s File: %s" % (msg, msg.filename))
-            return False
-        except qmp.QMPConnectError as msg:
-            self.logger.warning("Failed to communicate with qemu monitor: %s" % (msg))
-            return False
+            try:
+                self.qmp.connect()
+            except OSError as msg:
+                self.logger.warning("Failed to connect qemu monitor socket: %s File: %s" % (msg, msg.filename))
+                return False
+            except qmp.QMPConnectError as msg:
+                self.logger.warning("Failed to communicate with qemu monitor: %s" % (msg))
+                return False
+        finally:
+            os.chdir(origpath)
 
         # Release the qemu porcess to continue running
         self.run_monitor('cont')
-- 
2.30.2

