Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D878CC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 03:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5143.1700192728055574024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 19:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SWjA0vX9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96855ae82f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AH3Y63D023808
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:45:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=0cE6pjU1optmAtVGE9
	YZ4xumJu1Ps9qKnuPUlzqrRY0=; b=SWjA0vX9Tr+AIPZnSgiZMJQksbS2sX4aFz
	lFp00V7Cl/S2ailuwYtC5Zh8hGca+uZ1hm3X9gzengVUa41z/vYlzsU6SzJwh3Lt
	LkysWBCB0BSMRdrcH1kXo1jbPRSO3k57JwR2vCWYf22vjaYZaSk4e6V2LAzZL0dh
	ae8S49luJo5No0QbJu7a+SRXRz7Qj0hu7CFSNTBi7r11o6EqIukBY3HImJV/DTPO
	x2D/llahRdkXONMrimj5nyrEgKJnDht26XygSMq5nTiCyBTlE+Vfd5AkOH0jymzy
	fbaBQEmo5/q7St6y6UNPTz8RiYb7skIqzENuV5Cx0iEQ284b3Esw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udycrg1b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:45:27 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AH3jRHK010662
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:45:27 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udycrg1b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 19:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih9fV1d1emoYQPRcWN11dRmBRoiXa/WEb+2M0aGkz9QWRYNyRLCYPl7srNSWtVhVYljjG1nWdIEaWHsQCBQVXy3YvKKEoqNnQccK5lOl03hoab5x9xZZbEKDAcXeI7+J41Rw8vDFn2foTtBxcC4B82nsDQJvRlr0Oe3RcvfNG3ELI1w0cdCEeHTE2Y+vHrhEWiHLgGj4SkRBZnwISJ2iE662Ta393zFfmqGO/vHo8U3pcv9qElIHg6dNQln3zxEvA615AWROL2CRa0dYVzV7qOeyyRoTccZ+Nm7qH7wBcx/TwP4lRuKRi/wz8KST3pGMTYOXeViUwAypZNaHk3qNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cE6pjU1optmAtVGE9YZ4xumJu1Ps9qKnuPUlzqrRY0=;
 b=M/EKbor+KIv8oXCGE7mCCiFEky2sDJTxrmJKe/X+HYzszXakY4W53n3r5pGH6lDibaZcwewPZmtmV8b4HuP0fEvdmzl3rPW8dNSSbqvjeomzi1/2e8Nphn+cfVvqfihzLdHDhJVZvGdwZbWUpcgORwF4tIuve9sEpTBPj7Q61LXbY+o3mpaRAEPvt8D1VoXw+aX3ifkMAbu9zPpIxtCsaWfW0mivuCl+PUtkkCpPwJI1ykPeRPBiE+tuv3KJaL9kJOQMqKJFPNG1ahl1uz9parF/t0le9DBTX55ozNcXOyfx8ojMo27C3LYRWNR80GEosY+9bZxcbT3rGBpNgs3tOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH7PR11MB6331.namprd11.prod.outlook.com (2603:10b6:510:1fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 03:45:25 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%4]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 03:45:24 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2048 ->
 9.0.2068
Thread-Topic: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2048 ->
 9.0.2068
Thread-Index: AQHaGJahoH9EWEcLCEiF9J9QepLhC7B935nF
Date: Fri, 17 Nov 2023 03:45:24 +0000
Message-ID: 
 <MW4PR11MB5822782ED2EFBDC947966DB184B7A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231116041524.1344040-1-archana.polampalli@windriver.com>
 <de0eb61e388850417747b3b417a88f402cd595ca.camel@linuxfoundation.org>
In-Reply-To: 
 <de0eb61e388850417747b3b417a88f402cd595ca.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH7PR11MB6331:EE_
x-ms-office365-filtering-correlation-id: 57cd6b6c-08bb-4258-2f8f-08dbe71fa1c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tK0dA7udlGs6qjW0fc7wXlUE28WfM8CuppHmOjPIQJ6FUCXo+wBUGb3eidJjJTKQW/qxHoer4Pw96hN4/W3D6o1Pq7OqGma8SkViXq1dOwfZF4Z99LlzhGVS1bFViJXzs/k4RhdTYX3reFXgAHPSXbfCTzsUkDiVRbcizyINvdIEwIG+RJfDqzHrGFerPsFnQHZ3bQ8HjI80CNbkrEQJm2xD5QcZm1wNIT0+nYpsBhP6ZKX1POgqn3sH5kAdHo+iY65Lf3LRZ6joKRhPZg+kQErSRaiTaJ0rgNHU6s/ktCTbwFPxPdjpOhipzH5AbwlAf4viHWGpXndNkEctChuGbjy6DkZFAG5biT3zaC2JoLoJEyuuGSPR8RzomdloBbK83qPAWBy4jFdYvhM1PmmT6LHUDNZTLYU86Kq9W4GV+GYHvX/Z9eqrJcx/CnDtv1FRHh+wen+UhvPfmPrEreMJDSmZO8PP1fmTw+SQRDvCUb6yMAiGTuQopibK1qlPLV/hTFrDCIFfaMPJeyfGmh4LBGoH4MPqSsR3TodC/eGYknJOrEoKaiElpZIE06ff877yt2cYe0FIW8wBAPx5XcDH9dM6I4whfSfK/ttqprPiFMoq+8q6Pr/9BjDgzudY9YA0uMDnLfOAA4MqyMhmrTXrVw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(19627405001)(55016003)(76116006)(110136005)(91956017)(66476007)(66556008)(64756008)(38100700002)(122000001)(33656002)(38070700009)(166002)(6506007)(66446008)(86362001)(66946007)(83380400001)(26005)(53546011)(9686003)(71200400001)(2906002)(966005)(4001150100001)(7696005)(316002)(8676002)(8936002)(5660300002)(41300700001)(52536014)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KugWRrWduD7jo48VP0bVJl1frHnfAJs1mjY5nxjc9D+SuKsRYIHHKHJc9X61?=
 =?us-ascii?Q?1xzKTw/Nwvk4/ouVFCfAIrtEJ9HrarS2TGxjF8YPkyJvJnneSHJrciFy4GO3?=
 =?us-ascii?Q?A/al2QKEMiPKcHXCqtoseWdkCtcERymcz6S35whTpoJc22Hk+qCkCICoSnlC?=
 =?us-ascii?Q?6aG+mFnJGv7bK/6L+Ga6CNVVM5HCIiiOdVN4iUa83TmJsenOrMzG/LNNV/zj?=
 =?us-ascii?Q?+AxOsB2wMf+26s543CYEKHZVPxqGEAdtjJ7l/CiIcDJ5u55YLYOOHzjTFyC6?=
 =?us-ascii?Q?n04qAP5JRA6D3sjvycTPgwdqcNqbUreE4JsbCPPmsGYHTzaLJlxOrLR7dV/+?=
 =?us-ascii?Q?JVm1OoNcO6FwUwMPqq2FftdBQ236x0G8bZoAB3mKGliY/1PeWHxknRw78NVf?=
 =?us-ascii?Q?znfjEe9dUMV7AdvN8JPIjUCLDFEK7/TcARAHAXHNiJ8Qwr8lyr9NYqXH6CsK?=
 =?us-ascii?Q?9EmM8/aJrvTbWvuVfeyoZOsm+u5d7K/dMdbYdTv2FCXQYMErOSqqlt3O73cO?=
 =?us-ascii?Q?KgkTawox8Q2/yA8Tdpd9fxv8zH7nyDFIPE2gC4zV+XDCJFA3yjfJQud+Ebit?=
 =?us-ascii?Q?xGiex6tW8jcd2hp+4iFD3xLU+wLO53FN+6FBEJDCpP1PEj38j1VmWbewcZDY?=
 =?us-ascii?Q?7HS7lMMf0aj8E/Snyf0+gZeqRh7ZsYxs+y/Gohdeo1033jBq4X2qeQ0vRrHA?=
 =?us-ascii?Q?fWuR8KZCcauKupEY7bw/VAiJVqeVCQnl+te/RQpFw9nJbX/TkAOeE+DUiaCe?=
 =?us-ascii?Q?w2/VWZy6R9q7hxIRCpHcuRhre28yJmA5TBbc+PYHAg4afbDqyOl4p1lTTq+i?=
 =?us-ascii?Q?9jBwlLC1GqVeDZFo3fWPzdZ6sgZzpDGuo/agCyI6qTRlkOGHFRKxSfIhHLxQ?=
 =?us-ascii?Q?hFAG8sY5ykWCOyTY+hqCfodkrcpIs7VWZsOerYTa/bCa2zV1dLuyEFEo7gWB?=
 =?us-ascii?Q?UIx4+qh/Cg+VuybUT+HsawWdXmLQr2GLdlvcUo/QBKgrFVIhlyA8cs66LdMN?=
 =?us-ascii?Q?CR1ss+uWJQwRb/DgHkMnx6xjKd+A0+HfUwbvyG9U5Lomfkzz0QZdqyR9+J5S?=
 =?us-ascii?Q?3J3ymXfukmTWvqspdduFVs+VoeKUMfyb0P6z0deOyDkBMr6+qNWiAwZZ7ZPb?=
 =?us-ascii?Q?v/neVkTzF+vh7Wq7ZyICNpQ2L0SNH1XIvZY+N+djuLYKXh8gdulrlV3bQoiY?=
 =?us-ascii?Q?Sb4xsfnG1pfMcr2VfBNxq88T10evTuCO5hoh/VJMCoTqWRj2Cfky+WG9qzKm?=
 =?us-ascii?Q?QvSaUTymHz9G8cjz1A5oNHoB5me+zKF9QMIRete5NAay7NIqggw/ew9/ROHO?=
 =?us-ascii?Q?U6NLn4m2yb2WkzwcOM7SQtnez5cFXwrzOiL5vwU02bi8yEIs6pRmZpWdsWcZ?=
 =?us-ascii?Q?uL/GNAKSeGSBAyNZDQRjw/w9mDU/Ji9As94gxQcwQDnwan/V9ue89D6NXmBc?=
 =?us-ascii?Q?RM1hyDtUJiHrZdnKvPjqw4OGVT+2c/bmBGCtfcL2Dt8aeaqL8sivsOBgl5py?=
 =?us-ascii?Q?mbxgNJ6E9w8h7vY73aJgStEnlUOWRmEMeErHgQ2OOlQbLD/wubgplMLlqe6O?=
 =?us-ascii?Q?qTFXFYiWMAmBJxmVGGiFy8nR9h7VbelpSUBAlZ93kSpHyk8ER6pHbt9L032E?=
 =?us-ascii?Q?Aw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822782ED2EFBDC947966DB184B7AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cd6b6c-08bb-4258-2f8f-08dbe71fa1c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 03:45:24.7162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJj+e12TO1b0ZR39XTnx5InuDW59TSY7XUMS5OHPAGBxlQcMfUuU4K1jjT6xE0X+0YECxy4SFOJ6di2FZap9Rmiz3Qarnl3o9Bl7mmSzs8N9uhCdlvZCuyYTbfNaGz/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
X-Proofpoint-ORIG-GUID: U3SVp1UKE9W625cWB7FIbvcnKBbw7xf4
X-Proofpoint-GUID: wo_dbWhBPlJiX0iLejs5b8y4GJNSVTwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311170027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190829

--_000_MW4PR11MB5822782ED2EFBDC947966DB184B7AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oh Sorry, Sent V2.

Regards,
Archana
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, November 16, 2023 19:40
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2048 =
-> 9.0.2068

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2023-11-16 at 04:15 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> This includes CVE fix for CVE-2023-46246.
> 9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :histor=
y
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-46246
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-support/vim/vim.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 38212a1fa6..2ef7fecc3f 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
>
> -PV .=3D ".2048"
> +PV .=3D ".2068"
>  SRCREV =3D "982ef16059bd163a77271107020defde0740bbd6"
>
>  # Do not consider .z in x.y.z, as that is updated with every commit

This doesn't change SRCREV so the update isn't correct.

Cheers,

Richard


--_000_MW4PR11MB5822782ED2EFBDC947966DB184B7AMW4PR11MB5822namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Oh Sorry, Sent=
 V2.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Regards,</span=
></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Archana</span>=
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, November 16, 2023 19:40<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.=
0.2048 -&gt; 9.0.2068</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2023-11-16 at 04:15 +0000, Polampalli, Archana via<br>
lists.openembedded.org wrote:<br>
&gt; From: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<br>
&gt;<br>
&gt; This includes CVE fix for CVE-2023-46246.<br>
&gt; 9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :his=
tory<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-46246">https://nv=
d.nist.gov/vuln/detail/CVE-2023-46246</a><br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-support/vim/vim.inc | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/v=
im/vim.inc<br>
&gt; index 38212a1fa6..2ef7fecc3f 100644<br>
&gt; --- a/meta/recipes-support/vim/vim.inc<br>
&gt; +++ b/meta/recipes-support/vim/vim.inc<br>
&gt; @@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://github.com/vim/vim.git;branc=
h=3Dmaster;protocol=3Dhttps \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://no-path-adjust.patch">file://no-path-adjust.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;.2048&quot;<br>
&gt; +PV .=3D &quot;.2068&quot;<br>
&gt;&nbsp; SRCREV =3D &quot;982ef16059bd163a77271107020defde0740bbd6&quot;<=
br>
&gt;<br>
&gt;&nbsp; # Do not consider .z in x.y.z, as that is updated with every com=
mit<br>
<br>
This doesn't change SRCREV so the update isn't correct.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822782ED2EFBDC947966DB184B7AMW4PR11MB5822namp_--

