Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F7AC61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:54 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.10889.1700620304812902288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bhTKqVW3;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b83398cfc7so889000b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620304; x=1701225104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ouWmz9jKrU1RDs05fXVML3r+myZKo8WAsweR5p+o94=;
        b=bhTKqVW3T6VuZcTCp44ovKxDkBgGbD23W6XAE8rGCWxPZJImmFZbGcNCaaJeqrkCra
         lTWQIr12xzTBBXu7fn+jbaRRrcBCr6ylNkudMqLe/D7HurWHqoIp8W2hRwREx9AIvwmH
         4G131SjsAz3PXi4p/lEaii7Z60Ks4la1IKtxN+JivAvvZccRt0NUA1JYDwzd1p7EAA9s
         TwGs5D3bcpCy3OeqjoQzEurgtsSGtTNGX30DqTg1sKXZrkGHlRficKfxK4Po1U+QxWSQ
         ihKlwwn6tbWCQpdqDdMS36hxaS0zkQA2y7gi7VzNZ/6V66epUGbO6SZAlP5gaon5yUbO
         XHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620304; x=1701225104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ouWmz9jKrU1RDs05fXVML3r+myZKo8WAsweR5p+o94=;
        b=unD+M7kQ009I5vdeIQ4ECLriKsdVM5uSIUSqUvfupH2OGG+zQSi7UA/cUR5AOeiZxP
         SA4AySYGNJLYW2mB6iG/1EhMguUf0kaJqxZaTZ6AQbOGfUZibF7vx2xAwwCyYYs4tO/Y
         GYhAYiVlFWXYi1dYQzVWmB245Kzn/ItCKinaYZiLcLQj8rnjREsCEer54vwAqTbm6Mbf
         oLM6nY4a1+WG1FAGKGat2I/dDwMKmXm05wGIfjtrbpVMDnSkRqINlbrHiKB4tJZvQZ8S
         NnNHbC+Z15FtC/lPj3Z1csFV+T5djnwgXJYS75/APAYFSxkVNbSYWWeScY7BtjcBO5Tz
         cXaA==
X-Gm-Message-State: AOJu0Yw3mMqw4g+fq0ApzGxCA5iJ33av8WeulAi37bPKxVa+eDSDxybt
	4NLcAGPs6nqpqBcwZRY8wPVh3d26DJkb0NX2zovaUw==
X-Google-Smtp-Source: AGHT+IG0JbdjQzQZ/WVwc3e7G5mZ5D4hzhpmJ6R+AeGWlZtbBpc3JW9DNLNBPXgJ4/JPUgIc3soMZw==
X-Received: by 2002:a54:4e8c:0:b0:3b8:37ba:7c73 with SMTP id c12-20020a544e8c000000b003b837ba7c73mr1060731oiy.53.1700620303851;
        Tue, 21 Nov 2023 18:31:43 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] goarch: Move Go architecture mapping to a library
Date: Tue, 21 Nov 2023 16:31:12 -1000
Message-Id: <8726ae02d760270f9e7fe7ef5715d8f7553371ce.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191014

From: Peter Marko <peter.marko@siemens.com>

Other spaces uses the Go architecture definitions as their own (for
example, container arches are defined to be Go arches). To make it
easier for other places to use this mapping, move the code that does the
translation of OpenEmbedded arches to Go arches to a library.

(From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)

This commit together with meta-virtualization commit
115f6367f37095415f289fb6981cda9608ac72ff
broke meta-virtualization master used with
meta-lts-mixins kirkstone/go which is our primary
usecase for having kirkstone/go mixin layer

Manually crafted since cherry-pick had too many conflicts:
* different path to classes
* additional architecture loongarch64
* different way how to import library

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass   |  2 +-
 meta/classes/goarch.bbclass | 27 +++------------------------
 meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 25 deletions(-)
 create mode 100644 meta/lib/oe/go.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b15c5839b6..ee26ee5597 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust oe.go ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 92fec16b82..394c0c5d84 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -61,31 +61,10 @@ SECURITY_NOPIE_CFLAGS ??= ""
 CCACHE_DISABLE ?= "1"
 
 def go_map_arch(a, d):
-    import re
-    if re.match('i.86', a):
-        return '386'
-    elif a == 'x86_64':
-        return 'amd64'
-    elif re.match('arm.*', a):
-        return 'arm'
-    elif re.match('aarch64.*', a):
-        return 'arm64'
-    elif re.match('mips64el.*', a):
-        return 'mips64le'
-    elif re.match('mips64.*', a):
-        return 'mips64'
-    elif a == 'mips':
-        return 'mips'
-    elif a == 'mipsel':
-        return 'mipsle'
-    elif re.match('p(pc|owerpc)(64le)', a):
-        return 'ppc64le'
-    elif re.match('p(pc|owerpc)(64)', a):
-        return 'ppc64'
-    elif a == 'riscv64':
-        return 'riscv64'
-    else:
+    arch = oe.go.map_arch(a)
+    if not arch:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
+    return arch
 
 def go_map_arm(a, d):
     if a.startswith("arm"):
diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
new file mode 100644
index 0000000000..9996057f12
--- /dev/null
+++ b/meta/lib/oe/go.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+def map_arch(a):
+    if re.match('i.86', a):
+        return '386'
+    elif a == 'x86_64':
+        return 'amd64'
+    elif re.match('arm.*', a):
+        return 'arm'
+    elif re.match('aarch64.*', a):
+        return 'arm64'
+    elif re.match('mips64el.*', a):
+        return 'mips64le'
+    elif re.match('mips64.*', a):
+        return 'mips64'
+    elif a == 'mips':
+        return 'mips'
+    elif a == 'mipsel':
+        return 'mipsle'
+    elif re.match('p(pc|owerpc)(64le)', a):
+        return 'ppc64le'
+    elif re.match('p(pc|owerpc)(64)', a):
+        return 'ppc64'
+    elif a == 'riscv64':
+        return 'riscv64'
+    return ''
-- 
2.34.1


