Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01644C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 12:42:25 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21958.1789476138537112426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nCK+3aoZ;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1983334f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789476136; x=1790080936; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/vAysq14UUsI+hSrXcdlb/CtoOM92oyJoz+hB3SkxU=;
        b=nCK+3aoZH++JevVhbsXor0KCM1yFIvJNoNSt0u1fPwTs1o0WkPeCP0sbZIr2F9VxVp
         v1ErOPn5k4IEdX3+9T0a4UQPWYygQP3P7iOguOFO6JWZQFunfruSkEIicbT0WdSudtns
         /vr2yt723gY0TyUpPP3qOy5xn5EFK47Udouys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476136; x=1790080936;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/vAysq14UUsI+hSrXcdlb/CtoOM92oyJoz+hB3SkxU=;
        b=Qwg0iNOKL7wgRL/gnM/6qBovchFx6cnJal3hAc2II0f4V6ir4KxkdFVrKQ0OMPVAKV
         KsB3+LinYfP5z1/Edn85NhKtRYx4W/TD5o3xvsxYOKbULyrTZ6/hNFM33IXmA2OnnCE6
         6CKRqoqRu0GNOkKeBZu28pvtftVIVyfgrUK8gTJRFKGbNUMf2EvWMEJstTToWXGxSH3V
         cUGXHGmZabXD6qx4J1upwPZ95wNik8LVEGLxA/4kJlj+VaJx9t+67CfFDAqGBYAcoSmt
         GyUSYc3K1u9JupIhLHbCae+47BPRXfq4gzO9kywSXY4OoKXR6ihCO7EYSqKzNmoP9CB1
         L5KA==
X-Forwarded-Encrypted: i=1; AKwUvBytlwq2ayaoBp6BaEA/4KLzzjm0ktC3MZZmy8SQJFFVqII+NKPK2Zm7CDcOLQnz2cOc4ILnyZGwu6P6wd00IU1qWg==@lists.openembedded.org
X-Gm-Message-State: AFuF++l3/zQUf5SYGipxw44kxLfq2/zwrqfbYCIdoAupkhvGe7+eEnbq
	rJ98b9wcZjbikQZVy7p1f4Bbh0OzdoEtctEEYLEK72203Hcv2JiaEXO4lJprPf1r3Gw=
X-Gm-Gg: AYBFou2qrAX2f1a7luvwmxdLV6g5e/BQkY312WD3R0DITcG+xZdH3pJ0iQ/BVC7vm6H
	xD4XEcFh6Tz+xc9fmh7EWz+TSJd78Iy/3CunemVWBzW+sOU40pyGF54Jkq2L8iDoDf0+ccp8tEI
	yxNFwSS9D14rjSuTzlEQVBrkuarHKb11No5ORDdyGzGZ0b3JwHkiKvpWYZqsN0mvqOaHFOGiFUE
	exN/7PkLjMmiyrtPQW5hSSbmX24d8u17l7QaUEmhaQeZAWoqxDy4TngKGHvuC7noxPthYYyTvmz
	4RZfkTN4zbww9GO2XJhC7RXLApoRglSa6yApbVgw3Y29j3ACPCaV53eXkPzG78SWq+kgLs80kvI
	l597vpbCY0rtRPU4Ub7WEcf8a5KtHgapwf2+lhO6NIv7wOCeQTIRAv+pbdKs35RhA9akHdFe68i
	1DqmL/F7HweZCdCekYACgldI+uKjyFM6IrDuLxRabScWaqOHctzCPLcq4UoYflACtX/OXZQapUX
	LGRAWHYhfurwuQkJnNVpqvS4u/61/GvEtDwEitRzY2KoiX4BIqV/D/17DI=
X-Received: by 2002:a05:600c:4e45:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49e7a68cefdmr192867445e9.15.1789476136431;
        Tue, 15 Sep 2026 05:42:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef28e6asm59524955e9.1.2026.09.15.05.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:42:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 14:42:15 +0200
Message-Id: <DLFWCJS821HD.20WLL4UYWC891@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/7] libpcap: Fix CVE-2026-0799
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
 <20260910051154.30595-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245839

On Thu Sep 10, 2026 at 7:11 AM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
> Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e8=
960a7108e9e828f9d7bdc7e97bdab841aec7
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../libpcap/libpcap/01-CVE-2026-0799.patch    | 87 +++++++++++++++++++
>  .../libpcap/libpcap_1.10.6.bb                 |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026=
-0799.patch
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.p=
atch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
> new file mode 100644
> index 0000000000..58289d7e3b
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
> @@ -0,0 +1,87 @@
> +From 3c55fdefa576c7a06feab86a9e4341be414de49b Mon Sep 17 00:00:00 2001
> +From: Denis Ovsienko <denis@ovsienko.info>
> +Date: Thu, 30 Jul 2026 13:33:41 +0100
> +Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter=
.
> +
> +Include Security identified and reported this problem as a potential
> +vulnerability in 2018 (case reference "I7").  Their work was sponsored
> +by Mozilla under the Secure Open Source program.  The vulnerability has
> +been independently confirmed only recently.
> +
> +The current revision of pcapint_filter_with_aux_data() can, but does not
> +check whether a scratch memory register index is valid in the "ld M[k]",
> +"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
> +is always the case.  This holds for programs that have been generated or
> +validated by libpcap.
> +
> +However, this does not necessarily hold for programs that come via
> +pcap_offline_filter() or [deprecated] bpf_filter() from an external
> +source and have not been explicitly validated.  If the interpreter
> +executes such a program with an invalid index, it will read/write the
> +process memory at arbitrary locations starting at the current stack
> +frame.  Depending on the address, the memory layout and the OS, this can
> +result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
> +fix this, in the interpreter reject the packet if the index is invalid.
> +
> +(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
> +
> +(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
> +
> +Notes on backporting to 1.10.6:
> + - The CHANGES entry added by this and the following CVE patches is a
> +   downstream addition to record the backported security fixes.  It does=
 not
> +   come from upstream: rather than import the upstream 1.10.7 changelog =
block
> +   (which also lists unrelated, non-backported changes) or claim a 1.10.=
7
> +   release in a 1.10.6 tree, a dedicated "1.10.6 + backported CVE fixes"
> +   section is used, listing only the CVEs actually backported here.
> +
> +Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/=
commit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
> +CVE: CVE-2026-0799
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + CHANGES      | 4 ++++
> + bpf_filter.c | 8 ++++++++
> + 2 files changed, 12 insertions(+)
> +diff --git a/CHANGES b/CHANGES
> +index cb603f8..74f8ddf 100644
> +--- a/CHANGES
> ++++ b/CHANGES
> +@@ -1,3 +1,7 @@
> ++1.10.6 + backported CVE fixes / The Tcpdump Group
> ++  Backported security fixes:
> ++    CVE-2026-0799: Access M[] safely in the BPF interpreter.
> ++

Hello,

Instead of writing a new changelog, just drop the upstream change.

I don't think we want to maintain the CHANGES files unless there is a
good reason. Since we will have conflicts on this file, let's make an
easy one and drop the upstream change systematically.

What do you think?

Regards,
--=20
Yoann Congal
Smile ECS


