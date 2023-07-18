Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4B0EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:10:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3629.1689649814725838493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BBRZEJEB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6563f9619b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36I36t51004098
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=jM1ChI11i5Gl+ooAF7
	viomg4KVYjyGAgwT6exy+on6s=; b=BBRZEJEBRDqHL36IMbbO0NXzrbPfTGQ/Sg
	u0snsR8U6f9kbpnex4164gejt516FeEJIAhk7TybV3JmZuoHA+Sy0FyXFypGPcbm
	hJUNxcgup184JimvdetVQ4+VwdBXyLA6DZFk3mqt8fYzD4Ux2YVqX82+bnej2+3M
	h1kRV0h/mo8kt1TMFZU9dcl+ousBqyqeq/99Axbt00ejbLMYGkm6+7RUrGw5lkdv
	p4a6blo9YAgvHLOaYmao6mRpB6oA64V2ps0mil4daSIiZhdvF9eDQAcbszoPZWRa
	XYsVw4EG5affjr8qNPhesyNLRfkpumuWrXzWUOV0j53o5hcSU6+Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aa5hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:10:13 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36I3ADEp007783
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:10:13 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aa5hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 03:10:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8cg22nL/oPR93Kc6yWiGwC7lMBbRGD55k4NBFPrFp7/uGh8PUMGtGfJpehp/BVpsZ7c5oRt2PZcvl3u1ITxyOBgbi5LRMKbHPCGW1wdL2zSxhOA5f/IE0BR3py6p9gxyoYSX4PAYGtg4c4v52QssGR4rzwcTlBnDQns9oaM7E+WVoDugbojmojanVO1CEohDUo9PMH1lzf3IxuFeAmyz7gcME8aPGfb0J84O3uPyXedsn26A5aGlgUZmAmNN4Mn4JM0mUd2/AKFOIXtcIK4yXWHdRw/Em9817GdjjnMz/S2te8c/2j+59lBjMCDiubrvPWpLaWGbsCW7zbQcElvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jM1ChI11i5Gl+ooAF7viomg4KVYjyGAgwT6exy+on6s=;
 b=eEV9WLaH36s2iu3AbaoMPs7/ej3biuGQOuVNSltgPQdaJS7l65BzlWg5hLU6OBOIfjjwtPlugLLu//sAjqwG87xbyyKuXQ055I+ot5KRyi47U1gp4wHEC08/A492JvW8Voy6YrLqlfwrJG0j2VYqtND7gJL8wuD/XOBM1NuHK9DE+kht58y/Vn5SLVGLNfcZmMBQXoWpZHnNVTzCWU13jKUI2jkiwP6Ka0kooUzwPdRp0ooyOYnmOO6rFSXa56YXD6ul/U7xlU/MXM7ZcGFfk6juJcq60mknhe2RvyfG2Uk7WUOStC6pCQ67dGlALd49Doa94QJro6kR47hp+fN+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by CO6PR11MB5666.namprd11.prod.outlook.com (2603:10b6:303:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 03:10:02 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::cdc7:e3fc:8b6c:1cb0]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::cdc7:e3fc:8b6c:1cb0%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 03:10:02 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>,
        "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] perl: Fix CVE-2023-31486
Thread-Topic: [oe-core][PATCH 1/1] perl: Fix CVE-2023-31486
Thread-Index: AQHZtgLTi4GDPPLsGUWFyY3pRayesK+9/beAgADglsc=
Date: Tue, 18 Jul 2023 03:10:01 +0000
Message-ID: 
 <BYAPR11MB3397E1209B8354C5DFCD01DF8138A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20230714032510.1727852-1-soumya.sambu@windriver.com>
 <202307171344550a4050ec@mail.local>
In-Reply-To: <202307171344550a4050ec@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|CO6PR11MB5666:EE_
x-ms-office365-filtering-correlation-id: a7843d8a-f4c3-4a6f-a207-08db873c7a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OkIL6ppzCsigpc6vEEREDCsGSgtmnp3r007w4+NN0bVIza2Rby+meiuXiCy4m/eM+zh7ZdnUs0w2UqWiusiA2lpShrTCG+v8LFaNyA5wpmf6iZyW50uVh49JatnPL8Nre8IjJ253EXpA5GRRH4BK6YT7N0ZMxQO2dot11YgjdaCDMbmv89kW5O7BUe/pTa/xTn5HyJL0ylrinSFAUwZQU1QX1luBPW1CoQw0h0+qEDu/J0ISju7/t39pRDdHOVQDf+V/bZJQvA5v7unzerrBRxCbaqALWa/yBssQtwWk1PYRGne0+YK7TwJaLMAY2UEKwCmTrrXNfAO+6ZCchmkpqPlMYXmCp05xCASSA24VXV5yKqpxTgsQHg3VnZ5haOVLaGJk6+BwXc4I0fXmxkEFm+0SZXBrluPbWD7GFeFEfusQG0yxcW77s2eKAFerTyMR4JEjNQ0F1gdK+f5xGXHnqVmDSj5YORRxNu/Zkc3IJqxYxcl3PN87oxvvpYLJK9aApY/t8xGT/izJPqpyktqSYoAu+6wRo64giYch1gOYGA5Ty7AejvjHvV7PJaXWNKsgs8hAJXG2o/KZ0RKnac16i0hgL3vbtvXT7e5u6G1qE+ORYb6KVYKCeDBF0gkc3evQWoWCdCuM16Y95A8NqKn9EhwLd+uDKTbt+1uhHLGaDTI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(451199021)(8676002)(7696005)(41300700001)(66476007)(6916009)(966005)(66946007)(2906002)(66446008)(66556008)(8936002)(66899021)(54906003)(166002)(122000001)(76116006)(19627405001)(86362001)(4326008)(316002)(52536014)(5660300002)(30864003)(9686003)(64756008)(38100700002)(83380400001)(186003)(26005)(18265965005)(6506007)(71200400001)(107886003)(33656002)(53546011)(38070700005)(55016003)(55236004)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?UpRJqY4bOFhP7vFjzKMR0Y1uhyoBEn/yaBS+ZImr1/HQMNyXPa6WS0zG?=
 =?Windows-1252?Q?gAhjgShDQcfNUfRHhE6ZkHV18x+NLHCmM44yB/wIGUzK1FNaEb+e7oJS?=
 =?Windows-1252?Q?nKnphQS5ra8ISH6jjhQ1bXM8QDJO5SkcrtG3ccAENRSscEurh5oXwg9E?=
 =?Windows-1252?Q?w1fD6CHjH2nbowu1vy0XB0y1iH4zuNejZJhdNCbL/bjfvUjLfWbREZfS?=
 =?Windows-1252?Q?gwHq36g65MqvnLSFBCNj7PIQ0gMbYH3o4oSAIBx6WdqOnUN109o4cYlo?=
 =?Windows-1252?Q?uAZG10e30+AtpUETiFGMn1CfDkhqvDlHfdx95yu6EUfwgUOldC3rnDWq?=
 =?Windows-1252?Q?ggShPswSrZ7oW+3BXHvNK0OaLKYcguDr57Jf1wxC4/nRKb4+DfQ0MCTj?=
 =?Windows-1252?Q?8BnNezQ5OvsNuiixoxnLBDmtbFzye++V2tpt4Dvgkh22bpDNClJqzovp?=
 =?Windows-1252?Q?R/mvNVR84Xw9VTz9tnnu5h6oALobBeTUUmuHMO61qDFZ/OifrJJWilKO?=
 =?Windows-1252?Q?VKvVVsFavALhBlBGh5Li4XxhiKvUautugyEARJyrxDgM7MQ7dCw7c8NQ?=
 =?Windows-1252?Q?RPwIzwBE8L6osgxkFuYiRgjruSHP/ZwuU61HeHdOr+fo11Gk54wDrem5?=
 =?Windows-1252?Q?zbAjkm9BoHvqTPtqFMb263fFh8Gcl/jHzcy8AdSO85WiSJGU0CxHFczL?=
 =?Windows-1252?Q?VWe51IriKxijfqlPTqdyefwwhfmAi4r/8F4f0///3/LZ3fyDu2dHG5ql?=
 =?Windows-1252?Q?Ov0bdplAqwpXGBCCKqQCaVhA1Mi3rt057lqJxrCONM9Rddu70eNWExt7?=
 =?Windows-1252?Q?YsIfcIl0HwTDIZ5gIxPfV89dDMSA8M6D6algKfp4LJyzLLoSKX04aPco?=
 =?Windows-1252?Q?JG1OwFkobnEVCw7dZq+AebMmhNx1jLl6aOI9Bh+c5M0LKrWw+KXm0BnL?=
 =?Windows-1252?Q?vWcH35xy/KhVnK2iEETaOeknAfGMUu8+N+C6y2dna521jxFolE+HnBzp?=
 =?Windows-1252?Q?+/ioD5y19rAtShcFWK86fC52XnjEke8zZ8UGV+PMeAdh/lT+40de3uQl?=
 =?Windows-1252?Q?zyxHKF2IvoTz7jnpqv8f5PVB/X2PeF7a5oRhxGz4oXpjGGdXgC8PncgA?=
 =?Windows-1252?Q?mns0mYAUe62JecJSZhpPYr4IdA7id/tAq1ByuZ/LglXjNllQ4lrB7NZL?=
 =?Windows-1252?Q?xL9RUWm74aTQ9m1E6wWX4y/LoDF2nMDdNCTmePOFsjaJjIkcKDE+/1E8?=
 =?Windows-1252?Q?ryWatUNfjKLpf/zRzvpKS1x8Do+jiLKMnhuhZpllo65Y34DwgB7tSQxi?=
 =?Windows-1252?Q?Z+ZcI/q+jopdNGd49PmXrWUylYps3s7S9Ncrz24GPSLpkp7Fkdu8SkJz?=
 =?Windows-1252?Q?uhlX6u3sFVdooVvPsZTkoN2rxPSYqJTxQHlB/o104ESwL5z9bm7Gb/a3?=
 =?Windows-1252?Q?7AE+iPqT069fc2RTyCTKNVII1dKUZRq3HqxKU+tXxRLsaMqLk4+7sZfG?=
 =?Windows-1252?Q?8Atv7BRXj911Yl8mXFq0H9bK5izU08OvCFy3m03Ml2te13RlPHgXei/n?=
 =?Windows-1252?Q?HgzLP3zEU1nxevrqs9gq0sJks7R0XZ3ZjhhNY8LXTF7zYEzy4s0zaov5?=
 =?Windows-1252?Q?DtZisXPVRfs5UoXGJEmPBjJfdQR9rwIcuH1Zmod6bwuJqaWjI84PD3Xs?=
 =?Windows-1252?Q?A0aTk851COZcRZHlswD0OU3JXI1c8h8H?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397E1209B8354C5DFCD01DF8138ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7843d8a-f4c3-4a6f-a207-08db873c7a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 03:10:01.7677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qetN3XtHIzX2Ip5peMJEfVkQnxeMqbm/jRHCkWhyaIMJZx2KqdKiciswKunr3F7wtFVDWwWLEf1F9FpntZtp+2bcC8TO+/aF5k69Rv1wQ7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5666
X-Proofpoint-GUID: Gk6ZCQpybbJ4ZfnkH9eYVsZhZdKihei0
X-Proofpoint-ORIG-GUID: gE6bvoKtovsbgkUhPvs9Ol5cE9C6ZoS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307180028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184486

--_000_BYAPR11MB3397E1209B8354C5DFCD01DF8138ABYAPR11MB3397namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sent v2 - https://lore.kernel.org/openembedded-core/20230718030636.1418247-=
1-soumya.sambu@windriver.com/T/#u

Regards,
Soumya
________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Monday, July 17, 2023 7:14 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; steve@sakoman.com <steve@sakoman.com>; G Pillai, Hari <Hari.G=
Pillai@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] perl: Fix CVE-2023-31486

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

you pressed y instead of enter when git asked you what wharset to use,
so the patch doesn't apply. Can you resend?


On 14/07/2023 03:25:10+0000, Soumya via lists.openembedded.org wrote:
> HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available
> standalone on CPAN, has an insecure default TLS configuration where
> users must opt in to verify certificates.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-31486
>
> Upstream patches:
> https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a=
9704eaf85b741d
> https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a0=
24d81a1903701d
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  .../perl/files/CVE-2023-31486-0001.patch      | 217 ++++++++++++++++++
>  .../perl/files/CVE-2023-31486-0002.patch      |  36 +++
>  meta/recipes-devtools/perl/perl_5.36.1.bb     |   2 +
>  3 files changed, 255 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.=
patch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.=
patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
> new file mode 100644
> index 0000000000..1074e0848d
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
> @@ -0,0 +1,217 @@
> +From 77f557ef84698efeb6eed04e4a9704eaf85b741d
> +From: Stig Palmquist <git@stig.io>
> +Date: Mon Jun 5 16:46:22 2023 +0200
> +Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
> + insecure default
> +
> +- Changes the `verify_SSL` default parameter from `0` to `1`
> +
> +  Based on patch by Dominic Hargreaves:
> +  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e4=
0e22052f75a0b3449f1f53cbd27ba92
> +
> +  CVE: CVE-2023-31486
> +
> +- Add check for `$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}` that
> +  enables the previous insecure default behaviour if set to `1`.
> +
> +  This provides a workaround for users who encounter problems with the
> +  new `verify_SSL` default.
> +
> +  Example to disable certificate checks:
> +  ```
> +    $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=3D1 ./script.pl
> +  ```
> +
> +- Updates to documentation:
> +  - Describe changing the verify_SSL value
> +  - Describe the escape-hatch environment variable
> +  - Remove rationale for not enabling verify_SSL
> +  - Add missing certificate search paths
> +  - Replace "SSL" with "TLS/SSL" where appropriate
> +  - Use "machine-in-the-middle" instead of "man-in-the-middle"
> +
> +Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/77f557ef84698efeb6eed04e4a9704eaf85b741d]
> +
> +Signed-off-by: Soumya <soumya.sambu@windriver.com>
> +---
> + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
> + 1 file changed, 57 insertions(+), 29 deletions(-)
> +
> +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
> +index 83ca06d..ebc34a1 100644
> +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> +@@ -40,10 +40,14 @@ sub _croak { require Carp; Carp::croak(@_) }
> + #pod * C<timeout> =97 Request timeout in seconds (default is 60) If a s=
ocket open,
> + #pod   read or write takes longer than the timeout, the request respons=
e status code
> + #pod   will be 599.
> +-#pod * C<verify_SSL> =97 A boolean that indicates whether to validate t=
he SSL
> +-#pod   certificate of an C<https> =97 connection (default is false)
> ++#pod * C<verify_SSL> =97 A boolean that indicates whether to validate t=
he TLS/SSL
> ++#pod   certificate of an C<https> =97 connection (default is true). Cha=
nged from false
> ++#pod   to true in version 0.083.
> + #pod * C<SSL_options> =97 A hashref of C<SSL_*> =97 options to pass thr=
ough to
> + #pod   L<IO::Socket::SSL>
> ++#pod * C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}> - Changes the de=
fault
> ++#pod   certificate verification behavior to not check server identity i=
f set to 1.
> ++#pod   Only effective if C<verify_SSL> is not set. Added in version 0.0=
83.
> + #pod
> + #pod An accessor/mutator method exists for each attribute.
> + #pod
> +@@ -111,11 +115,17 @@ sub timeout {
> + sub new {
> +     my($class, %args) =3D @_;
> +
> ++    # Support lower case verify_ssl argument, but only if verify_SSL is=
 not
> ++    # true.
> ++    if ( exists $args{verify_ssl} ) {
> ++        $args{verify_SSL}  ||=3D $args{verify_ssl};
> ++    }
> ++
> +     my $self =3D {
> +         max_redirect =3D> 5,
> +         timeout      =3D> defined $args{timeout} ? $args{timeout} : 60,
> +         keep_alive   =3D> 1,
> +-        verify_SSL   =3D> $args{verify_SSL} || $args{verify_ssl} || 0, =
# no verification by default
> ++        verify_SSL   =3D> defined $args{verify_SSL} ? $args{verify_SSL}=
 : _verify_SSL_default(),
> +         no_proxy     =3D> $ENV{no_proxy},
> +     };
> +
> +@@ -134,6 +144,13 @@ sub new {
> +     return $self;
> + }
> +
> ++sub _verify_SSL_default {
> ++    my ($self) =3D @_;
> ++    # Check if insecure default certificate verification behaviour has =
been
> ++    # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
> ++    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
> ++}
> ++
> + sub _set_proxies {
> +     my ($self) =3D @_;
> +
> +@@ -1055,7 +1072,7 @@ sub new {
> +         timeout          =3D> 60,
> +         max_line_size    =3D> 16384,
> +         max_header_lines =3D> 64,
> +-        verify_SSL       =3D> 0,
> ++        verify_SSL       =3D> HTTP::Tiny::_verify_SSL_default(),
> +         SSL_options      =3D> {},
> +         %args
> +     }, $class;
> +@@ -2043,11 +2060,11 @@ proxy
> + timeout
> + verify_SSL
> +
> +-=3Dhead1 SSL SUPPORT
> ++=3Dhead1 TLS/SSL SUPPORT
> +
> + Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.=
56 or
> + greater and L<Net::SSLeay> 1.49 or greater are installed. An error will=
 occur
> +-if new enough versions of these modules are not installed or if the SSL
> ++if new enough versions of these modules are not installed or if the TLS
> + encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility fun=
ction
> + that returns boolean to see if the required modules are installed.
> +
> +@@ -2055,7 +2072,7 @@ An C<https> connection may be made via an C<http> =
proxy that supports the CONNEC
> + command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that i=
tself
> + requires C<https> to communicate.
> +
> +-SSL provides two distinct capabilities:
> ++TLS/SSL provides two distinct capabilities:
> +
> + =3Dover 4
> +
> +@@ -2069,24 +2086,17 @@ Verification of server identity
> +
> + =3Dback
> +
> +-B<By default, HTTP::Tiny does not verify server identity>.
> +-
> +-Server identity verification is controversial and potentially tricky be=
cause it
> +-depends on a (usually paid) third-party Certificate Authority (CA) trus=
t model
> +-to validate a certificate as legitimate.  This discriminates against se=
rvers
> +-with self-signed certificates or certificates signed by free, community=
-driven
> +-CA's such as L<CAcert.org|http://cacert.org>.
> ++B<By default, HTTP::Tiny verifies server identity>.
> +
> +-By default, HTTP::Tiny does not make any assumptions about your trust m=
odel,
> +-threat level or risk tolerance.  It just aims to give you an encrypted =
channel
> +-when you need one.
> ++This was changed in version 0.083 due to security concerns. The previou=
s default
> ++behavior can be enabled by setting C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_B=
Y_DEFAULT}>
> ++to 1.
> +
> +-Setting the C<verify_SSL> attribute to a true value will make HTTP::Tin=
y verify
> +-that an SSL connection has a valid SSL certificate corresponding to the=
 host
> +-name of the connection and that the SSL certificate has been verified b=
y a CA.
> +-Assuming you trust the CA, this will protect against a L<man-in-the-mid=
dle
> +-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you =
are
> +-concerned about security, you should enable this option.
> ++Verification is done by checking that that the TLS/SSL connection has a=
 valid
> ++certificate corresponding to the host name of the connection and that t=
he
> ++certificate has been verified by a CA. Assuming you trust the CA, this =
will
> ++protect against L<machine-in-the-middle
> ++attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack>.
> +
> + Certificate verification requires a file containing trusted CA certific=
ates.
> +
> +@@ -2094,9 +2104,7 @@ If the environment variable C<SSL_CERT_FILE> is pr=
esent, HTTP::Tiny
> + will try to find a CA certificate file in that location.
> +
> + If the L<Mozilla::CA> module is installed, HTTP::Tiny will use the CA f=
ile
> +-included with it as a source of trusted CA's.  (This means you trust Mo=
zilla,
> +-the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA, t=
he
> +-toolchain used to install it, and your operating system security, right=
?)
> ++included with it as a source of trusted CA's.
> +
> + If that module is not available, then HTTP::Tiny will search several
> + system-specific default locations for a CA certificate file:
> +@@ -2115,13 +2123,33 @@ system-specific default locations for a CA certi=
ficate file:
> +
> + /etc/ssl/ca-bundle.pem
> +
> ++=3Ditem *
> ++
> ++/etc/openssl/certs/ca-certificates.crt
> ++
> ++=3Ditem *
> ++
> ++/etc/ssl/cert.pem
> ++
> ++=3Ditem *
> ++
> ++/usr/local/share/certs/ca-root-nss.crt
> ++
> ++=3Ditem *
> ++
> ++/etc/pki/tls/cacert.pem
> ++
> ++=3Ditem *
> ++
> ++/etc/certs/ca-certificates.crt
> ++
> + =3Dback
> +
> + An error will be occur if C<verify_SSL> is true and no CA certificate f=
ile
> + is available.
> +
> +-If you desire complete control over SSL connections, the C<SSL_options>=
 attribute
> +-lets you provide a hash reference that will be passed through to
> ++If you desire complete control over TLS/SSL connections, the C<SSL_opti=
ons>
> ++attribute lets you provide a hash reference that will be passed through=
 to
> + C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Ti=
ny. For
> + example, to provide your own trusted CA file:
> +
> +@@ -2131,7 +2159,7 @@ example, to provide your own trusted CA file:
> +
> + The C<SSL_options> attribute could also be used for such things as prov=
iding a
> + client certificate for authentication to a server or controlling the ch=
oice of
> +-cipher used for the SSL connection. See L<IO::Socket::SSL> documentatio=
n for
> ++cipher used for the TLS/SSL connection. See L<IO::Socket::SSL> document=
ation for
> + details.
> +
> + =3Dhead1 PROXY SUPPORT
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
> new file mode 100644
> index 0000000000..45452be389
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
> @@ -0,0 +1,36 @@
> +From a22785783b17cbaa28afaee4a024d81a1903701d
> +From: Stig Palmquist <git@stig.io>
> +Date: Sun Jun 18 11:36:05 2023 +0200
> +Subject: [PATCH] Fix incorrect env var name for verify_SSL default
> +
> +The variable to override the verify_SSL default differed slightly in the
> +documentation from what was checked for in the code.
> +
> +This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT`
> +as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which was
> +missing `SSL_`
> +
> +CVE: CVE-2023-31486
> +
> +Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/a22785783b17cbaa28afaee4a024d81a1903701d]
> +
> +Signed-off-by: Soumya <soumya.sambu@windriver.com>
> +---
> + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
> +index ebc34a1..65ac8ff 100644
> +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> +@@ -148,7 +148,7 @@ sub _verify_SSL_default {
> +     my ($self) =3D @_;
> +     # Check if insecure default certificate verification behaviour has =
been
> +     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
> +-    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
> ++    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1'=
) ? 0 : 1;
> + }
> +
> + sub _set_proxies {
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/perl/perl_5.36.1.bb b/meta/recipes-dev=
tools/perl/perl_5.36.1.bb
> index 3db1d9c6ae..87768cc7f7 100644
> --- a/meta/recipes-devtools/perl/perl_5.36.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.36.1.bb
> @@ -18,6 +18,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
>             file://determinism.patch \
>             file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
>             file://CVE-2023-31484.patch \
> +           file://CVE-2023-31486-0001.patch \
> +           file://CVE-2023-31486-0002.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://perl-configpm-switch.patch \
> --
> 2.40.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184250): https://lists.openembedded.org/g/openembedde=
d-core/message/184250
> Mute This Topic: https://lists.openembedded.org/mt/100134685/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_BYAPR11MB3397E1209B8354C5DFCD01DF8138ABYAPR11MB3397namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Sent v2 -&nbsp;<a href=3D"https://lore.kernel.org/openembedded-core/2023071=
8030636.1418247-1-soumya.sambu@windriver.com/T/#u" id=3D"LPlnk187875">https=
://lore.kernel.org/openembedded-core/20230718030636.1418247-1-soumya.sambu@=
windriver.com/T/#u</a><br>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Regards,
<div>Soumya</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Sent:</b> Monday, July 17, 2023 7:14 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; steve@sakoman.com &lt;steve@sakoman.com&gt;; G P=
illai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe-core][PATCH 1/1] perl: Fix CVE-2023-31486</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
you pressed y instead of enter when git asked you what wharset to use,<br>
so the patch doesn't apply. Can you resend?<br>
<br>
<br>
On 14/07/2023 03:25:10+0000, Soumya via lists.openembedded.org wrote:<br>
&gt; HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available=
<br>
&gt; standalone on CPAN, has an insecure default TLS configuration where<br=
>
&gt; users must opt in to verify certificates.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-31486">https://nv=
d.nist.gov/vuln/detail/CVE-2023-31486</a><br>
&gt;<br>
&gt; Upstream patches:<br>
&gt; <a href=3D"https://github.com/chansen/p5-http-tiny/commit/77f557ef8469=
8efeb6eed04e4a9704eaf85b741d">
https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a97=
04eaf85b741d</a><br>
&gt; <a href=3D"https://github.com/chansen/p5-http-tiny/commit/a22785783b17=
cbaa28afaee4a024d81a1903701d">
https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024=
d81a1903701d</a><br>
&gt;<br>
&gt; Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../perl/files/CVE-2023-31486-0001.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 217 ++++++++++++++++++<br>
&gt;&nbsp; .../perl/files/CVE-2023-31486-0002.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 36 +++<br>
&gt;&nbsp; meta/recipes-devtools/perl/perl_5.36.1.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 255 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-314=
86-0001.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-314=
86-0002.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patc=
h b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1074e0848d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch<br>
&gt; @@ -0,0 +1,217 @@<br>
&gt; +From 77f557ef84698efeb6eed04e4a9704eaf85b741d<br>
&gt; +From: Stig Palmquist &lt;git@stig.io&gt;<br>
&gt; +Date: Mon Jun 5 16:46:22 2023 +0200<br>
&gt; +Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enabl=
e<br>
&gt; + insecure default<br>
&gt; +<br>
&gt; +- Changes the `verify_SSL` default parameter from `0` to `1`<br>
&gt; +<br>
&gt; +&nbsp; Based on patch by Dominic Hargreaves:<br>
&gt; +&nbsp; <a href=3D"https://salsa.debian.org/perl-team/interpreter/perl=
/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92">
https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e40e220=
52f75a0b3449f1f53cbd27ba92</a><br>
&gt; +<br>
&gt; +&nbsp; CVE: CVE-2023-31486<br>
&gt; +<br>
&gt; +- Add check for `$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}` that<b=
r>
&gt; +&nbsp; enables the previous insecure default behaviour if set to `1`.=
<br>
&gt; +<br>
&gt; +&nbsp; This provides a workaround for users who encounter problems wi=
th the<br>
&gt; +&nbsp; new `verify_SSL` default.<br>
&gt; +<br>
&gt; +&nbsp; Example to disable certificate checks:<br>
&gt; +&nbsp; ```<br>
&gt; +&nbsp;&nbsp;&nbsp; $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=3D1 ./scr=
ipt.pl<br>
&gt; +&nbsp; ```<br>
&gt; +<br>
&gt; +- Updates to documentation:<br>
&gt; +&nbsp; - Describe changing the verify_SSL value<br>
&gt; +&nbsp; - Describe the escape-hatch environment variable<br>
&gt; +&nbsp; - Remove rationale for not enabling verify_SSL<br>
&gt; +&nbsp; - Add missing certificate search paths<br>
&gt; +&nbsp; - Replace &quot;SSL&quot; with &quot;TLS/SSL&quot; where appro=
priate<br>
&gt; +&nbsp; - Use &quot;machine-in-the-middle&quot; instead of &quot;man-i=
n-the-middle&quot;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/chansen/p5-h=
ttp-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d">https://github.co=
m/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d</a>]=
<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++---------=
--<br>
&gt; + 1 file changed, 57 insertions(+), 29 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTT=
P/Tiny.pm<br>
&gt; +index 83ca06d..ebc34a1 100644<br>
&gt; +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm<br>
&gt; ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm<br>
&gt; +@@ -40,10 +40,14 @@ sub _croak { require Carp; Carp::croak(@_) }<br>
&gt; + #pod * C&lt;timeout&gt; =97 Request timeout in seconds (default is 6=
0) If a socket open,<br>
&gt; + #pod&nbsp;&nbsp; read or write takes longer than the timeout, the re=
quest response status code<br>
&gt; + #pod&nbsp;&nbsp; will be 599.<br>
&gt; +-#pod * C&lt;verify_SSL&gt; =97 A boolean that indicates whether to v=
alidate the SSL<br>
&gt; +-#pod&nbsp;&nbsp; certificate of an C&lt;https&gt; =97 connection (de=
fault is false)<br>
&gt; ++#pod * C&lt;verify_SSL&gt; =97 A boolean that indicates whether to v=
alidate the TLS/SSL<br>
&gt; ++#pod&nbsp;&nbsp; certificate of an C&lt;https&gt; =97 connection (de=
fault is true). Changed from false<br>
&gt; ++#pod&nbsp;&nbsp; to true in version 0.083.<br>
&gt; + #pod * C&lt;SSL_options&gt; =97 A hashref of C&lt;SSL_*&gt; =97 opti=
ons to pass through to<br>
&gt; + #pod&nbsp;&nbsp; L&lt;IO::Socket::SSL&gt;<br>
&gt; ++#pod * C&lt;$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}&gt; - Chang=
es the default<br>
&gt; ++#pod&nbsp;&nbsp; certificate verification behavior to not check serv=
er identity if set to 1.<br>
&gt; ++#pod&nbsp;&nbsp; Only effective if C&lt;verify_SSL&gt; is not set. A=
dded in version 0.083.<br>
&gt; + #pod<br>
&gt; + #pod An accessor/mutator method exists for each attribute.<br>
&gt; + #pod<br>
&gt; +@@ -111,11 +115,17 @@ sub timeout {<br>
&gt; + sub new {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; my($class, %args) =3D @_;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; # Support lower case verify_ssl argument, but onl=
y if verify_SSL is not<br>
&gt; ++&nbsp;&nbsp;&nbsp; # true.<br>
&gt; ++&nbsp;&nbsp;&nbsp; if ( exists $args{verify_ssl} ) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $args{verify_SSL}&nbsp; |=
|=3D $args{verify_ssl};<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; my $self =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_redirect =3D&gt;=
 5,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =3D&gt; defined $args{timeout} ? $args{timeout} : 60,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; keep_alive&nbsp;&nbs=
p; =3D&gt; 1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verify_SSL&nbsp;&nbsp; =
=3D&gt; $args{verify_SSL} || $args{verify_ssl} || 0, # no verification by d=
efault<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verify_SSL&nbsp;&nbsp; =
=3D&gt; defined $args{verify_SSL} ? $args{verify_SSL} : _verify_SSL_default=
(),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_proxy&nbsp;&nbsp;=
&nbsp;&nbsp; =3D&gt; $ENV{no_proxy},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +@@ -134,6 +144,13 @@ sub new {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return $self;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++sub _verify_SSL_default {<br>
&gt; ++&nbsp;&nbsp;&nbsp; my ($self) =3D @_;<br>
&gt; ++&nbsp;&nbsp;&nbsp; # Check if insecure default certificate verificat=
ion behaviour has been<br>
&gt; ++&nbsp;&nbsp;&nbsp; # changed by the user by setting PERL_HTTP_TINY_S=
SL_INSECURE_BY_DEFAULT=3D1<br>
&gt; ++&nbsp;&nbsp;&nbsp; return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT}=
 || '') eq '1') ? 0 : 1;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + sub _set_proxies {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; my ($self) =3D @_;<br>
&gt; +<br>
&gt; +@@ -1055,7 +1072,7 @@ sub new {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D&gt; 60,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_line_size&nbsp;&=
nbsp;&nbsp; =3D&gt; 16384,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_header_lines =3D=
&gt; 64,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verify_SSL&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D&gt; 0,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verify_SSL&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D&gt; HTTP::Tiny::_verify_SSL_default(),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SSL_options&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D&gt; {},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %args<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }, $class;<br>
&gt; +@@ -2043,11 +2060,11 @@ proxy<br>
&gt; + timeout<br>
&gt; + verify_SSL<br>
&gt; +<br>
&gt; +-=3Dhead1 SSL SUPPORT<br>
&gt; ++=3Dhead1 TLS/SSL SUPPORT<br>
&gt; +<br>
&gt; + Direct C&lt;https&gt; connections are supported only if L&lt;IO::Soc=
ket::SSL&gt; 1.56 or<br>
&gt; + greater and L&lt;Net::SSLeay&gt; 1.49 or greater are installed. An e=
rror will occur<br>
&gt; +-if new enough versions of these modules are not installed or if the =
SSL<br>
&gt; ++if new enough versions of these modules are not installed or if the =
TLS<br>
&gt; + encryption fails. You can also use C&lt;HTTP::Tiny::can_ssl()&gt; ut=
ility function<br>
&gt; + that returns boolean to see if the required modules are installed.<b=
r>
&gt; +<br>
&gt; +@@ -2055,7 +2072,7 @@ An C&lt;https&gt; connection may be made via an=
 C&lt;http&gt; proxy that supports the CONNEC<br>
&gt; + command (i.e. RFC 2817).&nbsp; You may not proxy C&lt;https&gt; via =
a proxy that itself<br>
&gt; + requires C&lt;https&gt; to communicate.<br>
&gt; +<br>
&gt; +-SSL provides two distinct capabilities:<br>
&gt; ++TLS/SSL provides two distinct capabilities:<br>
&gt; +<br>
&gt; + =3Dover 4<br>
&gt; +<br>
&gt; +@@ -2069,24 +2086,17 @@ Verification of server identity<br>
&gt; +<br>
&gt; + =3Dback<br>
&gt; +<br>
&gt; +-B&lt;By default, HTTP::Tiny does not verify server identity&gt;.<br>
&gt; +-<br>
&gt; +-Server identity verification is controversial and potentially tricky=
 because it<br>
&gt; +-depends on a (usually paid) third-party Certificate Authority (CA) t=
rust model<br>
&gt; +-to validate a certificate as legitimate.&nbsp; This discriminates ag=
ainst servers<br>
&gt; +-with self-signed certificates or certificates signed by free, commun=
ity-driven<br>
&gt; +-CA's such as L&lt;CAcert.org|http://cacert.org&gt;.<br>
&gt; ++B&lt;By default, HTTP::Tiny verifies server identity&gt;.<br>
&gt; +<br>
&gt; +-By default, HTTP::Tiny does not make any assumptions about your trus=
t model,<br>
&gt; +-threat level or risk tolerance.&nbsp; It just aims to give you an en=
crypted channel<br>
&gt; +-when you need one.<br>
&gt; ++This was changed in version 0.083 due to security concerns. The prev=
ious default<br>
&gt; ++behavior can be enabled by setting C&lt;$ENV{PERL_HTTP_TINY_SSL_INSE=
CURE_BY_DEFAULT}&gt;<br>
&gt; ++to 1.<br>
&gt; +<br>
&gt; +-Setting the C&lt;verify_SSL&gt; attribute to a true value will make =
HTTP::Tiny verify<br>
&gt; +-that an SSL connection has a valid SSL certificate corresponding to =
the host<br>
&gt; +-name of the connection and that the SSL certificate has been verifie=
d by a CA.<br>
&gt; +-Assuming you trust the CA, this will protect against a L&lt;man-in-t=
he-middle<br>
&gt; +-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack&gt;.&nb=
sp; If you are<br>
&gt; +-concerned about security, you should enable this option.<br>
&gt; ++Verification is done by checking that that the TLS/SSL connection ha=
s a valid<br>
&gt; ++certificate corresponding to the host name of the connection and tha=
t the<br>
&gt; ++certificate has been verified by a CA. Assuming you trust the CA, th=
is will<br>
&gt; ++protect against L&lt;machine-in-the-middle<br>
&gt; ++attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack&gt=
;.<br>
&gt; +<br>
&gt; + Certificate verification requires a file containing trusted CA certi=
ficates.<br>
&gt; +<br>
&gt; +@@ -2094,9 +2104,7 @@ If the environment variable C&lt;SSL_CERT_FILE&=
gt; is present, HTTP::Tiny<br>
&gt; + will try to find a CA certificate file in that location.<br>
&gt; +<br>
&gt; + If the L&lt;Mozilla::CA&gt; module is installed, HTTP::Tiny will use=
 the CA file<br>
&gt; +-included with it as a source of trusted CA's.&nbsp; (This means you =
trust Mozilla,<br>
&gt; +-the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA=
, the<br>
&gt; +-toolchain used to install it, and your operating system security, ri=
ght?)<br>
&gt; ++included with it as a source of trusted CA's.<br>
&gt; +<br>
&gt; + If that module is not available, then HTTP::Tiny will search several=
<br>
&gt; + system-specific default locations for a CA certificate file:<br>
&gt; +@@ -2115,13 +2123,33 @@ system-specific default locations for a CA ce=
rtificate file:<br>
&gt; +<br>
&gt; + /etc/ssl/ca-bundle.pem<br>
&gt; +<br>
&gt; ++=3Ditem *<br>
&gt; ++<br>
&gt; ++/etc/openssl/certs/ca-certificates.crt<br>
&gt; ++<br>
&gt; ++=3Ditem *<br>
&gt; ++<br>
&gt; ++/etc/ssl/cert.pem<br>
&gt; ++<br>
&gt; ++=3Ditem *<br>
&gt; ++<br>
&gt; ++/usr/local/share/certs/ca-root-nss.crt<br>
&gt; ++<br>
&gt; ++=3Ditem *<br>
&gt; ++<br>
&gt; ++/etc/pki/tls/cacert.pem<br>
&gt; ++<br>
&gt; ++=3Ditem *<br>
&gt; ++<br>
&gt; ++/etc/certs/ca-certificates.crt<br>
&gt; ++<br>
&gt; + =3Dback<br>
&gt; +<br>
&gt; + An error will be occur if C&lt;verify_SSL&gt; is true and no CA cert=
ificate file<br>
&gt; + is available.<br>
&gt; +<br>
&gt; +-If you desire complete control over SSL connections, the C&lt;SSL_op=
tions&gt; attribute<br>
&gt; +-lets you provide a hash reference that will be passed through to<br>
&gt; ++If you desire complete control over TLS/SSL connections, the C&lt;SS=
L_options&gt;<br>
&gt; ++attribute lets you provide a hash reference that will be passed thro=
ugh to<br>
&gt; + C&lt;IO::Socket::SSL::start_SSL()&gt;, overriding any options set by=
 HTTP::Tiny. For<br>
&gt; + example, to provide your own trusted CA file:<br>
&gt; +<br>
&gt; +@@ -2131,7 +2159,7 @@ example, to provide your own trusted CA file:<b=
r>
&gt; +<br>
&gt; + The C&lt;SSL_options&gt; attribute could also be used for such thing=
s as providing a<br>
&gt; + client certificate for authentication to a server or controlling the=
 choice of<br>
&gt; +-cipher used for the SSL connection. See L&lt;IO::Socket::SSL&gt; doc=
umentation for<br>
&gt; ++cipher used for the TLS/SSL connection. See L&lt;IO::Socket::SSL&gt;=
 documentation for<br>
&gt; + details.<br>
&gt; +<br>
&gt; + =3Dhead1 PROXY SUPPORT<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patc=
h b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..45452be389<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From a22785783b17cbaa28afaee4a024d81a1903701d<br>
&gt; +From: Stig Palmquist &lt;git@stig.io&gt;<br>
&gt; +Date: Sun Jun 18 11:36:05 2023 +0200<br>
&gt; +Subject: [PATCH] Fix incorrect env var name for verify_SSL default<br=
>
&gt; +<br>
&gt; +The variable to override the verify_SSL default differed slightly in =
the<br>
&gt; +documentation from what was checked for in the code.<br>
&gt; +<br>
&gt; +This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAUL=
T`<br>
&gt; +as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which =
was<br>
&gt; +missing `SSL_`<br>
&gt; +<br>
&gt; +CVE: CVE-2023-31486<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/chansen/p5-h=
ttp-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d">https://github.co=
m/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d</a>]=
<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTT=
P/Tiny.pm<br>
&gt; +index ebc34a1..65ac8ff 100644<br>
&gt; +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm<br>
&gt; ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm<br>
&gt; +@@ -148,7 +148,7 @@ sub _verify_SSL_default {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; my ($self) =3D @_;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; # Check if insecure default certificate veri=
fication behaviour has been<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; # changed by the user by setting PERL_HTTP_T=
INY_SSL_INSECURE_BY_DEFAULT=3D1<br>
&gt; +-&nbsp;&nbsp;&nbsp; return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT}=
 || '') eq '1') ? 0 : 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp; return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFA=
ULT} || '') eq '1') ? 0 : 1;<br>
&gt; + }<br>
&gt; +<br>
&gt; + sub _set_proxies {<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta/recipes-devtools/perl/perl_5.36.1.bb b/meta/recipes-=
devtools/perl/perl_5.36.1.bb<br>
&gt; index 3db1d9c6ae..87768cc7f7 100644<br>
&gt; --- a/meta/recipes-devtools/perl/perl_5.36.1.bb<br>
&gt; +++ b/meta/recipes-devtools/perl/perl_5.36.1.bb<br>
&gt; @@ -18,6 +18,8 @@ SRC_URI =3D &quot;<a href=3D""></a>https://www.cpan.=
org/src/5.0/perl-${PV}.tar.gz;name=3Dperl \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://determinism.patch">file://determinism.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-dete=
rm.patch">
file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-31484.patch">file://CVE-2023-31484.patch</a> \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-31486-0001.patch">file://CVE-2023-31486-0001.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-31486-0002.patch">file://CVE-2023-31486-0002.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; SRC_URI:append:class-native =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://perl-configpm-switch.patch">file://perl-configpm-switch=
.patch</a> \<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt;<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184250): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184250">
https://lists.openembedded.org/g/openembedded-core/message/184250</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10013468=
5/3617179">
https://lists.openembedded.org/mt/100134685/3617179</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alexandre.bel=
loni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397E1209B8354C5DFCD01DF8138ABYAPR11MB3397namp_--

