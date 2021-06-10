Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.984.1623364895219960928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 15:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bDWdNbG9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so7564579wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qIy/pKHZoThplymdGaCeb709NI8PZkHhc33OEuAP0ZQ=;
        b=bDWdNbG9sjF5F3X2LAGLQ77SzSs2JOcUCNyKAPEazvgmyDdkns1CMW4mw30xV3GBNf
         eD8e+EsMzt2ZG0kgs8egswg1aONKz74g8XMIaFPR/2apW7nUJ+F0HBWSx/M2TlGxI36H
         XaBwI4rfRfi5+aT1XZOPSIJPhzuzFV/WP5K3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qIy/pKHZoThplymdGaCeb709NI8PZkHhc33OEuAP0ZQ=;
        b=quTuM3vuxA+ANVOVyfq50zGg0RMNsk6PERhSf3I2Z0DVCksqe5Z3DpTm4hblmhGlXA
         KSSyPf1NjqRquDvAj0SMfDK2i0n4tbXLD4TVGB9XswLVIacgzH+GVSf84pQnQ3F0LUEv
         7ONeP2xMJCwAckaTOC7v9E14FKBJmruE+uurtspc7ApNK8sc+UcHKg8mVMPnY2NpdF8a
         5qY7/e50IJpfV4BMCYtk5+e1BxdoGCy/OEEkL4KzVmdAGd+Neq8LyqO5JfuHnu/Um7o6
         o/XJm39odfUai3RxbhHrYO3bVEGFCawqIbhWLuciRpGlBO+m+ZwpoodLw5v18KqLENsM
         nwQg==
X-Gm-Message-State: AOAM532cx2hKLxpSLlvILWq+4LKTFV05+2iVuh25j6SRDxprKeGP6MKX
	dQxJtQDHrhSX1ndCHLmCsbzCGE48CIbT8g==
X-Google-Smtp-Source: ABdhPJz3b6BNI7fr1fnmnkLLH5H1MrNDwoLHZlXBfsa0QKRcQII9Sq645FI8VCSWsdtMG2hVj76GIw==
X-Received: by 2002:a05:600c:4b87:: with SMTP id e7mr958949wmp.101.1623364893292;
        Thu, 10 Jun 2021 15:41:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a367:b677:9781:a62b])
        by smtp.gmail.com with ESMTPSA id p5sm5039598wrd.25.2021.06.10.15.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 15:41:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemurunner: Try to ensure mmap'd libs are paged in
Date: Thu, 10 Jun 2021 23:41:31 +0100
Message-Id: <20210610224132.3167671-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've seeing issues where IO load appears to cause strange failures due to timeouts
within qemu. One theory for these is that it is is hitting hard page faults
at in-opportune moments which cause timing problems within the VM.

This patch is a bit of a hack which tries to ensure the data is paged in
at a point when we know we can take the time delays (waiting for the QMP
start signal). Whilst this isn't ideal, it does seem to improve things on
the autobuilder and shouldn't harm anything.

The code figures out which files to read my looking at the mmap'd files
the process has open from /proc. On Centos7 systems these files are not
user readable, if that is the case we just skip them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0032f6ed8dd..24af2fb20bb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -342,7 +342,24 @@ class QemuRunner:
         finally:
             os.chdir(origpath)
 
-        # Release the qemu porcess to continue running
+        # We worry that mmap'd libraries may cause page faults which hang the qemu VM for periods
+        # causing failures. Before we "start" qemu, read through it's mapped files to try and 
+        # ensure we don't hit page faults later
+        mapdir = "/proc/" + str(self.qemupid) + "/map_files/"
+        try:
+            for f in os.listdir(mapdir):
+                linktarget = os.readlink(os.path.join(mapdir, f))
+                if not linktarget.startswith("/") or linktarget.startswith("/dev") or "deleted" in linktarget:
+                    continue
+                with open(linktarget, "rb") as readf:
+                    data = True
+                    while data:
+                        data = readf.read(4096)
+        # Centos7 doesn't allow us to read /map_files/
+        except PermissionError:
+            pass
+
+        # Release the qemu process to continue running
         self.run_monitor('cont')
 
         # We are alive: qemu is running
-- 
2.30.2

