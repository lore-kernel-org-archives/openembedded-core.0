Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A6ACA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:10:46 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25041.1791220244214196715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=ON1Dczm/;
 spf=pass (domain: ossystems.com.br, ip: 74.125.82.53, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1433e7b057fso1123288c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791220243; x=1791825043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufglCK7nmd5bD29p81v+ICAyj+KB8PwfHxp8QEDBpZc=;
        b=ON1Dczm/FgEJQ6PHz0NmHJx82eY+Nlo3+LK8HaYMEzcbaL61M1Bi8Aht1ehKHzvS7F
         HUseVNJ+QMr3inTbfWH2+5LKqKdxiYRf+qtv0OBMEAruNDF2zudIl3hcf6f5YIVGL0Gz
         tx2G59DWuZ6b3oatCybfYH7yjuIWmToTvvf+yv+UZKf4JVvIkSo5ICW7s1VnN2EXwUDB
         jXjVzrsnH8s36CMc65Vc0hTjkcZW22LVyrM9WyNcm0lmE1VodeXsMK0WTHviOSlk5qu+
         caWmRj9fbJKd912Dl/0o70JYRDXdLISuv6euxicmKStoU+R9fbrtXTrpB5j0z2fF2U3R
         zpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220243; x=1791825043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufglCK7nmd5bD29p81v+ICAyj+KB8PwfHxp8QEDBpZc=;
        b=tJxRRjxIC5DUo8G6BXNUgcKu1GzgB26rbNYn2eiTq7jzAYkSK9pvopCvkP0SNnjlfm
         wjquyEyIkQ5wuwRpZqKuLKJ4yZuMXuZXVRD5hs2qV1DEgZj3YJzGrw3Pm9Z2FuZOICqV
         QCFVY4l80nXBOMidxsdjh6PMsEa7d8r7b80Gz9nzxwWAXCLmmbzqukiQZl98ZATJyJXi
         hW0cLSrZagqglJouc3svZKkIVvUhiqQQ6yy30vR2tE57M+PW78fgfwDnZk7OIBl1zwzp
         j5tcOJ4Q/yONgo18jqoeHvK7wTlxlc1o1MzIYUL7C14SUUo/hnXLyWx+9zinelB56JRQ
         rrfw==
X-Gm-Message-State: AFuF++l0/Tg9TVz05JFhJwr5oN4wVsyuJF6bWIwgTXt1JS27j1GLlJPv
	xTxjCOMuBlMJM5jc4P5XWGHpkISPuPYgFVx5IcBXTMZ5pui0upzDOOR7FHy7R3j2MK92yzkKs92
	hKmaM
X-Gm-Gg: AYBFou1Sn5U6kbksTqp2vnyndQwJK9XRqTmRlMFG0HY2g0Y9x9SkA83oTa19brjeOj3
	2Dwb6by0EsAP04r7Fv/padd4QSMaTHpkhJox9qw6MPr39lMWWtxi39QPxqtT6WUK1DzWBi3Fag+
	ir85W+mqlUaW9Tpxsx6J42Uhh70psa2xTZl7Fq0DwNEpSnVQrw87zubBgL4nF9osttk0YOGLEi1
	Ys+EhNvx09E2PSkass4Ed5QMSxxsXWKHU8Z0pEOectiI495t42KoElEeFiO1W5y9WlwlFnQy0n4
	NLOMaRU/ZGyV613yzHh63r/llW7VlE4DBXfd5GPBQip/Ai6eytn0L8HYPelZa1JF8KLJ9PqGgfI
	48/YSKlxejMjJkJQYGBtBCeXfLQqf+RXGd8hx979+h5dTPYI7NwvK3233fqwAlbfWVkTxVm9UQl
	5OIjRLp9syJj5AfyJd5/zFj5cxPGRDE96GYiwaeLj+yyoTV7mhjqjDkq2hiMyxfVadiUO+vickf
	vrJndccdQ6Bw8Op8qV4Z6c6Zg27PZX+xor3UbAy
X-Received: by 2002:a05:7022:f902:20b0:151:2e62:fe89 with SMTP id a92af1059eb24-151c3c91b07mr11243397c88.32.1791220243429;
        Mon, 05 Oct 2026 10:10:43 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fca7c7d4sm23584681c88.9.2026.10.05.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:10:40 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH] packagegroup-core-tools-testapps: Drop Go tools on powerpc64
Date: Mon,  5 Oct 2026 14:10:26 -0300
Message-ID: <20261005171026.1122111-1-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247256

goarch.bbclass sets COMPATIBLE_HOST:powerpc64 = "null", so go-helloworld
and cgo-helloworld are skipped on big-endian ppc64 and world has no
provider for them there (e.g. e6500 machines and their lib64 multilib).
Empty GOTOOLS as for powerpc. Checked with bitbake -S none world for
t4240rdb, t2080rdb-64b and p5040ds.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d6bed8d32c..c47010f05c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -18,7 +18,7 @@ KEXECTOOLS:riscv64 ?= ""
 KEXECTOOLS:riscv32 ?= ""
 KEXECTOOLS:loongarch64 ?= ""
 
-# go does not support ppc32, only ppc64
+# go does not support ppc32 and, in goarch.bbclass, only little-endian ppc64
 # https://github.com/golang/go/issues/22885
 # gccgo may do better
 GOTOOLS ?= "\
@@ -26,6 +26,7 @@ GOTOOLS ?= "\
     cgo-helloworld \
     "
 GOTOOLS:powerpc ?= ""
+GOTOOLS:powerpc64 ?= ""
 GOTOOLS:riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
-- 
2.54.0


