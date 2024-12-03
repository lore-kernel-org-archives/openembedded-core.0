Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFA1E64A9F
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.19590.1733233071583471216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cL1Y9BXu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2127d4140bbso52329745ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233071; x=1733837871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+LJK9GuBcYVYCB9wwxPh9ifLeWhmJy2RP00pHwiP7A=;
        b=cL1Y9BXugDxZkNyqi6WKj6JIh3uyw4O2mZPt3egMZZdgus+G0jRv4RM7C30SzItbKq
         noLhfcuu+/J2Z9PReAqQ48/GL/T2+mjqzt8fPjH+hTBT53dkk05XqeK6WeKM04pdgfMw
         +rAxBCiznE5ow2MnTHXnvaUv1VyHjv9sHBMji3RAKD+Ovh6+wCH/xhHu/RPKn6UwF90v
         PR1X1yuIN4ynaLRCEkMpW/WQGiIB9ohQcSDJ+cdJkzmCZaasW2q0FaC/fvDKFUjOeERv
         KzADcumJO8oGc1sdwrnbbxWeoC1lExrGb1O3RudDFNqyw5ggUSQ3ZL6YHk4TxUzIbGyn
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233071; x=1733837871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+LJK9GuBcYVYCB9wwxPh9ifLeWhmJy2RP00pHwiP7A=;
        b=t9XalYSTCVJmEViN9FXjX+rGIbtI4c4b8TB7/hBW9uArfqAjG17qaM4ot+RbSzmeKk
         YpESfclbvs8LgxMZyoG1QB+OMsrLwrIlHl7zieH2p7/y1PW6tiszG0OZZY8vtuVeACT2
         O0mOYZAScRmmNi2AJqvibL1icoX26UEe6a+ry9SjdWZltLm/aeTrWxh4C2Z10szVbY2P
         FJmYHpvfLrEa7yAsFVTDS5aGoyz08ZwNU0/KYH647UuuB/zSZJQUfBSqMGzYQxuXZfwU
         McsqGvExR3Ui2N89pl3twwsOHxz9JIITvZAw50ipi2JtgbmbNtIbv3sYBAzJSK3MzuHV
         Of9g==
X-Gm-Message-State: AOJu0YwJqEKXJjUQ/Woh66NVHKYI3bJOtgoB/BS2Yh+2bRCN8+HMcxmF
	QCKlCJsEw+EJsn0TSem7uTfsiKj3XMX6wuzzab2FHEXML/nvP69Qm9IJ/IfVpYuWGn1lG0+phfN
	O
X-Gm-Gg: ASbGncsTipIvlQv4xjDeLFZfM5HN3clvzev+5kSADSBWIRerhcFNQYU6LDI3LvYWnGS
	3/uA2Xdix1n1j0u9kQo/4xCVUpcD0py9cdzg62KtY787es9WerhAYzy8IiHaSsfccOP09mppZct
	DOgCr8Cwx+w0ROrVN2ChOY3m05Ki0vhGOkGha4IqwQ1RiSrpm1YKpAAHEmmiB2okqyEL/UrGKMB
	FUc3GSJPhWhJH9ShS2ziveaEy2yyu2GXjpcsS4=
X-Google-Smtp-Source: AGHT+IHfKZQatsvajJF9Yh0wciZ00c6DT3OLeCqZAtQNR6XxWafe6XUrteXfdUJIvYzTC/pbg/BB6Q==
X-Received: by 2002:a17:903:1c9:b0:215:6211:693 with SMTP id d9443c01a7336-215bd18ed72mr23898425ad.57.1733233070794;
        Tue, 03 Dec 2024 05:37:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] ninja: fix build with python 3.13
Date: Tue,  3 Dec 2024 05:37:17 -0800
Message-Id: <f357486da3374f7b49d6956260b5b3200f562e02.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208202

From: Markus Volk <f_l_k@t-online.de>

python 3.13 removed the pipes module. Thus build fails for host machines that run python 3.13

This commit adds a backport patch to use subprocess module instead

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...4efb41c039789b81f0dc0d67c1ed0faea17c.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |  5 +-
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
diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
index 8e297ec4d4..b74150bc64 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -8,7 +8,10 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
+SRC_URI = " \
+	git://github.com/ninja-build/ninja.git;branch=release;protocol=https \
+	file://885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


