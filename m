Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B37CDB46F
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5954.1781960417074657045
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1P0EWS3r;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2087376f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960415; x=1782565215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8l3fmW8L5fSJl+8ozpvul8WDLNu3vonKEUMhG5Y0Vc=;
        b=1P0EWS3rjyv4EH6p+QJWmdUJ+XaSJrd55qbGGOrysEkpjyZfY+SjS5b+TC88Y3EG+j
         EdGIM489aaS+X8YTgrvC3KLu+1glQnrgng9tEQApNmnQ3yIBNpKJMj3IMbGPPCpqvpLR
         4AAexbhQcys9JUg62n33oDrjEB8rgUPiVQuhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960415; x=1782565215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8l3fmW8L5fSJl+8ozpvul8WDLNu3vonKEUMhG5Y0Vc=;
        b=KSpE0I8UzuJq9ClGGLGIz/hvyHGbBPWqy6vUizUOFeafB9RE0IIRz2hXg1j8WlguDZ
         hcifjH8f3Gr3OPDgvY2et4cNW+6miv6aC7dsoHbYTYpmmybXfzS0mclfOKQIOHL7BhBm
         PaOqOFvdG2JaLhiPIUGOQXbGX3qYhvx5/NBnplBOhovlyLhXDDn0m5KZr0hA29EQthpj
         85WkNPgGailqdIYfd4sACcyCEiUzlZmMZXcNEuRQBC4RZqTenjvKCECMLR31p5UY81sh
         /DClk57DAXk8n3E5AMuENajhuy5I/S9RA53V3oL5Fvm9Se/1xXkOEG9bvPyiIlXq+Tep
         h9lg==
X-Gm-Message-State: AOJu0YzXiNqXr+DYvVlEIv6Rux3UXjYWA8o0lCy2kgT+mb6SxBYgQII6
	1dzehzn1hEJBiYx4to19+rB08pPeJ4ut9TBCQl5We/U9RiINPGvnA5uJ46ePrg/0S6fAxNSlq2v
	WzmiC
X-Gm-Gg: AfdE7cmcJntyC4r7NK1COBgBcYTdW1D2hIyrH/89HdfrHX2naYmMqd6374Fsgyn6TJ/
	P8rqF3VMVgP8hVdqkqRPMu7c18MlvDWwlB6OZroGZw0D6REwT0SVtGWLiupo6BwZgyzY1Eebe8g
	+TtbU9H1RveHPhCRglBrvJ4iwUokR74Bnm+hVVGIp6uzyrCgGRnwojQlFNQ3Uf/t6ppwUqmU+EE
	+OH1+dMadWaHDkWBuFPQ+6mjAloQvF04G1Kp4VXC7fzL0qli3Sh/n52QfXZSnraTv63oS1p1ufU
	CfUh3hqIhAuILvzIDUGtlnPLPGx3Dl0b5iGus2v8/2bIAh6NbbSiD8mTlaW5qFtxESA/atbrsM6
	Zmoty+YuvREGZM7My0dST2Zuwx2JlIR68ucP0cL5Q/Ilgkf4w+vn9QtHGnGAZ6XK9FCHVi9SdNt
	mdj5d2yOaMpMOfPj04D1Gpev7iomB2dcuu5IefLTlYS0WnYOXfyxuOdMvKmcs4OGApwqU8Y6FLi
	lEJ7yXQc72vih5di+U9PBik6zk=
X-Received: by 2002:a05:6000:29d6:b0:466:1bc8:7270 with SMTP id ffacd0b85a97d-4661bc87393mr6423005f8f.14.1781960415374;
        Sat, 20 Jun 2026 06:00:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/36] perf: disable BUILD_BPF_SKEL by default
Date: Sat, 20 Jun 2026 14:59:27 +0200
Message-ID: <f48f6fb91cb013781a9576ecaf9ba6812c514b28.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239222

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enabling the Rust in-kernel feature pulls in clang-native as a
dependency for the kernel build. During the perf build, the presence of clang
causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf attempt
to build bpftool as part of its build process and make build to fail.

Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 due to missing
clang dependency.

The perf recipe does not currently provide/support the required
bpftool build environment, resulting in build failures such as:

Error:
| make[3]: *** ../bpf/bpftool: No such file or directory.  Stop.

As a workaround currently disabling BUILD_BPF_SKEL by default to make perf to build.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14277b97ee4217d6a2b75546dff11b82bfae0c1f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c3ef25fd999..e3e5d55e396 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -438,3 +438,9 @@ perf_fix_sources () {
 		fi
 	done
 }
+
+# Disable BUILD_BPF_SKEL by default.
+# Rust in kernel support pulls in clang-native, which satisfies the
+# BUILD_BPF_SKEL dependency checks and causes perf to attempt
+# building bpftool, resulting in a build failure.
+PACKAGECONFIG[bpf-skel] = ",BUILD_BPF_SKEL=0" 

