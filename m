Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9535C4452F
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:48:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21837.1784638101710936730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 05:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iO6emq4y;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso20949575a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784638100; x=1785242900; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHIBrR5H/2/7teAny1wpkJI5ImRg8MSLixUrMhDxRzw=;
        b=iO6emq4yqSFDIiM7ADZFrjsfVSHUVqXbEX8lmVBeH2KcSOd8WG5l/Nd10NcV/2Lpwa
         oTxvj6Pocorhgx9W39H7jLRd4n1/Laook04vc4xdHkzw8H6Dg0/5jSvdsIp1X3X0ZZYl
         WNYQsRuitm9nDuWbZ7ou98c6Qk9RbnQzu4830=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638100; x=1785242900;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHIBrR5H/2/7teAny1wpkJI5ImRg8MSLixUrMhDxRzw=;
        b=WNMaCL1QLAVnnvZrTYP7k6/nY9A28LUrUQesq6lcxSUTcuI6ik+dgwIGNR6a1gKKB9
         OVhoIEjO2+xU+PcPxG7AoQknUHY473ZjUVcxcid2K6w1Fgj8X3lU1G2Bp1lOolubsv7C
         zGwK+zNm93sNtuJvXConuZr1EKV8t0b1hyEqzCIWLZAZLLJnYiVrtYy8Co39qSAIDQyX
         CoMqtyORj34KyRmvtg9/y5GROGHmM15S9RzW8NlOKOp52bctlz9eWAIokJWlgi7/fZJx
         cAWGGxqSwAeQsYWp6QsWq0A6/LOaV9QutSGb4Sox7CgJqrFfGb8Jz/3K15IHcQeV3aQM
         NKqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ICnzladIA0HbcDmDgAyuMvQLhNFl24cH1nDogBXDvbw35YioZ9O2Gv7ZaIxR1MMluTuqmYRaQqGwiMvyIWbtQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0hA3MYRLI6kGCX2k9JkgLirv9+Uy1UuG1Pbka8n22ab7b9+GU
	7BW3wQSMM77QvxwjW4dMmhFOlhaRK0crVzeTgqUTt8Biae6s7UQG4uevQ3HR02aiEEI=
X-Gm-Gg: AR+sD10JJysHvtRFrydjCpaEDAKpL6Nv1E/h9kis0yB9klAEKIC9bLI91IbqKL7k4ME
	ia1oNhlMtIY4SK4WjNPNdhaFmSiURtJQ0Y6OGCy0OMkX0DcqurCvz4CHNSWUZ2CW2v2lZfboI5w
	FiuHRhl5hNbUuiLBiRmhNLohHHzxr4SIOBL/X2VqmYQv2bRGYHzPvOKFE9yvR39qABVFAp4LCb2
	5jpXlCxsdi8EHqw8iQRg5DprYaSr+zEiVRzcJJvm1sSPwvwVfoOwvgWaFZ9ebEbGYViW8B3vzzf
	VPiL+ACxnlrQHj+QzTrYL2I0I/1k+bmKTFE57o5Fj8yZ3iPw7FG5od6RsjhvKmxDZuAUOFgUiJa
	Hlgf+D6Xg4hXBVvv2xwcDo4CgaL2UdzsYgcBD58Rl7M3n+aKz8Xtb/u3d+lhigkqtPKjcwLE9PU
	iyl5gssL998czLn37z5jVugCrgy+WryFfGGnXUUCt2yo0X69ldlLLRh13wfoGdeQ==
X-Received: by 2002:a05:6402:234f:b0:698:c1ea:c1f7 with SMTP id 4fb4d7f45d1cf-69e652e0448mr6775617a12.38.1784638099841;
        Tue, 21 Jul 2026 05:48:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffd0eeesm5812785a12.20.2026.07.21.05.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:48:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 14:48:18 +0200
Message-Id: <DK49EOI24BZJ.WD29BHCHWJ8A@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] libssh2: fix CVE-2026-58050
X-Mailer: aerc 0.20.0
References: <20260717135013.869197-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260717135013.869197-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 12:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241518

On Fri Jul 17, 2026 at 3:50 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-58050.
> https://nvd.nist.gov/vuln/detail/CVE-2026-58050
>
> Upstream fix:
>   https://github.com/libssh2/libssh2/commit/7c8a170c6dca3cd4cf24de836f43b=
a1a20e662d5
>
> The upstream commit uses the shortened private-symbol namespace
> introduced in commit 076838de2697a4185125bfd601fbcd6e7286bfb6
> ("src: shorten namespace for private functions and macros"), which is
> not present in libssh2 1.11.1. The only change made when backporting was
> to spell the helper calls back to the names used in 1.11.1:
>
>   ssh2_err()     -> _libssh2_error()
>   ssh2_ntohu32() -> _libssh2_ntohu32()
>
> The added "> LIBSSH2_PACKET_MAXPAYLOAD" cap checks were kept as-is,
> written against this tree's existing bounds-check style
> (s + len <=3D data + data_len).
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

As far as I can tell, this CVE-2026-58050 also applies to master.
Can you send a fix so I can accept this on wrynose and scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


