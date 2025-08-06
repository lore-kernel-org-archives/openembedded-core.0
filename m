Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41841C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 23:44:06 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.38808.1754523845699031114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 16:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E+LpZEvv;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: joaohf@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e903e5c24e5so478276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 16:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754523844; x=1755128644; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=frrSf2KvRy4jWiTRr5ncWpj42dLtAhGJ12uTrmB9qa8=;
        b=E+LpZEvvixss78C/wqz6UBSG0GoYwL5IMprJ7xxeAf/NFQsWG0Priblsb11bEfObgl
         oCbGlPPfNoQ02CI1Ic2AYxd4UaPodDaJ/NUQOup/p7vPm1FX04Q4ZqIRVWxeTMFY+dvX
         MFXwCCctZZHXnfQ2bBxKm63PKuN8/ZYU6cV2hFnxbSB73Le/oGMolAjelrE+qK7sWyM7
         vj5Wa34KFgmFgzJDelAMMDOT4+lB2K5yGtY+LpzOq1tmACOBE+bowLJHqYz4ig/l2pDd
         AyHkcAEHl/nQQ83fsD5n30FMx6EBSHE2bbWNuNAQg4vAMILr8aN+sXNSo46LtsUyrmWy
         RXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754523844; x=1755128644;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=frrSf2KvRy4jWiTRr5ncWpj42dLtAhGJ12uTrmB9qa8=;
        b=JRRvOjbJslPDVERJyaPriCIwiJfun+gaVO2WdXO4LFdznUT/BZKsyAp1lwQNxineEN
         79nR3CTbFmTW64/pQuMCWr0UUSreWT7d9Evbzyfn8BeByzN5cL+PoK5xYu3GRgWWxw0Y
         7K72Fb3YS908xN+Eu+Z0yELleI9XTt9CFEVYA4l6uPSXyr1UNRtc7TLN+rqpDD28bH8E
         8eJu+VLDzqJ6iLAeA6zp2S2cT0l4egvx7zNdTsgXM8eUHBnvR+3b7WOCsRqUUuNsZ8b7
         732lM8b9rlRgZYkP7LQ+4b08hjoXga1ZvvCHR3E5fcwa8rVAQxBY0olSK/Uylvb6rMTK
         5hgw==
X-Gm-Message-State: AOJu0YxGEMjkSNv3vqmCpvC7yC9CE/rxgtJMaCexla1mFVJ+bp/Q7ICk
	QwcQNQt99UjiM+N7A3u/35S/4wDDSClx2cuSqlc9zAqdZenDl8MWEurenrfSmUQZ7MHHzGqoC97
	CwXVznuQwGx3cVGNd6tHGU4fPtQrXXtRk3XOH
X-Gm-Gg: ASbGncsd5qJ9K6cyzSgPNWmbd6zczxb8kKR9/Cw+w7MDdPj+L1GGditl3Ko7fEv7nq9
	/4da0BnrFKK91TQo3jk8BvgD0UDEIxTDk3URexgEgxtEPCl1eSqAUsGM69nk8LObCF9VxSlMZLF
	+hHxshbTT+9Jy0A6RV1FLPg7fA6G44cD6ugj6xDS7x4z8lL4FIhhaeL/ECXiQtaQOaCzBTekdGE
	HTYRG9HYcGtxAUWCrI=
X-Google-Smtp-Source: AGHT+IH23LJdaiOnS5lw73VofjK4PmxxjyUXBDPGoEDCJJwvB+6niVdYCCaKDc4WvLqevzUzlSrsXtuBHP+lcdNIGZA=
X-Received: by 2002:a05:690c:d92:b0:71a:2961:e2ce with SMTP id
 00721157ae682-71bc959d322mr38317327b3.0.1754523844377; Wed, 06 Aug 2025
 16:44:04 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Wed, 6 Aug 2025 20:43:53 -0300
X-Gm-Features: Ac12FXx4f2zoUcymbOSE_hFfTnspy7rJpy_308uaR0d5onGujicMTIh5hcbSYY8
Message-ID: <CANFVK7-QA8RwRZX7tOdTz-sL+HMvmadDg4Q-1tOLzMk9WVdMYw@mail.gmail.com>
Subject: Adding oeqa runtime decorators to custom layers
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007e8286063bbaea3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 23:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221551

--0000000000007e8286063bbaea3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

In my layer I have some oeqa runtime tests. That is ok and well documented
in Yocto Project documentation. However, I also want to define my custom
oeqa runtime decorators. Is that possible ?

I tried to add the following in my layer.conf:

BBFILES +=3D "${LAYERDIR}/lib/oeqa/**/*.py"

No success, so far.

I'm using master branch and could not find any other layer that adds its
own decorators. Any ideas ?

Thanks.

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--0000000000007e8286063bbaea3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>In my layer I have some =
oeqa runtime tests. That is ok and well documented in Yocto Project documen=
tation. However, I also want to define my custom oeqa runtime decorators. I=
s that possible ?</div><div><br></div><div>I tried to add the following in =
my layer.conf:</div><div><br></div><div><div style=3D"color:rgb(204,204,204=
);background-color:rgb(31,31,31);font-family:&quot;Droid Sans Mono&quot;,&q=
uot;monospace&quot;,monospace;font-weight:normal;font-size:16px;line-height=
:22px;white-space:pre"><div><span style=3D"color:rgb(156,220,254)">BBFILES<=
/span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:r=
gb(212,212,212)">+=3D</span><span style=3D"color:rgb(204,204,204)"> </span>=
<span style=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"color:rg=
b(86,156,214)">${</span><span style=3D"color:rgb(156,220,254)">LAYERDIR</sp=
an><span style=3D"color:rgb(86,156,214)">}</span><span style=3D"color:rgb(2=
06,145,120)">/lib/oeqa/**/*.py&quot;</span></div></div><br></div><div>No su=
ccess, so far.</div><div><br></div><div>I&#39;m using master branch and cou=
ld not find any other layer that adds its own decorators. Any ideas ?</div>=
<div><br></div><div>Thanks.</div><div><br></div><div><span class=3D"gmail_s=
ignature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr">Jo=C3=A3o Henrique Ferre=
ira de Freitas - <a href=3D"http://joaohf_at_gmail.com" target=3D"_blank">j=
oaohf_at_gmail.com</a><br>Campinas-SP-Brasil</div></div></div></div>

--0000000000007e8286063bbaea3f--

