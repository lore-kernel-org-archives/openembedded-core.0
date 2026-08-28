Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABC0C61DE8
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3041.1787945891525576988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wKi6Dgho;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso13806825e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945890; x=1788550690; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muMJTespbXwDLXgMmfLHC2t0Bt2OoLetYCYJAmeAUb8=;
        b=wKi6DghodIl9QgWybx/leWzIkBgkmBvUdWI6Yu8rCzaP2m1cYORKbLFNecCCPmj8mj
         uFA7cZT2+yhHpkQArkwPU9vXyoVbxNYvwTb6rhXf83xyDbr2CBntcAvAn60xGup8wDCc
         KfYdjKBEp/1hJpRZ1JTDCSbzaggXUt+XBJRo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945890; x=1788550690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muMJTespbXwDLXgMmfLHC2t0Bt2OoLetYCYJAmeAUb8=;
        b=fqknm3cBhfnvwayUCtV/wejPJ9zGtN8wGXwQUWnPdfZ2wcZZDADSEXd/V4KwUxFI7l
         kkyglki8YcJCdY5GmsyoOVNlNnFQxZeLtdikSfOIpqq5LCI2TCkHsEAV7PrdXfEWUpRC
         VhP2vy2qwy24Q05jxvzA2+rz4m8uj7qxGM1EmE8fkFXUO7rjLyqOauMnnJf95wyAuFnF
         Z4kWzv5+X2hrp8Xc97+QUHHLQM71OkdnlJ7fo6UTDoea9826l0khSCKutUR+WVKpBkCY
         mbbX3p/AZE7XTY0VpntMFLVvDruvip7cbGyM5Wx23qW01EEBEG8MLyiVcESCMt9SCe/V
         CGNA==
X-Gm-Message-State: AFuF++nLhpDR/XoB/Q4BnLzRS/VDb76X9P+n9CSS2D/Ax8xtlQMZmLEk
	Uxrw/gEP3cKDKooqseZEAKYeu7Vq4jrCtzgKLyz1Rp8eB9qlPuwnc6F/Nxuy6ZRuBPuHo8jBY/g
	ZzccErqI=
X-Gm-Gg: AR+sD13U3qf7vh96FHc+MSi/ZAU82ZGQCi56BLU5mhlMepxXJtZDdlfH0++AqlwsehY
	cG/jeLHNISg73rzVleyJddRlpkqvTm41UVXao1ZJckTSgE2iL3yuh1ppdXjs4tvTKuwog/w1SmW
	4JBkgKO9S+no1Tng0y5tTda1aweIrQRQYeoboC3QXM45Cv8LGQKwpfd/vDUqQwikK8Z7+bKsEJ6
	jVjRzf5AOVV4c+hFiiP2FpMKZ4t6cXyHlVWULZcstAzQ4FJDnusJ9jAXS/+w1K+Utb+greyOecn
	fyzTVauPGnLkm13yY7Clss8ZvX1cousezqVMnL45pR53XOshqSm+IAvTEUmKrVbji6q/E+GmWzd
	A19AAKNma8NvX+yYGsTUoSC5yX+fZGPpKJxeIybtyNIpqwX+g1X/inR2jVO+a8n5O0i/qG8sOpI
	VumKJb7ZLRKjI/S/Q0+8Mtqksa0jjlnwpWPnMIcNALuFssjH5cZfZkL/BIUbM38jT8wd3teFWZH
	b4njEx/hyWv75g/r4pm742pR1xnj8mi1LjYxblpgVfzT9TML7OA5hOMT3j0HptA
X-Received: by 2002:a05:600c:529b:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cca2b77afmr35415775e9.1.1787945889731;
        Fri, 28 Aug 2026 12:38:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/56] patch: Fix CVE-2026-56289
Date: Fri, 28 Aug 2026 21:35:20 +0200
Message-ID: <15d573ea0ed7e849a2688f56be25cda8578240ad.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244571

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56289

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48c1aa91e829a87c398e8c012cde45cd8c1aab0a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/patch/patch.inc         |  4 ++-
 .../patch/patch/CVE-2026-56289.patch          | 36 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 44d3046fd87..738bec038dc 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -5,7 +5,9 @@ original files, producing patched versions."
 SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
-SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
+	   file://CVE-2026-56289.patch"
+
 S = "${UNPACKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
new file mode 100644
index 00000000000..8f98c444fc6
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
@@ -0,0 +1,36 @@
+From e89f7be0853836908226e1df746fe07ef7c46769 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 13:16:10 -0700
+Subject: [PATCH] =?UTF-8?q?Don=E2=80=99t=20infloop=20on=20null=20ranges?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/patch.c (locate_hunk): Don’t attempt to optimize
+matches of a null range.  Instead, apply all the checks
+we apply to non-null ranges.
+
+CVE: CVE-2026-56289
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9]
+
+(cherry picked from commit faba04ef4f2b410257f76c1b9dc85e350929c4b9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/patch.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/patch.c b/src/patch.c
+index e4d0524..1e7dfdc 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -1166,9 +1166,6 @@ locate_hunk (idx_t fuzz)
+     ptrdiff_t max_offset = MAX (max_pos_offset, max_neg_offset);
+     ptrdiff_t min_offset;
+ 
+-    if (!pat_lines)			/* null range matches always */
+-	return first_guess;
+-
+     /* Do not try lines <= 0.  */
+     if (first_guess <= max_neg_offset)
+ 	max_neg_offset = first_guess - 1;

