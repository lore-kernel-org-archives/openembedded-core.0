Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7FAC433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 00:18:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.14110.1653524321789085250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 17:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=l3IjgL50;
 spf=pass (domain: linaro.org, ip: 209.85.208.172,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id g12so91999lja.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 17:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T19CAbp2SrPHIkREA/6gMTmWQc5uNTfZnxVwgSzG+hw=;
        b=l3IjgL50a8wnLVBdHzaxYXWb+kqGhhjM+QHkgqf6tr4HDPVPUR3fXwanVWVOPSRxFy
         7B2bXLnAWRxSZbckrgWUG85E00QZf3WGEJjAIttMD82kpEMhMs3hVpfcT0disssvXnj0
         g9OlvP728t+BBjGNfD+v9Z3fcdCqEGjXvvYF2odScA/t6flEhZdR7s3OdUlm69yFK0tD
         qXEjLJILPENaHAfYDDTZc9YnpEhEfxJT1L8VF9E2NAyVMdaKC+3/MuMg4leOfx9bTNgZ
         8QilGkdLUd8CqYWkWnyEfV63cP7BFqlbq9GEXZtUMeliaEuQz4BRVMFCuZ+CchkMJk70
         qaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T19CAbp2SrPHIkREA/6gMTmWQc5uNTfZnxVwgSzG+hw=;
        b=q5bT5dcQ1SlqjVu+R4ZIQCL+CRPZ+/GDOD1+Gs8WMLdLGrnBtLssmjMGRa4JxefXZp
         s+j1KDl7WX0RutwXQ/ScXdb/OFSsOFj36FY7O3QlA3/sNtg+j3HARoCDusevNf6hNSZl
         2ECffBIt0aKW/kR4WqbN/qArExzVgEXXqKxmDzqaj0dBQgQKOPvQnuTS4wkWqe8/2IQC
         irKLCYuQMIjCcAlze8I48Pejgly5LJi0SHjfkge9kzcBK3jwI6VUiTetBAq6rWQNGQiu
         AsW7sfCE7rznhF7LlMgwpnWp2vjWin0Ta9rt/l1/3sH0iYMrKAIk1QbD2y8VbQLQGdlO
         Axsw==
X-Gm-Message-State: AOAM531Mof+WYY140gx4UREQFOmnyo7Nn1ykHHtzj7qtzEeMbaqL72+w
	MuymUGIO1Dko6mdQZpdzw4kOmpFqL4XvkQ==
X-Google-Smtp-Source: 
 ABdhPJzHUbTDyznMQzEVjHw82jMrzkZg3Z4r1j7O2A8lzrz7Ec50rOC/gcififb82HxfHkS72qhhBg==
X-Received: by 2002:a2e:986:0:b0:253:bb57:bdd with SMTP id
 128-20020a2e0986000000b00253bb570bddmr20375547ljj.266.1653524319406;
        Wed, 25 May 2022 17:18:39 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 u19-20020a05651c131300b00253c33d30f0sm61610lja.87.2022.05.25.17.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 17:18:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Subject: [PATCH v3] go.bbclass: fix path to linker in native Go builds
Date: Thu, 26 May 2022 03:18:37 +0300
Message-Id: <20220526001837.1101898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 00:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166175

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
---
Changes since v2:
 - Reverted to the code from v1. Added note to the commit message that
   the bug is observed w/o uninative. Add comments that
   uninative.bbclass will patch the installed binary automatically.

Changes since v1:
 - Explicitly use UNINATIVE_LOADER if uninative is enabled. This is not
   required (as the binaries will be patches anyway), but makes things
   more obvious.
---
 meta/classes/go.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 1a9a0bc1d426..df088c7590b7 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -45,7 +45,9 @@ GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
+GO_LINUXLOADER:class-native = ""
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.30.2


