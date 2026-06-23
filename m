Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928AECDE00D
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32860.1782253627103199963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DMIAwsPJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2851595e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253625; x=1782858425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDlW9px/ITHJH1bEiwBWyNBF+qICPHtYFcNZ7pZgGyQ=;
        b=DMIAwsPJyV2+mWCWTt1UpexllaHFjpT+Y13KvDO6nxyEJ4qCBREoVm1PLYwHWJgDw/
         bA6nxyTD8Bq6hTpIbPHHmLTk8vHXWAoX77yxFkRWFGd5KD+ey2tFQjosVdgc4oY9APzL
         1UXVHarhG8koyf+FBCsKc8dPY1Y1i3Y96/1fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253625; x=1782858425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDlW9px/ITHJH1bEiwBWyNBF+qICPHtYFcNZ7pZgGyQ=;
        b=qeUssBswT39nK5jKZCpp38avw6s5yUiDnueV+0yqevFbvNdw3ZrJPK5SqZWaHTNgB5
         cBL+8zi0K8zmS8yBSPSYX9g+TjeXX+T0eZhEKCUPU1pNjjDCDX/eQSv5IqtCs4z4D4zs
         YTWNyyxtR+6O6gPUH3/3k59C2qfpfp3MZufTUs/CS4hpFVwF3xBcjUvr2aOolgnyi/hc
         6XloLIrFyx7GthT+SBxKIQ5qX87oVTwJ/3P87Q9o2ag/N5NfPQvohQww1n/tR5uUVbxt
         w/fWZUuO7Gay1xRq5bM5sHoN84o4RC2wr1M1vykzoUWL5oQAg9xAI2NaPx0F4XtlKorH
         Js7A==
X-Gm-Message-State: AOJu0YwXp3AeM3260/G/QfT+HWGyqtIPPKtVi+lX7vM0Btdh4sBqQMjo
	39522u4D/w9fCJRZZL2ou9N95mpvwM+LMbJyoC0rv3kHZ1wPETPxlta+gSFfN7k66Rf03dA4JRB
	fMsym
X-Gm-Gg: AfdE7cmYV/82/p1//dojywhotQkU/7shhUiZfre9fzNJVliSrt3Zpq04zqliRjz1eK2
	Cu9h+p0k4cQATMzxadIk6Q1Tv5ZA2ZL4GUDZiBjSRPImiZsg0vVxOmiRQMrnmZoiHCM7FyLPXi8
	YI51KYj8wII1bbbeW5Zotafij/MXBX/RmQnztkEsNppxKk1vqCNHVcWcxqBIlneTgZbklUS0Ls9
	8NlXH4fTCwYnjOQtKQUtBH+9C/SIuKD5uA9Yre5/LMLfC7RH5VxJGj7qVe+ybwA36NuBc3324Kq
	uNdz/woBjn/RLtnF2PQkJVoQuryopjvriKGQHeL/4TU6jELRYziTV8hk0CeigcTCMLrSH/dFooD
	mJkWcoS3CUP/HSbRY3tEr7pqqBezwXKDwxRC7F472Xb5QIvDGRpD9kIuHdkJd9AH0y0hvGOBxrJ
	kOhy+obthXCB4ADePhG5r7fuHM3n2c3vHsJoq7xjBefyC2SvkreKYj77Kn9wVAFZAhZSAKh5kpt
	ZSH2OKpb+6HBKPm
X-Received: by 2002:a05:600c:528b:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-4925b3801c4mr68003865e9.25.1782253625337;
        Tue, 23 Jun 2026 15:27:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 14/41] libsolv: fix CVE-2026-9150
Date: Wed, 24 Jun 2026 00:26:13 +0200
Message-ID: <42214e12ad205e1da59cb839849e8bfb5c300de5.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239436

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-9150.
https://nvd.nist.gov/vuln/detail/CVE-2026-9150

Upstream fix:
  https://github.com/openSUSE/libsolv/pull/616

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-9150.patch       | 68 +++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
new file mode 100644
index 00000000000..4903edb5998
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
@@ -0,0 +1,68 @@
+From bea261fd0924ecd5c7e5579f460133ec023c6def Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Wed, 22 Apr 2026 09:18:29 +0200
+Subject: [PATCH] Fix a buffer overflow when copying SHA-384/512 checksum from
+ a Debian repository
+
+When parsing Debian repository, control2solvable() copies a package
+checksum string from the repository into a stack-allocated "char
+checksum[32 * 2 + 1]" array.
+
+If the repository defined a SHA384 or SHA512 tag, a buffer overflow
+occured (as can be seen when compiling libsolv with CFLAGS='-O0 -g
+-fsanitize=address') because those tag values are longer:
+
+    $ cat /tmp/Packages
+    Package: p
+    Version: 1
+    Architecture: all
+    SHA512: 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
+
+    $ /tmp/b/tools/deb2solv -r /tmp/Packages
+    =================================================================
+    ==3695==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7b685ecf0071 at pc 0x7f6861683722 b
+    p 0x7fff37e3e7a0 sp 0x7fff37e3df60
+    WRITE of size 129 at 0x7b685ecf0071 thread T0
+        #0 0x7f6861683721 in strcpy.part.0 (/lib64/libasan.so.8+0x83721) (BuildId: 80bfc4ae44fdec6ef5fecfb01e2b57d28660991c)
+        #1 0x7f6861d7f34d in control2solvable /home/test/libsolv/ext/repo_deb.c:491
+        #2 0x7f6861d804ea in repo_add_debpackages /home/test/libsolv/ext/repo_deb.c:622
+        #3 0x000000400fd5 in main /home/test/libsolv/tools/deb2solv.c:134
+        #4 0x7f686123c680 in __libc_start_call_main (/lib64/libc.so.6+0x3680) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #5 0x7f686123c797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3797) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #6 0x000000400694 in _start (/tmp/b/tools/deb2solv+0x400694) (BuildId: a3350337819a51edd0c75293970d3458b5033bc9)
+
+    Address 0x7b685ecf0071 is located in stack of thread T0 at offset 113 in frame
+        #0 0x7f6861d7de2a in control2solvable /home/test/libsolv/ext/repo_deb.c:365
+
+      This frame has 1 object(s):
+        [48, 113) 'checksum' (line 371) <== Memory access at offset 113 overflows this variable
+
+This patch fixes it by enlarging the buffer to accomodate the longest
+supported digest string.
+
+This flaw was introduced with c8164bfecf2ba8bcf4c24329534d3104f19da73c
+commit ("[ABI BREAKAGE] add support for SHA224/384/512").
+
+Reported by Aisle Research.
+
+CVE: CVE-2026-9150
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/c5b5db52aebde00bdeacecf4d0569c217ab3187d]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ ext/repo_deb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/repo_deb.c b/ext/repo_deb.c
+index d400f959..25eaf8cb 100644
+--- a/ext/repo_deb.c
++++ b/ext/repo_deb.c
+@@ -368,7 +368,7 @@ control2solvable(Solvable *s, Repodata *data, char *control)
+   char *p, *q, *end, *tag;
+   int x, l;
+   int havesource = 0;
+-  char checksum[32 * 2 + 1];
++  char checksum[64 * 2 + 1];
+   Id checksumtype = 0;
+   Id newtype;
+ 
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 201059323aa..63534dce260 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -10,6 +10,7 @@ DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://CVE-2026-9150.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"

