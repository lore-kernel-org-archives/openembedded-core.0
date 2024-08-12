Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25EEC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:15:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.43063.1723457740343518523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hbweib7D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.181, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so45156421fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723457738; x=1724062538; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+K7Jt5/3gBTimTsndUZO6myfWUiVKCz/ZqAJm/r8vk=;
        b=Hbweib7DQ/1C2bD5aRlEKl5PfJtNlDgGaVbVtj5C4yiTXa776bbbRNgGxjekYejwSK
         EI9CRMDaJe6WCw65tSq1eQrNJWpEKh0YZOzaAwaI5oVDJbL+DFQDc4WhQgLbAiPsk9VV
         ddPCRUd4FvAqp83Z6q0japhhV+9l6C6o7W+bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723457738; x=1724062538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+K7Jt5/3gBTimTsndUZO6myfWUiVKCz/ZqAJm/r8vk=;
        b=e8tgT/6bsWW7jnjTN41GR0Ez87ftrpxcUMZcSa70H06Y27JMYCpIR5xw7TSQal5815
         I00adQkCFgdl5Uj6dLO9PDLkpCBFTwqWFOvZRArN1g/DHPrAokUAcDDXrmuX9lS45SdC
         00FXVmdsteScEfXkMUm61PGloMuNIxldPeq+drt1GxF4cgjo4YYAJi2m3ry5vlRHcnq2
         iykYasMNT+NlI0OEXAI8IHVoETNMiyPoxg/yIwH0wYAySyFezChyWlo3RRqDSaaM/tRU
         7M03bV/NoldNDAzM83Gr6EER9gLWM5Kz4M6kdDVc/wfrAK/TbZ1I7MWH8Sp5MI9S1Ucn
         5eLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnE1m55bdyAJAr7e4Zy0YL1K2sZJoXBe5DH7pHcY9yI5UaXd22c9IhcVKGdNfb/q6F9OR443CqaPM5FgOdM5PJAIigqlvEXkCejttON8V70k6hH+YvYgVk
X-Gm-Message-State: AOJu0YyGUx7n9ahX8th8EWfXaHoT8th2PQlNrYb+dAbs+rRFr6+694Zo
	+86mBfdyxmlG9sc1KvOhOvJDx+U9kp598oP6S06ZyllEV4S5toPEriOnMcvpf7OaX4PY+xZdjxw
	Mrak=
X-Google-Smtp-Source: AGHT+IGsbkB6GUgXd/Fjf9v8/CPcXdJMWniQwOW9zTXJsICpdVM2bAbvvmWy/GoHDuCoP4Z2RLA4GA==
X-Received: by 2002:a05:651c:543:b0:2ef:22ef:a24e with SMTP id 38308e7fff4ca-2f1a6d021acmr74988181fa.10.1723457738215;
        Mon, 12 Aug 2024 03:15:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4? ([2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51edc4sm7068490f8f.82.2024.08.12.03.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:15:37 -0700 (PDT)
Message-ID: <473ab1e470cecab864a742af39a0c7c7fea70ae8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)"
 <dnagodra@cisco.com>, "Marko, Peter" <Peter.Marko@siemens.com>, Marta
 Rybczynska <rybczynska@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Date: Mon, 12 Aug 2024 11:15:37 +0100
In-Reply-To: <SN7PR11MB69712420AA4D5D916BB5AB3DD4852@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
	 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
	 <AS1PR10MB5697AE3874C9EECA6BF35D8BFDB82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB69712420AA4D5D916BB5AB3DD4852@SN7PR11MB6971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203216

On Mon, 2024-08-12 at 10:08 +0000, Dhairya Nagodra -X (dnagodra - E INFOCHI=
PS LIMITED at Cisco) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Marko, Peter <Peter.Marko@siemens.com>
> > Sent: Wednesday, August 7, 2024 4:04 PM
> > To: Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)
> > <dnagodra@cisco.com>; Richard Purdie <richard.purdie@linuxfoundation.or=
g>;
> > Marta Rybczynska <rybczynska@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> > Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' t=
o
> > "Unpatched" status
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)
> > > <dnagodra@cisco.com>
> > > Sent: Wednesday, August 7, 2024 12:17
> > > To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; Richar=
d
> > > Purdie <richard.purdie@linuxfoundation.org>; Marta Rybczynska
> > > <rybczynska@gmail.com>; openembedded-core@lists.openembedded.org
> > > Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> > > Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix'
> > > to "Unpatched" status
> > >=20
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Marko, Peter <Peter.Marko@siemens.com>
> > > > Sent: Wednesday, July 24, 2024 12:04 PM
> > > > To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> > > > <dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
> > > > Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> > > > Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfi=
x'
> > > > to "Unpatched" status
> > > >=20
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> > > > lists.openembedded.org
> > > > Sent: Wednesday, July 24, 2024 6:45
> > > > To: openembedded-core@lists.openembedded.org
> > > > Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.co=
m>
> > > > Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' t=
o
> > > > "Unpatched" status
> > > >=20
> > > > > - The 'upstream-wontfix' is to be used when the CVE is accepted b=
y the
> > > > > =C2=A0 upstream, but they are not planning to fix it.
> > > > > - If the version used in Yocto is vulnerable, it should not have
> > > > > =C2=A0 "Ignored" status. The package is still exploitable by the =
CVE.
> > > > > - Also, when the status is exported out of the SDK, it would be
> > > > > =C2=A0 incorrect to put it under Ignored catgory.
> > > >=20
> > > > The purpose of this entry is to remove meaningless CVEs from report=
s
> > > > so that users don't spend countless hours over and over again on an=
alyzing
> > "open"
> > > > CVEs if they were already closed upstream.
> > > > If you look at comments of entries using this category (7 in oe-cor=
e
> > > scarthgap)
> > > > these CVEs are more or less irrelevant.
> > > >=20
> > > > So this patch is from my point of view step in the wrong direction.
> > > > If you really need to show these due to your CVE handling process,
> > > > you can easily override this variable assignment in your own layer.
> > > >=20
> > >=20
> > >=20
> > > I tried this in my layer, created a .conf and included in my distro.c=
onf file.
> > > The issue is, it gets overwritten by cve-check-map.conf (as it is inc=
luded
> > later).
> >=20
> > If you create meta-<your-layer>/conf/cve-check-map.conf it will be incl=
uded
> > instead of the one from oe-core/poky.
> >=20
>=20
> I tried this approach, it included both of the files, and my config was o=
ver written.
>=20
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../my-layer/con=
f/distro/my-cve-check-map.conf
> #=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded-core/meta/c=
onf/distro/defaultsetup.conf includes:
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/default-providers.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/default-versions.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/default-distrovars.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/maintainers.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/tcmode-default.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/tclibc-glibc.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/uninative-flags.inc
> #=C2=A0=C2=A0=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded=
-core/meta/conf/distro/include/init-manager-none.inc
> #=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded-core/meta/c=
onf/documentation.conf
> #=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded-core/meta/c=
onf/licenses.conf
> #=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded-core/meta/c=
onf/sanity.conf
> #=C2=A0=C2=A0 <path>/distro/openembedded-core/../openembedded-core/meta/c=
onf/cve-check-map.conf


For that to work you need to use the same path. Above you have:

conf/distro/my-cve-check-map.conf

but it would have to match:

conf/cve-check-map.conf

Cheers,

Richard




