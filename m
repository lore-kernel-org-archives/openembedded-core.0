Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15B0FC592F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67570.1772103860246970279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=dl9pf@gmx.de header.s=s31663417 header.b=Jt9iwB9X;
 spf=pass (domain: gmx.de, ip: 212.227.17.22, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772103855; x=1772708655; i=dl9pf@gmx.de;
	bh=oMNYj5bqo83qIz7ke/TZqtJwp3YMoRGltkixCI3Dsng=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Jt9iwB9XuC3d2V+PuM5rhwxHEaNjUz59sTZ8JaJzMKreJsD1FJX5qs1qdIuJJVAz
	 tePCf0Q4iiXEzPLAv9zy/MhToC0FP0KqCSqYkrmnJgYK/0+7H372fVm/Hdxz+Nz7D
	 bOFORgq15XAu6liK3ggtXuFO/jr5hBTUdcKlAHFh2U0uxyTm0+itrCqGMD59cr7ST
	 ZGjrCtA1PNNV2jslHvHDevYOqaSZ9ETaTrN06HHBXTnHuaAvl3HeZkvRF7E+5ktv4
	 p7/djmFgLFbtVKM5uDAZcpD2kkkCIwFNQ9kXeUMQcOeC4/y1XR0wH0XJsuBcCCg1C
	 7aIHRvrYxN1NimlDkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1wLDrG2Mw9-00SxSX; Thu, 26
 Feb 2026 12:04:15 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: 
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: paul@pbarker.dev
Subject: Re: [OE-core] Improving DISTRO_FEATURES backfill & opt-out
Date: Thu, 26 Feb 2026 12:04:14 +0100
Message-ID: <4855971.vXUDI8C0e8@monster>
In-Reply-To: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
References: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:spc9wVzZhYhkrmh4YpPDrkIfokVflpmKIWHawZLjlQwH13vrgHi
 XXanBNeQYPuj6LvWaaHr+QN5ql8HZaGvlL9/Um3xbsobBZA6TweSkIQ2HWpFTzR6kZu2cu+
 VocPnzSX/2Xs2wtaqjK5BTj3sXKWsWv9CEd7G4wnh6wJ152dxoESBtbGoOHQBSviClvBj5e
 uuqLZdV27sjM0XrJCFnRg==
UI-OutboundReport: notjunk:1;M01:P0:4uRo6Cu5onA=;oTsGDP3/GKHdyKjs/RsscVFuNMo
 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
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231998

Hi all,


[...]
> What does that look like practically? Something like this I think:
>=20
>     DISTRO_FEATURES_BASELINE =3D " \
>         acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget \
>         usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp \
>         pulseaudio gobject-introspection-data ldconfig \
>     "
>=20
>     DISTRO_FEATURES_DEFAULT =3D "${@filter_default_features('DISTRO_FEAT=
URES',
> d)}" DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>=20
>     DISTRO_FEATURES_OPTOUT ?=3D "${DISTRO_FEATURES_BACKFILL_CONSIDERED}"
>=20
>     def filter_default_features(varname, d):
>         baseline_features =3D (d.getVar(varname + "_BASELINE") or "").sp=
lit()
>         optout_features =3D (d.getVar(varname + "_OPTOUT") or "").split(=
)
>=20
>         return [feature for feature in baseline_features \
>                 if feature not in optout_features]
>=20

I like the clearer terminology -  +1 .

Best,
Jan-Simon




