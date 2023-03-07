Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E134AC74A44
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.8696.1678229308125011952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EEV/bJFH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id d6so8578401pgu.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UPJ6STtZDZS/kHygDJ0lipjb9HB/l9LiDxVcyMWzTY=;
        b=EEV/bJFHKdzbRDOVVwq9XCm1p3L1BzJPDGfrl2E/noLHJvIbRvDV1O98j2MPPKk1Nz
         F9ob2REyLF3HVDntZGshEhWHtEuZiIGdPYE6F0EHQ9tFIdhVVFs7grXzdGgai85wVmuw
         4uOeYHof1QPN725q307DbqHh7ekilHl/SsiL/xRLDGtYhjnkX5LHJ8t6jwXYeSa/9b2E
         no10nu6FvZl8V21pg2NWkSJF9EWIKl2GHLewrJvMUAlaeEKwnDUrPBwkQkgEQ2GF7jko
         FZOuJBreUGbxx9zhzv3hAKfBSPSd814eURYjTNa9TV2m6q71pv46ieT9aj3b8Kz9+HnM
         RqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UPJ6STtZDZS/kHygDJ0lipjb9HB/l9LiDxVcyMWzTY=;
        b=70fgc5QNq28BGZL6jOnvYjz/q75YV5PwRSlV6gpV5Y5PUOOv7ilVpsT2vrpjTJ3HVb
         dEg37GAnEjF28KYca6N8bj5gG7DAaEDpBtsVjW40acZ6Q3zMmV6FWNHaDphoGtaA1ySK
         hoyE8SkYUeZIl53T3wd4+HtEuItk3SnHsP/0AsM+PNhi6DhxhA0kzP44eJovvgBV+sQ+
         VMHK8+YqgCelkxBsOWHW1457TIKLYpTqF8NfjPYurK2j8UJfCTVXVZEg6hsSEBpcIbPO
         5P7hjYKNr6V9qNB1qnpAxXM3lqUpJinS6DqiGk+KTRQa7DBxTWlTs8OUsPkzLDZ2ARAK
         ds1g==
X-Gm-Message-State: AO0yUKV/xeEazczuGCn5EFK01L5dyFO6gM+pNV/efBfYwUBzxQa+WOca
	s/hyyHzg92DglpK9ZCitZ+iOHLkG/FmoxmV0t2s=
X-Google-Smtp-Source: AK7set/aKXJMr5CX86FNgZqS3XFmM2it2RaN951UMj8av/6EZBUO1vg3Iv6w/lotqjSn0fStHzbS9A==
X-Received: by 2002:a62:6494:0:b0:5a9:c2b0:428f with SMTP id y142-20020a626494000000b005a9c2b0428fmr11159443pfb.31.1678229306931;
        Tue, 07 Mar 2023 14:48:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/23] glibc: Security fix for CVE-2023-0687
Date: Tue,  7 Mar 2023 12:47:39 -1000
Message-Id: <d7c7e9acd5b5699e4a0c2c7f2664cce7a5a08641.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178127

From: Shubham Kulkarni <skulkarni@mvista.com>

Backport from https://sourceware.org/git/?p=glibc.git;a=patch;h=801af9fafd4689337ebf27260aa115335a0cb2bc

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/CVE-2023-0687.patch           | 82 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch b/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
new file mode 100644
index 0000000000..10c7e5666d
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
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 0c37467fe4..8d216f6ed1 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -79,6 +79,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
            file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
            file://0037-Avoid-deadlock-between-pthread_create-and-ctors.patch \
+           file://CVE-2023-0687.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


