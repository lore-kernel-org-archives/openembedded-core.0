Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC6C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 17:16:33 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1538.1790010992387473877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 10:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YrSeDXQ9;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so22590215e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790010990; x=1790615790; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtmEFYYSuURhKiur7ZOwIjTJA3GqofM5dYVA3xRFENo=;
        b=YrSeDXQ9ANSExXTaAGigm+oMM3NaRPd5e9yZgDWP9pj2msoWeZfXnsUCm/EEa22aN2
         Zn7H8X6TzbvR7C4HfgVdx+2PxoGH/W1Xn7MXNrv4YK+eutPtdsl4GCx1uLzoI2tjacXI
         Hf7OvbHVdX4ZGcrQUiNVr3Dhgu7hvfL2uG0W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010990; x=1790615790;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtmEFYYSuURhKiur7ZOwIjTJA3GqofM5dYVA3xRFENo=;
        b=wKzfph6i7ct+J2dPDUh8GvsQ48PP51AIdk0gzQ6EwyCxup8KzOJh1hO1uyEMAbMr2x
         kO+UWGJQZqiaYy3dVF9tKQBePVYJnfo8jjR8KaB8POqpwwlrZ6QylYRMwmfMe3ItYMgq
         /aIQisAE5nStcq9CBO9U0pTybiMUTRd79mtQ9EJ92OOcXG7CcC7c+iVnlPoaaQos1/iq
         EOtzE6gdaCZwtKxg38zQCR3r3+qx3kL3H9JzeZyeCr7V/n3pGBYFac16pBou6u9QESDW
         nfY71r3BmJDly9CFVAv/8oK2KIi2tR7XBJsoqlcVCUCVh4NfMGfJrF0XupcZKNwJhnH+
         gUlw==
X-Forwarded-Encrypted: i=1; AKwUvByGzKVtRV7qnbtvbW1aMTZJrggSg43reBIxzkOW61GEBnssyHyr/AtJQVZpgsQ/6Xju2V5Pb+g4WWMXnQT1Wz3iKQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++meFNeiKPPgyZIrH0MVyMvJU0weytms80MVuwvBnsv4YzexyZxP
	W8c7wwTRq5aGbIyQgAgQNl8ZSxvjM/zecqRZ5WFqiy1+wp7f5hhP+RR56NowhHL3WGFghOGyAjT
	xVx+Nsaw=
X-Gm-Gg: AYBFou0cj8d+u36P1ozHnkLVl5iVBUmf1VKEeUQV1PpWWugXwz9faY4Pxe7AnBAx6r3
	8kPa6nEUx7BiAeDlKHf4iAZrtOcizdw7Dg+nMdijyeBrmvEdVmeYytuxPgQGb6mdIT0eQiBjaMI
	mwBGKL0c6YnPvuXyHz7ZFa2KpwuEDhNpt7L/U4P2UWzN3sCQFw2SycRLmspOZjxqnkGzE9f0GMq
	PfdpALjK2RJa4JaCbvhsNqMkLCfPDpo9ZntQVJo1VkcX6LvXWj7iWPNu83g2TqPkLyMA1N6fFIT
	2lEJRqmyRQfjFf/Oc+oG6Skz+ybVy4v4/zZ/vHD26Jz0UeCvTf0KxQuZjm402beP6Cuz5W10Neq
	RNznMtP4tM0wYyqDzeQowoUBVR50jM3eKLgfJU8O5LSiZ/qBrqXjWXvMYWlnFOLWbf1m1DW1fVI
	Atgycxig+FiVUDH9nvuZOQcQR5Do6c3nam7o/lwLylgYijhSDJ0x8cDbIzyXanVvoL3xXrodxCq
	wCHpZ4czXwdN+t1ICdnI9HuZyP6MtUWkVBOIrhxjl0GFMCQYK5ijfQ0LHj5o/mV3l2ctjhf
X-Received: by 2002:a05:600c:c44c:10b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fce72e987mr71921735e9.35.1790010990457;
        Mon, 21 Sep 2026 10:16:30 -0700 (PDT)
Received: from localhost (2a02-8440-3504-3a4c-d277-8df5-ce7c-5c26.rev.sfr.net. [2a02:8440:3504:3a4c:d277:8df5:ce7c:5c26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8a636d1sm7542195e9.0.2026.09.21.10.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:16:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 19:16:28 +0200
Message-Id: <DLL5XRWWZM4D.2RM59FLBTVIJD@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch 3/3] python3-cryptography: Fix
 CVE-2026-69249
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260901092741.34198-1-vanusuri@mvista.com>
 <20260901092741.34198-3-vanusuri@mvista.com>
In-Reply-To: <20260901092741.34198-3-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 17:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246345

On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch according to [2]
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-69249
> [2] https://security-tracker.debian.org/tracker/CVE-2026-69249
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../python3-cryptography/CVE-2026-69249.patch | 349 ++++++++++++++++++
>  .../python/python3-cryptography_42.0.5.bb     |   1 +
>  2 files changed, 350 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE=
-2026-69249.patch
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-6=
9249.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-692=
49.patch
> new file mode 100644
> index 0000000000..a920b4a7cc
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.pa=
tch
> @@ -0,0 +1,349 @@
> +From 4a12cf49675a184e47f912b00b04f3a629283582 Mon Sep 17 00:00:00 2001
> +From: William Woodruff <william@yossarian.net>
> +Date: Sat, 6 Jun 2026 23:30:03 -0400
> +Subject: [PATCH] Add a signature validation budget during path construct=
ion
> + (#14960)
> +
> +* Add a signature validation budget during path construction
> +
> +This extends our existing NC budget check to include a budget
> +for signature validations. If a path construction exceeds the
> +budget by performing more than the allowed number of signature
> +validation steps, the entire construction fails.
> +
> +For now, our budget is 128 signature validations. This is
> +consistent with (higher than) Go and rustls-webpki, which
> +both set a limit of 100. Like Go, we attempt to make the "best"
> +use of our signature budget by ordering by likelihood, using
> +AKI/SKI match as the strongest signal of fitness.
> +
> +* Bump limbo
> +
> +* Temporary commit
> +
> +* Revert "Temporary commit"
> +
> +This reverts commit bcdb6808562a8b8f484f85d21cb201cfdb2bbbd7.
> +
> +* Fudge a coverage test into place
> +
> +* Coverage for the coverage god
> +
> +Upstream-Status: Backport [import from suse python-cryptography-42.0.4-s=
lfo.1.1_6.1.src.rpm
> +Upstream commit https://github.com/pyca/cryptography/commit/4a12cf49675a=
184e47f912b00b04f3a629283582]
> +CVE: CVE-2026-69249
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../cryptography-x509-verification/src/lib.rs | 209 +++++++++++++++++-
> + .../src/policy/mod.rs                         |   8 +-
> + 2 files changed, 208 insertions(+), 9 deletions(-)

When I compare CVE-2026-69249-signature-validation-budget.patch in
python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm and this patch, I get a
lot of diffs that don't look trivial to me (In particular, some hunks
about the budget handling disapear...)

Can you explain how/why did you change the upstream patch to match our
code?

Please send a v2 of this series with:
* URLs to download the Suze archive
* backport changes for this patch (2/3 also had changes but those were
  easy to understand)
?

Thanks!
--=20
Yoann Congal
Smile ECS


