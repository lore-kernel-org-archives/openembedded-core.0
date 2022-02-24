Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF120C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 18:39:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.403.1645727957137744413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=CLTjY9pc;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21OGmfax026156
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:39:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=gpTrCdqAe/777/DL6s4TzmMd6V8+e19rs1sWYOhbvqs=;
 b=CLTjY9pcAc1Stqd0siOXRyA6w6cETIsUifJbD36PII77PrF5w4yG09Ccvd8mymwZ/Ocm
 Gg/UqMvYOuw6/+59hxaLbBPHSKzWHMoJLMUZR/WrnjI7fCo9zjwM1Ejtdi1b/JlkKk6E
 T8kUUBAfLR2X9DxqZF1YJSQK9di5La0WRG1UZFGMQSoiGmmEUevoTgXW5FiCYn2h7iwU
 /izwYnU/AjxxhXEFtH0ZYU6zSX+tE8STqCmqagJWtVoPA608DADLGOHj8UND7THxSPiu
 6ks09Bf0DaIF69AjcPVYfwGg2i6iU9xbpNXa2Kfy3RJs8AfOF7DCrK7xG7Pu/qs6y/pJ Mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecs9uaqk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:39:16 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21OIaFTL022159
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:39:16 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecs9uaqk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Feb 2022 10:39:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYCbKXhwvcokTeNp3nBviK+1qIXspPBtBV9atFDb27XeBnsStouWuyU4EVjVCKtdkAVhuZ0rh2SFTpPs3fD6xYppnr3+QZEYarOhYFNe8LBMjgw8YnXLo3/BEKx7nWRAj3Lv3UezQbDJPFhlr+szod0ufaY1xQtoRh8aepQdxIFxfayjuu/17+U+uteU4hPp6aNKt3xAQCGdmyJ4mHiJePHmAd5HDb98s9biRrMs+iQi2fxe0XLu40uoiE9LZUS25ZKZWQPGOlM3a3ybFlicmhxfa7pngRfoALtAwQqMuLBoBw34pbOWSW7ac+dcP/ptMije9OXva1w8e0TNYN1D3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpTrCdqAe/777/DL6s4TzmMd6V8+e19rs1sWYOhbvqs=;
 b=jKglzj1DKRM5M5XeASxoesmzmdXuho0u0Xi3QaZJpCktbiLI+iw1LOOgHwwr2FdCSBevBnJOqocPoV8ApehGyFloHr0TZcMvo/Gaue4e0+JRFNcFj2hGbmkFH3WAr/5JX+zCov4SVRspqDxOPij+cvRWFy+bYPJWpm07OUBT4Ro6LHd7isGPYeSLwW6waAnNtbaCfp5P2wedIkt/T4loQLYAmsrUOyM3Fj5nvdNIeGxRHt81lru75jVj6TZCnqPY/xy9lpCIDUQ1/GHiDQP9HQ4zxoxf54pO5PNW5WPbKu5XvRPOCefOrbLxB03G9quOqPuiYUAe08tao62dL6zXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB3508.namprd11.prod.outlook.com (2603:10b6:208:73::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 18:39:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 18:39:11 +0000
Message-ID: <21ec7b20-4a10-f426-a279-19cec889a5e1@windriver.com>
Date: Thu, 24 Feb 2022 13:39:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v4] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        nathan@nathanrossi.com, vinay.m.engg@gmail.com
References: <20220224152240.133819-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220224152240.133819-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: DS7PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:8:57::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 153ed2ac-fdb5-42b3-a8da-08d9f7c4f2b0
X-MS-TrafficTypeDiagnostic: BL0PR11MB3508:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB35085CB6C17D885E733EC5C8F83D9@BL0PR11MB3508.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TfkzvJFShfySttJrNNeIvxbh8qZH0ue2ns0txRa9Lih5r09Yv4v1rJYuUMAJOoWZh9SgwrSjRkiD4C1WVqe1PBezlFlp/JOsD8pgzeyA/f4bpQbjexdVYmTf97CXIDlnMmwbDayeLEJ7WUA3IkuufuVtCJrMbgDtY6x/19xicmd7thAfKlSzXRWXV730MVuBZTllYlkGbe26pQYs63ITNQGTePkYlinlToIP1dVbSo1+Ve22FKzxCBs4w4oMdnnT1eEA2Cw616aSOTE5hGzmn30Akm+QGOeM2fg27wz9q5fWh8Q+286wNNH6mzHxyMGHCD6sgWbLKN496n/ZhpLPcmZdi4CBvyedla9bKSjz9VjOswT9YdqjNPCtzp2cKRqLSoggFlqNXMuf9yjjKz4PzBw8pXcuNCrlgZ/3KBRjv8zGusFl/VpzX+RsU7sTmfVlunc9B9LPN3iK6t/uzNcvMHoKwgX1GIwmn3ldzNlsZfe1ET1lIAliDML6tY7WSA5Oo/2HSpjLe9ADiT0bOORJ5F9Fz7r2aHZmmFrsgE0z+RxNdCNQqsEB8JX0gkWlVu20BfGB39Jz7f/Ir0tV9AeKEAi3Yj2hKbBmsACNlgaShtbBHB0kbHxYrAzzxqJL+xa5WaCLqsWjyy4SBPTYO+dmAtCii/aytnpXxR+8pciB0Oe9jw2JnTHO7yoldkjOK1UXMwQEmLmI8Af9pUiHQyHh3YZJPRGQFt6g0o5o4P/G85jOO+AbbKlNol8tSKyMyeWY+bkgges9okV2OzowveYcPPLVhBSiG1cZbhast3daB638cuz10rWhg2Pz1YCFJ7AOE88Y9gqOtlUelAh6vOktWGPtSl9lDYwFYyySrSH9gTaZpzvJoXCeOmL5sSXRfoo1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66556008)(5660300002)(86362001)(36756003)(66476007)(6506007)(8936002)(53546011)(6512007)(30864003)(31696002)(52116002)(66946007)(6486002)(508600001)(966005)(31686004)(4326008)(8676002)(6666004)(2906002)(26005)(83380400001)(2616005)(38350700002)(38100700002)(186003)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Um10ZlliQ0hMTmE1eCtNNnd3NXhGUDZHVXNYaVFib1p3bDBaZHdvWlhqL1Fi?=
 =?utf-8?B?aFBZckcra3J4YmV2MUp1dzlKMC9Ra2ptQmJiQXkxbi9LY3grNXM4ZHo0enZS?=
 =?utf-8?B?UXY4TFlteUo3Rms0QzdIQ0srTEh2SlpzcFlwOVdCcVFOSlNwVDZOMmZKZHdF?=
 =?utf-8?B?RjBuWVl4UkoxYTJwRGIvRE9JcDRnOWl5b3VpdCtkZkxIZWxzOTdES240akcr?=
 =?utf-8?B?WjRiL0ljeVJydnl0dzM3KzVEeVM5aUlmZEZJWFhFZHVxNGd6Z3JXMHJYa0xn?=
 =?utf-8?B?ZnEzYXhWRlh1eHVFN1BOMkY3LzVHUG14dGcxM0F2OHNMdWFyN1RXT3NkK0xr?=
 =?utf-8?B?QkwxaEhPd2xHcDA4Nk9raGpqQTJ2b0ZJT0RFNHpKbFdGZkRWT0Nnb29SSnNR?=
 =?utf-8?B?YThZSzR6UTJxNjlvUmVyRjBxRWRybnBqL0wrN2lyV2YvaTNxbTU0TmhvSHJT?=
 =?utf-8?B?bUI0QUZQdklYMzJ4aWR5OU5yWjBzaVQ0RTB4aTducGVCVmJZd00zb3R5MTRB?=
 =?utf-8?B?N1lPbkVrZ0JLbEM3NDJibitKYmVBTXM2dnFtenIwVllaaXpTYU9zVk1ON0Nh?=
 =?utf-8?B?Z0lha2dYTmRaSlZnN2lSTkh6cFRRZ0JSbWJqSk8vTlFCeHI4QlFCZDlmOFdQ?=
 =?utf-8?B?UFkydFI3cDk2cVBuakFJOUJPaXpRTVNlcURkdUJaQTBEblNiMWRkbWdudUVr?=
 =?utf-8?B?ejJoa2FEcE5QYzBKVHNaUlRoazJtLzJhQmhod0ZyM3R5RzY1OFdvOTFHYXQ5?=
 =?utf-8?B?b3M1R1F2QnlESDJFdStGNFJFdElvWFhxZlo4OGdXcXY0VEkwWDI5NkRycWNH?=
 =?utf-8?B?TFVPeDZlYzJIenZZemhPV0t4cm92SGNwS3MwWGJWMUZLWjhTZnJLTWlTWVp2?=
 =?utf-8?B?NytxQ2drb2FnTG15THYwU1l6cXRnbXhNWWVERlJBOStMeUpnTzBJaXdGbk5P?=
 =?utf-8?B?cjRyVWFrdEFWM1I2c3g1ZUZxbjBPc2QwREhrdFZuSUdWb3kvY0FPRGRUWGxx?=
 =?utf-8?B?MVFRR2FDOHRPbStQZnQ3VVdUY3o3UzgwYzljeHdEREg0c0hwMUtKRDBOYWpM?=
 =?utf-8?B?dWtuVzJRbVNKMmR5MjFWdXVNU082MWFHWGJXTlN5WXcvb3pEaXdiL1NyZWwv?=
 =?utf-8?B?aU03UGVHd2IrVzNkVTgwVTRSSlo2SnIrSHgrcWhpczlhRzZGWjlZQk5nVzhC?=
 =?utf-8?B?UGNibkw2VUtXYWFzbE9lQ01sbDZzNkJDeDEySXZYL0tZeXpnTmJXUWVHZWk1?=
 =?utf-8?B?OGg1NnBuWENUdENSK2NackFMQVpBeVQyeG1yTnRBc2RSSFI3dXErdzExZnRH?=
 =?utf-8?B?WFI3cVB5NHltRC9pcjI2M1dSYm8vNWZ3ck9DY3pRcFVUYUpxWEtQVHIxNEJk?=
 =?utf-8?B?N212M2hJbzk4ZFlvZHBWQ2VOK0svaVBVeWZzOW1YZTk1Sjh5anN4QmZneTV5?=
 =?utf-8?B?NHZQTlp6Wm91YnJ2WXZoYmF4RzlLRG1UVTEycU1yWm1BZDV3QjZuc2xtaUVT?=
 =?utf-8?B?OWVOOCsxY1R3cFVlRnlxZnhTRDN5L2IrSU1WbzlrNzh2a2ZBUjl2Qk9EVjRq?=
 =?utf-8?B?RENOZnlFeWI2N3hVZ0dFLzZsN0p2VWVZWlYxZDlWQW9JZ3VTNENSNnNEaCs3?=
 =?utf-8?B?Z3Q5MEdtcFZweVBYQ3pvNmgybTNhRWQwd2llNGZldnNSbkNuazVSTE4wRlhD?=
 =?utf-8?B?VkhhTXZpVWo5b3JjbnNydnVzRWFyNlpyc2Z4NitYb1prZ1V5dkJHS3czbDVM?=
 =?utf-8?B?WXJyL1VwWTd6Y3BkckNKTHh0bHY3UkU3cGh4cjBKdkZMTnpScmtSOEF2czVN?=
 =?utf-8?B?Q1B0MkRGR0tvc3EyRVRlTk9DSyt2dlEvd2M5Q05CamxlV1VycGozWHE1S3NM?=
 =?utf-8?B?L2srNGJRR1Y2ekhQVVp0YkhFelZycGlxc1pSZjI5bWswUFNDait3Y0RtYWlW?=
 =?utf-8?B?WkF6NitjN0NBVUpGcVV0a2lDNmVWSC8wN3RXV1FuaTZsTG82UmQyVFpHTTF1?=
 =?utf-8?B?b2E5S1p2c1puUkw0c3hDWmZ1WWpwckF4b3dMK1BEa1JMVG4rOUU0bWZxVXNx?=
 =?utf-8?B?MktQaERGVXZ0L1FYeEJpdFNUam1ZQ0t4VFhGcStBdE5JcEZubjVOTGdXWmJi?=
 =?utf-8?B?N08yWDFiV0tVdlVIZFFhRDlnTGJTS2dHaVBkVDh0VjBxdzJCN2xXTitDRTdC?=
 =?utf-8?B?Y2FsTFovRUE5c1pxZlpsVzVUSHFqWEZ3S0J4YTdWKzdoNnRDWXNtQzlmZ2tJ?=
 =?utf-8?B?czFORFM3YnN1YXBKbE9KVVNhLytRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 153ed2ac-fdb5-42b3-a8da-08d9f7c4f2b0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 18:39:11.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uar2fqgsMhr2UaU8PGkf36CvKkwGcFs/aW6MNFizf5kFl8l6+KtFA7t89oyn9RGfM/e1Bff0YZCtwaYpoux5Oj1Ko6nu6rsBYRYktV0g/yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3508
X-Proofpoint-GUID: xmVQHES4btHZ0L3RSmtVQzAt4azzEn-b
X-Proofpoint-ORIG-GUID: fUHCE8VSbvIjmvVy2OEhrlnvd1QwsbAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202240105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21OGmfax026156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 18:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162329

On 2022-02-24 10:22, Pgowda wrote:
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py =
test.
> It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
>
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150

To give people some context for the tests, the output format is:

running 12415 tests
test [ui] ui/abi/stack-protector.rs#no-ssp ... ignored
test [ui] ui/abi/stack-protector.rs#ssp ... ignored
...
test [ui] ui/asm/x86_64/interpolated-idents.rs ... ok
test [ui] ui/asm/x86_64/bad-clobber-abi.rs ... ok
test [ui] ui/assign-imm-local-twice.rs ... ok

...


Filtering that:
$ rg "test \[" /tmp/oe-selftest-results-1-b.log | cut -d" " -f2 | uniq -c

 =C2=A0=C2=A0=C2=A0 133 [assembly]
 =C2=A0=C2=A0=C2=A0 305 [codegen]
 =C2=A0=C2=A0=C2=A0=C2=A0 42 [codegen-units]
 =C2=A0=C2=A0=C2=A0 150 [incremental]
 =C2=A0=C2=A0=C2=A0 166 [mir-opt]
 =C2=A0=C2=A0=C2=A0=C2=A0 70 [pretty]
 =C2=A0=C2=A0=C2=A0=C2=A0 17 [run-pass-valgrind]
 =C2=A0=C2=A0=C2=A0 485 [rustdoc]
 =C2=A0 12483 [ui]

and in alphabetical order, the overall summary is:

$ rg "test \[" /tmp/oe-selftest-results-1-b.log | cut -d" " -f2 | sort |=20
uniq -c

 =C2=A0=C2=A0=C2=A0 133 [assembly]
 =C2=A0=C2=A0=C2=A0 305 [codegen]
 =C2=A0=C2=A0=C2=A0=C2=A0 42 [codegen-units]
 =C2=A0=C2=A0=C2=A0 150 [incremental]
 =C2=A0=C2=A0=C2=A0 166 [mir-opt]
 =C2=A0=C2=A0=C2=A0=C2=A0 70 [pretty]
 =C2=A0=C2=A0=C2=A0=C2=A0 17 [run-pass-valgrind]
 =C2=A0=C2=A0=C2=A0 485 [rustdoc]
 =C2=A0 12483 [ui]

and expanding to get, not only the number of tests, but also the test=20
result:

$ rg "test \[" /tmp/oe-selftest-results-1-b.log | rg -v " should" | cut=20
-d" " -f2,5 | sort | uniq -c

 =C2=A0=C2=A0=C2=A0=C2=A0 29 [assembly] ignored
 =C2=A0=C2=A0=C2=A0 104 [assembly] ok
 =C2=A0=C2=A0=C2=A0=C2=A0 42 [codegen] ignored
 =C2=A0=C2=A0=C2=A0 263 [codegen] ok
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 [codegen-units] ignored
 =C2=A0=C2=A0=C2=A0=C2=A0 39 [codegen-units] ok
 =C2=A0=C2=A0=C2=A0 148 [incremental] ok
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 [mir-opt] ignored
 =C2=A0=C2=A0=C2=A0 163 [mir-opt] ok
 =C2=A0=C2=A0=C2=A0=C2=A0 70 [pretty] ok
 =C2=A0=C2=A0=C2=A0=C2=A0 17 [run-pass-valgrind] ok
 =C2=A0=C2=A0=C2=A0=C2=A0 71 [rustdoc] FAILED
 =C2=A0=C2=A0=C2=A0=C2=A0 56 [rustdoc] ignored
 =C2=A0=C2=A0=C2=A0 354 [rustdoc] ok
 =C2=A0=C2=A0=C2=A0=C2=A0 12 [ui] FAILED
 =C2=A0=C2=A0=C2=A0 150 [ui] ignored
 =C2=A0 12317 [ui] ok

Note the 'should' filter omits 10 tests that didn't fit my filter such as=
:
 =C2=A0 =C2=A0 =C2=A0 test [ui] ui/loud_ui.rs - should panic ... ok
that I didn't want to deal with.


I'm not sure if the FAILED tests should be skipped here but it looks=20
like it is failing:

Waiting at most 1000 seconds for login banner (02/22/22 16:22:35)
...
2022-02-22 16:51:41,986 - oe-selftest - INFO - Ran 1 test in 5121.707s
2022-02-22 16:51:41,986 - oe-selftest - INFO - FAILED
2022-02-22 16:51:41,986 - oe-selftest - INFO -=C2=A0 (failures=3D1)
2022-02-22 16:51:46,695 - oe-selftest - INFO - RESULTS:
2022-02-22 16:51:46,695 - oe-selftest - INFO - RESULTS -=20
rust.RustSelfTestSystemEmulated.test_rust: FAILED (5108.25s)
2022-02-22 16:51:46,706 - oe-selftest - INFO - SUMMARY:
2022-02-22 16:51:46,706 - oe-selftest - INFO - oe-selftest () - Ran 1=20
test in 5128.348s
2022-02-22 16:51:46,706 - oe-selftest - INFO - oe-selftest - FAIL -=20
Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D=
0)


Naveen,

Am I looking at the right log file? (=20
.../ngowda/.../oe-selftest/oe-selftest-results-1.log )

Also, when you have time, can you find out if the test that are=20
"ignored" in our environment
are also ignore when building natively?


Thanks for updating the commit log, it is better.


../Randy

> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignore=
d
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest environm=
ent
> to generate success of completing the testsuite.
>
> With Rust-1.54.0 only 4 test modules were excluded (rustc-main, tiny).
> However with Rustc-1.58.1 the following issue required excluding many m=
ore
> test modules.
> These tests can be included in Oe-selftest after fixing the issue.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> "build-st/tmp/work/core2-64-poky-linux/rust-testsuite/1.58.1-r0/
> rustc-1.58.1-src/build/bootstrap/debug/rustc -vV` (exit status: 101)
> --- stderr
> thread 'main' panicked at '
> kind: NotFound, message: "No such file or directory" }',
> src/bootstrap/bin/rustc.rs:175:37
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> It mentions that the rustc binary is not present inspite of it being pr=
esent.
>
> There are many tests in Rust which just checks the documents, formattin=
g,
> documentation etc. These tests can be ignored and not run as some FAILS
> most of the times.
>
> These tests work in parallel mode even in the skipped test mode as expe=
cted.
> Although the patch to disable tests is large, it is very simple in that=
 it
> only disables tests. When updating to a newer version of Rust, the patc=
h can
> usually be rebased in under a day.
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py          |  57 +
>   meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++
>   .../rust-testsuite/rust-oe-selftest.patch     | 995 +++++++++++++++++=
+
>   .../rust/rust-testsuite_1.58.1.bb             |   3 +
>   4 files changed, 1218 insertions(+)
>   create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-=
selftest.patch
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.58.1.b=
b
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> new file mode 100644
> index 0000000000..1379b09af1
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_va=
rs, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MA=
KE set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe =3D "rust-testsuite"
> +		bitbake("{} -c compile".format(recipe))
> +		builddir =3D get_bb_var("B", "rust-testsuite")
> +		# build core-image-minimal with required packages
> +		default_installed_packages =3D ["libgcc", "libstdc++", "libatomic", =
"libgomp"]
> +		features =3D []
> +		features.append('IMAGE_FEATURES +=3D "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format(" ".joi=
n(default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance
> +		with runqemu("core-image-minimal", runqemuparams =3D "nographic", qe=
muparams =3D "-m 512") as qemu:
> +			# Copy remote-test-server to image through scp
> +			ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"roo=
t")
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1=
-tools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command =3D '~/remote-test-server -v remote'
> +			sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=3D/dev=
/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qemu.ip, c=
ommand),
> +                                shell=3DFalse,
> +                                stdout=3Dsubprocess.PIPE,
> +                                stderr=3Dsubprocess.PIPE)
> +			# Get the values of variables.
> +			targetsys =3D get_bb_var("TARGET_SYS", "rust-testsuite")
> +			rustlibpath =3D get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite=
")
> +			tmpdir =3D get_bb_var("TMPDIR", "rust-testsuite")
> +
> +			# Exclude the test folders that error out while building
> +			# Need to fix these errors and include them for testing
> +			testargs =3D "--exclude src/test/rustdoc-json --exclude src/test/ru=
n-make-fulldeps --exclude src/tools/tidy --exclude src/tools/rustfmt --ex=
clude src/tools/rustdoc-themes --exclude src/tools/rust-demangler --exclu=
de src/tools/rls --exclude src/tools/miri --exclude src/tools/linkchecker=
 --exclude src/tools/expand-yaml-anchors --exclude src/tools/compiletest =
--exclude src/tools/clippy --exclude src/tools/cargotest --exclude src/to=
ols/cargo --exclude src/test/rustdoc-gui --exclude src/rustdoc-json-types=
 --exclude src/tools/rustdoc --exclude src/librustdoc --exclude src/doc/u=
nstable-book --exclude src/doc/rustdoc --exclude src/doc/rustc --exclude =
compiler/rustc --exclude library/panic_abort --exclude library/panic_unwi=
nd --no-doc --no-fail-fast --bless"
> +
> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttool=
s.
> +			cmd =3D " export PATH=3D%s/../bin:$PATH;" % rustlibpath
> +			cmd =3D cmd + " export PATH=3D%s/../bin/%s:%s/hosttools:$PATH;" % (=
rustlibpath, targetsys, tmpdir)
> +			cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rustlib;" % rustlibpat=
h
> +			# Trigger testing.
> +			cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
> +			cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s =
--target %s ;" % (builddir, testargs, targetsys)
> +			result =3D runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recip=
es-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..8d9068a61e
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,163 @@
> +SUMMARY =3D "Rust testing"
> +HOMEPAGE =3D "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
> +SECTION =3D "test"
> +LICENSE =3D "MIT | Apache-2.0"
> +
> +SRC_URI +=3D "file://rust-oe-selftest.patch;striplevel=3D1"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS +=3D "file-native"
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +S =3D "${RUSTSRC}"
> +
> +# Path of target specification file "target-poky-linux.json"
> +export RUST_TARGET_PATH=3D"${STAGING_LIBDIR_NATIVE}/rustlib"
> +
> +export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do =
their
> +# own vendoring.
> +CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
> +
> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> +# TCLIBC=3D"musl". Snapshots are always -unknown-linux-gnu
> +SNAPSHOT_BUILD_SYS =3D "${BUILD_ARCH}-unknown-linux-gnu"
> +setup_cargo_environment () {
> +    # The first step is to build bootstrap and some early stage tools,
> +    # these are build for the same target as the snapshot, e.g.
> +    # x86_64-unknown-linux-gnu.
> +    # Later stages are build for the native target (i.e. target.x86_64=
-linux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/co=
nfig
> +    printf "linker =3D '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/c=
onfig
> +}
> +
> +include rust-common.inc
> +
> +do_rust_setup_snapshot () {
> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.=
sh"; do
> +        "${installer}" --prefix=3D"${WORKDIR}/rust-snapshot" --disable=
-ldconfig
> +    done
> +
> +    # Need to use uninative's loader if enabled/present since the libr=
ary paths
> +    # are used internally by rust and result in symbol mismatches if w=
e don't
> +    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; the=
n
> +        for bin in cargo rustc rustdoc; do
> +            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set=
-interpreter ${UNINATIVE_LOADER}
> +        done
> +    fi
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
> +do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
> +
> +python do_configure() {
> +    import json
> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser
> +
> +    # toml is rather similar to standard ini like format except it lik=
es values
> +    # that look more JSON like. So for our purposes simply escaping al=
l values
> +    # as JSON seem to work fine.
> +
> +    e =3D lambda s: json.dumps(s)
> +
> +    config =3D configparser.RawConfigParser()
> +
> +    # [target.ARCH-poky-linux]
> +    target_section =3D "target.{}".format(d.getVar('TARGET_SYS', True)=
)
> +    config.add_section(target_section)
> +
> +    # Points to wrapper files which contain target specific compiler a=
nd linker commands.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")=
))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCL=
D}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for B=
UILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section =3D "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS=
', True))
> +    config.add_section(target_section)
> +
> +    # Wrapper scripts of build system.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}"))=
)
> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +
> +    # [llvm]
> +    config.add_section("llvm")
> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X8=
6"))
> +    config.set("llvm", "ninja", e(False))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of th=
e test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD=
}")))
> +
> +    # [build]
> +    config.add_section("build")
> +    config.set("build", "submodules", e(False))
> +    config.set("build", "docs", e(False))
> +
> +    rustc =3D d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> +    config.set("build", "rustc", e(rustc))
> +
> +    cargo =3D d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> +    config.set("build", "cargo", e(cargo))
> +
> +    config.set("build", "vendor", e(True))
> +
> +    if not "targets" in locals():
> +        targets =3D [d.getVar("TARGET_SYS", True)]
> +    config.set("build", "target", e(targets))
> +
> +    if not "hosts" in locals():
> +        hosts =3D [d.getVar("HOST_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot=
 knows
> +    # nothing about when trying to build some stage0 tools (like fabri=
cate)
> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True=
)))
> +
> +    with open("config.toml", "w") as f:
> +        config.write(f)
> +
> +    # set up ${WORKDIR}/cargo_home
> +    bb.build.exec_func("setup_cargo_environment", d)
> +}
> +
> +
> +rust_runx () {
> +    echo "COMPILE ${PN}" "$@"
> +
> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for=
 a
> +    # wide range of targets (not just TARGET). OE's settings for them =
will
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argum=
ent(d, '-j %d')} "$@" --verbose
> +}
> +
> +do_compile () {
> +
> +    rust_runx build src/tools/remote-test-server --target "${TARGET_SY=
S}"
> +}
> diff --git a/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest=
.patch b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> new file mode 100644
> index 0000000000..34a775ba79
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> @@ -0,0 +1,995 @@
> +Rust testsuite outputs error even on a single testcase failure.
> +Hence, some test runs are ignored as they fail with error messages.
> +
> +Upstream-Status: Inappropriate [Ignore the testcase that errors out]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +---
> +diff --git a/compiler/rustc_interface/Cargo.toml b/compiler/rustc_inte=
rface/Cargo.toml
> +--- a/compiler/rustc_interface/Cargo.toml	2022-01-20 09:48:08.00000000=
0 -0800
> ++++ b/compiler/rustc_interface/Cargo.toml	2022-02-22 04:07:46.53177693=
5 -0800
> +@@ -5,6 +5,7 @@ edition =3D "2021"
> +
> + [lib]
> + doctest =3D false
> ++test =3D false
> +
> + [dependencies]
> + libc =3D "0.2"
> +diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_in=
terface/src/tests.rs
> +--- a/compiler/rustc_interface/src/tests.rs	2022-01-20 09:48:08.000000=
000 -0800
> ++++ b/compiler/rustc_interface/src/tests.rs	2022-02-22 08:08:21.273533=
403 -0800
> +@@ -110,6 +110,7 @@ fn assert_non_crate_hash_different(x: &O
> +
> + // When the user supplies --test we should implicitly supply --cfg te=
st
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string()]).un=
wrap();
> +@@ -121,6 +122,7 @@ fn test_switch_implies_cfg_test() {
> +
> + // When the user supplies --test and --cfg test, don't implicitly add=
 another --cfg test
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test_unless_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string(), "--=
cfg=3Dtest".to_string()]).unwrap();
> +@@ -133,6 +135,7 @@ fn test_switch_implies_cfg_test_unless_c
> + }
> +
> + #[test]
> ++#[ignore]
> + fn test_can_print_warnings() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["-Awarnings".to_string()]=
).unwrap();
> +diff --git a/src/test/run-make/issue-36710/Makefile b/src/test/run-mak=
e/issue-36710/Makefile
> +--- a/src/test/run-make/issue-36710/Makefile	2022-01-20 09:48:09.00000=
0000 -0800
> ++++ b/src/test/run-make/issue-36710/Makefile	2022-02-22 05:54:47.47187=
9168 -0800
> +@@ -7,6 +7,7 @@
> + # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
> + # ignore-musl FIXME: this makefile needs teaching how to use a musl t=
oolchain
> + #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
> ++# ignore-stage1
> +
> + include ../../run-make-fulldeps/tools.mk
> +
> +diff --git a/src/test/rustdoc/async-move-doctest.rs b/src/test/rustdoc=
/async-move-doctest.rs
> +--- a/src/test/rustdoc/async-move-doctest.rs	2022-01-20 09:48:09.00000=
0000 -0800
> ++++ b/src/test/rustdoc/async-move-doctest.rs	2022-02-22 04:07:46.54777=
6389 -0800
> +@@ -1,5 +1,6 @@
> + // compile-flags:--test
> + // edition:2018
> ++// ignore-stage1
> +
> + // Prior to setting the default edition for the doctest pre-parser,
> + // this doctest would fail due to a fatal parsing error.
> +diff --git a/src/test/rustdoc/auto-traits.rs b/src/test/rustdoc/auto-t=
raits.rs
> +--- a/src/test/rustdoc/auto-traits.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/auto-traits.rs	2022-02-22 04:07:46.559775980 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:auto-traits.rs
> ++// ignore-stage1
> +
> + #![feature(auto_traits)]
> +
> +diff --git a/src/test/rustdoc/check-source-code-urls-to-def.rs b/src/t=
est/rustdoc/check-source-code-urls-to-def.rs
> +--- a/src/test/rustdoc/check-source-code-urls-to-def.rs	2022-01-20 09:=
48:09.000000000 -0800
> ++++ b/src/test/rustdoc/check-source-code-urls-to-def.rs	2022-02-22 04:=
07:46.563775844 -0800
> +@@ -1,6 +1,7 @@
> + // compile-flags: -Zunstable-options --generate-link-to-definition
> + // aux-build:source_code.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/comment-in-doctest.rs b/src/test/rustdoc=
/comment-in-doctest.rs
> +--- a/src/test/rustdoc/comment-in-doctest.rs	2022-01-20 09:48:09.00000=
0000 -0800
> ++++ b/src/test/rustdoc/comment-in-doctest.rs	2022-02-22 04:07:46.56777=
5708 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + // comments, both doc comments and regular ones, used to trick rustdo=
c's doctest parser into
> + // thinking that everything after it was part of the regular program.=
 combined with the librustc_ast
> +diff --git a/src/test/rustdoc/const-generics/const-generics-docs.rs b/=
src/test/rustdoc/const-generics/const-generics-docs.rs
> +--- a/src/test/rustdoc/const-generics/const-generics-docs.rs	2022-01-2=
0 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/const-generics/const-generics-docs.rs	2022-02-2=
2 04:07:46.567775708 -0800
> +@@ -1,5 +1,6 @@
> + // edition:2018
> + // aux-build: extern_crate.rs
> ++// ignore-stage1
> + #![crate_name =3D "foo"]
> +
> + extern crate extern_crate;
> +diff --git a/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs b/s=
rc/test/rustdoc/cross-crate-hidden-impl-parameter.rs
> +--- a/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs	2022-01-20=
 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/cross-crate-hidden-impl-parameter.rs	2022-02-22=
 04:07:46.567775708 -0800
> +@@ -1,4 +1,5 @@
> + // Issue #86448: test for cross-crate `doc(hidden)`
> ++// ignore-stage1
> + #![crate_name =3D "foo"]
> +
> + // aux-build:cross-crate-hidden-impl-parameter.rs
> +diff --git a/src/test/rustdoc/cross-crate-links.rs b/src/test/rustdoc/=
cross-crate-links.rs
> +--- a/src/test/rustdoc/cross-crate-links.rs	2022-01-20 09:48:09.000000=
000 -0800
> ++++ b/src/test/rustdoc/cross-crate-links.rs	2022-02-22 04:07:46.567775=
708 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:all-item-types.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/cross-crate-primitive-doc.rs b/src/test/=
rustdoc/cross-crate-primitive-doc.rs
> +--- a/src/test/rustdoc/cross-crate-primitive-doc.rs	2022-01-20 09:48:0=
9.000000000 -0800
> ++++ b/src/test/rustdoc/cross-crate-primitive-doc.rs	2022-02-22 04:07:4=
6.567775708 -0800
> +@@ -1,6 +1,7 @@
> + // aux-build:primitive-doc.rs
> + // compile-flags: --extern-html-root-url=3Dprimitive_doc=3D../ -Z uns=
table-options
> + // only-linux
> ++// ignore-stage1
> +
> + #![feature(no_core)]
> + #![no_core]
> +diff --git a/src/test/rustdoc/doctest-manual-crate-name.rs b/src/test/=
rustdoc/doctest-manual-crate-name.rs
> +--- a/src/test/rustdoc/doctest-manual-crate-name.rs	2022-01-20 09:48:0=
9.000000000 -0800
> ++++ b/src/test/rustdoc/doctest-manual-crate-name.rs	2022-02-22 04:07:4=
6.567775708 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + //! ```
> + //! #![crate_name=3D"asdf"]
> +diff --git a/src/test/rustdoc/edition-doctest.rs b/src/test/rustdoc/ed=
ition-doctest.rs
> +--- a/src/test/rustdoc/edition-doctest.rs	2022-01-20 09:48:09.00000000=
0 -0800
> ++++ b/src/test/rustdoc/edition-doctest.rs	2022-02-22 04:07:46.57177557=
1 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + /// ```rust,edition2018
> + /// #![feature(try_blocks)]
> +diff --git a/src/test/rustdoc/edition-flag.rs b/src/test/rustdoc/editi=
on-flag.rs
> +--- a/src/test/rustdoc/edition-flag.rs	2022-01-20 09:48:09.000000000 -=
0800
> ++++ b/src/test/rustdoc/edition-flag.rs	2022-02-22 04:07:46.575775435 -=
0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> + // edition:2018
> +
> + /// ```rust
> +diff --git a/src/test/rustdoc/elided-lifetime.rs b/src/test/rustdoc/el=
ided-lifetime.rs
> +--- a/src/test/rustdoc/elided-lifetime.rs	2022-01-20 09:48:09.00000000=
0 -0800
> ++++ b/src/test/rustdoc/elided-lifetime.rs	2022-02-22 04:07:46.57577543=
5 -0800
> +@@ -4,6 +4,7 @@
> + //
> + // Since Rust 2018 we encourage writing out <'_> explicitly to make i=
t clear
> + // that borrowing is occuring. Make sure rustdoc is following the sam=
e idiom.
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/external-macro-src.rs b/src/test/rustdoc=
/external-macro-src.rs
> +--- a/src/test/rustdoc/external-macro-src.rs	2022-01-20 09:48:09.00000=
0000 -0800
> ++++ b/src/test/rustdoc/external-macro-src.rs	2022-02-22 04:07:46.57577=
5435 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:external-macro-src.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/extern-html-root-url.rs b/src/test/rustd=
oc/extern-html-root-url.rs
> +--- a/src/test/rustdoc/extern-html-root-url.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/rustdoc/extern-html-root-url.rs	2022-02-22 04:07:46.575=
775435 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:-Z unstable-options --extern-html-root-url html_root=
=3Dhttps://example.com/override --extern-html-root-url no_html_root=3Dhtt=
ps://example.com/override
> ++// ignore-stage1
> + // aux-build:html_root.rs
> + // aux-build:no_html_root.rs
> + // NOTE: intentionally does not build any auxiliary docs
> +diff --git a/src/test/rustdoc/extern-impl-trait.rs b/src/test/rustdoc/=
extern-impl-trait.rs
> +--- a/src/test/rustdoc/extern-impl-trait.rs	2022-01-20 09:48:09.000000=
000 -0800
> ++++ b/src/test/rustdoc/extern-impl-trait.rs	2022-02-22 04:07:46.575775=
435 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:extern-impl-trait.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/hide-unstable-trait.rs b/src/test/rustdo=
c/hide-unstable-trait.rs
> +--- a/src/test/rustdoc/hide-unstable-trait.rs	2022-01-20 09:48:09.0000=
00000 -0800
> ++++ b/src/test/rustdoc/hide-unstable-trait.rs	2022-02-22 04:07:46.5757=
75435 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:unstable-trait.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> + #![feature(private_trait)]
> +diff --git a/src/test/rustdoc/inline_cross/add-docs.rs b/src/test/rust=
doc/inline_cross/add-docs.rs
> +--- a/src/test/rustdoc/inline_cross/add-docs.rs	2022-01-20 09:48:09.00=
0000000 -0800
> ++++ b/src/test/rustdoc/inline_cross/add-docs.rs	2022-02-22 04:07:46.57=
5775435 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:add-docs.rs
> ++// ignore-stage1
> +
> + extern crate inner;
> +
> +diff --git a/src/test/rustdoc/inline_cross/default-trait-method.rs b/s=
rc/test/rustdoc/inline_cross/default-trait-method.rs
> +--- a/src/test/rustdoc/inline_cross/default-trait-method.rs	2022-01-20=
 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/inline_cross/default-trait-method.rs	2022-02-22=
 04:07:46.575775435 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:default-trait-method.rs
> ++// ignore-stage1
> +
> + extern crate foo;
> +
> +diff --git a/src/test/rustdoc/inline_cross/impl_trait.rs b/src/test/ru=
stdoc/inline_cross/impl_trait.rs
> +--- a/src/test/rustdoc/inline_cross/impl_trait.rs	2022-01-20 09:48:09.=
000000000 -0800
> ++++ b/src/test/rustdoc/inline_cross/impl_trait.rs	2022-02-22 04:07:46.=
575775435 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:impl_trait_aux.rs
> + // edition:2018
> ++// ignore-stage1
> +
> + extern crate impl_trait_aux;
> +
> +diff --git a/src/test/rustdoc/inline_cross/macros.rs b/src/test/rustdo=
c/inline_cross/macros.rs
> +--- a/src/test/rustdoc/inline_cross/macros.rs	2022-01-20 09:48:09.0000=
00000 -0800
> ++++ b/src/test/rustdoc/inline_cross/macros.rs	2022-02-22 04:07:46.5757=
75435 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:macros.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + #![feature(macro_test)]
> +
> +diff --git a/src/test/rustdoc/inline_cross/trait-vis.rs b/src/test/rus=
tdoc/inline_cross/trait-vis.rs
> +--- a/src/test/rustdoc/inline_cross/trait-vis.rs	2022-01-20 09:48:09.0=
00000000 -0800
> ++++ b/src/test/rustdoc/inline_cross/trait-vis.rs	2022-02-22 04:07:46.5=
87775026 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:trait-vis.rs
> ++// ignore-stage1
> +
> + extern crate inner;
> +
> +diff --git a/src/test/rustdoc/inline_cross/use_crate.rs b/src/test/rus=
tdoc/inline_cross/use_crate.rs
> +--- a/src/test/rustdoc/inline_cross/use_crate.rs	2022-01-20 09:48:09.0=
00000000 -0800
> ++++ b/src/test/rustdoc/inline_cross/use_crate.rs	2022-02-22 04:07:46.5=
87775026 -0800
> +@@ -3,6 +3,7 @@
> + // build-aux-docs
> + // edition:2018
> + // compile-flags:--extern use_crate --extern use_crate_2
> ++// ignore-stage1
> +
> + // During the buildup to Rust 2018, rustdoc would eagerly inline `pub=
 use some_crate;` as if it
> + // were a module, so we changed it to make `pub use`ing crate roots r=
emain as a `pub use` statement
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs =
b/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs	2022-01=
-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/additional_doc.rs	2022-02=
-22 04:07:46.587775026 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:additional_doc.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + extern crate my_rand;
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/basic.rs b/src/tes=
t/rustdoc/intra-doc/cross-crate/basic.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/basic.rs	2022-01-20 09:48=
:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/basic.rs	2022-02-22 04:07=
:46.587775026 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:intra-doc-basic.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + // from https://github.com/rust-lang/rust/issues/65983
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/crate.rs b/src/tes=
t/rustdoc/intra-doc/cross-crate/crate.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/crate.rs	2022-01-20 09:48=
:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/crate.rs	2022-02-22 04:07=
:46.587775026 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:intra-link-cross-crate-crate.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![crate_name =3D "outer"]
> + extern crate inner;
> + // @has outer/fn.f.html '//a[@href=3D"../inner/fn.g.html"]' "crate::g=
"
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/hidden.rs b/src/te=
st/rustdoc/intra-doc/cross-crate/hidden.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/hidden.rs	2022-01-20 09:4=
8:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/hidden.rs	2022-02-22 04:0=
7:46.587775026 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:hidden.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + // tests https://github.com/rust-lang/rust/issues/73363
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/macro.rs b/src/tes=
t/rustdoc/intra-doc/cross-crate/macro.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/macro.rs	2022-01-20 09:48=
:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/macro.rs	2022-02-22 04:07=
:46.587775026 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:macro_inner.rs
> + // aux-build:proc_macro.rs
> ++// ignore-stage1
> + // build-aux-docs
> + #![deny(broken_intra_doc_links)]
> + extern crate macro_inner;
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/module.rs b/src/te=
st/rustdoc/intra-doc/cross-crate/module.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/module.rs	2022-01-20 09:4=
8:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/module.rs	2022-02-22 04:0=
7:46.591774889 -0800
> +@@ -1,6 +1,7 @@
> + // outer.rs
> + // aux-build: module.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> + extern crate module_inner;
> + // @has 'module/bar/index.html' '//a[@href=3D"../../module_inner/trai=
t.SomeTrait.html"]' 'SomeTrait'
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs=
 b/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs	2022-0=
1-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/submodule-inner.rs	2022-0=
2-22 04:07:46.591774889 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:submodule-inner.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + extern crate a;
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs=
 b/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs	2022-0=
1-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/submodule-outer.rs	2022-0=
2-22 04:07:46.591774889 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:submodule-outer.rs
> + // edition:2018
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + extern crate bar as bar_;
> +diff --git a/src/test/rustdoc/intra-doc/cross-crate/traits.rs b/src/te=
st/rustdoc/intra-doc/cross-crate/traits.rs
> +--- a/src/test/rustdoc/intra-doc/cross-crate/traits.rs	2022-01-20 09:4=
8:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/cross-crate/traits.rs	2022-02-22 04:0=
7:46.591774889 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:traits.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> +
> + extern crate inner;
> +diff --git a/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link=
.rs b/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs
> +--- a/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs	202=
2-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/extern-crate-only-used-in-link.rs	202=
2-02-22 04:07:46.591774889 -0800
> +@@ -1,5 +1,6 @@
> + // This test is just a little cursed.
> + // aux-build:issue-66159-1.rs
> ++// ignore-stage1
> + // aux-crate:priv:issue_66159_1=3Dissue-66159-1.rs
> + // aux-build:empty.rs
> + // aux-crate:priv:empty=3Dempty.rs
> +diff --git a/src/test/rustdoc/intra-doc/extern-crate.rs b/src/test/rus=
tdoc/intra-doc/extern-crate.rs
> +--- a/src/test/rustdoc/intra-doc/extern-crate.rs	2022-01-20 09:48:09.0=
00000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/extern-crate.rs	2022-02-22 04:07:46.5=
91774889 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:intra-link-extern-crate.rs
> ++// ignore-stage1
> +
> + // When loading `extern crate` statements, we would pull in their doc=
s at the same time, even
> + // though they would never actually get displayed. This tripped intra=
-doc-link resolution failures,
> +diff --git a/src/test/rustdoc/intra-doc/pub-use.rs b/src/test/rustdoc/=
intra-doc/pub-use.rs
> +--- a/src/test/rustdoc/intra-doc/pub-use.rs	2022-01-20 09:48:09.000000=
000 -0800
> ++++ b/src/test/rustdoc/intra-doc/pub-use.rs	2022-02-22 04:07:46.595774=
753 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build: intra-link-pub-use.rs
> ++// ignore-stage1
> + #![deny(broken_intra_doc_links)]
> + #![crate_name =3D "outer"]
> +
> +diff --git a/src/test/rustdoc/intra-doc/reexport-additional-docs.rs b/=
src/test/rustdoc/intra-doc/reexport-additional-docs.rs
> +--- a/src/test/rustdoc/intra-doc/reexport-additional-docs.rs	2022-01-2=
0 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/intra-doc/reexport-additional-docs.rs	2022-02-2=
2 04:07:46.595774753 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:intra-link-reexport-additional-docs.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![crate_name =3D "foo"]
> + extern crate inner;
> +
> +diff --git a/src/test/rustdoc/intra-doc-crate/self.rs b/src/test/rustd=
oc/intra-doc-crate/self.rs
> +--- a/src/test/rustdoc/intra-doc-crate/self.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/rustdoc/intra-doc-crate/self.rs	2022-02-22 04:07:46.595=
774753 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:self.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + extern crate cross_crate_self;
> +
> +diff --git a/src/test/rustdoc/issue-18199.rs b/src/test/rustdoc/issue-=
18199.rs
> +--- a/src/test/rustdoc/issue-18199.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-18199.rs	2022-02-22 04:07:46.595774753 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + #![doc(test(attr(feature(staged_api))))]
> +
> +diff --git a/src/test/rustdoc/issue-23106.rs b/src/test/rustdoc/issue-=
23106.rs
> +--- a/src/test/rustdoc/issue-23106.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-23106.rs	2022-02-22 04:07:46.595774753 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + /// ```
> + /// #
> +diff --git a/src/test/rustdoc/issue-23744.rs b/src/test/rustdoc/issue-=
23744.rs
> +--- a/src/test/rustdoc/issue-23744.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-23744.rs	2022-02-22 04:07:46.599774617 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + /// Example of rustdoc incorrectly parsing <code>```rust,should_panic=
</code>.
> + ///
> +diff --git a/src/test/rustdoc/issue-25944.rs b/src/test/rustdoc/issue-=
25944.rs
> +--- a/src/test/rustdoc/issue-25944.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-25944.rs	2022-02-22 04:07:46.599774617 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + /// ```
> + /// let a =3D r#"
> +diff --git a/src/test/rustdoc/issue-30252.rs b/src/test/rustdoc/issue-=
30252.rs
> +--- a/src/test/rustdoc/issue-30252.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-30252.rs	2022-02-22 04:07:46.599774617 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test --cfg feature=3D"bar"
> ++// ignore-stage1
> +
> + /// ```rust
> + /// assert_eq!(cfg!(feature =3D "bar"), true);
> +diff --git a/src/test/rustdoc/issue-38129.rs b/src/test/rustdoc/issue-=
38129.rs
> +--- a/src/test/rustdoc/issue-38129.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-38129.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + // This file tests the source-partitioning behavior of rustdoc.
> + // Each test contains some code that should be put into the generated
> +diff --git a/src/test/rustdoc/issue-40936.rs b/src/test/rustdoc/issue-=
40936.rs
> +--- a/src/test/rustdoc/issue-40936.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-40936.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,5 +1,6 @@
> + // aux-build:issue-40936.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/issue-43153.rs b/src/test/rustdoc/issue-=
43153.rs
> +--- a/src/test/rustdoc/issue-43153.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-43153.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,6 +1,7 @@
> + // Test that `include!` in a doc test searches relative to the direct=
ory in
> + // which the test is declared.
> +
> ++// ignore-stage1
> + // compile-flags:--test
> +
> + /// ```rust
> +diff --git a/src/test/rustdoc/issue-46727.rs b/src/test/rustdoc/issue-=
46727.rs
> +--- a/src/test/rustdoc/issue-46727.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-46727.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-46727.rs
> ++// ignore-stage1
> +
> + extern crate issue_46727;
> +
> +diff --git a/src/test/rustdoc/issue-48377.rs b/src/test/rustdoc/issue-=
48377.rs
> +--- a/src/test/rustdoc/issue-48377.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-48377.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + //! This is a doc comment
> + //!
> +diff --git a/src/test/rustdoc/issue-48414.rs b/src/test/rustdoc/issue-=
48414.rs
> +--- a/src/test/rustdoc/issue-48414.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-48414.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-48414.rs
> ++// ignore-stage1
> +
> + // ICE when resolving paths for a trait that linked to another trait,=
 when both were in an external
> + // crate
> +diff --git a/src/test/rustdoc/issue-53689.rs b/src/test/rustdoc/issue-=
53689.rs
> +--- a/src/test/rustdoc/issue-53689.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-53689.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-53689.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/issue-54478-demo-allocator.rs b/src/test=
/rustdoc/issue-54478-demo-allocator.rs
> +--- a/src/test/rustdoc/issue-54478-demo-allocator.rs	2022-01-20 09:48:=
09.000000000 -0800
> ++++ b/src/test/rustdoc/issue-54478-demo-allocator.rs	2022-02-22 04:07:=
46.607774344 -0800
> +@@ -13,6 +13,7 @@
> + // default setting, by leaving off `-C prefer-dynamic`.
> +
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + //! This is a doc comment
> + //!
> +diff --git a/src/test/rustdoc/issue-57180.rs b/src/test/rustdoc/issue-=
57180.rs
> +--- a/src/test/rustdoc/issue-57180.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-57180.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-57180.rs
> ++// ignore-stage1
> +
> + extern crate issue_57180;
> + use issue_57180::Trait;
> +diff --git a/src/test/rustdoc/issue-61592.rs b/src/test/rustdoc/issue-=
61592.rs
> +--- a/src/test/rustdoc/issue-61592.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-61592.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-61592.rs
> ++// ignore-stage1
> +
> + extern crate foo;
> +
> +diff --git a/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-typ=
e.rs b/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs
> +--- a/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs	20=
22-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs	20=
22-02-22 04:07:46.607774344 -0800
> +@@ -1,4 +1,5 @@
> + // Regression test for ICE #73061
> ++// ignore-stage1
> +
> + // aux-build:issue-73061.rs
> +
> +diff --git a/src/test/rustdoc/issue-75588.rs b/src/test/rustdoc/issue-=
75588.rs
> +--- a/src/test/rustdoc/issue-75588.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-75588.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,5 +1,6 @@
> + // aux-build:realcore.rs
> + // aux-build:real_gimli.rs
> ++// ignore-stage1
> +
> + // Ensure unstably exported traits have their Implementors sections.
> +
> +diff --git a/src/test/rustdoc/issue-85454.rs b/src/test/rustdoc/issue-=
85454.rs
> +--- a/src/test/rustdoc/issue-85454.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-85454.rs	2022-02-22 04:07:46.607774344 -0=
800
> +@@ -1,5 +1,6 @@
> + // aux-build:issue-85454.rs
> + // build-aux-docs
> ++// ignore-stage1
> + #![crate_name =3D "foo"]
> +
> + extern crate issue_85454;
> +diff --git a/src/test/rustdoc/issue-86620.rs b/src/test/rustdoc/issue-=
86620.rs
> +--- a/src/test/rustdoc/issue-86620.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/issue-86620.rs	2022-02-22 04:07:46.611774208 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:issue-86620-1.rs
> ++// ignore-stage1
> +
> + extern crate issue_86620_1;
> +
> +diff --git a/src/test/rustdoc/macro_pub_in_module.rs b/src/test/rustdo=
c/macro_pub_in_module.rs
> +--- a/src/test/rustdoc/macro_pub_in_module.rs	2022-01-20 09:48:09.0000=
00000 -0800
> ++++ b/src/test/rustdoc/macro_pub_in_module.rs	2022-02-22 04:07:46.6117=
74208 -0800
> +@@ -1,6 +1,7 @@
> + // aux-build:macro_pub_in_module.rs
> + // edition:2018
> + // build-aux-docs
> ++// ignore-stage1
> +
> + //! See issue #74355
> + #![feature(decl_macro, no_core, rustc_attrs)]
> +diff --git a/src/test/rustdoc/masked.rs b/src/test/rustdoc/masked.rs
> +--- a/src/test/rustdoc/masked.rs	2022-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/rustdoc/masked.rs	2022-02-22 04:07:46.611774208 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:masked.rs
> ++// ignore-stage1
> +
> + #![feature(doc_masked)]
> +
> +diff --git a/src/test/rustdoc/normalize-assoc-item.rs b/src/test/rustd=
oc/normalize-assoc-item.rs
> +--- a/src/test/rustdoc/normalize-assoc-item.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/rustdoc/normalize-assoc-item.rs	2022-02-22 04:07:46.611=
774208 -0800
> +@@ -2,6 +2,7 @@
> + // aux-build:normalize-assoc-item.rs
> + // build-aux-docs
> + // compile-flags:-Znormalize-docs
> ++// ignore-stage1
> +
> + pub trait Trait {
> +     type X;
> +diff --git a/src/test/rustdoc/no-stack-overflow-25295.rs b/src/test/ru=
stdoc/no-stack-overflow-25295.rs
> +--- a/src/test/rustdoc/no-stack-overflow-25295.rs	2022-01-20 09:48:09.=
000000000 -0800
> ++++ b/src/test/rustdoc/no-stack-overflow-25295.rs	2022-02-22 04:07:46.=
611774208 -0800
> +@@ -1,5 +1,6 @@
> + // Ensure this code doesn't stack overflow.
> + // aux-build:enum-primitive.rs
> ++// ignore-stage1
> +
> + #[macro_use] extern crate enum_primitive;
> +
> +diff --git a/src/test/rustdoc/primitive-reexport.rs b/src/test/rustdoc=
/primitive-reexport.rs
> +--- a/src/test/rustdoc/primitive-reexport.rs	2022-01-20 09:48:09.00000=
0000 -0800
> ++++ b/src/test/rustdoc/primitive-reexport.rs	2022-02-22 04:07:46.61577=
4071 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build: primitive-reexport.rs
> + // compile-flags:--extern foo --edition 2018
> ++// ignore-stage1
> +
> + #![crate_name =3D "bar"]
> +
> +diff --git a/src/test/rustdoc/process-termination.rs b/src/test/rustdo=
c/process-termination.rs
> +--- a/src/test/rustdoc/process-termination.rs	2022-01-20 09:48:09.0000=
00000 -0800
> ++++ b/src/test/rustdoc/process-termination.rs	2022-02-22 04:07:46.6157=
74071 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags:--test
> ++// ignore-stage1
> +
> + /// A check of using various process termination strategies
> + ///
> +diff --git a/src/test/rustdoc/pub-extern-crate.rs b/src/test/rustdoc/p=
ub-extern-crate.rs
> +--- a/src/test/rustdoc/pub-extern-crate.rs	2022-01-20 09:48:09.0000000=
00 -0800
> ++++ b/src/test/rustdoc/pub-extern-crate.rs	2022-02-22 04:07:46.6157740=
71 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:pub-extern-crate.rs
> ++// ignore-stage1
> +
> + // @has pub_extern_crate/index.html
> + // @!has - '//code' 'pub extern crate inner'
> +diff --git a/src/test/rustdoc/pub-use-extern-macros.rs b/src/test/rust=
doc/pub-use-extern-macros.rs
> +--- a/src/test/rustdoc/pub-use-extern-macros.rs	2022-01-20 09:48:09.00=
0000000 -0800
> ++++ b/src/test/rustdoc/pub-use-extern-macros.rs	2022-02-22 04:07:46.61=
5774071 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:pub-use-extern-macros.rs
> ++// ignore-stage1
> +
> + extern crate macros;
> +
> +diff --git a/src/test/rustdoc/reexport-check.rs b/src/test/rustdoc/ree=
xport-check.rs
> +--- a/src/test/rustdoc/reexport-check.rs	2022-01-20 09:48:09.000000000=
 -0800
> ++++ b/src/test/rustdoc/reexport-check.rs	2022-02-22 04:07:46.615774071=
 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:reexport-check.rs
> ++// ignore-stage1
> + #![crate_name =3D "foo"]
> +
> + extern crate reexport_check;
> +diff --git a/src/test/rustdoc/reexports-priv.rs b/src/test/rustdoc/ree=
xports-priv.rs
> +--- a/src/test/rustdoc/reexports-priv.rs	2022-01-20 09:48:09.000000000=
 -0800
> ++++ b/src/test/rustdoc/reexports-priv.rs	2022-02-22 04:07:46.615774071=
 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build: reexports.rs
> + // compile-flags: --document-private-items
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/reexports.rs b/src/test/rustdoc/reexport=
s.rs
> +--- a/src/test/rustdoc/reexports.rs	2022-01-20 09:48:09.000000000 -080=
0
> ++++ b/src/test/rustdoc/reexports.rs	2022-02-22 04:07:46.615774071 -080=
0
> +@@ -1,4 +1,5 @@
> + // aux-build: reexports.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/test_option_check/bar.rs b/src/test/rust=
doc/test_option_check/bar.rs
> +--- a/src/test/rustdoc/test_option_check/bar.rs	2022-01-20 09:48:09.00=
0000000 -0800
> ++++ b/src/test/rustdoc/test_option_check/bar.rs	2022-02-22 04:07:46.61=
5774071 -0800
> +@@ -1,5 +1,6 @@
> + // compile-flags: --test
> + // check-test-line-numbers-match
> ++// ignore-stage1
> +
> + /// This looks like another awesome test!
> + ///
> +diff --git a/src/test/rustdoc/test_option_check/test.rs b/src/test/rus=
tdoc/test_option_check/test.rs
> +--- a/src/test/rustdoc/test_option_check/test.rs	2022-01-20 09:48:09.0=
00000000 -0800
> ++++ b/src/test/rustdoc/test_option_check/test.rs	2022-02-22 04:07:46.6=
15774071 -0800
> +@@ -1,5 +1,6 @@
> + // compile-flags: --test
> + // check-test-line-numbers-match
> ++// ignore-stage1
> +
> + pub mod bar;
> +
> +diff --git a/src/test/rustdoc/trait-alias-mention.rs b/src/test/rustdo=
c/trait-alias-mention.rs
> +--- a/src/test/rustdoc/trait-alias-mention.rs	2022-01-20 09:48:09.0000=
00000 -0800
> ++++ b/src/test/rustdoc/trait-alias-mention.rs	2022-02-22 04:07:46.6157=
74071 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:trait-alias-mention.rs
> + // build-aux-docs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/trait-visibility.rs b/src/test/rustdoc/t=
rait-visibility.rs
> +--- a/src/test/rustdoc/trait-visibility.rs	2022-01-20 09:48:09.0000000=
00 -0800
> ++++ b/src/test/rustdoc/trait-visibility.rs	2022-02-22 04:07:46.6157740=
71 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:trait-visibility.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc/unit-return.rs b/src/test/rustdoc/unit-r=
eturn.rs
> +--- a/src/test/rustdoc/unit-return.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc/unit-return.rs	2022-02-22 04:07:46.615774071 -0=
800
> +@@ -1,4 +1,5 @@
> + // aux-build:unit-return.rs
> ++// ignore-stage1
> +
> + #![crate_name =3D "foo"]
> +
> +diff --git a/src/test/rustdoc-ui/cfg-test.rs b/src/test/rustdoc-ui/cfg=
-test.rs
> +--- a/src/test/rustdoc-ui/cfg-test.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/rustdoc-ui/cfg-test.rs	2022-02-22 07:18:00.609883317 -0=
800
> +@@ -5,6 +5,7 @@
> +
> + // Crates like core have doctests gated on `cfg(not(test))` so we nee=
d to make
> + // sure `cfg(test)` is not active when running `rustdoc --test`.
> ++// ignore-stage1
> +
> + /// this doctest will be ignored:
> + ///
> +diff --git a/src/test/rustdoc-ui/display-output.rs b/src/test/rustdoc-=
ui/display-output.rs
> +--- a/src/test/rustdoc-ui/display-output.rs	2022-01-20 09:48:09.000000=
000 -0800
> ++++ b/src/test/rustdoc-ui/display-output.rs	2022-02-22 07:18:57.687895=
503 -0800
> +@@ -2,6 +2,7 @@
> +
> + // check-pass
> + // edition:2018
> ++// ignore-stage1
> + // compile-flags:--test --test-args=3D--show-output
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> +diff --git a/src/test/rustdoc-ui/doc-test-doctest-feature.rs b/src/tes=
t/rustdoc-ui/doc-test-doctest-feature.rs
> +--- a/src/test/rustdoc-ui/doc-test-doctest-feature.rs	2022-01-20 09:48=
:09.000000000 -0800
> ++++ b/src/test/rustdoc-ui/doc-test-doctest-feature.rs	2022-02-22 07:19=
:22.643027677 -0800
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + // Make sure `cfg(doctest)` is set when finding doctests but not insi=
de
> + // the doctests.
> +diff --git a/src/test/rustdoc-ui/doctest-output.rs b/src/test/rustdoc-=
ui/doctest-output.rs
> +--- a/src/test/rustdoc-ui/doctest-output.rs	2022-01-20 09:48:09.000000=
000 -0800
> ++++ b/src/test/rustdoc-ui/doctest-output.rs	2022-02-22 07:20:01.753669=
019 -0800
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // check-pass
> ++// ignore-stage1
> +
> + //! ```
> + //! assert_eq!(1 + 1, 2);
> +diff --git a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs b/src/tes=
t/rustdoc-ui/doc-test-rustdoc-feature.rs
> +--- a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs	2022-01-20 09:48=
:09.000000000 -0800
> ++++ b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs	2022-02-22 07:19=
:44.946252681 -0800
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + #![feature(doc_cfg)]
> +
> +diff --git a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs b/src/=
test/rustdoc-ui/failed-doctest-compile-fail.rs
> +--- a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs	2022-01-20 09=
:48:09.000000000 -0800
> ++++ b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs	2022-02-22 07=
:20:16.185168104 -0800
> +@@ -5,6 +5,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // failure-status: 101
> ++// ignore-stage1
> +
> + /// ```compile_fail
> + /// println!("Hello");
> +diff --git a/src/test/rustdoc-ui/issue-91134.rs b/src/test/rustdoc-ui/=
issue-91134.rs
> +--- a/src/test/rustdoc-ui/issue-91134.rs	2022-01-20 09:48:09.000000000=
 -0800
> ++++ b/src/test/rustdoc-ui/issue-91134.rs	2022-02-22 07:20:32.008619125=
 -0800
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // edition:2021
> ++// ignore-stage1
> +
> + /// <https://github.com/rust-lang/rust/issues/91134>
> + ///
> +diff --git a/src/test/rustdoc-ui/nocapture.rs b/src/test/rustdoc-ui/no=
capture.rs
> +--- a/src/test/rustdoc-ui/nocapture.rs	2022-01-20 09:48:09.000000000 -=
0800
> ++++ b/src/test/rustdoc-ui/nocapture.rs	2022-02-22 07:20:58.839688819 -=
0800
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test -Zunstable-options --nocapture
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// println!("hello!");
> +diff --git a/src/test/rustdoc-ui/run-directory.rs b/src/test/rustdoc-u=
i/run-directory.rs
> +--- a/src/test/rustdoc-ui/run-directory.rs	2022-01-20 09:48:09.0000000=
00 -0800
> ++++ b/src/test/rustdoc-ui/run-directory.rs	2022-02-22 07:21:16.5910737=
11 -0800
> +@@ -6,6 +6,7 @@
> + // [incorrect]compile-flags:--test --test-run-directory=3D{{src-base}=
}/coverage -Zunstable-options
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// assert_eq!(
> +diff --git a/src/test/rustdoc-ui/test-no_std.rs b/src/test/rustdoc-ui/=
test-no_std.rs
> +--- a/src/test/rustdoc-ui/test-no_std.rs	2022-01-20 09:48:09.000000000=
 -0800
> ++++ b/src/test/rustdoc-ui/test-no_std.rs	2022-02-22 07:21:30.038607931=
 -0800
> +@@ -2,6 +2,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // check-pass
> ++// ignore-stage1
> +
> + #![no_std]
> +
> +diff --git a/src/test/rustdoc-ui/test-type.rs b/src/test/rustdoc-ui/te=
st-type.rs
> +--- a/src/test/rustdoc-ui/test-type.rs	2022-01-20 09:48:09.000000000 -=
0800
> ++++ b/src/test/rustdoc-ui/test-type.rs	2022-02-22 07:21:49.769924795 -=
0800
> +@@ -2,6 +2,7 @@
> + // check-pass
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// let a =3D true;
> +diff --git a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/sta=
ck-probes-lto.rs
> +--- a/src/test/ui/abi/stack-probes-lto.rs	2022-01-20 09:48:09.00000000=
0 -0800
> ++++ b/src/test/ui/abi/stack-probes-lto.rs	2022-02-22 21:46:34.09452123=
4 -0800
> +@@ -14,5 +14,6 @@
> + // ignore-pretty
> + // compile-flags: -C lto
> + // no-prefer-dynamic
> ++// ignore-stage1
> +
> + include!("stack-probes.rs");
> +diff --git a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-p=
robes.rs
> +--- a/src/test/ui/abi/stack-probes.rs	2022-01-20 09:48:09.000000000 -0=
800
> ++++ b/src/test/ui/abi/stack-probes.rs	2022-02-22 21:46:46.630088905 -0=
800
> +@@ -10,6 +10,7 @@
> + // ignore-wasm
> + // ignore-emscripten no processes
> + // ignore-sgx no processes
> ++// ignore-stage1
> +
> + use std::env;
> + use std::mem::MaybeUninit;
> +diff --git a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/t=
est/ui/macros/restricted-shadowing-legacy.rs
> +--- a/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-01-20 09:=
48:09.000000000 -0800
> ++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs	2022-02-22 04:=
07:46.619773935 -0800
> +@@ -74,6 +74,7 @@
> + // 62 |   Unordered   |   Unordered   |       =3D       |    +?    |
> + // 63 |   Unordered   |   Unordered   |       >       |    +?    |
> + // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
> ++// ignore-stage1
> +
> + #![feature(decl_macro, rustc_attrs)]
> +
> +diff --git a/src/test/ui/simd/target-feature-mixup.rs b/src/test/ui/si=
md/target-feature-mixup.rs
> +--- a/src/test/ui/simd/target-feature-mixup.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/ui/simd/target-feature-mixup.rs	2022-02-22 04:07:46.627=
773663 -0800
> +@@ -5,6 +5,7 @@
> +
> + // ignore-emscripten
> + // ignore-sgx no processes
> ++// ignore-stage1
> +
> + #![feature(repr_simd, target_feature, cfg_target_feature)]
> + #![feature(avx512_target_feature)]
> +diff --git a/src/test/ui-fulldeps/gated-plugin.rs b/src/test/ui-fullde=
ps/gated-plugin.rs
> +--- a/src/test/ui-fulldeps/gated-plugin.rs	2022-01-20 09:48:09.0000000=
00 -0800
> ++++ b/src/test/ui-fulldeps/gated-plugin.rs	2022-02-22 04:07:46.6277736=
63 -0800
> +@@ -1,4 +1,5 @@
> + // aux-build:empty-plugin.rs
> ++// ignore-stage1
> +
> + #![plugin(empty_plugin)]
> + //~^ ERROR compiler plugins are deprecated
> +diff --git a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs=
 b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
> +--- a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs	2022-0=
1-20 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs	2022-0=
2-22 04:07:46.627773663 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::default_hash_types)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_withou=
t_macro.rs b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_m=
acro.rs
> +--- a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro=
.rs	2022-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro=
.rs	2022-02-22 04:07:46.627773663 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::lint_pass_impl_without_macro)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs b/s=
rc/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs
> +--- a/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs	2022-01-20=
 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/internal-lints/pass_ty_by_ref.rs	2022-02-22=
 04:07:46.627773663 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::ty_pass_by_reference)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.=
rs b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
> +--- a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs	2022=
-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs	2022=
-02-22 04:07:46.627773663 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::usage_of_qualified_ty)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/=
src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
> +--- a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs	2022-01-2=
0 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs	2022-02-2=
2 04:07:46.627773663 -0800
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs b/=
src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
> +--- a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs	2022-01-2=
0 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs	2022-02-2=
2 04:07:46.635773390 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:lint-group-plugin-test.rs
> + // check-pass
> ++// ignore-stage1
> + // compile-flags: -D unused -A unused-variables
> +
> + fn main() {
> +diff --git a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.=
rs b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
> +--- a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs	2022=
-01-20 09:48:09.000000000 -0800
> ++++ b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs	2022=
-02-22 04:07:46.635773390 -0800
> +@@ -1,5 +1,6 @@
> + // aux-build:lint-group-plugin-test.rs
> + // compile-flags: -F unused -A unused
> ++// ignore-stage1
> +
> + fn main() {
> +     let x =3D 1;
> +diff --git a/src/test/ui-fulldeps/lint-pass-macros.rs b/src/test/ui-fu=
lldeps/lint-pass-macros.rs
> +--- a/src/test/ui-fulldeps/lint-pass-macros.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/ui-fulldeps/lint-pass-macros.rs	2022-02-22 04:07:46.635=
773390 -0800
> +@@ -1,5 +1,6 @@
> + // compile-flags: -Z unstable-options
> + // check-pass
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/multiple-plugins.rs b/src/test/ui-fu=
lldeps/multiple-plugins.rs
> +--- a/src/test/ui-fulldeps/multiple-plugins.rs	2022-01-20 09:48:09.000=
000000 -0800
> ++++ b/src/test/ui-fulldeps/multiple-plugins.rs	2022-02-22 04:07:46.635=
773390 -0800
> +@@ -1,5 +1,6 @@
> + // run-pass
> + // aux-build:multiple-plugins-1.rs
> ++// ignore-stage1
> + // aux-build:multiple-plugins-2.rs
> +
> + // Check that the plugin registrar of multiple plugins doesn't confli=
ct
> diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb b/meta=
/recipes-devtools/rust/rust-testsuite_1.58.1.bb
> new file mode 100644
> index 0000000000..d334231c8f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite_1.58.1.bb
> @@ -0,0 +1,3 @@
> +require rust-testsuite.inc
> +require rust-source.inc
> +require rust-snapshot.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162321): https://lists.openembedded.org/g/openembed=
ded-core/message/162321
> Mute This Topic: https://lists.openembedded.org/mt/89367044/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


