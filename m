Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.36625.1612196829620460146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lzT24ufH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id d1so16824730otl.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K9nix8KzX/2GeIbsosi+FeoxXhHdkmN61q6KEpL3DfE=;
        b=lzT24ufH3QkCbLhIC9OuqybkkwE5m1PEkYh85R6dkIQI25tTGRwtlrl8cn8sL3mBRk
         KH0Bhv4/WhxYQe6qmOAcnq763TmQ0eZMgXFh/ZnLAO1BicJi7Vc2sUvXDK00nq++yLHc
         dUCuEmwvaRmvORWufnH1Ui5K+J/cGKmmOJNu2Guf1PuUOfTq8MPanvKayNpsKux1VnRB
         iq4QnSkP7Yr9U0rjMmEwCcXjkHa/KFEuyU2jrmvwvPCvMD/oWY5qOepC4A2+pJnp48XK
         0e3ptC5jB94oW0fpAI0/xp6VFhMhnP5jyb5OalWxjqOvoMPc3PISEalZHu2qmHSHZACU
         t7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9nix8KzX/2GeIbsosi+FeoxXhHdkmN61q6KEpL3DfE=;
        b=mDIlZrvSGswVrOem1BaN+jFRIY8uh8e+u0DOeq88PjuJHegmkTYTcJSmpshlBvX2wH
         3A2zpQmLaNiehAVqbH00XqO65yWprRhnQYAHs/vVO4lJK51mk/deBPvmjzJsBxs1TlyS
         4JUnLZbCj4oZ09nZ0bMLPzZdCe4fIgG8QoH0Tw13sUw5M2LtP9TGrRIxZo2tIeujAJRh
         D1I0DhladgBCizAGWGUp9xMTyL3sOnQnXHbcbapdX82q4odeGA6OkOpMBqaHR9sq70Y8
         7P8sFfPZrabwmhutzK9hMysDHnXn3EBWllONap7Pe5nEwoBoXw7LTfh6+XVDljEhYPi/
         0kCw==
X-Gm-Message-State: AOAM532iuxLWOp5ILKDZBEsRmc2cWlWdwB3F/RuBYCFeHUHgbaxFVGLQ
	vMI9BOT9BE1RBcUX8X633eMCxi1PxWWJTgVrhBE=
X-Google-Smtp-Source: ABdhPJy7A2daDlS/LGq9ZAeZcVCmL9keRBJrAeaqMPDi0iVMP/bDs3ITDme6/gxG2CU9C/Y4m5AqRg==
X-Received: by 2002:a9d:7b4c:: with SMTP id f12mr11604276oto.144.1612196828494;
        Mon, 01 Feb 2021 08:27:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:27:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/21] externalsrc: Detect code changes in submodules
Date: Mon,  1 Feb 2021 06:24:49 -1000
Message-Id: <8f972c639ef49df132103c0b3f350b91cf1443b9.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

The srctree_hash was calculated only from main source directory ignoring
changes in submodules.

[YOCTO #13748]

Use submodule--helper to determine all submodules, and calculate hash
from all git tree objects names combined.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50ff9afb3990bcf60b4fa1f937506cb84028c32d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 259ccbc79f..1d7300d65b 100644
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
2.25.1

