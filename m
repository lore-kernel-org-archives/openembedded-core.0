Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55B4CD98D6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33654.1781132125207225284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WaOFmE7+;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46019b190b6so5493140f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132124; x=1781736924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox4w10OGz6jJvYC2oU4MVyvNnoZVTmZ+wLnvuj1CGFM=;
        b=WaOFmE7+AGSRu03uSlBQPC2D5YLB98gB49asuYBDuFIfzvKURG4+er25Vls+StoCmX
         egsKWWLyIg1Ew1BBd2kLQl7vcKKO+AjP3+DtrXy2tkx+vWoakpYJWj7tHHgDiJv0TNiZ
         d9vgFGrKnyvUMQWeTnvJ6K4Y5K+RywLnkTcgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132124; x=1781736924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox4w10OGz6jJvYC2oU4MVyvNnoZVTmZ+wLnvuj1CGFM=;
        b=Ramh2/cm+8I2dhYc2HTelKD/rl6Je1F+jLPudh1CxAchgGl1LwISq+A5FoN5y0g3j2
         uSM3eZY0E0bCmYqgkLd55d+91Rl/TSp1ruhBxiP7KJAIAbjRhFYW59GHIXVV9a8TDEKc
         jQHy1iHB+B/9CQPqY2NeC4UtzjJBphxt9lN/hd3Zh27HpCO+DV0kMzk07CDI15rzXRNf
         H6lU0GWR6Usn8dYhZcTbAedFS5vJvujWPfsk4uUoiD3rdvV9zX0DNKPOVyonD/2Qr2eD
         3Ekh49wvBZ+1rUonJcA7/wjPmsWqRDpOZXcppEAn3jkvPP7+FAjokhy5nQn+9shdzR6J
         k0sQ==
X-Gm-Message-State: AOJu0YzRrgFUIn+r1rJ67ZO9vlwRX/kO/J5EjlmXX1zxjNw0lFmAOUxF
	4zxwX+HHQcisF7rCKbtxlIz/wTw+aK34gGJOrwjSFmN+XOV2oAUw0SK6ohTIBJqzpsDTcw94kjw
	oo30o
X-Gm-Gg: Acq92OF2JnY4whCWz02QAoLLoA8G7a3r1d6R5eOLKac9kpKNZNA/Mti7Wzlwsgkr3OG
	qF+KBqo1mHvc/bPMDlzr2buUUOx4PXlnKcoI5UqntYKimYFjdZtqi3CpNQXVxJSXilouldUFAaH
	6MSeg7jt4KMepaDzB4hPXW7lVuwxVf2HS8aKdqwtb1jQ5DZjUOI+WZgxRJmlEG3+k11t0KkfJng
	VTS9UYHeB4j0fBlEuZJk8xGG5kfGmGe5ebscIWR8b/1jriO7IYwFMXCtfrmMCTXZl3KNj24F9Km
	gZWTdJssE9gL1XdMjxF5FKK106Dkm+5B1X5Zp+b2FQW9HqUztQKyB1InQS/1IEQJCBCiNapjvce
	CJt0CuMWYWjMlBdjY8GdSwZ1AQ1vPD57eMWWoT/bpi6ZMl2amymW4HFZ4uYZr+6DZSYiPL8BYn9
	Fj11jVxAj+OCf6b6Nc+pwRV/lOpP379C2SaKk5dRcuGoEUMcGYdrEeWQb51ooDA42u9OMlK8jJI
	Vol02rEiQcwlntIpiaLja1Q2ccnarSBRoZpIU0=
X-Received: by 2002:a5d:5e08:0:b0:45e:e50e:3bc with SMTP id ffacd0b85a97d-460677db965mr236978f8f.29.1781132123553;
        Wed, 10 Jun 2026 15:55:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/21] libsolv: fix CVE-2026-9150
Date: Thu, 11 Jun 2026 00:55:04 +0200
Message-ID: <7c5d4b23b235355a46a8124bcafd8b54e4586291.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238409

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-9150.
https://nvd.nist.gov/vuln/detail/CVE-2026-9150

Upstream fix:
  https://github.com/openSUSE/libsolv/pull/616

Tested with ptest:
Before: PASSED: 29, FAILED: 0, SKIPPED: 0
After: PASSED: 29, FAILED: 0, SKIPPED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-9150.patch       | 68 +++++++++++++++++++
 .../libsolv/libsolv_0.7.36.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
new file mode 100644
index 00000000000..76c0c8e2586
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
@@ -0,0 +1,68 @@
+From 360fc223b57d5aa32bf700a94e75a5f49c30437f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index 852e79c45e2..f3c3738d7c1 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -11,6 +11,7 @@ DEPENDS = "expat zlib zstd"
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
            file://0001-compress_buf-fix-musl-segfaults.patch \
            file://run-ptest \
+           file://CVE-2026-9150.patch \
 "
 
 SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"

