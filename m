Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.101])
 by mx.groups.io with SMTP id smtpd.web10.1845.1610704638569876830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 01:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=cnnfZ3l6;
 spf=pass (domain: microsoft.com, ip: 40.107.14.101, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rlk5wQI074YQJk1E6wc9JJSDIw7TvJsI+EW6629+z16dzh+jSJ4+l4qmKnJGIG1YMI9KJzyK+g1Kvu9ilUlXoUTnjc40DMLi3jxtO3ox0OqGxr5/uZvAqyXg5+vi54v/t9MvBqNGzkfpiLg3nU7fQ+giDSk3DVEjBoZEaTDOhg6CsoEwecKtUVDx6d3WXmmOMtNZQhHTA8RfG/pVOCcNx+MavJAnT2lPQF+se08FTzHDxlr6D8nH/GE2x2zY84aDdqK9KHThf7DCe0A9lBg0nMtowBIrVsL1kCPCGcqKRwlOLms6eQgF+kZyjy1/Mg0+0lenfs4lVwPTk9Jt7vWtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ja46reR/7rpEbElbOpNhXSMNGSUFp+kjN3vvDn89aI=;
 b=IsDxlzULZTePBp/SAAY8DF0LO9KoGD4btdZpMT9z5OkunN+SqvCudpk6789mgl4rjFIezLwVNH+HKX/ZPDlhJYceAlGG49/EGnJj1B7NTZgs/KY1CnHm+rAZqfQSNNyShfzg9lPX4heHx4hXFNV2EwNVWeZJA5iBDiJ4V1q/RcRYbllcsZsQZ1BXOzja4ek5k3D33tBuQMyxYKPiQEYZrr8Esm5xqZnA5ymvrOr7sy7C/Gr2W6piQ8mu1K1QJp294EoxoEg8Nvf89awq0ri/stPMu/QAKUXZpFMq0AXp28278UgPLWDWpty4nSu4lwMkS+VZWwO/HVucJlt0plY3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ja46reR/7rpEbElbOpNhXSMNGSUFp+kjN3vvDn89aI=;
 b=cnnfZ3l6cjRu7MRtaiPbx3zSjTNKek4E3kFgrjxHl4CzwbADdyLJrej1aB8q3QnSd7gUjSt109YI8g1h1W0ytt+Kbu54Cebi0ZeprWKynN66Upc7eD4YMLFG2s1cx3rpVbwjEVsU7b5pTC1RgZafWvCQsErH/kwZnsqp6cALBvc=
Received: from (2603:10a6:821:7::20) by
 VI1PR83MB0350.EURPRD83.prod.outlook.com (2603:10a6:802:3b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.3; Fri, 15 Jan 2021 09:57:13 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 09:57:13 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	<paul.gortmaker@windriver.com>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Thread-Topic: [PATCH] systemd: dont spew hidepid mount errors for kernels <
 v5.8
Thread-Index: AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooXVEAgAAWQYA=
Date: Fri, 15 Jan 2021 09:57:13 +0000
Message-ID: <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
In-Reply-To: 
 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a0cbfb0-df9d-4464-4ea2-08d8b93beee5
x-ms-traffictypediagnostic: VI1PR83MB0350:
x-microsoft-antispam-prvs: 
 <VI1PR83MB03502B2D7B53EEDA5F75EBF5F1A79@VI1PR83MB0350.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 boHDIlye1Z7BbFCCKI4O6clCtADq0m4EOjg8ybMSKrUcU7V9cCiBQuZLmXypHhdvx7AqDWRPfWMtm/hG08aajP1G9VmAP7QhZtqodv/ZiAA561U9ImHs7cHr3v/r3LpyU6GVKuhrcxQdwefdj9bdN9Qi8WjcY74b3KJQeliptpRd7JcJfeEMMy42gDfAaiiyaPzaoekyUmBJdnRJnLK79tdD1DL8EkQP36RuGH5uveeyiQxxWqQyxaH/yQJS/BuSOMfrFhT22oYjKneqoYxOibfRtIDtJxgoIJ7sGuE4dDf7I70akhgNIt5jE1zP/F67q3qX8RzjOpn4U6jvdYRtlAjbQ6WqA+JJlBB+Dq9KWU0ueipeHf+jk1e2pFC7pyQRENkydx2Cw8jRkFE5tHb05+ZEqdEXbWHtXOSQ3ND3IVjmC6j0G+KWMbITAHhTcpUyIyAdY925jU94dvCCjGroUpjCZ12+CwJCzO0mAGpN9AGc6q8QcTLDvVtQ6jguOqvY2eYigRZpTyAzxGbWwia7+RZy4MPEoht8VZPCYMIR+3gnWYd1wk6k2k/S5RqY6eJI7HnbYfloUqLF+RXMUJkRF4/lWNB1V8VfszHQHY4o8w3Rgcghxfr0Rbk5qkuIsdJBAcvUab654cURIo+oSCiV3w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(6512007)(82960400001)(6506007)(82950400001)(8936002)(316002)(6486002)(8676002)(966005)(2906002)(66556008)(2616005)(26005)(110136005)(186003)(66616009)(36756003)(71200400001)(83380400001)(66476007)(66946007)(86362001)(5660300002)(64756008)(66446008)(76116006)(10290500003)(99936003)(478600001)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?WmJZWElIaEg1MTB1QzYxRGg4cGV6NGxEa01Eazg5c1c4YzZZZ3kwRVFtZHpP?=
 =?utf-8?B?TWN4K29pVjdPMmVtZlgraGJpY2pjbGgwSzREUWkyVm5tRHJkRFRXVzlRUEor?=
 =?utf-8?B?eWlhV1JBNm9FTHNaRFZnQjNkN3c3TzZDWWoyc2YrT2Vldm1KTDNCOE43d0g1?=
 =?utf-8?B?WkZzQXZzUHEzSTJwQnJFYzdqdUc0aWkzTGpQdzB6ZVlCZmdjS0hOQk5rNWJv?=
 =?utf-8?B?c2N1VndtSEpwMHQ2a2h2RkRObXVLZytYamRkM2daS1RJVVdTMHJJb0JRV0lM?=
 =?utf-8?B?anZLM3huTkNVS1F6dHFTZUhDaGVzQW52SUZZRVJhOWt1d0tOQmxhc1lIWjhx?=
 =?utf-8?B?c1RVNWZKc1pvZC8vVUNaTFZsTHlUUjR2dW8yZWNUaHlxTGdiUGsrWEsrZTdE?=
 =?utf-8?B?TDQ3MmNCcXUrMkRzMzdIMGFMa3NwUU9GQ1pKbTQ4aVFCby9rRzc4TjcvN2oz?=
 =?utf-8?B?ekFmM0JDc1dlQ1hCcmZzL0NOY1J3SDk4MXdLMnQySTFKemp6VG1yM0R1d3B5?=
 =?utf-8?B?dXFYQUMxS25xbE9DdkhFVTlENThwRng3bGQwV1dyQjlqNU0xS1pnVUlHdDlL?=
 =?utf-8?B?RGN2bnpJQmxRQUw4UTBtMmJCU0NFL2s5TFNTVTg2bDUyRUxiSWJYTmVjdTN0?=
 =?utf-8?B?cFNqa3ZBbUNueThCVzY0OUdMVDhQZmZiQ21zTzNUUlBLcXFxa0xJZW56V1BS?=
 =?utf-8?B?WjF2WHR1ZW5LWkhKeU96NDR3M01LQUxSV0JGT2Z2ZWVXY3BpYVZEdlNPbk5P?=
 =?utf-8?B?QXI2MnNXcVhFUXdFRnFucDR0WnZTT3UzNFBNeFR5d0t2RXl5U3NVeVVNK2E4?=
 =?utf-8?B?WkF5Mm1uN0Y1TTJVamIvYTg2Q3E3VWZ1eWJoczhaVEdZNzJFVVEvb2kzeW10?=
 =?utf-8?B?WjRtRllzRGJDUnhHcW9wejRtQWgrUUQ2TUpuYXZGRGcwTEpUcVNFQUZuU1RN?=
 =?utf-8?B?NU5ic1VIRXpzRmgrN0g0U2F1Q2tvM01UVTl5aGl1cjF6bzJ2TzRNOHZUcGRT?=
 =?utf-8?B?MWN0Wkg4VDNRdjA3K09iNlJHYitBUmdnVWptcmxhYzdCQmZYcjd5ZUtlSjFW?=
 =?utf-8?B?UE15OHhsVnBMTEtRTmhnN3dNdUxnMWlPclM2Z0Jha0t5RzZtdk9JZmI0L0lV?=
 =?utf-8?B?QzRhMHpES2REWmNVcktlT2FGNXBYUWFwUmczdVJmUlEvYmlrYnVFZmR0WkdB?=
 =?utf-8?B?MjVXa0s1b21tMThHOW5zb0RZSFREdVRac0hZMUFCQlUrWmRTM3dpYzNYWm9H?=
 =?utf-8?B?bWJIbXVHQVVWd3VLcDJxbEprekNnS2hLNjB5SUdXQXJpSk9SSUhpWGtSditp?=
 =?utf-8?B?NGhlUkN2YUNqU0xtNjYvaEVrQ0ZjV2VQbEhTeGlUWTA1TkJ1RTJ2a3VJWjVJ?=
 =?utf-8?B?dnZxMmgvelZzS2M0bE5MTTJQdlg1OVBLbHZRSE9vR0xOZ0o3OS9OdkJDQlMx?=
 =?utf-8?B?bFhoMmR2LzJOZkQ1ZmFWQzRwUytkeEgrbkM0azl3PT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0cbfb0-df9d-4464-4ea2-08d8b93beee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 09:57:13.3690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGF4fE8qgeJjF4InyzppuulvxzN4WkjcuHSfPymyu1b8Hh+bbbjjmJoY14GG53wk5riERThBx6K88wFBuO/S6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR83MB0350
X-Groupsio-MsgNum: 146732
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fi4HE7linNlPiCbB/rnp"

--=-Fi4HE7linNlPiCbB/rnp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > Recent systemd started using ascii args to "hidepid=3D" mount options
> > for proc fs - unconditionally -- even though kernels older than v5.8
> > emit an error message on each attempt:
> >=20
> > root@qemux86-64:~# cat /proc/version
> > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2=
.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > root@qemux86-64:~# dmesg|grep proc:
> > [   29.487995] proc: Bad value for 'hidepid'
> > [   43.170571] proc: Bad value for 'hidepid'
> > [   44.175615] proc: Bad value for 'hidepid'
> > [   46.213300] proc: Bad value for 'hidepid'
> > root@qemux86-64:~#

Wouldn't it be better to patch the kernel to downgrade that message to
debug level?

> > Simply ignoring them as the systemd maintainer unconditionally says
> > is the resolution is clearly not acceptable, given the above.
> >=20
> > Add a kernel version check to avoid calling mount with invalid args.
> > Further details are within the enclosed systemd commit.
> >=20
> > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-m=
ount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd=
/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> > new file mode 100644
> > index 000000000000..65e7eca32d05
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-er=
ror-with-invalid-options-o.patch
> > @@ -0,0 +1,126 @@
> > +From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
> > +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> > +Date: Wed, 13 Jan 2021 21:09:33 +0000
> > +Subject: [PATCH] proc: dont trigger mount error with invalid options o=
n old
> > + kernels
> > +
> > +As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduc=
e
> > +ProtectProc=3D and ProcSubset=3D to expose hidepid=3D and subset=3D pr=
ocfs
> > +mount options") kernels older than v5.8 generate multple warnings at
> > +boot, as seen in this Yocto build from today:
> > +
> > +     qemux86-64 login: root
> > +     [   65.829009] proc: Bad value for 'hidepid'
> > +     root@qemux86-64:~# dmesg|grep proc:
> > +     [   16.990706] proc: Bad value for 'hidepid'
> > +     [   28.060178] proc: Bad value for 'hidepid'
> > +     [   28.874229] proc: Bad value for 'hidepid'
> > +     [   32.685107] proc: Bad value for 'hidepid'
> > +     [   65.829009] proc: Bad value for 'hidepid'
> > +     root@qemux86-64:~#
> > +
> > +The systemd maintainer has dismissed this as something people should
> > +simply ignore[1] and has no interest in trying to avoid it by
> > +proactively checking the kernel version, so people can safely assume
> > +that they will never see this version check commit upstream.
> > +
> > +However, as can be seen above, telling people to just ignore it is not
> > +an option, as we'll end up answering the same question and dealing wit=
h
> > +the same bug over and over again.
> > +
> > +The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> > +systemd 247 and above plus kernel v5.7 or older will need this.
> > +
> > +[1] https://github.com/systemd/systemd/issues/16896
> > +
> > +Upstream-Status: Actively hostile
>=20
> The status needs to be
>=20
> Upstream-Status: Denied [Actively hostile=20
> https://github.com/systemd/systemd/issues/16896]
>=20
> (so our tools have an idea of what status patches are in)

Paul, please, let's avoid loaded language - Denied is fine by itself
and conveys what it needs to. I understand it can be frustrating when
upstream maintainers do not agree with user assessments, but the linked
discussion was polite and professional and there's no need to call it
"hostile".

Also, speaking as an upstream maintainer, I'd be willing to review a
patch that adds a log_debug notice to advise to ignore the error if the
fallback path is taken. It's low cost and reasonable, so I don't think
it would be a problem to merge it.

> https://wiki.yoctoproject.org/wiki/Best_Known_Methods#Patch_Comments

Richard, FYI this appears to be an empty page.

--=20
Kind regards,
Luca Boccassi

--=-Fi4HE7linNlPiCbB/rnp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmABZvMACgkQSylmgFB4
UWLQtwgAptKm6K+zGdvft3b2eG1QDqaqUnpExKg2BvrvghxoqThJt2ptec+T6+Ih
vmmAbyjsIHC6LcD9dVx3aQG61b4DxljIzyUjkX7CACVnOw+lxzy0c8Szhle1JmTH
9XZt0t/MjpTJFF/lLodx2wWDzUYWT6rUJAF0f6sXleYwOqM7A0wQ8AUpQqQo4rfS
r8avAsR2O1pOTBI7xDynHXpOgYoU16m27iID7ng2bDBmG+rTrG/ysjWN4mJhxEtS
lHFYoAxodLRX91StW+Jd80YrMrjnsxrFN5+c10HwSTqb0ZBT36il+Me63j94HR65
YkTPL+5bValCEk+7aFubuUcm8az7rg==
=EoO2
-----END PGP SIGNATURE-----

--=-Fi4HE7linNlPiCbB/rnp--
