Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF42C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:21:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5501.1785306084425333569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dLyYWKSw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so498904f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785306083; x=1785910883; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PQ3HfAmmOFO3z+FhgBUQDAvzAv5OsbfAGC/RFPt16Yg=;
        b=dLyYWKSwTtKd9KX4LnT26rbpy3aVLtdxYONxkbEdD5fSIgbf6VJbz1mEmeCSuJxdju
         lAbeqpxUFw9XiwJ8GSuJXzca6bckMf1/QIptpMrOlTFb59pzoZ9McrE1Ku+ov11Iq/k1
         wPf/Txo2ZRQhrKNoEUjN3xps4FDclj5sh7aqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785306083; x=1785910883;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQ3HfAmmOFO3z+FhgBUQDAvzAv5OsbfAGC/RFPt16Yg=;
        b=McyY5x97y1xL6EyJPPbHtHrz8CJNAWReU41uiCHf+cKG53+cac5D0g7O5mAVw3jf1N
         KBi9kw54HW+xxk8+ImlMF1h3dY89aI80CF/89xdA/pH88YLnlCHuSG5uyL5O8cdLEX8C
         CXBqnmzHWdX8HfOQwGnlNMSjQpMlYO9FPQRw+gySuDpqQx8sBLsmwrCve6J1ezTTkKnK
         yZ2aGIWY7LJj0RJeGa6MdfZAkyiFpoOxGHpOVeeAgMPDKm0QxW+CxfeWYhPGAcWAaij4
         jc1KMmi/7//dZtBl43XEazzwZ6RWO96Iji8DP1q3sU2hFC5fCjc8U7XnOkSeQqBOh2Ty
         RXzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvEZAArKBbpXmlJ4GPvKRPjkTqzsIJo0ZAofJbmOyJA0oJWHPa9JfbyqppORbPxzvfWsh8N4VId9kgN6hHPhrkqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx10kbQp4ub1aZvjdummerglfJBiBnCOa3vcvekDvVwhkIw+Zi3
	CWWi2ciz34fHn5NmY5X9YlIo5iXr6YmVPBC+9ja2WtD2Mwhr/RCL66Jn6l2k09snJYA=
X-Gm-Gg: AR+sD12eYgl95F6eK/wjQZAAk36EBONINeXFRvMU0lxnEFcma5DAYcbh5MWtPQtf9lo
	wzH5fDQl39G1XK30/qTnhZggjKFnTHzqLbvjVwKGuWgKiVOQcTF2fzGR7poDJVf++U7PBFAkA2e
	PyHTK64y/TL9aJ3cQpbjeIHbKGvki2VXxc2SDecHS8woEZha6P8YfjXzW7bbkt4t6qO43ihgOXD
	5WlZyGou9l2AORAANUH5OqgmHQ72pQ/yGEcuf4v1tALl1GPyTnPBSExzvCPULighN8VpwGB9twY
	pCvHD/Ro1Ga7HJvg57Ax9eayL8dx9ryCIe4BXa/XvGuHzXlJMEEl+qKqJ2Ibd8GUZI07kgb9pjH
	GIhCC1Gb7JheZGJ4FGqxELLQEkzyH0lqQfUboPdKLMotKv2mJQkrv3TEC5t/2u3lVv//VrVsnQC
	Y/pDxB+tqNtidnZjf98Dajf+mmySTgFtj8C5E3BUAS5zeMq78q6lUtNtpNStWyESrBV/qd9FaK2
	B7tlYdf5Qya/FriJNVXudJfh04X6quU/wVlokUNaF8VEoNa/Hwgug==
X-Received: by 2002:a05:600c:628d:b0:495:4a27:483f with SMTP id 5b1f17b1804b1-496c6586d39mr51533195e9.29.1785306082505;
        Tue, 28 Jul 2026 23:21:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3647:86f2:68ea:efc7? ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb647a8d4sm5128872f8f.0.2026.07.28.23.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:21:21 -0700 (PDT)
Message-ID: <9881925e3270e249e1cdc9b8a80110530882ddb7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.44 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 07:21:18 +0100
In-Reply-To: <DKASDKR2N2G5.1R4ZYL1X4YO0C@bootlin.com>
References: <20260728072602.3269425-1-khem.raj@oss.qualcomm.com>
	 <DKASDKR2N2G5.1R4ZYL1X4YO0C@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 06:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242236

On Wed, 2026-07-29 at 06:56 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> Thanks for the upgrade. I can see two failures here: I believe the
> first one is expected, but not the second one.
>=20
> So first, buildtools builder is failing with:
> ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-
> worker/buildtools/build/layers/openembedded-core/meta/recipes-
> kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install:
> [Errno 32] Broken pipe
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/4256
> I believe this is just because we need to rebuild uninative on glibc
> upgrade.

That is correct, this one does not block the patch.

> The second issue is a ptest failure:
> Failed ptests:
> {'m4': 'START: ptest-runner\n'
> ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'EAGAIN =3D=3D EWOULDBLOCK =3D=3D 11=
\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ENOTSUP =3D=3D EOPNOTSUPP =3D=3D 95=
\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PASS: test-errno-h\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PASS: test-error.sh\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-execute-main: test-execute-chi=
ld subprocess failed: No
> such file '
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'or directory\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Timeout! System state:\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Collected system state:\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '+ dmesg\n'
> ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ERROR: Exited from signal Killed (9=
)\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DURATION: 451\n'}
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4138
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4123
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2009
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4128
>=20
> Can you have a look at that last issue?

I've also seen this in my testing so it does look related and I
isolated to the same patch.

Cheers,

Richard

