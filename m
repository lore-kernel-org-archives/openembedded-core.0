Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A89CC624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5671.1788326814766527048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XyOEKJfK;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso3479805e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326813; x=1788931613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EvWUvS3iMv/kORPaFfHxbaQjpqZXi5WyyrO+XmDW9w4=;
        b=XyOEKJfKM5TR9DcvzZ6qOJ2qXulb9r8fozko57Xz493hT3Vt1QVsIEC120gQ1cAjZS
         l0W9W1oJM2JaP6oGXncw5kE/4yy8lvvWmhTeLs2KWCXQFVuS9MVQygaG9cMWYAdHjrhH
         WZWXC3ne/RGuG0VAMgK1bDunyitBQCXcQ4yRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326813; x=1788931613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EvWUvS3iMv/kORPaFfHxbaQjpqZXi5WyyrO+XmDW9w4=;
        b=Gxfx0Hn79pQjp/UMNg3FmVxhvSC62/IRDDkr/f9ElJpfWBxCzJIKjwhwehZnrS6Xmj
         C8wwMuNA1JK8OFYCaAlzgbm/fai6pMZoHU8bRflab3E13ErHWCYoWzXt3TVCgazcmGQk
         FWLBUqO8oZshKv7k8/z7ujhzanXXf3JLrVDLOYoWUUA8uGpQerQHQslGBpuFC4EH61MD
         g7YdXmBWUEDE3vP1YCF4sGVMGXinyep9WU5/u9qiNgWaGg3ZwOqKOc2EPszJJ/xM5m6C
         Pww+MAGHxTp/A6Os58cdWDnGl5OPuw9IP9Rx7BEqAo38Rtor4cBIHtViWb0dCd1OgE+O
         hiBg==
X-Gm-Message-State: AFuF++ncj0CsrjjjEbr28prPfoLj0iO68N42dWwR/cEY9LZVVNjQg0a9
	Ph1SVzYT72mGVJiHOdjGxxacqN+aNDC4DgJOVN7FnmcH06vx1TDipfZGq8Si3FzCahsRUzunNTl
	YPsqHqSw=
X-Gm-Gg: AR+sD12H8T2vdxgsXYiXDUOpMA0jqxinUI5LFruz1XtJEfklyMazBKM/pKvULwiLlVQ
	yacG5tZAd5fXPZVnw0pIS9UjK6DF3KSaBuAvFnRYVMkDNbS+ATWGgYaMhf/0m/djReoJU+4lpoc
	NKx5bNuvPb2LIYsH4CA7/A6KbbKFWYrIo1qInYeXAOLePbLyBFHN0Vcv/gLnU1s2CVapv8JCw98
	//+xEpf5sTnz9Tn689a5Xe5llwJRwHpjjspLABQkeGS1f1gKW8bQkJyZIvOV7HzFw5czi1KiKwP
	Cj4iIEGTIxnbiTMBDKZzUhL7x/ae0UbslPEJBsJ9ZrU3BJfX0eOsko+/5pjpSZEAscKuL8jqM0w
	l+iKAXBFU5N6wQ8Rds5BdDLy7aEapi7WrWwh7xYCLHr3lH6eS651Je3fqbex/odfYdviStqpVXH
	OejEHUc89Ra1yzs5BIm1RdsCLkloXIZ5xrmFnY23V8OlIv5ouuqbJhf9m/07nvd4dl+FWDHfzcq
	68HFji8WMCu336wfA==
X-Received: by 2002:a05:600c:a55:b0:49c:cedc:768a with SMTP id 5b1f17b1804b1-49ce5828e7amr37971715e9.16.1788326812892;
        Tue, 01 Sep 2026 22:26:52 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/27] perl: fix CVE-2026-57432
Date: Wed,  2 Sep 2026 07:25:29 +0200
Message-ID: <93fbbdc19eea157c4c9b040291481c4f778ab6db.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244863

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [1], using the
commits shown in [2] and [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57432
[2] https://github.com/Perl/perl5/commit/5f7eb6bbbe0510964e3fb1d6bb691e5445913e55
[3] https://github.com/Perl/perl5/commit/40754edc72dd3e513d758153c0e2f0215897740e

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-57432-01.patch        | 52 +++++++++++++++++++
 .../perl/files/CVE-2026-57432-02.patch        | 34 ++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
new file mode 100644
index 00000000000..ef92b0d7b21
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
@@ -0,0 +1,52 @@
+From 5f7eb6bbbe0510964e3fb1d6bb691e5445913e55 Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Sat, 9 May 2026 17:18:43 +0100
+Subject: [PATCH] pp_pack.c: Avoid ssize_t overflow when calculating the size
+ of a structure
+
+If the user has requested a size that would overflow a SSize_t, then the
+only sensible thing to do is throw an exception, because the structure
+this implies couldn't possibly fit into memory anyway.
+
+CVE: CVE-2026-57432
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5f7eb6bbbe0510964e3fb1d6bb691e5445913e55]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pod/perldiag.pod | 6 ++++++
+ pp_pack.c        | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pod/perldiag.pod b/pod/perldiag.pod
+index 841e22d580..d9231077363d 100644
+--- a/pod/perldiag.pod
++++ b/pod/perldiag.pod
+@@ -4880,6 +4880,12 @@ mixed-case attribute name, instead.  See L<attributes>.
+ (F) You can't specify a repeat count so large that it overflows your
+ signed integers.  See L<perlfunc/pack>.
+ 
++=item Pack template structure size is too large
++
++(F) You called C<pack> or C<unpack> to operate on a structure, whose
++computed size is too large to fit in memory.  This usually happens as a
++result of embedding a large number as the repeat count for an item.
++
+ =item page overflow
+ 
+ (W io) A single call to write() produced more lines than can fit on a
+diff --git a/pp_pack.c b/pp_pack.c
+index b5c0b261ef..6075e83aac 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -528,6 +528,10 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
+                 break;
+             }
+         }
++        if ((size > 0) &&
++                ((len > SSize_t_MAX / size) ||         /* detect overflow of len * size */
++                 (len * size > SSize_t_MAX - total)))  /* detect overflow of total + len * size */
++            croak("Pack template structure size is too large");
+         total += len * size;
+     }
+     return total;
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
new file mode 100644
index 00000000000..273a247a88f
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
@@ -0,0 +1,34 @@
+From 40754edc72dd3e513d758153c0e2f0215897740e Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Mon, 11 May 2026 12:25:33 +0100
+Subject: [PATCH] pp_pack.c: Avoid some other potential overflows when
+ calculating sizes
+
+CVE: CVE-2026-57432
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/40754edc72dd3e513d758153c0e2f0215897740e]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pp_pack.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pp_pack.c b/pp_pack.c
+index 6075e83aac..b2019902203a 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -515,12 +515,12 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
+                 break;
+             case 'B':
+             case 'b':
+-                len = (len + 7)/8;
++                len = (len / 8) + !!(len % 8);
+                 size = 1;
+                 break;
+             case 'H':
+             case 'h':
+-                len = (len + 1)/2;
++                len = (len / 2) + !!(len % 2);
+                 size = 1;
+                 break;
+ 
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index 8dccd34499b..b4927646d75 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -21,6 +21,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
            file://CVE-2026-13221.patch \
+           file://CVE-2026-57432-01.patch \
+           file://CVE-2026-57432-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

