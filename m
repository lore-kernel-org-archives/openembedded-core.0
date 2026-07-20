Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F68CC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2896.1784568217152343516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zsM9KzP+;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4798bea72f9so5427706f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568215; x=1785173015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g7Vt+Fr6hLUkpdC3FPgwSW4OgJnM0Fa6s3BBQ17fONo=;
        b=zsM9KzP+y+HYMNZ+bB66VzQhA9kS0zcz7zvNrEyKHn5SWGDFOAyGdnWCjflB2YBUqb
         /+a2a5cth6N3Y2EOecYxVGSRo80L8sZO6e5OtK+8RjRfJJtRwfBK+Uo8neDi056mHWfl
         X3i/wkhUqO4zJ2PzYdO3dQG/nMKsaHLJwgKMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568215; x=1785173015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g7Vt+Fr6hLUkpdC3FPgwSW4OgJnM0Fa6s3BBQ17fONo=;
        b=CKjLaqJtgOjhhp0IV7thsPrC23nzjuaQjp9OyV9Pkf/GwoXFxFiZHEx4plhq49bkXW
         T6h1eCCVAYLZdZETpVUDJjkFfF9pjPoapX+ueK0+1ZnKoPzBitsDjjmh6oeyLkdjRkem
         rWhWXgsbap9hXxsDJ2umRf/CcZbcADFUhnOhKurTx/lt1QKHs0+W7pjsDFcpCJrkMgt5
         2CUpCnUV/Y9HESI1sZN3vxc1PI4qFRHbURbCq8DBS4ia36jF7nXFKmrnZK/F1JuTH7JR
         8QGmuG1ZBktvVAm80H1giwtNbZPvq1UukHzhGD3mCCkeT77yttoIKjMqhlmjDS10ZYvr
         Pkfw==
X-Gm-Message-State: AOJu0YyFGMITMPfzxE0wkU8G0csWJPSMZRouBOP5QzmZ6EqFf1vr8I0H
	cCeJNz5zuCGiE9L3byzMzXMGvCW3jt3Vlwx4W1WXDy+XsjVwKp9w3Ajgmi1n+WmUllpQcEsP4cc
	Ox0ffgjE=
X-Gm-Gg: AfdE7ck56/X9+2NuuMYwqz9ABaMlNRtvBwiThU3FrJUBx5XyrNKH9J0gnotziVlASGg
	wAIZvjEteqXe6HHjw7xd91gDtQ2IfNCD/76Z97UU4NtDtuR/yPaKqwZik0BpjkAgnsXMrex/7Hx
	6Bgd3LteKK6A5+b6Ad9m1U8LCNou7kxHxu4HSdbT5fdWoW8/D2O5W0bimyeAIbZLD5WsqOaelqM
	FvUm6wG7Zo1DqzeRsYDi4CFKTxh8S3mxXhnLFoz/v9DOsCCEDFdwZ5tmpZ7S/HWFo2ZWBaRZ+7W
	o7oj1bHCy8L3Jn3ZbWXHQQ3S4luX187kLjA9fXCt0VdB5apD7i/UAWGXg90/QObzOQul9QBK5G0
	fsBxEY4uyUlONvZL9ld2Q9kjDd7hMTJtMWlzai83EM9Nqj+fCR3r9A2MvnpyAd8F8wJZQ3OlHng
	A7oeieHCfUgws6YHqa2gv6bej3VVcWXC0iOOezNouepXEfFHWVeyHC6bRsSCeTSNgcholoOqYX9
	HDJeqWJ
X-Received: by 2002:a05:600c:4687:b0:495:5845:fb2 with SMTP id 5b1f17b1804b1-495584510afmr92476715e9.38.1784568215351;
        Mon, 20 Jul 2026 10:23:35 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/33] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
Date: Mon, 20 Jul 2026 19:22:45 +0200
Message-ID: <4e5d0d595f713a4a5cff72f389aa9cac07fe5d14.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241446

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

Debian (and its downstreams like Ubuntu) will patch this out [2],
making the < /dev/null unnecessary, port a part of debian patch
to fix the issue

[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-program-like-bzip2
[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.patch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 62 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
new file mode 100644
index 00000000000..84206b2a4d0
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
@@ -0,0 +1,62 @@
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
+Upstream-Status: Submitted [bzip2-devel@sourceware.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
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

