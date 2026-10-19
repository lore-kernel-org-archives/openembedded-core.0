Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0E9CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:04:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35469.1792418644978313610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JoH/aokK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so15904365e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792418643; x=1793023443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zr03BVB3MUSwJrMhdGzunhW6/kkcK8yKc+4X16g2bns=;
        b=JoH/aokKqI7xDhNKTJ0RJ6s4kg60ojYK+M9piya3Kfrbe7BGcZD/0no9cso5QG6a+j
         TU101s9XVpn8+8rTOxdGFaYlVEU/37Q16d72SmHP/SBsmZpqBzzMDK+cUZ0AxVCuVUcW
         r8ccE4ADUUkeh1wKl9EYugAL/Jn3kDBK4lYsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418643; x=1793023443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zr03BVB3MUSwJrMhdGzunhW6/kkcK8yKc+4X16g2bns=;
        b=pnHLUytQ/CDJ2XcBQeYRT3rp8eHtdfu0PuhZftUgK+DNzymmAuIakE/8DWZejeLe/+
         P26/Tenw+tPa7h/uMwZz0aIB7682MW0or+3F1H5jeCGLcjX1V/FbOSM7rLE0Xlg9jM83
         WdzFqoG9kjRaB0cC42Nf4wgm4iwYRmHEJn2Cqi8cimzCVq3WJmupXoWN4kzJVz91AAFT
         mmVBNvLeESNxPVbpOS5+9uqLOjDSIceQwyQvGk2sKMdWtIF6eY469GKJzUqXJFTX70je
         5WhZ4Bbx/qU84bG5Y2HNetbARFD+QKtydOFb98TLRd/DCPmK36HcyLgx0Ig8p33k0v8q
         ntvQ==
X-Gm-Message-State: AFq9FYJdvjJXVI8ZVIsHmMUCfeOoi/UF4ndUrmEfoUm1gyXCpQYgTjE/
	Xa+QiU79yM01WBfo7Z0QcWzRQ802zRj7g51UmH+csbsDXlAjRXQCOLKtmI61nbZpQKMyW3ifSNR
	W1Z6jT7w=
X-Gm-Gg: AYBFou2g5BUqc1GrBq7Lbx4VHFKqUH5Qc9sscJPgDrTtDeC4yv8Rsp15EB6X/KVXE6l
	2z1ZWTv7mJ9xHBBg8cJ38a6IfbxE7l4oaWdfREL9Kl4abeivNWJ5A72HfzyE20xhjsSKgQTE/hb
	r9rPC2xvxXDygErWW14s6XbNcUrd8UaAxGrK+LHqnFmZWOeqSNliQTSY4sQ20TSwDj4lZD26GeB
	B1kqTTmVJzCEpOH7I3tyqBQX7cm5mxv+v7l03uvdfO610YUlMVMQZ6GUaofyCparfx8XPqw3TC1
	4nyvdoRmU5bzpoh0fwduPiYBmNVH0inHhC3ySRKJjs8EFd5e1Sb71RdtCLdoM3IrCCgjQsgdT4O
	WhnVtxo1J+mAeP7PpyDtHVMGquUeRJdALPNk53ELgyf+nc2YA40MzEfLhxp++QBq5wwmj8OkPxz
	Z5AqfK9uRLrYHcpb7gYIlSHQ2lr1uSn2+J1EmpJ5z23qfSDsFC5Z/n0XYcnT2t0YEqc3suTE4Sh
	uMBz10jwR3IooQXbRAXmdUR
X-Received: by 2002:a05:600c:3513:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a1d760e58fmr166202595e9.27.1792418642577;
        Mon, 19 Oct 2026 07:04:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c01:6d06:43:9326])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d756ce69sm198655845e9.4.2026.10.19.07.04.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:04:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] erofs-utils: Make reproducible for different BUILD_ARCH
Date: Mon, 19 Oct 2026 15:04:00 +0100
Message-ID: <20261019140400.794039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248170

configure was querying the host's page size. Avoid this and set a value
based on the target insteadl. aarch64 is the only one we commonly build
which isn't 4k as far as I know.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 45339656b5b..9c0db7c2c05 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -17,6 +17,11 @@ PACKAGECONFIG ??= "lz4 zlib"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
+# Would otherwise query the system the build is running on
+BLOCKSIZE = "4096"
+BLOCKSIZE:aarch64 = "16384"
+CACHED_CONFIGUREVARS:append:class-target = " MAX_BLOCK_SIZE=${BLOCKSIZE}"
+
 EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
 CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"

