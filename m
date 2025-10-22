Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C4CCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 19:46:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3873.1761162391924605660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 12:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dg0aRlof;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42701b29a7eso1479f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761162390; x=1761767190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gzTwD3LJmX5vKumtlGB1u1BQy+vw1d4/ftCpQv0Y6+Q=;
        b=Dg0aRlofLDxhSPTQ064F3bnrSyiYkIeCUiKT0KT5nzh3m2565N2mxoo8AgCTqzADkj
         alX5UQiBFbsn7zQKbRzUHPq5mLdm7gK5IzftTzEfYJiic0q+S1EQyP88XYsuJR8aaC0Q
         XBPAjQ2VU0EMEnCADvkQLYQtLC7nFKaiOwclTooTqOqtWHrXhsxQF6Z68sdiCHR0cnIG
         z3CDEnXS1ivs1e42u+rrfmNd8x6zzf5UNpuqGIUAszxWrCdFFB4sU1HMucf3uFL0oDAF
         94bxxBtAPa3P/VWQe6D/Z9JmnF/1CLduqV1GNzQdd7kD4EiZDUFocBk6HIpUZISc48yx
         ExKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761162390; x=1761767190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzTwD3LJmX5vKumtlGB1u1BQy+vw1d4/ftCpQv0Y6+Q=;
        b=Rm6DQEbXoY6OamGgjkkFFY9bFJWyO1q8gJ0AiN2eA04OMxKGbPZ0q3/A/x0UYzJuGb
         3ea6MTzGzZT2t1ckC4hlIthwfrYy9XVSSh+5vJyU7XWG+NcvWWi5G7FIXrIp0zislPuV
         XuiWb7HRcJNbDY/KQDzm/GjrAScRpeUDLokUVqCASDsn5QU9LuoBsKoVTwQjpCmG3jCa
         +MEPrrG1pkV6d7lU5kjzCgG9cEKs2bol0p9INX1fy2ScoBxPTriC72CB+lsPHspyyL0/
         JP2PzfLCsftZIXNcKfQWlAA191KeOuO4St/iBWgMlIFssgMdMYujCFG3to54iGMnpAQx
         58mA==
X-Gm-Message-State: AOJu0Ywd9Gp0eH/HKe0M74u2SyPfkx4tlAt0tMyOEtk0LjqkyUjhNJsl
	5+rC8qq9T96NetT1WvFpG2bid7/NhHDcUOIyWsLO+5csjU3KUUIH4niErBZxDg==
X-Gm-Gg: ASbGncvIYnsClHeFSKaGgFPEJOeGYcziWoOw76QtQMy5MouaeJwC0v+69oxfyeSW9cP
	6gtAZYhbxUq7s5NrfDyNj024ne9VxjLKcwR4ZwEtoG+JXhAQ5Zj5js4Yfoh54uzz/J78s2+XiCX
	yhM0TiNiTjO5aC85+gd/m5dKfVdcXf42Fk/tlsYSfhejyjz9phaDcmqL4eMONVtLN/0s6N+jp7m
	7W+n2jKx3Snbf1bE/ABAJO2B2yoeWTxM4toI5qGkk929yZX8WszUgIoAApnbfGVSIgIUSQ1OYUh
	b1unfKT3x6B4z4yyaD9ncxmE10fIslexGZfBqoy6TOEa56Wr8FkybsBkRQeouWuA1quvJzRYgzf
	1pWBeQ09TWgYFl1wzFUI5jIJX75EaiUZ2x3g97JOJdfmjNT5DljrLmllxoqpcolH4KSJd/IQvEg
	==
X-Google-Smtp-Source: AGHT+IF9vSytqVnpqKxn2qjgGtgRPXEcN0MaS4q9snfaT0+3n6M5cScRgCPP88AzF8nyB8TbZCQ72A==
X-Received: by 2002:a05:6000:2507:b0:426:f4b4:f0fb with SMTP id ffacd0b85a97d-4285324c33bmr3948681f8f.2.1761162390168;
        Wed, 22 Oct 2025 12:46:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897f577csm100344f8f.19.2025.10.22.12.46.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 12:46:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tar: use diffutils for ptest instead of busybox
Date: Wed, 22 Oct 2025 21:46:28 +0200
Message-ID: <20251022194628.2462629-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 19:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225209

A testcase (sparse03) sometimes times out on the AB, in qemu (without kvm):
the test generates an 8GB sparse file, tars it, untars it, and then
it compares the two versions with cmp.

This process, going through 16GB of data (using one thread, with cmp) takes some
time anyway, but when there is extra load on the host machine, and qemu
can't use its core exclusively, then it can take more than 5 minutes easily
(which is the default ptest timeout).

However the full version of cmp from diffutils seems to be more efficient than
the busybox version:

When using busybox on my idle machine (w/ qemuriscv64) the test case execution
takes 150s, and it almost always times out when there is extra load.

Using diffutils, my idle machine executes the same testcase in 55s, and it
never times out even if there is high load on the host system (execution
always stayed under 3 minutes).

Due to this switch to diffutils when running ptest.

Fixes [YOCTO 15884]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-extended/tar/tar_1.35.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index ea0993a909..206e084557 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -94,3 +94,5 @@ BBCLASSEXTEND = "native nativesdk"
 # Avoid false positives from CVEs in node-tar package
 # For example CVE-2021-{32803,32804,37701,37712,37713}
 CVE_PRODUCT = "gnu:tar"
+
+RDEPENDS:${PN}-ptest += "diffutils"

