Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.486.1616012703810038091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 13:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESn7kCU2;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id x29so302377pgk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sc+6mkTaRCOBQ3X/vanhuff1TFF4d7LKFJJhMrVs4Ws=;
        b=ESn7kCU2hIWtogkEd4BwCUH7YAbZzybu4EXj6NfyDfN2p2MQjs/FJTsPhMLraLGnnG
         faPjKWJWF1QKac7VmEAdTs/hFB+vUGL9AKlr9KW8IiGXj7qvYV0B/GKuWgLCZsl2zPK3
         jdh3MhDZ+rhCLxg2Y43QjsXbhDSeq1UM2c7LmA3s6wBzg86REdgnZsgLOnOPl0pNG2/e
         166aQFEDrbL1Mq3lo1/eRVedobZmAQOVxGoyLs+jmrElgr7Ydd0XRfleiW/6fCt2ydH+
         h6V+4YlaNKMdF6bgFkk1eYhDz+BFS+pjrWPYjEHlwht20DLb7G5HTeZ22sZLqMEk/ZMz
         phUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sc+6mkTaRCOBQ3X/vanhuff1TFF4d7LKFJJhMrVs4Ws=;
        b=aLclwzzE1BobsyqyIWWQiKW5iB5wSJjz8esGeo97LTG1iwKQgW9mercsGl9O/SBA4p
         tSGYVjs6BpWHzOdzfO5tWun8tMjSFs8JtSHVphd19mdhMJ0iKQiybZATn4BhANNlpJ+Q
         IYWtuUhSTEUw/U7H0sos72Qkk+wdob+x6CHoTyJXpdyr0KsslJCfkdoX0JmjKwcu7FI9
         jnxUUtDK0AjjuO6ncpFh1DJd2DiSIVyF9sE+NmyUVe1cmtbaFKZDiHOlqBSYCEr+IXba
         ojM4xArMS9Sy6T6uOU5mrVMCpuDBRsAhdp1cd2I5u5CVgtzyIECx0AeP/1c70EhOIyoA
         3w6w==
X-Gm-Message-State: AOAM530DAIbjSWXIfZayIx/+ct5juqACoTUvVP8YAlWWaq0VRGa3VRXd
	XuSjCzRx5nOhYtR/PljsL0dIU4igFh4LvQ==
X-Google-Smtp-Source: ABdhPJyu5b5hHcinS1bUM41drv0YmGR9djGJ+TTRtN05gLFfCNWqgkNDwENMW3+r8HE4Wgm6jYHzvQ==
X-Received: by 2002:a05:6a00:2288:b029:202:2103:3f21 with SMTP id f8-20020a056a002288b029020221033f21mr689706pfe.39.1616012702698;
        Wed, 17 Mar 2021 13:25:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id m7sm3922045pjc.54.2021.03.17.13.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 13:25:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrei Gherzan <andrei@gherzan.com>
Subject: [PATCH v2 1/3] webkitgtk: Reduce stack and heap sizes for jsc on musl
Date: Wed, 17 Mar 2021 13:24:57 -0700
Message-Id: <20210317202459.213685-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

[YOCTO #14281]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.com>
---
v2: Describe the patch and add links to upstream discussion

 .../webkitgtk/musl-lower-stack-usage.patch    | 74 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
new file mode 100644
index 0000000000..dc3a71d932
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
@@ -0,0 +1,74 @@
+reduce thread stack and heap usage for javascriptcore on musl
+
+default sizes for musl are smaller compared to glibc, this matches
+to musl defaults, avoid stack overflow crashes in jscore
+
+This is based on Alpine Linux's patch based on suggestion from
+https://bugs.webkit.org/show_bug.cgi?id=187485
+
+Real solution would entail more as the suggestions to increase
+stack size via -Wl,-z,stack-size=N does not work fully and also
+setting DEFAULT_THREAD_STACK_SIZE_IN_KB alone is not enough either
+
+This patch only changes behavior when using musl, the defaults for
+glibc in OE remains same
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
++constexpr unsigned jscMaxPerThreadStack = 128 * KB;
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
+--- a/Source/WTF/wtf/Threading.h
++++ b/Source/WTF/wtf/Threading.h
+@@ -56,6 +56,10 @@
+ #include <array>
+ #endif
+ 
++#if OS(LINUX) && !defined(__GLIBC__)
++#define DEFAULT_THREAD_STACK_SIZE_IN_KB 128
++#endif
++
+ namespace WTF {
+ 
+ class AbstractLocker;
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

