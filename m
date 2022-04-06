Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D32C3527D
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4207.1649214498938300839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 20:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=iLMmdqUC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10952250d6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 23620qBp020820
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Apr 2022 20:08:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KEtznIElikkKRIETxc58poZ10SAjTGBVo4D7s6iYxRg=;
 b=iLMmdqUC3Ec/lbQiHUTAWvY6aJFAchs9H0pLYf4jXoqg4irOF0dk1mcldyAO7WycYuik
 K+SGxLcxSCRV12fswniNC4PAx05p5YfUPMSmWMbVpG0uDqzGX4jJJ7iSIxKl/K35CpFu
 vXqoASt1JWGRZ1cLyBLdaWUtYTebJG1SArB6i6w9I+b8iuj8A2bnhn/lqQ77XYj5Kn7G
 +WR51JE6uAW+oph6usluJcIiGh/2rEmMEsrUu+0LEmez4xpM+0mod+cLvMpByHCkq6ho
 38WFOt/+W9eVfOeDbfa3TgvR+9GbEXGoa3aqK7dDoS633NwfjqEfrE/hRONk/XjLZqf7 ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3tuah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 20:08:16 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23638Fxs007242
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Apr 2022 20:08:15 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3tuag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Apr 2022 20:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbb+OwwNz4gGKQjn73JVrI7g6vMnN4ZtbbWlT9E2MJTGdgsWU6AdBbkCzsjP0fzju0xZ57kH9fbYbk2vNa785F5V2O4NO85pfHVctihuRWMCts9Wd5T5bKkbA7yI3W6p0T2eA8ausjwQB9UGEwl2nUpu2RE1IHzcNEiwvs/mFes+6GtRKwxvbQpBq3I/tHzFiUj6BUlhEcZ2CJpDtCzYH5fxeFjMIlVjZ+xdeB2cSqoR/OU5BWREW1rQ5lw3uDnui0PAekqu6JYmQh+lcFvEKMUazwH1T2Y42hB3CO7uWsmE60SIogOW2QJj6JC9sGn4+/5C+WYE1RrkMQGY+XE0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEtznIElikkKRIETxc58poZ10SAjTGBVo4D7s6iYxRg=;
 b=QmMbyVDuFomOMrmTuEHbK9HzeFergcxHcWn/3VUSh0bN3E58je2jBW2AfqgbSkGecqxKMV7vmWP79e+8AvdK1qasuYO/S7NOELQJjT0euSltsDjMRHdJjKmTEmS2mve6AZgjgDIsU+EYbKLws82cLnSCJvTKUWi9T+g1UFvmCPvMq+bvRc/mMLgXrIEQdAVD/bVpvaORfQl2w/far6ItXJku8+geqQD0RqMzoQsgH4PKL1IbQa+jlUnvZGE82ZQyAJ0dG/qgjbm90JMsBKbBjYVsEsO0Xu2oeaHQF+ITRx/m9LbZ64Dw1PU8kZNug6aV9y74bnE7EW0A70kQQlEutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BYAPR11MB3781.namprd11.prod.outlook.com (2603:10b6:a03:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 03:08:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 03:08:11 +0000
Message-ID: <61ac8fdf-f8d9-8004-2282-73d13ed875b3@windriver.com>
Date: Wed, 6 Apr 2022 11:08:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] Added quotes around variables to prevent word
 splitting in the oe-init-build-env/oe-setup-builddir shell scripts.
Content-Language: en-US
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20220405171717.54715-1-abongwabonalais@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20220405171717.54715-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: HK2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:202::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f27f36c-cc85-45fe-cbe8-08da177aaee5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3781:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB378106B85E1033111BCDD0BAEDE79@BYAPR11MB3781.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s2zqFvUnZkwzoOa5USN+Z3/4+P46MWDfZz+sGVcDuJ8OmWLu0GysDin90WLzHVk5ncm3waJ0LuR5U9tygM+2x3JBM6lsstIOUOif5VkGgqmH55S9TA9a+R+AQqCweniiXBOCvYlhzUqXgTyBq6YmMwAbQYB501inEJ8BnsYpW3F+V0qR5QeVaFF2FGCv3QKAdvpJ8BMdsy0cGjIZ9XoJOfaGtuIKG883f/V/ztRKuoe7EuigSnv0sJvTx/HAHoqI0Gt19AdIUQdH+5Wq2PtGsxVNf6nP1u7blFWiNDoFyfsiLWoRG3rs1Raz7Qnxl0xXreUhiOxYdSNVTjkxHDSHdEsga5HlB5qu8xVh8YQIB1w885jYDM7OsJ+ZcRYA6i1TL1VhACMoTe0KX/qBvgjg9iU81OJQZiGb+ELBC6D/bqxX4GMKE16GR8ba7dSNg4qGzN5j3AwOQiIRX7yRT6enyM/mLt8YQohunIerIJ0wDJ9AfFRdFmZEtnjh+LlHf+uCwQahfNIo5asgW/1N8G9ld981luYnvB9f3rVWgc6CxVOXyBS0zxW2gxXmYM4JTdqu1MaK6w44ljEDATWGBnhkSstLgheGJS9xlXB4u1ivMpdlMiOZtJolTTq4/HuWJrkhPiXaQAVcOm+gO0uwMeH1GRMkhV7FBri5lUw9smrwI/x+3xyi7YlGkdVdTljlJVgANFersmySHKA9lrGxME1j44406MfB/3l+2yEEjVvG4T6whoJzLY+mVFfzKr4GDsJuKfLRPHHKEmzBV8odvD2HvDB2yMApM1dZOngdGCndAKxiWZ/D7nCIDquEH6yujsQ/SCJ12ApV1WFAtvHZgY1lAg9EQCU0lE/L4YaK/BFtZXayGNiR7fzYGtxHy7RnU5eP/z6VLVrXcG2kbXgnmQQUCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(6506007)(966005)(6486002)(2906002)(31696002)(86362001)(26005)(186003)(83380400001)(36756003)(53546011)(2616005)(31686004)(316002)(66946007)(66476007)(66556008)(6512007)(508600001)(8936002)(5660300002)(6666004)(8676002)(38350700002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UG51ZENBcUFkREdBQzVySklPQ1VSVUxDblNKaVdLTlJVZHpkM2NFeFZLOFNi?=
 =?utf-8?B?cTV5dk5ycGNWQVB2bjJWRWpHbkd4UVRJbzhGeldaVitjOVNNdkh4bXdpZVJD?=
 =?utf-8?B?V09CbDBsLzNKM0w5ZTZYcXI5cWNqSExJczZGSHRvVG5wRUJiZSt6eGY0eGZ6?=
 =?utf-8?B?MTh0aVFmaHNpSVJZei9jSW1uUENULzZEVkZ0QUc5OVVwYWEvREZFc09FWjFy?=
 =?utf-8?B?dnoyblRNcTA2Q201V1VqSWxSZzkwcGFGNHdkc1FVZzRDMDJhYzhDMGgzR29L?=
 =?utf-8?B?aWhvVFEzT3liaUEzeDliK1RORGY4OXJlWC9lV0pYbEtqZk16R3hxdzNjY2JR?=
 =?utf-8?B?TUQyT01xZWdoZzQrNmRlVTFDUlFvRWtDZVdvVlVLbnpSUzMraFJ6Y0RPd3BH?=
 =?utf-8?B?cGhrWDFvQTdLLzRoekhrL3g3OW5qcldNZEVlK0VTT29yUkxOS29tQ1JHcC9x?=
 =?utf-8?B?UmthdFVacCtESzRhbFl5ZFhMUFI1OUUvalFnRWRoSkNEcjQ5Y01MWlc2c3hv?=
 =?utf-8?B?MTA1YWlteERBVGpRQTFlMzBTVVM3ZTZCODdhNU5HSGJZMHZ5SUNvRWtya2l2?=
 =?utf-8?B?MTJiQW1wRVk0TC9SUWVXa1l2cUpodUlyb2laNnlNV2xtb1AxSURWdVdheGs2?=
 =?utf-8?B?YlNjN0hUV2w2K214cnNOcG96WGNranlwTm9XK2p5UWtwcHNRR2Z2c2MrWDNL?=
 =?utf-8?B?a0t5MzBSZEMwYStxQ0x0UVRxNXN5UzNKZW9iM29IOVNYaEVySTdOVndLSm1W?=
 =?utf-8?B?VFUyQmdpZ0dqVmZUYTczZG9uaURLUnVqUmI4Slc3cGNRYXl2UDZVaGthWmNp?=
 =?utf-8?B?dzlybFpRL2Y5Vjl3MGxESEFIMW9TWmxMVEpKbWtmMmtHSkNnUXJQQXRXTUpV?=
 =?utf-8?B?MTBHd3lMZzNFSDRLSnJUVFN4TERVNldPZDhNcWlTTlhETWF4bHV2MnZoaGwv?=
 =?utf-8?B?V1FiVTZmK0JyanViZkQ2K2JPY3JoQVlMQXpwWE5WWThHSnBHQzFUeWdPOUNE?=
 =?utf-8?B?eWhNdkxsMlYyL1M3eDRaYTkxWTVTTVU2MHk0Z1pxUFlOTDF2YjY5TGRlWHAx?=
 =?utf-8?B?Nld6KytqaWs0eHgxdlRsSitoSjM3N3l1bnR6RW9tU3g1OWIzYkUrYmdIWnAy?=
 =?utf-8?B?NHFaYldteGk2SUxKVG5OT0VyZnlrK3ZPRnppMmJNSEMrL2Rxdlp4M1VhZURo?=
 =?utf-8?B?MlRqbGs2THFKbVZGOGo5LzE3QUZPWGk3RDdPeHVzZ20rZ2N2alc3bTVrSjBS?=
 =?utf-8?B?SHpLczhIZE1yMk9mUFJnQk05b2NmTkc4MmpDclBLV3VGYkNxaXRwMDIvUTdK?=
 =?utf-8?B?M0Zsc1dYa0pUS1RRYjlWRmdkdW56blM3SG92SmRYV1pzMzFjeGRoMlFWSm9M?=
 =?utf-8?B?UXloVDVYMHZZWkFTbkVRQVE0ZUlvb1dSSEFGNVgvbnAxSDJkaUlTNHg1Z1Mr?=
 =?utf-8?B?RElvYXN2S01iUFh4Slh3WGUzV2t0UXJGTllnTDcveFpPTXR4Q1ZvbkVTZDdL?=
 =?utf-8?B?dmR1eDFyUG9YdDlnSlRIdVZHRkRZb2d6Z0xSUUxtOExVaVkyODB0V3NQd1JU?=
 =?utf-8?B?U2QzZmJBaVdLMEJRWkVKempDQ1o2MmRkTWxsODIzRER5SWNDMExrWkpuNmVL?=
 =?utf-8?B?SmpHaERMYkNmU1lLRllHdTQzMS8rS2crUzRQTWRSWW5INE13MUl2di9sYkw2?=
 =?utf-8?B?R3hnY0VQZWlyQ2IrWEQzOExvMWpBOVZjNlgvcTVFdWNGdzZ6ekFoWW9aVHJa?=
 =?utf-8?B?WGErNi9rd0hZaVdZY1hQY2NnMEwwdVRKZ1ZsamZoV05JeG9TcVNaZjJIZ2g0?=
 =?utf-8?B?NTRRRm5McTY3VWp2UnVyNERRUHdrcW9UYzBjbWZkaVh6VUR3R1JyTzJ5Kzd6?=
 =?utf-8?B?UHJaOHpBYjJKWUdHbGtGMU9VTkVGUVdDdldJbmZCdGpNdjhzTm1QSnp5VG9z?=
 =?utf-8?B?eEREN2ZyZG5ETS9HOGtqYWVGbE5BdUE0azA0UUZJVjhveHlSNi9jSkExSUZp?=
 =?utf-8?B?UEV1L1V4Z0t5Vk1DMlNFTC9jd1BnTXl6dVp5MzVDZ3pRNjZyOVhEM016endi?=
 =?utf-8?B?YlpXekMxakkrYzJrTGZ0MmhBNndzRFc1NlpYeDdzTi91dVJPZ3UxT01VbStz?=
 =?utf-8?B?SWoyQ0NIWHkvaGtpRmhIMWt1Uyt5VndRZ3pkZU1kUDB4RDl3b05KS0o1cVRE?=
 =?utf-8?B?ejdDRzhkQjJvTStVdmNUQmVpQWl3Q1REeUdlU1JTNk0yOFlSSkprUWI2WWd4?=
 =?utf-8?B?a045cjdUeTNMVzFHZ0p3ZUU5bnN3SmQ3WEdLV1MzVEc3MXRnNHErMDJXTVZH?=
 =?utf-8?B?R3pTYW8wZFJON3RPRjJyVHZjMS90ZEZuakJsZzh5a2NXYlEzamtZakdTQ3F1?=
 =?utf-8?Q?9LKV2J5YCB64Do/w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f27f36c-cc85-45fe-cbe8-08da177aaee5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 03:08:11.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mxWNktXALzdP+gzGqbk0MHV4xdJej1pbNLm6msu81DALOStx8VRB9r/puN7qXOvmE+f1YHGByiq/yGXmYiDJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3781
X-Proofpoint-GUID: Xjk5DaE439VJNqDnekfmJU3poVEfSwAP
X-Proofpoint-ORIG-GUID: Hj73VIzC9Zg3A7xqUHL615jaowbyNfPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_01,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204060010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23620qBp020820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164054

Whitespace is not a valid char in builddir. There's sanity check for=20
this in sanity.bbclass:
if val.find(' ') !=3D -1:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statu=
s.addresult("Error, you have a space in your %s=20
directory path. Please move the installation to a directory which=20
doesn't include a space since autotools doesn't support this." % checkdir=
)

Regards,
Qi

On 4/6/22 01:17, Abongwa Amahnui Bonalais wrote:
> Used shellcheck to add quotes to the variables. This is to make sure th=
at
> directories with names that have space between, such as "Desktop/projec=
ts/test repo/poky"
> will not be considered as 2 separate words. With this modification, run=
ning the command "source oe-init-build-env" will not give the error "bash=
: oe-init-build-env: No such file or directory"
>
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
>   oe-init-build-env         | 4 ++--
>   scripts/oe-setup-builddir | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 8c1bd54e57..38333ab858 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -42,8 +42,8 @@ fi
>   unset THIS_SCRIPT
>  =20
>   export OEROOT
> -. $OEROOT/scripts/oe-buildenv-internal &&
> -    TEMPLATECONF=3D"$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir |=
| {
> +. "$OEROOT"/scripts/oe-buildenv-internal &&
> +    TEMPLATECONF=3D"$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir=
 || {
>       unset OEROOT
>       return 1
>   }
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index d4ac074ad9..54048e62ec 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -42,7 +42,7 @@ if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
>       TEMPLATECONF=3D$(cat "$BUILDDIR/conf/templateconf.cfg")
>   fi
>  =20
> -. $OEROOT/.templateconf
> +. "$OEROOT"/.templateconf
>  =20
>   if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
>       echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
> @@ -79,7 +79,7 @@ example, select a different MACHINE (target hardware)=
. See conf/local.conf
>   for more information as common configuration options are commented.
>  =20
>   EOM
> -    cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
> +    cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
>       SHOWYPDOC=3Dyes
>   fi
>  =20
> @@ -100,7 +100,7 @@ EOM
>       # to replace it for compatibility.
>       sed -e "s|##OEROOT##|$OEROOT|g" \
>           -e "s|##COREBASE##|$OEROOT|g" \
> -        $OECORELAYERCONF > "$BUILDDIR/conf/bblayers.conf"
> +        "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
>       SHOWYPDOC=3Dyes
>   fi
>  =20
> @@ -125,5 +125,5 @@ fi
>   if [ -z "$OECORENOTESCONF" ]; then
>       OECORENOTESCONF=3D"$OEROOT/meta/conf/conf-notes.txt"
>   fi
> -[ ! -r "$OECORENOTESCONF" ] || cat $OECORENOTESCONF
> +[ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
>   unset OECORENOTESCONF
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164050): https://lists.openembedded.org/g/openembed=
ded-core/message/164050
> Mute This Topic: https://lists.openembedded.org/mt/90270943/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


