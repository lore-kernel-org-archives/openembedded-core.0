Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.341.1615941120596792315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 17:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lvfVe2U/;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y67so9989134pfb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 17:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/xvzwCcGxAfBOu4y7NBBw3m632OcoJoESq4Juj7wr8=;
        b=lvfVe2U/vQQljIxZx0/jdoDbFyvkjH/eZlkcsxQcLYoEtVOkkkvEbNjtYw/pb66npR
         8+TC996m/AcaRIgz/l8Bca8gPipLaLwxwoJQYEWP/1Zl9zBxc++ik58JiayhEx784UY6
         lTCOyidiQRvWkhbkrjKvYkY/NrgSlcBkk9twCN6mdRsoJ7WphIUxgZK9hFEkVQ2xddPc
         /dUFlYj4yOh7o9Z2HB9t0lnHCmU6gwv683Xiy88D+WN6y8HxIBG1kKkLa2rPtyHn9WJg
         NlLsXvw9KZX6LAEtv04SL1H9DAn2vJ+NAvs1OVP0gQcITyA/zO9KejR/2zCALVph8jV0
         2JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/xvzwCcGxAfBOu4y7NBBw3m632OcoJoESq4Juj7wr8=;
        b=ptTiVFVahpS9d6yXvLvAJQaviEOhY2k7jUL1TKm/tCMwZSaxbLG1UzCH4jj56PCWY1
         ysdIKRleqmbfFlSVen9GwwHDTstKAdsepKEL4nqDtcQgAz9TQWxjn6OTo1mv3kvknfzA
         sG1yBTCEuLRppGUau+zyLwFR2JDoAdShAHeco4atDq9i03DUvhCMQNsuKtrjaa+Hn6py
         6gtiJnvGGyfutY62rhwgaGsHBrvOBX0mBfpOpTEXGqnrDYItDFigLDNedZgKWVklSDPP
         4l1L5NuPPH44Lk/51NtVzTdwttefZESNYW+++XLm/JPLMBgRSX9yo3VY0ypQHYolBN4b
         FS4g==
X-Gm-Message-State: AOAM530o2JpSOrcMnuJkGqKrC2tVDP/zvO+FsSrQ5ZIeNvaUbDZWRGO3
	YeZktsH990oYbyvvF3loXW47lqCUgU0u9w==
X-Google-Smtp-Source: ABdhPJw/qDdhe/mBeOZ/PZRnzfcw21vws3csTP+i/YA7uyyMF4BcYDY/9Px1dEe00pAMDY/LipPdyg==
X-Received: by 2002:aa7:8649:0:b029:1fb:283:6047 with SMTP id a9-20020aa786490000b02901fb02836047mr1857434pfo.62.1615941119709;
        Tue, 16 Mar 2021 17:31:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id gb1sm486178pjb.21.2021.03.16.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 17:31:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrei Gherzan <andrei@gherzan.com>
Subject: [PATCH] webkitgtk: Reduce stack and heap sizes for jsc on musl
Date: Tue, 16 Mar 2021 17:31:55 -0700
Message-Id: <20210317003155.1368207-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

[YOCTO #14281]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.com>
---
 .../webkitgtk/musl-lower-stack-usage.patch    | 51 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
new file mode 100644
index 0000000000..3d66766d9a
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
@@ -0,0 +1,51 @@
+reduce thread stack and heap usage for javascriptcore on musl
+
+default sizes for musl are smaller compared to glibc, this matches
+to musl defaults, avoid stack overflow crashes in jscore
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/JavaScriptCore/runtime/OptionsList.h
++++ b/Source/JavaScriptCore/runtime/OptionsList.h
+@@ -75,6 +75,18 @@ constexpr bool enableWebAssemblyStreamin
+ // On instantiation of the first VM instance, the Options will be write protected
+ // and cannot be modified thereafter.
+ 
++#if OS(LINUX) && !defined(__GLIBC__)
++// non-glibc options on linux ( musl )
++constexpr unsigned jscMaxPerThreadStack = 80 * KB;
++constexpr unsigned jscSoftReservedZoneSize = 32 * KB;
++constexpr unsigned jscReservedZoneSize = 16 * KB;
++#else
++//default
++constexpr unsigned jscMaxPerThreadStack = 4 * MB;
++constexpr unsigned jscSoftReservedZoneSize = 128 * KB;
++constexpr unsigned jscReservedZoneSize = 64 * KB;
++#endif
++
+ #define FOR_EACH_JSC_OPTION(v)                                          \
+     v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs to go before other options since they depend on this value.") \
+     v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC options were passed to the VM") \
+@@ -90,9 +102,9 @@ constexpr bool enableWebAssemblyStreamin
+     \
+     v(Bool, reportMustSucceedExecutableAllocations, false, Normal, nullptr) \
+     \
+-    v(Unsigned, maxPerThreadStackUsage, 5 * MB, Normal, "Max allowed stack usage by the VM") \
+-    v(Unsigned, softReservedZoneSize, 128 * KB, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
+-    v(Unsigned, reservedZoneSize, 64 * KB, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
++    v(Unsigned, maxPerThreadStackUsage, jscMaxPerThreadStack, Normal, "Max allowed stack usage by the VM") \
++    v(Unsigned, softReservedZoneSize, jscSoftReservedZoneSize, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
++    v(Unsigned, reservedZoneSize, jscReservedZoneSize, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
+     \
+     v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
+     v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
+@@ -601,7 +613,7 @@ public:
+     bool init(const char*);
+     bool isInRange(unsigned);
+     const char* rangeString() const { return (m_state > InitError) ? m_rangeString : s_nullRangeStr; }
+-    
++
+     void dump(PrintStream& out) const;
+ 
+ private:
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index d0a41f48c7..36d33f550d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
+           file://musl-lower-stack-usage.patch \
            "
 
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
-- 
2.31.0

