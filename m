Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC987FF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 07:59:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38096.1777276789770087924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 00:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MU8JQHcR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-441209fb77eso4247012f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777276788; x=1777881588; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/hsxvJTn/ekGbhJSInJHDawyY5sU5sD8d9SsaaabQc=;
        b=MU8JQHcRV4JoRqIG/Kq7oxDQ6T4/Q3Nw81tVhSqmpZ1kQyTb6iEJiW3Y+SkoaQD8wK
         pjkqrR/y9XCSzVSebigtRibKu51gEMaiSoIKhLz8ABXolyvlmstSYepfitG4sO7xFTtC
         9rdevjdoOEfqUeo+sGzrFVtCZ6b+rQECp5Kiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276788; x=1777881588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/hsxvJTn/ekGbhJSInJHDawyY5sU5sD8d9SsaaabQc=;
        b=QFKjqzw5P1D0VAkDww9/yIQbZc/iA/jRTV8quqLAuC3gomoVN/Eu+H5H5k8vRmCN7J
         JQpdTvHL8eg/i9xtUi5kvzPqYUjh8f00MzBc9sfcqOMwWd6JcbrMmqzbqLx1YBonG2Yz
         WDFne2dtDMbYSyPVFUGhhfP4uRA10mhy4QkQTJUa5E70qwu9zU+GFKWf8UmPlAyhXKP9
         mEsAPepBGUUrUp5ZV69e03pA8zxjb5+hKUc2A8gMn1GCtrgPjIRApyIWe2sRhyYZR1lK
         D+WZ2FO/NPleWpvmXiOoNnLcnNsWr0j1gXvCxIcGAu0O7rbmb1RnkGBbpNeSgo9WIYtg
         m0+g==
X-Forwarded-Encrypted: i=1; AFNElJ8WFvHF2IqqhPh95bcx05iqND28tbFpd3IBL3ntaorPy8tkLeUZ5G2EKxTJQTtcsYy+Ih21M3lrIkMrIuC7Ghj46A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUttjTmjPzb6RV3IspsKnFsWau3Q9savhJD3eNJhwmd3KZHMRn
	pl5Pe+sYCOpTjW3Sgb3mDEOBGyAJIQYxIoarQfG2e1+XGgM1mAN4k0zCG9bWFhsRzBY=
X-Gm-Gg: AeBDievYNK2EumzpGjKqOl58m+XMoYd8kqbhnEEdUtqK0txxUz0qcjmLLJMXq3iuzqf
	ZCS0lyLkKcOhxHY701oL6G/XbWE9pixNn5F/uFThgP3v9vsDkhbL1NU3q113eSCV68X5HIqchFg
	PyZ2vK2WTYZZ27KoLmla2dJxxIP6NB2tsCKtK/wxdpqDh5sMzihAokz+Wjxa3Qf57rB6dn+/Rn1
	iSCGnlAXHAno8/HxLlk6n1tsEMJbnM2uS+thG1bN9Pu4bDNV6XdhD+595rLL4NRFFWmljf8ekdz
	X2McteLdONRi2mHxmvYcYynWZN/Ef8/zBI7ZzOTMlEDJjE8MKCcXPiGAD5huz5ce6Wa+5sUNlIy
	TnFt5yjhvumWf/E7M56yghcz1CSeScOe5IXq4psFOkGJGAMdJt6L8VfMwnlPlXydYBsnrt7Fxx+
	lc55ryYxwtzcph2XEXKKn/aohI7MRd1rWZkW1SnnYq/32U1lJGrObiFx0yXaAEeMRIQRctQ9OLt
	z0b9gMc2p7YHpf3REMDQPk/+xM=
X-Received: by 2002:a05:6000:41e5:b0:43f:dd8e:869a with SMTP id ffacd0b85a97d-43fe4032b3cmr56562636f8f.3.1777276787860;
        Mon, 27 Apr 2026 00:59:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b? ([2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm78135601f8f.19.2026.04.27.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:59:47 -0700 (PDT)
Message-ID: <2b38a0354bdcb17270f8ce97db3eca2835320b3c.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Marko, Peter"
	 <Peter.Marko@siemens.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, "jpewhacker@gmail.com"
	 <jpewhacker@gmail.com>, "olivier.benjamin@bootlin.com"
	 <olivier.benjamin@bootlin.com>, "antonin.godard@bootlin.com"
	 <antonin.godard@bootlin.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "thomas.petazzoni@bootlin.com"
	 <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2026 08:59:46 +0100
In-Reply-To: <7o6_XKvhQ267WrzPXGIUdQ@bootlin.com>
References: 
	<20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
	 <20260422-update-sbom-cve-check-and-depends-v1-1-4646f840ce48@bootlin.com>
	 <AS1PR10MB5697161BED467E81C606A1D7FD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <7o6_XKvhQ267WrzPXGIUdQ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235990

On Mon, 2026-04-27 at 09:25 +0200, Benjamin Robin wrote:
> On Sunday, April 26, 2026 at 9:22=E2=80=AFPM, Marko, Peter wrote:
> > I have sent ton of new false-positive cleanup commits this weekend.
> > For many I couldn't find any explanation why they reappeared.
> > Since there were also new true positives I think this is fine.
> >=20
> > But there should be a follow-up investigation for most of my
> > commits to identify why those false-positives appeared and if the
> > tooling can be fixed.
> > Peter
>=20
> The current behavior of sbom-cve-check is documented here:
> https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-applicab=
le-cve
>=20
> I don't think that the tool is not currently working as designed, but
> maybe
> there are wrong entries the product database. Also maybe we could
> improve
> the algorithm to try to reduce the number of false-positives.
> The main problem is that the current state of the CVEs databases is
> not great.
> This is really not an easy problem to solve.
>=20
> Most of the time, the proper solution is going to define CVE_PRODUCT.
>=20
> If you have a list of CVEs that need to be investigated, could you
> send it.
> This way I could explain or investigate why there is a problem?

One idea in the back of my mind is our own "enrichment" data.

Rather than recipe fixes every time, perhaps we start maintaining our
own supplement to the CVE database data?

That might be useful to others, encourage collaboration and perhaps get
the upstream entries ultimately updated?

Cheers,

Richard

