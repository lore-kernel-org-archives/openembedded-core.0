Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACA1C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 03:26:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8404.1714015595742351793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 20:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dy5UfJuK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=484529c66c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P2s64C031388
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 03:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=zBIptrejz+NAwF3x9C
	Foj0LZVPPMrUjq1VwYYZRh9Wc=; b=Dy5UfJuKv1onRjh0BoYHWl3sXSrka4SYW0
	KcAlr8w9erUT0jJ3tvWDLffr2mSXB+7U7Ti9FH1STXupvmV9o74hLj1BpMiH2DqX
	+wvJ9vyoijB/N4D3MKcBpjb7JdIUoT6O1ON5rCzEpLvuvRvyQ7ayx4clF/HjCKat
	1k/wVUI8JQnHFCmIVujoCHOJUHqdhjEaIExKTptrUIRJphJ9bgUDYXBYZ8/WVqTP
	Gilvzlo8sObe1Rj70Egb6mgReQPwC8RFnxaVLdEM92K3Dc/HH+fJ3XmTt5TZIJLW
	2De6LIAnSqqMNqwIg0cAAnd4pB5j56KK/qfSF9nX0uyGMFE7vxYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7cvr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 03:26:34 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43P3QYd7011516;
	Thu, 25 Apr 2024 03:26:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7cvr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 03:26:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqw+a3UvZTx+T9HMeHtDLFeXzt0XNeII4EgIYm+BYkg1hwg32tLJFq/Y51Zxj5um7tcG/1aBpc9vZ7e+RukBH6y8JR0RASyxUhJFTKZtdrFU0fAxdhQ++JwOy6Y9eBBOb/9spT6muGDE3LiozIanFN1sPdfaLmJHYXeRjCwBsTNZjZxYhXPv25fgB/wXZ7ZSlRIqWaTNce6QKAIgv+R3TWpZDqn4bmUWRAngondRxEchicRRsgGlRzPlHCA++VcdQbh71rUJwtoE1OShlogRs/32aU3opQOSOxM+4758E8ewxpoa4qLyfl5eHw0fX8E6C4tL4e7ag+3s2x5d7JyfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBIptrejz+NAwF3x9CFoj0LZVPPMrUjq1VwYYZRh9Wc=;
 b=emxFNNm3PdMS2FsPhfkQhz61vtGHQpTN3l/vRUfcW+fTW9bgD4Ozs4r2QpGdA0mMWRLdiT8Sc+PZVGEAeh5OzALuVl00McBeCblz1slhv5kSvidI3ztlVxpw0AHWT32DWDRkwjquwXMFUDsW8YHYIgFPJlnGYutMEGMV7Sf7tiMCpQk/jvI+2EP9/khqag9lox85xlqLRefNt8PIGmrjUxDKoWlsUM6jFF7dqgWE/U1mtxqfQg9BgA0vxmBIOWmmpEW5LSk8c9HXCpyDtghDJY6ywLxKlW7v1b5uQcX2DTfkZBREaFuSL8m8c7AUaG+KKO/HiOCYboud+W5Dst/xvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 03:26:30 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::14d5:b763:637b:cb68]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::14d5:b763:637b:cb68%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 03:26:27 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "vanusuri@mvista.com"
	<vanusuri@mvista.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
Thread-Index: AQHakl6J6mD/1QPp7E619AtDjLkV2bFvyp/QgAiQrdU=
Date: Thu, 25 Apr 2024 03:26:27 +0000
Message-ID: 
 <BYAPR11MB3397DAA98F10A7A3C9CFCCE881172@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20240419133544.3010310-1-soumya.sambu@windriver.com>
 <AS1PR10MB569780C784F31D36500770E6FD0D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569780C784F31D36500770E6FD0D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|BL1PR11MB5318:EE_
x-ms-office365-filtering-correlation-id: 9c64dc21-e179-4e9c-dc97-08dc64d77dcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?vguFIzpRmX9Qxi1TR+MJXrcYJ3jG8T2gR1V4TgYXP4tdtU+5SoC1pvCfj/iM?=
 =?us-ascii?Q?GjyzhCaZhAf0q+WfdvRNUnQZt0LlUnPpOdFP4gIz2IvU97p6xzkb+AHRhfUi?=
 =?us-ascii?Q?u51zz+zQ4LaXIuAn4WEVhwvlwel5SjMK9fmxJ+PFEQnp6mZjfovj+S4XFO0P?=
 =?us-ascii?Q?v7RM0agh0WKoSj+5A7hHghVDB7jNpk5WhEdiTAIoIpMIoRAZCylnEI+eR/K+?=
 =?us-ascii?Q?DrmX2DkKZJBvYmKvCnGiD4XFcZPTtS2vBiEcWspSZLh4jDuq+77Ucm986FEZ?=
 =?us-ascii?Q?zWuxCwVByaWac2vuGZhz5SU+tsdvDfGDUFIqKceiEokTLU508LxgaewituqH?=
 =?us-ascii?Q?yZFt1qsJGW0roiK+Ecrwf5ixvL75Ng6y0HahRJHD5OrsVg8mwgVJiIfBOyqg?=
 =?us-ascii?Q?NHE38Tj2FjytUlca2bI05Q7nNqb94FLlznay4YeT7J4vqCRBV4ZJ/29qHcW0?=
 =?us-ascii?Q?KlA0kf1/pUpX9RavmWkmpEroIxXQddhhwdJ/4Apy1TaBDLBikSFnsHkf8A7n?=
 =?us-ascii?Q?rEP1meyLnRO8M0+sbv9iQFS1f+fpKjkcxTBBlZJtWdjEJ0oS41lc5WMRgFcL?=
 =?us-ascii?Q?LdblOkYSO5BupSAL1fM5N6wz0BQ+/AGRwawtMKPXNYq2DMzvuohRQogAhmm5?=
 =?us-ascii?Q?L65QcHImWrch0C3zggt8OZJSXIqEjYa6m1sPrwFY1hl+ZYjAfAaFnifkOgBf?=
 =?us-ascii?Q?BHORVI+RWWZn+Hgns9U1uUuOtbgEug9Y8o3GffUu3S3SNSj6XIlOR0bmLmef?=
 =?us-ascii?Q?GIbmWXs147CxvuMsxD22Dc5uhwyGufqYIlnSSHSuO5MXashmw8qbCf97UDcF?=
 =?us-ascii?Q?A1zfELpCEiMiXP4cq5mqucjuzSdlxQpCONhNSv55Iw4TLwpvOwEoLthaJ8dQ?=
 =?us-ascii?Q?cjUPUMYOTkC08COBEbuC/Snb2ObV7a+Uh2d5FkS4f+g1IMJ5x9tjH7+4ZpX+?=
 =?us-ascii?Q?WX/HWYNvJ2m6rPc4W44rNxwHLD833axAx4gcPjKTgAG23sNYVAaKa1UGoyNk?=
 =?us-ascii?Q?CmTaPzCAHAr3ld4ImYDJWuLMP9vduoa+Y7aaO948T3RER1MoxfTKmUc7Egaj?=
 =?us-ascii?Q?hWE6DczEc+CzULTUTO3q6UmdgROdJlGsKtfwg153LLrz66MId9dTFPKQcAkc?=
 =?us-ascii?Q?77zME2D1gehLEbUh/ddQF5wceLYFYLxuDwWlnaswBHV+Zxs0v4xAFGwk5fW7?=
 =?us-ascii?Q?ey/3Kasnq9J0pAiapwX7lh0c7UKl5m8rMPPJNQSDw2Bj56qFje44gcMlfyXn?=
 =?us-ascii?Q?im5TUvay6HZJaBEEVx/KHRxcb3So0pIlwlH0jgLyCdwqp/8rA77m4oZzgRB3?=
 =?us-ascii?Q?INI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?R2dxjOOmtwrmJPf1G/J3Wo5CxtdePq6I2gzm0at2AabQXw/KA2DjuQ7hFlOG?=
 =?us-ascii?Q?42fVPstSFZ79aO23uZTInoWtWVLELswR7Bh5uDdEmhuw1X3I1TXXzPQlNqms?=
 =?us-ascii?Q?hNyU96/ABfd6tSy6OSLA3W7bhRByU0v4rmHwRZ9OVpXEQaowPFp2T9qmjlv6?=
 =?us-ascii?Q?fhm6BWiSVMJAd7HQCaSoP6YSvpGrSNP/3GtMJIm/pj7Ws2vown9Q6FxYIb2J?=
 =?us-ascii?Q?egiUAC8PdSyM1TX0xfrdTXAI7GUuke2Xl3Lj2wmhDZ3L01sqciploUaaINha?=
 =?us-ascii?Q?U0LLN0+gc8Fa6dT4k4efv52XYrWErI7Zlq9NDl1LKyJe3LU0vr7WNS1Ezm3J?=
 =?us-ascii?Q?SOnYyZCHLoBTnD7hJRqspizjBx/NArfMsaMIcJXWfMk6isROzep4DE1JAx4L?=
 =?us-ascii?Q?YogSsvYxO1RUbdN2i9xpr2IDveYVz9UVkhwYJ9YqI2jvtSQJEGOuYChI57Ky?=
 =?us-ascii?Q?f31whydgaALNyHqJPR83J4pXVJohJ37ntDmPUr18XyrEmoOtiFVjx5GQ898r?=
 =?us-ascii?Q?S5LEDHmf3gBNARkG8coY7l6IVeIL5gbgnYDnjZyRUyxWRq/yqbeeNyUzewL5?=
 =?us-ascii?Q?1IBJhSvvXKRA/C4Dr1cPMox5DCLew1UtZLujARaOScKXNbMEHdzEiKLgRXBS?=
 =?us-ascii?Q?4h8CyrlisXqjuveo3/C0EJ3PkxdVFI18zpiSHv1aCnHnhWx3XetHdEHggvhn?=
 =?us-ascii?Q?H6gUK2wc39pHNpt10PBRyA1idsgNBsPOynxo/iMDZ653+x9IKYwCfC+xNcqx?=
 =?us-ascii?Q?rU9YHbJ0nitN6h4137yqosOkTfEU+WOos0QU/4GOlSzzOSW1SX3fi+JdMHX0?=
 =?us-ascii?Q?sbOni2vsrlY5qgbTvqG9w1etqtygnVsZDElyfytkCVso18TwMkprOBaaNBCt?=
 =?us-ascii?Q?W1Es8d3x4XGfHs9Yc6eK2ripY3j5o7WeDmzz1SzS9Q/Z3fJ2C50vnjHaWfmz?=
 =?us-ascii?Q?5SW/FtKqXdTFPKRkidR794EtCLRcEBRxeJpmfv3mS2YJDAjHHd1/cFY8wq2y?=
 =?us-ascii?Q?+Hsp0Rv98QZWG8ZDbA8fW0/G5x+ch9oJFQYxmfdxrptaWWBoXKY3lDTA9GjI?=
 =?us-ascii?Q?HGOIPO2BNp5ISDh+/fU4d/QMe2hBrsbvOs3MWBna2FKvrqOSD7/tYIBXqlPR?=
 =?us-ascii?Q?No8SfSwhiwx/rj8GedYQPdVHYvIXVvRbqHc2URvajxDYE7IdVuxNmfNMRoe8?=
 =?us-ascii?Q?FHVxS2dGvj2fvAs+VnifQIeWuf6UjJUMiUMLVnHYGOo6ogr6UfIVK5NngjMM?=
 =?us-ascii?Q?QpMY4XOm6f8EzWhrgGqstB21s4R06U8RHvJ1rli/+beqeteOmFNayAMDgm5g?=
 =?us-ascii?Q?4FSEc8fBzG/teav3YbWwOPY63FcFXCPffiVP2ErO56C1riVjWnGQlomWb/RT?=
 =?us-ascii?Q?RIWyxlQjuQxbvfIYwANP2T0w319mNrwsUx4mtQY+Ugr3CRdi/Al98MrAOlVj?=
 =?us-ascii?Q?7pudQdt1CLtHWwzJf4wD7+bcQaG0onGw4ywuyHyOFW5s5ZLYS3reSFUB5h+0?=
 =?us-ascii?Q?V5X3FTLOoqEgnHYwc7th77WPR0prW60ffTVig3H2HW6UU1bRkEr8KerhRkye?=
 =?us-ascii?Q?pUlEIs+euCcTdzXXpq9HBaQyFgTNwsDmfVOOiCk0K9UYBgGEcgTNiLZ8sL3h?=
 =?us-ascii?Q?hgQVpi13y6wPnyK03CLrz5D1DVCW86+/U5RnYvYaXAGg14pgLEyJupwrmcfg?=
 =?us-ascii?Q?jFsZQg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397DAA98F10A7A3C9CFCCE881172BYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c64dc21-e179-4e9c-dc97-08dc64d77dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 03:26:27.1095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gN4gTli91Wu4EGn7VIyyDJ/G/IFT0Z8aWiTXh1rRjrRGKclQBw6gTYZuJ3r8f1o3eeFrwNmcIP+CJE2g44+DOGxNErt4l24DeKGJdP3Bf6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
X-Proofpoint-ORIG-GUID: ZryJXrRaavo4PjIoJgC8dFXgaUKSW7Ns
X-Proofpoint-GUID: svZ-ebgJ8ZZU0KIBwPHILJW6MXuK4Z6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_02,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 03:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198693

--_000_BYAPR11MB3397DAA98F10A7A3C9CFCCE881172BYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thank you for providing the details.

Based on the information regarding the vulnerability report and the commit =
history provided, it appears that our code is indeed vulnerable as the comm=
it introducing the vulnerability still exists in our codebase.

Our util-linux version in the kirkstone branch is v2.37.4, and the vulnerab=
le code was introduced in commit cdd3cc7fa4 back in 2013.

I've also noted that Debian is also fixing the CVE, along with the dependen=
t commits mentioned in the offending commits list. They have already added =
upstream patches to address CVE-2024-28085 (839ff33b), as detailed in their=
 commit here:  https://salsa.debian.org/debian/util-linux/-/commit/839ff33b=
8002189411b679cc9ee99d1a99e099cb.

Please review the provided information, and let me know if there's anything=
 else we need to consider.

Best Regards,
Soumya
________________________________
From: Marko, Peter <Peter.Marko@siemens.com>
Sent: Friday, April 19, 2024 10:11 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>; vanusuri@mvista.c=
om <vanusuri@mvista.com>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Identical patch was already submitted and then requested to be ignored beca=
use the issue is apparently introduced by one of the added patches.
https://lists.openembedded.org/g/openembedded-core/message/197670

Since the vulnerability report claims that our version IS vulnerable, it wo=
uld be interesting to know where the truth is...
https://github.com/skyler-ferrante/CVE-2024-28085 -> The vulnerable code wa=
s introduced in commit cdd3cc7fa4 (2013).

Peter

--_000_BYAPR11MB3397DAA98F10A7A3C9CFCCE881172BYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Peter,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you for providing the details.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Based on the information regarding the vulnerability report and the commit =
history provided, it appears that our code is indeed vulnerable as the comm=
it introducing the vulnerability still exists in our codebase.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Our util-linux version in the kirkstone branch is v2.37.4, and the vulnerab=
le code was introduced in commit cdd3cc7fa4 back in 2013.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif;">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">I've also noted that =
Debian is also fixing the CVE, along with the dependent commits mentioned i=
n the offending commits list. They have already added upstream patches to a=
ddress CVE-2024-28085 (839ff33b),
 as detailed in their commit here: </span><span style=3D"font-size: 16px; c=
olor: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">&nbsp;</span>=
<span style=3D"font-size: 16px; color: rgb(0, 0, 0);"><a href=3D"https://sa=
lsa.debian.org/debian/util-linux/-/commit/839ff33b8002189411b679cc9ee99d1a9=
9e099cb" id=3D"OWAc39f4baa-9701-2936-4c46-6143bb8957d1" class=3D"OWAAutoLin=
k" data-loopstyle=3D"linkonly" style=3D"margin: 0px; text-align: left;">htt=
ps://salsa.debian.org/debian/util-linux/-/commit/839ff33b8002189411b679cc9e=
e99d1a99e099cb</a></span><span style=3D"font-size: 12pt; color: rgb(0, 0, 0=
);">.</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Please review the provided information, and let me know if there's anything=
 else we need to consider.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Soumya</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Marko, Peter &lt;Pete=
r.Marko@siemens.com&gt;<br>
<b>Sent:</b> Friday, April 19, 2024 10:11 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
; vanusuri@mvista.com &lt;vanusuri@mvista.com&gt;<br>
<b>Subject:</b> RE: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-202=
4-28085</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Identical patch was already submitted and then requested to be ignored beca=
use the issue is apparently introduced by one of the added patches.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19767=
0">https://lists.openembedded.org/g/openembedded-core/message/197670</a><br=
>
<br>
Since the vulnerability report claims that our version IS vulnerable, it wo=
uld be interesting to know where the truth is...<br>
<a href=3D"https://github.com/skyler-ferrante/CVE-2024-28085">https://githu=
b.com/skyler-ferrante/CVE-2024-28085</a> -&gt; The vulnerable code was intr=
oduced in commit cdd3cc7fa4 (2013).<br>
<br>
Peter<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397DAA98F10A7A3C9CFCCE881172BYAPR11MB3397namp_--

