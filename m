Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571B1CA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 08:30:30 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6767.1790929827509214940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 01:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LmOjJI2/;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso13203205e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790929826; x=1791534626; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtUDVLNpFf4oDMUKSLCGfZUmfvpiHN0w4OiqkMI+9Us=;
        b=LmOjJI2/QaBDcnHOaWnC6kWlctFgpmxSti96YT74rIK0yD7HXcP1BF6bfjCuNlHoBw
         c/7wSfWEZnn91qzdAMHq+sCyohKJJpVpqDQkk3bSfsxHRVuIKtxvWVhyyOUkKui8alg9
         3Mad335StVmvpI5If+N7FtlQG2Aa9gHFaASqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929826; x=1791534626;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtUDVLNpFf4oDMUKSLCGfZUmfvpiHN0w4OiqkMI+9Us=;
        b=Us7bABLIp7C9gc9WgUUrS5G57wae47ckL0J1NeaCxUu4LFSK5EuffbYa2I3TqRvrLy
         nETV/gx4L4JYgWJfjJraphlzeZB/C+IJdjXsQFbKP7CI6pXwQKkb4LlphzbG80d22sWb
         BxXADQm3CDZYJc4dd0Vr/QrWSHX9eJzwlltsdlznWyfC7RkQgxmn4v/XZU2MJUCQjM1J
         SzLlAkPHtmSRCnV2U+VIJPFosTPhgHgWctpIXsvr50Uwoe40rWxj+TZIIa3WLCPafZT2
         vNqD03cryd7XwpTDVFsxx4ZIMtMXX4ODZ975bUXXzE1OQrAPu8rybHcbkRZmhxlHKZ9l
         Bgww==
X-Forwarded-Encrypted: i=1; AKwUvBwniAE/WePv7MXKA9oR4O0WJIIrBsaODceCyLjLTKdv3yyCzlbpBWYCOjGFkNqGFFOGn1wfNPO6rKGC3BV2nME+Kw==@lists.openembedded.org
X-Gm-Message-State: AFuF++nLAjaCVTeAJflEZUyoxvgeCEn88hrvlH163OULgV0Komb375aA
	MDY9rKeUe+QIU0Cu/zKZBaI0XUpXbhvEsh0v+zMPQOouB40IwThCN+qpOSjTWWXX1zlUT3xjCp4
	0tJQMgLI=
X-Gm-Gg: AYBFou1B8abx8bh1OoADMrt4TLr3f0XVQZNJi+tV6EHLDbcKmNJYi/v2IEvB6Pj1fJ7
	00x30dgvcyYm9LAaKk6VjEYUBvx5+T+ycyiFKKftIzStdoFKBocA2OzhQeEEDln1nXIpvOKMopG
	Tbb1/LqM2zuOpwCsPPlmJQrEnU+Mz/9U5hEeJ9mdrfTl5d1noecNlIj5kcJrWsV6QHnVXDo0Agn
	1nmmhNqdLY0GoAB8ERiZTs8ykfytD4RuupN2EK4jH63rarwWKqJWaOUujjzboPz16qdEApoqoy+
	3j6SihnSUlvmYS6pQudBA74/cOqD9PlVZzqfWeRKIHnvZblLLC+yHmQcf2RwrKj+LSlgG28seXM
	Gma0XGYPiAvfmCpuqYHmB6mCHJT5eZjPXewpv9P/uZQIVSh90yKtBjxXtBOK9KYLZ4VZRXJyk+S
	nN4FZgO0IeUjdWtY386F6Gl53eG6n8R6xxVecZi5Khw7BAoqHD6g17x2Lf/gWqqkq6M9UhtRFAZ
	0g7nRoIUSWjYxMPSRFD6LFX8lzYsYeGz13Rp2e5PvI0x220S+9AaJBTtEANnFADS0xRAapn
X-Received: by 2002:a05:600c:8b77:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a0274bcb29mr33608675e9.2.1790929821033;
        Fri, 02 Oct 2026 01:30:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm50939015e9.13.2026.10.02.01.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:30:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 10:30:20 +0200
Message-Id: <DLU7MXCRDG6L.3GEYY13WESLNP@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/7] libpcap: Fix CVE-2026-31912
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20260921201715.79085-3-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247090

On Mon Sep 21, 2026 at 10:17 PM CEST, Jaipaul Cheernam via lists.openembedd=
ed.org wrote:
> NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-31912
> Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/d3f3=
58d3cffbe1ecb94d5284b3e81f052a0adcb9
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../libpcap/libpcap/02-CVE-2026-31912.patch   | 525 ++++++++++++++++++
>  .../libpcap/libpcap_1.10.4.bb                 |   1 +
>  2 files changed, 526 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026=
-31912.patch
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.=
patch b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
> new file mode 100644
> index 0000000000..d9fda1ec48
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
> @@ -0,0 +1,525 @@
> +From d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9 Mon Sep 17 00:00:00 2001
> +From: Denis Ovsienko <denis@ovsienko.info>
> +Date: Thu, 30 Jul 2026 13:33:55 +0100
> +Subject: [PATCH] CVE-2026-31912: Mind the program bounds in pcap_offline=
_filter().
> +
> +The current revision of pcapint_filter_with_aux_data() does not know the
> +number of instructions in the filter program, it assumes the program
> +counter always remains within the bounds of the provided filter program
> +and always reaches a return instruction.  This holds for programs that
> +have been generated or validated by libpcap.
> +
> +However, this does not necessarily hold for programs that come from an
> +external source via pcap_offline_filter() or [deprecated] bpf_filter()
> +and have not been explicitly validated.  If the interpreter executes
> +such a program and advances the program counter beyond the last
> +instruction, it will be interpreting memory space after the filter
> +program as BPF instructions, which in the current implementation will
> +eventually cause either abort() (another commit addresses that) or
> +SIGSEGV.
> +
> +To fix the latter problem, in pcapint_filter_with_aux_data() add a
> +parameter for the number of instructions in the program and reject the
> +packet as soon as (or just before) the program counter goes out of
> +bounds.  Update all incoming code paths to specify the length; also in
> +pcap_offline_filter(3PCAP) make it clear the function now requires the
> +'bf_len' member to be set correctly and uses it.
> +
> +(backported from commit d1209988c74dd9330659898d3b676ee6bbe1c551)
> +
> +(cherry picked from commit d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9)
> +

Hello,

> +Notes on backporting to 1.10.4:
> + - Adapted to the 1.10.4 pcap_filter*() names (renamed to pcapint_*()
> +   after 1.10.4).
> + - The upstream CHANGES/changelog hunk is not backported.
>=20
> +Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/=
commit/d3f358d3cffbe1ecb94d5284b3e81f052a0adcb9]

This also drop a pcap-haiku.c hunk. Should'nt we patch pcap-haiku.cpp?
This was before it was rewriten in C.

I may have missed it for the wrynose patch but if a patch is needed, could
you send a fix for wrynose as well?

Also, please check that the backport notes are exhaustive (e.g. there is
also a missing man patch for which a note would have been appreciated)

> +CVE: CVE-2026-31912
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

I'll hold the series for now. Can you check the above issues for the
whole series?

Regards,
--=20
Yoann Congal
Smile ECS


