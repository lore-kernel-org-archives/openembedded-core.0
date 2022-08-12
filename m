Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCE2C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 12:59:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.10241.1660309181123764123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 05:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=b7kc3Tts;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5223864a9f=dragos.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27CCxdIq017911
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 05:59:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=3rQgjbXFw0/t5aziGWRfu0lSrxVDgIAfQsXpLzIBLxY=;
 b=b7kc3Tts2tSI8z7Ib/3BNZ3rjNREeSooJCgiBHL2KqOmkDz9x2Xx5EH7ib3UvswwL2Yf
 +PrYkuYbqABwOnAz1M0AXUL8a0JVfkuewGhVJYMBeimGPn5TYgmoGTktpJpdoAgiKwQw
 At8AWuUxzTENmTrT3pjBHEmplnRNLtq72SB5jf7wRwaMAsqc28L1Fl16MFQT1GGx4mQ7
 oZb9o8jdEuL5KcaUC0FmR+/mTXes3UzKuT6gmtUKzRGNyXR5MwL1VWQAlMtD/n9uerW0
 pxua9IcAsONKk04uDptKBtklM8FisEEtFWrC9npiiJAEQ1HMBSJRn62ugpaJfZifXtZT NA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqhs988s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 05:59:40 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CCxeFS017915
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 05:59:40 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqhs988r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 05:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVlvOPNkry/+xTWlUTA8ANAMluZnHPds3OKjRRmIoCbaWwLloZ2t3m+Z2Co4a5DyOlsrK4dhYmpTsvu3oT0/yv/p3egrVeXMuZ+NFrSOSouVpxYy9JcBFtxbR44rRrRllpKBU/U6nJd8cdFIBVO3CuZnad86uecq4W9qhjOn7VP0zU6JEjli67pkvmzcNT/1SgTGGfCJLKVt5RaiwQD8mNEIW2I73fIu2ytNg0v4OBG9WKvEoqTXX9tJr6DfBkfHiDy7JpGkT/AGu0hxMkxreWjSCqWy6Np4XKoWjSXxN9kIKzAwxDPF5aFDc542OGzviqpVBiSWhAI2GT0tcRarGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rQgjbXFw0/t5aziGWRfu0lSrxVDgIAfQsXpLzIBLxY=;
 b=lHWnl385ONc5yYXUrh+pturIoO9f+aZ9gFM3U4oFFOlvRV5OJrULsI0jUieHwAkmy9V8P75UAnn2Lbza2q63J1eB8iDwoQmQfSk0oIx/ovBbP7HKjBlGXPTHjNloC4enkQpTqqUZGgpTEiup0YLK9ACYwyP9JnurYWWbnMiUHExQT07GKqcpK9DWskTnhVevpaftDeKoIESTSaxN8PtytD9Y0+HMBYQvzn5wRMpwMuRpMPYZW22roPb3HDmOzxVlHbko+z9OPl3OLqaDtjQxL/bTLodzizmya6gNZ8NW3xK/sHvZgALWUwDApI3ngFRRbb2jT3qdjjeOR3Ib4+LVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 12:59:37 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a%6]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 12:59:36 +0000
Message-ID: <7ed692f7-cc83-9cf9-a278-e780be697c62@windriver.com>
Date: Fri, 12 Aug 2022 15:59:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH v2] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
Content-Language: en-US
To: Drew Moseley <drew.moseley@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, ch@denx.de
References: 
 <CAMKF1soSmZCBvJHYM4GPSUUjg9SY+ZuRuVC7phro1YryVadd4w@mail.gmail.com>
 <20220804150952.2831520-1-drew@moseleynet.net>
From: Dragos-Marian Panait <dragos.panait@windriver.com>
In-Reply-To: <20220804150952.2831520-1-drew@moseleynet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0274.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::41) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 343b6d42-a50f-4472-b2d6-08da7c62825f
X-MS-TrafficTypeDiagnostic: PH0PR11MB4855:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FLwynHsH+MJzezbWcIqR1/Hyw+mpf+zV3ZdyRCNp0W+Nf/w/NmC1vjqRnFo3Vwi/TT1IVPnjhplhGm7t3qv1nKoYMODFQXXcuvZ6R0OggjFno9lj4J84zwzFEeuTOhy8Eg7sRmtARlF3t/Y+9alN8aZL/ZpbSevId6W5XPGYcyrj1W0zTyNEYUibFuDbBGSBePheMUw4/ILh/lwqa8w2bKWhjF34e6HgroLSUCZV6Rwn4ASTgwfYYej/6FuqhDXZAUilCCBAcTGN341P+NxfuMWoyxqdkYJ+Nd7vje9Gtqsp1m0nf9hIqE6AcOM0u8djIPQsTwpidlWi3D25MInpLAdee46KiG/r3v5jsMbE8XXXDdGjkkCzP1mCiTGx5lKjvkzBkPhHpgELBFORYa5hWITpT78IRd0MASA9ZijeoD26SV+LgTLCxOkd9GE2Exo7Me66qktAOzbONsNkwracDb9gxqp9gXHlHGpwqd9j7S8ZIh7638+L3A+OmJX+K70QzoZMm1zhIwzykGwThu0n9YYFd7OVMBMW2faKDY1no3nWNTUX7ZO4v2FsZ9KXql8oD+JJh4R8K3gljH4sFXLTb1eJGrrKVrquWWqZJyuWEnU+Me5h47/CGoFJ17RWbiXG9Ac/wspVNpTZ4hw2Kjz2ryDVjf+agPEUd7JQNqLDEauZj4kh4jPR1JfxmDz4Gtb98d6sqz+LLvW+aJx27k76SK/zlzjFuCB4rexrij8EcjV1RnkNQQAqjL1vAZN3C37NddXSLnTVwnR6dP/c+QkQokBZ4CzA6XVS0SR0+9FfTtqs3IE/W/Cpxq43bk9/33yATRPb/lU7Tc61NcrQUi/rY0Eb7rpfYHxJfeepe/ODqqRuL0td2SeX/lIiwpeN3yr1f9F7pbJ95+hi/i9mc7EteQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(5660300002)(26005)(6512007)(8936002)(83380400001)(4326008)(186003)(2616005)(316002)(8676002)(38100700002)(38350700002)(66556008)(66476007)(66946007)(86362001)(41300700001)(6666004)(478600001)(31686004)(36756003)(966005)(31696002)(6486002)(53546011)(52116002)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eElwdXFaWXhNNWVHKzFaaEN3eGRlK1lSTUk0RzhWQ3BxajlDY0J3NTlwUnVF?=
 =?utf-8?B?TisxUXpHSEc3QlRvZUY3TnFTcEpxUE1vY3Q5dmE0SndPdzdwQmJZMktwdm1R?=
 =?utf-8?B?ME9kd2dHbHo1MU5WL3IxWEpxcSt2QTViRHM4OUxzbzBGWVdwcUN6cjNSMldG?=
 =?utf-8?B?eE10VGdUYW5kbFNVYk1PbnlKVVB2VnJneUpDdWRKeUlaYUhSbVZqVHA0RmxT?=
 =?utf-8?B?Q2pEV3ZqWExiVCtMdlFER1Y5d29PZU5ic3huVDFJMTVtTGZXRUxQRlJmdWJS?=
 =?utf-8?B?Ly9HRWo4TVJEWmo2V1VCdDQrWnFYMWREYWY5MmtPYlpQLy9tNEFKY24xSHYy?=
 =?utf-8?B?S1ZRUEN6eXNzdDhZdXlSN1l0aEFzV0Nhd010dW5hZTZZRkdpQWYxUytaQUZw?=
 =?utf-8?B?cnR0ZVdwbFpCSk5xVzhIQlFvVERLUE5TdG83WkZsak9vYXVNS09qNUJ1Z0J2?=
 =?utf-8?B?dStzOFRuUGZHZU4zeHMrZW9yWjlzUU9GTi9LWjZqMUtiZFgyOWR0T1lYYTBz?=
 =?utf-8?B?NHcvYllzNjlTckhEeUdKbzN4SVkvWnE3UjM5b1NERlp4RnlwNHJYRGJkdk96?=
 =?utf-8?B?d1BRMTBiWXhYOVY2clpQS3FiUUN3R3ZGTUk0THVVcXViTmN2d0ttYjRMUVFO?=
 =?utf-8?B?OVV3TFNlYmhUVk1ndnM2Z2NPdThoTDRkYjVWS2pzYVIzbGs5M0RuRnF1dkZq?=
 =?utf-8?B?dDl0djVicFBvWGFGc3pwU2szTFRZczA5Q0xkYzZXMXhyRVVzREJqS3ZXcjhw?=
 =?utf-8?B?aEpJNVcxaFlNYmc1ZzBldmU4TGZtYm45a0dWQTRaV1BJTUhQUWI3Z3V2bm40?=
 =?utf-8?B?VHpTZXRkdVVnY2hzVVNVM0Q3MkZxaG9XYXJzamVRYWpMRTcwT3g5QkpuRzF2?=
 =?utf-8?B?T05MemRyK1BHK2lUTllVMFJZcmN1bWVBbHoxcTFOSVJIVGg3R0lJbUQrQk1C?=
 =?utf-8?B?ZzRiUVM3MkNzQnVyVjFIYzhFay84cGFySTVjbTJFTmQzSEdaQ3g2NTVVYTBB?=
 =?utf-8?B?SWtTOHFlU3Q5blRWS1JHeDNVSUpYUUhBZWtMMzVyY0FFbmhCVTVrVWVhckhV?=
 =?utf-8?B?ckFqaGxGdzZaQ29QcVN0SlVOVWxJVnFLcUxuY3AzS1hWMW1zaGlCNkUyWU9O?=
 =?utf-8?B?L1NtaXMzQ2FDaFgrUWJsSmZGYWgrNE5ReWd0OVhMS29Jam04K0NHeFJKaU1v?=
 =?utf-8?B?WWxjUE5rM2dOaWdvNDlzR0hjNHFCMkM1SHhSNDhSQkVPQWpIV1NwNWYxS1ZV?=
 =?utf-8?B?VXhpK3VhZ2M0VG5xbW1PNEtVRVpncEZtRmNocURzTDlCMWs4Y0hWQnc5ZHJD?=
 =?utf-8?B?Y2ZnT0hFdnlLZG5BTXdKdTdHV2M1TVBYalBBMCtkczJVaXFpaE1ncnNzTkU5?=
 =?utf-8?B?b2hYU3hyMGVMRG5IRlROMi9hL2Q4cVZRYkU5Z014SWdydjNyNnVSNjZwUGRK?=
 =?utf-8?B?WUFhQjU4VG9EUWN1dEdhLzNIUThBR3ZLZTVNU3lUMWFidkZ2ZDY0ZWxnbCt1?=
 =?utf-8?B?aWY2R2wzQmZwVDdkOEpTWW1laGFLS2JrT0tlVFdmRWtCT0VQaWpLTHk5c043?=
 =?utf-8?B?cWVGa0Z3T2ZFYlk4SGhYVUMxWXJMamtKTXlLbGJJZmQ4NFpmaUpXV1YvenRW?=
 =?utf-8?B?R2ZDcEJ6MVBjVGJueDZpYzloNnAzVkpWVTV0QTRuWGpCeW5ZNU1PbU1zL0ZO?=
 =?utf-8?B?SDd2bTYrcVNmSGovSDB1UDYwUTFZNmM2eUpKWW5uQ0pVbnNiR1lZRDdZNnhO?=
 =?utf-8?B?OERoVXBhV2VaSjZHTnZ5U1dveVl0S1BJczNIOVJLRHlzNFozMm1MT3o4UEtI?=
 =?utf-8?B?Wng2SEdMek1HMDFRcnJVeDFIbUlnUzNFWlNrOE9CdDJSNDhxcjJjMUVyMGtG?=
 =?utf-8?B?T0diUUhST1VyVCtTM2xXbDY3RVBROUdYQzloUEw2ZXNKbkFud00wUzI3S3Qy?=
 =?utf-8?B?ZGprR0UrVldNZFR3MGREdnNYRFMrRzF2QlNIVnorZmZkbXRNWFc0eERzbVFq?=
 =?utf-8?B?ZTA5OHNJWUpNbXM2WVl5QTdCNmd1dDNuUGpTQjYyK25EcjNtSlJDbDNHU0tm?=
 =?utf-8?B?YjZleExnUGxLM1J1bngwWlhTbjJjYld0TEJvUlcxM1RNR29hd0VlUUhoY2xB?=
 =?utf-8?B?ZmloM1BNSkQ3SnB3dUlTd3RIZEliYWhpclpkcWcxbTcrdy9LUmFrUFJlOGtG?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 343b6d42-a50f-4472-b2d6-08da7c62825f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:59:36.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hXmgNIWnQ7qwcrknXi2x/F4xqwEpGXICkvzAV5TzzF6J4meoIaFZv/UXBQ9hCAJhVHQQ1rc47MY9tCzKiPS27zep3KY9t1Zrmb+DtiQ09NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
X-Proofpoint-GUID: 9KWmwXx1uT4CUF02aQA06IbxqgVxJDY_
X-Proofpoint-ORIG-GUID: Z1jBGKvdNj1ZWebfh6JhuiTA6_qLrEvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_08,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=993
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27CCxdIq017911
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 12:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169282

It seems that this change introduced a boot delay for qemux86-64 +=20
systemd build.

Steps:

git clone git://git.yoctoproject.org/poky
. poky/oe-init-build-env

add to conf/local.conf:

DISTRO_FEATURES:remove =3D " sysvinit"
DISTRO_FEATURES:append =3D " systemd"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED =3D ""

bitbake core-image-full-cmdline

Cause of boot delay:
[ TIME ] Timed out waiting for device /dev/hwrng.
[DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Daemon.

Regards,
Dragos

On 04.08.2022 18:09, Drew Moseley wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Drew Moseley <drew@moseleynet.net>
>
> The systemd-udev-settle service is listed as obsolete and does in
> some cases result in a significant boot time.  Replace that with a
> specific wait for the random source hardware device to be loaded.
>
> Before this change:
>
>     Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) =3D =
2min 17.262s
>     multi-user.target reached after 2min 8.153s in userspace
>
> After this change:
>
>     Startup finished in 3.956s (kernel) + 13.294s (userspace) =3D 17.25=
0s
>     multi-user.target reached after 9.522s in userspace
>
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/me=
ta/recipes-support/rng-tools/rng-tools/rngd.service
> index 568686e80e..0f50890dcb 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -3,7 +3,8 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=3Dno
>   After=3Dsystemd-udev-settle.service
>   Before=3Dsysinit.target shutdown.target
> -Wants=3Dsystemd-udev-settle.service
> +Requires=3Ddev-hwrng.device
> +After=3Ddev-hwrng.device
>   Conflicts=3Dshutdown.target
>
>   [Service]
> --
> 2.37.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168859): https://lists.openembedded.org/g/openembed=
ded-core/message/168859
> Mute This Topic: https://lists.openembedded.org/mt/92815243/6328324
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
dragos.panait@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

