Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D68C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 13:19:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web08.10975.1644326395033932299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 05:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ORQWHdnr;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1644326391;
	bh=pajqYJEoVXZ/2tm/V1dJeHSk8jJ8XWVDs9tYqj3zI/o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ORQWHdnriBicJgyIQEI04fyxMCsNkhPVBt415FEHjHU6+8UGx3TZyamZpSiQSpoVs
	 MHQAmlqmH50SZ6wDWYm2g44Ocpe1SlaYFOU+wwmbux8x1XwMcmE0vZMJeSgaslxeJo
	 7URS0/IGm95AnVZKKUY0Aj/rsBJYbSsllB5drTUs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monster.localnet ([95.88.58.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1oNw7i36fB-016eGB; Tue, 08
 Feb 2022 14:19:51 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: "OE Core (openembedded-core@lists.openembedded.org)"
 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <jpew.hacker@gmail.com>,
 Scott Murray <scott.murray@konsulko.com>
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Date: Tue, 08 Feb 2022 14:19:51 +0100
Message-ID: <2518421.NRruQZ00Rg@monster>
In-Reply-To: <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
 <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:H4Xr757grkeIIxvK8lyen+91mkuPMqeGHfDHs3xnIK9e9NRMT8F
 7qytw7NBZSOx95JO6lG7/ngEtI4WiPT37GVlcDDxFmMzvVVTI0cew3ne+PtRbo/MKD31mcX
 qJpjbGSWm35nejFPoxQQ5lSFfHCITxa4bYXwzRIEoyiv3ham1k45wea3mgOgkowc2bNoMfF
 UfO5LDKZysbh9wNe0yRMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J1r7gWc8wgc=:Agar6C2tybLBPTgxUrOmwt
 qzahpST3bT40RWDHIrIzmzfGV6ftWzbSB85XCqn2H3fppn4Nq/pqM0FsDzXTbtb1kyM0xwvTQ
 pXTCj+5fSU3nFPRmr9J+FuoXVUbq2VeUbDVkiA/FP/cAwTzutL1QTL1tYgJUWrxUslhsd6Wum
 WZYH0kxrJbP6AjT6uu+XFtLJEn0p5YEy53Tm24Ni7TKbtmyZu8cgCWF4On5gmbnH1a4W4/4NB
 RgxVasDSz/Zm3saV4g+YaOrYtlm3qdGNxHWoVIrTY+bvTCaU0TboVqrw2tlFNue80zufPnqA/
 Uli16ORshmUhc24RA+4V99BPT7jufgyVU71df49zkGhZCIkp7o47NMmf9NB6bE4gLCV+aqJxL
 DlanAbfVyQ/LXUMI50Ll0nqlI4h+Uw+3kahQtwQ0Y9+ZAnt7MquPxJNCw+CVvQL40Blvt9lYO
 OCkFaFgbYy5FL3NuxdzkgQ1Io8+F+W9MyHBTHC3MNfDwlIKOPxbIn+53u7N2lXDBKqAWiL6tH
 F4Vi/S84UolJLOZcXgy88S+ZRRldzqkk7x+LQGlH7XREPGs9zSbBWZDbAFUbj/6wQVhqc+uX8
 yzOJ31ly4yjgPXvWQP3jyUp4+sTWTseWUzELlYn6rMLOfe1ZlI+00IH4ZfqvmV9g2afOTujPK
 r202piOXm1caiiV1h6d3hXtVZjYJSz4oIoCh17TlmR9+BJ/evn31aRgAmPEiyXFf/TC9FAcMO
 f6CzYgptPDSZO53KsQude7ZjFhQ35TqyNYgoNvttLRJrxYUYjmcp1yVCr8wrPzzMf9CXhvgB1
 G5oA1JkR31CTRsMpk/YiWGim9ts4PKfmFCElnFd9xbISThForQuOX6y4pji6qa/oYpeZn8CC5
 fCUon6L4gvZFm1gGi0JWi6o8jbHj0/VsvucQsFXPDf3dBMuUuw4PsSuKE+Baq3bb/B9577Fx6
 8pGNnMPZja57oQHyp10E7BzBWoJUdbN0fc/fXrPDwqB8M3lVaJmkfCf4RblbLIOnGp/UK8tUk
 YsuhhkGiRuWmtliAgMugB+NVEZOcbtim5/EVEyqSBUs7UP6Sy/qqftAELkkDVpAYLg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 13:19:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161506

Hi all

> > Can you given an overview of what meta-spdxscanner does? I'm not quite
> > clear what extra processing would be required here.
>
> Jan-Simon can talk to it better, as he's done some dev work on the layer
> and done tests with it against AGL (and the subsequent Fossology instanc=
e
> experimentation), but AFAIK for the actual scanning scancode-toolkit
> does pattern matching based license detection, so in theory it'll catch
> excerpts of or slightly modified versions of the licenses in its
> database, as opposed to just searching for SPDX-License-Identifier
> declarations.  If everyone else is happy with the latter, I'm willing to
> believe I'm offbase in my concerns, but either way I do think the
> limitations are going to need to be documented so users (and their
> lawyers) are aware of them.

TLDR: meta-spdxscanner integrates with scanning tools. Either with fossolo=
gy
or scancode-tk. An upload to blackduck is also possible meanwhile.

Let's focus on fossology and scancode-tk.

a) fossology

Here we essentially integrate in the task chain and archive the sources af=
ter
patching to upload them to a fossology instance. All the scanning/processi=
ng
happens then on the server and after some time (a lot ! ;) ) we get a SPDX
report back that we store alongside the package. This is a result of a sca=
n,
so it might catch licenses of files deep in the source tree that may not b=
e
declared in the recipe and so on.

Also, fossology offers then a webinterface for manual inspection and revie=
w.
So this is a thorough but quite manual process. More for release work than
daily or occasional stuff.


b) scancode-tk
scancode on the contrary will run on your host during the build and gather=
 the
data.  It will write the spdx file out as well.


I think for us the interesting part would be to compare e.g. the scancode-=
tk
scan from b) with what we have declared in the recipe.


Best,
JS







