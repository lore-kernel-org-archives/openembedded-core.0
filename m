Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0EACA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 11:21:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.21])
 by mx.groups.io with SMTP id smtpd.web10.14347.1725189695812838631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 04:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bjUQEUCb;
 spf=pass (domain: axis.com, ip: 52.101.65.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9cAR8L1TIWvtBGWE8a5TKpy7lhdR7u6QVF79NaJayd80YcHFfCcWXwXkEbOz18CBurgi0LJmVIR+yXyZrEPDQHQ9m7gbnQ+nPvGeXsf4CqzgSXCa34FGZf1JSYDHR04W7S1xfO9QO5aFShOKOT1LLhKhG7Bn3pMG004Dq4ikfgWWc716tH9R+1986QAfG8wUY9sWQcr0jD7zAVyx453X9kG/3d7HOxwl0w8LT+nLdzdB/oSbPqUxyq6j29YMVjptWt/+dDsVGMKyGRoWzI2mhUUIVbfJXUAFswukdm8EZ36CWV0ISVO3+s/JWy44Ga8DGBy8Ln44ixJtByBcBSykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQxecS9zDU6rY8DG5IpbZcg5GLO8B4U2OwLzc4T9d5I=;
 b=KWCzAFApfIpwYwGNA0r4zoGVCPuCIR2ybEjTVdITVTpo5JYFm/x4SlFLLY0cxBZerwV8FRr/1uDPad7UCrFn/r8t1k0wkCPIDfYennm8bmYhL+dxuaWs3D3jsbhQhPDhM1K6Z8BhvQ9zG2NPexQgcEmg+tr6LF0PsrMHgJbcCpPDOa3Lr+y4OkgGEqNguzwMxdavyE5GI8xwpAfc2eip5C2NgL6+MCBGf0A8JFmh2idApJelWhAnHdLMCY6BSRDcCGEa4jnyHXzmWI5IEst5lbtP17LEhceXNOvCnbe5056Ujd7Hl42tFI/Rs2DizDLWa9a6RjCdqhwH24o2HWb0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQxecS9zDU6rY8DG5IpbZcg5GLO8B4U2OwLzc4T9d5I=;
 b=bjUQEUCbxJJkWbRm+WhgTMheuE9oTW1v55xXQMGx8jZRUw/MU6lrJ3DtXZIxa3A0VsKDJMIXBMxhyDVJaBZjRe1AzVlK4n/v7XjpPpaFMVZwFsqDyXflSCTmIF48PcpUvj/Xew/30gFQYQuhDvZ4v8gefzi0D1B6KHGUmVwmSYk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8667.eurprd02.prod.outlook.com (2603:10a6:10:3ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 11:21:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 11:21:26 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
Thread-Topic: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
Thread-Index: AQHa+WV2vHvngUGaqU+iUKuQtrNAvbJCyzOg
Date: Sun, 1 Sep 2024 11:21:26 +0000
Message-ID: 
 <DB5PR02MB1021325EB5E087023B3C12C78EF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240828161450.1488792-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240828161450.1488792-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8667:EE_
x-ms-office365-filtering-correlation-id: f8144a9d-78cf-44c7-be5e-08dcca7837fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?LuZ+d8UrGP2gtui+C7Zu8eCum1TD5L7jQHdFuHZz3QvVhoKWrifPiukL+zlf?=
 =?us-ascii?Q?9YL+ECFMJMNA3VquMsQj6/2xXHrohEXsujzTOeZZHjx/qI+EUDiqDt9Kwydk?=
 =?us-ascii?Q?wDW1tciK3e3sxAqKmtavE5kqLQMATKSFv1Y4LFriu1BEZIQZQR7uxTggKgFv?=
 =?us-ascii?Q?kg6sbDpmWxsaQrwrFkroO2bbk8w6iUgQNKBe1R5pp8nsLn/lDd79AZ8qkIPo?=
 =?us-ascii?Q?as89d0higY0LncV3mcUJMqkIlNrX/TpylvVhZYaJwTRqaMSS/q6mVff75Nay?=
 =?us-ascii?Q?ybU1lC6x3XRiJIaah7fQIp+uYF/V7CP3CwoolbCbGm1TuqQED2XChAt9uhOU?=
 =?us-ascii?Q?94jPp69pN7UfNsU9z2sta5DiH7LhQndmD6VfLicKw2NUPyyxOQRwVYNV+JKe?=
 =?us-ascii?Q?MEnO779Zx+7nV1UlomNslKSUDCPyDUniDaxZeLYKKztawGuE26PChozjH21Q?=
 =?us-ascii?Q?8V71eQ6FJ8GEEK69wjE7Pz3ZkRyNQTGPmXXgD9eppQlu3B4MN8tR0oepOvUx?=
 =?us-ascii?Q?oXwWuTIL+/b8MrlwAXa3fbQKzj4NZmIeZphGYLiDyCyQriEaYsbDmxCL6Wwx?=
 =?us-ascii?Q?dWZLf4aWwaJkfapkdBMg3taeKz9W0bhBkXr5qqU08rn2oHgkCNrZ6MtZdPQ0?=
 =?us-ascii?Q?AuaUbDWMJhOWTYsoWEhTTRdMiku5+K1hujfNKx34mXg5EMOPbszW27cDhoeo?=
 =?us-ascii?Q?SiQ6gyf8HZjKHZyQ9C08Un637DjYx27PW1NUy1UGqjHR/VVD0bIfc1ZvDkN7?=
 =?us-ascii?Q?nzlHmytMxagoicvVKZyayd8tbQqNtEOtPIhOnPJH962AUYOIa66g8e3UABXR?=
 =?us-ascii?Q?YraFBGlaC4RHh2qgNgwpZUnSqWfmGWUJ/P26jUsN58qfAARthCoAyvumhNPw?=
 =?us-ascii?Q?egK21AnwB0EiJg0nInq6s3bjrzgGkJ6gexEASwdpZrX/R1VAX0oBJYJLBqC0?=
 =?us-ascii?Q?HgULXvvIg2XoyfBQdhf6V1M+R8hdmAV2DZDUj0Oo7qQt/QzdsajUPxbd84XL?=
 =?us-ascii?Q?CJjYxffncivgRUoyabSgbyOV9kAk9nhwNksuaUkMicG5O4acrUcdAGwIvldq?=
 =?us-ascii?Q?B60K0Ec0qjtqQaNbd9Fcgywl2r90pueqv1nfhMNsxye9P9avcvX9TaVUpjxE?=
 =?us-ascii?Q?FLLcruPfYBMoCN0NMm5egTDY5zDEx0wMOfD62QYS0Si26dglziVSRSI3iibm?=
 =?us-ascii?Q?Syuffd/oaoBSYgQ0lB/chfyZsSOfeNPmbrwWrICYEbxkH7TldhJWI94IGemJ?=
 =?us-ascii?Q?xahN2jMylGI6Og0kdVjhIciqHwoJP98nBM+FR4n1G+ZvEW5SPJF4/8sV3ZWQ?=
 =?us-ascii?Q?mC9+rZPizotHsTridRCij0/1bcxI7E9DfX2CCOXZilepE2CMqj2aj9xkujdH?=
 =?us-ascii?Q?S7VvXhmNMeh1fUETXp2v/+iW5N7JB1YdZ5D/F4NomYA64bvsaw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Y3tQbw9Ntf9oz+J9XumjJT3Wp1Ot+XMtcj1HZbCelIssPvY6czL/PRw3KGkp?=
 =?us-ascii?Q?Y9yWGcgiwnVdKfywDpLj9El0Wvat8J57q23BgNccX1ihyXne6oflh+1heZqu?=
 =?us-ascii?Q?atCB2rdACqnmKNlvipi+y9hQe3nDZhzyasoUKMo+4jdHgVZ7vmwibKukrDdQ?=
 =?us-ascii?Q?oJo7Z4GqEejXRRHYcUI/u5REePuuQ6wp1nWI6QosSseyVjF1PSFlaZIGjmet?=
 =?us-ascii?Q?tX37+yG7B6ipICgbzBuYCMrEkxlJx7Qm++0PlcEOmnl2oHnMgzov4dpt8hMZ?=
 =?us-ascii?Q?3lGFSZ2LRj5zFYDWVQiqOa3jVy2e5Rwj53fYZFyCNo2uAVMnhwb8KsFkC/qa?=
 =?us-ascii?Q?2/2HmGtIEplkXeUY97LKnX7ezWnOoI7r7oidPyf/b7pWAg6ryTZ1tAGi+dqz?=
 =?us-ascii?Q?b727EY8NZ3Iy6PFv6n7KzO+ir+SVxyAJVSgUgmBp8/IAfcfqs7g/5YcWzbAu?=
 =?us-ascii?Q?okjgSKQMI9JOwkVCWfsBeU+A3DEHDVCMBNb/rhF/w7M5bCSwJTPcq2Phn7NL?=
 =?us-ascii?Q?a7yIl+deG63bAhklg6DWa/sOtvlp1bEqQGQjfd0hzWHSid5LitCK4XLJF6HP?=
 =?us-ascii?Q?3c0VUsALhQlrfQVVwu+YARYrQHGMDAQIL9W8lbT5hRUm5v/k7AI+/cteSv9K?=
 =?us-ascii?Q?A2Hpm5dF3QHtEIPvjfUm8PeualGG1ZWiyrx76GO9m6bBbu0mWBwz9o0YnykL?=
 =?us-ascii?Q?dRdR7EuFJ3+/Aof345caV6XK3DFg+HzihO/f2JzO869cUsA3zSIpAr0s8Odx?=
 =?us-ascii?Q?n2tI1o2Spz0sN4JJO1YMzfwusuugmp15cdBvO8MB3sFqx40m/na1LM+PsaYp?=
 =?us-ascii?Q?FDd3bb17tX9DejM0EGqWWc4y03rkkm6h4Igym9LN6/DbEJCEZ6jFcxWYSyuY?=
 =?us-ascii?Q?SY/4mGkpEP0uVkuUp8x6ZmCLqaKd6dTarugtusZYmd5tEdmGYunjqsoVV0T2?=
 =?us-ascii?Q?TdM4SiCLdF3oCpAcz4CE26Xnf+FZqd1UZ8s8Aw1+0C4MhFK/LzKu7iLSovDh?=
 =?us-ascii?Q?Lk0qMl1282PW8E78RXQkc7jt4b5Nrp4AdaVksE+ZncHobyBcMZe/8cnktb70?=
 =?us-ascii?Q?usvPQmBvUAC6VBJ+tTJKnHbkzL212qgOF5RQTeKuROPH3/9I5KrXHyFdJb4Q?=
 =?us-ascii?Q?kEpYZvb4OCNFgWDQz3wkddV09SKHNvROLcRTy5Z7PYH+s/RRrEmJtUGQvgYL?=
 =?us-ascii?Q?jyl7GArLPQYyfQqJqYnMF/tdcMMtysgZByo99r8KStHCR1hghO6RzC3bfcgx?=
 =?us-ascii?Q?JRq1Vgf6Ru9z38h57wjPG/jRK+De9rxTjuOii8m6eoHDgjV/UuJcWPw7Qsrn?=
 =?us-ascii?Q?w5F1wexM79vO+f90ULehNC9S4TUAP9XdDG0WHCK8wSTOw1wpl2VeY1wusFLa?=
 =?us-ascii?Q?ezuL3NU6mjP+WDtFnS5mV2Apa5HbZVEKUULqbCL2q5kl9kNAZf+mGwPC7jtr?=
 =?us-ascii?Q?/nht8vG53lhChjIBAall1pUf1o6fuNsGdhHed6bUR40WQD7N90xIiOJ4XLxn?=
 =?us-ascii?Q?WlXu6GH1gOggUhnsERin62K7Prt//Pg8elh4G0HfW0MZdEhtn55RmpMctix/?=
 =?us-ascii?Q?JFXtw4nyLh6IUpCMqHw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8144a9d-78cf-44c7-be5e-08dcca7837fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 11:21:26.3597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGklAO50o7jr0wcyMQLJ4pRx43euHgocrjgsNfedAuoAR4P0ZR6x1jvaIJP9Jy2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 11:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204045

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 28 augusti 2024 18:15
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
>=20
> Drop the oe.qa.add_message() usage in favour of oe.qa.handle_error() whic=
h has
> code allowing it to be optimised with contains usage.
>=20
> The patch also drops unused return values which we stopped using a while =
ago
> and drops the now unneeded function parameters, generally leading to clea=
ner
> code.
>=20
> The code should be functionally equivalent.

There is at least one difference. We have the following in our distro:

WARN_QA:remove =3D "virtual-slash"
ERROR_QA:remove =3D "virtual-slash"

since we do not build any package feeds and thus this QA error is not a pro=
blem=20
for us.

After the change from add_message() to handle_error(), I now get a lot of:

NOTE: /path/to/recipe_1.2.3.bb: QA Issue: RDEPENDS is set to virtual/foobar=
 but the substring 'virtual/' holds no meaning in this context. It only wor=
ks for build time dependencies, not runtime ones. It is suggested to use 'V=
IRTUAL-RUNTIME_' variables instead. [virtual-slash]

during recipe parsing, which defeats the purpose of turning of the QA error=
.

Now, we can of course fix our recipes to avoid the use of runtime dependenc=
ies=20
on virtual/. I just wanted to point out that there is a difference in=20
functionality, and one that is hard to do anything about in layers on top o=
f=20
OE-Core.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/insane.bbclass | 219 +++++++++++------------------
>  meta/lib/oe/qa.py                  |   6 -
>  2 files changed, 84 insertions(+), 141 deletions(-)

//Peter


