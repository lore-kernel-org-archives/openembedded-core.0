Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.5144.1611736270887366793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 00:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I0nT066t;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id c18so1078023ljd.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 00:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ra4oMm9qGQ3dDzp6XxxPoP/AreaFvv4U6DzQRtSpxHc=;
        b=I0nT066tXMIELOIQ4XPc64Mt7m3Cuan/L3eoPmg/0R4bKjOseL+JX3cDkFc4kZ6R9H
         iTR58ph+d/84HSpnyFh/4SjFzw3+aIRLe0bZEJcLlZVk2IhHJ3i68cfkkpCI7EfmfUIW
         AQXl0y0u0zEmOi69ssKQ7QeGNiQjsxgAZx7ecX/+sMporljIJyWFrBObpZbt4XojHqPa
         zIXiuY9k4utBNo7gtS3LIpDhIXkhMmDmVtQDLgQkFnc3Vr+4oLsKXUXYbesPLYE1Xubr
         8La9Ik7lfQfJk+frcVI/knXyjo7sdn+zHaCr4H3Fda4CI1GoNR0Rxs/AQ3/4In6GlB9y
         HaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ra4oMm9qGQ3dDzp6XxxPoP/AreaFvv4U6DzQRtSpxHc=;
        b=YLEZmLVQHFRjSHYe/+OK3DKuRK6XJ8oU0STsJzuDQzsH8o/V4YLXP6KiiJVpzL6rE/
         Qk4Yhlpac9j0zdE1ydg0xLtANoFaQtkWyiWqNvs9sN0nRqcbRSel4MQbw9jJ66TL7H67
         m59kZQ1hEZ/AVax4YlgDkZR5WLjkDQsIyJZqHwtX7N/C2JdtFbjWY+pJh9ghLEz7ilHn
         Z2mKhsk1x6qEJBV0aw/WSGC9I5loEWjzdRjxZTA0Ferea7ctchIeduXjK3lAKJ01h9+V
         K3tLgMBHfoGGOM0UISn94NM1r0nCpq/ej2vzbUKel0QWJ5OeWdjW98d2Z85YweGdq+AT
         tLmw==
X-Gm-Message-State: AOAM533+SyJYuOrKaDDDYsqg3sW731j2OkxTXOS5AZeZohe5MH57M8JN
	UYqJAhXaozurOfZhFEYWtIQAGZWIFRs=
X-Google-Smtp-Source: ABdhPJyUVlNvvmvFNHnOKC31mxNqpyJwRET1KLPCSFiQHyZK9lmU/y0MkFQMtwQH836QYh6W1cNK1Q==
X-Received: by 2002:a2e:914b:: with SMTP id q11mr4901698ljg.503.1611736268646;
        Wed, 27 Jan 2021 00:31:08 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id r26sm328152lfi.295.2021.01.27.00.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 00:31:08 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] externalsrc: Detect code changes in submodules
Date: Wed, 27 Jan 2021 09:33:31 +0100
Message-Id: <20210127083331.2561-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The srctree_hash was calculated only from main source directory ignoring
changes in submodules.

[YOCTO #13748]

Use submodule--helper to determine all submodules, and calculate hash
from all git tree objects names combined.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/externalsrc.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 7a7d31e311..64e94e3301 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -190,6 +190,7 @@ def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
     import tempfile
+    import hashlib
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
     git_dir = None
@@ -214,7 +215,16 @@ def srctree_hash_files(d, srcdir=None):
             env = os.environ.copy()
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
-            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
+            git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
+            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
+            for line in submodule_helper.splitlines():
+                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                proc.communicate()
+                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                stdout, _ = proc.communicate()
+                git_sha1 += stdout.decode("utf-8")
+            sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-- 
2.30.0

