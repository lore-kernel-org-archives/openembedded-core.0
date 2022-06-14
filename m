Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D71CCA47C
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.7329.1655219472692178744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5Fb5peV;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h19so8481821wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=h5Fb5peVcvEKS7bhHIxJaO1pNefHL/vL7UE7aEgPjuc7V/mwLjGgoJ9qpl+0Yoez7C
         HfqZni9JxpPScsUjaTGLWqmFzvkgEABWvGyUgEwwmE145q6GM1bl2ZoOskuAfn7WL9zQ
         pkFN8zhM3uinIDoaBJ6ZRTcPaFAkCiVDKO873m6gSJJr9mqsFM2iuKTlNeo7IabjrLNk
         +LxNMCH1Zms45PHFgxljeLcQTtah97ziKqtehAh1WNz5IqroE3M28+5LeZPEHqrsfCQ7
         qpn1sCfRg3sXYXr3G1pQ26IS3G8p3Zs8P8Qro2gbrqwoQGF3EUjE23wbqqwraBm4gKTQ
         pj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=L7qIztJYFtBBkIiHfw111hU3V90AhfL27KNvAjJxvxcHmFA5pFAd4OhCCZFmJ08u6k
         T2onhHRuUts96Af7JNOPddX7JfNsnCj4iU3XybO1iD3ZEo/kRB1riBsSK7rQEURnhe03
         cWCotnV1m9MHOtirCKOUMsjxuU8FMcktt5jC2z4mUPHIv06tVSkbKBdj8VgVKPf0RbTK
         YEny6xsFwP/GhRDbgf17Sk5ybuHetwVpbG5Uf3wI8+pzF/qPKdckSYk889AxkTPzrLzb
         i67zcXo+w8CtSoSo71M840X2F+BRyPdB2axOidB/bS5LPZHN3ARhhIxOKaYr1BQO4Nza
         EKeg==
X-Gm-Message-State: AJIora8ZpWxBhFXl3ji8FJw6empE2ttm1AIO+MwjVY+dZYwCNvpHqAUm
	AE/P2+YFM6MwtABhS2mSzjTx8yMroA==
X-Google-Smtp-Source: 
 AGRyM1veqP7BHavd9WSyRnWYakLWoGq4QnniF29St5HtiMdprNONRCp0UxhoNb4nQphbmIUdRzYxJw==
X-Received: by 2002:a5d:484d:0:b0:215:e7bf:3e71 with SMTP id
 n13-20020a5d484d000000b00215e7bf3e71mr5529349wrs.435.1655219470940;
        Tue, 14 Jun 2022 08:11:10 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:10 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 1/7] python: Avoid shebang overflow on python-config.py
Date: Tue, 14 Jun 2022 17:10:59 +0200
Message-Id: <20220614151105.1890454-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 15:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166895

The native path may be too big, leading to shebang
overflow. Just use the #!/usr/bin/env python3.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 ...shebang-overflow-on-python-config.py.patch | 33 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
new file mode 100644
index 0000000000..921da8de7c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -0,0 +1,33 @@
+From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Tue, 7 Jun 2022 16:16:41 +0200
+Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
+
+The whole native path may be too big, leading to shebang
+overflow. Let's just use the env shebang.
+
+Denial reason: [1]
+
+Upstream-Status: Denied [distribution]
+
+[1] https://github.com/python/cpython/pull/93760#pullrequestreview-1005365737
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


