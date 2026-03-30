Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE3B1061B0E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:16:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53843.1774883789904446791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TTv0RZG8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43ccda008cdso1481120f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883788; x=1775488588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=TTv0RZG8EuW3PT6ymSuwgufL3MWFEU0RWocUi2Vz4lhqLMaBl4egDlRc4aIL1WnuBP
         yJYVsaKBXtQbomFLC+vsSQABPnz6lewqAlPsr9SFmTHoHntbRQQom1h2KQIgxY78FPkw
         ivgQldD4NxV94iuFpPXPXWeY5B4GArPqWc1rWjMUxHP3LPed0BKfSMsoBsFQMtIqSfKc
         LtU+BMn3QgHMPvMwSGK7JlWu3FZofne/NlxgCBgVIXnpQ1CHMOMO/3eMjg0TakcmDgES
         wgcPslDyjjvb+s5D+Fgv2rO88NnE5wzJgt3oXZzLL5rPEa0+NFkWRVkmI2HpdTc1rzIQ
         znJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883788; x=1775488588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=e6hSEyeCJYJz+qC9YH1/X4OHCi+aPyUQCf7eHqYcznQsW+0qLSNZFtr66WqNDpKa1r
         iMHCOJ4RSnmYHOzWiDmtlx42Uq22wHxgglUiBBd+VDmKJlsd0/BRuKmx//4nQ6GP17vf
         PTBEmr9xANYovsH1pAUgFSJUOjewfdye6Lw4uJzY8MfeIOkAAtayD9VbSNCiL7R72P4w
         q/iQT6x0/hjYYh6UtFWH5k3Iem4JjSK73DE96tQZe7BH3rU0b8wOSSKNG8GwKHNyWodD
         Ed083CSPSvz4rXkjEYGz8RcCEz+9imNL6dMWJXG8poNfkacB4XkWqkgQwprJ4rtvN4RV
         3CAQ==
X-Gm-Message-State: AOJu0Yw2RjelSbW0fWiwf8KAm8Q/Hkc1Am9WetxjBwIQ6T1nj3r+Zpn9
	ChGtXh9bBxMjlRzsbeiIiJ+mlNVRH0W5Mvp10Sn62gAogB3xKZPWQqTdPCs4sg==
X-Gm-Gg: ATEYQzz6tyvX3owYngXtQicS/GWdXlrrw7QS/1KyzobrPTBh2/5lgquIlX/P3Fvfh2C
	o3Rp23fWUgAXM44P9YOekiAWh31KylAXppdzlnFdeWAGA9GvNLctxUusug738uSY+uK8bB7NeEq
	zJm1Ni8GEvD8l3Zk5KBTckgrpeopXaBSzv4YhXQpXaEE9acVi/9UQcR9wFu4k9bmDkZrxlDeY6Z
	YhflzN2tCMEQ11K43o/7zDnr9TlD/nUAqrSYPCLoA8SmBrbL7m/rdAcDAERr1SmjwLaNcZzM/+g
	GIkgFDVjEcc4QYvtu76TU8cT9Zm1FE1b8L7bC1ikM03HppEggO34rOpEQmQdC4YtknfFg8bC7gK
	8M+r8PvgQwt8WpM2W5d0aVLv+8Xrut0EGPExezbRtISXyK+hshJklBVMGHssfOMPjiE9lcut0Eo
	xDumvZtgE7iaC2WoDFzCS5eW6ebw==
X-Received: by 2002:a5d:5887:0:b0:43b:8e96:d3d2 with SMTP id ffacd0b85a97d-43b97a253f2mr27354970f8f.13.1774883788100;
        Mon, 30 Mar 2026 08:16:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm20631473f8f.13.2026.03.30.08.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:27 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 3/7] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Mon, 30 Mar 2026 17:16:12 +0200
Message-ID: <20260330151620.3835312-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330151620.3835312-1-martin.jansa@gmail.com>
References: <20260330151620.3835312-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234244

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.1 for glibc 2.43

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..d97c96f631 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

