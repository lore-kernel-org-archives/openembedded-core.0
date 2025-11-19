Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003F3CF2573
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:05:32 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7298.1763525129190518119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyPBi40x;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64107188baeso5744379d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 20:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525128; x=1764129928; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+44w2sMYZpjxQnuj+MkHsf+tfJ9A1k7/b/39Bd+Q9AQ=;
        b=JyPBi40xyh2ZfUo2M5Thwdclfp9OHlAcHZf5xBy3aENHK/+hDcp1AM0HSbH/rBVMiz
         JjyXhT6gM/NEVhwwsTGZTI7qZ2oTm1dsY4/RkE/DYx7Jq7h36Vba+RZxSCdjNF76PoQp
         qQ0gkeXbMMxBCI+oyrUqm9klzgyQ5KPPCZCeuQmpbwIUu5bIEbbJzH+DEAzcD8wRMx0G
         pGw8wuOWspgqEOo6o5jiYnsU1OZGIcwnC2HETPLnpccb+559vF+wUaffGnIJdblKftSp
         Li3BnAnx2duysi0TEeruo0FSG9f7M2x4K+YEhL6gBV6XT50os7x4m21pC9NkD+uOngYu
         wtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525128; x=1764129928;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+44w2sMYZpjxQnuj+MkHsf+tfJ9A1k7/b/39Bd+Q9AQ=;
        b=urruvmC9cs5VvxItbQBeOlnKEs1CkAOKqDNEXhhZZIUKpdnekALmooLO4NY72JolUV
         G7rJriKGmW8ZnxJ9iZ2xXILKaQ0qvNGNVhsPIPs1GIa6BSmdRsjw6y7toEAHCX/hkUwX
         Fj/n303jxpPigdeGZQ2MEzs94KFzcBqillFexE8X4ol+MVqaX8UT+fohwVKhdEKzaQ1G
         bqS5Utbd0tOTu8X30fnw7S6ZjyWaTL/1xWDyyFRw64W6OcJtE5ub4Dfwl+B5NmedO0GE
         pTQvbdBcw7eNzwhuCkwsx3pDSKo+f0H3uyqti/Fk2Yc7/gVPmKuxrUZ5oIKysJqkhKkD
         H+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV/6EKCtSIibbE2eNIAGFmPnmSumnIE6UlLjoEB8BzOQewtrbYiU84G/DmrWZ12oDCTCdhqMwTU7Nd3NT03rG4MjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRC9MdeM4r4Ql9bKrGfUF0hu4zeS2Agr4P7HF6SZW/0XZpURuh
	AE3v+LlkZgwaRNEbcfsYo7MJnbu+R9QdmWMravxEZq18bb4U/nUcPiPLL6c4GIcqL4HkeJrj4k7
	gfpceq9f8WDrZdmadLh1G6mR3M6jLFxM=
X-Gm-Gg: ASbGncvIc/KJEKuoq5coIj1qZ16t2hMa2ZA8Xtz1Uq5Guz5MK5f7sQd1VpM0Ot2DTIB
	c5VUlXxMP0nBN7o1dRFVd8y4XqfKB5w8XzvqQSUUb0FqQUXaCLfDOEz2xNGTEBLXfmNhk9FIMed
	EWqNdTpTL5hTI/89i2k0DWvOyz0ZRXiR5kbtz/pN0w9I3jHVg+jc6qS4H13uoQ4SpbSW5SLUesE
	55Y7JSAbsIemiJnr0Wv5TrLForqH+TnxIsS8/xGLovv10cHex+IogORCZEHH2yJQzyylKd320Gt
	VzbjCGO1lVCblVjy8Oq1a7DCMZOX8o4YtFXlL67bzra+1ZH7p7gKbvLKukbrWPSy3YcpNQ4USo5
	/fvAPDQz3WCWtvGBZuym8gSsYjlq4xo8qY+/HFlz/YXDaRA==
X-Google-Smtp-Source: AGHT+IGYJCSIrvjkhjTIRrshfDeHjy1/emh5Pygc8RYP/4yklaHvBROQadvUeMN9ZtgEvndYmh+IUxyep/JoGl0Gk+Q=
X-Received: by 2002:a05:690e:1586:10b0:640:d092:6489 with SMTP id
 956f58d0204a3-641e7646c85mr12420010d50.45.1763525128210; Tue, 18 Nov 2025
 20:05:28 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 20:05:02 -0800
X-Gm-Features: AWmQ_bnHXthG_NM58SA7eqRSKhjKmhjjj-vr6uUpZHWtkXkZpyMvPSexYeRnyBo
Message-ID: <CAMKF1sq=PB-ahsheN4iCD9w9MzmnCwUUZxTmaCJNBVhYpwKm1g@mail.gmail.com>
Subject: Whinlatter ( 5.3 ) release and maintenance for meta-openembedded layers
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d1cbf30643eab09e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 04:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226537

--000000000000d1cbf30643eab09e
Content-Type: text/plain; charset="UTF-8"

Hey All,

Whinlatter release is in its final stages for OE-Core. Accordingly we will
be branching meta-openembedded for whinlatter as soon as the OE-core is
branched out.

If you have patches lined up for this release, please send them by this
week. I am also interested in ptest fixes particularly, if folks can run
ptests on meta-openembedded layers and report, patches to fix the failures
are even better.

Anuj Mittal has agreed to maintain this release along with scarthgap LTS
that he has been
doing an awesome job with. Ankur Tyagi will co-maintain whinlatter
alongside Anuj to even out
the load a bit.

I will send an update again when the release branch is created.

Thank you
-Khem

--000000000000d1cbf30643eab09e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey All,<div><br></div><div>Whinlatter release is in its f=
inal stages for OE-Core. Accordingly we will be branching meta-openembedded=
 for whinlatter as soon as the OE-core is branched out.</div><div><br></div=
><div>If you have patches lined up for this release, please send them by th=
is week. I am also interested in ptest fixes particularly, if folks can run=
 ptests on meta-openembedded layers and report,=C2=A0patches to fix the fai=
lures are even=C2=A0better.</div><div><br></div><div>Anuj Mittal has agreed=
 to maintain this release along with scarthgap LTS that he has been</div><d=
iv>doing an awesome job with. Ankur Tyagi will co-maintain whinlatter along=
side Anuj to even out</div><div>the load a bit.</div><div><br></div><div>I =
will send an update again when the release branch is created.</div><div><br=
></div><div>Thank you</div><div>-Khem</div></div>

--000000000000d1cbf30643eab09e--

