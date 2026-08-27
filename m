Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235C8C61DC7
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:35:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30860.1787816141377263383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LBHVek5P;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccf2360620so18262335ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787816141; x=1788420941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrLpcmrYfpfO1CRFQdsbX2ZRHvO7uhPorDRYUighpLc=;
        b=LBHVek5PzsaWFZJfGf9Px+lqc7Cbpzmn1WRHTIOuN0XabM4VnAh3ZNQHfS3sAFogtu
         RVKRV2+ZjfcuKvmzqa9hulGZbIdOOAIFZIj187gri908Fk12Yl5ZMbHZWRcvP+JoZz4W
         i5sxgKHbzmeTaakuA/gg+oTViNe5v7nw5/Kfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816141; x=1788420941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QrLpcmrYfpfO1CRFQdsbX2ZRHvO7uhPorDRYUighpLc=;
        b=ZWQtzsXcAKzAnIqhKVYDiArxQBfZEbDs+NxHfRrcK6PnUVdZ7jrVl5Mld0xuKQyqMf
         JvZR2PHq7iJyZpLZ/WEnIT8FwCdJOkkvgIuB2ExLYr1Qe26AdtQ31klMBIUphP3VR65i
         /CAZvxn5jpn2WxD3oUddw6nNrzCpJ+5Svkx+EI8786Ig5ZSmAP7CIHGVtQAVMPjWk1Pd
         38XVMzcUNp9MCwsJ8hX91ygsXpdc3R3BD3M5SgO++nfv2AUk5eII4N0gEBF5ZGf0/3uv
         fgylEcx8AGeQ671FuLHrKPSLc+xn2Khjjwpos0OlR0PoWrga9SUBuU6j+Z/cNq6PKzwE
         x3QQ==
X-Gm-Message-State: AFuF++mK6rj4xvPQ71ttlEZbgjjn7fLZSAHjie0fwKWEqZqsOdqmil4Y
	tBRXOvZBI42IEIvzgglVEQYqpZ/24z1FaSU/7Kutekh6PfhHjOwDCotocSfx7OU5ipG41hGgWxM
	UwvbR
X-Gm-Gg: AR+sD112RUS+tTmwt1czL5slIm/r2GVne+xInPHwArcnwGENWFJOG6J8CFGb0OemrCV
	B+RirQr9rfIYc8ouET7ia7Y62QlCGGQVYbMZL0hUnYkp3JgeylTgKrWefHgSt2B/LecywgXzyp9
	1jnCNweKp3BvTrvtA4zABAq8RZhihVUuEoMOIUeHOi453hPP6iFwutavOcby3PKI+YHwBwGWKRC
	jkFOT8AV+lZhIEqHAf4l507YEoBWHZ+DS7G2pbZYtl9Uyu1XLmbHfI+x82WUgX78MoWCyRCFsdg
	wBY58e3lf44cq8yaT2xW+w6nFsM1pO+nec2lyUKY4Ag1O837SXQhL+j37ODqHk5rHi8sqF6zJeo
	RwJv5OuuPpGdgZZ/HUqCPoT3YLYshuIRYk/BuG+qxm2U/27cv8+98TA3dAZMhdht11V/ab7unlR
	8ENmWg0x0zYsV6SM9PO369T4h9QdbwsovYzwI3ARGNN07fwD60vTsrqE2hZILpZcHhbfLsJJqx8
	PhsLOTfVg==
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr22833157a91.6.1787816140634;
        Thu, 27 Aug 2026 00:35:40 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm23139110eec.8.2026.08.27.00.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:35:39 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 2/3] perl: Fix CVE-2026-57432
Date: Thu, 27 Aug 2026 13:05:24 +0530
Message-ID: <20260827073525.640848-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827073525.640848-1-vanusuri@mvista.com>
References: <20260827073525.640848-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244466

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-57432
[2] https://security-tracker.debian.org/tracker/CVE-2026-57432

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../perl/files/CVE-2026-57432-1.patch         | 53 +++++++++++++++++++
 .../perl/files/CVE-2026-57432-2.patch         | 35 ++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-2.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-1.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-1.patch
new file mode 100644
index 0000000000..6112516b67
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-1.patch
@@ -0,0 +1,53 @@
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
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5f7eb6bbbe0510964e3fb1d6bb691e5445913e55]
+CVE: CVE-2026-57432
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pod/perldiag.pod | 6 ++++++
+ pp_pack.c        | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pod/perldiag.pod b/pod/perldiag.pod
+index 6c9948f..83a1b96 100644
+--- a/pod/perldiag.pod
++++ b/pod/perldiag.pod
+@@ -5027,6 +5027,12 @@ mixed-case attribute name, instead.  See L<attributes>.
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
+index 0b53611..090bdb8 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -528,6 +528,10 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
+                 break;
+             }
+         }
++	if ((size > 0) &&
++		((len > SSize_t_MAX / size) ||         /* detect overflow of len * size */
++		 (len * size > SSize_t_MAX - total)))  /* detect overflow of total + len * size */
++	    croak("Pack template structure size is too large");
+         total += len * size;
+     }
+     return total;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-2.patch b/meta/recipes-devtools/perl/files/CVE-2026-57432-2.patch
new file mode 100644
index 0000000000..6e187f2edd
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-2.patch
@@ -0,0 +1,35 @@
+From 40754edc72dd3e513d758153c0e2f0215897740e Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Mon, 11 May 2026 12:25:33 +0100
+Subject: [PATCH] pp_pack.c: Avoid some other potential overflows when
+ calculating sizes
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/40754edc72dd3e513d758153c0e2f0215897740e]
+CVE: CVE-2026-57432
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pp_pack.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pp_pack.c b/pp_pack.c
+index 090bdb8..ac69a71 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -513,12 +513,12 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
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
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 1a3451b747..73230ab175 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
            file://CVE-2026-13221.patch \
+           file://CVE-2026-57432-1.patch \
+           file://CVE-2026-57432-2.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


