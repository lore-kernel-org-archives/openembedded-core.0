Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7B42C6C19F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:49:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id u9-v6so21095222wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=o1c8XAFoyvJDsiM7GcHtqzOQ1W0KAnbj0glsavRp1fc=;
	b=EWJbe7tq2DLqqIp8pvoXz3IyYot1AM7Y3IK+zO7aLljXJKqtgD7q1P3LdjIsl+DxQQ
	1gg7YqUJt5JvS9zvP89q3bu0L6VrpHen6l4VzmQjcVKaf0lUZt8HkfzXF8lAT20SvrWG
	H9AfsUuG/7bJvQVfGNfrchw0UXCIIAUbfHjKTGRNYZLW0xnIN/pKt+W+n9b6LV/bpAWN
	sHgZBLAufZvAI/C1uHPHlb+ZnxDrV03bOXrv9upe/m+vPFK5r+HPPSft1bPkjlR38P+5
	yNi/hf/bplOwwZ/57WrC8klAXmtmZOHdlUV4XJgXbSQW8OB3NzfmiE2um02ok03WtIuJ
	aDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=o1c8XAFoyvJDsiM7GcHtqzOQ1W0KAnbj0glsavRp1fc=;
	b=i1wOj2yM6eTHdJjeTF9s85PkmGh2N0Ukziu6OyCbQ6k2IVn+D6/veG3lNg1vc0JJtJ
	BnR2oKWpZz5vQ/AGUeVsB1i4MOi6vdtDxx5gAC4eVAqfQdOWIpZZJ4usfBZvIOQc8LJ8
	1cs75DaX8JkPSzhVBpkKKagVijExS+XkJSPrCbcETrWRojRr1o654T8el4UhzVXf1yAr
	/1+TYQLoQTPXLVWr+/P2w3/AySy8ACZOkzB68ZOGGlKyLHgxbW6YLAukqTvCueZO9ygA
	Z0ObtrHXbAofaJHzaGnZhS/avlPd3SY4uuiCJs7Wo14mGVQ/5945hrKtVeD97hjR9+YT
	T9Bw==
X-Gm-Message-State: AGRZ1gLrrhRokzV0gYPL6PhkxxZTZe8t71zkmrxcNBxRiRydoLGEhqS9
	/Uqm24+58G4MinPgVfwbP+BMyc52RKw=
X-Google-Smtp-Source: AJdET5ePF63p9Bdv0giqIoTqQndwTvbNmSt2+QykFg5nEffOKNq7Q+p4rHS3Nak8Co+cjH9RWJCvlQ==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr5707967wrw.139.1542286165830; 
	Thu, 15 Nov 2018 04:49:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h16-v6sm24507590wrb.73.2018.11.15.04.49.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 04:49:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 12:49:23 +0000
Message-Id: <20181115124923.32661-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dnf: backport a patch to fix execution under Python 3.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 12:49:25 -0000

Python 3.7 removed the os.errno import, so fix dnf to use the correct import.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dnf/dnf/errno.patch | 36 +++++++++++++++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_2.7.5.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/errno.patch

diff --git a/meta/recipes-devtools/dnf/dnf/errno.patch b/meta/recipes-devtools/dnf/dnf/errno.patch
new file mode 100644
index 00000000000..76a1690b765
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/errno.patch
@@ -0,0 +1,36 @@
+Don't use os.errno as that should never have existed, and doesn't exist with
+Python 3.7.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 199fc9cb11ff004fc752b58b7177aaf8d7fcedfd Mon Sep 17 00:00:00 2001
+From: Neal Gompa <ngompa13@gmail.com>
+Date: Sat, 3 Mar 2018 12:44:54 -0500
+Subject: [PATCH] util: Correctly source errno.EEXIST
+
+---
+ dnf/util.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dnf/util.py b/dnf/util.py
+index ab7fd279c..d0f1a4f25 100644
+--- a/dnf/util.py
++++ b/dnf/util.py
+@@ -28,6 +28,7 @@
+ import dnf
+ import dnf.const
+ import dnf.pycomp
++import errno
+ import itertools
+ import librepo
+ import locale
+@@ -120,7 +121,7 @@ def ensure_dir(dname):
+     try:
+         os.makedirs(dname, mode=0o755)
+     except OSError as e:
+-        if e.errno != os.errno.EEXIST or not os.path.isdir(dname):
++        if e.errno != errno.EEXIST or not os.path.isdir(dname):
+             raise e
+ 
+ def empty(iterable):
\ No newline at end of file
diff --git a/meta/recipes-devtools/dnf/dnf_2.7.5.bb b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
index df60d731b69..e2754fbb932 100644
--- a/meta/recipes-devtools/dnf/dnf_2.7.5.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
+           file://errno.patch \
            "
 
 SRCREV = "564c44667c7014843fa6f1732621093114ec59b2"
-- 
2.11.0


