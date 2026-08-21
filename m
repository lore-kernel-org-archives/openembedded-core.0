Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4733C5DF91
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:29 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5317.1787311519736077963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ixDpeJCa;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f42ef0b693so571014a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311519; x=1787916319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJnuJ3npPiWStLScm4PB6ekfgKjxUFvOHmWTnYvCHW8=;
        b=ixDpeJCafOX3H/KxyTkqPYRk3dO9oMBi+2+6ydolXB4Ij04P5ObukpOVYG4Iv6zZxy
         eNu9F4QMQxIlfUYrJMTCmpCp3nIbqGFhPo5pAKJj8m8r4xbimB4UDHjNaD7HMNY8iori
         epRdd9+TaIUbsekB3/q+HA8UJh7wPlBOpjCLTToi23QpluM0f8N5WoC3Lo9MYJRlZDdH
         d17j9HdyoLdKfSeI/uh228McKhlmjpgi6mU30DGC8ChKER87OPxMQ5eIwSfKvAvuQlEt
         TBIH2bjOYR/VTBqQSqfcqTEapguKZ2HLV2ToBLu8iIHyi8wPPmyuRgKK1fnwEZ0s0ZMb
         IdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311519; x=1787916319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJnuJ3npPiWStLScm4PB6ekfgKjxUFvOHmWTnYvCHW8=;
        b=RTchvyHn1X1fImW4nHhMOsupESuvR4FXrDDZFgUD33R66gJ3APzu2h692nLDpw5msP
         3S11LzTut6CVGczZqr4MeQj8hxQoPBwHhF5NFDrCIFZSi6H+ChSRY/RmXgZqBriFWjIj
         l8Ei5PEGPxZfXhDKD+DkjkazTUKSP+ZmWzydwQv6PGphtD9VA5OPwyvpXkzmeGz3UVpQ
         i27lvt08xW9atfBkU3rgw3wmKAgZgq/HGnia+jaDG7knXS5Q+/CWTa/1i51HguYonId5
         wgTJRWTChhtOCQYnyHlD+HeYGVspWvH8jHUKVYeVWBVZFJ0jyP6g7jHLS+wWY5Qrd7ME
         R39Q==
X-Gm-Message-State: AOJu0YymCZb1h0RSNafo4sKMdQpGyt3XwfcsN8rAMmOXX79McAUQFqZO
	k6irp+XyLaa5A8x6RGJk1b4bWbvZpZzhPCcgnEqhrncWiqRY7huJ8/5/FmUwO/D7
X-Gm-Gg: AR+sD13l/QRslPTwrkA5JdRNbCsCVVyUfrdzmi3R9S/as9Y9YF1UuayZgV72GGGYhjI
	jrfoy6QyzXxxtzCt2a328Pgf8XMRLq+pJL0vWDFsTBYlBZa1A9QRznISVlh6SCFEFn7Xttk9svW
	DNquZOIztccaXINnM58xGLIXy4ofL7QsBhFXItX6zB0RrsHBXYNBwOnqh2Ni9NYRwDKeQEpZad2
	D7fUTA1QBTRKXm17wzCRKqwfQt3UDUn2itpDKrMmq/qzPT0wI8FT6wqUbwpSAPZAKie3XDEjzQ7
	SbGm4IfdxDFbZYtjCxly67fXZEmd+GuBwdXnVYj60rP6pzyu6Arkw3zATlS75j6jVxOC8Qql/ed
	oCt/yku8HSqBGxtEMtzZrMung4KOPQGSldUUAIl1qvTBafTSkJOpq6RjOQG3z5GCG1L0P8e0tn8
	gvSJSXr9XV2yCqRCQz4gDUiovg0d+IpDeyHYhGWpZlxTVo1UhhQ92gVYE5LWCvo8xewFmReSFpy
	WrqSfz7uCgfzKJSkMwVR8iTFBVv5tMgO94oxTjSF1bUKLu68aSA8biqeQLcnLTJ5T5E7Ct3Y/A5
	gObtTbAmrA8MyVp88uRPW5s48S1Yz2SGPsyk1Y6aIrX7n8x1FqUPo2hroS74lgQ2Qk6Yb9ScYF2
	7uuLK
X-Received: by 2002:a05:6830:3c0c:b0:7e9:df1f:6a19 with SMTP id 46e09a7af769-7f46137559bmr6145856a34.7.1787311518765;
        Fri, 21 Aug 2026 04:25:18 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70792sm7398018a34.5.2026.08.21.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:25:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/06] kernel-devsrc: strip riscv vdso-cfi-offsets .cmd file
Date: Fri, 21 Aug 2026 07:25:06 -0400
Message-ID: <20260821112509.861559-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112509.861559-1-bruce.ashfield@gmail.com>
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243928

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The riscv vDSO gained a CFI-instrumented build (VDSO_CFI_BUILD): when
enabled, arch/riscv/kernel/vdso/Makefile emits the offsets header as
include/generated/vdso-cfi-offsets.h instead of vdso-offsets.h. The
associated kbuild .cmd file records the full compiler invocation and
leaks TMPDIR / the build-host HOME into both the kernel-devsrc and
linux-headers packages, failing do_package_qa on qemuriscv64:

  QA Issue: File .../include/generated/.vdso-cfi-offsets.h.cmd in package
  kernel-devsrc contains reference to TMPDIR [buildpaths]

Remove it alongside the existing vdso*-offsets .cmd files. linux-headers
copies $kerneldir/build/* after this step, so dropping the build-tree
copy clears both packages. riscv-only today and a no-op (rm -f)
elsewhere, so it is safe for all architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 4ae121eb62..47c0abfa38 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -129,6 +129,8 @@ do_install() {
 
         rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
+        rm -f $kerneldir/include/generated/.vdso-cfi-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.vdso-cfi-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.vdso64-offsets.h.cmd
-- 
2.43.0


