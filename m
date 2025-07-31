Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6BAC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:15:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.web10.70592.1753989296171255690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 12:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=x4MzZGBG;
 spf=pass (domain: siemens.com, ip: 40.107.159.28, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZsFagZ3Kr8ZKWEQvWNr3KIhwzbo+FTPOUzE8MQC2UenoF9nWWl4G4bhU+p4oLEopTKz8oWbWsuF9C+sGNr4kgWMXVEMu4Xeg+4/eWingam9ZCXVgJjf6ZG3lwx7LrBL4MZ1mjLzu8lHl5fO2pWRIsCKiMRnzlvO2f0S8EmIA2wDromWYCqb8YWpk/rKVwfamDOowuBzbZPMguypxz8CZ4Z+0rPSd8CD52byIwB7940JEkZaWfy9QAZ96DXeZEfKGZOE4DPF/86AyI7e92FLtbwYRvgPo9cpuWMuyi3h0N8BkZDHc6ZrR2uEcnzWHg2xRwDVMWoHn79hvK3euD15IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjHjiNewPRQyoUlAElXNNbJR4/QzXmeI1U4wjl2A9/Y=;
 b=HlXzNLRTDiOl859R6OthYCXtVX8leHvaezLRN7IMru2pbx9gMl6mzmAcHz1OnfROA8+eJJSGJeemeMWqmn4otrkFZ1NGq+aXdNZtyt+YUAx19pcvIsMgDMUBGrA7/bUFXj1ZauxzvXA7Mnh0l1P7FFM/OyUjMZ6+X/a6EkE3O+B5EOe0mbvZIpxShZ2P/Vya1cVAH7b7hIcgL2XoMvaFNX8A9LU5BcQ37MpTue0wTBqduF7+3LtoLwN8V63GEm0bTv+SH3lpI8TuTGOpxyzRc38UKIO/Kt7BU0npm3kt55+Id10Uv19KYRIkxYrfFJ5jEFSv8ROSfEGzESoXgS9uyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjHjiNewPRQyoUlAElXNNbJR4/QzXmeI1U4wjl2A9/Y=;
 b=x4MzZGBG7ZpqS9q/hnM3kZgEUeh+R7QfkKCjNhJERi/WgGuSoyuniO0M30deFFhL983veqBNwZwobdChhn1sp0MfyWQKMA5CXvUth5eTWwWBzqRC0UPTt4gowPZAofYJBTl3DHl1ta5Xk4ovutsg5Mj7kvhG/f5PgHsatIZSUcl0xsWvZBR//7OSDKXaFLWBnEfGqcEwOg9pMecaHJH/fYTerMNE2UaTNJDHG09ojHRUbKOpYct5tggmSlb+CoUIROFFYE5b4meqyfGCHvzOZZL3dvYmrESzQkv4ol94QvX6Y2ivJDzCDR04egI9i1BmnwKuGu4rnbnREENTPwJcmA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7524.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 19:14:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8964.024; Thu, 31 Jul 2025
 19:14:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [OE-core][PATCH] oeqa: do not fail when sdk package is not
 available
Thread-Topic: [OE-core][PATCH] oeqa: do not fail when sdk package is not
 available
Thread-Index: AQHb+5rLxp7uue/DcEi8nc6myk7W4bRI7hAAgAO2FwA=
Date: Thu, 31 Jul 2025 19:14:51 +0000
Message-ID: 
 <AS1PR10MB56974A330B128E3E7F9A8FD5FD27A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250723062616.101590-1-peter.marko@siemens.com>
 <F3F17D36-6445-4D90-88DF-DCFA46DC6158@arm.com>
In-Reply-To: <F3F17D36-6445-4D90-88DF-DCFA46DC6158@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8428bcf4-2a2d-4180-a3c9-8c6a9e13c2aa;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-31T19:02:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7524:EE_
x-ms-office365-filtering-correlation-id: 67cf2431-98bb-4205-0e41-08ddd066867d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4053099003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?D+06BqRAnssatTwoqThCddP1h8DzDaO3C9Jpjp3xux/yWEnM3039aKHSgO/I?=
 =?us-ascii?Q?1jFc8UdRVQieFFckqjRw8jzorYlH/DUdsqaYpwiBWf/BmIW9mdmrgZiYEvtn?=
 =?us-ascii?Q?1hO4O5ZT/+MCqA3Guf4F3w4Ct+qJyaysdGLom2q9XgC6xXQRAtf+GlmcMYgw?=
 =?us-ascii?Q?fG4QZjANgT38SfbBeEcnq9wxaBRGlg1CtWyKNdjZo+lRDGJkTH63SwHwO3vz?=
 =?us-ascii?Q?rgvq21TSpLgAb3cqxpEVfpP/wmX1DXn9/J0kWdUMUyil0AlK8FJlC9R7L2/U?=
 =?us-ascii?Q?wmlhkLmYLUlM5kLdKr751Ayw+wyqV9+zXUM7+gLYj+fkWdfxNw3uDwvcEDkl?=
 =?us-ascii?Q?8bw8nCffkzGIbIGof4gNJ3pCRqP6tSwb1zfIDpGJpFODZV8Cjn0JKnspDTRb?=
 =?us-ascii?Q?4IW5fDfJvf9WVi8xvC56KofGNWLOl+uL+y6MM+g5lXC+4YayecDw9V30v5e6?=
 =?us-ascii?Q?D/w4gPA5UV2VIe3HEM+HUP/q+sl0tGRIz7JqHjFYw9c7ikKWnOeDrJI418KK?=
 =?us-ascii?Q?GCDoDMYlP7TEH6aG/rT1WyNWzcUKTqpIoHppxCxUWTyuKndQ4CGN0oi9I4k1?=
 =?us-ascii?Q?pjvmw/h3U4XMhy1lsV1RQVFTpOPSBbnrU0ZrpnnU592xhcHdstt0vGlN4HSF?=
 =?us-ascii?Q?rMmlinnDT7Ql3SaxFBC/alp+djKZ62LNSasZecZd6AI3pLLZN1j7ornCaD3B?=
 =?us-ascii?Q?v/Ef1d2TxnSEoZ99L+Sk5/6zbPiKy+ffeyyzYzd3Ps+yqEYby9MheDDCNurM?=
 =?us-ascii?Q?v5b2pP5AbsAQrs/qa0qT8imO7blWW2QB7cN5tQ84Y5e8tfxrEEvhk+UbjgCs?=
 =?us-ascii?Q?aUQEJp/mEjpnlKYARRUUDCZ5yL++o56JSYpECmqUrX57AK/D/DqVcE2wkhoe?=
 =?us-ascii?Q?/lLNEIqm3gWz1t9rb+jsA9HvMs0IZEDLWqSqC7/KHq4G1k29AWLAG0gAKnLf?=
 =?us-ascii?Q?mvzIdUwFoJUr1+dplN6K0mObOnu98kaIT9ja6EKbTDtQIg4CH+GLpwQY+31v?=
 =?us-ascii?Q?cIxppoCn0MFRGTeHWUWifvlYvZFtv0UVqX9same4aAjUmAFhBYX9FK1RN1yw?=
 =?us-ascii?Q?8uqTLCcNTnVu8PM/ixXN9cCzafYL4N+w0hURDJPY0yC56dMdEcqfw+3Cg7Gv?=
 =?us-ascii?Q?vr+5pgTED5fib/gndkahqwkIE8wZViaZGTQXfu1D1wQ/gpqUS691zlZXAG3E?=
 =?us-ascii?Q?8Qul+v8AUWxzfLTv1jyCMSnGz5cgOM1IEMJCRoxWFh1XS/DC3wKNBKP7HQMJ?=
 =?us-ascii?Q?uBQAUWIK9gtIZymQeS/2elqmpnVcc26w3pbO9UWJezxrE3AGSjqBd0b6wWwi?=
 =?us-ascii?Q?U+rqIokDZZHVFhwMEftwlW7WqxJJ3+EYtBJNEHNt8/rrFrfl6zdR7tvUNl2B?=
 =?us-ascii?Q?sLXyulUV4blFTL2ACnt8g+RQADVMiWvA49cCkauk9fyKhdGRE/KxRgr0Wc6/?=
 =?us-ascii?Q?wrrXgcDijIwnW730oGUooo4OuUJEvz+2RAGtPTfnOBJqHOXxqRH4udvzCu0E?=
 =?us-ascii?Q?fXDDdbr6fLQgNfM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AtRdXCc3n0+d8qsr36SmCCLBQg11BB3rwG5dQSIPepoEspkM/d6c5MWAgWva?=
 =?us-ascii?Q?f/6zH/qF8os4hfl8ZDSv+4huoAG2vMJIm6Lrk9Bf+6cE80kIgKqs2ssHHYxY?=
 =?us-ascii?Q?ky53REsqNkK9MMwtCCLQDFPbmEpm9fme+8B5ujt8kOtbtewbQIpYP61IOH91?=
 =?us-ascii?Q?RYuCDmNGXkRz7+DUSsc7nH/ZiNQAV9SRsUI37qNwf4wCZgTQ+13l0rdfOQhS?=
 =?us-ascii?Q?6CjD6dBh/FSmjHyLYjkJ3PZjKkpdQVvZeLQtW2mRkDecygTW/oQjQHcWj8b+?=
 =?us-ascii?Q?qEfslcoqoDeCoA+GeCoTNdw52NN8dz6Vrg5RRj+3akg8liPfWOdN6pK1UtJa?=
 =?us-ascii?Q?kgkw8Dh6z/Rz4JRlAxPClKThA3/3RqQRMSqVRx1AOe2NGUe/qsVc35OKDrdy?=
 =?us-ascii?Q?c87Ng9Slu432SUz8ZJ/asDE/R4oqw1Oze75mBRTvvzi3YKKIrTrZSQmVB+Yj?=
 =?us-ascii?Q?ATfm/aYP3cfRcB1zFuujAg2NWcu0TUQoniLYWLszctbStsyimd6ryCA6ErPL?=
 =?us-ascii?Q?anAduDO1XGbIQoa93E3hEECMOBXjhJ28xZfifV4Sq8kjgJZuppHVQ9k0xZYh?=
 =?us-ascii?Q?aI+OAEIDhqOCqwOriJlPBFj5WA++wc5+O6QH7MfnUdTqcZq5J4vXoS3yhDYU?=
 =?us-ascii?Q?m1N4ZEXxZnJUKyKd3zgUwNp0fBtWafpmL3qA/8Jbb4xP4wH1Mrx8RZniw9lN?=
 =?us-ascii?Q?FSm4TfxiuPacGaSQXrEbnP61a/uXdXcfevySuiwvcoqrfxuGQewq+zk6yNn7?=
 =?us-ascii?Q?4FO9izHMwx7Ry8JTZEHNftg6mvD4wQSrLDzUFI4JqeR71cWyGkh51or7v/j0?=
 =?us-ascii?Q?7zgFAPYgM6nNGHoAnLuCld2aeSOYoh2bT/QqBhk9xhoAd/HnwwWh1hs4YBvU?=
 =?us-ascii?Q?Yajs/RlhisJByHJTMAzNgo4wTWdftO4XxYQo/jAV33vyiG5Xaer4pEMnT1VQ?=
 =?us-ascii?Q?J8xS44Q3y1fzfWjtSoqtMDKm0eizKKjIgwjAdVYq4PhshpVbRVd9eEcqyT66?=
 =?us-ascii?Q?mP+rdEmmtu3wNCfwJWXZqB5QxBEkmbwEm2BJriemBgU8eURNPnspTUqHTKbu?=
 =?us-ascii?Q?qU9pJjNnN7F/rwHb/mK+1m4n89gbBpfcVTex9dTGAdfxwhW5L1LZiiN0fF8l?=
 =?us-ascii?Q?sTZu8m2FcosfivdFQuj4nZa/FAQ6Et2VT0+Yaau7kPXFTKgDJKCf/dyCazHU?=
 =?us-ascii?Q?AhsjZf7tpnN/1G8M0Io1Dz6oR3dzMajtEU602rvVDtcSDXRckslxW6gNOVwz?=
 =?us-ascii?Q?AgiBAZpBUR2JVPwE9cSTd9r4aOaD4DW1YYdm/eHxudzt8hgknHFkGg2vkx44?=
 =?us-ascii?Q?ajTTfGMcW0pEz2WFbvV/5vl+KR58iUtWoGp5C9fiulRl8vYSkg/rS9zmZH2L?=
 =?us-ascii?Q?0v+iBbo6MgMupQ6RMIeNRBJVEDBtIeW104DKfxA7lno6yaoJVRtg6TMphff+?=
 =?us-ascii?Q?6Y/OcgeQs6/Hvqrp9BjXKzFhAdrQ2Vy5ifQ4e/1mu/ASDK/K0qVTn+QRRC+f?=
 =?us-ascii?Q?WI9rSxnHFcpmDp5LOyHfC1IPQcMfn8VNQOZQ1z+t9PXqKgq0GBhO6oYB+y7V?=
 =?us-ascii?Q?H+YVrrWpDdlLl1TpPvBfPYzSad1jkfaf5iliNmKs?=
Content-Type: multipart/mixed;
	boundary="_002_AS1PR10MB56974A330B128E3E7F9A8FD5FD27AAS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cf2431-98bb-4205-0e41-08ddd066867d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 19:14:51.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJ+CKQ21NgNuT1ovL/VhW9gnobhcm1CZauak+j1i+nHfNja7EZoSOmbUrBG8LwDUaF3iWEHgpgPtNzmFCHSTVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221205

--_002_AS1PR10MB56974A330B128E3E7F9A8FD5FD27AAS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Tuesday, July 29, 2025 12:22
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org; Khem Raj
> <raj.khem@gmail.com>
> Subject: Re: [OE-core][PATCH] oeqa: do not fail when sdk package is not
> available
>=20
> On 23 Jul 2025, at 07:26, Peter Marko <peter.marko@siemens.com> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Prior to commits:
> > * 11277efd057685558a744e98082b5709e849dd2a
> > * d0e8b83d05957b1f22d08582e364afa4b522801e
> > the tests were skipped if package was not available.
> > Now the code calls function ensure_host_package which says
> > "try to sdk-install missing dependencies", however in fact for sdkext i=
t
> > causes a failure if the installation is not available.
> >
> > Since maturin is not installed in any image, it cannot be installed
> > unless it's downloaded from sstate-cache mirror populated by a world
> > build. These builds are however now not done for powerpc and mips.
> > It also does not work in local builds without sstate-cache mirror.
> >
> > Fix this by skipping the test if the package cannot be installed to
> > match the original behavior before those commits.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/lib/oeqa/sdk/case.py | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> > index 1fd3b3b569..002eed271d 100644
> > --- a/meta/lib/oeqa/sdk/case.py
> > +++ b/meta/lib/oeqa/sdk/case.py
> > @@ -44,7 +44,10 @@ class OESDKTestCase(OETestCase):
> >             if isinstance(self.tc, OESDKExtTestContext):
> >                 recipe =3D (recipe or packages[0]) + "-native"
> >                 print("Trying to install %s..." % recipe)
> > -                self._run('devtool sdk-install %s' % recipe)
> > +                try:
> > +                    self._run('devtool sdk-install %s' % recipe)
> > +                except:
> > +                    raise unittest.SkipTest("Test %s needs one of %s" =
% (self.id(), ",
> ".join(packages)))
> >             else:
> >                 raise unittest.SkipTest("Test %s needs one of %s" % (se=
lf.id(), ",
> ".join(packages)))
>=20
> Yeah, I managed to break the logic slightly there.
>=20
> I think it does, but can you confirm that the sdk-install output is visib=
le in the test
> output when it is skipped?  Also, the except should catch just
> subprocessed.CalledProcessException.

I will send a v2 with limiting the caught exception.

Regarding the output - it is not visible in logs.
When I added logging, it was a 105 lines of bitbake logs full of setscene t=
asks.
(see attached relevant log part from log.do_testsdkext)
So I don't think it's worth to add as it distorts the log readability.
But feel free to object and I can add that log anyway.

But something else good came out of it, too.
In the testing process I also had to fix OETestCalledProcessError, patch wi=
ll come.

>=20
> Thanks,
> Ross

--_002_AS1PR10MB56974A330B128E3E7F9A8FD5FD27AAS1PR10MB5697EURP_
Content-Type: text/plain; name="log.txt"
Content-Description: log.txt
Content-Disposition: attachment; filename="log.txt"; size=11738;
	creation-date="Thu, 31 Jul 2025 19:13:43 GMT";
	modification-date="Thu, 31 Jul 2025 19:14:51 GMT"
Content-Transfer-Encoding: base64

Tk9URTogdGVzdF9tYW5pZmVzdHMgKG1hbmlmZXN0Lk1hbmlmZXN0VGVzdC50ZXN0X21hbmlmZXN0
cykKTk9URTogIC4uLiBvawpOT1RFOiB0ZXN0X21hdHVyaW5fZGV2ZWxvcCAobWF0dXJpbi5NYXR1
cmluRGV2ZWxvcFRlc3QudGVzdF9tYXR1cmluX2RldmVsb3ApCk5PVEU6IGRldnRvb2wgc2RrLWlu
c3RhbGwgdGhyZXc6IENvbW1hbmQgJy4gL2hvbWUvcHJvamVjdHMvYnVpbGRzL3Bva3ktYnVpbGQv
cG9reS9idWlsZC90bXAvd29yay9xZW11cHBjLXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFs
LzEuMC90ZXN0c2RrZXh0L2Vudmlyb25tZW50LXNldHVwLXBwYzc0MDAtcG9reS1saW51eCA+IC9k
ZXYvbnVsbDsgZGV2dG9vbCBzZGstaW5zdGFsbCBweXRob24zLW1hdHVyaW4tbmF0aXZlOycgcmV0
dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMS4KU3RhbmRhcmQgT3V0cHV0OiBOT1RFOiBTdGFy
dGluZyBiaXRiYWtlIHNlcnZlci4uLgpXQVJOSU5HOiBZb3UgYXJlIHVzaW5nIGEgbG9jYWwgaGFz
aCBlcXVpdmFsZW5jZSBzZXJ2ZXIgYnV0IGhhdmUgY29uZmlndXJlZCBhbiBzc3RhdGUgbWlycm9y
LiBUaGlzIHdpbGwgbGlrZWx5IG1lYW4gbm8gc3N0YXRlIHdpbGwgbWF0Y2ggZnJvbSB0aGUgbWly
cm9yLiBZb3UgbWF5IHdpc2ggdG8gZGlzYWJsZSB0aGUgaGFzaCBlcXVpdmFsZW5jZSB1c2UgKEJC
X0hBU0hTRVJWRSksIG9yIHVzZSBhIGhhc2ggZXF1aXZhbGVuY2Ugc2VydmVyIGFsb25nc2lkZSB0
aGUgc3N0YXRlIG1pcnJvci4KTG9hZGluZyBjYWNoZS4uLmRvbmUuCkxvYWRlZCAyMDE1IGVudHJp
ZXMgZnJvbSBkZXBlbmRlbmN5IGNhY2hlLgoKU3VtbWFyeTogVGhlcmUgd2FzIDEgV0FSTklORyBt
ZXNzYWdlLgpJTkZPOiBJbnN0YWxsaW5nIHB5dGhvbjMtbWF0dXJpbi1uYXRpdmUuLi4KTk9URTog
UmVjb25uZWN0aW5nIHRvIGJpdGJha2Ugc2VydmVyLi4uCldBUk5JTkc6IFlvdSBhcmUgdXNpbmcg
YSBsb2NhbCBoYXNoIGVxdWl2YWxlbmNlIHNlcnZlciBidXQgaGF2ZSBjb25maWd1cmVkIGFuIHNz
dGF0ZSBtaXJyb3IuIFRoaXMgd2lsbCBsaWtlbHkgbWVhbiBubyBzc3RhdGUgd2lsbCBtYXRjaCBm
cm9tIHRoZSBtaXJyb3IuIFlvdSBtYXkgd2lzaCB0byBkaXNhYmxlIHRoZSBoYXNoIGVxdWl2YWxl
bmNlIHVzZSAoQkJfSEFTSFNFUlZFKSwgb3IgdXNlIGEgaGFzaCBlcXVpdmFsZW5jZSBzZXJ2ZXIg
YWxvbmdzaWRlIHRoZSBzc3RhdGUgbWlycm9yLgpMb2FkaW5nIGNhY2hlLi4uZG9uZS4KTG9hZGVk
IDIwMTUgZW50cmllcyBmcm9tIGRlcGVuZGVuY3kgY2FjaGUuCk5PVEU6IFJlc29sdmluZyBhbnkg
bWlzc2luZyB0YXNrIHF1ZXVlIGRlcGVuZGVuY2llcwpJbml0aWFsaXNpbmcgdGFza3MuLi5Tc3Rh
dGUgc3VtbWFyeTogV2FudGVkIDg1IExvY2FsIDE2IE1pcnJvcnMgNjYgTWlzc2VkIDMgQ3VycmVu
dCA2OCAoOTYlIG1hdGNoLCA5OCUgY29tcGxldGUpCmRvbmUuCk5PVEU6IEV4ZWN1dGluZyBUYXNr
cwpOT1RFOiBSdW5uaW5nIHNldHNjZW5lIHRhc2sgMTA3IG9mIDE1MyAodmlydHVhbDpuYXRpdmU6
L2hvbWUvcHJvamVjdHMvYnVpbGRzL3Bva3ktYnVpbGQvcG9reS9idWlsZC90bXAvd29yay9xZW11
cHBjLXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC90ZXN0c2RrZXh0L2xheWVycy9w
b2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3Rf
MS4xMS4xLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUpCk5PVEU6IHJlY2lwZSBweXRo
b24zLXNldHVwdG9vbHMtcnVzdC1uYXRpdmUtMS4xMS4xLXIwOiB0YXNrIGRvX3BvcHVsYXRlX3N5
c3Jvb3Rfc2V0c2NlbmU6IFN0YXJ0ZWQKTk9URTogcmVjaXBlIHB5dGhvbjMtc2V0dXB0b29scy1y
dXN0LW5hdGl2ZS0xLjExLjEtcjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTog
U3VjY2VlZGVkCk5PVEU6IFJ1bm5pbmcgc2V0c2NlbmUgdGFzayAxMTMgb2YgMTUzICh2aXJ0dWFs
Om5hdGl2ZTovaG9tZS9wcm9qZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93
b3JrL3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQv
bGF5ZXJzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvY2FyZ29fMS44Ny4wLmJiOmRv
X3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUpCk5PVEU6IFJ1bm5pbmcgc2V0c2NlbmUgdGFzayAx
MTQgb2YgMTUzICh2aXJ0dWFsOm5hdGl2ZTovaG9tZS9wcm9qZWN0cy9idWlsZHMvcG9reS1idWls
ZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmlt
YWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNlbWFudGljLXZlcnNpb25fMi4xMC4wLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Rf
c2V0c2NlbmUpCk5PVEU6IFJ1bm5pbmcgc2V0c2NlbmUgdGFzayAxMTYgb2YgMTUzICh2aXJ0dWFs
Om5hdGl2ZTovaG9tZS9wcm9qZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93
b3JrL3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQv
bGF5ZXJzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMtcnVzdF8xLjExLjEuYmI6ZG9fcmVjaXBlX3FhX3NldHNjZW5lKQpOT1RFOiByZWNpcGUgcHl0
aG9uMy1zZW1hbnRpYy12ZXJzaW9uLW5hdGl2ZS0yLjEwLjAtcjA6IHRhc2sgZG9fcG9wdWxhdGVf
c3lzcm9vdF9zZXRzY2VuZTogU3RhcnRlZApOT1RFOiByZWNpcGUgY2FyZ28tbmF0aXZlLTEuODcu
MC1yMDogdGFzayBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lOiBTdGFydGVkCk5PVEU6IHJl
Y2lwZSBweXRob24zLXNldHVwdG9vbHMtcnVzdC1uYXRpdmUtMS4xMS4xLXIwOiB0YXNrIGRvX3Jl
Y2lwZV9xYV9zZXRzY2VuZTogU3RhcnRlZApOT1RFOiByZWNpcGUgcHl0aG9uMy1zZW1hbnRpYy12
ZXJzaW9uLW5hdGl2ZS0yLjEwLjAtcjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2Vu
ZTogU3VjY2VlZGVkCk5PVEU6IHJlY2lwZSBweXRob24zLXNldHVwdG9vbHMtcnVzdC1uYXRpdmUt
MS4xMS4xLXIwOiB0YXNrIGRvX3JlY2lwZV9xYV9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IFJ1
bm5pbmcgc2V0c2NlbmUgdGFzayAxMTggb2YgMTUzICh2aXJ0dWFsOm5hdGl2ZTovaG9tZS9wcm9q
ZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1s
aW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNlbWFudGljLXZlcnNpb25fMi4xMC4wLmJi
OmRvX3JlY2lwZV9xYV9zZXRzY2VuZSkKTk9URTogcmVjaXBlIGNhcmdvLW5hdGl2ZS0xLjg3LjAt
cjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IFJ1
bm5pbmcgc2V0c2NlbmUgdGFzayAxMTkgb2YgMTUzICh2aXJ0dWFsOm5hdGl2ZTovaG9tZS9wcm9q
ZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1s
aW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdF8xLjg3LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdF9z
ZXRzY2VuZSkKTk9URTogUnVubmluZyBzZXRzY2VuZSB0YXNrIDEyMCBvZiAxNTMgKHZpcnR1YWw6
bmF0aXZlOi9ob21lL3Byb2plY3RzL2J1aWxkcy9wb2t5LWJ1aWxkL3Bva3kvYnVpbGQvdG1wL3dv
cmsvcWVtdXBwYy1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvdGVzdHNka2V4dC9s
YXllcnMvcG9reS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlm
aWNhdGVzXzIwMjUwNDE5LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUpCk5PVEU6IFJ1
bm5pbmcgc2V0c2NlbmUgdGFzayAxMjIgb2YgMTUzICh2aXJ0dWFsOm5hdGl2ZTovaG9tZS9wcm9q
ZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1s
aW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlic3NoMi9saWJzc2gyXzEuMTEuMS5iYjpkb19wb3B1bGF0ZV9zeXNy
b290X3NldHNjZW5lKQpOT1RFOiBSdW5uaW5nIHNldHNjZW5lIHRhc2sgMTIzIG9mIDE1MyAodmly
dHVhbDpuYXRpdmU6L2hvbWUvcHJvamVjdHMvYnVpbGRzL3Bva3ktYnVpbGQvcG9reS9idWlsZC90
bXAvd29yay9xZW11cHBjLXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC90ZXN0c2Rr
ZXh0L2xheWVycy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L2NhcmdvXzEuODcuMC5i
Yjpkb19yZWNpcGVfcWFfc2V0c2NlbmUpCk5PVEU6IHJlY2lwZSBweXRob24zLXNlbWFudGljLXZl
cnNpb24tbmF0aXZlLTIuMTAuMC1yMDogdGFzayBkb19yZWNpcGVfcWFfc2V0c2NlbmU6IFN0YXJ0
ZWQKTk9URTogcmVjaXBlIGNhLWNlcnRpZmljYXRlcy1uYXRpdmUtMjAyNTA0MTktcjA6IHRhc2sg
ZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTogU3RhcnRlZApOT1RFOiByZWNpcGUgcHl0aG9u
My1zZW1hbnRpYy12ZXJzaW9uLW5hdGl2ZS0yLjEwLjAtcjA6IHRhc2sgZG9fcmVjaXBlX3FhX3Nl
dHNjZW5lOiBTdWNjZWVkZWQKTk9URTogcmVjaXBlIGxpYnNzaDItbmF0aXZlLTEuMTEuMS1yMDog
dGFzayBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lOiBTdGFydGVkCk5PVEU6IHJlY2lwZSBy
dXN0LW5hdGl2ZS0xLjg3LjAtcjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTog
U3RhcnRlZApOT1RFOiByZWNpcGUgY2FyZ28tbmF0aXZlLTEuODcuMC1yMDogdGFzayBkb19yZWNp
cGVfcWFfc2V0c2NlbmU6IFN0YXJ0ZWQKTk9URTogcmVjaXBlIGNhcmdvLW5hdGl2ZS0xLjg3LjAt
cjA6IHRhc2sgZG9fcmVjaXBlX3FhX3NldHNjZW5lOiBTdWNjZWVkZWQKTk9URTogcmVjaXBlIGxp
YnNzaDItbmF0aXZlLTEuMTEuMS1yMDogdGFzayBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5l
OiBTdWNjZWVkZWQKTk9URTogUnVubmluZyBzZXRzY2VuZSB0YXNrIDEyNiBvZiAxNTMgKHZpcnR1
YWw6bmF0aXZlOi9ob21lL3Byb2plY3RzL2J1aWxkcy9wb2t5LWJ1aWxkL3Bva3kvYnVpbGQvdG1w
L3dvcmsvcWVtdXBwYy1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvdGVzdHNka2V4
dC9sYXllcnMvcG9reS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gyL2xpYnNzaDJfMS4xMS4x
LmJiOmRvX3JlY2lwZV9xYV9zZXRzY2VuZSkKTk9URTogcmVjaXBlIGNhLWNlcnRpZmljYXRlcy1u
YXRpdmUtMjAyNTA0MTktcjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTogU3Vj
Y2VlZGVkCk5PVEU6IFJ1bm5pbmcgc2V0c2NlbmUgdGFzayAxMzAgb2YgMTUzICh2aXJ0dWFsOm5h
dGl2ZTovaG9tZS9wcm9qZWN0cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3Jr
L3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5
ZXJzL3Bva3kvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmlj
YXRlc18yMDI1MDQxOS5iYjpkb19yZWNpcGVfcWFfc2V0c2NlbmUpCk5PVEU6IHJlY2lwZSBjYS1j
ZXJ0aWZpY2F0ZXMtbmF0aXZlLTIwMjUwNDE5LXIwOiB0YXNrIGRvX3JlY2lwZV9xYV9zZXRzY2Vu
ZTogU3RhcnRlZApOT1RFOiByZWNpcGUgbGlic3NoMi1uYXRpdmUtMS4xMS4xLXIwOiB0YXNrIGRv
X3JlY2lwZV9xYV9zZXRzY2VuZTogU3RhcnRlZApOT1RFOiByZWNpcGUgY2EtY2VydGlmaWNhdGVz
LW5hdGl2ZS0yMDI1MDQxOS1yMDogdGFzayBkb19yZWNpcGVfcWFfc2V0c2NlbmU6IFN1Y2NlZWRl
ZApOT1RFOiByZWNpcGUgbGlic3NoMi1uYXRpdmUtMS4xMS4xLXIwOiB0YXNrIGRvX3JlY2lwZV9x
YV9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IHJlY2lwZSBydXN0LW5hdGl2ZS0xLjg3LjAtcjA6
IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IFJ1bm5p
bmcgc2V0c2NlbmUgdGFzayAxMzEgb2YgMTUzICh2aXJ0dWFsOm5hdGl2ZTovaG9tZS9wcm9qZWN0
cy9idWlsZHMvcG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1saW51
eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BhdGNoZWxmL3BhdGNoZWxmXzAuMTguMC5iYjpkb19wb3B1bGF0ZV9zeXNy
b290X3NldHNjZW5lKQpOT1RFOiBSdW5uaW5nIHNldHNjZW5lIHRhc2sgMTMzIG9mIDE1MyAodmly
dHVhbDpuYXRpdmU6L2hvbWUvcHJvamVjdHMvYnVpbGRzL3Bva3ktYnVpbGQvcG9reS9idWlsZC90
bXAvd29yay9xZW11cHBjLXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC90ZXN0c2Rr
ZXh0L2xheWVycy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtbGx2bV8xLjg3
LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZSkKTk9URTogUnVubmluZyBzZXRzY2Vu
ZSB0YXNrIDEzNCBvZiAxNTMgKHZpcnR1YWw6bmF0aXZlOi9ob21lL3Byb2plY3RzL2J1aWxkcy9w
b2t5LWJ1aWxkL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXBwYy1wb2t5LWxpbnV4L2NvcmUtaW1h
Z2UtbWluaW1hbC8xLjAvdGVzdHNka2V4dC9sYXllcnMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVzdC9ydXN0XzEuODcuMC5iYjpkb19yZWNpcGVfcWFfc2V0c2NlbmUpCk5PVEU6IHJlY2lw
ZSBwYXRjaGVsZi1uYXRpdmUtMC4xOC4wLXIwOiB0YXNrIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0
c2NlbmU6IFN0YXJ0ZWQKTk9URTogcmVjaXBlIHJ1c3QtbGx2bS1uYXRpdmUtMS44Ny4wLXIwOiB0
YXNrIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmU6IFN0YXJ0ZWQKTk9URTogcmVjaXBlIHJ1
c3QtbmF0aXZlLTEuODcuMC1yMDogdGFzayBkb19yZWNpcGVfcWFfc2V0c2NlbmU6IFN0YXJ0ZWQK
Tk9URTogcmVjaXBlIHJ1c3QtbmF0aXZlLTEuODcuMC1yMDogdGFzayBkb19yZWNpcGVfcWFfc2V0
c2NlbmU6IFN1Y2NlZWRlZApOT1RFOiByZWNpcGUgcGF0Y2hlbGYtbmF0aXZlLTAuMTguMC1yMDog
dGFzayBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lOiBTdWNjZWVkZWQKTk9URTogUnVubmlu
ZyBzZXRzY2VuZSB0YXNrIDEzNiBvZiAxNTMgKHZpcnR1YWw6bmF0aXZlOi9ob21lL3Byb2plY3Rz
L2J1aWxkcy9wb2t5LWJ1aWxkL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXBwYy1wb2t5LWxpbnV4
L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvdGVzdHNka2V4dC9sYXllcnMvcG9reS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfMC4xOC4wLmJiOmRvX3JlY2lwZV9xYV9zZXRz
Y2VuZSkKTk9URTogcmVjaXBlIHBhdGNoZWxmLW5hdGl2ZS0wLjE4LjAtcjA6IHRhc2sgZG9fcmVj
aXBlX3FhX3NldHNjZW5lOiBTdGFydGVkCk5PVEU6IHJlY2lwZSBwYXRjaGVsZi1uYXRpdmUtMC4x
OC4wLXIwOiB0YXNrIGRvX3JlY2lwZV9xYV9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IHJlY2lw
ZSBydXN0LWxsdm0tbmF0aXZlLTEuODcuMC1yMDogdGFzayBkb19wb3B1bGF0ZV9zeXNyb290X3Nl
dHNjZW5lOiBTdWNjZWVkZWQKTk9URTogUnVubmluZyBzZXRzY2VuZSB0YXNrIDE0MCBvZiAxNTMg
KHZpcnR1YWw6bmF0aXZlOi9ob21lL3Byb2plY3RzL2J1aWxkcy9wb2t5LWJ1aWxkL3Bva3kvYnVp
bGQvdG1wL3dvcmsvcWVtdXBwYy1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvdGVz
dHNka2V4dC9sYXllcnMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWxsdm1f
MS44Ny4wLmJiOmRvX3JlY2lwZV9xYV9zZXRzY2VuZSkKTk9URTogUnVubmluZyBzZXRzY2VuZSB0
YXNrIDE1MSBvZiAxNTMgKC9ob21lL3Byb2plY3RzL2J1aWxkcy9wb2t5LWJ1aWxkL3Bva3kvYnVp
bGQvdG1wL3dvcmsvcWVtdXBwYy1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvdGVz
dHNka2V4dC9sYXllcnMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcXVpbHQvcXVpbHQtbmF0
aXZlXzAuNjkuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZSkKTk9URTogcmVjaXBlIHF1
aWx0LW5hdGl2ZS0wLjY5LXIwOiB0YXNrIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmU6IFN0
YXJ0ZWQKTk9URTogcmVjaXBlIHJ1c3QtbGx2bS1uYXRpdmUtMS44Ny4wLXIwOiB0YXNrIGRvX3Jl
Y2lwZV9xYV9zZXRzY2VuZTogU3RhcnRlZApOT1RFOiByZWNpcGUgcXVpbHQtbmF0aXZlLTAuNjkt
cjA6IHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IFJ1
bm5pbmcgc2V0c2NlbmUgdGFzayAxNTMgb2YgMTUzICgvaG9tZS9wcm9qZWN0cy9idWlsZHMvcG9r
eS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWltYWdl
LW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvbGF5ZXJzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3F1aWx0L3F1aWx0LW5hdGl2ZV8wLjY5LmJiOmRvX3JlY2lwZV9xYV9zZXRzY2VuZSkKTk9URTog
cmVjaXBlIHJ1c3QtbGx2bS1uYXRpdmUtMS44Ny4wLXIwOiB0YXNrIGRvX3JlY2lwZV9xYV9zZXRz
Y2VuZTogU3VjY2VlZGVkCk5PVEU6IHJlY2lwZSBxdWlsdC1uYXRpdmUtMC42OS1yMDogdGFzayBk
b19yZWNpcGVfcWFfc2V0c2NlbmU6IFN0YXJ0ZWQKTk9URTogcmVjaXBlIHF1aWx0LW5hdGl2ZS0w
LjY5LXIwOiB0YXNrIGRvX3JlY2lwZV9xYV9zZXRzY2VuZTogU3VjY2VlZGVkCk5PVEU6IFRhc2tz
IFN1bW1hcnk6IEF0dGVtcHRlZCAwIHRhc2tzIG9mIHdoaWNoIDAgZGlkbid0IG5lZWQgdG8gYmUg
cmVydW4gYW5kIGFsbCBzdWNjZWVkZWQuCgpTdW1tYXJ5OiBUaGVyZSB3YXMgMSBXQVJOSU5HIG1l
c3NhZ2UuCkVSUk9SOiBGYWlsZWQgdG8gaW5zdGFsbCBweXRob24zLW1hdHVyaW4tbmF0aXZlIC0g
dW5hdmFpbGFibGUKCk5PVEU6ICAuLi4gc2tpcHBlZCAnVGVzdCBtYXR1cmluLk1hdHVyaW5EZXZl
bG9wVGVzdC50ZXN0X21hdHVyaW5fZGV2ZWxvcCBuZWVkcyBvbmUgb2YgcHl0aG9uMy1tYXR1cmlu
JwpUZXN0IG1hdHVyaW4uTWF0dXJpbkRldmVsb3BUZXN0LnRlc3RfbWF0dXJpbl9kZXZlbG9wIG5l
ZWRzIG9uZSBvZiBweXRob24zLW1hdHVyaW4KTk9URTogdGVzdF9tYXR1cmluX2xpc3RfcHl0aG9u
IChtYXR1cmluLk1hdHVyaW5UZXN0LnRlc3RfbWF0dXJpbl9saXN0X3B5dGhvbikKTk9URTogZGV2
dG9vbCBzZGstaW5zdGFsbCB0aHJldzogQ29tbWFuZCAnLiAvaG9tZS9wcm9qZWN0cy9idWlsZHMv
cG9reS1idWlsZC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXVwcGMtcG9reS1saW51eC9jb3JlLWlt
YWdlLW1pbmltYWwvMS4wL3Rlc3RzZGtleHQvZW52aXJvbm1lbnQtc2V0dXAtcHBjNzQwMC1wb2t5
LWxpbnV4ID4gL2Rldi9udWxsOyBkZXZ0b29sIHNkay1pbnN0YWxsIHB5dGhvbjMtbWF0dXJpbi1u
YXRpdmU7JyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAxLgpTdGFuZGFyZCBPdXRwdXQ6
IE5PVEU6IFJlY29ubmVjdGluZyB0byBiaXRiYWtlIHNlcnZlci4uLgpOT1RFOiBSZXRyeWluZyBz
ZXJ2ZXIgY29ubmVjdGlvbiAoIzEpLi4uICgxODo1Mzo0MS42ODE4MDgpCk5PVEU6IFJlY29ubmVj
dGluZyB0byBiaXRiYWtlIHNlcnZlci4uLgpOT1RFOiBSZWNvbm5lY3RpbmcgdG8gYml0YmFrZSBz
ZXJ2ZXIuLi4KTk9URTogUmV0cnlpbmcgc2VydmVyIGNvbm5lY3Rpb24gKCMxKS4uLiAoMTg6NTM6
NDEuNjgxODA4KQpOT1RFOiBSZXRyeWluZyBzZXJ2ZXIgY29ubmVjdGlvbiAoIzEpLi4uICgxODo1
Mzo0MS42ODE4MDgpCk5PVEU6IFN0YXJ0aW5nIGJpdGJha2Ugc2VydmVyLi4uCldBUk5JTkc6IFlv
dSBhcmUgdXNpbmcgYSBsb2NhbCBoYXNoIGVxdWl2YWxlbmNlIHNlcnZlciBidXQgaGF2ZSBjb25m
aWd1cmVkIGFuIHNzdGF0ZSBtaXJyb3IuIFRoaXMgd2lsbCBsaWtlbHkgbWVhbiBubyBzc3RhdGUg
d2lsbCBtYXRjaCBmcm9tIHRoZSBtaXJyb3IuIFlvdSBtYXkgd2lzaCB0byBkaXNhYmxlIHRoZSBo
YXNoIGVxdWl2YWxlbmNlIHVzZSAoQkJfSEFTSFNFUlZFKSwgb3IgdXNlIGEgaGFzaCBlcXVpdmFs
ZW5jZSBzZXJ2ZXIgYWxvbmdzaWRlIHRoZSBzc3RhdGUgbWlycm9yLgpMb2FkaW5nIGNhY2hlLi4u
ZG9uZS4KTG9hZGVkIDIwMTUgZW50cmllcyBmcm9tIGRlcGVuZGVuY3kgY2FjaGUuCgpTdW1tYXJ5
OiBUaGVyZSB3YXMgMSBXQVJOSU5HIG1lc3NhZ2UuCklORk86IEluc3RhbGxpbmcgcHl0aG9uMy1t
YXR1cmluLW5hdGl2ZS4uLgpOT1RFOiBSZWNvbm5lY3RpbmcgdG8gYml0YmFrZSBzZXJ2ZXIuLi4K
V0FSTklORzogWW91IGFyZSB1c2luZyBhIGxvY2FsIGhhc2ggZXF1aXZhbGVuY2Ugc2VydmVyIGJ1
dCBoYXZlIGNvbmZpZ3VyZWQgYW4gc3N0YXRlIG1pcnJvci4gVGhpcyB3aWxsIGxpa2VseSBtZWFu
IG5vIHNzdGF0ZSB3aWxsIG1hdGNoIGZyb20gdGhlIG1pcnJvci4gWW91IG1heSB3aXNoIHRvIGRp
c2FibGUgdGhlIGhhc2ggZXF1aXZhbGVuY2UgdXNlIChCQl9IQVNIU0VSVkUpLCBvciB1c2UgYSBo
YXNoIGVxdWl2YWxlbmNlIHNlcnZlciBhbG9uZ3NpZGUgdGhlIHNzdGF0ZSBtaXJyb3IuCkxvYWRp
bmcgY2FjaGUuLi5kb25lLgpMb2FkZWQgMjAxNSBlbnRyaWVzIGZyb20gZGVwZW5kZW5jeSBjYWNo
ZS4KTk9URTogUmVzb2x2aW5nIGFueSBtaXNzaW5nIHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzCklu
aXRpYWxpc2luZyB0YXNrcy4uLlNzdGF0ZSBzdW1tYXJ5OiBXYW50ZWQgNjcgTG9jYWwgMTQgTWly
cm9ycyA1MCBNaXNzZWQgMyBDdXJyZW50IDg2ICg5NSUgbWF0Y2gsIDk4JSBjb21wbGV0ZSkKZG9u
ZS4KTk9URTogRXhlY3V0aW5nIFRhc2tzCk5PVEU6IFRhc2tzIFN1bW1hcnk6IEF0dGVtcHRlZCAw
IHRhc2tzIG9mIHdoaWNoIDAgZGlkbid0IG5lZWQgdG8gYmUgcmVydW4gYW5kIGFsbCBzdWNjZWVk
ZWQuCgpTdW1tYXJ5OiBUaGVyZSB3YXMgMSBXQVJOSU5HIG1lc3NhZ2UuCkVSUk9SOiBGYWlsZWQg
dG8gaW5zdGFsbCBweXRob24zLW1hdHVyaW4tbmF0aXZlIC0gdW5hdmFpbGFibGUKCk5PVEU6ICAu
Li4gc2tpcHBlZCAnVGVzdCBtYXR1cmluLk1hdHVyaW5UZXN0LnRlc3RfbWF0dXJpbl9saXN0X3B5
dGhvbiBuZWVkcyBvbmUgb2YgcHl0aG9uMy1tYXR1cmluJwpUZXN0IG1hdHVyaW4uTWF0dXJpblRl
c3QudGVzdF9tYXR1cmluX2xpc3RfcHl0aG9uIG5lZWRzIG9uZSBvZiBweXRob24zLW1hdHVyaW4K
Tk9URTogdGVzdF9lcG94eSAobWVzb24uTWVzb25UZXN0LnRlc3RfZXBveHkpCk5PVEU6ICAuLi4g
c2tpcHBlZCAnbWVzb24uTWVzb25UZXN0LnRlc3RfZXBveHkgZG9lcyBub3Qgc3VwcG9ydCBlU0RL
IChodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE1ODU0
KScKbWVzb24uTWVzb25UZXN0LnRlc3RfZXBveHkgZG9lcyBub3Qgc3VwcG9ydCBlU0RLIChodHRw
czovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE1ODU0KQo=

--_002_AS1PR10MB56974A330B128E3E7F9A8FD5FD27AAS1PR10MB5697EURP_--

