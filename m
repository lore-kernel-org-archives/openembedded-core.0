Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13368.1614609799395272895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 06:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QLK0uZ88;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id j2so3568665wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+XaAFmy9SMSRD1fPXmOQSltyZA3WUik8Qs9wpvo3fuQ=;
        b=QLK0uZ8820BO06j1LQBEn3rAlZ0uHox2q1bEzsPoI9/3o+ybCL8Owp5puapBAFkF8c
         Gbc5TR5aaANkbstTuGmvHkl21oVQ/a3TtBKS16sF+LOnFXCDMJJoNOWt9cyLUfnq7x3Y
         hw+I0+bmTw66wh+NQFTIfrD+6vJDlh4paa3Ht8wLzRX9PMg9n8AgI8y8RDL2ttgp9gGM
         OqyGWdyPmxC2iGqClSC3nIbZ2CeEbJu1o/Qc7QebEFMsrwDx9z6nt81GdSt9tYmHdeIF
         S9TfY9nPSerxikv+8YvOLEKl1vC9ihs+jQZASK7S0gwlX9ZT3nZQ8cDVNpa2KwKWP6Zm
         3u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+XaAFmy9SMSRD1fPXmOQSltyZA3WUik8Qs9wpvo3fuQ=;
        b=OxSfeTi6o3MegAQNy5M5ZMiDPc3ox5hzTUHhfUSQfXxPzU0vc6xUqecGv+WYsgpjXF
         mL1xu0oglKAtZQxXfZ3dckKjxZ7mNLkU3g0ITYJyAH/PARuRsZMplV7uuX94Ub1Tscyw
         kEuMOZRFZtJdG+wjmGKLcr4hcIk6U5WwSV9Og/euOjQTPv3HJY4SElC+RPdwbzPRGoee
         W2njOawTuPUrdkHyyGGvU67Rz3K8Dg11tVaPyyRVdxJ52cUk70Ft+KZRfMRSwi1xgtyQ
         W8FR958JDVfE7D0RNPoOj4Rr8d5tbU8TKfHpjQdd4tacTC2Hd6i2WckBlyNw3XjUzlNw
         6//g==
X-Gm-Message-State: AOAM532glS/AWPvA+LrgEnEKlR1934m5t8o378pY+x3e4a2JoBw8aORp
	ABJvTzpu3w1Vs37v+ig1jXtPpIKRVEk=
X-Google-Smtp-Source: ABdhPJyuxE99VYkDtnuLwQKeKFuaBe4qfnHHweJdcer7KC6lzEMX66nyyegnDKXScrqxzAc1S34nmA==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr6997315wrs.43.1614609797591;
        Mon, 01 Mar 2021 06:43:17 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.145.200])
        by smtp.gmail.com with ESMTPSA id z11sm22872429wmf.28.2021.03.01.06.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 06:43:16 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] scripts/oe-debuginfod: script that fetches package manager directory
Date: Mon,  1 Mar 2021 15:42:56 +0100
Message-Id: <20210301144256.22384-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added a script that fetches the package manager directory and runs the elfutils-native debuginfod on DEPLOY_DIR
Added a check to ensure that PACKAGECONFIG options is set in local.conf

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 scripts/oe-debuginfod | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100755 scripts/oe-debuginfod

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
new file mode 100755
index 0000000000..967dd5807c
--- /dev/null
+++ b/scripts/oe-debuginfod
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import sys
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + "/lib"
+sys.path.insert(0, lib_path)
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+
+import bb.tinfoil
+import subprocess
+
+if __name__ == "__main__":
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=True)
+        package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
+        feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
+
+    try:
+        if package_classes_var == "DEPLOY_DIR_RPM":
+            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', feed_dir]))
+        else:
+            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-U', feed_dir]))
+    except subprocess.CalledProcessError:
+        print("\nTo use the debuginfod server Please ensure that this variable PACKAGECONFIG_pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
+    except KeyboardInterrupt:
+            sys.exit(1)
-- 
2.17.1

