Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06722D6D227
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.78797.1732733430955011975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ertKr/Bq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7251abe0e69so111859b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733430; x=1733338230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9a7kLSj7Yq/4AV3mqQfFt1ykqSQADLrf6lTcDdip/w=;
        b=ertKr/Bqh5FA94auJhK6zsyS0WeH3A7XLuJyJL0zEN08qd7J1lA5cz3NCFTz47beeO
         3aFCWFZup/neGqaaFs+CcPyaU0zzt0S/1hEMmZamxAEFCW8FR3FydCWgxeBbypGsMU0E
         1YvEI+W8Zo1GbnS/S6x3WGyf/B/EKqgijeR+jnUaCzjBN8tsEmr4HHRLlEtem/45opgr
         59j8GgffiBssAHsRQff5qRKxCI8W5miKd+TOgdkNcwFNLP29aZRCqREffZ1puuC2kz//
         v5SUThf/D/x/hW8xISt8ELZ/NAdSDkuS2lIEWIwxJmo+e7R7Fr/XaGuEcLcFzaa0d0Ga
         BRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733430; x=1733338230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9a7kLSj7Yq/4AV3mqQfFt1ykqSQADLrf6lTcDdip/w=;
        b=V3Wjvxy/83nYtXhdFN3jKE/ECzJFZbT5Qc9Jeb8h6zqxmWoAFC0OJnEPhZjzk4iVUA
         1UjMBr+Suk8MXruTZ8IsHvONFbBkyM0IbC91IBvkncaaTdl+f/C6nMl8a9mnW4ny6rYg
         68CCWMrLgvch+qst/4mGSB6tHsRP4akllk8dr7a1hqsEz8pEHAZKzzzFjh7XwR0Y1XCk
         EVS9cAv25sm7M9D9/q0loWHFaDcNbiH4SP4dlXjUikVL2Ny0qm1uERM0x1pKC4cnWY0x
         IEykhcBQdOO+kUwvTePv97jLIGze803Fc7sOBNyV/FnfTiTE8IvmCMjO5mhMXnQVDbvJ
         MZuA==
X-Gm-Message-State: AOJu0YwyGB+NRmFbkjsJNn8yz67vLNVkpSaElrtlf5BoVB69CBqVj5a9
	LyJaRKYkZ47amW3DRw7KASRPk24a8mOv8ff4NJVAxNN7GDe35O54Dt9EVugs/ntNAhH+C9Palbh
	e
X-Gm-Gg: ASbGnctlMTmDhuJVN5n1k6/pOUeHt5Q67lRpNQqUeGVeImMsrubMWOl/XiMFIl32MQQ
	N256CV8xebtxrr0vu8HZWuM3X+OD1hNy4yNPMLfc5seJyFf4Uuf68WIc4AYunEMutuWouMyYJjx
	TivBK5/nNC68rstE/746akezAnvtMWsP446GiJ8DQDFDHKL8OoiQfYMTn2Q62R6Q9VHELPkn82i
	5jkeJSpSsiP/BleFizHk4OlQ7xezqAEoz/MB1o=
X-Google-Smtp-Source: AGHT+IGKHwvo4wE7OVXHMTlXd+IP8sQSCpSBihBGx96n3o577cqdIJC3WzaUf1MrdWaID9Pg7to65g==
X-Received: by 2002:a05:6a00:230b:b0:724:5d26:d904 with SMTP id d2e1a72fcca58-7253014341cmr5041906b3a.18.1732733430150;
        Wed, 27 Nov 2024 10:50:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/14] ninja: fix build with python 3.13
Date: Wed, 27 Nov 2024 10:50:06 -0800
Message-Id: <1a02cf1997216cb943d8965fe74f971a8cb2f70f.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207955

From: Markus Volk <f_l_k@t-online.de>

python 3.13 removed the pipes module. Thus build fails for host machines that run python 3.13

This commit adds a backport patch to use subprocess module instead

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...4efb41c039789b81f0dc0d67c1ed0faea17c.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |  5 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch

diff --git a/meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch b/meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch
new file mode 100644
index 0000000000..b23bedd04b
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch
@@ -0,0 +1,62 @@
+From 9cf13cd1ecb7ae649394f4133d121a01e191560b Mon Sep 17 00:00:00 2001
+From: Byoungchan Lee <byoungchan.lee@gmx.com>
+Date: Mon, 9 Oct 2023 20:13:20 +0900
+Subject: [PATCH 1/2] Replace pipes.quote with shlex.quote in configure.py
+
+Python 3.12 deprecated the pipes module and it will be removed
+in Python 3.13. In configure.py, I have replaced the usage of pipes.quote
+with shlex.quote, which is the exactly same function as pipes.quote.
+
+For more details, refer to PEP 0594: https://peps.python.org/pep-0594
+
+Upstream-Status: Backport [https://github.com/ninja-build/ninja/commit/885b4efb41c039789b81f0dc0d67c1ed0faea17c]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ configure.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index 588250aa8a..c6973cd1a5 100755
+--- a/configure.py
++++ b/configure.py
+@@ -21,7 +21,7 @@
+ 
+ from optparse import OptionParser
+ import os
+-import pipes
++import shlex
+ import string
+ import subprocess
+ import sys
+@@ -262,7 +262,7 @@ def _run_command(self, cmdline):
+ env_keys = set(['CXX', 'AR', 'CFLAGS', 'CXXFLAGS', 'LDFLAGS'])
+ configure_env = dict((k, os.environ[k]) for k in os.environ if k in env_keys)
+ if configure_env:
+-    config_str = ' '.join([k + '=' + pipes.quote(configure_env[k])
++    config_str = ' '.join([k + '=' + shlex.quote(configure_env[k])
+                            for k in configure_env])
+     n.variable('configure_env', config_str + '$ ')
+ n.newline()
+
+From 0a9c9c5f50c60de4a7acfed8aaa048c74cd2f43b Mon Sep 17 00:00:00 2001
+From: Byoungchan Lee <byoungchan.lee@gmx.com>
+Date: Mon, 9 Oct 2023 20:13:50 +0900
+Subject: [PATCH 2/2] Remove unused module string in configure.py
+
+---
+ configure.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index c6973cd1a5..939153df60 100755
+--- a/configure.py
++++ b/configure.py
+@@ -22,7 +22,6 @@
+ from optparse import OptionParser
+ import os
+ import shlex
+-import string
+ import subprocess
+ import sys
+ 
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index 1509a54c9e..e7b82ed9ec 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -8,7 +8,10 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
+SRC_URI = " \
+	git://github.com/ninja-build/ninja.git;branch=release;protocol=https \
+	file://885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


