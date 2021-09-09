Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.597.1631201779333386755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dHpqFVf3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso1715167wmi.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XK1rrp8R02RBlQIaJLVwCSw7cZycfiQ7nU3zEa4AmUA=;
        b=dHpqFVf30NLvrNK1xz3yHHnvYcuv0W7YOMzLtaLu44/fmpYNOtRHxVUCDcZiHx0M8g
         iG5rDkrVDhyAc96a5+d8zEqcug8EKCD5a199inyVKrwnhNQypUji7LArn+KOJDw42w39
         WGoSeuBMAZJErO0d04c2aK3qnnLdUMn/OPF5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XK1rrp8R02RBlQIaJLVwCSw7cZycfiQ7nU3zEa4AmUA=;
        b=KGVm5yOQj7PeepNs+hF79BYfE+W90e7IzxJWbvHxkWWSjscmDcHnodmvoiZwVh1BDg
         b2mugdVzGZhXgRIePxS0SPvdJ7vv9SiMbktkVs9tK9wptfTipksuFTJrvfv9p5oE8DTu
         jc1LFhUw0vm4m5WGpGpmdNjUjirbCu8jUfr3QaN7k3CLTYulrHSagp5C2lBkSD0DjeOg
         rfuwN1Bvfah+syDL06QHOxgv0LlbrRtsPZBBYrYWozbEcSJA5NyPRg8c2PX4FGxVYuJR
         BNuVsQc3gScLJtRlLn3M1MGGSEZVyFXPfDIhYUEzSguV70Y/yO9cgMDDZC6tW/+W5KGB
         KLGQ==
X-Gm-Message-State: AOAM530Oxqky/YctFXGrQXh7SNvImaJ6hpcKoNlQWhRHg5L7G+gvLM9L
	vxJ3swAUU+wz3HWwzQpvxBbtPcR6Z99skV8p
X-Google-Smtp-Source: ABdhPJyDMSkHWgY4RxoPTQe9zCAdpUgwRj3zq5Va5Z1eAW2dXXReMst151lViOf+ITHrcZexFCbtLg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr3744829wmi.131.1631201777756;
        Thu, 09 Sep 2021 08:36:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 4/6] ports/linux/guts: Add close_range wrapper for glibc 2.34
Date: Thu,  9 Sep 2021 16:36:12 +0100
Message-Id: <20210909153614.1225570-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc 2.34 adds a close_range() function call. This one is straight forward
as it allows ENOSYS to be returned and the caller has to handle it so
lets do that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/guts/close_range.c | 20 ++++++++++++++++++++
 ports/linux/wrapfuncs.in       |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 ports/linux/guts/close_range.c

diff --git a/ports/linux/guts/close_range.c b/ports/linux/guts/close_range.c
new file mode 100644
index 0000000..4bd2fe1
--- /dev/null
+++ b/ports/linux/guts/close_range.c
@@ -0,0 +1,20 @@
+/*
+ * Copyright (c) 2021 Richard Purdie
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * int close_range(unsigned int lowfd, unsigned int maxfd, int flags)
+ *      int rc = -1;
+ */
+
+        (void) lowfd;
+        (void) maxfd;
+        (void) flags;
+        /* for now pretend the kernel doesn't support it regardless 
+           which users are supposed to be able to handle */
+        errno = ENOSYS;
+        rc = -1;
+
+/*      return rc;
+ * }
+ */
diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
index 3824fd8..e978367 100644
--- a/ports/linux/wrapfuncs.in
+++ b/ports/linux/wrapfuncs.in
@@ -61,3 +61,4 @@ int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=ps
 long syscall(long nr, ...); /* hand_wrapped=1 */
 int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
 int prctl(int option, ...); /* hand_wrapped=1 */
+int close_range(unsigned int lowfd, unsigned int maxfd, int flags);
-- 
2.32.0

