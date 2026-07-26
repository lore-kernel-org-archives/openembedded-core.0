Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CF2C531CC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7398.1785054629947089385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A7jpBmqg;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b966dd74so10986355e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054628; x=1785659428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rkozmByKv/QMp7pMK+WnzT0CXntBTwyeWlewq+5BGjI=;
        b=A7jpBmqgaEy4OnDtuJlJTWgYGyHKZGD9yMb38bqGhDDxvo2agriMCShjNdpnkhLgDZ
         qeuoIlMpN5NVv9HNttI3qQZpxw3M6euNnZTpUWeWjY1CKrbFioqTNX5v1VYhI084PbI2
         wMQHyh67fhxbiMCpY8Fn8OZm96aRp6mpzgbTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054628; x=1785659428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rkozmByKv/QMp7pMK+WnzT0CXntBTwyeWlewq+5BGjI=;
        b=N/WZws5VpabL5Jf/CrT9kzNm57svNlv7Qb51PFvFMzHx0sHug1VU+GeWLy01Y/vAq5
         bzHfIZAcqO/9oVv5/trtIJYXXdZS5bkWfCbjiXcxAtSLkzplxVDnsrqg/my3YdJrbCWP
         48zH7wHzJ4MLGWRsBhbCuvvvvjqG440x3mb4duNaocMOUlRQXQ/68e7mpTaYqDNbVP6w
         D/7fO+SmFtBFf+v6n2nE64cOgr4FR+a446o1PI9OE0oClSIa4Hpdta0kqLoiT2BlJbiF
         GCX94BKGc3Bd9BB3h62ZkTSK2oH9WPrq7aFq2ULbiK9DR/n8hHXaI4MDUjdO42GsmB0k
         Xg+w==
X-Gm-Message-State: AOJu0Yy6sfAvMDfvYLAcABjk/X6LGtX59ORdkf4KvD/+sGOSIU4FnvmX
	gVJuHq2SmU8o+Z0JfdznytsNQUD1+2IobSI3oUZUljXfRfbyQqQYW8g9QkhYzU5Mjs0JAlRXWWk
	xih3Rsfg=
X-Gm-Gg: AR+sD10Y6YcGqOyQlW9ByAhkG6CAClNMDrlGMpwKL67aU9XnVwm8dXyVO0cx6pkfZcb
	wY2RInrWNzcEM6xqWJeJvqFJfIX/r0qKkK9897X2pq08vfgZe/bemlItmmEFG0sV4xf++YInxnu
	f+oeRuQTHRKm/GHZZ4rMqBbWqZq0H2SrV3UKBahLqMal5KoidlyzTGEeVP7BULqE9qxsnt5eoTu
	gsIHK0WovRQI3Q+kakmGyE9i+nUFNwz3gGbrkmMi3ettMqumJz5OG5/xAdwEXJWygWH3AcWODwM
	CYLaIchkQqt2XLf1s7GxjPQ3PR546gW60zvkFsdW7oDe5LmSVJ3XUVVQpH1k3FFvo9GRj8vn7+Y
	UEWfOY6JsUESEmuqbAkrG8FBEkgrdhgEqo0mIbpa6ptNmZu3lbEN5QQIKpKMj8kOKAVtKQXoFUc
	vDFq6/DIcVkBUSL/iu3BqLecGUNkkeGGTrP2POvzofYx9qZkmWauRO5Z2rcyRDsunFkChT3OFaV
	X4DtQ==
X-Received: by 2002:a05:600c:3b1d:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-496b56e6e1fmr61027275e9.7.1785054628068;
        Sun, 26 Jul 2026 01:30:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/31] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
Date: Sun, 26 Jul 2026 10:29:55 +0200
Message-ID: <762321beb0260b1411c7f98f13458ec99a118280.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242013

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1]

As of the current version 1.0.8, bzip2 --version will print version
info but it will also continue compressing stdin:

  $ ./bzip2 --version
  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.

     Copyright (C) 1996-2019 by Julian Seward.

     This program is free software; [...]

  bzip2: I won't write compressed data to a terminal.
  bzip2: For help, type: `bzip2 --help'.

This is a long-standing bug, not new to 1.0.8 -- the same code
(license() followed by break, with no exit) exists in bzip2 1.0.6 and
earlier. The upstream bzip2 master branch on GitLab already includes
this fix.

Debian (and its downstreams like Ubuntu) will patch this out [2],
making the < /dev/null unnecessary, port a part of debian patch
to fix the issue

[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-program-like-bzip2
[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.patch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
[Jaipaul: backport to scarthgap -- added commit message context that this is a
long-standing bug (not new to 1.0.8), updated Upstream-Status in patch
to actual mailing list URL in the patch file, this patch is already present on master,
wrynose and walnascar branches using the same bzip2 1.0.8]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 65 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
new file mode 100644
index 00000000000..2d02328d116
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
@@ -0,0 +1,65 @@
+From a9dd6acbaca836fc4e943e69a31b2e7acda32045 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 13 Nov 2024 19:49:23 +0800
+Subject: [PATCH] fix 'bzip2 --version > /tmp/aaa 2>&1' hang
+
+According to [1]
+
+As of the current version 1.0.8, bzip2 --version will print version
+info but it will also continue compressing stdin:
+
+  $ ./bzip2 --version
+  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
+  
+     Copyright (C) 1996-2019 by Julian Seward.
+  
+     This program is free software; [...]
+  
+  bzip2: I won't write compressed data to a terminal.
+  bzip2: For help, type: `bzip2 --help'.
+
+Debian (and its downstreams like Ubuntu) will patch this out [2],
+making the < /dev/null unnecessary:
+
+[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-program-like-bzip2
+[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.patch/
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/bzip2-devel/2024q4/000234.html]
+Note: updated Upstream-Status URL to point to the actual mailing list
+archive entry.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index d95d280..6ec9871 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -1890,7 +1890,9 @@ IntNative main ( IntNative argc, Char *argv[] )
+                case '8': blockSize100k    = 8; break;
+                case '9': blockSize100k    = 9; break;
+                case 'V':
+-               case 'L': license();            break;
++               case 'L': license();
++                         exit ( 0 );
++                         break;
+                case 'v': verbosity++; break;
+                case 'h': usage ( progName );
+                          exit ( 0 );
+@@ -1916,8 +1918,8 @@ IntNative main ( IntNative argc, Char *argv[] )
+       if (ISFLAG("--keep"))              keepInputFiles   = True;    else
+       if (ISFLAG("--small"))             smallMode        = True;    else
+       if (ISFLAG("--quiet"))             noisy            = False;   else
+-      if (ISFLAG("--version"))           license();                  else
+-      if (ISFLAG("--license"))           license();                  else
++      if (ISFLAG("--version"))           { license(); exit ( 0 ); }  else
++      if (ISFLAG("--license"))           { license(); exit ( 0 ); }  else
+       if (ISFLAG("--exponential"))       workFactor = 1;             else 
+       if (ISFLAG("--repetitive-best"))   redundant(aa->name);        else
+       if (ISFLAG("--repetitive-fast"))   redundant(aa->name);        else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index b661bc95465..6c02dc3ed06 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            file://CVE-2026-42250.patch;subdir=${BP} \
+           file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=${BP} \
            "
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"

