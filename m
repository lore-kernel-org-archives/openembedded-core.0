Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.8319.1611920132772929110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 03:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N+MKI59k;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id h12so12016920lfp.9
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HF9guK51DFxbWv1Kf/aSC2jX82ezEmBUWhHCfn0B2eg=;
        b=N+MKI59kC6IKBsy9pe0v/4dX0W9Exdiw71L4vIwIfR23wRYwKLp8q46uxUp9PXhsZR
         jwhMywdWfkVXj9XbLyXA6/eWUVK2HVvXJ13VOxGu6holSw1yigow/dgQOpDbKUqAG/1C
         29fG+T8uTBxQqlYqJW2RsBNMHk/5Ehl/+WmQurTS7BBYWSZhfwmIvyrwLvJRXnbvDpo2
         bDsTG0K656tEUUvIYRg3FsY8bRkk0+6R3FYJqdUhI34tuRuYCFh8m7oVxONOkMfuxjWW
         Z0rHI/AG4SIe8S7fVSACrEqgzzlOSKjuHw5+qOt7KKxs1ChJPlklU5iTkGQDrOaK8gzG
         L8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HF9guK51DFxbWv1Kf/aSC2jX82ezEmBUWhHCfn0B2eg=;
        b=Xju2h6UFDgi0b/0JPk3KCLfieeeYhSDWl9nCR1VdKppMUnDT0H1EGLiyRqZEhVuWo6
         Oiasyjp+9t+EuQDt0vfwPieREs4VSHICB8lnWPojWGqEn7rmD5gGHdIrcb0fQqlr874U
         HXOIQ8avXj231kOM/6XLlLZF2JDP1dgQmBejb+CzOwmL/g/HOlWnwb0TEImxZunHxQGN
         0M7SnwrND7LYvYvC8fWfHv8CprMm1O9VU06ZOe+HBGa0gKb4nH9YYFydbuqoAbcek3sX
         +aZKFUQtukPchjQ33YlUVPMziVw4QkzVqc0bMus+qUo2cjxqjbB3t5kUj9ooAc0sRtkI
         nhhA==
X-Gm-Message-State: AOAM533ml600C7diMyKve5OiI1EnaJ8woefIq9E2CAPFdEiQ5O95B6GF
	7UWKKi/18O5XvVVBm1j5mWvu6X+90CDReQ==
X-Google-Smtp-Source: ABdhPJz22cERjFMQvAWMxY2Pn+zZ/GJQGPVUYUvkRc34s0kdr7/KIUIUfcRiCs9/P3wkc67P8ZcRRQ==
X-Received: by 2002:ac2:54ac:: with SMTP id w12mr2028639lfk.514.1611920130650;
        Fri, 29 Jan 2021 03:35:30 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id j12sm1975683lfc.99.2021.01.29.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 03:35:29 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] lib/oe/patch.py: Don't return command stderr from runcmd function
Date: Fri, 29 Jan 2021 12:38:08 +0100
Message-Id: <20210129113808.16982-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a function returns any stderr it will be passed to extractPatches and
used as path to patch.

For example subprocess command output can be:
| sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
| /tmp/oepatchhuqle8fj/0001-foo.patch
| /tmp/oepatchhuqle8fj/0002-bar.patch

that will result in:
| FileNotFoundError: [Errno 2] No such file or directory: 'sh:'

To fix this I separated output, made the function return stdout and
print stderr only in case of command error.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/patch.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 40755fbb03..8ad70f53f1 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -38,15 +38,19 @@ def runcmd(args, dir = None):
         args = [ pipes.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
-        (exitstatus, output) = subprocess.getstatusoutput(cmd)
+        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        stdout, stderr = proc.communicate()
+        stdout = stdout.decode('utf-8')
+        stderr = stderr.decode('utf-8')
+        exitstatus = proc.returncode
         if exitstatus != 0:
-            raise CmdError(cmd, exitstatus >> 8, output)
-        if " fuzz " in output and "Hunk " in output:
+            raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" % (stdout, stderr))
+        if " fuzz " in stdout and "Hunk " in stdout:
             # Drop patch fuzz info with header and footer to log file so
             # insane.bbclass can handle to throw error/warning
-            bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(output))
+            bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(stdout))
 
-        return output
+        return stdout
 
     finally:
         if dir:
-- 
2.30.0

