Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB828C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:01:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10128.1653501659767053092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lbxlQsuy;
 spf=pass (domain: linaro.org, ip: 209.85.208.172,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id e4so24798327ljb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayzp4cYp4r0nXn5qPwmTh8IjTBKD2MH50ZBfB/bkodk=;
        b=lbxlQsuy4814ujOlAe83+5uCW4U2OquVX/Hi97Q2KZUXBmIH2kq+XmlOrQ3tdvsUcI
         kO8li8hwjGCRCTJySlntrn6V/5InXjdnRcY/nE9dMDiWUdgtHdXqBlvjZTL7bB+70QbM
         C4YUNUAcApJrYHEaKkDFi1OWaCvx6J9WK8gQ+vifLGYrKMfJzMPGOJHmsVZRdfwXgGyw
         hztKubF0nUudgV6mD8UT6V8oDKEjb1tzhF43K4fl/VgUaO7HLUIhBEkWWXsRqG3M7QVY
         xoLq18/ipPR7XXNgv/RVObUayoPfU8DazDXpZA2nnSsiFdUdM0027USyWYkLHHnfcA+2
         hRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayzp4cYp4r0nXn5qPwmTh8IjTBKD2MH50ZBfB/bkodk=;
        b=ErJS/EtY5EJBRqHzGX22Lkl5hrPsMjEqoPfJDpwk+DPb9sGn8mwbShXjFThHfEjVsK
         ZnYUUo6gJ6NfSOIRwDGtlGfJDX3Z17dw4EC/QMj4CMrcfYtWUqVgARQ2Ma7GCwsGgOIe
         A8RDoxAgBwuP6WOp72VnwgH6bNjWpoLFU+S0KMaH/wiQNNZ4EBf1M745YI2VsHNjDvKy
         p7fRMOttr+62aopYeEN1vGBeNUWg1+fWdCg+nIe5brTwdclSyW7TR6PjcbeT6Xsc6HWH
         CH7+hLGpOulloYG1Ka3P9Gy6JWMVRbPAhakJBwiORRIJqfJUqOBRHFxGjOUj1XsWej4O
         YXxQ==
X-Gm-Message-State: AOAM5316tu27WaXRtBeJf3jIaLQTL6g5y4Yw5Bom33VqYEl5tUd8UoOB
	pVHlO4xiWVzOQyDHEfowIYkImzfI2acddg==
X-Google-Smtp-Source: 
 ABdhPJw9MgAR1LSo7Ve9jEn9DSDVyNK20bb4UBP497X1oKo5N+EokTslnt2DqMOavESsJuTOkHjUYA==
X-Received: by 2002:a2e:6a10:0:b0:253:e02a:94c6 with SMTP id
 f16-20020a2e6a10000000b00253e02a94c6mr14385327ljc.460.1653501657403;
        Wed, 25 May 2022 11:00:57 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 o12-20020ac2494c000000b0047255d211a5sm3218655lfi.212.2022.05.25.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 11:00:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Subject: [PATCH v2] go.bbclass: fix path to linker in native Go builds
Date: Wed, 25 May 2022 20:56:28 +0300
Message-Id: <20220525175627.829194-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 18:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166161

Building native Go tools results in the tool pointing to the wrong
location of dynamic linker (see below). The linker is looked up in the
temporary dir, which can be removed if rm_work is inherited. This
results in being unable to execute the program with the 'No such file or
directory' error. Override linker specificiation for native recipes (and
let Go build environment to pick up a correct one on it's own).

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
Changes since v1:
 - Explicitly use UNINATIVE_LOADER if uninative is enabled. This is not
   required (as the binaries will be patches anyway), but makes things
   more obvious.
---
 meta/classes/go.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 1a9a0bc1d426..da3cab5da5bf 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -45,7 +45,9 @@ GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
+GO_LINUXLOADER:class-native = "${@ "-I " + d.getVar('UNINATIVE_LOADER') if bb.data.inherits_class('uninative', d) else '' }"
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.30.2


