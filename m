Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51391C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:42:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8946.1642081375034015878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JUwK3STV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80122df73f=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20DBnQ0U017124
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:42:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=tgmH0HHxcva2NLEX3nmJrotptdy2kLXOy2dtVwk5DrQ=;
 b=JUwK3STVqRznrAkGxp+wXcEdNdVbLyNF3g1ao1BnBZE/9viXlj9prIJ7XQKt82A6MWvx
 WBtK/Epr6SImR7ETm7+PkTCdtjjM+QPbqWgP0pJW00xX2gJXLy8sGCa+AOklBZxYE9HO
 xSHrdsaTyE9vq8u06AbbzAKcTF9fG7YsXjx2l7HwCheG2y5B/7IWYgs/QXvTw1aZ967m
 lV1Vh1KplbcGWrMhAKGqpIFWuHHpuNs5csbvSP1F/P9euNXSPz6HQ20b/3GRsd8+HDaz
 RsT6CNszi4DhxOVofW9VMlsgsWtWqmMrrdHUWsY0YMa4ctlWNtXypcqncjCdlYbnO3Kn 8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy078u3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:42:54 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20DDcb53018128
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:42:53 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy078u3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jan 2022 05:42:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwMXqGNcvDwOxaWFCy0SG8vi4ZOo6FE0ZGDxWfWV7ePA1uqWfUpp78BbGAA17xEz4Bg9+tJTqNm5j/vyN2gCJdl6GAUfJUazwbDsSVcTfVBRcV5mgx05hOOIKJtWy6L/TnKzgqyA802sqTkrXvtFVqGNR6MbSAXOGIC3KUlEEJHqBdsrBIZm/LCUh2FFunOT+fKa3v6wHRbaW5pfjYE5XhOuDH4xxoSPCOObv4eJanYZJM9Fy1HrLXUuGN/L48rgFN5LX2nnQINJ/JrXxTzT/EOzgiAJfzbDnsSOP1uGQguLQnHBefcRRcKh932/KD6jJRdnXq1DYPLlmnYJPuvEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgmH0HHxcva2NLEX3nmJrotptdy2kLXOy2dtVwk5DrQ=;
 b=PA4WK9pEZVq2ygbxRl0LiWnC4eXRhLnEcp14iICPsmhe/TzymEs8rgUqsIL3hHViP+RQeC5J/j/wtC1tsQ32rW4g9dTiQC2V98M3VxFG73c/Btvl39jAZXe2fjZnZbTucv8CmVZKB/DYBaRDtCi4Wr58YFyTAvqdtOfARI8yOwjG3berFV4KPQUsd2vUtwIX/DSObjWhoVd6OJ+yQ0prxFgNNvwJWbTWfCR2G3ztu0Q4TAdtyUWKj1YPRDFTMaw2zZsxc/UVYEJU5wkeW+aW9PLp6ccqQGQtPPvnHiuBfsWoBg6jSSqxzLPeY3qM0scwDHmtJUhxm+K83eHDwCkLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MN2PR11MB4221.namprd11.prod.outlook.com (2603:10b6:208:18d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 13:42:48 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Thu, 13 Jan 2022
 13:42:48 +0000
Date: Thu, 13 Jan 2022 21:42:40 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
Message-ID: <YeAsUO/+g7Y6qkam@pek-khao-d2>
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
 <bc571d45ac0dc66bb9a3409b1215815ca369283f.camel@linuxfoundation.org>
 <CAMKF1soTS_EkdEf4ZzHd_QJjcs=161+L=Vq+btm4A4EYKpcXDg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YoT4i8HClSNqlOzl"
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1soTS_EkdEf4ZzHd_QJjcs=161+L=Vq+btm4A4EYKpcXDg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a869369-6bbd-4ad2-5f4a-08d9d69a960e
X-MS-TrafficTypeDiagnostic: MN2PR11MB4221:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4221A633E34100B1A01F3348E2539@MN2PR11MB4221.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PZwSQGqRl1wchxf8X+hH7oCh6rixMOtA3+umwkoFjyfuPXDT344WM0wzAwO0sqhHtHCLVTv5JkNNqOIYvLEsfSr4BceMlQVkWfloBl7nAZq64k/Sga6qjjGE+2JsIDFWi6zxJltck+ZO+yDKyPyiuXyRf61yqHpraXK8ygcDBShp8jUYr0QlXgQTqiA+2B2SGr8Nkn6gUja152/saXTRq4hyoRXYbtzLb72qn3qlYnVziSwl8aMkFB/a8vDlzUrBFsbsKROVqUHQIe4zSpzqAX0BohJqxFt64foPtZvvLU8v+Ue028unxdmXD1v9WjsPKNulFYtScjS6aXI4eWwbixJxb1Ipdh3n/mRvW3Slr0LSQ/Tc9ZBHZyz/mEZO/R8JNDqlwYx0IyE4UprFSDeXhT8eNVlw78vABNz/v3rFTNhwC8laUd2/zE/Hnfgh5EyGcAnhCsYx8f7zIXGXPF8pvhqGvkVsmavs3lhraXTpSbbxSb4qDONfZXFKefOCmKdDygXK9xA6twPusTFV4bOVYPBUVEwFqfVQkXZmjqe4ZIGawHua6pb99uBL4TtCge3cNs1eUO3eULZy0aBzYQT+IQ0AvF+EIPC7HZ/ztbDXoOrsBznEWHlFwLWddTwDPS/0ZXGJxRC7oDelDyu4knjGkfs7oAy6irfGGidGGuQ20TxH39erX5BpkEWvtBBuJh1GJtHjOi1PkczBB3lphyjAuKJ27HyzPg8MBX5q8CzvkFmCV1iy8qGcW2rEQRKqHl2kQChmBTCpasU6sJnrWT/28KSJKJRGflbSBmm8rctavRgXWS793L5Te6zqirykuE8Rvsil/1YgdfWQWpzJgAXxPSvGALI/73fTFdZ4JQneG2M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(8936002)(83380400001)(2906002)(9686003)(38100700002)(38350700002)(6512007)(8676002)(508600001)(6666004)(5660300002)(4326008)(52116002)(21480400003)(54906003)(66476007)(53546011)(44144004)(186003)(966005)(316002)(6506007)(66946007)(86362001)(33964004)(6916009)(66556008)(26005)(33716001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk9JWmVtN3NDVUh2STF4QmVvNDU2N3VTMUswTi9zMXJnWnZ0QXd0eS90eXZy?=
 =?utf-8?B?R3hsUE0zazd4TWhVcTFMenRaaUpCeUNPT2k5YVdLVmFVVjkrU08rUUhadFRL?=
 =?utf-8?B?YWNNNExVS2pBZnN4VGF5TjFyWHo2SEFpeUhNMUJaRUZnTjBOTkw5NnVzM0Rm?=
 =?utf-8?B?OTkvOU81QmM4dTIra0dsYVppQ0hITk9xdDZUak9HNmxqZHZ6UVZZY0tpT3NY?=
 =?utf-8?B?VXBaNDgvT3Uxb3ZIZldMT3FlZzM1SzNuVy9ETzZVUzE0MlIrS2V5T0pKaTA5?=
 =?utf-8?B?UWNpZUh4Nit6OGpYWS9nTDB2NHhOb2pqaFhXV0J5VnZhQnp3am9KT1ZwNlo1?=
 =?utf-8?B?RThIYVhuYkxYL2JENXVKc2l4ZXRJUzVMSk9YYTZEQnoxVHg3NnBhN2wrOWlO?=
 =?utf-8?B?VFNKaFdFMTBNUm5taWZhTUVNSUhyZUNGbWJGVUhNUWJmSFQ5OWZqRURMcjBm?=
 =?utf-8?B?MkVQeStZYjZ0eE5WUWNuVFNiYkM3VkxMVDRiQWlsQzF6VHArMnB1aUVycjlu?=
 =?utf-8?B?cmNHYmJBQk1JUnRGWU9lbjUxNnZOZ0gvR21CSUR2dXlpYjcxcHNaV1RXZEYr?=
 =?utf-8?B?cU8zclZHSnRENlQxQU5henNiamVPVW1QbHZCTm1KeEx6WjNCeUZEOGFWMlBG?=
 =?utf-8?B?VzhYRHJRTGcra2Q5N0NwSDdubHNMSVRUMTFWbVFUc0ppVmZLTUZOTTA1Tlc1?=
 =?utf-8?B?blB2L2hIUU1wMzR4aEFQWHR2YUg5TTNhSmpJQWdVNXhTQ0dJV2NrZ2pQN2VU?=
 =?utf-8?B?MktxbFlsbmFodlFib0cxMExrV1VLbkUxZkFDeWl4VzNWRE55bm9uTXlPYjVr?=
 =?utf-8?B?NFZSR2Q0SkY5Uk5aS00wMWphUEtpYStQbVBCZHhyVHpSOUVXTUNQZnJWUkw3?=
 =?utf-8?B?TFczN2tSRmZNVnpuLy91QkNxQVAwMFIvNE4xMjhtMUh4NGM1VWVIT0YwM1NU?=
 =?utf-8?B?ZXh0QStrb2NTNlJnYmpHaDRKa0k2aUJ5aG9na0xwQklsblhHdDNnUGN5bHps?=
 =?utf-8?B?azA3cUlFUitCemhUM0tHZXVFQkxSYXZKSktHUm92QXdDUE55QUpEeDBiMkk2?=
 =?utf-8?B?RFM3cjNlVFVWOWg4WDBRYTJNcUhXM0pkbU02cmFZVEdhQjRGaGdqOUtVWXMz?=
 =?utf-8?B?UENhQ2t4dlBpYUVlNmpjaENwYkNPRVU2TkZtSjQ5ZUxHWnl5QXV2bnhKMUdY?=
 =?utf-8?B?WlJlZG5qMXdGSDhmNmRSY2NuRnFwMzA4TWZWMjAyY0ZCSHR2S1F6dXVUb2xH?=
 =?utf-8?B?eFB1bXFzQzNudUlidThNemFucGZIS0tGc2Y5YUlQTjM4VWdjVTJTRGpuMG40?=
 =?utf-8?B?RHZwOHZLMGFpYUFFQWJCYUNRNW5RSTIwVmhkUG9QbVVPV3FqdU9qUitpaWEz?=
 =?utf-8?B?VzNPUHorVVgxaDEwT3ZWS2g1THYrbTFjSHNWTHBXNDBuT0VWaUN2OWZJUmVv?=
 =?utf-8?B?d0VxcFZrNTlEcGlrUlNzRFVBUTFUNjFyK2ZOSTJwaE9iRnEwSDlMdVB6SlVl?=
 =?utf-8?B?RHkrQ1ZCQXEvdWhWR1JnMCsyS2dpL2NUNlh6czRuQlBpWnBuV0NXajJmclZz?=
 =?utf-8?B?SExTaUxzR0doREtjWUp5R3JkR0xjWHJFQVdqajVhbEZ1TExKekpybHJwNzh6?=
 =?utf-8?B?a2U2TkRmQWJnaVlNUmlybTBFRWdYMVNoMG1abkEzN3FsMzhKeURMeUY0b0lS?=
 =?utf-8?B?NVorcytBRTlNNUJpSTVnRm90R2JEc2FIYTFqVlJnMFFZdDhxOXF4M0ZBdjdt?=
 =?utf-8?B?VjBObkFMVTQxM0MraHNKaTFHSnR5MUhGcHhiejVLYWRjc0swbGY2eHdLWEg5?=
 =?utf-8?B?bllnaXZpVHpqdlhXMlRZMzF4eDdGMVdBWXFoZlJKSWlPUVllVVBabk1uZk5Y?=
 =?utf-8?B?dW1vZDZZMFlSbWMrc05mcVNCTW9RMWN0dFRSQUVaWDJvemlzQWNmYnZVbWYr?=
 =?utf-8?B?Rk9yblJHb3h6eFM4ZjZ6T1BQQ28yVTR0ZG1OYjdkMnExK2JMdW5rY3FXUHRl?=
 =?utf-8?B?eEx2TVNSaGJYSHJ1TU93c1VzZ2hUVGFNL1dPRmZmLzJyNXFuWkpqRUYvZ2NH?=
 =?utf-8?B?Q0FFWXlNeGs2M3JtZUk2N1p5MUlVWThoNnArSCs2ZFRPV0V0aTF2KytUSHk5?=
 =?utf-8?B?Mk9qMnh6bnNSYjNoeWVTa1B5ajQreDEzREdHM3hHU0hwWDZvU1BxL2FnRVVv?=
 =?utf-8?Q?LG1NDzSYt64rZAnIDp/ZX6s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a869369-6bbd-4ad2-5f4a-08d9d69a960e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:42:48.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LM/xhJI/L4Gu54L7sNCnpe/SO+nwspltIMqaHiSnE4//qPjyfADfgL6RJOGnwR7ObDcPJs497a4KjfrKipicnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4221
X-Proofpoint-GUID: rh6Gbmdc9U7d5GkCPuti_8veBhe-dK4K
X-Proofpoint-ORIG-GUID: E513joCw4gcHUeDpLJl6CnEzw8WMSGaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 13:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160509

--YoT4i8HClSNqlOzl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 04:14:36PM -0800, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
>=20
>=20
> On Wed, Jan 12, 2022 at 1:58 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>=20
>     On Wed, 2022-01-12 at 14:23 -0500, Jon Mason wrote:
>     > On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao <kexin.hao@windriver.com>
>     wrote:
>     > >
>     > > The crc extension is optional for the ARMv8.0 but is mandatory fo=
r the
>     > > cortexa72, so there is no reason not to enable it for the cortexa=
72
>     > > tune. With this change, the cortexa72-crc seems redundant. But we
>     > > had better to keep it to be compatible with the BSP which already=
 used
>     > > that tune.
>     > >
>     > > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
>     >
>     > Acked-by: Jon Mason <jdmason@kudzu.us>
>     >
>     > From the GCC sources, it's hard coded for A34, A35, A53, A57, A72,
>     > A73, and almost all of the others listed.  I can patch the rest.
>=20
>     I did wonder if we should just drop the duplicate tune too. It will c=
ause
>     an
>     error but it is an error that should be quickly/easily fixed...
>=20
>=20
> I am good with that problem is only for bsp layers which support multiple
> releases with a single branch but I guess that=E2=80=99s something less o=
f a concern
> for me=20

OK, I will send a add-on patch to drop the cortexa72-crc tune.

Thanks,
Kevin

>=20
>=20
>=20
>     Cheers,
>=20
>     Richard
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#160501): https://lists.openembedded.org/g/
>     openembedded-core/message/160501
>     Mute This Topic: https://lists.openembedded.org/mt/88369540/1997914
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [
>     raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--YoT4i8HClSNqlOzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmHgLFAACgkQk1jtMN6u
sXHnRAf/cRbDEphah0zohw7uLIVtGETrajo873iRvi/SQaNOELSb4HegjFvjW0FP
CQYcNIcxSwkx6JFlSxXzvqLe0yt9aM9LngUmtHATlrw0f3a8ir6vD/wbu4BQP981
YX5bOzPOLjxWp0sUKh6jGjmbfYoKcraz01PlPQZzUTNVdHY8BRTuD/13SH4YE1iB
7yHnZ2JvzAPCHcUgElM+0fgyVnfZj0/5QF8OZJnDAkOh9XVmwq3uHUuJHOtLCy+z
/LLqbcxP+M5kvCSi4ZaGnR2oLl+8WnsOfTuYd1aGktgGBev1xTXjYF6d5+WGAC+g
BLjJTfrpaHHvTO5H7658CDps5BCGHw==
=eQV+
-----END PGP SIGNATURE-----

--YoT4i8HClSNqlOzl--

