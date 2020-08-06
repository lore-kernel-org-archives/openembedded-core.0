Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.15205.1596745059163448224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 13:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9yi9tYR;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id b79so46147249qkg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 13:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icuAuiu82X0QBfe8dDxHs/w3esXGVj5fWdCtviEXIKs=;
        b=V9yi9tYRlBlewSdyprAYsTJ6RFfD3+zvX+gpjryxWY4OsUx/kTedFLpLXLvBtH3OQ4
         KII4c9kZErQYiBqNA4ogugWKHGR0BqeWg60gvD4KzDmgIJb97vBzEEzZM76Xs8M77D7K
         2ddVcGMVah49B+aR7XcVVGdiq+448zca5B/Inh0EcCQ7XZrEjJ2x5YPBMJvVe6qweAXF
         9SsoimwdSwmdIzw3B7eSpKukoh9lebuEdvj7tOQW9TENxt1W9ORdTEoMAFNrH0rTVwNO
         0vQ9sTU1+bwonHqMRdfN0Gt8l5jAJ/beBCfh4tF7u6L3PXJdGTWPiMT0PCWpbfM2q3hd
         8iTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icuAuiu82X0QBfe8dDxHs/w3esXGVj5fWdCtviEXIKs=;
        b=hcaBoZUFEOeP66tbeRt3C6M9bPhAgjHlGk4/KSi3rdjTfJS3DeNNx+38r55XH2cum+
         o1QpjzCOo6+DKazAug7Xpctoy8wfzy+rYXsZVyZLcXE/vL7pRKy4NwTPPu7etVYArpUC
         O2hn8ZIkfff9eXw3kbkXP/JWHnM+7dO51MJiTUm9wmJnKkuKaNPeHcWoM84RvWjWfZmX
         6lA8B0+f7Hx8O3AV0j+Mb6ij6E0KFiUnR4r5XpA1i8A2WQWzQ1B5TwY16ueZOZXBwfWf
         4HsZvmTMuwtCVgDLI0KQv20TrALBklH1aJi/ZQoULLOYVZ2vCx3jsbkc9JqA6V/UertP
         mE0w==
X-Gm-Message-State: AOAM532UH1xLiVeaJHxlmCPQDJLbhKEHiCpkHzC2F+mI3JsTeWIexlbt
	fxE7TD+bQN2iGYPD4ZxASH8=
X-Google-Smtp-Source: ABdhPJy8DQSKlu4LblJZXgYkHMUYOz6KpvDgdcKTnAqzDlYNwrOZmfnaM3bKRBN+7OqEQA+E4Pia1w==
X-Received: by 2002:ae9:ee06:: with SMTP id i6mr9918062qkg.132.1596745058300;
        Thu, 06 Aug 2020 13:17:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n23sm4832664qkk.105.2020.08.06.13.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 13:17:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][v2] strace: update to 5.8 (fix build against v5.8 uapi headers)
Date: Thu,  6 Aug 2020 16:17:34 -0400
Message-Id: <20200806201734.15169-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating strace to the 5.8 release. The signficant change in this
release is fixes to build against the v5.8 kernel.

Noteworthy changes from the strace site:

 - Changes in behaviour

    - Modified %process class to contain system calls associated with
      process lifecycle (creation, exec, termination):
      kill, tkill, tgkill, pidfd_send_signal and rt_sigqueueinfo are added,
      arch_prctl and unshare are removed.

 - Improvements
    - Implemented decoding of faccessat2 syscall.
    - Implemented decoding of LOOP_CONFIGURE ioctl command.
    - Updated decoding of io_uring_setup syscall to match Linux 5.8.
    - Updated lists of AUDIT_*, BPF_*, CAP_*, ETH_*, INET_DIAG_*, IORING_*,
      KEYCTL_*, KVM_*, LOOP_*, NDA_*, RTC_*, TCA_*, STATX_*, and *_MAGIC
      constants.
    - Updated lists of ioctl commands from Linux 5.8.

 - Bug fixes

    - Added statx syscall to %fstat trace class.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-devtools/strace/{strace_5.7.bb => strace_5.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.7.bb => strace_5.8.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.7.bb b/meta/recipes-devtools/strace/strace_5.8.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.7.bb
rename to meta/recipes-devtools/strace/strace_5.8.bb
index c184d035aa..70d5940f60 100644
--- a/meta/recipes-devtools/strace/strace_5.7.bb
+++ b/meta/recipes-devtools/strace/strace_5.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8"
+SRC_URI[sha256sum] = "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
 
 inherit autotools ptest
 
-- 
2.19.1

