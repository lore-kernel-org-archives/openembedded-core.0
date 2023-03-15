Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B306AC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:30 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.8774.1678888886449532839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CKPX95Ih;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so2085394pjt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBw52maSrLutHLGtVD1M3e1rbImYy1cbc/nWi35RLek=;
        b=CKPX95IhXtmP/ZX3EFO7maVGlXcrk8XGw/9eJAJ+KGN3lyc/4yDqSm4Bn8MkSn7LaL
         /IQhnvx+Kvff0tOLa/zj3Rf6V8zW5CZbIsq9s5mP0yHNo5UbljUuD9L4GLz3XHro5OxJ
         g3fJt2eL6+tRPUM0Ag8LFStmj1hastpIQM6UAW2ZktB+idOVVJXzLMN3BTXhny8H1WcC
         RryeFOt17jfeluZV7cugP64VQ5r+7jfVmycIM5dxOZXB4uSpqwCM9/fcU5iyoMiGI/b2
         uyzQuV4BTrpIbcPG2ABCiv9lIBYol5Ya6x9M/MyIeUnKJtBUeAgxafimSmABoQvXHMEp
         2zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBw52maSrLutHLGtVD1M3e1rbImYy1cbc/nWi35RLek=;
        b=cg6SxrToRhG9IwVOzKdI4yMG0euJI/npZ670xRjb/aVhtyfTo6XeHCKp8zQD421VNs
         nAmnElhGf8EsrmbojePjL7gj7BnD0kZAuP2nKln0vBQrzqmGPJk+QV0YyaPoLRc3A4H9
         xd/68KVnV9dxSq+6LwVcOPDHNw7UqUfXcoUHRT+itLYKoofbEzDPjD5Bj8zcer7f8zaH
         lYnay+ipK997tSWkEAKXogdZJCut0UiBDx8DJhE/J5V+Jye93924nmV85xd7/WDlTWcQ
         LtdsjnE4WLDfgUa4FCVEneQhVt3Ucz3+P7L9cKs6dS4Sruw1rQGxaIM6xNm1bts+dOtp
         DrCw==
X-Gm-Message-State: AO0yUKVS2by51+ie8utrSUvlEF7NlHNZmwPnK6ymNriRUbD2IcjWrWfN
	CuJxQaLArzfKU+p7Qudlx64MvmG+1+zcTWboQZI=
X-Google-Smtp-Source: AK7set+8B9+W+tPkteu49DY/VMi2i13aAYojvizMeMF1XOXXiQLngb6xQi6kLO+po/bwtQ47dp1SYA==
X-Received: by 2002:a17:902:c40d:b0:19d:1bd6:4b84 with SMTP id k13-20020a170902c40d00b0019d1bd64b84mr3659935plk.17.1678888885212;
        Wed, 15 Mar 2023 07:01:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/22] glibc: Security fix for CVE-2023-0687
Date: Wed, 15 Mar 2023 04:00:53 -1000
Message-Id: <eadf28a0640c9b714bfa8081626641a7d3d30537.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178553

From: Shubham Kulkarni <skulkarni@mvista.com>

Backport from https://sourceware.org/git/?p=glibc.git;a=patch;h=801af9fafd4689337ebf27260aa115335a0cb2bc

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/CVE-2023-0687.patch           | 82 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index df847e76bf..29fcb1d627 100644
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
2.34.1


