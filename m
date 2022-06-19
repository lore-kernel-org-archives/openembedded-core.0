Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E1BC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.21875.1655666448028395038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZNXnMyV;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id y32so14135932lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=dZNXnMyVFhzV2rhmj5Eqhg8AZUMmmESt+xaG4ocO9RtVytvGVEFTB6J6tYjxuVCmzR
         9NUVjqW0i5ILB3l8RSZde8/UpQi6XqB43uLM/HI1I38X99xDGRyUqskDJf0zFF0jtQCv
         6Iw7wtcsTh3u3ZUul8M/qQ36wVIaGMBI2whpPES6RsCoBC+6Gb1mmbHhJCSSwY+/ivv2
         nod1/xcc7rsQ1Y6qTTWWcdAKLjNNKjtzp3k98kUd0fSCUgadWa4PhSH2w/t3WgDt2bF8
         rz2c3VT0GTrFAwp6n1Nmaj6Xk2oL6tgtoyuT7/VWj3f3sQx7I3sDCtE6pL+jqU0Wpss/
         cptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTC5cXBGpbyP49C4is+heUbT3LnE71851DctikNERJo=;
        b=SUlGzhZWyYki5t69/z8aLXhcvxxMgShr1+5iZDe9h5L4kwW6Kn+ZaD9l9ZqbRaqyQ5
         Fmuht7xzizQaMMmRAatD7Nn66mNfoZU/L+YbOKA1P5/0fkK/piVlUOZ3CmCMYi90PcZI
         iXLmP3Lg9WYxUbnTcPJ2RLzepePVNBjMSOiRhdgXxl2M25PkqzICGpvp48nSi7ZzeHpQ
         JNWWKRggsH+wHpbCz0qFSoRMc5lutfPqQkMvbF5v8HN707inbvReIJI8YxC/PsEbP/jt
         4/qdcog1Za4ELeDo3dSKp3wNFY/okuSAdrF3S90sCNBPzGPoDpvzDucD0IWWGgpBQs+G
         Lccg==
X-Gm-Message-State: AJIora+zajBbmCDSqr0JhE0ntSlYzAd2Ew161D7Ayax2bI9muB5c5kn5
	fZIZyzk6PFMi2Hy8gy/gOPvS0YqrNA==
X-Google-Smtp-Source: 
 AGRyM1veNlnPn35DwQVTqqHLeeIjCSDh4PCJuJNeMSH9x/Wu0Saxi9cl/FARyAgiPN3XjmuJ9N2HIw==
X-Received: by 2002:a05:6512:12d3:b0:47f:5a20:400b with SMTP id
 p19-20020a05651212d300b0047f5a20400bmr5680110lfg.572.1655666445760;
        Sun, 19 Jun 2022 12:20:45 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:45 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 1/7] python: Avoid shebang overflow on python-config.py
Date: Sun, 19 Jun 2022 21:20:35 +0200
Message-Id: <20220619192041.1113263-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167039

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


