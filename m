Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B1FC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 14:16:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.6954.1641305788542307259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U1O0TkGq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id c66so23314443wma.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LqIHy1HAYP2VV2EughZZ/RXPPpNvSjHMdLhkAdegXN8=;
        b=U1O0TkGqUg5hiDFeKcbLOCuFFdFqStbdx3Q1pbA00Ey5OlYzJP0fqTIw0BukonlDr9
         EW9/Y+kehlz/r5TbLhDnl1iQQ5enScbbYHfE6EJUkcvxD2N4pTzvBY49S8gBcQBHkP0V
         SBmz7XsF/zgiwmc6KhLea0ThXGTnS/jC7hBCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqIHy1HAYP2VV2EughZZ/RXPPpNvSjHMdLhkAdegXN8=;
        b=jRios41MzBd2wGtQcKslI4AgFbCaAeijfscqukmTD2dD2HUjiT2jNvLQ2i/U+ugtES
         g1Rr5TKvJfVjhdoBWC33OcfF4j/YzS4ab21jrb8/QNKK950exC0PO+R4XSli84tE+suH
         57KjNWYaPqg7sZEMgwUBBVpvENmhOZ6I4BXlKbRxcw5I18vZi02EcDEAF0dArY79uQEU
         I1Oe2d98VFRjJ/Mzr3l0Dp1//7vaBoh5xlQHOYOqHYBigKoB4JZw536K7Ay4zKKEe0Cw
         KzB2gOI73nXrRUn/BheeO8Zx2h8s0pQx1g0/iR3uCOm0KdyS0LVCQYEvquaYgwguavqu
         PZIg==
X-Gm-Message-State: AOAM530dGJ5m4aoeaIeljmgX7zKShrw/IkR+KWDqGLk2omTEe1Pru9MP
	YvQwkRmgGwLO3oi0AG9dDQfbB+p0LvIIXQ==
X-Google-Smtp-Source: 
 ABdhPJx4wxoK4kAEkr9sUwKPzNMb6fttRMimj/aIFg1clGxY1SU3vjvyhpkn/5SRFpQ1Bze6uRTPAQ==
X-Received: by 2002:a05:600c:6018:: with SMTP id
 az24mr41811961wmb.103.1641305787023;
        Tue, 04 Jan 2022 06:16:27 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 h204sm38270838wmh.33.2022.01.04.06.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:16:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] openssl: Add reproducibility fix
Date: Tue,  4 Jan 2022 14:16:24 +0000
Message-Id: <20220104141625.1369719-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
References: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 14:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160164

When the date rolled from one year to another, it highlighted a reproducibility
issue in openssl. Patch a workaround for this to avoid autobuilder failures. Help
submitting upstream welcome.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/reproducibility.patch     | 22 +++++++++++++++++++
 .../openssl/openssl_3.0.1.bb                  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
new file mode 100644
index 00000000000..8accbc9df20
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
@@ -0,0 +1,22 @@
+Using localtime() means the output can depend on the timezone of the build machine.
+Using gmtime() is safer. For complete reproducibility use SOURCE_DATE_EPOCH if set.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [should be suitable]
+
+Index: openssl-3.0.1/apps/progs.pl
+===================================================================
+--- openssl-3.0.1.orig/apps/progs.pl
++++ openssl-3.0.1/apps/progs.pl
+@@ -21,7 +21,10 @@ die "Unrecognised option, must be -C or
+ my %commands     = ();
+ my $cmdre        = qr/^\s*int\s+([a-z_][a-z0-9_]*)_main\(\s*int\s+argc\s*,/;
+ my $apps_openssl = shift @ARGV;
+-my $YEAR         = [localtime()]->[5] + 1900;
++my $YEAR         = [gmtime()]->[5] + 1900;
++if (defined($ENV{SOURCE_DATE_EPOCH}) && $ENV{SOURCE_DATE_EPOCH} !~ /\D/) {
++    $YEAR = [gmtime($ENV{SOURCE_DATE_EPOCH})]->[5] + 1900;
++}
+ 
+ # because the program apps/openssl has object files as sources, and
+ # they then have the corresponding C files as source, we need to chain
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
index 162435480c4..7727ec43e87 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.32.0


