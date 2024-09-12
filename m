Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EF3EEE25C
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 20:37:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.58431.1726173458677113126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 13:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WRCiOO7L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso13208975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726173457; x=1726778257; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VLUV8InVHwGyv7SzvniwyQRL0YaHQhAe1j12XPA2TsE=;
        b=WRCiOO7LypPzwh/4tbltYk3odv766Qzd//tDaiEloydWlO3drCO65VIx6clyHKD5MW
         Ua2TRTXfIhrv2AWAQa/uL7XS3CEChcvUXIATQDX4iH+RepjF57K0LoWE+qrtXAdoxLVA
         vW0Yed0Uq+cTVse40WDIsyf4bmQKwDaPFUduI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726173457; x=1726778257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLUV8InVHwGyv7SzvniwyQRL0YaHQhAe1j12XPA2TsE=;
        b=OdHD+A68DYGePKGoOnljnIZ6H4ZafybmbBzDtCQF6G4XIEVVQu/17ZZSPeTCzby7eN
         j+haoOZqq9szFTBdkZ92K8TlkAXD6pLuANfVdWcrCIeXcQabvgy2/7Jtmv8CRL0Z7o1A
         zIifuvtCUVNWuHrahO5SoaJTCAZkui6ah/aJH7VnRXV6PDUTPnseUQRjowduB/b4ULDj
         Wlcix70iAuoRFeAGNgBcitAvsvo97Q0GWmPlstGhtEuQpOKFII+POkJ8O3dAlSqqT//8
         1t7HQ/DAUlLPbPx3ZYXES/d2Xpna483qW/a/Jode3uk0imyYqHhmFnv0XGGuNqqwr2Bq
         4bXw==
X-Gm-Message-State: AOJu0YwlHJ+L3D2YUc1CTIww3bV3VRMfqbLNp2SLxHxqwgkSA61cMkB1
	Sj4p0QcVDbre+ARW6v8gOBIq0W0WaLPDNy3nt6zJAG+bDAdyiOaCBT5wqxqG1DY=
X-Google-Smtp-Source: AGHT+IE5fiMyPxy8t4O2B7zw4Y2NavPNmH9udkDaXsQPXBfjtQLi9Uzyf45Q/omdGeDFDcNpljgxtw==
X-Received: by 2002:a05:600c:4f03:b0:42c:b97a:5f7d with SMTP id 5b1f17b1804b1-42cdb509fc7mr36823815e9.7.1726173456620;
        Thu, 12 Sep 2024 13:37:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d743:6685:2831:83f1? ([2001:8b0:aba:5f3c:d743:6685:2831:83f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05d6fcsm2607535e9.15.2024.09.12.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:37:35 -0700 (PDT)
Message-ID: <1a200c1f80a7f227a6280317ab5492e9f5d7d22e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2024 21:37:33 +0100
In-Reply-To: <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
References: <20240912165736.1531460-1-ross.burton@arm.com>
	 <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 20:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204463

On Thu, 2024-09-12 at 18:29 +0100, Jose Quaresma via
lists.openembedded.org wrote:
>=20
>=20
> Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> escreveu (quinta,
> 12/09/2024 =C3=A0(s) 17:57):
> > If user namespaces are not available (typically because AppArmor is
> > blocking them), alert the user.
> >=20
> > We consider network isolation sufficiently important that this is a
> > fatal
> > error, and the user will need to configure AppArmor to allow
> > bitbake to
> > create a user namespace.
> >=20
> > [ YOCTO #15592 ]
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > =C2=A0meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
> > =C2=A01 file changed, 24 insertions(+)
> >=20
> > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-
> > global/sanity.bbclass
> > index 1d242f0f0a0..72dab0fea2b 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -475,6 +475,29 @@ def check_wsl(d):
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn("You are runnin=
g bitbake under WSLv2, this
> > works properly but you should optimize your VHDX file eventually to
> > avoid running out of storage space")
> > =C2=A0 =C2=A0 =C2=A0return None
> >=20
> > +def check_userns():
> > +=C2=A0 =C2=A0 """
> > +=C2=A0 =C2=A0 Check that user namespaces are functional, as they're us=
ed for
> > network isolation.
> > +=C2=A0 =C2=A0 """
> > +
> > +=C2=A0 =C2=A0 # There is a known failure case with AppAmrmor where the
> > unshare() call
> > +=C2=A0 =C2=A0 # succeeds (at which point the uid is nobody) but writin=
g to
> > the uid_map
> > +=C2=A0 =C2=A0 # fails (so the uid isn't reset back to the user's uid).=
 We
> > can detect this.
> > +=C2=A0 =C2=A0 parentuid =3D os.getuid()
> > +=C2=A0 =C2=A0 pid =3D os.fork()
> > +=C2=A0 =C2=A0 if not pid:
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.disable_network()
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os._exit(parentuid !=3D os.getuid())
> > +
> > +=C2=A0 =C2=A0 ret =3D os.waitpid(pid, 0)[1]
> > +=C2=A0 =C2=A0 if ret:
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal("User namespaces are not usable b=
y BitBake,
> > possibly due to AppArmor.\n"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"See
> > https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-no=
tes/39890#unprivileged-user-namespace-restrictions
> >  for more information.")
> >=20
>=20
>=20
> The error message could be better imo.
> It will also happen inside a docker container that runs without the
> NET_ADMIN capability, which is the default.
> https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linu=
x-capabilities

Did you actually observe that?

If the unshare() fails, the uids will still match and I don't think the
error message will trigger but I could be wrong.

What we want to detect is where the unshare() works but the uid mapping
then fails which is the annoying apparmor corner case.

Cheers,

Richard

