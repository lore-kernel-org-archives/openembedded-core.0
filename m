Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49658C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 07:33:43 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.9328.1678174418290231714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 23:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VLm9Z9VU;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: skulkarni@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so11093720pjz.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 23:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678174417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qun7YFbPTchOZg/66mxipMDwPQUH27Oxh2hHEKNisnE=;
        b=VLm9Z9VUVNzX/WUL5fPk8tDWR0w/SwYbGWWJPevbAyEeEA8/LprALMnA6j6VHyrzcM
         hBk7HmBKqiJc8FRGZPhKydbI1Oj49zzsiU6skpQTgkR+IurU0NcGfxeoYv6jvHK6B0q3
         6Drq4BuBAsEvLU+R5J9zJcXoH/RilOjrxvEyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678174417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qun7YFbPTchOZg/66mxipMDwPQUH27Oxh2hHEKNisnE=;
        b=MIv2oc8ES+JNKlR/ttbhB+vC1lX0+HhSAv+L4D4udp9s9Gvx2bXZEi9YCvsBKV2+Iw
         vEHylmiYmrEsMH6XNVkaAkCGObdMAY+vfr8TprsdTihYhs/sXhUbF7sbwuendeqKooua
         YOAoOfioSe7yEweqF+0vQQtP2e34oX9rObwlKaFtOHUoF0PVq7FmYm8N0v5UnVt6lbJR
         nxTLitBhe9JPMIL/RphBtVAdSeUp+t7baaYDlBTkHRvZt7MTrTr7Dto7qj216XPSgz+B
         fPdgpkVvyNyvAtwTqEGBiEpXotq0XJ1lppIrENVJSu42gujVzwiLAVgFbvPLUzO7gK7/
         rtiw==
X-Gm-Message-State: AO0yUKUoqDQE2gHLirwv57rTQ0dXOMOQCpGZ/AN25KyaBeO2E9I8HJbK
	HD7g/RTNS7LqLMJOTrFz9efMq2Hg/4E2CI+z4G4=
X-Google-Smtp-Source: AK7set+qC6/j88XfMIKVRmi04ohcZw2gjCLR71vFibrm/UFPBM/HbE85D1irlWPCEurM5NY/iUvoaQ==
X-Received: by 2002:a17:90b:2742:b0:237:47b0:3235 with SMTP id qi2-20020a17090b274200b0023747b03235mr14296499pjb.32.1678174417191;
        Mon, 06 Mar 2023 23:33:37 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id ga7-20020a17090b038700b00233db0db3dfsm8875405pjb.7.2023.03.06.23.33.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Mar 2023 23:33:36 -0800 (PST)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Security fix for CVE-2023-0687
Date: Tue,  7 Mar 2023 13:03:29 +0530
Message-Id: <1678174409-19199-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178093

From: Shubham Kulkarni <skulkarni@mvista.com>

Backport from https://sourceware.org/git/?p=glibc.git;a=patch;h=801af9fafd4689337ebf27260aa115335a0cb2bc

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch | 82 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb             |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch b/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
new file mode 100644
index 0000000..10c7e56
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
@@ -0,0 +1,82 @@
+From 952aff5c00ad7c6b83c3f310f2643939538827f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
+ =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
+Date: Sat, 4 Feb 2023 14:41:38 +0300
+Subject: [PATCH] gmon: Fix allocated buffer overflow (bug 29444)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The `__monstartup()` allocates a buffer used to store all the data
+accumulated by the monitor.
+
+The size of this buffer depends on the size of the internal structures
+used and the address range for which the monitor is activated, as well
+as on the maximum density of call instructions and/or callable functions
+that could be potentially on a segment of executable code.
+
+In particular a hash table of arcs is placed at the end of this buffer.
+The size of this hash table is calculated in bytes as
+   p->fromssize = p->textsize / HASHFRACTION;
+
+but actually should be
+   p->fromssize = ROUNDUP(p->textsize / HASHFRACTION, sizeof(*p->froms));
+
+This results in writing beyond the end of the allocated buffer when an
+added arc corresponds to a call near from the end of the monitored
+address range, since `_mcount()` check the incoming caller address for
+monitored range but not the intermediate result hash-like index that
+uses to write into the table.
+
+It should be noted that when the results are output to `gmon.out`, the
+table is read to the last element calculated from the allocated size in
+bytes, so the arcs stored outside the buffer boundary did not fall into
+`gprof` for analysis. Thus this "feature" help me to found this bug
+during working with https://sourceware.org/bugzilla/show_bug.cgi?id=29438
+
+Just in case, I will explicitly note that the problem breaks the
+`make test t=gmon/tst-gmon-dso` added for Bug 29438.
+There, the arc of the `f3()` call disappears from the output, since in
+the DSO case, the call to `f3` is located close to the end of the
+monitored range.
+
+Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
+
+Another minor error seems a related typo in the calculation of
+`kcountsize`, but since kcounts are smaller than froms, this is
+actually to align the p->froms data.
+
+Co-authored-by: DJ Delorie <dj@redhat.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=801af9fafd4689337ebf27260aa115335a0cb2bc]
+CVE: CVE-2023-0687
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ gmon/gmon.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gmon/gmon.c b/gmon/gmon.c
+index dee6480..bf76358 100644
+--- a/gmon/gmon.c
++++ b/gmon/gmon.c
+@@ -132,6 +132,8 @@ __monstartup (u_long lowpc, u_long highpc)
+   p->lowpc = ROUNDDOWN(lowpc, HISTFRACTION * sizeof(HISTCOUNTER));
+   p->highpc = ROUNDUP(highpc, HISTFRACTION * sizeof(HISTCOUNTER));
+   p->textsize = p->highpc - p->lowpc;
++  /* This looks like a typo, but it's here to align the p->froms
++     section.  */
+   p->kcountsize = ROUNDUP(p->textsize / HISTFRACTION, sizeof(*p->froms));
+   p->hashfraction = HASHFRACTION;
+   p->log_hashfraction = -1;
+@@ -142,7 +144,7 @@ __monstartup (u_long lowpc, u_long highpc)
+	 instead of integer division.  Precompute shift amount. */
+       p->log_hashfraction = ffs(p->hashfraction * sizeof(*p->froms)) - 1;
+   }
+-  p->fromssize = p->textsize / HASHFRACTION;
++  p->fromssize = ROUNDUP(p->textsize / HASHFRACTION, sizeof(*p->froms));
+   p->tolimit = p->textsize * ARCDENSITY / 100;
+   if (p->tolimit < MINARCS)
+     p->tolimit = MINARCS;
+--
+2.7.4
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index df847e7..29fcb1d 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://CVE-2023-0687.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.7.4


