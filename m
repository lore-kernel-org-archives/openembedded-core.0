Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11226C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.14256.1716552881573603528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CiV1r4OW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f34b5f1964so12404855ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552881; x=1717157681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoqpsjNqlM44F+/PKaI3j5G6wDcMgV3sfGmEDLQNFf8=;
        b=CiV1r4OWugu2BzTT6MdCzXgbAfBv5y0EoZl0NzjW0u4ZDT798DN9UFDFA+kjM0MJfl
         4A6oOTzAcfQgLVr927IzXCGlx7x2fGnFwWGSMREBd9MKAqNB2ukHxnZ/HiHFh6YxVlSU
         t3/mMdh2ZyRTYhAs55vOap7swg3QKs6oKMUQHy5ttXbXt6HKkCsseTeX9uKBnRLU6lCm
         xsw5ru6G1gksFf3u53X8LNxW229RExugTk4wF3Exq2tcwYKnr6lr8xZhcSAuN93w4Jsv
         cgIELwWj35kulpqHJLOawO1OUIe9pYuwZS4jyUNmpipmKx3nbDigpmpsBVY8lcYfme7L
         GbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552881; x=1717157681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoqpsjNqlM44F+/PKaI3j5G6wDcMgV3sfGmEDLQNFf8=;
        b=oqNe7Mamd/cVqrT/lNHCrdHjmkgu2n5MCLGhaSLZYMeVLREsEI2zRcsr6gM2bFWFW3
         q+OujrtGye8kl3Gq75pHYxzLDUKkNDdjkcPJEaSrW2dyuyB7o8VUPaQ9gyxecm9YQRie
         mVjlw4lQc1AwcxaNNhRZyl+jg2r/qUpn9DHgssUIhuBcpzoC9JFNiZxLN6zQAm6P3pYL
         LOV741d5IOgUhoP7dWTDo/TXFUdaRSBjLEe1f8Ln5ZrdkwED+/QJfPubS2U4pHlswqF1
         WoLbEoi0sQPhTSBUabJdTm68ebtn/PIiiVb6Z2f5UucxcBkBTSpBSv2NDGcGwyILXRgy
         MVLQ==
X-Gm-Message-State: AOJu0YyXJ8pFhHeUgnW0j1glljX67PsPS5/xPxpnjJfAwUSVRNMqzO5o
	xPQhcgvbbMAmZr7CbhAmQ5R0eU6/0gvwCPoneXItqSdLWzVkEDEZW9HGbV0bAfwOmtxQ7zcAd/+
	2
X-Google-Smtp-Source: AGHT+IEWWefrif93XYcKGgMFLxuyxwWq8NsNZqyYce5hRHGR8A7VIXP9DXB2vQ3H8DsSxYP0yOInfg==
X-Received: by 2002:a17:902:da8d:b0:1f3:35d9:432b with SMTP id d9443c01a7336-1f4486bd0f3mr21556555ad.10.1716552880822;
        Fri, 24 May 2024 05:14:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] go.bbclass: fix path to linker in native Go builds
Date: Fri, 24 May 2024 05:14:21 -0700
Message-Id: <b611c77e4883ad81a8f40cbee3fea006500735ed.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199847

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


