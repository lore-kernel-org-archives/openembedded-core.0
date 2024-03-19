Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E90C54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 21:45:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28823.1710884725762083513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 14:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oPcSU7li;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38089dc0a2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7Cmh4016443
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 21:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=7kHWKln8igu5FAh8xaQ
	2rV9b3C37q5E+ueA6pZBMduE=; b=oPcSU7liltPXVVHV3d4OEDxII+Qu/kXi7LD
	DSLFHmQhOBYV8TEkvRp6LOMzXtYXAd7H135MIuuZT7MYV1Y1+JtmLhN0SVgRWOiw
	nf8XEJA/PqboBY9/GRIwdnMhuynDAQDcCvd21ChhGLJAagA1s/Hah2PFVclZL86n
	ZHppQSLtedOC/bJlGxBsu+hSbc/PiZN1FBKmIeas6aw0eblUANHW8fuzp8AyjeX/
	+hws/3YeI4qpwjUXF2/QPEmHcq17isTHWNzx2r8x+0vWLllYRgBjn518dOiAjmNr
	43czR+epxTzAT64DCdiVIat14M6i7ODx/Od3fgKhlv+drWC/xvg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxkd6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 21:45:24 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42JLdjin010252
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 21:45:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxkd6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 21:45:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISEP4IdnP5EFk13QOPKJspO8IJxDhgDFrRuQlM2ahodoTRbqPQUuRnpqQdXU111QZoqNMPr3tW/lM9sqpoKWeYU0SH5/9KsDMXZAlmJq+hgMg8+EdxeeLWqFHrNrdocpygntRIxYn5qxgf2w3yH70l0eYd/p/fcwFb2MSoAxpITFvXBRFeXXXGUiGqzsJisrDbAMjydfzxcV7UG3VHcnI6DTWe6Pue7XqGxFh6deHZKjNOUPcSsAye88WaAbx/8t+eTofm0cRfsIIsqt6n8pmNfzd49tP/YxsOU2HvaU3Qghfocj0Vyj+FwB9BwYuNMYj7G/wI6flWoNN/TtH5EtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kHWKln8igu5FAh8xaQ2rV9b3C37q5E+ueA6pZBMduE=;
 b=Kr6Yt3g2rpyuHFsVAvyheLAEnJzrLUi93jjNt0sJPAnD3iwbR3lkx9DbQz4SaVNj9KS5s1IADOMTq3EpnUIXf3fWexPJ3OuAXYee4Eqcr5VXKyjxrLf6bW1hiKnUxVi1kD0OXjNckot5Z1mmfTKCaocaIZTaxLIzk/R2bijCbGo4ZcM+/8uAZZQYrCHWfNtcZ7YZckiwT7h9UTSlWrZ1CHWAinVXQkt48wfsTPk5aO+fG4dteQolmvIlJzgndCkFnwK3pVu1nC/jqGvNSRON2RLvV+3gCfWMib0k39bzxBE8FvsJ7tm1P+Z6zRc7gw6VzI6XnLaCc3nRXY4iIjz7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 21:45:19 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::e513:4970:408a:5182]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::e513:4970:408a:5182%3]) with mapi id 15.20.7386.017; Tue, 19 Mar 2024
 21:45:18 +0000
Content-Type: multipart/alternative;
 boundary="------------QNqnPZVADSLiamwW4tdth1EP"
Message-ID: <1bc87f74-e7b7-42b9-9c73-1f30846df519@windriver.com>
Date: Tue, 19 Mar 2024 17:45:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen
 performac
Content-Language: en-CA
To: Haitao.Liu@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20240318065524.3337545-1-haitao.liu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240318065524.3337545-1-haitao.liu@windriver.com>
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To PH0PR11MB5925.namprd11.prod.outlook.com
 (2603:10b6:510:143::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5925:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0460e7-3ee1-4003-1968-08dc485dde77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QqJts2W3zUAcbuyccbRQ1YbOCnDHkWIiT1vgPcqoAWnpiIcLwClI1Tzk5rRf8SoNtvPy3qyeU8e7nOx1LH2FwSiGzvNMNMFuiVP1UcRa3GeuAR4F7c0EIewgQ/mcPOFlu68aqUYrh1tJAuD7+E+stTItEiqESaSm45jXlMElEUlujk75dMaMfzTau79nKANMmzC7mKvdIseOcXKTDyAlgzHRYQMrawvDhsZU15QvkYtIV64rPf4nhAUvIb1XdEbE+3vrY2laKI52wRZdq4XJ9hYKlEgBoGnqwvWiOChUS8Qt4m/cFVH4q/QCgctWXQh8Kq0l8AHuSiGAhtr+hfUcWvedDl+1clfgGBbm76O9sRT+SkVGX5lSYW0hQlgW/iZIY/ZHcLr0m9S5cvvGmwASxaElZVM6S0/+aSm2gBy6gI5giBLaet8+VBS3zZwy+YkwDuKNEYVHltZ9VfZCAh066Je5diPQaQ3mzjVnvsa/lyaWLqeguT1t/qXRHtvdRFxzAdELYQ3EgfU954S3a+rzHemprJLyITShP6ElPX3J0+gEGfkSrCfpB1II2b6LAGxY+0gxrr/tcw28Wmi0CKLsHSm05+mXbh/4746g1wlftpsmW33oe4AsLKaxMjt47rc9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjVvakpXbjg0Wjl0Si8wdHhmU3AzalJ1UlBQdWdFZm1ZZHF3NEEvR1R3SThD?=
 =?utf-8?B?Q21XQS9MYkE2a2RMcVRldjdST3RHVDZpbXd0N3JiZ3N2UHVMelE3b0Rxekg4?=
 =?utf-8?B?cDNRQWhtRmhOcGZTVVh5ckFBeUViZSt0OVdXMjBzU1Azd2V2WGxWYmtkYVJW?=
 =?utf-8?B?c0MyY0dzL2NFaENrVW40SjBuQ1duaXdSKzM3STdsNDZ2NHllSjVwVkVQVHFM?=
 =?utf-8?B?dWR3KzNYR01sY2Y0djgzbXczYm1Bc3MyenByNjZwcjM5dkNVTnM3UDlhWHVu?=
 =?utf-8?B?ejluSWZFR3RuTmk2dzJHR3hwYVp4KzhmcE1oRHVXSGdWbWdFWUt1aTZ2bHdz?=
 =?utf-8?B?aE5qVDN6azhXcDMyazhkQm5WSHlPUzV6R2Jvc3piQjZrWmpNRE1VTURFNmdY?=
 =?utf-8?B?djJVL3VqTTdqSWRYcmR3SkxpU3RzSE9zYUNtUWVtYWhQc3FtTTBjVytJSCs1?=
 =?utf-8?B?T3BKQytMd2YxVmtaa0QzY3l4TFo2cXRPeFpQQzJzUWRPSzIvdGt3TzNRSkRo?=
 =?utf-8?B?bUpZc2ErL2cyeWRsQkpnZjlUcitTL0phTUx2dmF4RmtGQzYxVFNCOElBWmhu?=
 =?utf-8?B?OXlnbEdSc3JvSEdVRVRxYmVYckNKWkt0dDhNODdFZCtxNmRiTkhSR2NtSTQz?=
 =?utf-8?B?TUNyaURNRUJ1Qi9mRE9iVXR4TDNzSjNLTlhBbHh6dXhnR1dVVTA2WXJpUkMv?=
 =?utf-8?B?Mld1Tk00V0hWYVZvcDZOS3RuSTRHZFpuUUhlUFp5Y1FINkxuRjFUcEMwb05i?=
 =?utf-8?B?S2pOTFhtQXJITmpVVFdHUXdoeWlvS0plMllCd3V2eVkwdDhpaXZhVVh4VUtG?=
 =?utf-8?B?bzRWU3JnQ0N5ZEpzUSsya29aTUtxMjIxUzNkWU1IZldRandFNnZXcHplalRM?=
 =?utf-8?B?YzNEa1JRUlU5YVdBR0lQOStZb0xFNUk5bXBXVVN1eW53UmhlWERaYmFXcXN1?=
 =?utf-8?B?Z1BmYVN2UlNEbEs2OUZUcmV1dVRkdDRBY0JJMEl4Uk02dHA1OGJ2SU9NWENh?=
 =?utf-8?B?S0ZINGRMMFIwZnZPMkI5WXc2NFYySEdHSzFtMnBETUJwck45ajJKOXJtNnU4?=
 =?utf-8?B?L3JUUGROUVQ4dXp4K1RhUzhTVkR6aUdPeEJHOUpkd28reTkxc0RTanlOZWVi?=
 =?utf-8?B?MVloUVY3MEpFN1p6RTNoR1llOUZNNVFjZTNXQmUyUmF4bCtibVUydTNDTGRC?=
 =?utf-8?B?NE11RmJ5emM3aUJxNzhEYU8ranJIMDV3WnBRTk1VMHhYL2U1cFM1SmZWSWFo?=
 =?utf-8?B?bDNJdE53NVkyVndFejdZcDd4bWVJUG1FTmVSS2JCYUxzbml6RFU4clFNbFVw?=
 =?utf-8?B?UlVqeTVuZVVEeU1EU3V5Q3hVb2VGVUtBN2hHeWlNVktqbnJaSmxFSThTVndJ?=
 =?utf-8?B?dDFHYnhPMHJVZi9GVWlXaWpTNzFJVnhLUHZFek9Pc3FzeWo4ZyszdHBuU1Yx?=
 =?utf-8?B?NndiSjB4TUp3R05xYU8xbXU5RVYwelBUL3JtbE5EejhDaEZBeUd5ZlpsL2xj?=
 =?utf-8?B?a0VYVWc4dHpPZEFIeExDWERxK3NwdlAyTEcrdzFDZ3pHUWVsTThRM0cydHhx?=
 =?utf-8?B?ZUV1TkVOUjRORVNDZ2ZxKzhUNmZpVUJ5d3A1Qy9oWGpmMzdMaFVwb1hwMHI3?=
 =?utf-8?B?eElRTnBlclJmMWhIbG9jY0F3YUdhV3dnWnVMaFdIcGQ4cjdGalZGWmJuWWV3?=
 =?utf-8?B?YlNkSndtV0VHRHBqa3pTM1hlajIzekRxSXVHMXQyZitRQmdtaVlhQ1R1MGNr?=
 =?utf-8?B?Q0dOSXNoWUZScDRKWkVBTnVGR1FjTUlZOGd2ZHVlNzRSZXl1YU55UlBKNGNV?=
 =?utf-8?B?Tk45WUFTVnYwRmhTQWEvQ3NBWFVRSkZmOE9KZWlHQjlTc2E5Z1RMazVOUWtt?=
 =?utf-8?B?eEFzSy9BNGZMOWFUS2xJWis3aHkra1QvbFNWNXVUUVpZMnk2NEl3ZWVjSzJa?=
 =?utf-8?B?dXZXSVZJKytVMTg0UXkxZUtYQTcyVkNVV3l0dzgxTHZqYzNGR3h4RGx3N0lQ?=
 =?utf-8?B?WW0vTXRBQldEZVVSY1JBSHA5Zmwra1RKSU8zR1J0TjlReDFSTHVjZ1pBNyts?=
 =?utf-8?B?TWExRjRqdk5QRzZ1Ukd0ZWJaZWVxeXhacXJjK3pWaThaQUFmV2VTWU5CeUs1?=
 =?utf-8?B?dWFvREFJMU1VcHhDZ3VPeXdSd2pyMmp5UDVNeDJ0YnFwOWgzeGVDZDh4eXRh?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0460e7-3ee1-4003-1968-08dc485dde77
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 21:45:18.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMGsP47UKw5nr+zNxprBIVWZY7+fBLXkUto6uqnQ+sLwhulfBrcjDhyM2GQHbDQjq+0Dnb8g9Fxxyz8b4waYhjyXgJ+Vy8YZDLHo9W/CDjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
X-Proofpoint-ORIG-GUID: FCFT45mc7p8mBiYH0G1weiusIqc_BjO5
X-Proofpoint-GUID: UDk17ZLPJilNg9mjDPWzgt6xP0D4UGIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 21:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197334

--------------QNqnPZVADSLiamwW4tdth1EP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42J7Cmh4016443

Hi Haitao, et al,


Summary:

I think we could bring these two commits back to kirkstone even though=20
upstream openssl mtc
does not plan to do so, at least not without "very good reasons".

but I have some comments and questions below that I'd like you to=20
respond to before sending a v2.

../Randy



Typo in the subject:
 =C2=A0=C2=A0 [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keyge=
n performac
should be:
 =C2=A0=C2=A0 [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keyge=
n performance

On 2024-03-18 2:55 a.m., jason.lau via lists.openembedded.org wrote:
> The ssh-keygen would take a long time to generate the entropy of a key

It's best to be more specific.

You mentioned in:

https://github.com/openssl/openssl/issues/23766

that "ssh-keygen (built with openssl3.0) is taking 1-2s to execute=20
whereas in openssl3.1 it was hardly half a second"

so you should mention that in the commit log.

You should also include a link to the upstream issue you opened to=20
explain that:

 =C2=A0=C2=A0 "Performance fixes are in general not eligible for backport=
s to=20
stable release branches.
 =C2=A0=C2=A0=C2=A0 In specific cases an exception could be given by OTC =
but there=20
would have to be very good reasons for such an exception."

I saw that comment last week and wondered if we should push harder for=20
upstream to backport these commits but
I understand your reluctance to do that when it might make sense to just=20
backport here in oe-core.

Note that the commits are only part of 3.2.0+:

=E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b943870
openssl-3.2.0
openssl-3.2.0-alpha1
openssl-3.2.0-alpha2
openssl-3.2.0-beta1
openssl-3.2.1

=E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df61
openssl-3.2.0
openssl-3.2.0-alpha1
openssl-3.2.0-alpha2
openssl-3.2.0-beta1
openssl-3.2.1

so they'd also have to be back-ported to nanbield technically:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-connecti=
vity/openssl/openssl_3.1.4.bb?h=3Dnanbield

Steve,
Given that nanbield is a week or so away from EOL, is it worth doing that=
?

Note that the original commits were from Nov 2, 2022 so they've had some=20
time to ummm, bake but
the 3.2.0 release was 'only' on Nov 23, 2023:
https://www.openssl.org/source/old/3.2/index.html
so it's got 3 or 4 months of the public being able to test it.

I've taken a look at the commits and haven't seen a problem with the=20
backport.

Haitao,
Did you have to adjust the patches at all? If so please explain what you=20
did.

Your tests show that openssl is faster, have you tested for correctness=20
at all?
Does it make sense to run: test/bntest.c ? Steve will likely run the=20
ptests of course.

Do we need the oneline change: "Fix incorrect error branch in=20
ossl_bn_rsa_fips186_4_derive_prime()"
from:
openssl.git on master
=E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c
da1c088f59 Copyright year updates
835b90a19c Fix incorrect error branch in=20
ossl_bn_rsa_fips186_4_derive_prime()
d2f6e66d28 Improve FIPS RSA keygen performance.
dd1d7bcb69 Improve FIPS RSA keygen performance.


Are there any other changes to the files touched by these commits that=20
would affect
the correctness or performance of the code introduced?

../Randy


>
> The following commits have fixed the issue.
> https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad83=
8880b943870
> https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118=
e3a45c9df61
>
> Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
> ---
>   ...-Improve-FIPS-RSA-keygen-performance.patch | 271 +++++++++++++++++=
+
>   ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
>   .../openssl/openssl_3.0.13.bb                 |   2 +
>   3 files changed, 458 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Imp=
rove-FIPS-RSA-keygen-performance.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Imp=
rove-FIPS-RSA-keygen-performance.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIP=
S-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openss=
l/0001-Improve-FIPS-RSA-keygen-performance.patch
> new file mode 100644
> index 0000000000..aed0e1a5c1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-k=
eygen-performance.patch
> @@ -0,0 +1,271 @@
> +From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 2001
> +From: slontis<shane.lontis@oracle.com>
> +Date: Wed, 2 Nov 2022 12:01:34 +1000
> +Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
> +
> +FIPS 186-4 has 5 different algorithms for key generation,
> +and all of them rely on testing GCD(a,n) =3D=3D 1 many times.
> +
> +Cachegrind was showing that during a RSA keygen operation,
> +the function BN_gcd() was taking a considerable percentage
> +of the total cycles.
> +
> +The default provider uses multiprime keygen, which seemed to
> +be much faster. This is because it uses BN_mod_inverse()
> +instead.
> +
> +For a 4096 bit key, the entropy of a key that was taking a
> +long time to generate was recorded and fed back into subsequent
> +runs. Roughly 40% of the cycle time was BN_gcd() with most of the
> +remainder in the prime testing. Changing to use the inverse
> +resulted in the cycle count being 96% in the prime testing.
> +
> +Reviewed-by: Paul Dale<pauli@openssl.org>
> +Reviewed-by: Tomas Mraz<tomas@openssl.org>
> +(Merged fromhttps://github.com/openssl/openssl/pull/19578)
> +
> +(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/d=
d1d7bcb69994d81662e709b0ad838880b943870]
> +
> +Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
> +---
> + crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
> + crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
> + doc/man3/BN_cmp.pod          | 14 +++++++++++++-
> + include/openssl/bn.h         |  1 +
> + test/bntest.c                | 26 ++++++++++++++++++++++++--
> + util/libcrypto.num           |  1 +
> + 6 files changed, 85 insertions(+), 12 deletions(-)
> +
> +diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
> +index cd0b015..879a84b 100644
> +--- a/crypto/bn/bn_gcd.c
> ++++ b/crypto/bn/bn_gcd.c
> +@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
> +     return rv;
> + }
> +
> ++/*
> ++ * The numbers a and b are coprime if the only positive integer that =
is a
> ++ * divisor of both of them is 1.
> ++ * i.e. gcd(a,b) =3D 1.
> ++ *
> ++ * Coprimes have the property: b has a multiplicative inverse modulo =
a
> ++ * i.e there is some value x such that bx =3D 1 (mod a).
> ++ *
> ++ * Testing the modulo inverse is currently much faster than the const=
ant
> ++ * time version of BN_gcd().
> ++ */
> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
> ++{
> ++    int ret =3D 0;
> ++    BIGNUM *tmp;
> ++
> ++    BN_CTX_start(ctx);
> ++    tmp =3D BN_CTX_get(ctx);
> ++    if (tmp =3D=3D NULL)
> ++        goto end;
> ++
> ++    ERR_set_mark();
> ++    BN_set_flags(a, BN_FLG_CONSTTIME);
> ++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
> ++    /* Clear any errors (an error is returned if there is no inverse)=
 */
> ++    ERR_pop_to_mark();
> ++end:
> ++    BN_CTX_end(ctx);
> ++    return ret;
> ++}
> ++
> + /*-
> +  * This function is based on the constant-time GCD work by Bernstein =
and Yang:
> +  *https://eprint.iacr.org/2019/266
> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4=
.c
> +index 62d8685..55efaf2 100644
> +--- a/crypto/bn/bn_rsa_fips186_4.c
> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> +@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y=
, BIGNUM *X, const BIGNUM *Xin,
> +             goto err;
> +     }
> +
> ++    /*
> ++     * (Step 1) GCD(2r1, r2) =3D 1.
> ++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test befo=
re doing an
> ++     *    mod_inverse(2r1, r2) which are effectively the same operati=
on.
> ++     *    (The algorithm assumed that the gcd test would be faster). =
Since the
> ++     *    mod_inverse is currently faster than calling the constant t=
ime
> ++     *    BN_gcd(), the call to BN_gcd() has been omitted. The invers=
e result
> ++     *    is used further down.
> ++     */
> +     if (!(BN_lshift1(r1x2, r1)
> +-            /* (Step 1) GCD(2r1, r2) =3D 1 */
> +-            && BN_gcd(tmp, r1x2, r2, ctx)
> +-            && BN_is_one(tmp)
> ++            && (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
> +             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod r=
2)*2r1) */
> +-            && BN_mod_inverse(R, r2, r1x2, ctx)
> ++            && (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
> +             && BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) * r2 */
> +-            && BN_mod_inverse(tmp, r1x2, r2, ctx)
> +             && BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 mod r2)=
*2r1 */
> +             && BN_sub(R, R, tmp)
> +             /* Calculate 2r1r2 */
> +@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
> +
> +     /*
> +      * In FIPS 186-4 imax was set to 5 * nlen/2.
> +-     * Analysis by Allen Roginsky (Seehttps://csrc.nist.gov/CSRC/medi=
a/Publications/fips/186/4/final/documents/comments-received-fips186-4-dec=
ember-2015.pdf
> ++     * Analysis by Allen Roginsky
> ++     * (Seehttps://csrc.nist.gov/CSRC/media/Publications/fips/186/4/f=
inal/documents/comments-received-fips186-4-december-2015.pdf
> +      * page 68) indicates this has a 1 in 2 million chance of failure.
> +      * The number has been updated to 20 * nlen/2 as used in
> +      * FIPS186-5 Appendix B.9 Step 9.
> +@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y,=
 BIGNUM *X, const BIGNUM *Xin,
> +
> +             /* (Step 7) If GCD(Y-1) =3D=3D 1 & Y is probably prime th=
en return Y */
> +             if (BN_copy(y1, Y) =3D=3D NULL
> +-                    || !BN_sub_word(y1, 1)
> +-                    || !BN_gcd(tmp, y1, e, ctx))
> ++                    || !BN_sub_word(y1, 1))
> +                 goto err;
> +-            if (BN_is_one(tmp)) {
> ++            if (BN_are_coprime(y1, e, ctx)) {
> +                 int rv =3D BN_check_prime(Y, ctx, cb);
> +
> +                 if (rv > 0)
> +diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
> +index f302818..e9ddf8f 100644
> +--- a/doc/man3/BN_cmp.pod
> ++++ b/doc/man3/BN_cmp.pod
> +@@ -2,7 +2,8 @@
> +
> + =3Dhead1 NAME
> +
> +-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, B=
N_is_odd - BIGNUM comparison and test functions
> ++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, B=
N_is_odd, BN_are_coprime
> ++- BIGNUM comparison and test functions
> +
> + =3Dhead1 SYNOPSIS
> +
> +@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, =
BN_abs_is_word, BN_is_odd -
> +  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
> +  int BN_is_odd(const BIGNUM *a);
> +
> ++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> ++
> + =3Dhead1 DESCRIPTION
> +
> + BN_cmp() compares the numbers I<a> and I<b>. BN_ucmp() compares their
> +@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs_=
is_word() test if
> + I<a> equals 0, 1, I<w>, or E<verbar>I<w>E<verbar> respectively.
> + BN_is_odd() tests if I<a> is odd.
> +
> ++BN_are_coprime() determines if B<a> and B<b> are coprime.
> ++B<ctx> is used internally for storing temporary variables.
> ++The values of B<a> and B<b> and B<ctx> must not be NULL.
> ++
> + =3Dhead1 RETURN VALUES
> +
> + BN_cmp() returns -1 if I<a> E<lt> I<b>, 0 if I<a> =3D=3D I<b> and 1 i=
f
> +@@ -35,11 +42,16 @@ of I<a> and I<b>.
> + BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
> + BN_is_odd() return 1 if the condition is true, 0 otherwise.
> +
> ++BN_are_coprime() returns 1 if the B<BIGNUM>'s are coprime, otherwise =
it
> ++returns 0.
> ++
> + =3Dhead1 HISTORY
> +
> + Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
> + BN_abs_is_word() and BN_is_odd() were macros.
> +
> ++The function BN_are_coprime() was added in OpenSSL 3.1.
> ++
> + =3Dhead1 COPYRIGHT
> +
> + Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
> +diff --git a/include/openssl/bn.h b/include/openssl/bn.h
> +index ecd7f01..73895a5 100644
> +--- a/include/openssl/bn.h
> ++++ b/include/openssl/bn.h
> +@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGNU=
M *b, BN_CTX *ctx);
> + int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* r=
eturns
> +                                                                   * -=
2 for
> +                                                                   * e=
rror */
> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> + BIGNUM *BN_mod_inverse(BIGNUM *ret,
> +                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx)=
;
> + BIGNUM *BN_mod_sqrt(BIGNUM *ret,
> +diff --git a/test/bntest.c b/test/bntest.c
> +index c5894c1..eec6222 100644
> +--- a/test/bntest.c
> ++++ b/test/bntest.c
> +@@ -38,6 +38,7 @@ typedef struct mpitest_st {
> +
> + static const int NUM0 =3D 100;           /* number of tests */
> + static const int NUM1 =3D 50;            /* additional tests for some=
 functions */
> ++static const int NUM_PRIME_TESTS =3D 20;
> + static BN_CTX *ctx;
> +
> + /*
> +@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
> +     return st;
> + }
> +
> ++static int test_coprime(void)
> ++{
> ++    BIGNUM *a =3D NULL, *b =3D NULL;
> ++    int ret =3D 0;
> ++
> ++    ret =3D TEST_ptr(a =3D BN_new())
> ++          && TEST_ptr(b =3D BN_new())
> ++          && TEST_true(BN_set_word(a, 66))
> ++          && TEST_true(BN_set_word(b, 99))
> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
> ++          && TEST_true(BN_set_word(a, 67))
> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
> ++    BN_free(a);
> ++    BN_free(b);
> ++    return ret;
> ++}
> ++
> + static int test_gcd_prime(void)
> + {
> +     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL;
> +@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
> +
> +     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL)=
))
> +             goto err;
> +-    for (i =3D 0; i < NUM0; i++) {
> ++    for (i =3D 0; i < NUM_PRIME_TESTS; i++) {
> +         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
> +                                             NULL, NULL, NULL))
> +                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
> +-                || !TEST_true(BN_is_one(gcd)))
> ++                || !TEST_true(BN_is_one(gcd))
> ++                || !TEST_true(BN_are_coprime(a, b, ctx)))
> +             goto err;
> +     }
> +
> +@@ -3066,6 +3087,7 @@ int setup_tests(void)
> +         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
> +         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
> +         ADD_TEST(test_gcd_prime);
> ++        ADD_TEST(test_coprime);
> +         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
> +         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExpT=
ests));
> +         ADD_TEST(test_mod_exp2_mont);
> +diff --git a/util/libcrypto.num b/util/libcrypto.num
> +index 0f6f30b..a1d1ed9 100644
> +--- a/util/libcrypto.num
> ++++ b/util/libcrypto.num
> +@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556	3_0=
_3	EXIST::FUNCTION:
> + OPENSSL_strncasecmp                     5557	3_0_3	EXIST::FUNCTION:
> + OSSL_CMP_CTX_reset_geninfo_ITAVs        5558	3_0_8	EXIST::FUNCTION:CM=
P
> + OSSL_CMP_MSG_update_recipNonce          5559	3_0_9	EXIST::FUNCTION:CM=
P
> ++BN_are_coprime                          5560	3_0_0	EXIST::FUNCTION:
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIP=
S-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openss=
l/0002-Improve-FIPS-RSA-keygen-performance.patch
> new file mode 100644
> index 0000000000..1a6b601f65
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-k=
eygen-performance.patch
> @@ -0,0 +1,185 @@
> +From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 2001
> +From: slontis<shane.lontis@oracle.com>
> +Date: Wed, 2 Nov 2022 13:20:55 +1000
> +Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
> +
> +Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
> +The old code was using a fixed value of 64.
> +
> +Reviewed-by: Paul Dale<pauli@openssl.org>
> +Reviewed-by: Tomas Mraz<tomas@openssl.org>
> +(Merged fromhttps://github.com/openssl/openssl/pull/19579)
> +
> +(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/d=
2f6e66d2837bff1f5f7636bb2118e3a45c9df61]
> +
> +Signed-off-by: Haitao Liu<haitao.liu@windriver.com>
> +---
> + crypto/bn/bn_prime.c         | 11 ++++++++
> + crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++-----=
-
> + include/crypto/bn.h          |  2 ++
> + 3 files changed, 54 insertions(+), 8 deletions(-)
> +
> +diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
> +index ddd31a0..79776f1 100644
> +--- a/crypto/bn/bn_prime.c
> ++++ b/crypto/bn/bn_prime.c
> +@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int chec=
ks, BN_CTX *ctx,
> +     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
> + }
> +
> ++/*
> ++ * Use this only for key generation.
> ++ * It always uses trial division. The number of checks
> ++ * (MR rounds) passed in is used without being clamped to a minimum v=
alue.
> ++ */
> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX=
 *ctx,
> ++                                  BN_GENCB *cb)
> ++{
> ++    return bn_is_prime_int(w, checks, ctx, 1, cb);
> ++}
> ++
> + int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
> + {
> +     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4=
.c
> +index 55efaf2..c3466df 100644
> +--- a/crypto/bn/bn_rsa_fips186_4.c
> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> +@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
> +     BN_FLG_STATIC_DATA
> + };
> +
> ++/*
> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> ++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
> ++ */
> ++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
> ++{
> ++    if (nbits >=3D 4096)
> ++        return 44;
> ++    if (nbits >=3D 3072)
> ++        return 41;
> ++    if (nbits >=3D 2048)
> ++        return 38;
> ++    return 0; /* Error */
> ++}
> ++
> ++/*
> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> ++ * required for generation of RSA primes (p and q)
> ++ */
> ++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
> ++{
> ++    if (nbits >=3D 3072)
> ++        return 4;
> ++    if (nbits >=3D 2048)
> ++        return 5;
> ++    return 0; /* Error */
> ++}
> ++
> + /*
> +  * FIPS 186-5 Table A.1. "Min length of auxiliary primes p1, p2, q1, =
q2".
> +  * (FIPS 186-5 has an entry for >=3D 4096 bits).
> +@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_siz=
e_for_prob_primes(int nbits)
> +  *     Xp1 The passed in starting point to find a probably prime.
> +  *     p1 The returned probable prime (first odd integer >=3D Xp1)
> +  *     ctx A BN_CTX object.
> ++ *     rounds The number of Miller Rabin rounds
> +  *     cb An optional BIGNUM callback.
> +  * Returns: 1 on success otherwise it returns 0.
> +  */
> + static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
> +                                                 BIGNUM *p1, BN_CTX *c=
tx,
> ++                                                int rounds,
> +                                                 BN_GENCB *cb)
> + {
> +     int ret =3D 0;
> +@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(co=
nst BIGNUM *Xp1,
> +         i++;
> +         BN_GENCB_call(cb, 0, i);
> +         /* MR test with trial division */
> +-        tmp =3D BN_check_prime(p1, ctx, cb);
> ++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
> +         if (tmp > 0)
> +             break;
> +         if (tmp < 0)
> +@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *=
p, BIGNUM *Xpout,
> + {
> +     int ret =3D 0;
> +     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D NU=
LL;
> +-    int bitlen;
> ++    int bitlen, rounds;
> +
> +     if (p =3D=3D NULL || Xpout =3D=3D NULL)
> +         return 0;
> +@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *=
p, BIGNUM *Xpout,
> +     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
> +     if (bitlen =3D=3D 0)
> +         goto err;
> ++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
> +
> +     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in =
*/
> +     if (Xp1 =3D=3D NULL) {
> +@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *=
p, BIGNUM *Xpout,
> +     }
> +
> +     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
> +-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
> +-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, =
cb))
> ++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds,=
 cb)
> ++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, =
rounds, cb))
> +         goto err;
> +     /* (Table B.1) auxiliary prime Max length check */
> +     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) >=3D
> +@@ -243,11 +274,11 @@ err:
> +  */
> + int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BI=
GNUM *Xin,
> +                                        const BIGNUM *r1, const BIGNUM=
 *r2,
> +-                                       int nlen, const BIGNUM *e, BN_=
CTX *ctx,
> +-                                       BN_GENCB *cb)
> ++                                       int nlen, const BIGNUM *e,
> ++                                       BN_CTX *ctx, BN_GENCB *cb)
> + {
> +     int ret =3D 0;
> +-    int i, imax;
> ++    int i, imax, rounds;
> +     int bits =3D nlen >> 1;
> +     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
> +     BIGNUM *base, *range;
> +@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
> +      * The number has been updated to 20 * nlen/2 as used in
> +      * FIPS186-5 Appendix B.9 Step 9.
> +      */
> ++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
> +     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
> +     for (;;) {
> +         if (Xin =3D=3D NULL) {
> +@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
> +             if (BN_copy(y1, Y) =3D=3D NULL
> +                     || !BN_sub_word(y1, 1))
> +                 goto err;
> ++
> +             if (BN_are_coprime(y1, e, ctx)) {
> +-                int rv =3D BN_check_prime(Y, ctx, cb);
> ++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, c=
tx, cb);
> +
> +                 if (rv > 0)
> +                     goto end;
> +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
> +index fd1c09d..00544d9 100644
> +--- a/include/crypto/bn.h
> ++++ b/include/crypto/bn.h
> +@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const =
BIGNUM *m,
> +
> + int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, BN=
_CTX *ctx,
> +                                   BN_GENCB *cb, int enhanced, int *st=
atus);
> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX=
 *ctx,
> ++                                  BN_GENCB *cb);
> +
> + const BIGNUM *ossl_bn_get0_small_factors(void);
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta=
/recipes-connectivity/openssl/openssl_3.0.13.bb
> index 5e43fdc2de..5b09493ccd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D"http://www.openssl.org/source/openssl-${P=
V}.tar.gz \=20
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch=20
> \ file://afalg.patch \=20
> file://0001-Configure-do-not-tweak-mips-cflags.patch \ +=20
> file://0001-Improve-FIPS-RSA-keygen-performance.patch \ +=20
> file://0002-Improve-FIPS-RSA-keygen-performance.patch \ "
>  =20
>   SRC_URI:append:class-nativesdk =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197294):https://lists.openembedded.org/g/openembedd=
ed-core/message/197294
> Mute This Topic:https://lists.openembedded.org/mt/104998278/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------QNqnPZVADSLiamwW4tdth1EP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42J7Cmh4016443

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Haitao, et al,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Summary:<br>
      <br>
      I think we could bring these two commits back to kirkstone even
      though upstream openssl mtc <br>
      does not plan to do so, at least not without &quot;very good reason=
s&quot;.<br>
      <br>
      but I have some comments and questions below that I'd like you to
      respond to before sending a v2.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">../Randy</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Typo in the subject:<br>
      &nbsp;&nbsp; [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA =
keygen
      performac<br>
      should be:<br>
      &nbsp;&nbsp; [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA =
keygen
      performance<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-03-18 2:55 a.m., jason.lau via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240318065524.3337545-1-haitao=
.liu@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">The ssh-keygen would take a =
long time to generate the entropy of a key</pre>
    </blockquote>
    <p>It's best to be more specific. <br>
    </p>
    <p>You mentioned in: <br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/open=
ssl/openssl/issues/23766">https://github.com/openssl/openssl/issues/23766=
</a></p>
    <p>that &quot;ssh-keygen (built with openssl3.0) is taking 1-2s to
      execute whereas in openssl3.1 it was hardly half a second&quot;</p>
    <p>so you should mention that in the commit log.<br>
      <br>
      You should also include a link to the upstream issue you opened to
      explain that:<br>
      <br>
      &nbsp;&nbsp; &quot;Performance fixes are in general not eligible fo=
r backports to
      stable release branches. <br>
      &nbsp;&nbsp;&nbsp; In specific cases an exception could be given by=
 OTC but there
      would have to be very good reasons for such an exception.&quot;<br>
      <br>
      I saw that comment last week and wondered if we should push harder
      for upstream to backport these commits but<br>
      I understand your reluctance to do that when it might make sense
      to just backport here in oe-core.<br>
    </p>
    <p>Note that the commits are only part of 3.2.0+:<br>
      <br>
      =E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b9438=
70<br>
      openssl-3.2.0<br>
      openssl-3.2.0-alpha1<br>
      openssl-3.2.0-alpha2<br>
      openssl-3.2.0-beta1<br>
      openssl-3.2.1<br>
      <br>
      =E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df=
61<br>
      openssl-3.2.0<br>
      openssl-3.2.0-alpha1<br>
      openssl-3.2.0-alpha2<br>
      openssl-3.2.0-beta1<br>
      openssl-3.2.1</p>
    <p>so they'd also have to be back-ported to nanbield technically:<br>
      &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/tree/meta/recipes-connectivity/openssl/openssl_3.1.4.bb?=
h=3Dnanbield">https://git.openembedded.org/openembedded-core/tree/meta/re=
cipes-connectivity/openssl/openssl_3.1.4.bb?h=3Dnanbield</a><br>
    </p>
    <p>Steve, <br>
      Given that nanbield is a week or so away from EOL, is it worth
      doing that?<br>
    </p>
    <p>Note that the original commits were from Nov 2, 2022 so they've
      had some time to ummm, bake but<br>
      the 3.2.0 release was 'only' on Nov 23, 2023:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://www=
.openssl.org/source/old/3.2/index.html">https://www.openssl.org/source/ol=
d/3.2/index.html</a><br>
      so it's got 3 or 4 months of the public being able to test it.<br>
    </p>
    <p>I've taken a look at the commits and haven't seen a problem with
      the backport.</p>
    <p>Haitao, <br>
      Did you have to adjust the patches at all? If so please explain
      what you did.<br>
      <br>
    </p>
    <p>Your tests show that openssl is faster, have you tested for
      correctness at all?<br>
      Does it make sense to run: <span style=3D"white-space: pre-wrap">te=
st/bntest.c ?

Steve will likely run the ptests of course.
</span></p>
    <p>Do we need the oneline change: &quot;Fix incorrect error branch in
      ossl_bn_rsa_fips186_4_derive_prime()&quot;<br>
      from:<br>
      openssl.git on master<br>
      =E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c<br>
      da1c088f59 Copyright year updates<br>
      835b90a19c Fix incorrect error branch in
      ossl_bn_rsa_fips186_4_derive_prime()<br>
      d2f6e66d28 Improve FIPS RSA keygen performance.<br>
      dd1d7bcb69 Improve FIPS RSA keygen performance.</p>
    <p><br>
    </p>
    <p>Are there any other changes to the files touched by these commits
      that would affect<br>
      the correctness or performance of the code introduced?<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240318065524.3337545-1-haitao=
.liu@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

The following commits have fixed the issue.
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openssl/ope=
nssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870">https://github.com/=
openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openssl/ope=
nssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61">https://github.com/=
openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61</a>

Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
---
 ...-Improve-FIPS-RSA-keygen-performance.patch | 271 ++++++++++++++++++
 ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   2 +
 3 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Improv=
e-FIPS-RSA-keygen-performance.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Improv=
e-FIPS-RSA-keygen-performance.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/=
0001-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..aed0e1a5c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-key=
gen-performance.patch
@@ -0,0 +1,271 @@
+From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 2001
+From: slontis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:shane.lo=
ntis@oracle.com">&lt;shane.lontis@oracle.com&gt;</a>
+Date: Wed, 2 Nov 2022 12:01:34 +1000
+Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
+
+FIPS 186-4 has 5 different algorithms for key generation,
+and all of them rely on testing GCD(a,n) =3D=3D 1 many times.
+
+Cachegrind was showing that during a RSA keygen operation,
+the function BN_gcd() was taking a considerable percentage
+of the total cycles.
+
+The default provider uses multiprime keygen, which seemed to
+be much faster. This is because it uses BN_mod_inverse()
+instead.
+
+For a 4096 bit key, the entropy of a key that was taking a
+long time to generate was recorded and fed back into subsequent
+runs. Roughly 40% of the cycle time was BN_gcd() with most of the
+remainder in the prime testing. Changing to use the inverse
+resulted in the cycle count being 96% in the prime testing.
+
+Reviewed-by: Paul Dale <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:pauli@openssl.org">&lt;pauli@openssl.org&gt;</a>
+Reviewed-by: Tomas Mraz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:tomas@openssl.org">&lt;tomas@openssl.org&gt;</a>
+(Merged from <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/openssl/openssl/pull/19578">https://github.com/openssl/openssl/pull/19=
578</a>)
+
+(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880=
b943870">https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e70=
9b0ad838880b943870</a>]
+
+Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
+ doc/man3/BN_cmp.pod          | 14 +++++++++++++-
+ include/openssl/bn.h         |  1 +
+ test/bntest.c                | 26 ++++++++++++++++++++++++--
+ util/libcrypto.num           |  1 +
+ 6 files changed, 85 insertions(+), 12 deletions(-)
+
+diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
+index cd0b015..879a84b 100644
+--- a/crypto/bn/bn_gcd.c
++++ b/crypto/bn/bn_gcd.c
+@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
+     return rv;
+ }
+=20
++/*
++ * The numbers a and b are coprime if the only positive integer that is=
 a
++ * divisor of both of them is 1.
++ * i.e. gcd(a,b) =3D 1.
++ *
++ * Coprimes have the property: b has a multiplicative inverse modulo a
++ * i.e there is some value x such that bx =3D 1 (mod a).
++ *
++ * Testing the modulo inverse is currently much faster than the constan=
t
++ * time version of BN_gcd().
++ */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
++{
++    int ret =3D 0;
++    BIGNUM *tmp;
++
++    BN_CTX_start(ctx);
++    tmp =3D BN_CTX_get(ctx);
++    if (tmp =3D=3D NULL)
++        goto end;
++
++    ERR_set_mark();
++    BN_set_flags(a, BN_FLG_CONSTTIME);
++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
++    /* Clear any errors (an error is returned if there is no inverse) *=
/
++    ERR_pop_to_mark();
++end:
++    BN_CTX_end(ctx);
++    return ret;
++}
++
+ /*-
+  * This function is based on the constant-time GCD work by Bernstein an=
d Yang:
+  * <a class=3D"moz-txt-link-freetext" href=3D"https://eprint.iacr.org/2=
019/266">https://eprint.iacr.org/2019/266</a>
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 62d8685..55efaf2 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
+             goto err;
+     }
+=20
++    /*
++     * (Step 1) GCD(2r1, r2) =3D 1.
++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test before=
 doing an
++     *    mod_inverse(2r1, r2) which are effectively the same operation.
++     *    (The algorithm assumed that the gcd test would be faster). Si=
nce the
++     *    mod_inverse is currently faster than calling the constant tim=
e
++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inverse =
result
++     *    is used further down.
++     */
+     if (!(BN_lshift1(r1x2, r1)
+-            /* (Step 1) GCD(2r1, r2) =3D 1 */
+-            &amp;&amp; BN_gcd(tmp, r1x2, r2, ctx)
+-            &amp;&amp; BN_is_one(tmp)
++            &amp;&amp; (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
+             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod r2)=
*2r1) */
+-            &amp;&amp; BN_mod_inverse(R, r2, r1x2, ctx)
++            &amp;&amp; (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
+             &amp;&amp; BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) *=
 r2 */
+-            &amp;&amp; BN_mod_inverse(tmp, r1x2, r2, ctx)
+             &amp;&amp; BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 m=
od r2)*2r1 */
+             &amp;&amp; BN_sub(R, R, tmp)
+             /* Calculate 2r1r2 */
+@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+=20
+     /*
+      * In FIPS 186-4 imax was set to 5 * nlen/2.
+-     * Analysis by Allen Roginsky (See <a class=3D"moz-txt-link-freetex=
t" href=3D"https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final=
/documents/comments-received-fips186-4-december-2015.pdf">https://csrc.ni=
st.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-receiv=
ed-fips186-4-december-2015.pdf</a>
++     * Analysis by Allen Roginsky
++     * (See <a class=3D"moz-txt-link-freetext" href=3D"https://csrc.nis=
t.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-receive=
d-fips186-4-december-2015.pdf">https://csrc.nist.gov/CSRC/media/Publicati=
ons/fips/186/4/final/documents/comments-received-fips186-4-december-2015.=
pdf</a>
+      * page 68) indicates this has a 1 in 2 million chance of failure.
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, B=
IGNUM *X, const BIGNUM *Xin,
+=20
+             /* (Step 7) If GCD(Y-1) =3D=3D 1 &amp; Y is probably prime =
then return Y */
+             if (BN_copy(y1, Y) =3D=3D NULL
+-                    || !BN_sub_word(y1, 1)
+-                    || !BN_gcd(tmp, y1, e, ctx))
++                    || !BN_sub_word(y1, 1))
+                 goto err;
+-            if (BN_is_one(tmp)) {
++            if (BN_are_coprime(y1, e, ctx)) {
+                 int rv =3D BN_check_prime(Y, ctx, cb);
+=20
+                 if (rv &gt; 0)
+diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
+index f302818..e9ddf8f 100644
+--- a/doc/man3/BN_cmp.pod
++++ b/doc/man3/BN_cmp.pod
+@@ -2,7 +2,8 @@
+=20
+ =3Dhead1 NAME
+=20
+-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd - BIGNUM comparison and test functions
++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd, BN_are_coprime
++- BIGNUM comparison and test functions
+=20
+ =3Dhead1 SYNOPSIS
+=20
+@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN=
_abs_is_word, BN_is_odd -
+  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
+  int BN_is_odd(const BIGNUM *a);
+=20
++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
++
+ =3Dhead1 DESCRIPTION
+=20
+ BN_cmp() compares the numbers I&lt;a&gt; and I&lt;b&gt;. BN_ucmp() comp=
ares their
+@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs_is=
_word() test if
+ I&lt;a&gt; equals 0, 1, I&lt;w&gt;, or E&lt;verbar&gt;I&lt;w&gt;E&lt;ve=
rbar&gt; respectively.
+ BN_is_odd() tests if I&lt;a&gt; is odd.
+=20
++BN_are_coprime() determines if B&lt;a&gt; and B&lt;b&gt; are coprime.
++B&lt;ctx&gt; is used internally for storing temporary variables.
++The values of B&lt;a&gt; and B&lt;b&gt; and B&lt;ctx&gt; must not be NU=
LL.
++
+ =3Dhead1 RETURN VALUES
+=20
+ BN_cmp() returns -1 if I&lt;a&gt; E&lt;lt&gt; I&lt;b&gt;, 0 if I&lt;a&g=
t; =3D=3D I&lt;b&gt; and 1 if
+@@ -35,11 +42,16 @@ of I&lt;a&gt; and I&lt;b&gt;.
+ BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
+ BN_is_odd() return 1 if the condition is true, 0 otherwise.
+=20
++BN_are_coprime() returns 1 if the B&lt;BIGNUM&gt;'s are coprime, otherw=
ise it
++returns 0.
++
+ =3Dhead1 HISTORY
+=20
+ Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
+ BN_abs_is_word() and BN_is_odd() were macros.
+=20
++The function BN_are_coprime() was added in OpenSSL 3.1.
++
+ =3Dhead1 COPYRIGHT
+=20
+ Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
+diff --git a/include/openssl/bn.h b/include/openssl/bn.h
+index ecd7f01..73895a5 100644
+--- a/include/openssl/bn.h
++++ b/include/openssl/bn.h
+@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGNUM =
*b, BN_CTX *ctx);
+ int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* ret=
urns
+                                                                   * -2 =
for
+                                                                   * err=
or */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
+ BIGNUM *BN_mod_inverse(BIGNUM *ret,
+                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx);
+ BIGNUM *BN_mod_sqrt(BIGNUM *ret,
+diff --git a/test/bntest.c b/test/bntest.c
+index c5894c1..eec6222 100644
+--- a/test/bntest.c
++++ b/test/bntest.c
+@@ -38,6 +38,7 @@ typedef struct mpitest_st {
+=20
+ static const int NUM0 =3D 100;           /* number of tests */
+ static const int NUM1 =3D 50;            /* additional tests for some f=
unctions */
++static const int NUM_PRIME_TESTS =3D 20;
+ static BN_CTX *ctx;
+=20
+ /*
+@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
+     return st;
+ }
+=20
++static int test_coprime(void)
++{
++    BIGNUM *a =3D NULL, *b =3D NULL;
++    int ret =3D 0;
++
++    ret =3D TEST_ptr(a =3D BN_new())
++          &amp;&amp; TEST_ptr(b =3D BN_new())
++          &amp;&amp; TEST_true(BN_set_word(a, 66))
++          &amp;&amp; TEST_true(BN_set_word(b, 99))
++          &amp;&amp; TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
++          &amp;&amp; TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
++          &amp;&amp; TEST_true(BN_set_word(a, 67))
++          &amp;&amp; TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
++          &amp;&amp; TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
++    BN_free(a);
++    BN_free(b);
++    return ret;
++}
++
+ static int test_gcd_prime(void)
+ {
+     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL;
+@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
+=20
+     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL)))
+             goto err;
+-    for (i =3D 0; i &lt; NUM0; i++) {
++    for (i =3D 0; i &lt; NUM_PRIME_TESTS; i++) {
+         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
+                                             NULL, NULL, NULL))
+                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
+-                || !TEST_true(BN_is_one(gcd)))
++                || !TEST_true(BN_is_one(gcd))
++                || !TEST_true(BN_are_coprime(a, b, ctx)))
+             goto err;
+     }
+=20
+@@ -3066,6 +3087,7 @@ int setup_tests(void)
+         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
+         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
+         ADD_TEST(test_gcd_prime);
++        ADD_TEST(test_coprime);
+         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
+         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExpTes=
ts));
+         ADD_TEST(test_mod_exp2_mont);
+diff --git a/util/libcrypto.num b/util/libcrypto.num
+index 0f6f30b..a1d1ed9 100644
+--- a/util/libcrypto.num
++++ b/util/libcrypto.num
+@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556	3_0_3=
	EXIST::FUNCTION:
+ OPENSSL_strncasecmp                     5557	3_0_3	EXIST::FUNCTION:
+ OSSL_CMP_CTX_reset_geninfo_ITAVs        5558	3_0_8	EXIST::FUNCTION:CMP
+ OSSL_CMP_MSG_update_recipNonce          5559	3_0_9	EXIST::FUNCTION:CMP
++BN_are_coprime                          5560	3_0_0	EXIST::FUNCTION:
+--=20
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/=
0002-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..1a6b601f65
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-key=
gen-performance.patch
@@ -0,0 +1,185 @@
+From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 2001
+From: slontis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:shane.lo=
ntis@oracle.com">&lt;shane.lontis@oracle.com&gt;</a>
+Date: Wed, 2 Nov 2022 13:20:55 +1000
+Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
+
+Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
+The old code was using a fixed value of 64.
+
+Reviewed-by: Paul Dale <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:pauli@openssl.org">&lt;pauli@openssl.org&gt;</a>
+Reviewed-by: Tomas Mraz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:tomas@openssl.org">&lt;tomas@openssl.org&gt;</a>
+(Merged from <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/openssl/openssl/pull/19579">https://github.com/openssl/openssl/pull/19=
579</a>)
+
+(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a4=
5c9df61">https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f763=
6bb2118e3a45c9df61</a>]
+
+Signed-off-by: Haitao Liu <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ crypto/bn/bn_prime.c         | 11 ++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++------
+ include/crypto/bn.h          |  2 ++
+ 3 files changed, 54 insertions(+), 8 deletions(-)
+
+diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
+index ddd31a0..79776f1 100644
+--- a/crypto/bn/bn_prime.c
++++ b/crypto/bn/bn_prime.c
+@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int checks=
, BN_CTX *ctx,
+     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
+ }
+=20
++/*
++ * Use this only for key generation.
++ * It always uses trial division. The number of checks
++ * (MR rounds) passed in is used without being clamped to a minimum val=
ue.
++ */
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
++                                  BN_GENCB *cb)
++{
++    return bn_is_prime_int(w, checks, ctx, 1, cb);
++}
++
+ int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
+ {
+     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 55efaf2..c3466df 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
+     BN_FLG_STATIC_DATA
+ };
+=20
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
++ */
++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
++{
++    if (nbits &gt;=3D 4096)
++        return 44;
++    if (nbits &gt;=3D 3072)
++        return 41;
++    if (nbits &gt;=3D 2048)
++        return 38;
++    return 0; /* Error */
++}
++
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA primes (p and q)
++ */
++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
++{
++    if (nbits &gt;=3D 3072)
++        return 4;
++    if (nbits &gt;=3D 2048)
++        return 5;
++    return 0; /* Error */
++}
++
+ /*
+  * FIPS 186-5 Table A.1. &quot;Min length of auxiliary primes p1, p2, q=
1, q2&quot;.
+  * (FIPS 186-5 has an entry for &gt;=3D 4096 bits).
+@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_size_=
for_prob_primes(int nbits)
+  *     Xp1 The passed in starting point to find a probably prime.
+  *     p1 The returned probable prime (first odd integer &gt;=3D Xp1)
+  *     ctx A BN_CTX object.
++ *     rounds The number of Miller Rabin rounds
+  *     cb An optional BIGNUM callback.
+  * Returns: 1 on success otherwise it returns 0.
+  */
+ static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
+                                                 BIGNUM *p1, BN_CTX *ctx=
,
++                                                int rounds,
+                                                 BN_GENCB *cb)
+ {
+     int ret =3D 0;
+@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(cons=
t BIGNUM *Xp1,
+         i++;
+         BN_GENCB_call(cb, 0, i);
+         /* MR test with trial division */
+-        tmp =3D BN_check_prime(p1, ctx, cb);
++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
+         if (tmp &gt; 0)
+             break;
+         if (tmp &lt; 0)
+@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+ {
+     int ret =3D 0;
+     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D NULL=
;
+-    int bitlen;
++    int bitlen, rounds;
+=20
+     if (p =3D=3D NULL || Xpout =3D=3D NULL)
+         return 0;
+@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
+     if (bitlen =3D=3D 0)
+         goto err;
++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
+=20
+     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in */
+     if (Xp1 =3D=3D NULL) {
+@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
+     }
+=20
+     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
+-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
+-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, cb=
))
++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds, c=
b)
++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, ro=
unds, cb))
+         goto err;
+     /* (Table B.1) auxiliary prime Max length check */
+     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) &gt;=3D
+@@ -243,11 +274,11 @@ err:
+  */
+ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGN=
UM *Xin,
+                                        const BIGNUM *r1, const BIGNUM *=
r2,
+-                                       int nlen, const BIGNUM *e, BN_CT=
X *ctx,
+-                                       BN_GENCB *cb)
++                                       int nlen, const BIGNUM *e,
++                                       BN_CTX *ctx, BN_GENCB *cb)
+ {
+     int ret =3D 0;
+-    int i, imax;
++    int i, imax, rounds;
+     int bits =3D nlen &gt;&gt; 1;
+     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
+     BIGNUM *base, *range;
+@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+      */
++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
+     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
+     for (;;) {
+         if (Xin =3D=3D NULL) {
+@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
+             if (BN_copy(y1, Y) =3D=3D NULL
+                     || !BN_sub_word(y1, 1))
+                 goto err;
++
+             if (BN_are_coprime(y1, e, ctx)) {
+-                int rv =3D BN_check_prime(Y, ctx, cb);
++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, ctx=
, cb);
+=20
+                 if (rv &gt; 0)
+                     goto end;
+diff --git a/include/crypto/bn.h b/include/crypto/bn.h
+index fd1c09d..00544d9 100644
+--- a/include/crypto/bn.h
++++ b/include/crypto/bn.h
+@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const BI=
GNUM *m,
+=20
+ int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, BN_C=
TX *ctx,
+                                   BN_GENCB *cb, int enhanced, int *stat=
us);
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
++                                  BN_GENCB *cb);
+=20
+ const BIGNUM *ossl_bn_get0_small_factors(void);
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.13.bb
index 5e43fdc2de..5b09493ccd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,6 +12,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
http://www.openssl.org/source/openssl-${PV}.tar.gz\file://0001-buildinfo-=
strip-sysroot-and-debug-prefix-map-from-co.patch\file://afalg.patch\file:=
//0001-Configure-do-not-tweak-mips-cflags.patch\+file://0001-Improve-FIPS=
-RSA-keygen-performance.patch\+file://0002-Improve-FIPS-RSA-keygen-perfor=
mance.patch\">&quot;http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://0001-Improve-FIPS-RSA-keygen-performance.patch \
+           file://0002-Improve-FIPS-RSA-keygen-performance.patch \
            &quot;</a>
=20
 SRC_URI:append:class-nativesdk =3D &quot; \
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#197294): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/197294">https:/=
/lists.openembedded.org/g/openembedded-core/message/197294</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104998278/3616765">https://lists.openembedded.org/mt=
/104998278/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------QNqnPZVADSLiamwW4tdth1EP--

