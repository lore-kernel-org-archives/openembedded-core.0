Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.117])
 by mx.groups.io with SMTP id smtpd.web11.2051.1610706050782737399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=UZcY1Xie;
 spf=pass (domain: microsoft.com, ip: 40.107.21.117, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdY/g+X7h3QixTMcfJ+f9vp79i46OOIUDt2NOKSTJmYW+XCfQtsIXoGZ0Mva6O7Bn77sOJz+7Glt4sX1gTvocd+x5IEkDc+7iLs+h4BKVpYzeQn7ADAi8poEj9RHWlTKV/DhV34OgooQditH/bb9RkwvXqcEiQjNJ9H7le1XFlTFn1t6wf/8wg/cMfrSqej38hxaTnYWUugE3UYBDxTlFDszvaIkRRUBt/83X1n6pRQmmsB4RMw513IMNaxFxWKhJwiWOK86vyO/9ypre/JI0wdUfURkvK7yVzsWn+z3/oT1ytiBc2ITej/oaULmTIEeauY/BlB2P1QiDzBbFHKsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7naxX+5q8toh5NMApZKXWw5bwlHHiCmFHjQ96EKOYwY=;
 b=OkvnAzrQ5r1A7GEum2CDS+Sh4QuRnjJV+Ohjy3p23kCgVep/rx7tOhqZRuUjKnCckIX53lEqiDgNFSBo777Jidq4k8H2fzWgPBob0oTEdyCVpnb3Qw+j5i/5rzaf3mf9niPhW34k3PhSNTcuYWGzxrqKczubTu9VR584e5WBtcHICxnPJad5A4HFReVf2ukKg/o4uiexytLrDCPGt8TtYEK9qfHw5BvXBbxA4GM8ITH+C+rxsIBatdHGhATNNcwjYTItD6OoCgGutYg9ENGYFvumKRqa444FsCRG+hbzBShqzC3u7R5EwajL5pQuOLvd9PS3Su9GXhbKViMX97/Ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7naxX+5q8toh5NMApZKXWw5bwlHHiCmFHjQ96EKOYwY=;
 b=UZcY1XieYeKs2PST3j+UH+GLvH3WN7syMNvbBWz5Ud9uvAC3y8D0cngzyJXbIRw0+J+RhpUJRuD/OitUyGbHVTp+c0lL5iruvfT8Ck1Auui0jBnwnS/fhpAQPyMTZanbCuWpK3GJoTIX5957f9wwB3N7lT9itmkTZe9jq+64U3M=
Received: from (2603:10a6:821:7::20) by
 VI1PR83MB0272.EURPRD83.prod.outlook.com (2603:10a6:802:79::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.1; Fri, 15 Jan 2021 10:20:47 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 10:20:47 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	<paul.gortmaker@windriver.com>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Thread-Topic: [PATCH] systemd: dont spew hidepid mount errors for kernels <
 v5.8
Thread-Index: AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooXVEAgAAWQYCAAATsAIAAAa+A
Date: Fri, 15 Jan 2021 10:20:46 +0000
Message-ID: <f6e14fd5e4dcbbe5a67e6588eb6eba1b890102b6.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
	 <45a86d715c0f75f28f38cf8883204d819c3a9d0f.camel@linuxfoundation.org>
In-Reply-To: 
 <45a86d715c0f75f28f38cf8883204d819c3a9d0f.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 4c9b2b2c-5034-43c1-8974-08d8b93f397e
x-ms-traffictypediagnostic: VI1PR83MB0272:
x-microsoft-antispam-prvs: 
 <VI1PR83MB02722DFF64F7DF7CEBBDBC04F1A79@VI1PR83MB0272.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eleMe66I0UAgrleqp3a7EvLYLsHcYVOa5FhA/MRgQ40TwpJtdTnvla/W/HQdTzzbHMBf9TP5YsUjWbTW7DrAXY+NZpqi/eaoGY1Qnza1IdxeSVHFN532tzBCnnl3umcRhVk+jcZJN1YAv0dySgkljdv0Pis0FImLgjnxCKe+GsixFz2bl6XKSXXf+M0h+SdEpwmkybHikXjVjb7FSx9/0BGMaIHhipEnlAf8BrbRvz/uA537CchwC2Y6ui1AsiSAQMmYt8zChI+MkGx0ZmbiZRZy3tcB4KIJvOyuVftH8IDOZd+E+vCUZD/T7jFJ4cTRgPT49JRLqOpUU+mnLYZ7Hh9UNCkoTR+exu9egCgb+6QnZD6l1c1k015wsPY8IcunE+r2ly/6UadXXEbL7AuQbs6F348VmD6PswWKIN6GV34xoIxi7kNyB6XRQBmZf287ppGMOKDZySzlrKH1h965eSKVC1IaB17Z/05SzwnkxlgIHikZrFxd+e6BcVmXXL+q2CkS+c6TUytBdu9BI5MRTDrDeYweqK05kQHt7clbZ6UGqGmxTmfeistfM36lLB3lbNlKyG1O1F4gJHmRl3L948/Tv+GUxcs9hINQgcCZYfBy5qDWEe7Renx3y/Jk3CCKEd7bodGPn0gQAKYyGH+bmA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(76116006)(5660300002)(66446008)(10290500003)(66616009)(26005)(8676002)(66556008)(64756008)(478600001)(66476007)(966005)(2906002)(2616005)(36756003)(6506007)(8936002)(82950400001)(316002)(6486002)(99936003)(82960400001)(110136005)(71200400001)(86362001)(186003)(6512007)(66946007)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?M1hKVnRrYUw0T05OT3hrVVBNakFDZ2tnUnk0NENxelZyc0FkZzYyV0VHb2ZX?=
 =?utf-8?B?QU53eitEY25pQmVxeFA4NmxoVXlpdE9YVno4bndub3A2bXFiZzBVZG9wMXBO?=
 =?utf-8?B?Q2o3MVBFMjJ6YnVucTltakRFcmphNStWT2VnVjdVN3lJalFTUE0vZ1BPN21E?=
 =?utf-8?B?REgySlRzRjYxaTdzdGRXeXN3dXY0KzUxWm1hNEVna3BMdDdZcjJFN0NxRmhj?=
 =?utf-8?B?aW0yeHlJOEZYSnhvVWxrcGV2R2QwVDgvZkVGeXBUTWlsb1Q2T1JxdmZwV0o2?=
 =?utf-8?B?S1p5cG4zUTR6bXZROUJ6R2RSMWM1bDRHQlhWWFNhSCszbWZaRnNOSmZKd0R5?=
 =?utf-8?B?Y3gydWhjKzZXbFRLWXkrRUNJTjVlM3pDc3h0Zm00enBqdmdVYys4cVBiZytM?=
 =?utf-8?B?QVN1K0xGcmxKVjdzbDJPbkFoQ0NwQUsveFRJS0ZLbzNLbFhkNjlRVEFJYThY?=
 =?utf-8?B?UDhVbk5YYWhuNXJWVFJLeGNHTDIxSW80YzI4ODlUZWpYdTJrZGVpc2dVN0hC?=
 =?utf-8?B?a1czNGxXZ1FYbU52ZGcvT3NhZlIxRkx0NGM3c3p4SlNNZlJtOWRvRFVQZXFn?=
 =?utf-8?B?UGRpeW5SeFMydEVBeFdjZlg3K0lvZVJ5ckN0VG1xZ05zWitmTkxPNWE3WVZl?=
 =?utf-8?B?ekZxRTRjN01VaTRkSUxGaHB6SUVONHIzVnAvL3FyNllLSVBWaS9PWklDWUJT?=
 =?utf-8?B?enRVZHovSG9Nbm1iWEFTd2s3dDZJMlpJRWRPcHlHMXd6NVBYNytnb3dJY2Zs?=
 =?utf-8?B?MkdYa0hRd3FBNHdFMmRWWWlXbGxLUHkyUnJ1eVl6eWZVcHhCQkI2dkZ1dUJC?=
 =?utf-8?B?V3NReFZvbkFVNHJSYUdJczBtbGwyY0diWlVvUjRjU1Axb01pQ3RseGNQRVQr?=
 =?utf-8?B?MXpNSUlVeUh3OUQ1bEdWKzFYRmtRdjl2T0tqcWRUK2U3L3lJTzJMUHR5ZEpk?=
 =?utf-8?B?Ynh4K2ROY1NxaXRZU2I5ZTRaSDZORVpmWjJQUVp5VjRzUEdua0krVFM2SlBt?=
 =?utf-8?B?RkR4UC9CMzNjSGhFUS96alg3TndTQzJRRWFzQmRSNVB0dStyOXA4SlJPb0Js?=
 =?utf-8?B?S1FtWlNTR3ZwaVZ2RjFndGdrRzUwYVljNnNteVNjbExtRDlmSE9BeFdtbHNn?=
 =?utf-8?B?VTVXWlZ4RXJWazE3QTF2cTF5a2lSVmVtWk9rdThxaXJIU0dUWjIxUWVMeU02?=
 =?utf-8?B?ZldpamZqRGNkYlU4dVNDc3NWRU16NUl3eTAxRTZhM2pFT0o2Y0t1eldzbXBM?=
 =?utf-8?B?OEtTUE5xaWN3K2dsV3c0UEZSZnludHpiMGpwUVovMjFyRjZlRDJ4WGtnczdq?=
 =?utf-8?B?UWxQa3hqWkhyK0hERWxEbE1uSSs0eHBLSDFveFVxYlNGTmpjcVBBSEZnL1gv?=
 =?utf-8?B?UlR6eEVDR21XeGM1ZndkSEwybnRVQ0lLb01tM2dhRysxOUJ3WGZ3RHdFT0J6?=
 =?utf-8?B?YjArMTN1N0VhYzRDMnpFNXhsV3M5YXZpZzJ6N3RnPT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9b2b2c-5034-43c1-8974-08d8b93f397e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 10:20:46.9338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvzNu+1k/cOOjpfev5XBqGUD8OgeF1lE837ngdzutWMCsa1D9CsS/ZY2nP8WPOZmqgsuqpkNKbaCaJzefVxKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR83MB0272
X-Groupsio-MsgNum: 146734
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nHRM1PDE1HIdiJQhdAQ+"

--=-nHRM1PDE1HIdiJQhdAQ+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 10:14 +0000, Richard Purdie wrote:
> On Fri, 2021-01-15 at 09:57 +0000, Luca Boccassi wrote:
> > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
iki.yoctoproject.org%2Fwiki%2FBest_Known_Methods%23Patch_Comments&amp;data=
=3D04%7C01%7CLuca.Boccassi%40microsoft.com%7Cd96a07e0ec0740e98b9a08d8b93e64=
09%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637463024985923638%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DaK4%2F8oasYb3NJ84rVUq6ptf0nRnwDKniKj4jIB283EY%3D=
&amp;reserved=3D0
> >=20
> > Richard, FYI this appears to be an empty page.
>=20
> That wasn't the link in my email, the link was:
>=20
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.=
yoctoproject.org%2Fwiki%2FBest_Known_Methods_&amp;data=3D04%7C01%7CLuca.Boc=
cassi%40microsoft.com%7Cd96a07e0ec0740e98b9a08d8b93e6409%7C72f988bf86f141af=
91ab2d7cd011db47%7C1%7C0%7C637463024985933630%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DTOAqow8KyiRT6i3LtpEeS46T0Dq8iixSNc3l6XpDzhk%3D&amp;reserved=3D0(BKMs)=
_for_Package_Updating#Patch_Comments
>=20
> The brackets in there may be causing some kind of issue?
>=20
> In case it doesn't work, the page in question is titled=20
> "Best Known Methods (BKMs) for Package Updating"
>=20
> Cheers,
>=20
> Richard

Sorry my bad, it looks like the Exchange mail server mangling of the
link ("safelinks" feature) removes the brackets and makes it invalid. I
should really stop using the Microsoft address...

--=20
Kind regards,
Luca Boccassi

--=-nHRM1PDE1HIdiJQhdAQ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmABbH0ACgkQSylmgFB4
UWJoagf8DACl5YLG0OUs4xy5xim+4HG0s1ul1uFHHE300u1mLiSOJVxcaHdon05A
I282EjxceSeRtKSN44toWXuYNWhzPu9W6hQ80bbrr1vdBbnxQVpua9nzHEF33ryj
xmI9vzSzxc5lgMNbvUYIeHodV5Qt3EqKIM3b+5+MLl5rsU+S3Gq9pft6sVLHmyYb
f5zb/lgAgKeYpoSsDLhZQlT5DytwkKLEJg4JJHToVpeWDm/vW5VXGXEph8IqMDde
gemiOj4BfxwIF4rdKy0CvTWoYir9voGEbYQMsyKLrdpb0rcNzs2EWOdkreKLHnix
aCX8aUoyZkUIw+Ga2EPpdDB50M/G6A==
=sFmX
-----END PGP SIGNATURE-----

--=-nHRM1PDE1HIdiJQhdAQ+--
