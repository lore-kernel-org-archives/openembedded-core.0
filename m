Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9415C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:18:53 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.30837.1678101524589634784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VVV/asM+;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: skulkarni@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id d10so5265245pgt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678101522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWbY1xND9tuOmaLvJAeEnYOwW+2GdKaK/YHoiReWXB4=;
        b=VVV/asM+POQPgzqJk/2BCSrfnrja2O9W5ugv++u9lYuJXsX6Lz61WNQ+CFGRCo4+4n
         7C8maUd6j7bS7KjSRRxGJCR2kggGteZjKfuooyf2sIF03Ez1GoAGib320tSdB3rl8vj9
         LsFUqaInjXP/YNrXSwAVYJSq+Adzg3LZmUwj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWbY1xND9tuOmaLvJAeEnYOwW+2GdKaK/YHoiReWXB4=;
        b=rY60cmAAxXYUNAuvBfEl8P4b5rxJlsoO9niyNWZgikLeemfsbow5wQgKW0aa+7L5SD
         28WZMKFCEL5iJuCP0Ks8ICdXA9/ET8VQZYfYsL7lQ5FXQwQiT1n8xlkQLtaM1tD5gKr5
         e6FljmG1syaOc01IrqNVYMNMJRFICXHrHvAMNWWj9pEogDYjHKNKe9kQjHGbYZdYJOOV
         /z4XjfJJbvGKJp1kLTPJzEoKvWqHjtPE2NGf5DprJxo2ZSo8dGMX0SgIgl4Krj5XgesG
         nuKWfe51tf7XtX0NyEfSTZ20Vd6P7fDo0qCWWktGgae2EVTdILYbfMnGf8bCduqDJPWF
         ADEg==
X-Gm-Message-State: AO0yUKUT5JJ1jhNf5OVBAKnpoTPt1yswYEQP37cyvjD1Ag50XKNIaRi2
	HK2YuCfk60eaiGsOtS9lB5J3RYvO4RqSydgDqVw=
X-Google-Smtp-Source: AK7set/rz5qfeOvZMRoAbWkgJhU4djBHSrVjhUE0SbOxNugRpBQKgFCoMkBYQUcOKlpkLQxNoETMaA==
X-Received: by 2002:a62:1c52:0:b0:615:25e0:286c with SMTP id c79-20020a621c52000000b0061525e0286cmr8689012pfc.31.1678101522388;
        Mon, 06 Mar 2023 03:18:42 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a2-20020aa78642000000b005a9131b6668sm6076455pfo.2.2023.03.06.03.18.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Mar 2023 03:18:23 -0800 (PST)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] glibc: Security fix for CVE-2023-0687
Date: Mon,  6 Mar 2023 16:48:05 +0530
Message-Id: <1678101485-8502-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178069

From: Shubham Kulkarni <skulkarni@mvista.com>

Backport from https://sourceware.org/git/?p=glibc.git;a=patch;h=801af9fafd4689337ebf27260aa115335a0cb2bc

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch | 82 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb             |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 0c37467..8d216f6 100644
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
2.7.4


