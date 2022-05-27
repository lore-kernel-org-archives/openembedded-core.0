Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727CFC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 17:24:00 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.6411.1653672232604733803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 10:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BHoIjffP;
 spf=pass (domain: linaro.org, ip: 209.85.208.177,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id r3so5617636ljd.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQM9zyI9MC5NqlfkTq7hPiUWUehcCyDU8D0eLHRSbiE=;
        b=BHoIjffPjb7Qb7BIZtXG196jrwmD8kZHMrhZqcvuTDruThDI/71B/6W7J9rpv2bnB2
         ufwEy3ccUwjks/KR+KHQ6qOi3cnOJUlN1tCGTE+6Ti7tpc3GydWOB7FSaenoc82AQuRu
         FMPST1YTsHLWqHXgqvTKAxPE2VDrv+Ifci13D/nLguBbC72Qa4YNIEUcaHNdhgNTWSy8
         VPl/gBlm/CgvT5FWFesL/jJon5/l89ydEJjKIw9w+QcbZJzZkrNdadgrLHX+q9dy+mqn
         8fcaOd/FkcqD3KwQwWayxoxKSu3RhXRlK1wEznGQG9JpPCDHER0o7WCPQbzCT/FsHaek
         Qa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQM9zyI9MC5NqlfkTq7hPiUWUehcCyDU8D0eLHRSbiE=;
        b=0nzid4kl6J9O6DQ7EHveZy+e6Oe8Ka1vD1L0G9mK/DbDIJE3Z77n8nDVYqeVZWaO1w
         CamsKNrZ0azWKDGvfe2z4C0V3eM0gR4W0nEYkG+RNXIN0Nn6gX/sEGdVD6wXvSZcDQZ9
         +KSgnbH03R6aos7HCrAkRirsqxAH0Msp24Tc26zO4kvSNktNRPpfY25+bjPttKAho93D
         Abks9G0ruIertf6sHo2uvwszQkyefDRKOnKaoULOvxWkglMItvupf8MABJhzmbt4r5xb
         BNwDRPNBpTXpM/zIarAZRcLGTDaIIiK/Preg7ZaqwiMLEbSyYgRS5mKM1fHHI+U+0tPX
         n6fw==
X-Gm-Message-State: AOAM530OgehvXGmpcgZJ2Nwte5juXbCRgO0SLCCNGcxcLsOny8Sh3KwR
	QVaYFyrzziNGS9pikp85hy69CBsKuSDVrg==
X-Google-Smtp-Source: 
 ABdhPJw/nznufSHCAv/PXp1nu7rV5lvXussmvf5TJSAD0x6TQ0ZTGbFu2lftO4ONI0NIocjI5dIVbw==
X-Received: by 2002:a2e:818c:0:b0:253:dffc:80a2 with SMTP id
 e12-20020a2e818c000000b00253dffc80a2mr20405307ljg.468.1653672230377;
        Fri, 27 May 2022 10:23:50 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a05651232cd00b0047255d2112esm949605lfg.93.2022.05.27.10.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 10:23:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Subject: [PATCH v4] go.bbclass: fix path to linker in native Go builds
Date: Fri, 27 May 2022 20:22:55 +0300
Message-Id: <20220527172253.7252-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 17:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166216

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
Changes since v3:
 - Add a comment regarding uninative to the class too.

Changes since v2:
 - Reverted to the code from v1. Added note to the commit message that
   the bug is observed w/o uninative. Add comments that
   uninative.bbclass will patch the installed binary automatically.

Changes since v1:
 - Explicitly use UNINATIVE_LOADER if uninative is enabled. This is not
   required (as the binaries will be patches anyway), but makes things
   more obvious.
---
 meta/classes/go.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 1a9a0bc1d426..cd2daed70bf8 100644
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
2.30.2


