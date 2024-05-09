Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1ADC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 05:47:58 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.3477.1715233674905742607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 22:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nItD+Beo;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c74b27179dso362749b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 22:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715233674; x=1715838474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzIbBEU4tiQw0GJ/I12PbhLqYoEE4rrKYKqwMeGx4ZM=;
        b=nItD+BeoE5iGIxCbG/4eKvnqvAuT9CaRDd/FWMiNJeFbPw/Bn59M384PgxzSHs7Q7Z
         oSKLDVmCUbVwHEyv9q3Vd4NGZ9UHPqJJ6mc+Kdp40naKX41tP2E6z88bgvg0uPBAT747
         BcB7opy/AeRYW4jnrXd1yyEKf2J0gZvU+CEkXUgtBisSrPBVhM6VQClNYceTBiJRw/Xh
         +7SIbu7P99um1QFQtHsCQ7IwLce3Ik+o7Z7b8v1br4stQNYxS6sFRsEyZRr598uzCq6d
         ZJaDlKR6Im5g3C2liF/f85soTbw61QDGk5+wqrLe9X06kDm+MjZKW+IIsBnf1F/7g4nI
         /rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715233674; x=1715838474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzIbBEU4tiQw0GJ/I12PbhLqYoEE4rrKYKqwMeGx4ZM=;
        b=asw9crC7/MRq1sK7MN5u6hdYdSzwx0IEWCVERwHCdPPIiDCUFClFv6BB2KLAacK3gu
         UAMdEgyFlArEf+LcQ/DfvMs3aZyM0hkQ83KuvhQIlYEb6yquyUgO3h0afa0ekAs3CkD8
         lm7wrfXGVkpF/QeJJfjlOqa28KuRT7GTIIFQw7uAc30j+gIgHfi/OIfcUu/ryw68h0yN
         BuzvklJEwFUZnK7YO1Qw9HmkIZs1XXTfJxHMwBnlE2Nzqq8F3+ixcdAzpRqBwF/L2IEY
         b0U5xMgJFjEKXKjh0yfqirwcm+xOZK4uvkIl7YPWb3nu6uEjWw9ga7EM0/XmwgWzcpgW
         IPag==
X-Gm-Message-State: AOJu0Yw7KMBYC3vR8x0odegywrrhFna5fkW7N7Kp/lNtdrULPyatFHPC
	myV/Zcf7EnS3TG9TBsu3aCdmHuV1Daxi90175ivxit+pEGtAGRhf9VA4EN09
X-Google-Smtp-Source: AGHT+IEpNCWJE1lyo1HFQHyKTFjBCYQZvCEZtwUkzmi3FGrxFrNv3qa12icKgscJIbbTMEKZwZgjcQ==
X-Received: by 2002:a05:6808:1901:b0:3c9:6f4b:f825 with SMTP id 5614622812f47-3c985320c07mr6193352b6e.39.1715233673898;
        Wed, 08 May 2024 22:47:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade2e5sm534593b3a.140.2024.05.08.22.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 22:47:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Use locale-base-en-us for locale
Date: Wed,  8 May 2024 22:47:51 -0700
Message-ID: <20240509054751.823625-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199141

locale-base-en-us is available on musl as well therefore, not need
to make it glibc specific anymore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/strace_6.8.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.8.bb b/meta/recipes-devtools/strace/strace_6.8.bb
index b22c57b45d0..e1cc65e053e 100644
--- a/meta/recipes-devtools/strace/strace_6.8.bb
+++ b/meta/recipes-devtools/strace/strace_6.8.bb
@@ -47,10 +47,6 @@ do_install_ptest() {
         sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed"
-
-RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-     locale-base-en-us.iso-8859-1 \
-"
+RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"
 
 BBCLASSEXTEND = "native"
-- 
2.45.0


