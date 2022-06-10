Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05668C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.32443.1654897401572229257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CnMeK7gh;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 i131-20020a1c3b89000000b0039c6fd897b4so1246271wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wGNBOW5+jNZ1lqxejh6Uz+taEFv3+c9yvvjLz0cp9Jw=;
        b=CnMeK7ghPEtN9jfdZ1LT/wrmbwjTuf59EQCaCblREIJ10UURDTIgRzxVIjokJ3+s0f
         7BcUgRMyhWF7qqxpTaa5gkQHTHztViWcrFYMG/z/nJAryqOE+KXf7YkbyuxiQZPaayWU
         RqgX2XZdvsWQtLyUV7ydPc7sDSK+nEmLxnBIOyB3OyUGYAl/KtNyBeHSnY/xCbwGVI0E
         2FjhdQOlYvy2QCC5A+ytyDLngZ+pplL3Fwmtxvp5nWRApX7/hHgu7tWuscdh/X89rjvJ
         OR6s0ypwWnKKfZISKsGpcdsTLjCCKstOGK2dP7cvor0EWs8L2Aqp7Y5/EHqnkFkRKugo
         Y8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wGNBOW5+jNZ1lqxejh6Uz+taEFv3+c9yvvjLz0cp9Jw=;
        b=bp+QYxToH/QJ3k6kJ/93WKjLCfTthKHCVTKTO7wMpCXNQmjJpbAznkOy0NUtSTbJJl
         IJo9HKFelPyxAvOite9/w6DnUfpIqXvbPcsX0RWLAQx2CGLxhspMlzX2oCuNqvsyUut8
         1m8Z8GFQMrCC7NtI82n1u9LXM+y4sFTLBhLEOUxetz/x9XLE4PiKeQx4HqZ1w2VnDG9F
         m3wgBcZScAFRrl3qOgPi2iaC0A5z3AiM0ei/S0x0wuqTbYuROCSVp/vdUEJs/+tVwpLT
         3uycD5GhfcBiOFr2HLtHntfsadz1HGVSJorovbKeClG4rZDasVWEYNt39Gfgv/BI9CmX
         lVxw==
X-Gm-Message-State: AOAM531NW2TFWvRKtA8I/8ztvfCdWThudNrZa43Z0yBDTYbz1Ime/Nfd
	mV9+Gg480vj684l3v7WcSMvdrPmbOA==
X-Google-Smtp-Source: 
 ABdhPJxhIVnyutwDIEmGNHVdowdvQsrktxF8Sv4/e9sEQ6YYlrPeo16IyeOVvq3jNlaLgVImYVA9aQ==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id
 m5-20020a05600c3b0500b0039754ce0896mr1652812wms.3.1654897399909;
        Fri, 10 Jun 2022 14:43:19 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:19 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 1/7] python: Avoid shebang overflow on python-config.py
Date: Fri, 10 Jun 2022 23:43:08 +0200
Message-Id: <20220610214314.2754247-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166813

The native path may be too big, leading to shebang
overflow. Just use the #!/usr/bin/env python3.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
new file mode 100644
index 0000000000..9f23278a30
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -0,0 +1,29 @@
+From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Tue, 7 Jun 2022 16:16:41 +0200
+Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
+
+The whole native path may be too big, leading to shebang
+overflow. Let's just use the env shebang.
+
+Upstream-Status: Inappropriate [distribution]
+---
+ Makefile.pre.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+ 	@ # Substitution happens here, as the completely-expanded BINDIR
+ 	@ # is not available in configure
+ 	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
++	@ # Otherwise we might get huge shebangs with native paths
++	sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
+ 	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
+ 	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
+ 	@  # In OpenEmbedded, always use the python version of the script, the shell
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 6bd3a6aba8..357025f856 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
+           file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


