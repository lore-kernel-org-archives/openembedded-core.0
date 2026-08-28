Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE00C61DD9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3034.1787945887564557219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hWI9h0fL;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so10720865e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945886; x=1788550686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AeBeEfBqVbCSKgcMSUOZ+yLiX7YkJ1CH8RcHdijeiaM=;
        b=hWI9h0fLu5jFbuSa4HrIoRCIcgzHSUpoXMY9ZrHGC5G6zeMwQonKQ/DsTkx6wyZa/2
         WAdkilqhH3iO+ujpx1jY/fSnc0B/E4lAdV0xLFffp2S0MQAl7j/j2w8tK/dl5TDb8Hmz
         /kdOSDiUCijDm/8eYHKsGBKxSmz1lHumOqNoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945886; x=1788550686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AeBeEfBqVbCSKgcMSUOZ+yLiX7YkJ1CH8RcHdijeiaM=;
        b=Y8I5PmMYRz+67QUjih5/7QY/Y0iVIjn95KGlmdPpi6rFGTAO+vc6WFo9uMW9uPy953
         LbVKXzbFVW60iFVwLyMxOCfvzqHYiN4AviYtBpWNlMwsZp0C0e53gtXcHJyVU0qS9dmI
         TAQBCG0cLdUpSzGm8mpVwHCq1CjynOQW8eAg+befVMJIrIw9qJ2k6fnCOoSi3hiEeYuO
         O8lV0vwk8hH0QRiXi+S6vOqOu3eZT3t2FqIOtX6l0k8WKd4Wb23XUDZfBfOO7AZygfxI
         b7GwqJJf+T95TjnEJkBVxD+BueSOluUr6HVV1FB9MSqPQwg4J9qj608jSiu0RmJ1vp88
         3FOg==
X-Gm-Message-State: AFuF++kgU0QeghI4Df+nooPveIbTsCCcRXUAPVAWiGdgDv1Nl68Y6whd
	w84oCQ6xq01niYhSS/7L8rtX3C6oeP/KzybckbZbC0VkYwNCEpvIpfG0dgOtQRwG1jLp4I0Ckgn
	D+6G/n2w=
X-Gm-Gg: AR+sD11Xt0G6NA2xMOh7dIfJBEkypvIvkWIq46RtAZu5Yhoiava4eJiFRMAGUxafmgW
	u+cioc6uk3Y0vW5OQbR6oYBWSOKER8/zJuTDzURW7EdRDFw8jOOHNrYVeBR7VWy3YZyEps0+iWy
	e8TYJTC573sh18NdVLTaBKT444pLhgksmA/WcDAJP6aGcfSFVmHU30O5E2xk2UMz+4n9XGjGbU0
	qjgXtJeMxdVmdzC6C40b8HYJ7kL8Pj/dTihwucjs/netq4uHOClbCBJSoA1nBPUaFE0VP+Annzr
	XDYUhBkKIH5CG9DQYY+DbKPRA7m3yVy2LfxNUp5IfYDXR6w3FFyELr9pTYwiLJdfyM8PxXntM6n
	Is97si2fO2SC7WKiHAtF8qd42i9FKuaRwmEvawBBjuylSoos/lrj/7Obfd327UKqD7VDGrO3ev+
	tt6rnuOltLT3UXHq6n1XDBqqb0rmKYfXdCosiNkuOcmIFeuFeh+Su3sBXQNrRP0eh9rB+Z3Nx6M
	XNgKVhIkUWfkleVcUkRCmoijzhN4d6py+LLlfAUblUHYUTCfCtUIZr9v11cftx0
X-Received: by 2002:a05:600c:c09a:b0:49b:8d8d:7ce with SMTP id 5b1f17b1804b1-49b91c4f228mr123552735e9.15.1787945885791;
        Fri, 28 Aug 2026 12:38:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/56] perl: fix CVE-2026-57432
Date: Fri, 28 Aug 2026 21:35:13 +0200
Message-ID: <4306ed3a3d24f9492368c1f0c439a5d08d6d94a9.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244564

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
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
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
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 1a3451b747d..8716f1f2572 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
            file://CVE-2026-13221.patch \
+           file://CVE-2026-57432-01.patch \
+           file://CVE-2026-57432-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

