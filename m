Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF9AC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.23486.1641765881234503296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lzQkpk5P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id t187so9053618pfb.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LIOMKpTbnR5riDhlsx9nllK6PJvuGII1Mq4yoQufzUc=;
        b=lzQkpk5PkhyPl/P3qEoxAxiN/ieSEqLXF6G8iFGSElO7Qv41u2Cqaubmx6t2ZF2rqF
         6zgSKvRQBCtbeSto4JPWvYGx+gvjnizmd0JdACRRCW1KhZ0HAW9TL3rJVUk2AEkIfrU1
         +xT0ri5xl/EUC4fPpBSMsgXyaPiVH/b9GN+M3agpJkvs8g2ybZmY4aeYzXxjIMAghiB0
         jgFWLYjb+KrwREQaYZOr76SZ+1Jc6SVDQuoQ95Yn9lnpG6MMQVYDbLUzOXEqYFcOp+ZL
         zzgPyXfpUoYwM83WQ8CINboVCBU3Fomr6kMOWO1yuVui1RUbARh/7M2ZpPgaKQpRIhsl
         H/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIOMKpTbnR5riDhlsx9nllK6PJvuGII1Mq4yoQufzUc=;
        b=y6UTQK7RSXu2tdGADu4/gBozVO5rKMAhasdF7VOIz6QvUpPGVNgVqFgDj9tAPb2F54
         RUDiTff9SJaSLeqqR2QW/ePVurMgFlZP52+A5I6JZ0OvmZv11vcnlshl6WHhQ6g3gKCF
         rffQIf4WJ+BceWZfTJBN/B71jjUhsSlRTqZ0CFjj1EVICBRjulgQ8II+2anbLn4VkZzW
         IVoYuNmFaFUecW2lMQeYEmvmlHyoI4/qXWC2yVm86QBa9Fl5pGtl1MZDegAl+iaJCm2y
         Kg44pJEi/tf8iTEurMwVQtTHRxJzd0ut/OCHawJ4jqw3SiBC2H9RUyMRGXn6YN9HzmIF
         XXpA==
X-Gm-Message-State: AOAM531X12nRyc/3eqmwVyR6rQRlCmByaznFw3BLRfxiH/dYPony82Ll
	NKpd2FiK1oEz3lZpolmPGLNJIOTqkZc4ZgaGue0=
X-Google-Smtp-Source: 
 ABdhPJxdmF2CkT7bDukH9ZNDnaw8NU+iwM1v/BC4YTxhPSf7oNPLIvBtHnMdBrqX5UzB+eDk03Ujcg==
X-Received: by 2002:a63:6d87:: with SMTP id i129mr2821603pgc.24.1641765880321;
        Sun, 09 Jan 2022 14:04:40 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] openssl: Add reproducibility fix
Date: Sun,  9 Jan 2022 12:04:08 -1000
Message-Id: 
 <b360fdca923bb3e4a4bf41d705e634eafc0e54c5.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160295

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the date rolled from one year to another, it highlighted a reproducibility
issue in openssl. Patch a workaround for this to avoid autobuilder failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8281e290737dba16a46d7ae937c66b3266e0fe8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/reproducibility.patch     | 22 +++++++++++++++++++
 .../openssl/openssl_1.1.1l.bb                 |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
new file mode 100644
index 0000000000..8accbc9df2
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index 9412b19fa5..bf7cd6527e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://reproducible.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


