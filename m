Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDC2D3941C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 12:05:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14079.1775131497931381810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 05:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UZeF0wi5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo8653275e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775131496; x=1775736296; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKkTxoLrAXVkta3kkn/KG4wPMXJ5VIhQScxTAkvhsQE=;
        b=UZeF0wi5kYcwqfUPp7nrUVIUl//Nr6xTFNMV5SjKRu+XSaJOczvq3Wn+Wca3+4glHk
         m45j96z9c3GZMh5mzFUDKmMODoXFMjWk/pJP1eeJxSyWX/PLnTRZ+Y9B4MfNnCwP++L3
         8EDNW2onIik5thLNYM9/y/CBViwZv+nKTEuXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131496; x=1775736296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKkTxoLrAXVkta3kkn/KG4wPMXJ5VIhQScxTAkvhsQE=;
        b=KEjrEU9wBsINpORsC7bgq87BgzkTBuxNmBRsJigGohKMhwkjW/aLKgspeAcntzADOC
         qwidUh06Z9qO6eZ3kcUjmU04qUPAzZSNw27UsbDTMuSMsdagsHyr3Y8yzj5yuBiSVAIv
         ru3TxGHi6+2HA1+Us5XzoBxwyHA5X4V14ODHSiRMpfL9MjKPoTMyO4fVjbpSsimbPBCP
         Dw07//ZXEio9u+9k+Wz+EHeWj21cRQungmj5SujLzTFuVej+QJpxTT/WFsslNRS3tEtN
         Gpd5TjAM6hFKlPAcxcNQ72NjbcnBqOF7LzFSD/dYsKxOPZS9L0lhEgcRxw7KrL/3fRbv
         JlRA==
X-Forwarded-Encrypted: i=1; AJvYcCXtZZ+7+pxqbtjwFbYfmg6H+aeOtsT+XnPmKjsOjfbvKJ+dypFwKtU7BcRc1/c7cy7T6lO+yValMmldkagy1g3m+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylE+OuMX1XBy5taQmQNk/Z6sdc8bUpBZunZbAkYSO0VVCw+MDF
	39ZtsfESccNJufuOzKXwOWoZYHfVu911/tnU0JnAzU7ZqUlI3zkwLxdGZjfR51wss4h3IMfaz8P
	gMd5v
X-Gm-Gg: ATEYQzzIuWyRbjznrxDJyO3iuBPZbK1YSZW+0MRfde+LooTpdi36D1IpfJFAjcRgi3n
	z6wfBs3LLvBAYdpIP8IkYYQuJ+bcJvsShzsOek20Jl3aGDBZOBGbbwIWMx6bm1pfVV32x/hGt/p
	3jHxUDt3KUGCaQ4sFk/+kTGb3pGqmr8Lls7lhlDQoloZUEqXp9d/KSYx/3pRqKtJbvH4aPuW1XK
	YS46+Z34yNO4mt+SYV1uRaCT2nXlq5bjWuUWeJFHdJCbWId1XtIf7svyDMnSn4n7pf666jWXuw4
	54xcEFdLe1YtgwC8n9e16gVIlIYmIEkC3rV8dFacA3svBmlqXDhide3k65hNbixOn1SG5Nld+Lm
	5YzirFXHSZkVNwrchaVEtdmoEUCpiiBSGWb93ilVhAAdP3uPzBdHXJWaY0KDcJq2uCt/Viaq0vq
	fwUA92p60BfL7n/S0f86bUjzXwBGNlcD3D9c5eArCgFTJQXYp6FFXq1fE8HdyOJDvI3XRl9YVWy
	tlnyspF+qAmjtf/
X-Received: by 2002:a05:600c:46d3:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-4888355e812mr126297775e9.1.1775131496059;
        Thu, 02 Apr 2026 05:04:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a695:b092:8c54:d70f? ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm7648090f8f.27.2026.04.02.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:04:55 -0700 (PDT)
Message-ID: <f1593f079522f02b1cb45822eb519a860c015fd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 1/7] signing-keys.bb: Fix DISTRO_CODENAME
 truncation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2026 13:04:54 +0100
In-Reply-To: <18A28874DB6AAD6A.664470@lists.openembedded.org>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
	 <18A28874DB6AAD6A.664470@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 12:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234520

On Thu, 2026-04-02 at 13:00 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2026-03-31 at 11:57 +0200, Adam Duskett via lists.openembedded.or=
g wrote:
> > If DISTRO_CODENAME is not set in the environment, bash quietly
> > drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-default=
setup-
> >=20
> > However, when python calls self.d.getVar('DISTRO_CODENAME'), the result=
ing
> > string is 'None', leading to a configuration file pointing to a key suc=
h
> > as PACKAGEFEED-GPG-KEY-defaultsetup-None
> >=20
> > Add a default value in signing-keys.bb to set DISTRO_CODENAME to None i=
f
> > DISTRO_CODENAME is not set.
> >=20
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> > =C2=A0meta/recipes-core/meta/signing-keys.bb | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core=
/meta/signing-keys.bb
> > index 94f4032911..c7713ed4a6 100644
> > --- a/meta/recipes-core/meta/signing-keys.bb
> > +++ b/meta/recipes-core/meta/signing-keys.bb
> > @@ -45,6 +45,10 @@ addtask get_public_keys before do_install
> > =C2=A0do_get_public_keys[depends] +=3D "gnupg-native:do_populate_sysroo=
t"
> > =C2=A0
> > =C2=A0do_install () {
> > +=C2=A0=C2=A0=C2=A0 # Python evalutes an empty DISTRO_CODENAME to "None=
" which would cause mismatched files
> > +=C2=A0=C2=A0=C2=A0 # as the update config file would show GPG-KEY-${DI=
STRO}-None but the filename is
> > +=C2=A0=C2=A0=C2=A0 # installed as GPG-KEY-${DISTRO}-
> > +=C2=A0=C2=A0=C2=A0 DISTRO_CODENAME=3D"${DISTRO_CODENAME:-None}"
> > =C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "${B}/rpm-key" ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0644 "${=
B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_C=
ODENAME}"
> > =C2=A0=C2=A0=C2=A0=C2=A0 fi
> > @@ -57,6 +61,7 @@ do_install () {
> > =C2=A0}
> > =C2=A0
> > =C2=A0do_deploy () {
> > +=C2=A0=C2=A0=C2=A0 DISTRO_CODENAME=3D"${DISTRO_CODENAME:-None}"
> > =C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "${B}/rpm-key" ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0644 "${=
B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
> > =C2=A0=C2=A0=C2=A0=C2=A0 fi
>=20
> I have a feeling it may be safer just to put something like:
>=20
> DISTRO_CODENAME ??=3D "nodistro"
>=20
> into the recipe to handle this?
>=20
> My only concern is where else this is being referenced from and whether
> that would have the right scope? Most other usage sites have special
> usage.
>=20
> Whether there should be a higher level default, I'm not sure and that
> is a bigger discussion but this would hopefully avoid the immediate
> issue?

As soon as I sent it, I realised the other reference in
meta/lib/oe/package_manager/rpm/__init__.py. Perhaps we should do the
above but also change that code to say:

self.d.getVar('DISTRO_CODENAME') or "nodistro"

?

Cheers,

Richard

