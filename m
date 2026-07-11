Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C771C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:25:04 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1290.1783747495076616566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=W1lxx/ib;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664d530fcfdso3058637d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747494; x=1784352294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyLkt7DdP5R0H65meJqsPOT62WAn0old5IBEEOgIx8M=;
        b=W1lxx/ibGMX6VckeP0k7RhZGlLQlTs0kn8urnw/f21wIWB1tIyBTf5IUUiIPwLVwaF
         7fAWCjmeI+ij2/RDAMqhHspVsf5Oy29jFl2zxkyWMc4qxRsFWDM/dy7A/jL4PgOMuemS
         mQ1Vl9UxLT3SSK9Bl5LqJHqXuSXcHqWAtJ5z2eb/MS+cyNGhTvNDrBqwck/gGrH5knR/
         f+I0Yl7rnA+UUCCMuP6sZUWJSM12NhPVO8NVHlOYTCeFtaARfW+A/ER+j/1S0BwCBiqo
         HDgjDAefl2YZiCNkKDIeiCzQIBayGofKxdjxGpxj6xw5YcrBg0u7cXy34eaqYG8gb0aW
         LXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747494; x=1784352294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyLkt7DdP5R0H65meJqsPOT62WAn0old5IBEEOgIx8M=;
        b=r8OxtvWMSpHdTK20ioWvLftEL79SUQJzfSTgUzFdMJ6CxJFUuuy8HiiNzB/TkeP0qP
         D8it8MdhyEHRJOSeloCQ8HNN9cNOys3QyK40zAu5ApsxJHb+E5TT4jkadG8MUTcb5Cjt
         /7a7K/j5yrSfoDTqnEF8A/ipG4IOyoNceYv+kXhz3FMXS/lgWf0savIBqLZN9Br1akbn
         bkAj911Fjde/vdfHUIcTLH1loGDwjueWSRvl/7Tp6OsX5F7Ri7GXApLwWkqlRsgHmz6J
         HRkTakFotSpJMX9THIeDrE1CD8J9H13MKO+lWGTQQxTB7gLtPa0sVPm6lZHA+X0DNXwK
         dRsQ==
X-Gm-Message-State: AOJu0YzYAzpj5QzrIfvvcJ/TCQXuAFQzJ28qCITJ6rAI+KX/4LDGHMgh
	B+Ltiq5WdmoQaCZqt5TKngPy4pfAma6Pxd7VbkZ1/yAC5E6v65yHvlPFT7ScIAUeb+p/c9ITXLZ
	mG2huBu8=
X-Gm-Gg: AfdE7cnfLkU+1aUEUQsq5/qmnLTlsCigjucQS99KqxxdmDlWReRUYTBGTIC4YH+z4DS
	uBH5HPCerozd0YaDLlhxBi6TBXO2Z30hQYcoYl4Plh9BvnJMlDh4qbPi5dQRwzIHyZUBerbkCqm
	Ms3RFkBvKFObzMIec6FxGITcrzzNwIyC7I6RBgQ4csh7D6K/EN3qIP8TpPipo2Vlp4KyvB2Yr9F
	FQ89QLPImCA12aO312wBJz/KDh8ruXRJXPsLpzAYWqtfMPM3M9ZD1DaXDmDAYgsPj8BQXLrwW1C
	bK9gsaTdLfIB5sbjLaMT3jfk+iDOvvUlIz2t91X45eIbipeSxG5gp/Utsc2D7luor1YRg3BPGC8
	aHM4sjMTPKAUlH8aI1Kj6ZURdxkJHDB1/fLg3RVof9HW3OwXuzrTVScJLJfQFiageUSmVyxQ1Yp
	FX+GfK18OIIliHXQ==
X-Received: by 2002:a05:690e:4382:b0:666:87b:b939 with SMTP id 956f58d0204a3-667d7b3c6f1mr1075079d50.26.1783747493972;
        Fri, 10 Jul 2026 22:24:53 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:52 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 18/19] ltp: rename kernel prefix
Date: Sat, 11 Jul 2026 01:24:02 -0400
Message-ID: <20260711052403.1292286-18-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240699

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/ltp/ltp_20260529.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
index e863503200..0842181ee8 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -32,7 +32,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
           "
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig kernel-vars
 
 # Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
 # SORT_NONE in linker script which isn't supported by gold:
@@ -121,7 +121,7 @@ RDEPENDS:${PN} = "\
     tar \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-loop"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-loop"
 
 FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
-- 
2.43.0


