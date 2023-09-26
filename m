Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146EEE7F13C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:48:40 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.3653.1695764918915327956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=HCD7Q8qZ;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=fY9Z2ttV;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QJjD2q020530;
	Tue, 26 Sep 2023 16:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps1; bh=kfUYZtjKOpOFNO8Fx+Oty0v/5+zVEs5FtPpxsPAt+tQ=;
 b=HCD7Q8qZCHiojYuEkhxCgbg0pUMv52ElzRU0ujYDCezTH63NeT+dH7siVh/D0C9AtiOj
 LbXsL1sGjCc+DOLsCB9wrt6nEKyCudNE48kb00vVGjoFcng6ZEHmSWm74moZnJA6s4IF
 dOFYl+VZzV8+NmkUxrWYWtkP/NUpRQhwSJt+Aa9Lo4c2uO+oTI6IiIAWl8670CDYylyj
 6/MnlhJ867w2V/ZG5guL+7Lsxn9bBu5AePHW0b899VzEpVrhKpwGEn+AIhdedvGZSifE
 s1kRXJlPUzWwb/Oz45AMIbF++s1mSp/i7Xaf9lK6cpAnQuXgliXF7APCN0EjNuMNnGv3 jg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3tbwsw144w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 16:48:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8O8zrP0yhCxHlrNvnztlQ13robapqXwE8pm/scpkOI5zjb4Uw0LOEbcCEs3x25BmqYabdZW+D5yykV1BOIECnW0g2YfeLz/rGPtmxjw25RdfoTHWgihjWT1pu+sCgDAZ+xQXtWlIE//m7O/jT5V03EjutuVsNQI1R83iV/1q3jBXTVXHx6+Y3/8yNV3lYjT4ldqRomucs7Sn7pKpIIOU44oCSyG2v/W2hWLwfvhew4YQKe+7/csgZTq+DV1G7IcokuhiZoufUvSeEqoWuUM9Z2GHrgcgFtQgXNcQ451FY7pxd4Fsreufs0HRUvkcxpihbMvamsgXsvvBi97T3zRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfUYZtjKOpOFNO8Fx+Oty0v/5+zVEs5FtPpxsPAt+tQ=;
 b=PPicJI8/tc7AwDGrLq4qfsWcpAnvJACZVweIGgoMqUu+T5Hl1SHD5TGUeF9MwaEdKnGqNY1wFmjnXpn2+XGEx2Q2ZLKPvTONJP0XB3STt+mRgeovv8oalGgd0luA4VObBa6t9ny5/xxOvbkJNrrce9882Ikh36GtdBPTWjFdaRnWzHfbRo5Z69YIyDtpdVgsQgP4vfgJwdKtl2604xXeySDCQeLSUhwRGG01CJWuvWFqbKrq2mnYrzlqTgQsPzPdfZEcsMLcKmrdCbyO+NEenVyU4Fd88fX3xeM8HNHva9eeUnXy2WYkuk64wOvCCkXCSomZPu2r+KwjGDpI8zS7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfUYZtjKOpOFNO8Fx+Oty0v/5+zVEs5FtPpxsPAt+tQ=;
 b=fY9Z2ttVOhAv4Wicid967hefGQKQ+hs0TkRGL4eqUCA0ReRLSQHOLKZtd5iuouSBA0DozBG11eN925iX2SOPmJoXHZiIksK/HlunzUPFdyUImVok82u0vZWkRL2kwaim2Ap84efZiQVuGwsygLUHs4RPXKyTYGjZsEfkAWJwfjc5FF2bShkVUVVKxqEGE9LLdo4kSn6W9owHHMAKoS0ciyftLjTIsd6fdk68JEbfDwSCuWx1da0fPRQVDuLzehVuF+i7CCb7MwTnAnUe4j8+gJpghPT0O1nQQKXJQk6MrDb7DFZdix5snWf2J9PxUn4JfesCQ10wkPPO5hKTA60p6w==
Received: from SA2PR04MB7723.namprd04.prod.outlook.com (2603:10b6:806:137::18)
 by SJ0PR04MB7309.namprd04.prod.outlook.com (2603:10b6:a03:291::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18; Tue, 26 Sep
 2023 21:48:32 +0000
Received: from SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::ff83:ebfd:518b:a6f7]) by SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::ff83:ebfd:518b:a6f7%4]) with mapi id 15.20.6813.014; Tue, 26 Sep 2023
 21:48:32 +0000
From: "McAllister, Colin" <Colin.McAllister@garmin.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] libwebp: Fix CVE-2023-5129
Thread-Topic: [OE-core] [dunfell][PATCH] libwebp: Fix CVE-2023-5129
Thread-Index: AQHZ8LSJUKSTqrKEgEu6ofNyjwLIprAtmCYAgAAMS10=
Date: Tue, 26 Sep 2023 21:48:32 +0000
Message-ID: 
 <SA2PR04MB7723CF84606B832D13CD45EBF4C3A@SA2PR04MB7723.namprd04.prod.outlook.com>
References: <20230926200207.1813780-1-colin.mcallister@garmin.com>
 <39E395CD-2AD8-4193-BD4C-679D2614B0F4@arm.com>
In-Reply-To: <39E395CD-2AD8-4193-BD4C-679D2614B0F4@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=True;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2023-09-26T21:48:31.371Z;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR04MB7723:EE_|SJ0PR04MB7309:EE_
x-ms-office365-filtering-correlation-id: 290e7baf-2d1e-4efd-c6ba-08dbbeda540a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LZNcKBBS1os/COUVKmE6tHHjhLGMXctGCKL+gvKqyUDGLscXU5WK1euQdxKWENj1P77DKtKliGgR+Jh2UJhdXbG3DyAHRWmdC/HtXSAH+z192tOAjAVUby1xFRB99SbWG1I+S3DrthVceMzJjKewjp2F4rFqhnuVuCnEnjM2vPm/f9LJXg3ZWT5YyxQGyAf61ztnajBrT7vCpHpC3Cpsp2NCKp8nn6x4y//coYSBH+fsdVSQ9HjQ2ztBQyZ+3iFX9IfY5sFCL/8Ib5bF4XNRQ6Toc6+xwv2eA5Ik+MWsItPl8/7Q1di9MIc39ygi9H9b4/VjXaFvuIabF95G8oGaEHPiKPDNojpzlqjIDVFqzT6ebFMoJRwHzjEITUuZBfIN4HU0YK2s84+VyOcLwPVMmwbDnIzXLxL64RakbwDU0A47wNrfJSj1xPad9Yz1NZ0Fn65Nvxrx49W4Jps3SD+Nupqhief5oSP51h6N14UaYJQZplswzrCjGEvFpdubhzUFzs+IuFdj17A8EDsXUUyYFezvrSOZm9fD0Zdin6Ak8Ye0uYW021ZV4YXdQCyPHuRE9Nfq60+acJLodLleTxDNJU8VVXk6fSqqkDEjhzyjVL8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR04MB7723.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(19627405001)(2906002)(30864003)(66476007)(66446008)(5660300002)(66556008)(52536014)(76116006)(478600001)(966005)(64756008)(71200400001)(53546011)(66899024)(9686003)(66946007)(7696005)(26005)(6506007)(41300700001)(8676002)(4326008)(316002)(6916009)(8936002)(83380400001)(166002)(38100700002)(86362001)(38070700005)(122000001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?ingrOE4pNkOFpFLNsmaCdx562Zng0Wz6YRwhE2kcJofpPeRqTUcwQYoM?=
 =?Windows-1252?Q?Ph5Wg2QyZ3KJ7QIXLair9wfDXGB/q1qKjSt+Kxa0zAuVKdfOxbmmQXM3?=
 =?Windows-1252?Q?DOdjYY7YjbBx1+PRDv8xq0KJmaNYD2Wo1hGNWJCLR5CunDAKyr6IuIqx?=
 =?Windows-1252?Q?FjJmMM54BQjdblKWH9gU+1Euk8nKaL+NRLhwwEXth0NCitdaLj4auh5D?=
 =?Windows-1252?Q?FAXWXme4T6HtKD7gZEcTFxshr8EhnPPxp7JtO99fJQ/5kLQbC7dezbzf?=
 =?Windows-1252?Q?1c0kdFaFvg3PBMQc79AW1jOy3ZEv4762HrMP/r6saHjugOBejfPwknmC?=
 =?Windows-1252?Q?UL9b8j6ABvRl1Zv3PDGmx47Ir485kND95ZBzKo+TvtTZlh5hKJ2Ujet8?=
 =?Windows-1252?Q?AcQ1a5/YaiSGgZ7d7m0SuJjAnSM6pkLSUBvYIPHMcf3m1KwT66jPJJ/9?=
 =?Windows-1252?Q?jDhJdPLYIA46NT3GcR2ZhuGw3J9U16WmD0mW3aBNMpKrWmQ33QRQdcYR?=
 =?Windows-1252?Q?14LMtbxJmcc2iNfH0Pa4/sipouqZxt3qpYfk5xagbAjok/oTBbOjn98y?=
 =?Windows-1252?Q?TWT6G9mOB/GrfKFL8TkdCEGo+2ezuDPagSDeDjncaKBfKsBqo/OZioSE?=
 =?Windows-1252?Q?4VW0DA/r/USgYB+sCC39v5chuV/PeE7I4Q4SbLx2U0Uoa60cc+L7qJnj?=
 =?Windows-1252?Q?/jxlrF87BHkykglU1MQr3Q6H8iJ1S98R7GrsYr/M2Vq3UOuqK79XElDb?=
 =?Windows-1252?Q?JSpIG1jtItjhliLqC/2iFmb92pomX9tBu1hDXrLGn9L4NuTR6mQnQWWf?=
 =?Windows-1252?Q?A9l4PyCOFhiB8dWalURW5YjCiyUDjH0vCc0AaU3eqF0UDkXYsdE2zSMG?=
 =?Windows-1252?Q?RI+fazH12vChhAp8/yBIeef+bHUDUatgjkfkGAGt9qAoDxTMblI+GxEb?=
 =?Windows-1252?Q?8LnROPsvBFwcuwwZmcEy3y2dq8dHgOtjaC1ArY/mj0GQPVjiCsIjhq/q?=
 =?Windows-1252?Q?oETxyCAdj55MzQ5dXlWG+kys0JUN+wY9MGHeEAsZNlPPkATRRf2NMWji?=
 =?Windows-1252?Q?WJPHA/sCqsrUsFYgLpzYr2JUAedCMVgr8xPMyZ8FhPFcn+cO+RkTu1QW?=
 =?Windows-1252?Q?ITMAF3eAFcfjIQjwkeSOhG+jpUROkVqLT5N9UfHtV+Wo08sHz+ogqy8g?=
 =?Windows-1252?Q?U2QqckxCJMfhELdGtMiHAbf3BrS6U0wuW3/B2emB0rWFLesonM0so0j/?=
 =?Windows-1252?Q?8jpt3q6wFqGbwLZQxZ/m6yrH5KgjzBYftaFA+NT2Q9xOy0nrKhegJBVW?=
 =?Windows-1252?Q?LolFPHNm4u9Tlu330yB2zrX2IZJa57p337XnPVwqMeqlX1B19TOwS+y5?=
 =?Windows-1252?Q?wmrA7TLdmLfRRc7Y0z4YwpSuX4MAHWjb2CFffLp6BpX1riGOsnZzvtNv?=
 =?Windows-1252?Q?1fUXKNF5vxEfjLPP1Sw35oAaKJARbG0PC0VnYTSIYzuciA3UPmoHs6W3?=
 =?Windows-1252?Q?qgj9GNKNZbUyNLIeD8PHsEPqpQgjWQUC31vxpnMiKqM1W+MVDgj3jR62?=
 =?Windows-1252?Q?B44Dkf9riN5TeDvhB15lxxM0o8phOe2/9uqWO2HMBe+Efb42tC/39fjv?=
 =?Windows-1252?Q?kuFZ2tYPsIQE3X317YPiBbGintmTXUFnXcl+0chG8vbykkwe+daXq6Oy?=
 =?Windows-1252?Q?xLF95p5Fxa4f0rBk8tlCpaUX6PIXQlcE?=
Content-Type: multipart/alternative;
	boundary="_000_SA2PR04MB7723CF84606B832D13CD45EBF4C3ASA2PR04MB7723namp_"
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR04MB7723.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290e7baf-2d1e-4efd-c6ba-08dbbeda540a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 21:48:32.4856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGE0BF0eIgy3gwi2HElOhMq2+Zr1fGO6VWnUa3Qq47+H+w9jGD+WcNjbjc5bYzKiG6YLmGzsIa41ugYLFZF1O9xcr40+KBrtgqCcsDN3etE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7309
X-Proofpoint-GUID: QW1yD-iGFcNTfv9ao4zl1n_H95Q91FEQ
X-Proofpoint-ORIG-GUID: QW1yD-iGFcNTfv9ao4zl1n_H95Q91FEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_15,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309260187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188279

--_000_SA2PR04MB7723CF84606B832D13CD45EBF4C3ASA2PR04MB7723namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Sure thing. I just sent up a patch that upgrades master to Libwebp 1.3.2, w=
hich contains the fix for the CVE.

I will also send up a patch for Nanbield to ensure all non-EOL branches are=
 patched.

Regards,
Colin
________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, September 26, 2023 16:02
To: McAllister, Colin <Colin.McAllister@garmin.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] libwebp: Fix CVE-2023-5129

CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments un=
less you trust the sender and know the content is safe.


Can we also get a fix for master?  It=92s bad form to fix a CVE in the stab=
le branches without also fixing master, otherwise it=92s possible that secu=
rity issues appear when you upgrade.

Ross

> On 26 Sep 2023, at 21:02, Colin McAllister via lists.openembedded.org <co=
lin.mcallister=3Dgarmin.com@lists.openembedded.org> wrote:
>
> Add patch from libwebp 1.1.0 branch to fix CVE-2023-5129.
> ---
> .../webp/files/CVE-2023-5129.patch            | 362 ++++++++++++++++++
> 1 file changed, 362 insertions(+)
> create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
>
> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/met=
a/recipes-multimedia/webp/files/CVE-2023-5129.patch
> new file mode 100644
> index 0000000000..f27d773c64
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
> @@ -0,0 +1,362 @@
> +From 8bacd63a6de1cc091f85a1692390401e7bbf55ac Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Thu, 7 Sep 2023 21:16:03 +0200
> +Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.
> +
> +First, BuildHuffmanTable is called to check if the data is valid.
> +If it is and the table is not big enough, more memory is allocated.
> +
> +This will make sure that valid (but unoptimized because of unbalanced
> +codes) streams are still decodable.
> +
> +Bug: chromium:1479274
> +Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
> +(cherry picked from commit 902bc9190331343b2017211debcec8d2ab87e17a)
> +(cherry picked from commit 2af26267cdfcb63a88e5c74a85927a12d6ca1d76)
> +---
> + src/dec/vp8l_dec.c        | 46 ++++++++++---------
> + src/dec/vp8li_dec.h       |  2 +-
> + src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
> + src/utils/huffman_utils.h | 27 +++++++++--
> + 4 files changed, 129 insertions(+), 43 deletions(-)
> +
> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> +index 13480551..186b0b2f 100644
> +--- a/src/dec/vp8l_dec.c
> ++++ b/src/dec/vp8l_dec.c
> +@@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
> +   int symbol;
> +   int max_symbol;
> +   int prev_code_len =3D DEFAULT_CODE_LENGTH;
> +-  HuffmanCode table[1 << LENGTHS_TABLE_BITS];
> ++  HuffmanTables tables;
> +
> +-  if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,
> +-                             code_length_code_lengths,
> +-                             NUM_CODE_LENGTH_CODES)) {
> ++  if (!VP8LHuffmanTablesAllocate(1 << LENGTHS_TABLE_BITS, &tables) ||
> ++      !VP8LBuildHuffmanTable(&tables, LENGTHS_TABLE_BITS,
> ++                             code_length_code_lengths, NUM_CODE_LENGTH_=
CODES)) {
> +     goto End;
> +   }
> +
> +@@ -277,7 +277,7 @@ static int ReadHuffmanCodeLengths(
> +     int code_len;
> +     if (max_symbol-- =3D=3D 0) break;
> +     VP8LFillBitWindow(br);
> +-    p =3D &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
> ++    p =3D &tables.curr_segment->start[VP8LPrefetchBits(br) & LENGTHS_TA=
BLE_MASK];
> +     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
> +     code_len =3D p->value;
> +     if (code_len < kCodeLengthLiterals) {
> +@@ -300,6 +300,7 @@ static int ReadHuffmanCodeLengths(
> +   ok =3D 1;
> +
> +  End:
> ++  VP8LHuffmanTablesDeallocate(&tables);
> +   if (!ok) dec->status_ =3D VP8_STATUS_BITSTREAM_ERROR;
> +   return ok;
> + }
> +@@ -307,7 +308,8 @@ static int ReadHuffmanCodeLengths(
> + // 'code_lengths' is pre-allocated temporary buffer, used for creating =
Huffman
> + // tree.
> + static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
> +-                           int* const code_lengths, HuffmanCode* const =
table) {
> ++                           int* const code_lengths,
> ++                           HuffmanTables* const table) {
> +   int ok =3D 0;
> +   int size =3D 0;
> +   VP8LBitReader* const br =3D &dec->br_;
> +@@ -362,8 +364,7 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, =
int xsize, int ysize,
> +   VP8LMetadata* const hdr =3D &dec->hdr_;
> +   uint32_t* huffman_image =3D NULL;
> +   HTreeGroup* htree_groups =3D NULL;
> +-  HuffmanCode* huffman_tables =3D NULL;
> +-  HuffmanCode* huffman_table =3D NULL;
> ++  HuffmanTables* huffman_tables =3D &hdr->huffman_tables_;
> +   int num_htree_groups =3D 1;
> +   int num_htree_groups_max =3D 1;
> +   int max_alphabet_size =3D 0;
> +@@ -372,6 +373,10 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec,=
 int xsize, int ysize,
> +   int* mapping =3D NULL;
> +   int ok =3D 0;
> +
> ++  // Check the table has been 0 initialized (through InitMetadata).
> ++  assert(huffman_tables->root.start =3D=3D NULL);
> ++  assert(huffman_tables->curr_segment =3D=3D NULL);
> ++
> +   if (allow_recursion && VP8LReadBits(br, 1)) {
> +     // use meta Huffman codes.
> +     const int huffman_precision =3D VP8LReadBits(br, 3) + 2;
> +@@ -434,16 +439,15 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec=
, int xsize, int ysize,
> +
> +   code_lengths =3D (int*)WebPSafeCalloc((uint64_t)max_alphabet_size,
> +                                       sizeof(*code_lengths));
> +-  huffman_tables =3D (HuffmanCode*)WebPSafeMalloc(num_htree_groups * ta=
ble_size,
> +-                                                sizeof(*huffman_tables)=
);
> +   htree_groups =3D VP8LHtreeGroupsNew(num_htree_groups);
> +
> +-  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL || huffman_t=
ables =3D=3D NULL) {
> ++  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL ||
> ++      !VP8LHuffmanTablesAllocate(num_htree_groups * table_size,
> ++                                 huffman_tables)) {
> +     dec->status_ =3D VP8_STATUS_OUT_OF_MEMORY;
> +     goto Error;
> +   }
> +
> +-  huffman_table =3D huffman_tables;
> +   for (i =3D 0; i < num_htree_groups_max; ++i) {
> +     // If the index "i" is unused in the Huffman image, just make sure =
the
> +     // coefficients are valid but do not store them.
> +@@ -468,19 +472,20 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec=
, int xsize, int ysize,
> +       int max_bits =3D 0;
> +       for (j =3D 0; j < HUFFMAN_CODES_PER_META_CODE; ++j) {
> +         int alphabet_size =3D kAlphabetSize[j];
> +-        htrees[j] =3D huffman_table;
> +         if (j =3D=3D 0 && color_cache_bits > 0) {
> +           alphabet_size +=3D (1 << color_cache_bits);
> +         }
> +-        size =3D ReadHuffmanCode(alphabet_size, dec, code_lengths, huff=
man_table);
> ++        size =3D
> ++            ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_t=
ables);
> ++        htrees[j] =3D huffman_tables->curr_segment->curr_table;
> +         if (size =3D=3D 0) {
> +           goto Error;
> +         }
> +         if (is_trivial_literal && kLiteralMap[j] =3D=3D 1) {
> +-          is_trivial_literal =3D (huffman_table->bits =3D=3D 0);
> ++          is_trivial_literal =3D (htrees[j]->bits =3D=3D 0);
> +         }
> +-        total_size +=3D huffman_table->bits;
> +-        huffman_table +=3D size;
> ++        total_size +=3D htrees[j]->bits;
> ++        huffman_tables->curr_segment->curr_table +=3D size;
> +         if (j <=3D ALPHA) {
> +           int local_max_bits =3D code_lengths[0];
> +           int k;
> +@@ -515,14 +520,13 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec=
, int xsize, int ysize,
> +   hdr->huffman_image_ =3D huffman_image;
> +   hdr->num_htree_groups_ =3D num_htree_groups;
> +   hdr->htree_groups_ =3D htree_groups;
> +-  hdr->huffman_tables_ =3D huffman_tables;
> +
> +  Error:
> +   WebPSafeFree(code_lengths);
> +   WebPSafeFree(mapping);
> +   if (!ok) {
> +     WebPSafeFree(huffman_image);
> +-    WebPSafeFree(huffman_tables);
> ++    VP8LHuffmanTablesDeallocate(huffman_tables);
> +     VP8LHtreeGroupsFree(htree_groups);
> +   }
> +   return ok;
> +@@ -1358,7 +1362,7 @@ static void ClearMetadata(VP8LMetadata* const hdr)=
 {
> +   assert(hdr !=3D NULL);
> +
> +   WebPSafeFree(hdr->huffman_image_);
> +-  WebPSafeFree(hdr->huffman_tables_);
> ++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
> +   VP8LHtreeGroupsFree(hdr->htree_groups_);
> +   VP8LColorCacheClear(&hdr->color_cache_);
> +   VP8LColorCacheClear(&hdr->saved_color_cache_);
> +@@ -1673,7 +1677,7 @@ int VP8LDecodeImage(VP8LDecoder* const dec) {
> +
> +   if (dec =3D=3D NULL) return 0;
> +
> +-  assert(dec->hdr_.huffman_tables_ !=3D NULL);
> ++  assert(dec->hdr_.huffman_tables_.root.start !=3D NULL);
> +   assert(dec->hdr_.htree_groups_ !=3D NULL);
> +   assert(dec->hdr_.num_htree_groups_ > 0);
> +
> +diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
> +index 72b2e861..32540a4b 100644
> +--- a/src/dec/vp8li_dec.h
> ++++ b/src/dec/vp8li_dec.h
> +@@ -51,7 +51,7 @@ typedef struct {
> +   uint32_t*       huffman_image_;
> +   int             num_htree_groups_;
> +   HTreeGroup*     htree_groups_;
> +-  HuffmanCode*    huffman_tables_;
> ++  HuffmanTables   huffman_tables_;
> + } VP8LMetadata;
> +
> + typedef struct VP8LDecoder VP8LDecoder;
> +diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
> +index 0cba0fbb..9efd6283 100644
> +--- a/src/utils/huffman_utils.c
> ++++ b/src/utils/huffman_utils.c
> +@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const ro=
ot_table, int root_bits,
> +       if (num_open < 0) {
> +         return 0;
> +       }
> +-      if (root_table =3D=3D NULL) continue;
> +       for (; count[len] > 0; --count[len]) {
> +         HuffmanCode code;
> +         if ((key & mask) !=3D low) {
> +-          table +=3D table_size;
> ++          if (root_table !=3D NULL) table +=3D table_size;
> +           table_bits =3D NextTableBitSize(count, len, root_bits);
> +           table_size =3D 1 << table_bits;
> +           total_size +=3D table_size;
> +           low =3D key & mask;
> +-          root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> +-          root_table[low].value =3D (uint16_t)((table - root_table) - l=
ow);
> ++          if (root_table !=3D NULL) {
> ++            root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> ++            root_table[low].value =3D (uint16_t)((table - root_table) -=
 low);
> ++          }
> ++        }
> ++        if (root_table !=3D NULL) {
> ++          code.bits =3D (uint8_t)(len - root_bits);
> ++          code.value =3D (uint16_t)sorted[symbol++];
> ++          ReplicateValue(&table[key >> root_bits], step, table_size, co=
de);
> +         }
> +-        code.bits =3D (uint8_t)(len - root_bits);
> +-        code.value =3D (uint16_t)sorted[symbol++];
> +-        ReplicateValue(&table[key >> root_bits], step, table_size, code=
);
> +         key =3D GetNextKey(key, len);
> +       }
> +     }
> +@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const ro=
ot_table, int root_bits,
> +   ((1 << MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH_CODES)
> + // Cut-off value for switching between heap and stack allocation.
> + #define SORTED_SIZE_CUTOFF 512
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int code_lengths_si=
ze) {
> +-  int total_size;
> ++  const int total_size =3D
> ++      BuildHuffmanTable(NULL, root_bits, code_lengths, code_lengths_siz=
e, NULL);
> +   assert(code_lengths_size <=3D MAX_CODE_LENGTHS_SIZE);
> +-  if (root_table =3D=3D NULL) {
> +-    total_size =3D BuildHuffmanTable(NULL, root_bits,
> +-                                   code_lengths, code_lengths_size, NUL=
L);
> +-  } else if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> ++  if (total_size =3D=3D 0 || root_table =3D=3D NULL) return total_size;
> ++
> ++  if (root_table->curr_segment->curr_table + total_size >=3D
> ++      root_table->curr_segment->start + root_table->curr_segment->size)=
 {
> ++    // If 'root_table' does not have enough memory, allocate a new segm=
ent.
> ++    // The available part of root_table->curr_segment is left unused be=
cause we
> ++    // need a contiguous buffer.
> ++    const int segment_size =3D root_table->curr_segment->size;
> ++    struct HuffmanTablesSegment* next =3D
> ++        (HuffmanTablesSegment*)WebPSafeMalloc(1, sizeof(*next));
> ++    if (next =3D=3D NULL) return 0;
> ++    // Fill the new segment.
> ++    // We need at least 'total_size' but if that value is small, it is =
better to
> ++    // allocate a big chunk to prevent more allocations later. 'segment=
_size' is
> ++    // therefore chosen (any other arbitrary value could be chosen).
> ++    next->size =3D total_size > segment_size ? total_size : segment_siz=
e;
> ++    next->start =3D
> ++        (HuffmanCode*)WebPSafeMalloc(next->size, sizeof(*next->start));
> ++    if (next->start =3D=3D NULL) {
> ++      WebPSafeFree(next);
> ++      return 0;
> ++    }
> ++    next->curr_table =3D next->start;
> ++    next->next =3D NULL;
> ++    // Point to the new segment.
> ++    root_table->curr_segment->next =3D next;
> ++    root_table->curr_segment =3D next;
> ++  }
> ++  if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> +     // use local stack-allocated array.
> +     uint16_t sorted[SORTED_SIZE_CUTOFF];
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size, sor=
ted);
> +-  } else {   // rare case. Use heap allocation.
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> ++  } else {  // rare case. Use heap allocation.
> +     uint16_t* const sorted =3D
> +         (uint16_t*)WebPSafeMalloc(code_lengths_size, sizeof(*sorted));
> +     if (sorted =3D=3D NULL) return 0;
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size, sor=
ted);
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> +     WebPSafeFree(sorted);
> +   }
> +   return total_size;
> + }
> ++
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) =
{
> ++  // Have 'segment' point to the first segment for now, 'root'.
> ++  HuffmanTablesSegment* const root =3D &huffman_tables->root;
> ++  huffman_tables->curr_segment =3D root;
> ++  // Allocate root.
> ++  root->start =3D (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root->star=
t));
> ++  if (root->start =3D=3D NULL) return 0;
> ++  root->curr_table =3D root->start;
> ++  root->next =3D NULL;
> ++  root->size =3D size;
> ++  return 1;
> ++}
> ++
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {
> ++  HuffmanTablesSegment *current, *next;
> ++  if (huffman_tables =3D=3D NULL) return;
> ++  // Free the root node.
> ++  current =3D &huffman_tables->root;
> ++  next =3D current->next;
> ++  WebPSafeFree(current->start);
> ++  current->start =3D NULL;
> ++  current->next =3D NULL;
> ++  current =3D next;
> ++  // Free the following nodes.
> ++  while (current !=3D NULL) {
> ++    next =3D current->next;
> ++    WebPSafeFree(current->start);
> ++    WebPSafeFree(current);
> ++    current =3D next;
> ++  }
> ++}
> +diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
> +index 13b7ad1a..98415c53 100644
> +--- a/src/utils/huffman_utils.h
> ++++ b/src/utils/huffman_utils.h
> +@@ -43,6 +43,29 @@ typedef struct {
> +                     // or non-literal symbol otherwise
> + } HuffmanCode32;
> +
> ++// Contiguous memory segment of HuffmanCodes.
> ++typedef struct HuffmanTablesSegment {
> ++  HuffmanCode* start;
> ++  // Pointer to where we are writing into the segment. Starts at 'start=
' and
> ++  // cannot go beyond 'start' + 'size'.
> ++  HuffmanCode* curr_table;
> ++  // Pointer to the next segment in the chain.
> ++  struct HuffmanTablesSegment* next;
> ++  int size;
> ++} HuffmanTablesSegment;
> ++
> ++// Chained memory segments of HuffmanCodes.
> ++typedef struct HuffmanTables {
> ++  HuffmanTablesSegment root;
> ++  // Currently processed segment. At first, this is 'root'.
> ++  HuffmanTablesSegment* curr_segment;
> ++} HuffmanTables;
> ++
> ++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes. Retur=
ns 0 on
> ++// memory allocation error, 1 otherwise.
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);
> ++
> + #define HUFFMAN_PACKED_BITS 6
> + #define HUFFMAN_PACKED_TABLE_SIZE (1u << HUFFMAN_PACKED_BITS)
> +
> +@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const htree_grou=
ps);
> + // the huffman table.
> + // Returns built table size or 0 in case of error (invalid tree or
> + // memory error).
> +-// If root_table is NULL, it returns 0 if a lookup cannot be built, som=
ething
> +-// > 0 otherwise (but not the table size).
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int code_lengths_si=
ze);
> +
> + #ifdef __cplusplus
> +--
> +2.42.0
> +
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188260): https://urldefense.com/v3/__https://lists.op=
enembedded.org/g/openembedded-core/message/188260__;!!EJc4YC3iFmQ!SkiaPIWCR=
XbvfxPVGZbVOuDHTmP8yx5C0UJ1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6ElyhF=
wCM$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.o=
rg/mt/101604268/6875888__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0UJ=
1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6EZ7RpmeY$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-core/unsub__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0U=
J1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6EHTwFJps$  [ross.burton@arm.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_SA2PR04MB7723CF84606B832D13CD45EBF4C3ASA2PR04MB7723namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Ross,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sure thing. I just sent up a patch that upgrades master to Libwebp 1.3.2, w=
hich contains the fix for the CVE.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
I will also send up a patch for&nbsp;Nanbield to ensure all non-EOL branche=
s are patched.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Colin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Tuesday, September 26, 2023 16:02<br>
<b>To:</b> McAllister, Colin &lt;Colin.McAllister@garmin.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [dunfell][PATCH] libwebp: Fix CVE-2023-5129</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION - EXTERNAL EMAIL: Do not click any links o=
r open any attachments unless you trust the sender and know the content is =
safe.<br>
<br>
<br>
Can we also get a fix for master?&nbsp; It=92s bad form to fix a CVE in the=
 stable branches without also fixing master, otherwise it=92s possible that=
 security issues appear when you upgrade.<br>
<br>
Ross<br>
<br>
&gt; On 26 Sep 2023, at 21:02, Colin McAllister via lists.openembedded.org =
&lt;colin.mcallister=3Dgarmin.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; Add patch from libwebp 1.1.0 branch to fix CVE-2023-5129.<br>
&gt; ---<br>
&gt; .../webp/files/CVE-2023-5129.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 362 ++++++++++++++++++<br>
&gt; 1 file changed, 362 insertions(+)<br>
&gt; create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.pa=
tch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/=
meta/recipes-multimedia/webp/files/CVE-2023-5129.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f27d773c64<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch<br>
&gt; @@ -0,0 +1,362 @@<br>
&gt; +From 8bacd63a6de1cc091f85a1692390401e7bbf55ac Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Vincent Rabaud &lt;vrabaud@google.com&gt;<br>
&gt; +Date: Thu, 7 Sep 2023 21:16:03 +0200<br>
&gt; +Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.<br>
&gt; +<br>
&gt; +First, BuildHuffmanTable is called to check if the data is valid.<br>
&gt; +If it is and the table is not big enough, more memory is allocated.<b=
r>
&gt; +<br>
&gt; +This will make sure that valid (but unoptimized because of unbalanced=
<br>
&gt; +codes) streams are still decodable.<br>
&gt; +<br>
&gt; +Bug: chromium:1479274<br>
&gt; +Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741<br>
&gt; +(cherry picked from commit 902bc9190331343b2017211debcec8d2ab87e17a)<=
br>
&gt; +(cherry picked from commit 2af26267cdfcb63a88e5c74a85927a12d6ca1d76)<=
br>
&gt; +---<br>
&gt; + src/dec/vp8l_dec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 46 ++=
++++++++---------<br>
&gt; + src/dec/vp8li_dec.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-=
<br>
&gt; + src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++------=
--<br>
&gt; + src/utils/huffman_utils.h | 27 +++++++++--<br>
&gt; + 4 files changed, 129 insertions(+), 43 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
&gt; +index 13480551..186b0b2f 100644<br>
&gt; +--- a/src/dec/vp8l_dec.c<br>
&gt; ++++ b/src/dec/vp8l_dec.c<br>
&gt; +@@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(<br>
&gt; +&nbsp;&nbsp; int symbol;<br>
&gt; +&nbsp;&nbsp; int max_symbol;<br>
&gt; +&nbsp;&nbsp; int prev_code_len =3D DEFAULT_CODE_LENGTH;<br>
&gt; +-&nbsp; HuffmanCode table[1 &lt;&lt; LENGTHS_TABLE_BITS];<br>
&gt; ++&nbsp; HuffmanTables tables;<br>
&gt; +<br>
&gt; +-&nbsp; if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; code_length_code_lengths,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; NUM_CODE_LENGTH_CODES)) {<br>
&gt; ++&nbsp; if (!VP8LHuffmanTablesAllocate(1 &lt;&lt; LENGTHS_TABLE_BITS,=
 &amp;tables) ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !VP8LBuildHuffmanTable(&amp;tables, L=
ENGTHS_TABLE_BITS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; code_length_code_lengths, NUM_CODE_LENGTH_CODES))=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; goto End;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +@@ -277,7 +277,7 @@ static int ReadHuffmanCodeLengths(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int code_len;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (max_symbol-- =3D=3D 0) break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; VP8LFillBitWindow(br);<br>
&gt; +-&nbsp;&nbsp;&nbsp; p =3D &amp;table[VP8LPrefetchBits(br) &amp; LENGT=
HS_TABLE_MASK];<br>
&gt; ++&nbsp;&nbsp;&nbsp; p =3D &amp;tables.curr_segment-&gt;start[VP8LPref=
etchBits(br) &amp; LENGTHS_TABLE_MASK];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; VP8LSetBitPos(br, br-&gt;bit_pos_ + p-&gt;bi=
ts);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; code_len =3D p-&gt;value;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (code_len &lt; kCodeLengthLiterals) {<br>
&gt; +@@ -300,6 +300,7 @@ static int ReadHuffmanCodeLengths(<br>
&gt; +&nbsp;&nbsp; ok =3D 1;<br>
&gt; +<br>
&gt; +&nbsp; End:<br>
&gt; ++&nbsp; VP8LHuffmanTablesDeallocate(&amp;tables);<br>
&gt; +&nbsp;&nbsp; if (!ok) dec-&gt;status_ =3D VP8_STATUS_BITSTREAM_ERROR;=
<br>
&gt; +&nbsp;&nbsp; return ok;<br>
&gt; + }<br>
&gt; +@@ -307,7 +308,8 @@ static int ReadHuffmanCodeLengths(<br>
&gt; + // 'code_lengths' is pre-allocated temporary buffer, used for creati=
ng Huffman<br>
&gt; + // tree.<br>
&gt; + static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec=
,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int* const code_lengths, HuffmanCode* const table) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int* const code_lengths,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; HuffmanTables* const table) {<br>
&gt; +&nbsp;&nbsp; int ok =3D 0;<br>
&gt; +&nbsp;&nbsp; int size =3D 0;<br>
&gt; +&nbsp;&nbsp; VP8LBitReader* const br =3D &amp;dec-&gt;br_;<br>
&gt; +@@ -362,8 +364,7 @@ static int ReadHuffmanCodes(VP8LDecoder* const de=
c, int xsize, int ysize,<br>
&gt; +&nbsp;&nbsp; VP8LMetadata* const hdr =3D &amp;dec-&gt;hdr_;<br>
&gt; +&nbsp;&nbsp; uint32_t* huffman_image =3D NULL;<br>
&gt; +&nbsp;&nbsp; HTreeGroup* htree_groups =3D NULL;<br>
&gt; +-&nbsp; HuffmanCode* huffman_tables =3D NULL;<br>
&gt; +-&nbsp; HuffmanCode* huffman_table =3D NULL;<br>
&gt; ++&nbsp; HuffmanTables* huffman_tables =3D &amp;hdr-&gt;huffman_tables=
_;<br>
&gt; +&nbsp;&nbsp; int num_htree_groups =3D 1;<br>
&gt; +&nbsp;&nbsp; int num_htree_groups_max =3D 1;<br>
&gt; +&nbsp;&nbsp; int max_alphabet_size =3D 0;<br>
&gt; +@@ -372,6 +373,10 @@ static int ReadHuffmanCodes(VP8LDecoder* const d=
ec, int xsize, int ysize,<br>
&gt; +&nbsp;&nbsp; int* mapping =3D NULL;<br>
&gt; +&nbsp;&nbsp; int ok =3D 0;<br>
&gt; +<br>
&gt; ++&nbsp; // Check the table has been 0 initialized (through InitMetada=
ta).<br>
&gt; ++&nbsp; assert(huffman_tables-&gt;root.start =3D=3D NULL);<br>
&gt; ++&nbsp; assert(huffman_tables-&gt;curr_segment =3D=3D NULL);<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; if (allow_recursion &amp;&amp; VP8LReadBits(br, 1)) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // use meta Huffman codes.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const int huffman_precision =3D VP8LReadBits=
(br, 3) + 2;<br>
&gt; +@@ -434,16 +439,15 @@ static int ReadHuffmanCodes(VP8LDecoder* const =
dec, int xsize, int ysize,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; code_lengths =3D (int*)WebPSafeCalloc((uint64_t)max_alph=
abet_size,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; sizeof(*code_lengths));<br>
&gt; +-&nbsp; huffman_tables =3D (HuffmanCode*)WebPSafeMalloc(num_htree_gro=
ups * table_size,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*hu=
ffman_tables));<br>
&gt; +&nbsp;&nbsp; htree_groups =3D VP8LHtreeGroupsNew(num_htree_groups);<b=
r>
&gt; +<br>
&gt; +-&nbsp; if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL || h=
uffman_tables =3D=3D NULL) {<br>
&gt; ++&nbsp; if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL ||<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !VP8LHuffmanTablesAllocate(num_htree_=
groups * table_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; huffman_tables)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dec-&gt;status_ =3D VP8_STATUS_OUT_OF_MEMORY=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; goto Error;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp; huffman_table =3D huffman_tables;<br>
&gt; +&nbsp;&nbsp; for (i =3D 0; i &lt; num_htree_groups_max; ++i) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // If the index &quot;i&quot; is unused in t=
he Huffman image, just make sure the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // coefficients are valid but do not store t=
hem.<br>
&gt; +@@ -468,19 +472,20 @@ static int ReadHuffmanCodes(VP8LDecoder* const =
dec, int xsize, int ysize,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_bits =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; HUFFMAN_COD=
ES_PER_META_CODE; ++j) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int alphabet_size =
=3D kAlphabetSize[j];<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; htrees[j] =3D huffman_tab=
le;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j =3D=3D 0 &amp;=
&amp; color_cache_bits &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alphabet=
_size +=3D (1 &lt;&lt; color_cache_bits);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D ReadHuffmanCode(=
alphabet_size, dec, code_lengths, huffman_table);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R=
eadHuffmanCode(alphabet_size, dec, code_lengths, huffman_tables);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; htrees[j] =3D huffman_tab=
les-&gt;curr_segment-&gt;curr_table;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (size =3D=3D 0) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto Err=
or;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_trivial_liter=
al &amp;&amp; kLiteralMap[j] =3D=3D 1) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_trivial_li=
teral =3D (huffman_table-&gt;bits =3D=3D 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_trivial_li=
teral =3D (htrees[j]-&gt;bits =3D=3D 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_size +=3D huffman_t=
able-&gt;bits;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; huffman_table +=3D size;<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_size +=3D htrees[j]=
-&gt;bits;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; huffman_tables-&gt;curr_s=
egment-&gt;curr_table +=3D size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j &lt;=3D ALPHA)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int loca=
l_max_bits =3D code_lengths[0];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int k;<b=
r>
&gt; +@@ -515,14 +520,13 @@ static int ReadHuffmanCodes(VP8LDecoder* const =
dec, int xsize, int ysize,<br>
&gt; +&nbsp;&nbsp; hdr-&gt;huffman_image_ =3D huffman_image;<br>
&gt; +&nbsp;&nbsp; hdr-&gt;num_htree_groups_ =3D num_htree_groups;<br>
&gt; +&nbsp;&nbsp; hdr-&gt;htree_groups_ =3D htree_groups;<br>
&gt; +-&nbsp; hdr-&gt;huffman_tables_ =3D huffman_tables;<br>
&gt; +<br>
&gt; +&nbsp; Error:<br>
&gt; +&nbsp;&nbsp; WebPSafeFree(code_lengths);<br>
&gt; +&nbsp;&nbsp; WebPSafeFree(mapping);<br>
&gt; +&nbsp;&nbsp; if (!ok) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WebPSafeFree(huffman_image);<br>
&gt; +-&nbsp;&nbsp;&nbsp; WebPSafeFree(huffman_tables);<br>
&gt; ++&nbsp;&nbsp;&nbsp; VP8LHuffmanTablesDeallocate(huffman_tables);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; VP8LHtreeGroupsFree(htree_groups);<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; return ok;<br>
&gt; +@@ -1358,7 +1362,7 @@ static void ClearMetadata(VP8LMetadata* const h=
dr) {<br>
&gt; +&nbsp;&nbsp; assert(hdr !=3D NULL);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; WebPSafeFree(hdr-&gt;huffman_image_);<br>
&gt; +-&nbsp; WebPSafeFree(hdr-&gt;huffman_tables_);<br>
&gt; ++&nbsp; VP8LHuffmanTablesDeallocate(&amp;hdr-&gt;huffman_tables_);<br=
>
&gt; +&nbsp;&nbsp; VP8LHtreeGroupsFree(hdr-&gt;htree_groups_);<br>
&gt; +&nbsp;&nbsp; VP8LColorCacheClear(&amp;hdr-&gt;color_cache_);<br>
&gt; +&nbsp;&nbsp; VP8LColorCacheClear(&amp;hdr-&gt;saved_color_cache_);<br=
>
&gt; +@@ -1673,7 +1677,7 @@ int VP8LDecodeImage(VP8LDecoder* const dec) {<b=
r>
&gt; +<br>
&gt; +&nbsp;&nbsp; if (dec =3D=3D NULL) return 0;<br>
&gt; +<br>
&gt; +-&nbsp; assert(dec-&gt;hdr_.huffman_tables_ !=3D NULL);<br>
&gt; ++&nbsp; assert(dec-&gt;hdr_.huffman_tables_.root.start !=3D NULL);<br=
>
&gt; +&nbsp;&nbsp; assert(dec-&gt;hdr_.htree_groups_ !=3D NULL);<br>
&gt; +&nbsp;&nbsp; assert(dec-&gt;hdr_.num_htree_groups_ &gt; 0);<br>
&gt; +<br>
&gt; +diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h<br>
&gt; +index 72b2e861..32540a4b 100644<br>
&gt; +--- a/src/dec/vp8li_dec.h<br>
&gt; ++++ b/src/dec/vp8li_dec.h<br>
&gt; +@@ -51,7 +51,7 @@ typedef struct {<br>
&gt; +&nbsp;&nbsp; uint32_t*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; huffman_im=
age_;<br>
&gt; +&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; num_htree_groups_;<br>
&gt; +&nbsp;&nbsp; HTreeGroup*&nbsp;&nbsp;&nbsp;&nbsp; htree_groups_;<br>
&gt; +-&nbsp; HuffmanCode*&nbsp;&nbsp;&nbsp; huffman_tables_;<br>
&gt; ++&nbsp; HuffmanTables&nbsp;&nbsp; huffman_tables_;<br>
&gt; + } VP8LMetadata;<br>
&gt; +<br>
&gt; + typedef struct VP8LDecoder VP8LDecoder;<br>
&gt; +diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c<br=
>
&gt; +index 0cba0fbb..9efd6283 100644<br>
&gt; +--- a/src/utils/huffman_utils.c<br>
&gt; ++++ b/src/utils/huffman_utils.c<br>
&gt; +@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const=
 root_table, int root_bits,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_open &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_table =3D=3D NULL) continue;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (; count[len] &gt; 0; --coun=
t[len]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HuffmanCode code;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((key &amp; mask)=
 !=3D low) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table +=3D ta=
ble_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_tabl=
e !=3D NULL) table +=3D table_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_bi=
ts =3D NextTableBitSize(count, len, root_bits);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_si=
ze =3D 1 &lt;&lt; table_bits;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_si=
ze +=3D table_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low =3D =
key &amp; mask;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_table[lo=
w].bits =3D (uint8_t)(table_bits + root_bits);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_table[lo=
w].value =3D (uint16_t)((table - root_table) - low);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_tabl=
e !=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
oot_table[low].bits =3D (uint8_t)(table_bits + root_bits);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
oot_table[low].value =3D (uint16_t)((table - root_table) - low);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (root_table !=3D NULL)=
 {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.bits =3D=
 (uint8_t)(len - root_bits);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.value =
=3D (uint16_t)sorted[symbol++];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ReplicateValu=
e(&amp;table[key &gt;&gt; root_bits], step, table_size, code);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.bits =3D (uint8_t)(l=
en - root_bits);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.value =3D (uint16_t)=
sorted[symbol++];<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ReplicateValue(&amp;table=
[key &gt;&gt; root_bits], step, table_size, code);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key =3D GetNextKey(k=
ey, len);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const=
 root_table, int root_bits,<br>
&gt; +&nbsp;&nbsp; ((1 &lt;&lt; MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_L=
ENGTH_CODES)<br>
&gt; + // Cut-off value for switching between heap and stack allocation.<br=
>
&gt; + #define SORTED_SIZE_CUTOFF 512<br>
&gt; +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bi=
ts,<br>
&gt; ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_=
bits,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; const int code_lengths[], int code_lengths_size) {<br>
&gt; +-&nbsp; int total_size;<br>
&gt; ++&nbsp; const int total_size =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BuildHuffmanTable(NULL, root_bits, co=
de_lengths, code_lengths_size, NULL);<br>
&gt; +&nbsp;&nbsp; assert(code_lengths_size &lt;=3D MAX_CODE_LENGTHS_SIZE);=
<br>
&gt; +-&nbsp; if (root_table =3D=3D NULL) {<br>
&gt; +-&nbsp;&nbsp;&nbsp; total_size =3D BuildHuffmanTable(NULL, root_bits,=
<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code_lengths,=
 code_lengths_size, NULL);<br>
&gt; +-&nbsp; } else if (code_lengths_size &lt;=3D SORTED_SIZE_CUTOFF) {<br=
>
&gt; ++&nbsp; if (total_size =3D=3D 0 || root_table =3D=3D NULL) return tot=
al_size;<br>
&gt; ++<br>
&gt; ++&nbsp; if (root_table-&gt;curr_segment-&gt;curr_table + total_size &=
gt;=3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_table-&gt;curr_segment-&gt;start=
 + root_table-&gt;curr_segment-&gt;size) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; // If 'root_table' does not have enough memory, a=
llocate a new segment.<br>
&gt; ++&nbsp;&nbsp;&nbsp; // The available part of root_table-&gt;curr_segm=
ent is left unused because we<br>
&gt; ++&nbsp;&nbsp;&nbsp; // need a contiguous buffer.<br>
&gt; ++&nbsp;&nbsp;&nbsp; const int segment_size =3D root_table-&gt;curr_se=
gment-&gt;size;<br>
&gt; ++&nbsp;&nbsp;&nbsp; struct HuffmanTablesSegment* next =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (HuffmanTablesSegment*)We=
bPSafeMalloc(1, sizeof(*next));<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (next =3D=3D NULL) return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp; // Fill the new segment.<br>
&gt; ++&nbsp;&nbsp;&nbsp; // We need at least 'total_size' but if that valu=
e is small, it is better to<br>
&gt; ++&nbsp;&nbsp;&nbsp; // allocate a big chunk to prevent more allocatio=
ns later. 'segment_size' is<br>
&gt; ++&nbsp;&nbsp;&nbsp; // therefore chosen (any other arbitrary value co=
uld be chosen).<br>
&gt; ++&nbsp;&nbsp;&nbsp; next-&gt;size =3D total_size &gt; segment_size ? =
total_size : segment_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp; next-&gt;start =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (HuffmanCode*)WebPSafeMal=
loc(next-&gt;size, sizeof(*next-&gt;start));<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (next-&gt;start =3D=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebPSafeFree(next);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; next-&gt;curr_table =3D next-&gt;start;<br>
&gt; ++&nbsp;&nbsp;&nbsp; next-&gt;next =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp; // Point to the new segment.<br>
&gt; ++&nbsp;&nbsp;&nbsp; root_table-&gt;curr_segment-&gt;next =3D next;<br=
>
&gt; ++&nbsp;&nbsp;&nbsp; root_table-&gt;curr_segment =3D next;<br>
&gt; ++&nbsp; }<br>
&gt; ++&nbsp; if (code_lengths_size &lt;=3D SORTED_SIZE_CUTOFF) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // use local stack-allocated array.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint16_t sorted[SORTED_SIZE_CUTOFF];<br>
&gt; +-&nbsp;&nbsp;&nbsp; total_size =3D BuildHuffmanTable(root_table, root=
_bits,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code_lengths,=
 code_lengths_size, sorted);<br>
&gt; +-&nbsp; } else {&nbsp;&nbsp; // rare case. Use heap allocation.<br>
&gt; ++&nbsp;&nbsp;&nbsp; BuildHuffmanTable(root_table-&gt;curr_segment-&gt=
;curr_table, root_bits,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code_lengths, co=
de_lengths_size, sorted);<br>
&gt; ++&nbsp; } else {&nbsp; // rare case. Use heap allocation.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint16_t* const sorted =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint16_t*)WebPSafeM=
alloc(code_lengths_size, sizeof(*sorted));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (sorted =3D=3D NULL) return 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp; total_size =3D BuildHuffmanTable(root_table, root=
_bits,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code_lengths,=
 code_lengths_size, sorted);<br>
&gt; ++&nbsp;&nbsp;&nbsp; BuildHuffmanTable(root_table-&gt;curr_segment-&gt=
;curr_table, root_bits,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code_lengths, co=
de_lengths_size, sorted);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WebPSafeFree(sorted);<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; return total_size;<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_table=
s) {<br>
&gt; ++&nbsp; // Have 'segment' point to the first segment for now, 'root'.=
<br>
&gt; ++&nbsp; HuffmanTablesSegment* const root =3D &amp;huffman_tables-&gt;=
root;<br>
&gt; ++&nbsp; huffman_tables-&gt;curr_segment =3D root;<br>
&gt; ++&nbsp; // Allocate root.<br>
&gt; ++&nbsp; root-&gt;start =3D (HuffmanCode*)WebPSafeMalloc(size, sizeof(=
*root-&gt;start));<br>
&gt; ++&nbsp; if (root-&gt;start =3D=3D NULL) return 0;<br>
&gt; ++&nbsp; root-&gt;curr_table =3D root-&gt;start;<br>
&gt; ++&nbsp; root-&gt;next =3D NULL;<br>
&gt; ++&nbsp; root-&gt;size =3D size;<br>
&gt; ++&nbsp; return 1;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables=
) {<br>
&gt; ++&nbsp; HuffmanTablesSegment *current, *next;<br>
&gt; ++&nbsp; if (huffman_tables =3D=3D NULL) return;<br>
&gt; ++&nbsp; // Free the root node.<br>
&gt; ++&nbsp; current =3D &amp;huffman_tables-&gt;root;<br>
&gt; ++&nbsp; next =3D current-&gt;next;<br>
&gt; ++&nbsp; WebPSafeFree(current-&gt;start);<br>
&gt; ++&nbsp; current-&gt;start =3D NULL;<br>
&gt; ++&nbsp; current-&gt;next =3D NULL;<br>
&gt; ++&nbsp; current =3D next;<br>
&gt; ++&nbsp; // Free the following nodes.<br>
&gt; ++&nbsp; while (current !=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; next =3D current-&gt;next;<br>
&gt; ++&nbsp;&nbsp;&nbsp; WebPSafeFree(current-&gt;start);<br>
&gt; ++&nbsp;&nbsp;&nbsp; WebPSafeFree(current);<br>
&gt; ++&nbsp;&nbsp;&nbsp; current =3D next;<br>
&gt; ++&nbsp; }<br>
&gt; ++}<br>
&gt; +diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h<br=
>
&gt; +index 13b7ad1a..98415c53 100644<br>
&gt; +--- a/src/utils/huffman_utils.h<br>
&gt; ++++ b/src/utils/huffman_utils.h<br>
&gt; +@@ -43,6 +43,29 @@ typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // or non-literal symbo=
l otherwise<br>
&gt; + } HuffmanCode32;<br>
&gt; +<br>
&gt; ++// Contiguous memory segment of HuffmanCodes.<br>
&gt; ++typedef struct HuffmanTablesSegment {<br>
&gt; ++&nbsp; HuffmanCode* start;<br>
&gt; ++&nbsp; // Pointer to where we are writing into the segment. Starts a=
t 'start' and<br>
&gt; ++&nbsp; // cannot go beyond 'start' + 'size'.<br>
&gt; ++&nbsp; HuffmanCode* curr_table;<br>
&gt; ++&nbsp; // Pointer to the next segment in the chain.<br>
&gt; ++&nbsp; struct HuffmanTablesSegment* next;<br>
&gt; ++&nbsp; int size;<br>
&gt; ++} HuffmanTablesSegment;<br>
&gt; ++<br>
&gt; ++// Chained memory segments of HuffmanCodes.<br>
&gt; ++typedef struct HuffmanTables {<br>
&gt; ++&nbsp; HuffmanTablesSegment root;<br>
&gt; ++&nbsp; // Currently processed segment. At first, this is 'root'.<br>
&gt; ++&nbsp; HuffmanTablesSegment* curr_segment;<br>
&gt; ++} HuffmanTables;<br>
&gt; ++<br>
&gt; ++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes. Re=
turns 0 on<br>
&gt; ++// memory allocation error, 1 otherwise.<br>
&gt; ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_table=
s);<br>
&gt; ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables=
);<br>
&gt; ++<br>
&gt; + #define HUFFMAN_PACKED_BITS 6<br>
&gt; + #define HUFFMAN_PACKED_TABLE_SIZE (1u &lt;&lt; HUFFMAN_PACKED_BITS)<=
br>
&gt; +<br>
&gt; +@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const htree_g=
roups);<br>
&gt; + // the huffman table.<br>
&gt; + // Returns built table size or 0 in case of error (invalid tree or<b=
r>
&gt; + // memory error).<br>
&gt; +-// If root_table is NULL, it returns 0 if a lookup cannot be built, =
something<br>
&gt; +-// &gt; 0 otherwise (but not the table size).<br>
&gt; +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bi=
ts,<br>
&gt; ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_=
bits,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; const int code_lengths[], int code_lengths_size);<br>
&gt; +<br>
&gt; + #ifdef __cplusplus<br>
&gt; +--<br>
&gt; +2.42.0<br>
&gt; +<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#188260): <a href=3D"https://urldefense.com/v3/__ht=
tps://lists.openembedded.org/g/openembedded-core/message/188260__;!!EJc4YC3=
iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0UJ1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-t=
wcx2La1H6ElyhFwCM$">
https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-c=
ore/message/188260__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0UJ1dJua=
dJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6ElyhFwCM$</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.=
openembedded.org/mt/101604268/6875888__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVO=
uDHTmP8yx5C0UJ1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6EZ7RpmeY$">
https://urldefense.com/v3/__https://lists.openembedded.org/mt/101604268/687=
5888__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0UJ1dJuadJG-ce-Y_FZQc-=
3PBEVzpmfzZ_-1-twcx2La1H6EZ7RpmeY$</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.open=
embedded.org/g/openembedded-core/unsub__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbV=
OuDHTmP8yx5C0UJ1dJuadJG-ce-Y_FZQc-3PBEVzpmfzZ_-1-twcx2La1H6EHTwFJps$">
https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-c=
ore/unsub__;!!EJc4YC3iFmQ!SkiaPIWCRXbvfxPVGZbVOuDHTmP8yx5C0UJ1dJuadJG-ce-Y_=
FZQc-3PBEVzpmfzZ_-1-twcx2La1H6EHTwFJps$</a>&nbsp; [ross.burton@arm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA2PR04MB7723CF84606B832D13CD45EBF4C3ASA2PR04MB7723namp_--

