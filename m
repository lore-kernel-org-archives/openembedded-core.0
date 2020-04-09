Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.5088.1586420970073027956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 01:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b4/+2Xnv;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id kx8so981046pjb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zoXSajyzKcs2Fsl5z2VTCEMDT+B6y9jrVwiBfAJ68LU=;
        b=b4/+2XnvMzWTmihBthtIxQ4n3zU3gL/KDO/GMIjSKX4KAFWZMShE6FxTmEgibGsgJE
         Yv/P5YeWnd5mQ7qWZ+BBqN0D8Om2eNwnen7CAC6J0K01bzxMkNcJucZQwYAXzsueS0mQ
         NwPmkonj6junSbw9C6lH8NAWrNtFwSeBxSfVFGqDZZ7iGcv2qQJOWFnNzdoR9wuygCiQ
         3oLzE5lXObbuATFfCoxJ9Hd3h29bbzwjvZnANYnsrIjCpVX0nJIDHny4VyzFh1lyMVJi
         BhSfbgFrGulrIYTBTa6xdN49ZtbD909bYSBIA59YTRzHQOgUMcM3PHmJh++V3Q8CLqex
         jt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zoXSajyzKcs2Fsl5z2VTCEMDT+B6y9jrVwiBfAJ68LU=;
        b=MxbToDQHMHBAz4Lidct7n2JhPFuqggjsjTzplU/rlzwlq2uWr22XYENyCgWdb4wuDw
         LYrS643Josfhrmr8niXYe+RPbwBhDVgUEUfrbiQn4QKmiTp1fGCpiKSY7xRGd52dsfZR
         HG2hGERDr2n3dSFqf29MgA7ByHkrPjPtPJDbXdDrycnHszNiFsmJruQq8A67VTR7TGMw
         8SLdxOckXlKXFCuPdp8RUmTGcbRgyy9gm4XY9h/q8G3T6jka8l3eALmTn8NzxBfDVPYK
         T2rwubPnkiMNuv9qZvQ43a9vUpH4FamMeIwSugW30F+QyFHy6hhdiX8UBamL2Lpu1f68
         foXQ==
X-Gm-Message-State: AGi0PuZ4IrkhqTSUAP7kQ61p0QFNBfPBss8tpKUJxLVdGkJ0lAGBAzGJ
	He9nSXXQB7JRvN8jXZy+dR2JxRk2ZlU=
X-Google-Smtp-Source: APiQypLT9JytHS4sq23zs89na6zIgINMzHgo39tzGEMdXl67P+Z1zM4aiH9j7NAW80BUQfPFSy9bRA==
X-Received: by 2002:a17:90a:2801:: with SMTP id e1mr10501126pjd.78.1586420968828;
        Thu, 09 Apr 2020 01:29:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6fb4])
        by smtp.gmail.com with ESMTPSA id 6sm13972947pgz.0.2020.04.09.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 01:29:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] multilib: Enable multilib headers for musl
Date: Thu,  9 Apr 2020 01:29:41 -0700
Message-Id: <20200409082941.3428697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is no longer needed as we can build multilibbed images with musl
now

Include bits/reg.h on musl instead of bits/wordsize.h where __WORDSIZE
is defined

[YOCTO #13122]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: include bits/reg.h on musl for __WORDSIZE

 meta/classes/multilib_header.bbclass | 7 -------
 scripts/multilib_header_wrapper.h    | 4 ++++
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..48f231eed0 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,13 +6,6 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-
-	case ${HOST_OS} in
-	*-musl*)
-		return
-		;;
-	*)
-	esac
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index c81e7ee5e8..00ea5bf841 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -16,7 +16,11 @@
 #elif defined (__aarch64__)
 #define __MHWORDSIZE			32
 #else
+#if defined(__GLIBC__)
 #include <bits/wordsize.h>
+#else
+#include <bits/reg.h>
+#endif
 #if defined (__WORDSIZE)
 #define __MHWORDSIZE			__WORDSIZE
 #else
-- 
2.26.0

