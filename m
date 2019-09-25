Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150091.outbound.protection.outlook.com [40.107.15.91])
	by mail.openembedded.org (Postfix) with ESMTP id 626306D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EM7u3FAYD41ZwmN+BpXA3ElWsWL/PmqQYoM+sFD3bjJmAeTeyASv5k0zm+VP1VLNBYvXtH8NqlCjyxwksZ1jj8rPuZ61ek/wbkBSNwiRr83Ld3caKcvLz/8oz85HPGDi8V6XtjMqtRtI0vFDKzW+r9OPhyH1ppxizZdgx0OQWN55vWRJkdilAGwY+9ZS5X+zvuz7ASXJBGbPMYpKzF8gBciIEpPdEuCitymoITvgfBYaRWbwlGtgJ4Iqn4DE4sp/Iq8K5WBBDymDybD+ouXY0cqI+rqDTA+Y9Ai4pU0H46UrpwIy8bJARooj5y/hhRrHvt3etSpIJqYFanAtB2bXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gYrkyFP2jTLGW8YK3JEk+K7eoY+0DmWqvKNyuMxp2U4=;
	b=nWbDnW1KWnXgsD4ziS3sT/gkmcvsotwCGP1oWzSGdUSgtrhnMWoVg+dr4DzaPdY7jTjuvBsiXPNkZwM68wvcieQA91jQbsznQOiPQhl463mojueJQVHunDZHrF/4IcvTehKHvU5P0hidriz/lxySwEgQm0vD1gXMZuA6RDTpmLXhDGGYYAuddzTYpIg3PX6IvxEFMqe9YYHUPz5370mVhJqNc0ifWYmgao0isiL59zqMNaxP2Cf2V88BvZW/1MIHvJ5wllnmTqu7oEW3595Z8+gtxt53wb+jDrEVjMFImei3u1vK+EBTYXhwjApIvsL/7ZabMq4PvVicizMQXgpNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gYrkyFP2jTLGW8YK3JEk+K7eoY+0DmWqvKNyuMxp2U4=;
	b=gBJKxyzm8/EmRqqOVHTHGN37MRWTANVTmJt3wOHD/LtCTCcYE6ediYgXW/pPY46nPdgeYpGBO7iPk/a/ESQZF0F4x4rbZvxktjXkQbOIfdUQpk4b1WaM/3b7uYP3xOGplyLNCmkQvZamS+cIo/F7Chx6d7bVhX7GdNghjwv2fwc=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2664.EURPRD10.PROD.OUTLOOK.COM (20.179.1.74) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.20; Wed, 25 Sep 2019 09:32:27 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8%3]) with mapi id 15.20.2284.023;
	Wed, 25 Sep 2019 09:32:27 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "laurent.bonnans@here.com" <laurent.bonnans@here.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] [warrior][PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVR6defzhnBU0AEUmRfvXMV9SCuKcZ6DmAgCDaYICAARz8gIAAjWmAgAAL+oA=
Date: Wed, 25 Sep 2019 09:32:26 +0000
Message-ID: <1f780a6de67698530d7a338f0b17a81a05b5b334.camel@aerq.com>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
	<6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
	<ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
	<7fe69c8b-abc8-9b97-753e-da531152eadd@here.com>
In-Reply-To: <7fe69c8b-abc8-9b97-753e-da531152eadd@here.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa93d5bc-41de-45e3-8638-08d7419b476d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600167)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:AM6PR10MB2664; 
x-ms-traffictypediagnostic: AM6PR10MB2664:
x-microsoft-antispam-prvs: <AM6PR10MB2664A7BD0508A8A4286B2BFA96870@AM6PR10MB2664.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(136003)(39840400004)(376002)(396003)(189003)(199004)(11346002)(316002)(110136005)(66066001)(7736002)(5660300002)(305945005)(86362001)(508600001)(36756003)(2501003)(71190400001)(71200400001)(2906002)(8676002)(14454004)(6116002)(99286004)(25786009)(3846002)(6512007)(118296001)(81156014)(81166006)(229853002)(76176011)(66476007)(446003)(8936002)(26005)(2616005)(66446008)(66616009)(66556008)(64756008)(6246003)(66946007)(6486002)(186003)(6436002)(91956017)(476003)(76116006)(2201001)(99936001)(55236004)(486006)(6506007)(102836004)(53546011)(14444005)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2664;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jQa5M74DI9M4d98GhTTB0zp88tMp4fJVMde+riaV1/qOC8Qdpubom90J3CzrilmxVONNcCJZJZQkZL7s17F5I25ESbh7/nOZ4CwRS/zVR0KhGa0YTcvmKYyi20CfWwKzhjG4dzF+x/mY9A01tAG4tfCzy8qeILR21GI3MN13/HuEYEbNPWLQN/1sMovAjgtYqHlmlCYe8VQ8v9nPil89ENkhw0lLDVsNE/bp5vHI8S4LzYSshNxU+nVLaV0OkB39aNHiwJp3rF/bbr/iD+B3oZPVIsG1UNz+cQ94y/17LCKW/60Z91VzoBKDCnr3kXzjHl4kyMd3fPg2rEnhGnuVZh/gcbfQMqDEqSl4wgfRSzbH4zUlfm5F795z3Yxrm934Zb8wrjC0Qv0outDww4QKThVqLJJL1OeAhkqzgih+FGc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa93d5bc-41de-45e3-8638-08d7419b476d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 09:32:26.8402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +i7kXrUqQNws6OFbvfrbTYMgB8kplyamHZ6qGGYHbl7ISumQ0y/uXSTOqtEA3myr5J8MRagREA/zaiPQYRKsZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2664
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Wed, 25 Sep 2019 09:32:27 -0000
X-Groupsio-MsgNum: 129472
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vzyFOE8qSQTbTzsnx/HT"

--=-vzyFOE8qSQTbTzsnx/HT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 08:49 +0000, Bonnans, Laurent wrote:
> On 9/25/19 2:23 AM, akuster808 wrote:
>=20
> > On 9/24/19 12:23 AM, Bedel, Alban wrote:
> > > On Tue, 2019-09-03 at 09:41 +0000, Bedel, Alban wrote:
> > > > On Wed, 2019-07-31 at 13:53 +0000, Bedel, Alban wrote:
> > > > > AArch64 images are not self-decompressing, thus usually much
> > > > > larger.
> > > > > Boot times can be reduced by compressing them in FIT and
> > > > > uImages.
> > > > >=20
> > > > > This commit is a backport of commit a725d188b5 (kernel-uboot:
> > > > > compress
> > > > > arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove
> > > > > useless
> > > > > special casing of arm64 Image) from master. Both commit were
> > > > > melted
> > > > > into one to avoid some useless churn.
> > > > Was this patch overlooked, or is there a reason it is not
> > > > considered
> > > > in
> > > > the next round of update for warrior? Without this patch kernel
> > > > images
> > > > are too large to fit in the flash of the system I'm using.
> > > > Furthermore
> > > > it is not trivial to fix this in my own layer.
> > > Please, I really like to get an answer here. I'm fine if there is
> > > a
> > > reason why this patch is not considered for warrior, but just
> > > getting
> > > ignored is very frustrating.
> > This appears to be a performance enhancement which does not fall
> > into
> > the criteria for back porting to a stable branch.
> >=20
> > - armin
>=20
> Just to bring all the elements on the table:
>=20
> It's possible to argue that it is more of a fix for a performance=20
> regression, as the sub-optimal approach was introduced in
> 1aa417df604d2627c56232a7a2c396c6b085d74b and  the patch
> in question is equivalent to a revert.

Also it is not a question of performance, but of storage space. This
commit effectively broke every board which doesn't have enough storage
for an uncompressed kernel.

> For example, the pyro branch does not seem to have the issue.
>=20
> I don't know if it makes a difference in terms of criteria for a=20
> backport but I agree that the problem is indeed made worse because it
> is quite hard to override in user layers.

That's exactly my problem, I really don't see how that could be fixed
in my own layer. Furthermore, unlike ARM or X86, ARM64 doesn't support
self decompressing kernel, so that can't be workarounded from the
kernel itself.

Alban

--=-vzyFOE8qSQTbTzsnx/HT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAl2LNCkACgkQdJSaS524
LbwtGRAAx19CQf03xJEni1xG57Hnir/LM/ObBrSiLvCbu01NtomDmwYWLVW6nxyb
JIir6Ll97+dbp2k17WTEfX7xhLq9IONRpXbmT05TgLhKeZ3PgyVdCp4kTdz5sRKR
MbnS3E7lpaF2/AE0WOGSBASre3EwaoVTgkzIua6FSW6AHXFMGlBk68P8tUhopycz
s9m0AYMe0Bbnj3UGMkUfOc3BjhCB1FDvhMiefaQHw8yGi+6Ybk2era2XufkJicKJ
MMPgUoHTrNO0wO3RbpiYOHkFH5TgHy5iiWEhgbqez+hgmH3DM0vyZVImYJKypxHR
Si/NPTeJF+f6icg0t0TGmcD0t9ivRbHr1cZMMKff41O4i0Rk32e4CdccqmE+Rf6I
f6rBjfBrfbuSdRYMfDa5k94mczLmFfCRzaeH10R67Tus9NgApdi3sYExpf9WeXjR
+9xtbgB0sNX0oPNnFoKn87l4a6XbHM3eLnCxyRWUDqvg5ZJchOIjQ183kggS0/4e
gAZS3Wu+x+NmGH7gm759W0uUVZV2J5Rz4JvAh+QApN/wERj1LiaQqFnDBbCJ8rTu
ewn013LBJiGwDIF3sIaO72HehdOKZU5w6GZ/qseGxsbwSwORJludnk3b9J0EqSW9
AUtZaEEq5TyvBrYXwfLXoQ2vRItHqfWiie86wBIYPe4i+PxnDGY=
=gH22
-----END PGP SIGNATURE-----

--=-vzyFOE8qSQTbTzsnx/HT--
