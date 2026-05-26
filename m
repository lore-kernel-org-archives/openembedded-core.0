Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE4CD5BD1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:14:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33240.1779786856213935802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 02:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GQwycUav;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso47431685e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779786855; x=1780391655; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icNNw4dQAjIWJrPDzj++Q4i0hcsvQlOSFLPr2W74wt0=;
        b=GQwycUavIHjAryvi1lYoQQ/w44eRC717KPL+h6XL0aDEN9DfOO1C/Bt1+ITVz+WvZx
         SqUyu2A/EInKSIHLvJ2P1YpTJprcnhrvEvEkRIX55UTxzwo2gKZLorZtIDr1IfsiR355
         h1CYSRMkEK+q1xuZT18lhvDZFzP7siAydemIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786855; x=1780391655;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icNNw4dQAjIWJrPDzj++Q4i0hcsvQlOSFLPr2W74wt0=;
        b=ar62zhG1yMxKb8SwlCB6KMnDzqUSZ/86KrcGfDMErSsSwy2Ng+PgzGKduXmxKCDKcO
         1E/Pq3TgvcpT8s7XV9AUyvYVUpFGp0uiQ4HsFOHnMfMZTxA7fVJG1EBRiLUbpbXby9bk
         o+lryNbnGPAS3Pfvtk5h8TMMT+emUM+PKqHrM+OJ80Q6MbTj1tJlMEgitq0Nhc9eebOe
         98zx2ji+kHpfY/o+ACzRAFpBteHDqmb7cOfxipXdhqKU+rClr0RE7kvmGHPx6r7zlOtQ
         7CZvvjISD+KQSHhl3lPq1g9zCrQAfpXUrZ25zhqXTL0EJyq5F44mxSCp8iSJ1vJNBSnH
         UI3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cxRc6LNScSngbv5YgMF84PvkQ0+uam+yEa8bqM7T6VrK+9NYMveZq2qT0NC0zpjMoHd6RefbcOh7/WiTGEN6I5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw38cZu+tBj6Tt+zYMs1X5PWmflgPmunKk3fPROziZsUpDNM46G
	LiOe2sR04dC7CzfEqwlZfmHDnbknLajtmDxTKnvNmtMRUJfATVyFoqQMZ4AFQzIQaoA=
X-Gm-Gg: Acq92OHkA7G5Uc/8leVknf3dCFPKVAf7C3gaOiVUbGkmjqOfMJM64ovE8xsmuS+7q4n
	hqkEILVVKu+F+6DffUxrFvzBdPmmk+zpNeVaA5pO2PvDcaT1Ya4tUNA8Rpz06uP5KusUqXFZSt2
	XgMtEwVl61Dpyg4LYwYaYNrMIR+TrupZnImp7Sc0Yu5dFsENjuaownhAMbspUTEjpywbn/QjoMS
	/44RZ9OpD3on8Ib2ne/zDUYEetcII//P3bjCPKE94HkH4FRnW5ZHvrgPVIr2u5Phnw8LZpwqlND
	eKXtDp6ZMCkAGAQcSk/R5yyL6jSiwAxeyGJnIx86ZwJOJtdCYJJcexDZVqlJ+4BI38qwqTFyC/D
	D6g2IHZDUT5U8fRcQVDkywBfqm4WmrC5kVpJYY06CQ2hl8xd2N+4ow9pxCMSquvyBbfd2OwimzV
	skezsSeLtAFi6CBuaPSofWjlu8fATYHsm9Gov7is48p6cCKXElMoRwPJzQJiEd+lXIbAvGT2GD/
	DYdcdA6/+lcfuBYSFDXAfrG6/E=
X-Received: by 2002:a05:600c:3541:b0:490:6e12:542c with SMTP id 5b1f17b1804b1-4906e125469mr77163335e9.23.1779786854635;
        Tue, 26 May 2026 02:14:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e34:2d9a:782f:4147? ([2001:8b0:aba:5f3c:2e34:2d9a:782f:4147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm35900073f8f.33.2026.05.26.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:14:13 -0700 (PDT)
Message-ID: <cbd8c966d8bb4a79a83a79e6e71892ef2fdf48f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xserver-xorg/xwayland: 'Clarify' xserver
 license
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2026 10:14:12 +0100
In-Reply-To: <DISF3NO6O6O3.2L721ZD94ZUN9@bootlin.com>
References: <20260521154434.2273692-1-richard.purdie@linuxfoundation.org>
	 <DISF3NO6O6O3.2L721ZD94ZUN9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237589

On Tue, 2026-05-26 at 09:08 +0200, Antonin Godard wrote:
> The autobuilder wasn't happy with this change I think:
>=20
> ERROR: xserver-xorg-2_21.1.22-r0 do_populate_lic: QA Issue: xserver-
> xorg-2_21.1.22-r0: Failed to parse LICENSE: MIT && Adobe-Display-
> PostScript && BSD-3-Clause && DEC-3-Clause && HPND && HPND-Netrek &&
> HPND-sell-MIT-disclaimer-xserver && HPND-sell-variant && HPND-UC &&
> ICU && ISC && MIT-open-group && NTP && SGI-B-2.0 && SMLNJ && X11 &&
> X11-no-permit-persons && X11-swapped [license-syntax]
> ERROR: xserver-xorg-2_21.1.22-r0 do_populate_lic: Fatal QA errors
> were found, failing task.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3808
>=20
> I think it's "&", not "&&"?
>=20
> This was seen across multiple jobs on a-full:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3862

Sorry, yes. I got the patches mixed up with trying to rebase the
xwayland recipe upgrade and the wrong version was sent out :(

The correct version is in master-next and I will resend it.

Cheers,

Richard

