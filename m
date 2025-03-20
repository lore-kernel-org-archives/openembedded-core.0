Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD02C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:36:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3925.1742499368886264056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 12:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIhq5/dZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2255003f4c6so24042545ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742499368; x=1743104168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnGFr+NI5mmnW2JgcyRu11ovKH434VLBeP+9Ex84mBc=;
        b=LIhq5/dZHGQGzgrqdeXnrUMYL4l+HTX8FK8zZXq9aBiW+bTLMQKJsOCgmLyc3209CU
         9U0syv7P++1uxViU9g/yzY5KdO42fdgDRyr8h1vCiycPpHF8AUTQUoDVV/bSDD0eVJNC
         Sr83hmD8AIqpaVKuAqaOwpsA3YwlwhrpFVjIzzV8zorPrwDic71VgSiANmpMt+GFIfEW
         NmI6yv6NNHIZcazhC88lwF+pQQVGwkwTy83Pg3Xf5KF0LSow9s1wKif/d7fgwmpB+xGl
         +XDb43bgZbN3CeEfoJaiT6djvLSCPkdIQ70Mh/Le7cXdkdt4vdNeFtYLxhOKuzHtlhEv
         rWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499368; x=1743104168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnGFr+NI5mmnW2JgcyRu11ovKH434VLBeP+9Ex84mBc=;
        b=l312OT5EoQZtAA/9OGuFyilXTtdxUICIdfbu9X5UFzbdRXAL6kb0sBr9oB3c/aXBB+
         w+VDYhNFuH08mhJD5L5QvWmgATLdcyMZT0+5eIrTNhWLCpv0IabwyDH2x/J8z6I0YJYp
         CxXVIcyE4mzaBBlTMqV0ZPADbg+Ss9yNusUpKooku1iaOgHiXz90Nq8tnBlc0VC0QTow
         CDkawhwjFK0PCxxRUqz3gg5rnUsys/5hKEAxzgMdPnTeGTdjmW8D31TgCWbxScygEzHW
         2T3GLunvcYGgCopaBtcBpIRe7yGe0xpPkwBgMW6SpAO46mZ/wdYmMl2TzdMcGpAgKOg9
         lJtQ==
X-Gm-Message-State: AOJu0YwwA3W38aQVovt4XkbqlTHOnSsck8O4uu+S4xXIfG8vKfZI0IBI
	o2wWun/tyRiejFcUMQma8RS1f40sHu8mOsfGwVsytJ95g8QjxaXuo30cNVQn
X-Gm-Gg: ASbGnct/BK8bOvcLldILqRgJLxaidRi/DH5m2Zx5ODeDljbNo3LW5rVcC3mlWJj7lx3
	F/YUKn0Qj1uHNoA7289s1IT4b78taIJoDzKTpdG8l4wZNfggPljab1npXTjPOE/h/m3oJs5zFP7
	KHm/532+H37uxSlWuuchVTu0TzRwCjcYYQHGMBG0hktilHjnGbSju9nrEIbLCJSLQczuBrPdlWU
	p0RBaj5hLn0jOzJLRhOqlmjH85aTh5eiE1m8rSlwf6ODax67liy94Os9M16iBB6FUtaEOskRE2J
	823Z6c6Mdc5nDIkjvv/4Buvr4B34H6k9R0Js
X-Google-Smtp-Source: AGHT+IF7LoI+QenAhOs2H5i7dUJYenprREjxPiTA70bEonHIyp0uLB6B3YGCZtyS7Vam++ahJ5s0PQ==
X-Received: by 2002:a05:6a00:b51:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-7390599987amr1121674b3a.11.1742499367850;
        Thu, 20 Mar 2025 12:36:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab1aesm203796b3a.36.2025.03.20.12.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:36:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 1/2] man-db: Add missing rdep for col utility
Date: Thu, 20 Mar 2025 12:36:04 -0700
Message-ID: <20250320193605.1469436-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 19:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213427

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

Add it via packageconfig and explicitly remove it for musl targets

libssh2 ptest mansyntax.sh fails due to this error, which now works

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Turn col into a packageconfig and drop zlib from deps

 meta/recipes-extended/man-db/man-db_2.13.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..f28bd4a9265 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -25,7 +25,12 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+PACKAGECONFIG ??= "col"
+# util-linux col is deprecated and only builds for glibc
+PACKAGECONFIG:remove:libc-musl = "col"
+
 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"
+PACKAGECONFIG[col] = "--with-col=col,--with-col=,,util-linux-col"
 PACKAGECONFIG[gzip] = "--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip"
 PACKAGECONFIG[lzip] = "--with-lzip=lzip,ac_cv_prog_have_lzip='',lzip"
 PACKAGECONFIG[lzma] = "--with-lzma=lzma,ac_cv_prog_have_lzma='',xz"

