Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED6DC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.5889.1655212619696010915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ixvr9wZZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso4780388wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=ixvr9wZZkRtnsvHmeCN53+l5Dr7lGjj7F6v5TaOY7rTpMGFtB2Fc/hHPRopF4Rg/o4
         m/o0eO3a/TFqjtnhjgEeAwzpVKn+SizGzGaDe+tokZ+TI3tEhxSFNi/Cd1GtHktUnp0j
         E0+DvHvpFRKKIo3WC8fukInGJ36BEgz1uukiPyaDJOGCWsEL2sAwqDoP+DPxJAIm21JA
         NDgI5ehePAISU/BAh3gmrEEewc89+rPrWmOppfXlj+SccgeAGOeFgI4mxflmkMiI2zAf
         +4cpzuULVf1vh3/QJsjK4GGnnVjN/b6jhtJtmpzKafBoLMgNhlf5VbgiojVk0Bhj8DFA
         wT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=CXy4BQMTB10jT0L+FrGiekReYYLik2w4MBmhlfo7srw70c4x2UIGygkBvzL8+ErKjX
         HqLQP7cKdRvgR+dHWA42O4i8kelJTVV3QI0tmRUbF0N0TzAI4dI/diYNx0puNrxmTXnP
         41lRpd97URRrtK+1qoK6ux+W/KRl2Wh6L3C3QSHUg5I/4fn0oFNNovsFBSYgfu+W9pgo
         Zh1FQZW5p+uvXsSgrL05XuZWGWUOXz7qNWzG+lynAIzBzb8NPNv7SblF2O2LUTuUYKRA
         +SGsJDAwHf4LiEY1XgWOFFp+sdT5FajPWxE2ngnz4qEGcj9ONKeCyIED9y9A6DAKWsyJ
         hNyg==
X-Gm-Message-State: AOAM530MZ3xLl4WM+gd+S0wf3E729+oxB5Qw44BGFutZC/EGGuo21pzg
	+q+ogdYnoGlVWd4/f8k3W3PkpXM0Xw==
X-Google-Smtp-Source: 
 ABdhPJyduKXE4Ts9ETtm09uBWyBXTtwrRZioRbqJiThdyyZS5AI5eBrF8UogA+zcGZQylOBVMVaArw==
X-Received: by 2002:a05:600c:1547:b0:39c:804c:dc23 with SMTP id
 f7-20020a05600c154700b0039c804cdc23mr4146753wmg.23.1655212618141;
        Tue, 14 Jun 2022 06:16:58 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:16:57 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 1/7] python: Avoid shebang overflow on python-config.py
Date: Tue, 14 Jun 2022 15:16:46 +0200
Message-Id: <20220614131652.566471-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166882

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


