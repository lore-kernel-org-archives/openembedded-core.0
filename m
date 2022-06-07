Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BD4C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.13499.1654614702373657478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UmmEtpnW;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id w20so7160059lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wGNBOW5+jNZ1lqxejh6Uz+taEFv3+c9yvvjLz0cp9Jw=;
        b=UmmEtpnWsJ5vX+Gb5k1GVhJNDFucOCLzQZGCuFZuklxJxp6y/b0fsdntUwyR8Y//uy
         NKHHkhrbgv5UWdO/YPofzr/zm0qetDaoEYYPdwzM9AVLIB8BZyRxZ8gl/ShuyFsVQj9M
         Qc92IyuZg9Oul2TXUTDoI8gcITuGzqxX6EvNEUoV5O0AwhuZ7RMv28ObR/fyNuwYJ0v4
         IIBkA59mg8VhcBLcfZxxxBFfOI2gNnOITdrVv80K7YFXITrPvUoLLj+jShBt+gSTsPQI
         DjQEfPeKphRNckByiQtJkmfeltebTxAyyrLvBkLDW0+YYTaSF7QPGK42KpqOAmXIhnqY
         7pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wGNBOW5+jNZ1lqxejh6Uz+taEFv3+c9yvvjLz0cp9Jw=;
        b=i4RHOHHq6KMhf9AOmuWazXeqN6wQwrKVTu3e8yxnXdBOaqN0eXrlgv5Sx8BkC/zQHs
         M4zncyvbuVYNQYS3kX9iKbBtbqPGSLeNBNhM+duiAFXgGGeYYUuxc1fvbugCpZRWDXkm
         C7m9l6cOmQHgCXLYj+8iU3sM4hVVFq0JUzax1Z56NmtMI2LPkjEr5gExn21UIPgR9Lmw
         87QGMhhQ7CMbxIAH64sE3LGRDZJBC9rKhDybBx69AqGfTunfOuqrkLiPBg6E1JWtkctm
         PBkRp6iuzDv+8fYYgUcluNxUAWo7pu/Z6SyFU2Xwrh6Af2NeTptB2+Unhw+2Eg8gRQ5x
         cTNg==
X-Gm-Message-State: AOAM531WxZh8rwF/UaU/PE3lBMowGgSvQKvd1ctc5r888UR/GwAy/wQt
	VKSE1eiPttQZ04nsdt/RO9HVJrx7KA==
X-Google-Smtp-Source: 
 ABdhPJxFdC/geCdbAbT7K+aR54qjMAqoLbC11G3/O7y2tDeaASXWtiBs0a+mZs7b3zX84MXDkN4/Rg==
X-Received: by 2002:ac2:43c3:0:b0:479:1630:c6ed with SMTP id
 u3-20020ac243c3000000b004791630c6edmr15032433lfl.406.1654614700564;
        Tue, 07 Jun 2022 08:11:40 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a05651c120800b002556e0248dbsm2831089lja.124.2022.06.07.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:40 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 1/5] python: Avoid shebang overflow on python-config.py
Date: Tue,  7 Jun 2022 17:11:19 +0200
Message-Id: <20220607151123.3588947-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 15:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166670

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


