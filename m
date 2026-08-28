Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEB2C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 17:56:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1051.1787939769164635924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 10:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K4x8dj+V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so962800f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787939767; x=1788544567; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q9rZgXgYLOo+UPUpKTcX/VUt7mltJ4pFLPfwnVCkD9w=;
        b=K4x8dj+V7Y7ctbLGjVJrXA5TBXnLhKscn4YM7eBdTk+ERzMl+zxTeaeFuPi9RXrUYQ
         Q5Ui0rA/7/h01zL+oY2rT5JYfSTPGpjmrRTPTaw7UuNPFMrw0/P0a1lfscgsE4uKm/t4
         L9sA/3XfHHv22hOcN2WHLADMSo7HKDZcNfNh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939767; x=1788544567;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9rZgXgYLOo+UPUpKTcX/VUt7mltJ4pFLPfwnVCkD9w=;
        b=pb6+pWyzwpmjTCDkB6HPwCY4JktCXhcDWPed8R9K1jV5ucEUfFsON/ggJe59OcINTx
         y4FTHIRtq0z4xyZXhkoVhqudc1y6J9Pd/ZgG8qnGtgDLnY7G8N9ZrgAj5ETxoVZskQU1
         3jEsftdCr1OytiiGAvXYy+vunUXuhIHNzrtW9kY7p3zqqp4W5wfTa3PnRNXktvq9KxE9
         j6ZA/d9RmyKLMWmNDskCzECeolRtUJ62BnFT3mnzvWoFNwONIZI2W2NGo4JyLW1/6CwZ
         vDALS/EdHBgWBze3F9rmxNWpDLLLPpGLvmepklZq6x6x5KNRpTZODNdwZM4nzIAdevcc
         RVCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJFlAw848hH+ImMZxr668EgGtczp0QFTfhwFKIhhh5z6qYFdPO7cKA5B4LIOWi4owo+j0dp/K5Z8fPejW5oUIgVg==@lists.openembedded.org
X-Gm-Message-State: AFuF++n8Kg88CYNcoEPXH9KLodqpkiEXSV1bwYi4esfYcB+U3b1zWime
	9k1peZdrUXxKxFCsPJx2PPy3gO1F7UF7p8syH3IEKAc67HtygoKonm3KmgOMGKuLxVc=
X-Gm-Gg: AR+sD13Xv1IDCM1R0m8lANt0cATrupfZwcBwrRnMsp13hp1xVkaLigN9sg44bUCcPxG
	xULyn6MyuPnFRcIhoE/rJrZGixNtwF7fFUQ52QLRdif/WCq8TZGyxFnqrPaVtKCiksdaPccpTiZ
	YJ9RqsWAMGpLIQFojdCneLucXKZJb2kVixYWFpGQxYSiTEdF262zMJjWwX4gmz+motploR1eK2y
	SriHtJuj/QKBW0PEDC3KFzzz4OIxNS6ughpPmzHTEXppic7nZFcVEK752aSUS1r0eeGtOd+xqli
	MK11gQuiKMzPHvqxj4uYmlC1TY44RdN86GuBqeaYmlXqlrELiuFPnwjoZsFYEXbgfsbx/7LN89I
	tUq6jQTRF0GD0oSuvQaOLdAzoI/i6rCKtooRvlKD2w+yaYX5Wvarx1SmOJYKekrqRXiKmF0McwZ
	v/ByiNR2ajqPtQBzsyds2UxnLbHHCkyU236PdiHeDXcGLJR4fsIkCMbyAIxAJDZ9hOnj8UXlh84
	WbT8YdWBrFmPJlMrjRWaQ3HxYqM4zI54p+fBR2pLVrO8r6LAV72sw==
X-Received: by 2002:a05:6000:25ee:b0:482:ea3e:882a with SMTP id ffacd0b85a97d-482eab75e7dmr25634059f8f.6.1787939767206;
        Fri, 28 Aug 2026 10:56:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1? ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33d58sm4614132f8f.35.2026.08.28.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:56:06 -0700 (PDT)
Message-ID: <78bca4cc9c3e7fd3014f22e1d1b9529480089a2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2026 18:56:04 +0100
In-Reply-To: <d6fbb4c3-6178-4f8e-9421-d3134793acb1@linux.microsoft.com>
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
	 <2326647.1787768749336187635@lists.openembedded.org>
	 <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
	 <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
	 <18CF75EE37DB8543.642712@lists.openembedded.org>
	 <e6874bb2ac2d116380c62b2295da246b79136093.camel@linuxfoundation.org>
	 <d6fbb4c3-6178-4f8e-9421-d3134793acb1@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 17:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244557

On Fri, 2026-08-28 at 09:46 -0600, Alejandro Hernandez wrote:
>=20
> On 8/27/2026 1:53 AM, Richard Purdie wrote:
> > On Wed, 2026-08-26 at 21:47 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2026-08-26 at 14:08 -0600, Alejandro Hernandez wrote:
> > > > On 8/26/2026 1:17 PM, Richard Purdie via lists.openembedded.org
> > > > wrote:
> > > > > On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via
> > > > > lists.openembedded.org wrote:
> > > > > > Hi Alejandro,
> > > > > >=20
> > > > > > Thanks for chasing this one down. Small notes on v3:
> > > > > >=20
> > > > > > The commit is tagged [YOCTO #15554], but that bug is
> > > > > > "reproducibility
> > > > > > failures with 'rustdoc' on rust 1.75" (path-length
> > > > > > dependent),
> > > > > > RESOLVED FIXED
> > > > > > since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
> > > > > >=20
> > > > > > What you describe here - artifacts differing by build host
> > > > > > arch,
> > > > > > causing
> > > > > > cross-architecture sstate matches - looks like:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 [YOCTO #16376] AB-INT: build system architec=
ture
> > > > > > reproducibility issue
> > > > > > =C2=A0=C2=A0=C2=A0 https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D16376
> > > > > >=20
> > > > > > which is still open. Could you retag it in v4, unless you
> > > > > > had a
> > > > > > reason to
> > > > > > point at 15554 that I'm missing?
> > > > > > ---
> > > > > > One pointer that may or may not be relevant: the 1.97.1
> > > > > > upgrade
> > > > > > (65271a5d3b)
> > > > > > carries an LLVM backport:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates=
-in-
> > > > > > determini.patch
> > > > > >=20
> > > > > > added for a repro issue seen with rust 1.97.0. I haven't
> > > > > > looked
> > > > > > at whether it
> > > > > > interacts with the SVH path at all - just flagging it in
> > > > > > case
> > > > > > it's useful context.
> > > > Hey Richard,
> > > >=20
> > > >=20
> > > > Sorry for the incorrect tag.
> > > No problem, that is at least easily fixed!
> > >=20
> > > > I'll look into these failures as well and send a v4
> > > Thanks! I appreciate the work on this as it should improve things
> > > a
> > > lot.
> > >=20
> > > > > I put v3 in for testing on the autobuilder and it looks
> > > > > promising,
> > > > > there are some rust test suite failures though:
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/build=
s/4472
> > > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/build=
s/4577
> > > > >=20
> > > > > and probably more to follow. We may need to exclude those
> > > > > tests?
> > > > >=20
> > > > > I also triggered the reproducibility test targets:
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/buil=
ds/3
> > > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/buil=
ds/3
> > > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/buil=
ds/3
> > > > >=20
> > > > > those builds are ongoing.
> > > One of these completed:
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
> > >=20
> > > which leads to:
> > >=20
> > > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260826-pla=
gtpam/packages/diff-html/
> > >=20
> > > There looks to be a locale issue, some python config tweaks,
> > > curl-
> > > config binconfig needing a tweak and a smaller rust issue left.
> > >=20
> > > Definitely progress, much fewer recipes showing issues and fewer
> > > binary
> > > ones and more text ones left...
> > Sadly the other two test runs looked less promising:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
> >=20
> > both of which have a lot of rust related looking differences :/
>=20
> Apologies, I got a bit confused, is the ask to send a v4 with the=20
> correct tag and then look at other reproducibility issues?.
>=20
> or are these reproducibility issues related to the patch and need to
> be addressed before sending a v4?

I'm probably a bit confused too. There are still reproducibility issues
in there that look rust related and I can't really tell if those are
additional issues or whether the original fix isn't working. I suspect
I need your help to work that out...

Cheers,

Richard


