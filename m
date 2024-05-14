Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ACDC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:30:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.12017.1715682620065018003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 03:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxTKYVDU;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34d8f6cfe5bso4212326f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715682618; x=1716287418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOLfkzLlTAy3qiRCFWSj6Skn+l724Zgb9tvV/c+csSY=;
        b=JxTKYVDUPAfVDjjRUPtq7TMs8lFssOZwuAoJGy4DUvG8PvuiX4G6Ps6gWEHb0t3gDc
         X9fHtBAMVOoD8QUoIJ9OyhRYXgfgPgqD3J9rdDjQUNgWjfyRZSbu4YzIrI+Cr9AWf8Yp
         noJf9efz5brFJUk9B58yl/kzUwp6LfCDa7DImXIXI8z0MY/g7Cwzosn/1vJTpp5efBI/
         47hr3FEQ5D9gtIRZvjnc5CbQCdfP0oLsPcY+7QqssKfs5H9yI/RB4xDK8f4sW4LEIZQv
         r5Xc9PJzs7xF5rMm0QDCCNa5uo1lCTuDdx6AuTYiQu3pbJsEZB+Btf5inhcbQDxutTI0
         n0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682618; x=1716287418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOLfkzLlTAy3qiRCFWSj6Skn+l724Zgb9tvV/c+csSY=;
        b=jz0eI1BXuRNQWIJDxgq9UJsmR7O+P+mkb4qXIHwvjvbI3OIHCfaWAE3p3ySy0dDoka
         Yl5+TQDMx/XUfVOWLE5TQbJn4eAUEx+EyOdsFCiHddpReckkcj7q33ArtQ31zVdjOEmU
         utVBMgp9XRM5wTpaMaDjd0h2f3i5QCnLBgd5s/LY9R/1lVtJ39A9aWrUUmGGd7rOtc7y
         Hw3CiAEGWxJvrtKiuC8lFsxJ1oSpCK/ohIwyjJdznM4I/SzlZiChw4pH1EIHacT0+t7T
         2lMRkv2RdeT9C4LbiKMCU5tHa4eHrOkqZaT+RAKrxr0JHe5KLp7tWMei9GP6RJ5yKG2v
         8Z6A==
X-Gm-Message-State: AOJu0Yydo7aPXYkIuv14gjT4J1vmxW/qwfaHnW3rmOKdSL/HHl1YvOYP
	PyPQy4XCV19/Tgo5aSx+OeLXYetnpjF+resJI0RdXrfvSM+bIqMZdnOkfHdvmKublaJv
X-Google-Smtp-Source: AGHT+IHG8qBZyNwS4eIj60djwbbhFzmzvG0cI99fU7RAu1YdzexmlC0toMZyLodsHl/YqT9xQ7p/uA==
X-Received: by 2002:a5d:6e8b:0:b0:34c:d6c2:18cb with SMTP id ffacd0b85a97d-3504aa62c6cmr8197553f8f.63.1715682617972;
        Tue, 14 May 2024 03:30:17 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd40sm13429239f8f.4.2024.05.14.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 03:30:17 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH 2/2] go.bbclass: fix path to linker in native Go builds
Date: Tue, 14 May 2024 11:30:11 +0100
Message-ID: <20240514103011.582683-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240514103011.582683-1-jose.quaresma@foundries.io>
References: <20240514103011.582683-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 10:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199254

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Building native Go tools results in the tool pointing to the wrong
location of dynamic linker (see below). The linker is looked up in the
temporary dir, which can be removed if rm_work is inherited. This
results in being unable to execute the program with the 'No such file or
directory' error. Override linker specificiation for native recipes (and
let Go build environment to pick up a correct one on it's own).

The error is observed in case the distro doesn't use uninative.bbclass.

If uninative.bbclass is used, the binary will be patched automatically
to use the uninative loader instead of the system one.

Without this patch:

$ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
	linux-vdso.so.1 (0x00007ffe945ec000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3a7490e000)
	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f3a74d13000)
$ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
-bash: tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man: No such file or directory

With the patch

$ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
	linux-vdso.so.1 (0x00007ffd19dbf000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2d44181000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f2d44586000)
$ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
Usage of tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man:
  -in string
	Path to file to be processed (default: stdin)
  -out string
	Path to output processed file (default: stdout)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44b397daa68b4d0a461225fe9ff7db8b5fcfdb7b)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/go.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 55f9d8f230..97366779e3 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -45,7 +45,10 @@ GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
+# Use system loader. If uninative is used, the uninative loader will be patched automatically
+GO_LINUXLOADER:class-native = ""
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.45.0


