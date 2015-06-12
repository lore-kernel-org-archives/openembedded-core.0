Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 541D7757E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 08:29:04 +0000 (UTC)
Received: by lazv15 with SMTP id v15so17148192laz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 01:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:organization:user-agent;
	bh=lESFPqYimvT+yElnqbxAuQiFG2cxgpshSxhuBUGqcb0=;
	b=A1j90S6GLOTQf06znLvWDWVrDJa8BRZaGKGgf46Hm/o7H4hB6viKf3AwRZSTAyaaRy
	vYOTJW1UYmotmc3DxU/bOVc510FOlyWwk/82qW32WCLK0nABHG3DalhQoazGjQCk6srO
	ML1i5ew2WoGuAzsEyHawcOuRZoWHyumA/c2dMN6Ym+Pio99Q86+VNo10uZsi2X9ZZFFJ
	uJ9QLew+RWrRjFvkoXGpRUYeWTmHJMlbhOSif1T2sDJ4EvTxnsBsXdmK2Y3PyjWjCuvs
	B+jeYMKHYJdMifJl3lcmAgH5fqgZ6IY5woQj8DxzRSg+8pD2ynX/EqQP6vRu7u8gsWkC
	60Kw==
X-Gm-Message-State: ALoCoQlIa/3PekYd1KYxnhhtboofDTID8tyz1dsfDOcxQO8GXN2Ttq0gFnDJEcvzsEe69t8uZAfg
X-Received: by 10.112.210.9 with SMTP id mq9mr13270660lbc.4.1434097745437;
	Fri, 12 Jun 2015 01:29:05 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id dh4sm695168lac.12.2015.06.12.01.29.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jun 2015 01:29:04 -0700 (PDT)
Date: Fri, 12 Jun 2015 10:29:02 +0200
From: Anders Darander <anders@chargestorm.se>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150612082902.GA23164@ad.chargestorm.se>
Mail-Followup-To: Li xin <lixin.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: Modify PACKAGECONFIG to enable openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 08:29:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Li xin <lixin.fnst@cn.fujitsu.com> [150612 05:41]:

> Enabled openssl defalutly to use https, just like Ubuntu and Red Hat do.

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---

> -PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)} gnutls zlib"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)} ssl zlib"

I think you need to motivate why you're changing from gnutls to ssl
(openssl) here.

Not that I'm personally against it. I've occasionally done the same
thing locally. But this is a change of the defaults, and the default
dependencies. Thus, it needs to have a good motivation.

>  PACKAGECONFIG_class-native =3D "ipv6 ssl zlib"
>  PACKAGECONFIG_class-nativesdk =3D "ipv6 ssl zlib"

> @@ -36,6 +36,7 @@ EXTRA_OECONF =3D "--without-libidn \
>                  --disable-ldap \
>                  --disable-ldaps \
>                  --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificat=
es.crt \
> +                --with-libssh2 \

NACK.

We have a PACKAGECONFIG f=F6r libssh2, which defaults to off. Do /not/
enable it directly in EXTRA_OECONF. This will break builds (at least
the determinism of builds).

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB

