Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AA4E64020
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:31 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.10677.1732226070668503041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pdSZIVT1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so1073493a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226070; x=1732830870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGAc7i2pAjaMrfpeifO2XKz2XBT9br56lNx4wmU3DgI=;
        b=pdSZIVT1HksbUFoaHM6L+QXTvU03v5tINDxYFweGjvKTQNptjdlBDpB3cbugZ/Q0Vr
         stLJEsN0Ytt6ChoaW47Ri91szx7fQWBekOYtICzk0kL3eH0/gZ0j0SSAu3KnkIZNdJM3
         vLITgqaYDL3bjxXeLEyctvccdcY/D5orFQYU4nJ5QO3q/HOu40Br+qe8MhGZFeYiUOrs
         fs0NuWGUPy6jcecWtR+YjWk5l59cSJkXtgHTYqSCniDQ01pdtIYANNhTAu6h/zXlGY+4
         k+Rry9bzJFCnsvAb32/xQyjHFgRiLQ2Im70lTTF8GKYXtZ1dK4Uaw/zooXOZ0c7giEzC
         JoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226070; x=1732830870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGAc7i2pAjaMrfpeifO2XKz2XBT9br56lNx4wmU3DgI=;
        b=uEqtg0figBVcSp7Jks/+FTr0FtphpWl58UAOwwzLkRTbPq2rFnqpUgJA7PYzs9QD5g
         tkfz+jeQ2c98WZNsxd/hY2IfqkVcle1bNTgYVGDB7ZIOy+fhdeU4YYss8j4Wm2EkclsC
         lno3KIsngh1L7v1mGMpl1oT2rcjCgWF2kV/WIb3e5KczL/7vt3Wqtf1hRMXR3FSIWhbU
         92URuKj1YMyn3+6UTJussbNIZuQocPZSE0WPqacWIPb+CXtDk19sWs/yn2xDyYy1xxlm
         xE3TY4BB2ibvBEODHnbwTPF4fEbmfi5Rt2tuDzlzCQOdEIcqEwoYbFdA4d7P2E6++OJg
         hvZQ==
X-Gm-Message-State: AOJu0YxU3z8JpowCmInZjuTHlyDcf7WS00bZyykIHhPrSorVhn6AwUK5
	EESRmG2xmlXQh1YZ4T3ZA3jENjrzykt/acnOGIaU1xxbYBfkLGSBGoKvfjej0h7wJ/eeUIdxVNa
	X
X-Gm-Gg: ASbGncvA7kiOoC1bfPQMBUwwlhyIOi/jaXz7e5cYmbbIPyr2oGS/dKmyNLOhxAX4T8I
	ujnFZlPd5IcbYq1L1+mQNMwP1F/gGz1xqGZWSToLfXaIsg0fU8RTj/VfWA/7hQrJot0ea92NkUU
	hVOvIM9+WpkuVOc4zuN6IoHBnvJgKJh3PQFBDbcwP/68a/jx1C+nzwlyYoe81lmYCVdNKI6HWCu
	zfoqktQb0WjsQfnPJGasn6fy6OtCswjL5eE0Y0=
X-Google-Smtp-Source: AGHT+IGZegXWRePKlZdLDnxTufPZLIbsrYPwBb+bxMmkOZFxmIY7jWD+qW256uacUSRQUqUWGoQYHg==
X-Received: by 2002:a05:6a20:9147:b0:1dc:c433:144b with SMTP id adf61e73a8af0-1e09e4effd1mr722238637.27.1732226069890;
        Thu, 21 Nov 2024 13:54:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/27] binutils: stable 2.42 branch update
Date: Thu, 21 Nov 2024 13:53:55 -0800
Message-Id: <312c522787e72fffb9eb1b49e97aeaf24db27d2d.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207560

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
09ba78f0513 LoongArch: ld:Report an error when seeing an unrecognized relocation
00abcf39930 s390: Add arch15 instructions
caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand constraints
543a22c7ee3 s390: Simplify (dis)assembly of insn operands with const bits
7c94c87d463 s390: Align opcodes to lower-case
fffb4fae823 s390: Flag conditional branch relative insns as condjump
2d238ecbe50 s390: Use proper string lengths when parsing opcode table flags
10d0dd2ba2b s390: Whitespace fixes in conditional branch flavor descriptions
10a143e273c LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch tdata
9055fbe5ffb LoongArch: The symbol got type can only be obtained after initialization

Tested on qemux86_64.
There were no additional PASS or FAIL after the update

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5d5ba3d6dc..bff97b50c3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
+SRCREV ?= "09ba78f051319e8f8861b26fb9340e21ca973c70"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


