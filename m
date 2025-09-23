Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D3CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.18550.1758638350697467912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ycr+mAY1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b5515eaefceso4273422a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638350; x=1759243150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxyy8MYbl8JhhewFulhSxQ3AHTSEIq8dFcsaGCNmkLo=;
        b=Ycr+mAY1LALixKpLyg0w/LEUb82oMj9nW1MK6KyaXrFOnsYNS8Q6BBsdkd/Bi3IFz/
         npkO+69NzF9mG/8gMpETdI0tFBeLq1tlLi9rwQdoINqHq2Ofc+3OrL7kDGaUT1bVNdoA
         FwMC2Io6j7E7MoK+dmzMPUGw0oiejWjmF7DWKrlooapvfg3LwAJmih2muKl+8wzm/4vQ
         C/Ft/vc2UzrpAmiNdHMvUV7B7kgGrbY/WWAOw/An9No+lGlCIU/5qtEKpeeJqqJ9hMg7
         1Z6m66FQfhH+ivnAJ4C7Eoll04xDjuDwW5TqgfCd4t7KILD7LscWYFRLuY9vwPrJAUUI
         LOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638350; x=1759243150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxyy8MYbl8JhhewFulhSxQ3AHTSEIq8dFcsaGCNmkLo=;
        b=fR70h2GeUO//nRYxloqRZvvDOGizwejStLRhwricne+/HINnJjMd1HkS5rQN1Vp8l+
         wWnjLdosKL2B2yGQ2uSyCuOtSd4LqnljSn7Z+4lfvCQH79ZNaaNnQFTTjHdiP27G9sNf
         d+eg+g6PR04w14t0had261TUk+ySBCMVDBMuqKtZo7pIhv5ktRfPFCU+0TukWj0cINg4
         dSOYNSONay4bdthl9dSbA3o9XFuUYQiwQmYhkCUkFl89RUHwDYLBw6qGRzML7a5c0aBP
         oRsXGjHWCB1euGUEHho9Ui5F5nxlOQC9cyGBjy8YQck8lQ9EDO0hQ23IKZFQee1qPIYC
         PUSg==
X-Gm-Message-State: AOJu0Yzj+t8TqJwXQEI0x+pIR4RywKkRmomsKNxgwmPLzZR8siQNrU5y
	Tfqrxzxnyxfj7MDg0WvcjhB50bs9Vqsc6ZSdtdNFp16pTPgtYcc1G4LZILj06VG6UccZBSFov6X
	xwfdFxsM=
X-Gm-Gg: ASbGncvVZgbVmy03WR0wZiaVUTfjvBLloa2ZmRZXzIE/0IL15CM1xoDth9lTQTIRJPC
	fVTs3R01eInuzm3QmX6LE4kokGFZhpK+aFIArDGL3dlGKDfzFtVwyx7gCyIXdV8hXe+YAKQGl+G
	q73TK4EyuZL5LMNjxypJxoORKe8H1zN8xxIdT1YLcmudkZ1gb3M1u9vgMTgPEnTCT/RSk8WyU+G
	FzXhDM3GYzhrKqLrOrPW6lW1g2Wqyk3sgEQUZnyN6X1yEaWN2uM9oqnykJtx10KaT7UYSPRISQE
	lCgDe0LiOEatvlRKoa5DQi0m6UhfkSLCoSipPdwKVaq88qLLgvySg8YIUZXj3+VdBDPpcPWcxng
	6ewHk1Dzklv4Z
X-Google-Smtp-Source: AGHT+IGRV4Jh9/EJgjsGRzpFHGVVT0bVZYC1qbTihGtcqoyKSVvfoBAp4pomV+cC14cxuZNY8HrUvQ==
X-Received: by 2002:a17:90b:28cb:b0:332:84c1:31de with SMTP id 98e67ed59e1d1-332a96fdd2amr3065585a91.25.1758638349844;
        Tue, 23 Sep 2025 07:39:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.39.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 7/7] python3-setuptools: restore build_scripts.executable support
Date: Tue, 23 Sep 2025 07:38:42 -0700
Message-ID: <d728ec95291f05cbfb436eabe8717ebe9a0dc11d.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223890

From: Yi Zhao <yi.zhao@windriver.com>

We encountered an issue when running python scripts provided by
python3-fail2ban. The shebang '#!/usr/bin/env python3' was replaced by
'#!python', which caused these scripts to fail to run.

For example:
$ head -n 1 /usr/bin/fail2ban-testcases
 #!python
$ /usr/bin/fail2ban-testcases
-sh: /usr/bin/fail2ban-testcases: cannot execute: required file not found

This issue was introduced by commit[1] in python3-setuptools 75.3.2. See
the upstream issue report[2] for more information.

Backport patches from [3] to fix this issue.

[1] https://github.com/pypa/setuptools/commit/c71266345c64fd662b5f95bbbc6e4536172f496d
[2] https://github.com/pypa/setuptools/issues/4934
[3] https://github.com/pypa/distutils/pull/358

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...l-request-pypa-distutils-332-from-py.patch | 63 +++++++++++++++++++
 ...or-special-executable-under-a-Python.patch | 59 +++++++++++++++++
 .../python/python3-setuptools_76.0.0.bb       |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
new file mode 100644
index 0000000000..e3329246b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
@@ -0,0 +1,63 @@
+From a8d07038ec4813a743bdc0313556c9b0fd65ba88 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 2 May 2025 20:01:23 -0400
+Subject: [PATCH] Revert "Merge pull request pypa/distutils#332 from
+ pypa/debt/unify-shebang"
+
+This reverts commit 5589d7527044a75ff681ceb4e1e97641578a0c87, reversing
+changes made to 250c300096abbf4147be62a428bd25a98abc487e.
+
+Closes pypa/setuptools#4934
+
+Upstream-Status: Backport
+[https://github.com/pypa/setuptools/commit/3f94782c5ede0689cfc216693ddb9a79087d6c91]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ setuptools/_distutils/command/build_scripts.py | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/setuptools/_distutils/command/build_scripts.py b/setuptools/_distutils/command/build_scripts.py
+index 127c51d..3f7aae0 100644
+--- a/setuptools/_distutils/command/build_scripts.py
++++ b/setuptools/_distutils/command/build_scripts.py
+@@ -5,6 +5,7 @@ Implements the Distutils 'build_scripts' command."""
+ import os
+ import re
+ import tokenize
++from distutils import sysconfig
+ from distutils._log import log
+ from stat import ST_MODE
+ from typing import ClassVar
+@@ -75,7 +76,7 @@ class build_scripts(Command):
+ 
+         return outfiles, updated_files
+ 
+-    def _copy_script(self, script, outfiles, updated_files):
++    def _copy_script(self, script, outfiles, updated_files):  # noqa: C901
+         shebang_match = None
+         script = convert_path(script)
+         outfile = os.path.join(self.build_dir, os.path.basename(script))
+@@ -105,8 +106,18 @@ class build_scripts(Command):
+         if shebang_match:
+             log.info("copying and adjusting %s -> %s", script, self.build_dir)
+             if not self.dry_run:
++                if not sysconfig.python_build:
++                    executable = self.executable
++                else:
++                    executable = os.path.join(
++                        sysconfig.get_config_var("BINDIR"),
++                        "python{}{}".format(
++                            sysconfig.get_config_var("VERSION"),
++                            sysconfig.get_config_var("EXE"),
++                        ),
++                    )
+                 post_interp = shebang_match.group(1) or ''
+-                shebang = f"#!python{post_interp}\n"
++                shebang = "#!" + executable + post_interp + "\n"
+                 self._validate_shebang(shebang, f.encoding)
+                 with open(outfile, "w", encoding=f.encoding) as outf:
+                     outf.write(shebang)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch b/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch
new file mode 100644
index 0000000000..ea3fd22331
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch
@@ -0,0 +1,59 @@
+From 3b2944f3d9f83129500571f9e44fb0779bf0987b Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 2 May 2025 20:07:13 -0400
+Subject: [PATCH] Remove support for special executable under a Python build.
+
+As far as I can tell, no one has complained about loss of this functionality.
+
+Upstream-Status: Backport
+[https://github.com/pypa/setuptools/commit/575445c672d78fcce22df1e459b7baf0304a38b9]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ setuptools/_distutils/command/build_scripts.py | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/setuptools/_distutils/command/build_scripts.py b/setuptools/_distutils/command/build_scripts.py
+index 3f7aae0..b86ee6e 100644
+--- a/setuptools/_distutils/command/build_scripts.py
++++ b/setuptools/_distutils/command/build_scripts.py
+@@ -5,7 +5,6 @@ Implements the Distutils 'build_scripts' command."""
+ import os
+ import re
+ import tokenize
+-from distutils import sysconfig
+ from distutils._log import log
+ from stat import ST_MODE
+ from typing import ClassVar
+@@ -76,7 +75,7 @@ class build_scripts(Command):
+ 
+         return outfiles, updated_files
+ 
+-    def _copy_script(self, script, outfiles, updated_files):  # noqa: C901
++    def _copy_script(self, script, outfiles, updated_files):
+         shebang_match = None
+         script = convert_path(script)
+         outfile = os.path.join(self.build_dir, os.path.basename(script))
+@@ -106,18 +105,8 @@ class build_scripts(Command):
+         if shebang_match:
+             log.info("copying and adjusting %s -> %s", script, self.build_dir)
+             if not self.dry_run:
+-                if not sysconfig.python_build:
+-                    executable = self.executable
+-                else:
+-                    executable = os.path.join(
+-                        sysconfig.get_config_var("BINDIR"),
+-                        "python{}{}".format(
+-                            sysconfig.get_config_var("VERSION"),
+-                            sysconfig.get_config_var("EXE"),
+-                        ),
+-                    )
+                 post_interp = shebang_match.group(1) or ''
+-                shebang = "#!" + executable + post_interp + "\n"
++                shebang = "#!" + self.executable + post_interp + "\n"
+                 self._validate_shebang(shebang, f.encoding)
+                 with open(outfile, "w", encoding=f.encoding) as outf:
+                     outf.write(shebang)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
index 91d8fdd73b..9f330ec54e 100644
--- a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
@@ -14,6 +14,8 @@ SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
             file://CVE-2025-47273-pre1.patch \
             file://CVE-2025-47273.patch \
+            file://0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch \
+            file://0002-Remove-support-for-special-executable-under-a-Python.patch \
 "
 
 SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
-- 
2.43.0


