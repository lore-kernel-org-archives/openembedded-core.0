Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D2DCA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 11:27:41 +0000 (UTC)
Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8892.1790854054603709015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 04:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DpGUmypN;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.97, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab0d9260baso7365061a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 04:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790854053; x=1791458853; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0eYv6ln+bQw29FRiA8X9Jc4UFrELB26e8K+0YGkQRsw=;
        b=DpGUmypN4Gm+I6pplji3f4FBzcppG1PTFYJ0O3kb6z74jCT9ZFFuQUXaBvAJofyuMf
         oV3Q8TdJk3jY/0hRITZTIUzhF2h/9+o1LdwcQ2hs1XgvxYAyy2YEbYx88GzljdRw49SF
         S4ezhEL7ao6uiiI9SDvEVtB6s41N/die3ecu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790854053; x=1791458853;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eYv6ln+bQw29FRiA8X9Jc4UFrELB26e8K+0YGkQRsw=;
        b=zxLakccCBNpOaxR/pTqbovRItf1BKVCL7KYPrGK5D6CSCaX/wqNBZXiydP+3Ze/219
         KavNHsTydUiNXQu4xv/00UCwYMBUUrAeO1Jeh4jRaP7q29HP6G66rj5/8tr7lppWO32x
         gLiGfYop4rzk+ndUyhpbmaMrcqykvYP/prpsPVDMMMbkT4oiV0VYl6R2ZZ1IbhWXrrHh
         OEvA+RozIS2W+0hm1magcm2k5gM6hdKOxzvc7TJWCrtCDA2Lte9uHb5gqRFQoykf0P8V
         FfWU7s01CZkVG0mIAvEBl7v/V/lYnORQby3k3FM/bCksTFWJVOiYPPHJFe1SQMQOIjh9
         E1Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw+iWKutBRodFSIfp9ED3Ud1CeFvyWmpMC+n59vDwQjgm0KY0jHo9SwdaiS67iT/3Nckn4sk7KrRK9VXutb8nCwsw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJRqCocO3ND4qS/ZN3SjMhdUW8gPn+0qE754/IsoGYsWhkMOJsT
	LaEZfR9YOHjf5j1++mMloM6Q79DYCsbcpMXDm56Fwgdx39aEcFBggcTpOIhhKcdJGME=
X-Gm-Gg: AYBFou3LQ+YqjNOydiwAOr+QD/Acdxp8Ao5LLUuBHTRtuE6UIFunzydLKfTtj+6w2lY
	jv3C8mmep1C9q9J5JDqD2sKKQPX6nUl4qKboKaKy654WXJwghlAGCG+whDajZwUn3hHXXz8nlIQ
	mDfEgJSFLyfULj0imrM1avOCPfb8VAYgSWQuZCZJtfSis0l7FxAz8bj3Yuo47Ue3PF/B8JxtlBQ
	y6vdiMebKbfO5dIHdSNuppd/VGxISOVHs0KXbcwQqYYmjGD6T82cdLCDC7Fy1NTSW0mDRvof3GG
	+uSD2ZMxulGpwwMEhIqnyMo4OMd5eeaXgevXHqn1QGFBP2a3khceYuNHUpmBKeVwzNnGwlzjOGh
	3JE/U4D1klbaaUzg5Np7sDqerGX4i+2Y8/A/STWGm3n1xSWId90/VgqpdSzd73q79HopPZr4epj
	PG+GSElKaTu2bmu32dn4jvcSBaLc6JLlsWLkH+U/R2ghGys++Y5EPnyVLCnt2VJ16ODZr/abBVC
	v7TGt1u9xwJvESVNg/oN+apsgTHeYksibXzUQmqHD55by9XwezibX5mlb0RLrbrLav85vqG3A==
X-Received: by 2002:a05:6402:23d2:b0:6aa:f809:ef41 with SMTP id 4fb4d7f45d1cf-6ae198631fdmr2934550a12.3.1790854052781;
        Thu, 01 Oct 2026 04:27:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:97e5:70fa:8dd4:c479? ([2001:8b0:aba:5f3c:97e5:70fa:8dd4:c479])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca53713sm951364a12.16.2026.10.01.04.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:27:32 -0700 (PDT)
Message-ID: <34e67117d3a6fa876092f3736d3ecfa3f2b8fbc1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xorgproto: Set ALLOW_EMPTY for the main
 package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.jonas@de.bosch.com, Paul Barker <paul@pbarker.dev>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
 "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "Simoes Ricardo (BT-EL/ESW2)"
	 <Ricardo.Simoes@pt.bosch.com>
Date: Thu, 01 Oct 2026 12:27:30 +0100
In-Reply-To: <DB9PR10MB53549FAC3975BDDD2B057243AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260918141849.1875-1-mark.jonas@de.bosch.com>
	 <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
	 <DB9PR10MB53549FAC3975BDDD2B057243AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 11:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247029

On Thu, 2026-10-01 at 09:00 +0000, Mark Jonas via lists.openembedded.org wr=
ote:
>=20
> We were a little brief on our explanations in the commit message. So
> we sat down to create a hopefully reproducible demo of the problem.
>=20
> For reproducing with used core-image-base and local.conf containing
> the following:
>=20
> MACHINE ??=3D "qemuarm"
> USER_CLASSES ?=3D "buildstats"
> PATCHRESOLVE =3D "noop"
> BB_DISKMON_DIRS ??=3D "\
> =C2=A0=C2=A0=C2=A0 STOPTASKS,${TMPDIR},1G,100K \
> =C2=A0=C2=A0=C2=A0 STOPTASKS,${DL_DIR},1G,100K \
> =C2=A0=C2=A0=C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \
> =C2=A0=C2=A0=C2=A0 STOPTASKS,/tmp,100M,100K \
> =C2=A0=C2=A0=C2=A0 HALT,${TMPDIR},100M,1K \
> =C2=A0=C2=A0=C2=A0 HALT,${DL_DIR},100M,1K \
> =C2=A0=C2=A0=C2=A0 HALT,${SSTATE_DIR},100M,1K \
> =C2=A0=C2=A0=C2=A0 HALT,/tmp,10M,1K"
> CONF_VERSION =3D "2"
> DEPENDS:append:pn-base-files =3D " xorgproto"
> RDEPENDS:base-files:append =3D " xorgproto"
> DISTRO_FEATURES:forcevariable =3D "systemd usrmerge ext2 ipv4 vfat
> gobject-instrospection-data ldconfig multiarch"
> DISTRO_FEATURES_OPTED_OUT =3D "*"

You're setting RDEPENDS:base-files:append =3D " xorgproto" and xorgproto
doesn't exist so it isn't surprising the image generation fails as
such. Did you over simplify the reproducer?

Cheers,

Richard

