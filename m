Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B284C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:17:55 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36212.1787836666962588560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DW5BbfG1;
 spf=pass (domain: mvista.com, ip: 209.85.210.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1783501a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787836666; x=1788441466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1puO0rhV1rXHWm5JmF4UnZ3G5sMlgIUkQcnsLsfK3Uw=;
        b=DW5BbfG1QqfZZPQrnehYre9vG0jZo/FCZBr0no4kHZWGpH9BlNRlR/Gkpf/UxrPfjp
         se19+wNZk1pr52naPxHwpFbX/EoA2wRUbDscruS47qsU8/HkLLU4xrTLBrft7nsBoPhX
         X+HIMRqIwkU/DHqvhOCvjAyEXg/XRKCHVbX8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836666; x=1788441466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1puO0rhV1rXHWm5JmF4UnZ3G5sMlgIUkQcnsLsfK3Uw=;
        b=rT0W7gGCcTuT620dsyv9/1iw1oQ+ziWz7ZYAw+5ADPG2uxhn9vsMKA3AjbO14H1Xf6
         Sxlxh0K/c4seJFqCZBTJAXT+ChwkbRb6XRGyWIcyZe6g7rWCSTGGm/UPdcbExSr6xX6p
         LKuXY1vwKnlje0+zSxZYbRnanGhK2BdKN9blie240PTrPnBpM0gt+isVyNJRg0/Rr986
         YXlg7fA89PzlBGH92vOMZpY6ICCivl2E38FxXHqm4ZbFvqTcvBmb7ftqJevSZ++af4bU
         9prE0FfqFu/JUPLDU1A8b0z6n/PTxWvQqdv0Pykz4Ct130uNWh/TGRRlAtY/NbKpA5es
         dGFg==
X-Gm-Message-State: AFuF++kNUjjWkP3AHz9MoQCGBdKRLHajoQ5I1fovQqpYw/RbqdpysGum
	E3xFAqi0n7tTVPusukbApefImcIpvOAtcv8iHgFaIZswUwzb5VshX2kxcb3cwhqsrNN1uf3XQuZ
	DQ2UB
X-Gm-Gg: AR+sD10+lF1s8679HHndFktm8QuRgB7YPw0nRPUUhSmBBnMBOn+pgvWVx5RxLmIU1EZ
	ew1GzpC+DdtvEoaUiN8VMrKVwteGKoz9GlDW2olmaBrTLkHtrDC1gX9fwrEn93sa208RgFW2EFC
	HGCLB7Ca/x0L+zs0mOXgkp8pWRJ+AeFh4Y4Qweu/GUaIzxPdXKv4wQt/pDf0q34665cdo1ww45q
	0aJdt1ThgMQiYCb+FSb+j/Ko3hpkNHOOwML2as616hAwEI57nrRe1mJemk9gN/Nsbin/RM7Yy8v
	GQOmKdBHLXCf3MlznAOe1ZMoZFkyjtQQkBAfjjI/fn9pUWbd7odOB0jBSOpcnNy72NnSw3t/hqT
	m51BYcUXW6kfPYCF6rzNy+cqU2QO6xyq6y+2sCxSJrwV4bcFG3tOufX5iSnaf85sX8OvkUmelAb
	73lA49+Y9O2zB+RXLvo/j1yyXWk34GcHGNGJn1YaCTJClJHrrgc0fplb6tZ05EZR8b+EP2cNE=
X-Received: by 2002:a05:6820:f012:b0:6b1:bd81:cc24 with SMTP id 006d021491bc7-6b1bd81d47dmr1463488eaf.1.1787836665924;
        Thu, 27 Aug 2026 06:17:45 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm15681349c88.11.2026.08.27.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:17:44 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] perl: Fix CVE-2026-57433
Date: Thu, 27 Aug 2026 18:47:35 +0530
Message-ID: <20260827131735.1001336-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244489

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-57433
[2] https://security-tracker.debian.org/tracker/CVE-2026-57433

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../perl/files/CVE-2026-57433.patch           | 32 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
new file mode 100644
index 0000000000..f0ea08b1fe
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
index 8716f1f257..558d6cd9b6 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-13221.patch \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
+           file://CVE-2026-57433.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


