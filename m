Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.18108.1591288254799731890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 09:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iheDO/rT;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id q24so1406042pjd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9lrrz24g4fejeYyjkTJkff0IU33yjKQ/LuYLMvNgmY=;
        b=iheDO/rTnyRm5Pd7vLr7i89QfpjodqT77WO9rJqBAYAV2WfXZYSScHqf3Pw3eVfffJ
         z9tBdu6PNAQZn/TQCV/HRwfFxWIJSne+DT3bvQnlzIv9NOreXqgwXTulfWUxC7ghlT82
         3cFhqZ2F0TMbbLAacbRjeFUVTS8YflIkDCvpwPHMhmQob32A8LkLeNSyraI84FGI9IAH
         Bofqg7ZCYAfVg44LlPl79S6GHqzpsiI09ubWvmQxxQeV9OQnWutzetFtmMHf+hjHOdsD
         uYLNbuQZjObOdb9JPsfq1pI3tWGdEPtAJSdWOyahz2jWk6ifwHRtsYaqPlyqzGzZmJUt
         0v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9lrrz24g4fejeYyjkTJkff0IU33yjKQ/LuYLMvNgmY=;
        b=sK4Q5MVy27mFu90ryZq2jzaaSfWg5YMAbNTLJlYTMFt9iHkyr4dKp2UzSmc+2pCKTP
         A3McPKFH3yol7mKO/ZxA4id6ArtRXjjaosu4QiFBvI+0i7V8HKeswvrs52iIVldZKoD7
         mlQFy8oKPRUqbpDjimExpbtFpPfiah6YKOux41tNPUSSvwG4BWwITfEtUYH+qeikp+9x
         P1k0LgopvLaSwxRKFL6+XCUHSC9YJoCcSQ8LCDvjy79vfzyFQ8qjoh+czxNex+TW2h/W
         xmZBZdkOxurU9SWDvFaEhB2rLL1qUvYo4zZlWFj02cFN7+MrFTsq/vtyRtVyNWe9ScO9
         kDdA==
X-Gm-Message-State: AOAM530F7VZmrfAMx+njmJAe5FbVD6kFIf2+3nuUnSjrwNo9o6nvwQb2
	9AzJOTwZjaDLcKqi3vwJW2JHosAyNXg=
X-Google-Smtp-Source: ABdhPJzNPuznypwl6d6kPV0XYFUg3BTyFg/s4TiE5znXxMQvQOdC4eqiOVmKXlvDjsYoP3/DjyBcTA==
X-Received: by 2002:a17:902:8e87:: with SMTP id bg7mr5536011plb.91.1591288253685;
        Thu, 04 Jun 2020 09:30:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id l2sm4314875pga.44.2020.06.04.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 09:30:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] libunwind: Fix build on aarch64/musl
Date: Thu,  4 Jun 2020 09:30:50 -0700
Message-Id: <20200604163050.2618781-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch from upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: This patch is already upstream, so apply a backport instead

 .../libunwind/libunwind/sigset_t.patch        | 28 +++++++++++++++++++
 .../libunwind/libunwind_1.4.0.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/sigset_t.patch

diff --git a/meta/recipes-support/libunwind/libunwind/sigset_t.patch b/meta/recipes-support/libunwind/libunwind/sigset_t.patch
new file mode 100644
index 0000000000..6baaa77db5
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/sigset_t.patch
@@ -0,0 +1,28 @@
+From 5df1555828add4e256cb4bba49fffffc22127c34 Mon Sep 17 00:00:00 2001
+From: Dave Watson <dade.watson@gmail.com>
+Date: Wed, 27 May 2020 08:21:04 -0700
+Subject: [PATCH] aarch64: Fix __sigset build issue on muslC
+
+Described in issue #176.   Taken from Alpine Linux project.
+
+Change __sigset_t to sigset_t
+
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/commit/5df1555828]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/libunwind-aarch64.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libunwind-aarch64.h b/include/libunwind-aarch64.h
+index db01a9f69..d1bd8708f 100644
+--- a/include/libunwind-aarch64.h
++++ b/include/libunwind-aarch64.h
+@@ -202,7 +202,7 @@ typedef struct
+ 	unsigned long uc_flags;
+ 	struct ucontext *uc_link;
+ 	stack_t uc_stack;
+-	__sigset_t uc_sigmask;
++	sigset_t uc_sigmask;
+ 	struct unw_sigcontext uc_mcontext;
+   } unw_tdep_context_t;
+ 
diff --git a/meta/recipes-support/libunwind/libunwind_1.4.0.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
index f50205f1b9..34c2249e91 100644
--- a/meta/recipes-support/libunwind/libunwind_1.4.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
+           file://sigset_t.patch \
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-- 
2.27.0

