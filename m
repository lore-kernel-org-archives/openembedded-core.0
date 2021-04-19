Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.6423.1618822852649871829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJgRZgMa;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g5so44989760ejx.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Q3Zd1UgX1yya9R5OMyaDrNG8nSLKOo7l+168neRKPc=;
        b=RJgRZgMamBGZJy3m6FhaKMKbPDYG+S/nkQdxf9LC8Bib/KWHEJ2u/exf9caRp/ssig
         6jqPyF7sKvzE8wq/t5S0niup7Yd5Ng29cTAteSMEmwPRJQUGlg3S/4bV1G6gz0trlFIh
         XuesXmXGF6r3PyjYXjmfrARWgjboZqOod53JZXyK7AZaF3GVTTFXX6MomuDbu5B8mPJ7
         dMZs6Q5K3OrUSchyj0a3UB1CXTQNobvO84v8CquIektIx8qYDngs3/ssAh1bFx40y3Cs
         4+e4Ktzt6I7YAVAWuYlZTt6lZWMBdEWDjuuarBSfbHxzmQtUfZjTLR92POETP1e5lYj4
         LgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Q3Zd1UgX1yya9R5OMyaDrNG8nSLKOo7l+168neRKPc=;
        b=JNNLqSvSWa3bLrD02GJzJizTdQ/AHsYtFv6AkvGP+23ipHBccOc3I/7w0Wmn9S8ByU
         FfoRnUhaCTYus0UbDRP6s09rYkIBk+lq4K3kxtwMVUAjuOkZi6pEV+/1ekmfYLv/EFYZ
         EoLLwS6eixJ5gRN7BSFY3fPO6mFF/xfRe/Ll7mnFVvqnOn3qTsON1sIFijqjuHgR/75W
         meBwsXxR/IxXcwMV2cbJMYTYYiI5KbaLj7TMlFiXKZMrZGiOmsSuXavry/15qSpgTtFU
         EYIuCvSk60rTCgr+UyS/39ycQIOCirtvdGtJB0Tw1gVwOOmY7XFpcWYCWBf0/j6+AsMI
         hROg==
X-Gm-Message-State: AOAM533C6Lh6RSw1X7dCSFMlsDfWAMqp3Zxs7aOGVObq8PmD9wG1fBp0
	ywPTlHXPCb/h23ZPDIBhzsJ4i+3GIPuapQ==
X-Google-Smtp-Source: ABdhPJxJtrdEto/VGm9vZVIKNbYqPURb54rQ8YU/TjsOObrzVAOyJaVJnCwVc716ke/YhAzEFOBaUQ==
X-Received: by 2002:a17:906:4e93:: with SMTP id v19mr20586006eju.215.1618822851198;
        Mon, 19 Apr 2021 02:00:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id dc24sm3596474ejb.123.2021.04.19.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:00:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] scripts/oe-debuginfod: correct several issues
Date: Mon, 19 Apr 2021 11:00:41 +0200
Message-Id: <20210419090044.582453-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly:
- nesting subprocess.run() inside subprocess.check_output() does not work at all.
How was this tested?
- -R and -U options can be combined; no need to separate the invocations based
on packaging format
- both exception handlers are unnecessary; we can simply print the hint if
invocation did not succeed
- to run debuginfod from its own sysroot, '-c addto_recipe_sysroot' for elfutils-native
must be executed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/oe-debuginfod | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index 967dd5807c..5560769888 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -20,12 +20,7 @@ if __name__ == "__main__":
         package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
         feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
 
-    try:
-        if package_classes_var == "DEPLOY_DIR_RPM":
-            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', feed_dir]))
-        else:
-            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-U', feed_dir]))
-    except subprocess.CalledProcessError:
-        print("\nTo use the debuginfod server Please ensure that this variable PACKAGECONFIG_pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-    except KeyboardInterrupt:
-            sys.exit(1)
+    subprocess.call(['bitbake', '-c', 'addto_recipe_sysroot', 'elfutils-native'])
+
+    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', '-U', feed_dir])
+    print("\nTo use the debuginfod server please ensure that this variable PACKAGECONFIG_pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-- 
2.30.2

