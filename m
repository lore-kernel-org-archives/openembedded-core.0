Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1519.1588648861815432327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=T6CEloj3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id x10so255637plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cqPdoxM1KpREm6dvNdPxbg8qRdltSQz799FQ5LTExoQ=;
        b=T6CEloj3ag300u7zc5xz/UyKeiVE1x3T8WF4LohonN6l1KiocZgDi5r7V2mBQ/ZBte
         E5imXx/b515vB+yf1NpkInc8MqAD1gEqWcslfcUbbLra2WdPd2gk+wsIP98xGcsYluBW
         Xo9pPQ6MudUhS46dlfatV93BNSJf9Yn2GzD3DYT2w6kF9/FrcXqGLK/azfo9ggK/ImyM
         d9kNAPAsB/Ch+bR9dyIgFJ1RE+OQCkRd4rjr5E/S7s5Oo4miXj+5OwXcDersXiauIGlh
         TwwSDrrO9XRKeNWlMVAmwDM/k3U/RTuWY5cESDT/lumR0g7S1tBAYKMlalo+rw1ESPkK
         Qs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cqPdoxM1KpREm6dvNdPxbg8qRdltSQz799FQ5LTExoQ=;
        b=EO/soLqaIk6L5InVyASXtbbC8fVPuX6in/oOYAfDkWB7DPwolD0jvpZzW9NnngLHyG
         Huo6lOYA8KE3dwOjR0h0iAglChLE1ErgzyUBLqNql9hYZznwUmbv884YFUVeSlwVqVsI
         Yr8652gTbwUSp0euGMK53q4ontr4iVG7Z1g6t3M67F8Mgy2zRmgQjwDTKjvxUT/TmNG2
         ajfAqGK2a8i6FU7+sld8GxOIuc8yD+7MCjGIj7zPqRcC3tESQ7Mbr9PVwuIFQpBKCHI3
         EFg7oekq7dUsHhx0UCpFd9+5qic9BWJUSruah8w2hOgLVFh/UtAf+rSj7Qoi0EvdHWRe
         fhVQ==
X-Gm-Message-State: AGi0PuZ2kDCs2PU+8LlVSCA42/C3NfsDMLG+XGDZ6SNnp10soYoSH19S
	Dxrg4WClC3x2W3gw7x+To55lwij9J6A7LQ==
X-Google-Smtp-Source: APiQypLS8TgVHJ+mxsZXBipaI6wab5JT7RjPlH5z74UKS47ZHleCee52unhUMMteFW4YVCJMzHQPAA==
X-Received: by 2002:a17:90a:d98e:: with SMTP id d14mr316735pjv.178.1588648860775;
        Mon, 04 May 2020 20:21:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/28] oeqa/qemurunner: Clean up failure handling
Date: Mon,  4 May 2020 17:19:16 -1000
Message-Id: <83b8e66b66aa9848ed9c8761a21cb47c6443d0c6.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you fail to setup the tap devices, runqemu will error quickly
however stdout/stderr are not shown to the user, instead a SystemExit
traceback is shown. This could explain some long since unexplained
failures on the autobuilder.

Rework the error handling so SystemExit isn't used and the
standard log failure messages can be shown. The code could
likely ultimatley need some restructuring to work effectively.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7ae309845a..cd95d33bdc 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -36,6 +36,7 @@ class QemuRunner:
 
         # Popen object for runqemu
         self.runqemu = None
+        self.runqemu_exited = False
         # pid of the qemu process that runqemu will start
         self.qemupid = None
         # target ip - from the command line or runqemu output
@@ -124,7 +125,6 @@ class QemuRunner:
                 self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
-                raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
@@ -232,6 +232,8 @@ class QemuRunner:
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
+                if self.runqemu_exited:
+                    return False
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
@@ -241,6 +243,9 @@ class QemuRunner:
                     return False
             time.sleep(0.5)
 
+        if self.runqemu_exited:
+            return False
+
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
                               (self.runqemutime, time.strftime("%D %H:%M:%S")))
@@ -416,7 +421,7 @@ class QemuRunner:
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
-            self.runqemu = None
+            self.runqemu_exited = True
 
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
@@ -457,7 +462,7 @@ class QemuRunner:
         return False
 
     def is_alive(self):
-        if not self.runqemu or self.runqemu.poll() is not None:
+        if not self.runqemu or self.runqemu.poll() is not None or self.runqemu_exited:
             return False
         if os.path.isfile(self.qemu_pidfile):
             # when handling pidfile, qemu creates the file, stat it, lock it and then write to it
-- 
2.17.1

