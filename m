Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80165C07545
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.81416.1697902123829160177
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pzWdHemw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so1738789b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902122; x=1698506922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46JrMa9lM9LgJ6Gn4AGcru/NeHEQ2fXsvsD7GYFbC1M=;
        b=pzWdHemwot2tW+4AlMboDhB9wMz40LgVc5HKDiO+MHHrrJN+7ll5xY+AKm0+dr9b2B
         UUbKDEqmp19ujsHbHefFJDUMJyjQwzR4bi2YZEokvCHQWzjlc/p5jYeMZDZUYJpdU8hn
         VydfUpPg6JGEg3Fq49QLikUROPA4RevOLwTqfg3GQDSK8vHq6PNsJ8TmorSGGG90IKhO
         0jDpdOwpD7sspGJ05t3whdh8NWATskVA25vqSLip3NUgKg4qaYBKNV2XBlLL+agvYQ+x
         00Dg3XvczV7s9PP3HWJ302Ki33Lm2LgS0w7sGKKNjpcjuAvWPoXeiMizFYwLQXlaqWm2
         fEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902122; x=1698506922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46JrMa9lM9LgJ6Gn4AGcru/NeHEQ2fXsvsD7GYFbC1M=;
        b=e7JSjDsL9arZxxCEFcWZtnoho4FeV3FqGXrOOzSqJna1Rrosf2k2JC0BHVVQChBwdv
         8Avs4FklRmvGSf8wBEKFajN5LeRaAOhPY1p1cE/zb9aMHk6lhaaZyYhvBYvFBzNdqeOc
         dQBGgKyZDafKsT8OeGoAtQXNuxKCrog42ztOuhGY3YZ9BorjC1Oo7oDIH27Fd4RdCbyc
         hjjTk+vs6TWws5DV812aw4aldO1N0wYYys9IcJlRFtcBv2wY3wdl8RgQsyCjtrN5RUV7
         AwUZrugC4mkpSFB2IFGeq9zvikOdpaWF3EukGwjzYG+Q+DfPNUs84wTN7Y6Fm2jjwxJo
         0tsg==
X-Gm-Message-State: AOJu0YwQqXZRrxiXtrnmC1bMwtgb27EiKM+pXAc/WCovhWMAG1M6bT9Y
	xp/0wYA9gxinO3aJJfK7e9vTf7g0MnONmLiXdNo=
X-Google-Smtp-Source: AGHT+IFbHb0VgO6TY2Z3fVvVFf3MRpIGV3nI0R8e+d004a2HLoUHlww1u7xszYI/n/wezvDUolGQKw==
X-Received: by 2002:a05:6a20:8e0e:b0:17d:dda5:3685 with SMTP id y14-20020a056a208e0e00b0017ddda53685mr954630pzj.27.1697902122536;
        Sat, 21 Oct 2023 08:28:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] gawk: backport Debian patch to fix CVE-2023-4156
Date: Sat, 21 Oct 2023 05:28:28 -1000
Message-Id: <0547b60d3485c2e3853e5a9e0a3e051882b283f3.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189589

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches?h=ubuntu/jammy-security
&
https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gawk/gawk/CVE-2023-4156.patch             | 28 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
new file mode 100644
index 0000000000..bc157d6afb
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
@@ -0,0 +1,28 @@
+From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 3 Aug 2022 13:00:54 +0300
+Subject: [PATCH] Smal bug fix in builtin.c.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches/CVE-2023-4156.patch?h=ubuntu/jammy-security
+Upstream commit https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]
+CVE: CVE-2023-4156
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ChangeLog | 6 ++++++
+ builtin.c | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+--- gawk-5.1.0.orig/builtin.c
++++ gawk-5.1.0/builtin.c
+@@ -957,7 +957,10 @@ check_pos:
+ 					s1++;
+ 					n0--;
+ 				}
+-				if (val >= num_args) {
++				// val could be less than zero if someone provides a field width
++				// so large that it causes integer overflow. Mainly fuzzers do this,
++				// but let's try to be good anyway.
++				if (val < 0 || val >= num_args) {
+ 					toofew = true;
+ 					break;
+ 				}
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
index fe339805d0..0b0d0897bc 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
            file://run-ptest \
+           file://CVE-2023-4156.patch \
            "
 
 SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
-- 
2.34.1


