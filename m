Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6A3E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.25624.1733345129009182211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FUcjk2t7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21583cf5748so1799305ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345128; x=1733949928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxJr86s9uNsgPSdU3OAi99B7qrDpo8X0/ZzncfDMLDA=;
        b=FUcjk2t7WEMYIRanI5NNIGHP/tmW1v/LHnOcgz4RaipNk/nEtGveGa7E/AtViPe2Qv
         NoDjMggZzRmzH385LTHS+R4AavKrNmG2bH4BBMQ6b0E+8oXurDxOSUZ+3WUaOBIn9IPX
         I3V7OM2uHxUSgryuRI3MlAg4LKen2dMRss/rWM5YZcHqqljAToh96+8HhlHAroZyl2Gz
         jnMi2SOE2tVnPPDUFSvohPf0r17IH++SjBJaTiGZ3LB4LI8FaC0K/hEA3AddOCELde+f
         omtj4iMl3CJmNXpZGo3xb1/MxW0c2HdCYX7dW+poxhdcKfQYmb1Nqi087KJaRHPmwDgn
         P0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345128; x=1733949928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxJr86s9uNsgPSdU3OAi99B7qrDpo8X0/ZzncfDMLDA=;
        b=To96ANdH2U6CwfqPlIiUHijf1WqBMchBXGZE3HBPQrZM9SryhoD45GEmzoO/EK8OCp
         2Y91/MMtD30xWPcLqjxqr8E5gSkBuUDtIw64pc1AJr2M06pDx9nJC0B24Rbz/QkR1JPx
         Fn5Gxn8OzQOwAAuJUjBcSueXRBedZGoE2WHkgDQUrQ6I01zp/nX8JVITvlKC9VDhv20q
         ugEDBmij783HvnobJBB3QZ9JZmzmtNTAo/VAh7Cehm2bsdLLX33xz9lSOLdRsMqkpupk
         Dr4pXb62Z+UC1HY68N9kkSpxwu/PIv5ADe0b175NKztdZ9w1eJGqS0CSSJ3utUIFMLG5
         GTyQ==
X-Gm-Message-State: AOJu0YyaJoqieGSNpa/0HNLyUG2L1ybYJp94UjxZWmTF2nZNBonF70iL
	BGxII+hFk0Evhfmi/WxvJgi1kFZbAWHPAnyOMtgMMhmEvp/x0nmmvBL+Y7q8CQAM0yhORoHDtuv
	o
X-Gm-Gg: ASbGncvbqqTDLMBtdMN0HPrfXs87tR78U2Eth7vgAhfEsRHCR9oqw0L9kNsqXtIG6O5
	b/0hcWYzNgs7fhyZLTnqPMaMlZS/7SWZxQgrgA8sRxwZCmY3srR23QcNOxHFi3JLp/CjrlOKtSl
	2d89blNIx0MR5NTzy9b4q+186TJrYwcGkDo+F86DNQlDm2i3Llo7Nc6BJ691cpo30Hr4yE7qmS6
	UCMFrnO00JSHAMoT+pR+pqamxcOdS/NJMFgZp4=
X-Google-Smtp-Source: AGHT+IFcTJmAgkR6zlaAjvQIFgnoJrLxiXPjESUNCsn4jqs8eTBS94gaenAwNuy2t7crbzUeB+AqSA==
X-Received: by 2002:a17:902:f64d:b0:215:6fcd:6cd5 with SMTP id d9443c01a7336-215bc422f18mr121190325ad.0.1733345128296;
        Wed, 04 Dec 2024 12:45:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/14] glibc: stable 2.40 branch updates.
Date: Wed,  4 Dec 2024 12:45:10 -0800
Message-Id: <e773465484dbcae693b75ea1a61006a0cedb79cc.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208345

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.40 stable branch are updated.
626c048f32 elf: handle addition overflow in _dl_find_object_update_1 [BZ #32245]
efb710034e linux: sparc: Fix clone for LEON/sparcv8 (BZ 31394)
2344580243 Mitigation for "clone on sparc might fail with -EFAULT for no valid reason" (bz 31394)
3a34851103 elf: Change ldconfig auxcache magic number (bug 32231)
85e5850f2f Make tst-strtod-underflow type-generic
5c06c6e0b5 libio: Set _vtable_offset before calling _IO_link_in [BZ #32148]
cc256952ec Add tests of more strtod special cases
8f40dfbe2a Add more tests of strtod end pointer
4a9b6cdc88 Make tst-strtod2 and tst-strtod5 type-generic
5a10d05c39 powerpc64le: Build new strtod tests with long double ABI flags (bug 32145)
c4cc72d2ef Do not set errno for overflowing NaN payload in strtod/nan (bug 32045)
ad93c2047d Improve NaN payload testing
cac10d88c6 Make __strtod_internal tests type-generic
d0c1792ad2 Fix strtod subnormal rounding (bug 30220)
e06153665f More thoroughly test underflow / errno in tst-strtod-round
9bc76c7ca4 Test errno setting on strtod overflow in tst-strtod-round
61b6464f8d Add tests of fread
77018fd9f9 stdio-common: Add new test for fdopen

Testresults:
After update	|Before update	 |Difference
PASS: 4947	|PASS: 4945 	 |PASS: +2
FAIL: 224	|FAIL: 224	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 229|UNSUPPORTED: 229|UNSUPPORTED: 0

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c8614e3c60..156d2b0474 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.40/master"
 PV = "2.40+git"
-SRCREV_glibc ?= "7073164add3b874cf0c19ca0fb84236f6bb0985d"
+SRCREV_glibc ?= "626c048f32a979f77662bdcb1cca477c11d3f9c1"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


