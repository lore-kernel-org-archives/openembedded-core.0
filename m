Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671C8C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.1301.1655854098258775971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WDUzohhB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id cv13so11713177pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4Z/svyoZtlDVFBezuFjTP5BG1srNt6FlE64zsMs1QdU=;
        b=WDUzohhBV5dYW7WRZIUR/LvuBYmo3EgfLIaMJPvZlJmX7hXnU+5QyHLU2d34b2eqV2
         3I9uu+oj1zPxy6Gtm9RVPi7P+qiOXrGxuAd/iM6Pd8HidrDAmtQ0hNWZUqSADDB+JS4A
         STtkjmQGKEmaFpD9voi0WhkT2Anx9rMLqGBhQSqKHyKzKBza9JHWmlbKzHzpVLMZor2e
         GQTVKvfopq+nEJLBJXR7/FyenSkvsn2QTtY1QvJ93gwB+jSFOzyPLu42fV6oJ33Ps3xM
         X1XB6BAKHk4DrlEwczJ0SZ7N7qQgLCHUYZG0kK4sEeFTQl7v/N1d6Lva+zTggq7KrMj5
         kEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Z/svyoZtlDVFBezuFjTP5BG1srNt6FlE64zsMs1QdU=;
        b=ab5IQ3hmO9BxB0KQwPC9xqmo+KCRY3qW8zZxKSiB613Ur6YQaZMECSOHIQPm2ptkxw
         /hrRAbhDHL9MqyMOwgUOA0OURJp4DWkRc7klu6zQ9GrTtlFkTkwoG+EF0TJ2ZVKp+8mD
         g8XCvZxexUKAOhMqIOEypZaoOvq4TfDXdQFRUDNjK7kxy24EK8QPobP/mFjd+JkMdc0h
         vuut9VJw58VXHP5c/pPa1gIFwjtAIJtweRgk0eDug1tEoB1aYXmIW/MjlysxXAdoThi+
         05b2l++6sU9wwo0Qr8EVZJw80jjEwcGiiUlvASkAplyo7KkwTUcGBms63vWEKE1RGkx1
         Hskg==
X-Gm-Message-State: AJIora/8bOXMpInAlJvb7e868X69WHIbZ6Rn5SGMZR35zzPgyLw1gxiy
	/k6WHA7eZPpmsj7OiaXaTAJr/gK8Co8UUFTB
X-Google-Smtp-Source: 
 AGRyM1sFVJ2vP2KZvVCn+WF/vkua1zGURWZ2EM21ZJhfqS2XKvwwP3tzoKdf3tr2Y1kUf2XpYDN4oA==
X-Received: by 2002:a17:90b:1986:b0:1ec:71f6:5fd9 with SMTP id
 mv6-20020a17090b198600b001ec71f65fd9mr29107221pjb.188.1655854113878;
        Tue, 21 Jun 2022 16:28:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] python: Avoid shebang overflow on
 python-config.py
Date: Tue, 21 Jun 2022 13:27:54 -1000
Message-Id: 
 <8a86bd88f0b46b0f413b98df20891cb9aa84c271.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167198

From: Paulo Neves <ptsneves@gmail.com>

The native path may be too big, leading to shebang
overflow. Just use the #!/usr/bin/env python3.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84783dee09e48cb930c7cd27944eaf3f03997237)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


