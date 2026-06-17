Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D49CD98ED
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10395.1781682338955082048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ujUDtEuR;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46019b190b6so4505050f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682337; x=1782287137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B94JmX623Cf1KR6qqmLKiB3yq2IpyDqfeom30f1RnUc=;
        b=ujUDtEuRlOMfuPFdpTxBXob8Jo+MsclCyoVDtajB6CWRIW9WkS56GSuTLVoe8XOzx5
         iToZMdaJ2inlM4ej2KYstYpOjSVZBN6jwk+N9tS1ienNzG4QecjZqNLjlCocrT8WcebX
         NObq0nt6ZQVbzm3PCbzYmgLODMiCvGi454mFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682337; x=1782287137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B94JmX623Cf1KR6qqmLKiB3yq2IpyDqfeom30f1RnUc=;
        b=Vf6ZViAW2b/l+ZhvqTU/LURH2yFm9eyPOnPtE4UWzhnaylyTXz98cIvYGMgqMaiKWf
         3HrEQq62MIo4j50yyvDeafOs4ipNRm6JSe8Gf5diFyumKfZsUP3tqJzRgdrbR8LT7yDY
         CusznUGW3b18jvubO20k00OG5pM2NWdeg9RGfMe5DUqEw3rAylGkRXSz1uPzAoYM/XTB
         1TbxyePuxo4m9FxhKxYLqvEdBSSmzQyI6okemMMnZwJLX5HChumdW5DfM3AYT24cOn2H
         xD50YyPQXbE3gM+bHFmfnOdQ4SDAHUOk+dRmP3K1HKe/6FjYICIXuCFUo1INPNOaqnND
         DGfQ==
X-Gm-Message-State: AOJu0Yzz2jk6pRGd+m4d22UZ9E8NinodjJNhk28tnfHm5MrxsLdonAN0
	Rrb+K6OSPj+RL+u52O0xS0Vc9c7ehaKbgo19dKfnadQ23lGePp78D9gy33qsITRpDw9gy3DDMHw
	md2LO
X-Gm-Gg: AfdE7clI/B7FsQDFHrEkHJWMqsWCqJ0IqdF4/J7VtktGrkunak+ntkGKGZnZJrFIjWV
	lwhTEJZXQ+KdHCB4T82y+Ni1CG2j2RlIi8up98+ENbq+qaOILJAZ62t+tBsdw/OPJ+0rWp4Ogl/
	WmDAVhd3RmcYnziJb/D+5d16knvPbMcH5ZA0W6UKU7lKicVu84BZcboxYX6Mql9qB5f+ryI7vAK
	Vs17hOH7PDuV44ZXzjf3eVOOytyBl/IpYIb7QRz7sPPCb8KwXHtORcpMkRDgalB5x0WSve6tAf2
	EHf5j2RMfqSAgX0tPcYD6RP4CxcQAmkWCgMikQGAn+pYPb7QA220vQ9onwLyClj8cWsF8f0uSdX
	tEp9i7Y9w5ZBFj4k1+50I+fUTKm8NFRDBK6xRHla6ZC14aIcNWZdY/eRt/KyvYaW0SgcFUPQiIF
	Bbyp47ZaDm7grt5VUjpgW/zWX3yjT++908NvpBrlUVpnBJo2wTmTve26D1pCNoKFv/n03RYGvIF
	prsefhOcV8TFfNTLg==
X-Received: by 2002:adf:f44e:0:b0:461:bfd6:5109 with SMTP id ffacd0b85a97d-462371d7f68mr3633006f8f.22.1781682337071;
        Wed, 17 Jun 2026 00:45:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/30] python_setuptools_build_meta: clean the build directory in configure
Date: Wed, 17 Jun 2026 09:44:52 +0200
Message-ID: <d4950d6df0867dcd5c380d83ac4d138ec968e698.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238999

From: Ross Burton <ross.burton@arm.com>

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the pyproject.toml so we can [cleandirs] that.

MJ: this was later reverted in a532cb50151d773c1c351ffccf4d47a37f26f8aa:
  This is not needed: setuptools.build_meta does the build under a new
  temporary directory.

but the builds in scarthgap aren't using new temporary directory yet,
so this is still useful there:

Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:

$ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE
python3-tqdm/python3-tqdm: PKGSIZE changed from 3309408 to 426880 (-87%)

$ wc -l python3-tqdm/4.66.3*/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
  297 python3-tqdm/4.66.3-old/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
   41 python3-tqdm/4.66.3/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
(cherry picked from commit 383862cfe4c5acf04124080827c8bc6d00b2e86d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/meta/classes-recipe/python_setuptools_build_meta.bbclass
index 4c84d1e8d0b..046b4ffb74f 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,3 +7,7 @@
 inherit setuptools3-base python_pep517
 
 DEPENDS += "python3-setuptools-native python3-wheel-native"
+
+# This isn't nice, but is the best solutions to ensure clean builds for now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] = "${PEP517_SOURCE_PATH}/build"

