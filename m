Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B704CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:32:44 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14922.1790778755088942665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pHiqFB3S;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pDkXz40S;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 138F914001A4;
	Wed, 30 Sep 2026 10:32:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 10:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790778754;
	 x=1790865154; bh=ek3XjC+a0QW75WyXVxGXw+z1gZDC1/zeaG04oaNerNQ=; b=
	pHiqFB3SaOhRMFSw+m1ylK0lrhUKYgoixTzcKXKE6bYQj8pWyoiMuvF+FFXKSdlW
	mFiTGE0iolTVnJs6Uyz2gURMqEp8+EtMjVml+MqfnBieXst8hs4laWQwN4ru/BQB
	ah3tLwj/Fvv03MIPvAq+dhp+5/WP8NABQOy4wFsp083gAWD9KaY/CeUETy63YG1s
	WvUPPx8lneWLsVl+mNnDoJcDQalhIwbKuxzXsxmqFP14ouML3rV7If1DZQxoi+oN
	D10KAfWYbZRWAJzPoyxP9tiQijR6XSyJeZ73COcrjaBnmsRQ4cI7+4HQCoNz7J+o
	in/tKXQP2QV9XKwX0xsUMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790778754; x=
	1790865154; bh=ek3XjC+a0QW75WyXVxGXw+z1gZDC1/zeaG04oaNerNQ=; b=p
	DkXz40SEqFX+wk7aA1aserx77K8FPvU8qZtDUpIGrF5yZ+40diTjbOqLd1QpnZvv
	8ZZ07Rt1w0XpEMwhARJLu19rz4K7pRf5w3EBBJdrGWfwSuA7TtngamGxzR7oKaKA
	gr1Q6AppveF7k4vki8mgzUzqUarKFFL3OXleUQUrzTx8g2Z9JXL7Xqfou6qf3CXl
	DPoZBcl1I3xbfAxJQDmv1IWpQSkWMJeyPdyw66HQZpuktX4/M+pprEQ1f0vW1U6h
	6tTuDO6w2o9DK/hfoVMivhdGz5BJ6JnyISlnjE1nXrS7wdGIBQxm4aynRjRRXUv8
	ZJ6BSo1aXNpK9QNWYURFw==
X-ME-Sender: <xms:gR29ajXoRY0FlF8xWHcQ8v4NRkCMZO96UHXpa5slW4IA4v4iZaSOpQ>
    <xme:gR29ajB0Ea5kLm3qwQ_-pO9SBCe2iC14wj89BdtVOCoHHb0xY3YOVbeSeyt94-Zgc
    Tc4oBghK87BBOI8S-kXvPNBtefN3o2bVKJqk0Q-1SxCW6SXgvcJitKg>
X-ME-Received: <xmr:gR29asygj7zT1gtwnR_BGG9s6rapmMLju76dAjAYE9Rniu9YWvPwJR3rkjQBi1I7Pu3ePUhU2H8glDFUJfWvAVxjFQHHYl9-lv_J65E>
X-ME-Proxy-Cause: dmFkZTETqzg1cmQ1pII4+g6fTVIoj5XFIvrkZ2baUGf0jIwDCGQfs1+k8lyMZrw0YFGCu+
    KDYZr+DMANGKgruI0Cb6+b0hAFHg5/MGtASEKD+JGZEjjSgmMBRWuiAuADr1E3PjXNSi+T
    BtymhC0D51AN3J/RHDhX+eyX+pNRHiw33rw/EJ168hzKzrPiyGUXqs10Jq+9JhzPuuSA/v
    4xubnWNVENxx1ss6MmW08gLfjr4dU1DR+be4CsT/cIJulUnQq4EyZo9z8CeF5a2/AiLnfS
    EBGk83lQ8EfnvL806u/Hl9YW8jGTeVCSF6KfwDvTgLNUmoe7Rsw5DKdf/KCDvLWNkPQtYx
    7/LZVTDbTkqiSIDUZe/jttiNVEb4sqxGm7R6AEPofVP93s7NflcrEeS0lWPMXKcu5vqlsg
    Q5JjN1MBPzxzp4G47naCfy3iTHnvHNAFt0l8+3lnnmBO/3fVgfJVPtY4YOos/vt5YBuJ3m
    khNqqFN0R6PjGckCu/Bbzi1qNBIkIk8i9Q2wjE7W8HgwY8Ra5LLsWhXMJdOXSyHNFpnTk8
    F08mxHRMI36YEIvnrC6fjMYM5QVwdPrndfAk7FWe1nbQ2kgcNXP3YT4daoG6cQ4/+4ha0P
    s/cuvw6NOH9m/L8QDF2YW1noaoVKAuTrrxGINXejVVbAnVaB15LP3qk3KuzA
X-ME-Proxy: <xmx:gR29aoBCeWCJBcdQwv1aBLv9uUz8OgO0Z5pP7F_UfPQ_4Pkqz_Duyw>
    <xmx:gR29ahbMwb0c2mURDRRjZmeK4Gb6ENCHLDXhyd-Q0IkFJIQoc6QuVA>
    <xmx:gR29aogquStRfKnaBE_mZ_Kf3b73FECLnNKRBV90TgXS8c7jHEHV_A>
    <xmx:gR29ar5VQI39LzmMMppZ6vuGzXJmVZfwPATvDqgch7bG55WJ82yxyw>
    <xmx:gh29alLf1qchEMDDE2SgxJ-bhwcaCrBOUoWcSEOOCPX0iuQlUQILbAfo>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 10:32:33 -0400 (EDT)
Message-ID: <3438b4f12af316287bc2037cbf41981acd188000.camel@pbarker.dev>
Subject: Re: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls
 config is re-staged
From: Paul Barker <paul@pbarker.dev>
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2026 15:32:32 +0100
In-Reply-To: <B5F6MT.V2E3L5EIV0YI1@t-online.de>
References: <20260926191132.45145-1-f_l_k@t-online.de>
	 <CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
	 <GJB5MT.IT6MLUSWWCCS3@t-online.de>
	 <f463545abd207af98291ac45019a6f263ca4da20.camel@pbarker.dev>
	 <B5F6MT.V2E3L5EIV0YI1@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 14:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246975

On Wed, 2026-09-30 at 14:10 +0200, Markus Volk wrote:
> Hi Paul,
>=20
> I think this is generally a good idea and I can create a patch for it.
> But presumably this will not fix my problem:
> Something in the signature of perl-native changes, such as a class, a=20
> variable, or a native dependency, without the result changing.
> The taskhash changes; there is no sstate for it, so perl-native is=20
> rebuilt. After the build, bitbake reports the outhash to the hash=20
> server.
> The output is identical to the previous one, so the server maps the new=
=20
> taskhash to the old unihash.
> The tasks in libio-socket-ssl-perl construct their hashes from the=20
> unihashes of their dependencies. For them, nothing has changed:=20
> `do_configure` does not run again, and the old Makefile remains.
> However, the consumer=E2=80=99s sysroot remembers the dependency=E2=80=99=
s=20
> taskhash, not the unihash. It sees the new taskhash, removes=20
> perl-native,
> and restages it. The files come from the fresh build and carry its=20
> timestamp. Afterward, sed -i sets them to =E2=80=9Cnow.=E2=80=9D

Hi Markus,

I am struggling to follow what the actual issue is here. The commit
message in the v2 patch said "these become newer than the Makefile
because of a sed in: staging.bbclass:185". This is why I recommended
changing that to preserve mtime. If the issue isn't that sed call, then
we need to find the actual root cause.

Best regards,

--=20
Paul Barker


