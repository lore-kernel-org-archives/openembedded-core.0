Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CF9C79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6448.1788939021734033426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gxblkov1;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485888b3c3dso5564582f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939020; x=1789543820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lg3SnixQAarj1OIG49PMqRrYi7MHm9cccJBPqqj+bo0=;
        b=Gxblkov1993XIvb509IpztkydYq9dKSVxSnOUOT8nbRaGCim8ddiFZE0NYcWYKhWQM
         c8XTpMZND7S6n7JtWIwfFRHdtaGq2uOoFRuDm5NSZhP0FZ5c57mzPRm5nBPiB0nqdjYV
         fV0zUCUSX4TOTv6w3f8AUCpJTq66YndSmqNn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939020; x=1789543820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lg3SnixQAarj1OIG49PMqRrYi7MHm9cccJBPqqj+bo0=;
        b=erXV6HBQOooFJPxnMEbSZNOHaBeh34uQ0nQ9zYkrqISPdgmnVq64i6An8Q2BtsKUoV
         WP1daH3SlsxA8DhglTZxQqo/fw083Qx4jU6Z9N62ZZ/IU41BnyXWToZ081ovHVSbHYrM
         XO170ptOksrMjrVaHF3mWJ2bv5rcIGVW30Se9PHO6zc7/NWxtFQI6C+OdVi5XIuex+++
         gZIPjs6/N1sQPgOjZnwfSuPYBGc2EldgikUCMxwwacYCA4F/y2YOTnibHkCuacZ4aZtL
         iusVoLHQvOqNOvN7NUIrY7quA4UoXQpY2n5d8Tx/fR4xVpRZKcbPFrsDiBnEsjdFAauT
         6AMQ==
X-Gm-Message-State: AFuF++mKS1BWAvR/5MMjbl5o3coU977xwv8E4PUhmbtTgiQlgINqdsQt
	MoFnvTwvTLNTR89ZlH6QFUYU+QMp8PvRjVev0ZVofBWjYFOlhjKS19Fl/fAe1cW6FWPJfTmO1GT
	Ju2Aarxo=
X-Gm-Gg: AYBFou27pd6gwDcwwx179ahHevjyKbMIlDOW1usAjU15YE4BIKmZX8GjLB3z72jVHae
	zJslgtSriVrVE9gIhZSVZP1a1bNjMapX7k6wgiM2WsKpG3fxMefT6pXYEnXuzcaba7JjWMI6hSy
	Tz1g21VcCJhZtHPP49g6hTRVSJ4XUePganW5+lMe3+wBtZUR9RMjNhskJz8mD0qIYO4jFcMHRNy
	G/1/1TLnblOi0uDbdRRhNsQlZ5VSE7sMZ9oufFJoPkXDPNCI2pjXU1MUwlOs9KzImQluP+YcB97
	+2EiTP5Cq6E6N/JyI8Ozm/RVZVxy0+8OLjR107zE/pijI6qXwuFIBOSfhIjmZzyGeyUGAPjKi2T
	yY0CxWHuu5obCA7XQx0/HeKLeHrz50MdERu30+ULSO0WENNngeGbBbN6yZK4XlvRfJa+noehLSL
	mQx8wHIHZdQea9RcaMB3bEGhiQaDrqap/OgALDuQmiDXw8xGaA0RAvJfQqSfSaqf48MvbpKumPS
	KIbNzH4ZRDBRn5c4b7zQQaxiyOBtf2dLMk3aZfE2rcw52OmZcdIhvgu1OchR2t6QW1rBY+uYpo=
X-Received: by 2002:a05:6000:430b:b0:485:adb5:2075 with SMTP id ffacd0b85a97d-485adb52e38mr1837628f8f.51.1788939018908;
        Wed, 09 Sep 2026 00:30:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/38] perl: Fix CVE-2026-57433
Date: Wed,  9 Sep 2026 09:29:34 +0200
Message-ID: <959d2d8c1d8e36c7d9e202d6f4cf33d08f844c89.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245444

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-57433
[2] https://security-tracker.debian.org/tracker/CVE-2026-57433

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-57433.patch           | 32 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
new file mode 100644
index 00000000000..f0ea08b1fe0
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
@@ -0,0 +1,32 @@
+From e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7 Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Sat, 9 May 2026 16:47:14 +0100
+Subject: [PATCH] Storable.xs: Avoid signed int overflow when unpacking a list
+ of hook data items
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7]
+CVE: CVE-2026-57433
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dist/Storable/Storable.xs | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
+index 3930db6..62a1a6d 100644
+--- a/dist/Storable/Storable.xs
++++ b/dist/Storable/Storable.xs
+@@ -5035,7 +5035,10 @@ static SV *retrieve_hook_common(pTHX_ stcxt_t *cxt, const char *cname, int large
+         }
+         else
+             GETMARK(len3);
+-        if (len3) {
++        if (len3 == I32_MAX)
++            /* If len3 is exactly I32_MAX it will upset av_extend below */
++            CROAK(("Invalid count of hook data items"));
++        else if (len3) {
+             av = newAV();
+             av_extend(av, len3 + 1);    /* Leave room for [0] */
+             AvFILLp(av) = len3;         /* About to be filled anyway */
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 3469258f727..6f0092c1cc7 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
            file://CVE-2026-42496.patch \
+           file://CVE-2026-57433.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

