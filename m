Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668FEEB64D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.29.1687143361978196448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J3h/JRYo;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.176, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3f866383b25so25703201cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143360; x=1689735360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHf0pwk7+B8iz7Z+l3BFcg66q/zPM5kk9y54mfXX2/M=;
        b=J3h/JRYorrZqzeW0JUb5hOV3m/EzZr4Mzxim+L/bxhhzHXRSoyqOcpvu/gQTpcWEL4
         aJaae4Q5iB2AbYBie39FUiR1A/vzdYgwx4eTSl9LuNHa/WzJ0rT6iHafUpKZSdy45raD
         SxKm/SE4cXl4q2B8HuAs8gxpC1t5egLlyy3KNMN1HaESUQGe2kZ0iUCZpMWLrLwL+FDn
         es2m5K4oEwy05cI6UC+PaTvMvhy262GVVSEmzzbmah4Iq95YkJxdT/urkNLBRFF4V+oO
         RtT4DYSWn3A3q9M4CapxhRVN0/dFYsqC7r95Nxget5KIo9xJwraeDUzkGE0Nle9dwyGi
         Ekbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143360; x=1689735360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHf0pwk7+B8iz7Z+l3BFcg66q/zPM5kk9y54mfXX2/M=;
        b=cmLTxkUovnDu0ostxHc9S4+qHfxyl6y+4m/DMVLdTbvPGHIyqF53F9sDU8D9gfY+KM
         /SfDFOXacpOZ2tMieExij+D8GDnDKIEooVQmC2xAWZKtv16dD7PBN0RKvVyolWPmQJiG
         LUWNnFvoKgt7IyzUPklDqaUv7LUInRdStQ70qwiuD8fyYXbUuOAcBq/7Otvx+8wQ9A5n
         mqeb9BSkM7Btz25h+Q+GEyHLnvb8sXECLvgGYLVpFvEKbpYmdh1DU1sJ8wfZ0z9ZO8iU
         cOM9FPB+JT7R53mmiOEbx/mZQMtjqyxemgXGr9KXYXoQlq339tSZF1tYapsveG54Wvpg
         rzmA==
X-Gm-Message-State: AC+VfDypUSnvwRLoIhT5Jq2+cRqRGQtz53j/gpubwa6IlyIyOZGVnpZk
	gdNPzVGK0qellDEi6zKbX7BDrUqi/7zZ/Y8+2jI=
X-Google-Smtp-Source: ACHHUZ6P3RktsTuY78u6xSuUGaqQApITZ3x4x7EDhtyVDaNbFubx+Z9jXajKKfXpysVPLrWC0R0e0g==
X-Received: by 2002:ac8:5c96:0:b0:3f8:4bb:4094 with SMTP id r22-20020ac85c96000000b003f804bb4094mr11762395qta.62.1687143360350;
        Sun, 18 Jun 2023 19:56:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/18] glibc: stable 2.35 branch updates
Date: Sun, 18 Jun 2023 16:55:29 -1000
Message-Id: <afce7649180950b0a168771c2f95e7839382b02c.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183076

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Below commits on glibc-2.35 stable branch are updated.
cbceb903c4 (HEAD -> release/2.35/master, origin/release/2.35/master) io: Fix F_GETLK, F_SETLK, and F_SETLKW for powerpc64
0967fb5861 io: Fix record locking contants on 32 bit arch with 64 bit default time_t
739de21d30 Document BZ #20975 fix
2b9906f9a0 __check_pf: Add a cancellation cleanup handler
7035f2174f gmon: Revert addition of tunables to preserve GLIBC_PRIVATE ABI
e698e8bd8e gmon: fix memory corruption issues
9f81b8fa65 gmon: improve mcount overflow handling
f2820e478c gmon: Fix allocated buffer overflow
413af1eb02 posix: Fix system blocks SIGCHLD erroneously

CVE-2023-0687.patch is dropped

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../glibc/glibc/CVE-2023-0687.patch           | 82 -------------------
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 -
 3 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d8d96cefb..01b1abef7d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "1c7f51c75ae300fe52ccb636e71b8e28cb20824c"
+SRCREV_glibc ?= "cbceb903c4d770acc7e4ba5641036516830ed69b"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch b/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
deleted file mode 100644
index 10c7e5666d..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 952aff5c00ad7c6b83c3f310f2643939538827f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
- =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
-Date: Sat, 4 Feb 2023 14:41:38 +0300
-Subject: [PATCH] gmon: Fix allocated buffer overflow (bug 29444)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The `__monstartup()` allocates a buffer used to store all the data
-accumulated by the monitor.
-
-The size of this buffer depends on the size of the internal structures
-used and the address range for which the monitor is activated, as well
-as on the maximum density of call instructions and/or callable functions
-that could be potentially on a segment of executable code.
-
-In particular a hash table of arcs is placed at the end of this buffer.
-The size of this hash table is calculated in bytes as
-   p->fromssize = p->textsize / HASHFRACTION;
-
-but actually should be
-   p->fromssize = ROUNDUP(p->textsize / HASHFRACTION, sizeof(*p->froms));
-
-This results in writing beyond the end of the allocated buffer when an
-added arc corresponds to a call near from the end of the monitored
-address range, since `_mcount()` check the incoming caller address for
-monitored range but not the intermediate result hash-like index that
-uses to write into the table.
-
-It should be noted that when the results are output to `gmon.out`, the
-table is read to the last element calculated from the allocated size in
-bytes, so the arcs stored outside the buffer boundary did not fall into
-`gprof` for analysis. Thus this "feature" help me to found this bug
-during working with https://sourceware.org/bugzilla/show_bug.cgi?id=29438
-
-Just in case, I will explicitly note that the problem breaks the
-`make test t=gmon/tst-gmon-dso` added for Bug 29438.
-There, the arc of the `f3()` call disappears from the output, since in
-the DSO case, the call to `f3` is located close to the end of the
-monitored range.
-
-Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
-
-Another minor error seems a related typo in the calculation of
-`kcountsize`, but since kcounts are smaller than froms, this is
-actually to align the p->froms data.
-
-Co-authored-by: DJ Delorie <dj@redhat.com>
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=801af9fafd4689337ebf27260aa115335a0cb2bc]
-CVE: CVE-2023-0687
-Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
----
- gmon/gmon.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/gmon/gmon.c b/gmon/gmon.c
-index dee6480..bf76358 100644
---- a/gmon/gmon.c
-+++ b/gmon/gmon.c
-@@ -132,6 +132,8 @@ __monstartup (u_long lowpc, u_long highpc)
-   p->lowpc = ROUNDDOWN(lowpc, HISTFRACTION * sizeof(HISTCOUNTER));
-   p->highpc = ROUNDUP(highpc, HISTFRACTION * sizeof(HISTCOUNTER));
-   p->textsize = p->highpc - p->lowpc;
-+  /* This looks like a typo, but it's here to align the p->froms
-+     section.  */
-   p->kcountsize = ROUNDUP(p->textsize / HISTFRACTION, sizeof(*p->froms));
-   p->hashfraction = HASHFRACTION;
-   p->log_hashfraction = -1;
-@@ -142,7 +144,7 @@ __monstartup (u_long lowpc, u_long highpc)
-	 instead of integer division.  Precompute shift amount. */
-       p->log_hashfraction = ffs(p->hashfraction * sizeof(*p->froms)) - 1;
-   }
--  p->fromssize = p->textsize / HASHFRACTION;
-+  p->fromssize = ROUNDUP(p->textsize / HASHFRACTION, sizeof(*p->froms));
-   p->tolimit = p->textsize * ARCDENSITY / 100;
-   if (p->tolimit < MINARCS)
-     p->tolimit = MINARCS;
---
-2.7.4
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 29fcb1d627..df847e76bf 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -50,7 +50,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
-           file://CVE-2023-0687.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


