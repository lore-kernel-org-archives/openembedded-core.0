Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2DC7EE25
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:44:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.40946.1684291488041952612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=G3D99y0t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ae408f4d1aso2931485ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291487; x=1686883487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTkfMAJ5N7DMoLAaaDOr18BBIgXWaQ7NoJSYP3b71/s=;
        b=G3D99y0tV0JMpuzbUpWmkJOJ4Z1IZ//Q9Qin7HQLkkPrhSUrWHrqasRbQ4oFvfXB8R
         /wutQd4Mbd71r65M/HQgnW3XmXa6KIZ6ZKqrt8sQd2uMi+jLs9ZD5BIt9Z0QODuXKiUJ
         3VQdVVVSYsNhdH0QtevdDUuJYHEl+7wv+IQDiSjmwLK5FVnMwo8Yy9BldLREdSchcXK1
         ObJMdTcrVtZSnXVSRMQ8+Sf9RNzRinfH5z4uw8Bn7xUvcLBKer81xuBQ+PndvVoxNlbV
         lVppR1ieNBpMeZDKa+Sk7bIk83MHEz7iiI/kDtCa0437c+kS2C0dNYt9mgiP4vcoIQCr
         w4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291487; x=1686883487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTkfMAJ5N7DMoLAaaDOr18BBIgXWaQ7NoJSYP3b71/s=;
        b=cYeLtp5/Er6YDZgumJJoavu0wRJHCsXRbfn27EoI/KMlMIIjHHr/D1PuA0zN8c5lcT
         kriNC5zXjmiWX1rMXSCbTnEB3q8zJL7+eatZO7iXCuO3+HafoUr8ASOmN9OlpiC4AH/e
         vo6kyU82blxZSoAAXb3HMWw0O5KdI3ViCJZcYWT5cwPm9oF0SDB8jRUmxFbFUEmdBqhF
         c/ySsMYRP90/LsJLPT76GkIKhV6TiBLfiGU+TGitVXJvnN0iwbhibrFIoszmsEjw02Bx
         UfYdVlIAJxhmpORVN94s0U3Mf2T2aJOYum+hW9DBfMqX/L6Lv68jZKVD7A/aMOE6yS9x
         S6eQ==
X-Gm-Message-State: AC+VfDy4BNEwY9W9SZpkuJKDFmXhlS0YDBcntsVoFnwS9HphebpCDDcb
	RCbO5SRc2eutvyq0yIpHsWG0F2uW+lmiSfaQiJI=
X-Google-Smtp-Source: ACHHUZ4DUCwP7u4hmaKOIyPNHnUP+iEnzp86q6foSlqAGDsm45bKqHh+fhei6LgIrywZntjYuuyYAA==
X-Received: by 2002:a17:903:32cb:b0:1ab:7c4:eb24 with SMTP id i11-20020a17090332cb00b001ab07c4eb24mr48400143plr.22.1684291487020;
        Tue, 16 May 2023 19:44:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/13] ghostscript: fix CVE-2023-28879
Date: Tue, 16 May 2023 16:44:24 -1000
Message-Id: <5046578b09b0a83a961768824e47f34fb3de9eb1.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181430

From: Joe Slater <joe.slater@windriver.com>

Backport from tag ghostpdl-10.01.1-gse-10174 which is
after 10.01.1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a70d6935afa38173dbf012b8e1c3d59228504df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/cve-2023-28879.patch          | 60 +++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
new file mode 100644
index 0000000000..604b927521
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
@@ -0,0 +1,60 @@
+From 37ed5022cecd584de868933b5b60da2e995b3179 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Fri, 24 Mar 2023 13:19:57 +0000
+Subject: [PATCH] Graphics library - prevent buffer overrun in (T)BCP encoding
+
+Bug #706494 "Buffer Overflow in s_xBCPE_process"
+
+As described in detail in the bug report, if the write buffer is filled
+to one byte less than full, and we then try to write an escaped
+character, we overrun the buffer because we don't check before
+writing two bytes to it.
+
+This just checks if we have two bytes before starting to write an
+escaped character and exits if we don't (replacing the consumed byte
+of the input).
+
+Up for further discussion; why do we even permit a BCP encoding filter
+anyway ? I think we should remove this, at least when SAFER is true.
+---
+CVE: CVE-2023-28879
+
+Upstream-Status: Backport [see text]
+
+git://git.ghostscript.com/ghostpdl
+cherry-pick
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com.
+
+---
+ base/sbcp.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/base/sbcp.c b/base/sbcp.c
+index 979ae0992..47fc233ec 100644
+--- a/base/sbcp.c
++++ b/base/sbcp.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2021 Artifex Software, Inc.
++/* Copyright (C) 2001-2023 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read * pr,
+         byte ch = *++p;
+ 
+         if (ch <= 31 && escaped[ch]) {
++            /* Make sure we have space to store two characters in the write buffer,
++             * if we don't then exit without consuming the input character, we'll process
++             * that on the next time round.
++             */
++            if (pw->limit - q < 2) {
++                p--;
++                break;
++            }
+             if (p == rlimit) {
+                 p--;
+                 break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 56a93632e2..86ecdbe24a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://cross-compile.patch \
+                file://cve-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


