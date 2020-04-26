Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.10549.1587905953022461183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 05:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M22Bpq4Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id v8so13788315wma.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uk+l84k5VxecE2eEsTtPTG6QrVD4urKxGHvrC9m4JE8=;
        b=M22Bpq4QQONM3odt+76YEgDJlAHRrkNjQd7TG4dD9luVPAPowFD0CT+DR+X2zdyeyp
         haTm4nPeix3Cq8JT9W+OS7Aax/6G2b7M+IQSjt7mIn9BGCo+gN5fBhqa/7xkVYCt38+z
         aTiXbbg3/Ft5Skuu5ndrD0IiDl5y9XPbXrKVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uk+l84k5VxecE2eEsTtPTG6QrVD4urKxGHvrC9m4JE8=;
        b=MNsdMdoefhy5tLVGqPpkbgiWPgBILE8Los8WoMtXtFOjZpOls03O6iBlrJ7NQEIGCl
         /EW1oLDIYlZDvkGhKOQnKZHDyfZx79Se+XfMjjQAsRaqser6Og7N+dgQAGx8ZA93WjYz
         ghUKhEqkMvRzyvvrBbYy3yCzGXN1jjen4dvjxjb8yowZVRSJ6mnsoz2NZSOjSrYH/164
         BNHmMojYKh3Q/PMPQkRTQo1qWxxbn4FuIe7HbxM8ZgCwtOBHMxHhKi0craB66Ye7jTYV
         by8J1lsF61URoJvnVMC4ebKTcLCs/32kMeNEtdh3X0C5hAreSyJj8SRgYkWiWDr+HDdS
         QN6A==
X-Gm-Message-State: AGi0Pub0mzdLpI84xz3r7gTUB5NBlzW4IHrm6bBSHZdhl9cWr9dgUhbH
	XM3E/qJaMSoUWmBF4bGHPqNd4xJYLoQ=
X-Google-Smtp-Source: APiQypJRuJpgN2FXZi+Iryfz7Q170nirRC97mxfs15qMoI89uzQYABcUj6bvP039tB/Xk980a0F6xA==
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr19999581wmb.112.1587905950894;
        Sun, 26 Apr 2020 05:59:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g69sm11961056wmg.17.2020.04.26.05.59.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 05:59:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Clean up failure handling
Date: Sun, 26 Apr 2020 13:59:09 +0100
Message-Id: <20200426125909.1111587-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you fail to setup the tap devices, runqemu will error quickly
however stdout/stderr are not shown to the user, instead a SystemExit
traceback is shown. This could explain some long since unexplained
failures on the autobuilder.

Rework the error handling so SystemExit isn't used and the
standard log failure messages can be shown. The code could
likely ultimatley need some restructuring to work effectively.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7d9b36f8117..4b743376523 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -36,6 +36,7 @@ class QemuRunner:
 
         # Popen object for runqemu
         self.runqemu = None
+        self.runqemu_exited = False
         # pid of the qemu process that runqemu will start
         self.qemupid = None
         # target ip - from the command line or runqemu output
@@ -125,7 +126,6 @@ class QemuRunner:
                 self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
-                raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
@@ -235,6 +235,8 @@ class QemuRunner:
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
+                if self.runqemu_exited:
+                    return False
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
@@ -244,6 +246,9 @@ class QemuRunner:
                     return False
             time.sleep(0.5)
 
+        if self.runqemu_exited:
+            return False
+
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
                               (self.runqemutime, time.strftime("%D %H:%M:%S")))
@@ -419,7 +424,7 @@ class QemuRunner:
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
-            self.runqemu = None
+            self.runqemu_exited = True
 
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
@@ -460,7 +465,7 @@ class QemuRunner:
         return False
 
     def is_alive(self):
-        if not self.runqemu or self.runqemu.poll() is not None:
+        if not self.runqemu or self.runqemu.poll() is not None or self.runqemu_exited:
             return False
         if os.path.isfile(self.qemu_pidfile):
             # when handling pidfile, qemu creates the file, stat it, lock it and then write to it
-- 
2.25.1

