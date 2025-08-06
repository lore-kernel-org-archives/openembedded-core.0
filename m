Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AA8C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:31:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.28430.1754494256441987557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 08:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GUPIw2zp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso347515e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754494255; x=1755099055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wzb3Hd21L8czkx31IkpMjwkE1rnhRIzhapIrNhlUr4=;
        b=GUPIw2zpxLKBLnGnezJF7B53rZgWzdXOCuBmn6VCj6t4NV7Yr6Yrfndt5la/lmkEXx
         m91GyBkwJtDo+Li20MKN2r7oxNVv0TFR4YfBUnFin9uvF3ScQG4nKC+YsFZHUm9c8y9P
         EHSD41mblHyRCBMuxfIJYBblGP1AG7tzVneC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494255; x=1755099055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Wzb3Hd21L8czkx31IkpMjwkE1rnhRIzhapIrNhlUr4=;
        b=T9bJ+g3SlSzFDmMeL+HhttWC/HisBAoKR6uxIbBaz8WeA7rChG4gEISq6VAnCnDMbE
         Sz6CjbtGZzHOLkj+UunbBgHcI2aM6sWs/WMWoBude8Id1uILwkp+LzqOpYr1zVQl2fcS
         ytFHNW7QpolL6KTdAOE3SzCZxCOkSjMs/ootsuvccue2bwuhhAZr13h/vVPrgyvOt7eQ
         VNsedbiKqJLUQKLFLphwIsbqCh7au5EdirKOS4GQMawCeaXxuFz6l0+oHQLQSC0RuPZE
         jddBB2g881GuCa9Z6gCVJtM8OymwxDTQBHfKlTSLbEkotM7S2kdWVcdzLDfgIJTwO+9X
         dbuA==
X-Forwarded-Encrypted: i=1; AJvYcCVpi0kLlYhGl4FdfmYOOTmA11JdX83Xmv4T+ehABOuBcat4FUyFS+jHCKBk8y8bwbJwkfh0xmfvJgLCt0CoLGPrig==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9Rv0wGWyAgM46LttO3oc1kMQI8q9bBxVA8vSqx845sBjSsV7O
	QnouHq2KvW56K91/z5nzClfV4xHXmV4WIp3yscpabEcpBwc+U3l56nE6bM+4Xmd9SDQ=
X-Gm-Gg: ASbGnct+Xh/B0/P65yiGVIPyUevi3stpzWK+M6h+couxEEreZuS0r2egu37XcD6ReGG
	Rs3gOOYke3FR4LPur820SLDOXJ1Jdcq1j+5J8rUq7jsuRqa4G1UfRrh+gEqtFUhrB+L6GZ4NRSP
	pEl/UH+pvu2zDo2QbrZPcXRMs5GmguvGePyzNBIDzq0Fc4GydOBpoQeWKngT1OWCH69WtQiUnCr
	15lw6FW6A803CkAzk8ehiGtCc/FLAuiu5SaMLqg3ExDVCTESs85MkVQIirezbZoI65N/F1KolUg
	6L+bPsCtwcuOJ+6MY+hJmfI3lIntMC+nBRgrJxv42GpyLPszLdWdKjCmEvuiwX4nOa76459P7nA
	LECq1bEtmR+c6AkVuUSCGS7XLT5Ah6gktB4Z3REKdmF7HKzjBWONaQsJ7XWBwx7HyQtDiOtxnS7
	PA8qjMwud57VlGlqNmGjW6cw==
X-Google-Smtp-Source: AGHT+IFRJD7PinVQLwfluc+6dulmzqwNF/fHj14rFmeejUONhOZYrWgsnEFSwU5xwdyFMguo68MpOg==
X-Received: by 2002:a05:600c:5247:b0:458:b4a6:19e9 with SMTP id 5b1f17b1804b1-459e741e79amr30371645e9.13.1754494254626;
        Wed, 06 Aug 2025 08:30:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba4d:97fb:bf3b:8a21? ([2001:8b0:aba:5f3c:ba4d:97fb:bf3b:8a21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e577d0f5sm54389905e9.0.2025.08.06.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:30:53 -0700 (PDT)
Message-ID: <e84dbd8f49bad1341c7b324331e1967c698a0068.camel@linuxfoundation.org>
Subject: Re: [OE-core] testsdk/testsdkext ooms with latest master
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Aug 2025 16:30:53 +0100
In-Reply-To: <AS1PR10MB569761B05E52826DC02FD4AEFD2DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
	<AS1PR10MB569761B05E52826DC02FD4AEFD2DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 15:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221544

On Wed, 2025-08-06 at 13:20 +0000, Peter Marko via lists.openembedded.org w=
rote:
> Hello community,
>=20
> I have already seen some discussions about oomkills on AB during last cou=
ple weeks.
> When I have updated poky 458c39ac1f81932bb92afaef098ea618c54bb737 to 9037=
10ab5c4ea3c13dd1abf5accdefd27d3a5bdc I observe the memory overuse also on m=
y machine (gitlab runner in VirtualBox x84-64, Debian 12, 16 cores, 16 thre=
ads, 32GB RAM, 50% zram).
> So it's "only" 242 commits to inspect what could have caused this.
>=20
> What I have from the events is a screenshot of ps output from the moment =
when the gitlab-runner VM died.
> It shows that the testsuite is running cmake with "-j" without number.
> This instructs it to spawn as many threads as needed (e.g. thousands for =
big projects like clang).
> There wasn't any eye-catching change in the 242 commit diff, the most att=
ractive was cmake upgrade.
> But it can also be that Yocto always did this and cmake 3.x reacted diffe=
rently than cmake 4.x.
>=20
> Does anyone have quick insight which part of code is involved here?

It appears to be our fault from here:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/sdk/cases/cmake.py#n45

Cheers,

Richard

