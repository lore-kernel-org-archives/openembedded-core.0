Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A501CCA47B
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.87605.1657043390618046517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gfvT9gpF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4185742758=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 265GtumA027758
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 10:49:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VbWaFAfbitBsC/i1q2GI8R50Cdt4FlyEB8aR7cHP7xo=;
 b=gfvT9gpFJGuHboM+mwaq1SQni/kVrnKNK4h/FfXtrpaPbP/4fpttuTHTNk6+P07hzxcW
 f13wG5nLKfQF4o4IwAmoGMj96gmSpJGxBFFjyJM1lL6zWacAGf8IA1Pd4gI+3U0lYHRD
 mVKLwPWqH53kWNHoiKOIw0YhXKjwY/Xd8y4sSSozF8WMqpxdxsGkGxpJPdesGfRWh83x
 nin2fQ/sFdpCYuO9NBM3vbXcKx+icvsGAV9IqQpMDON/vURMcW9BBBTax0FrpnHrDiyV
 gpq22ReenmkzYMaa8JZHF2RmUieWGxvkA1Fjfex2HjkCv5Ye6cQ9CI6SxcG9uZbmWhmf sQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2ha4j7w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:49:49 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265HnnFQ025944
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 10:49:49 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2ha4j7w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Jul 2022 10:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN6fTcCf4PD0TOusYjwZay1nmyvdA750SV79mScMxZxoGJhH24Ml5QbWMzB7kFnh9Ds/WWAqNXY6L04pnBjdb+Ml9Sdjnou05HFyhWjn2CDrohug0zS58wVTR5WFfajxgqgJWQEH/vhSK7tkpqdHeoxWAV/y4w8396k5NgVf74MgFAmFqQhuK8PNDzpJgIWXFtlBt04VSvQ1tVyM78LuuPKIHkZ81d+Jh30A+S6P5gO+62Qudp0FldYtBurxlHLPaw06k3Gbqr0hqFlQBpM1dgGabQNF1YYx0DnPddtCij5MMgieu2cx2ov190jP2V+l+pAUUR1uaa4ZEP7N3k64cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbWaFAfbitBsC/i1q2GI8R50Cdt4FlyEB8aR7cHP7xo=;
 b=GbJ/eq9MiWfBG8lx1qyCI7ksJVwUfqCKgunhLIn0PfGmcF9ZVfKdTRW0YIp/hMgUfhqL21/j6ydaTtCc7tOx9Ql5jraF4O+O2oQngX1ifRI4OZnhLclmZ5KjPUqUIrFcyXKMFt72jor/0jczPVrEEDRRlwbHPCRnhvmuI1vBnClOHEclb1m5J54WuJ+RrGW0JtQJ31QympJf80L1c9Oov73RVF6GoAtOhkONGYwNd9vhvjd3z+Bl5CDr+VVRh0KCOEXqXKyPd3nxiiFKi9nXFnf9FrNzfkiDauT6Q51bzUz6LNJCUpaENHLpie5FzK/96d6utfAXhU6W89sgBMkq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 17:49:46 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 17:49:46 +0000
Message-ID: <34510fdc-5325-ffef-265a-c9b3eafe8e5b@windriver.com>
Date: Tue, 5 Jul 2022 13:49:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone][PATCH] pcre2: CVE-2022-1587 Out-of-bounds
 read
Content-Language: en-CA
To: Hitendra Prajapati <hprajapati@mvista.com>,
        openembedded-core@lists.openembedded.org
References: <20220601063650.13396-1-hprajapati@mvista.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220601063650.13396-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::45) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9086e4-a9c7-4ea4-c398-08da5eaebfca
X-MS-TrafficTypeDiagnostic: SA2PR11MB5002:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zK81OxsSu0zjBFLqTHaPPq2w0R5S02WsuwN9iSs5Ls3vQb/wP4F0IC4B4KG966c8rp7nvUnZQNJXsv4J1eDBjEqK6L+QiWBapEEthzwgwc+PMqqFmGFwCH17Hi1MybObKPgMwAP3zcbWfJzX/ejuo+Xwo9FWIl7rh/89mE0wsmfIAAqZkqVzIWAYzBwP07YX9tggVg+zuDJyX6fff5NID65+zlH7PZLlObGBUiqZDXKQvS4pDmeDMhevjnGSpt0/qFZ3abufXTlUoBbBxfNtILc3Bgt3EbkrXOUJYIYdyifHKChU852aw6Cc2MBJBUy0UT7O4j8tOdIgDRF36SOW2404xyHNQKpcqU3NDNBneW/p3Mce94ODVDWovse3USvUsW2Wrz6CEsK5y6+WJO/WWmV8KItJ8GePU3qQ0BU8KwOJh12+J57P+rxcpte0TSUUq0XWIEgvyoS/fVTGmiAAnQfiicQgvgWKjGuRhYXHoyB5PHWxCWrWxIwgoHjeqxdsZsI5adpi9qhprvsBaLgSqEz3+zRgKNcuDhmZyZ9UX8McvZ6fXGFiDvCyLOSXLj+BA8tRHF3G/gCt8mD25hOPr8HUz/e+RJHwCBFLQjGvybY01FllQHoAxw5BzwOrvz2SIvFaqpe24+YrZ3Oc6Zyq0MhTt1SiCga1vHtN/Yhebwj3+L/hrbSbSGvsMzXzAlb8yfjnYj4t8rAa5z0mUIf4HJuI8dclk90S18vwSAcYNPGKoJRW+H+2g+4xMrB2sMtRi6tA6h6Sg9Mv1gpeU5rIcck7PZAg/0RPbWIEL9eK0W2/hlQUa7wNjZVhxMkl/u4ESs3pKvIX+HqCu8E1Pskl37p7wFM0dJcVsTCaPcHr26AfuYgfQr+Dvt0yKzlK4KvfyXR5MQRvwWYpmew3RIowcezS97wlitouaevJ8faTrzYn4/wavGWuKAEUZOeT9uNe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(26005)(5660300002)(30864003)(8936002)(2616005)(36756003)(6666004)(41300700001)(52116002)(53546011)(6512007)(31686004)(83380400001)(6506007)(186003)(38100700002)(478600001)(2906002)(6486002)(31696002)(966005)(86362001)(8676002)(66476007)(316002)(66556008)(38350700002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTJoWjB3YmxJREYzWGxVckdlajhYaVB2anlpMXYzUDdZSEQ3L0xkTDQ4L2tz?=
 =?utf-8?B?eU5GOXR2RDB4T3A1WERJSVR3VW52V1JBS2FTa1d3WkdSRndCQmh3dzd0eGVs?=
 =?utf-8?B?UVZrL2xqdzVYcWh2a1dPNlkvTkt1WFVBend3Y3pwVnI3MUViVkpQNDZ0eHVQ?=
 =?utf-8?B?WlBicXNqVi9JYjBrZG9od0pEMzBwdEdTSnU5QW5neEZ0OXBDWGMxbmM0bHFa?=
 =?utf-8?B?N0N6Q1pQZGx0ZlFpMTJTMEN1cU5pZWFsWUFFQ1IyeTVicEF1OVd6ejA2eGk5?=
 =?utf-8?B?TEpFZHh2TzZXazlpRzZFUEkvY3hCMm9pd2h3NzNuTWJmYUFyVS81VmNJOTRY?=
 =?utf-8?B?MHNQTm1QKzRLRDRqME5ha2cyQjZ4T1VKN0REdHJJUXlQaDE5R3RLOFdVTVFN?=
 =?utf-8?B?QUQ0RllyQVlEQXZiaDJsLzBVeGtNZTV3Q3V2Mmh6RFJjS2kwcTdTdnllck5h?=
 =?utf-8?B?eTRxZ2hTczJ1UGNKSWRNSXhlOTZWUWkzaUd1RzNJSVFhT1JSTUR1U085M0VO?=
 =?utf-8?B?SDVoQVI2QkxrSkwramc0ejlBSGMvSGFXRzZHcG1Fbmd1S3hZVWsxaWhDa3pz?=
 =?utf-8?B?TFdhODlBTzRZQy9ITXdhR0wzMDFSbms0YXladHJydVc0VTdLanhsYmxQSWts?=
 =?utf-8?B?L2MxaVZGK3VaNjU2VEFwUTNIUmh1ME1BTGIzMGlHNjhLQUFSVmtSYU1Vandi?=
 =?utf-8?B?M2R3Nm1HSUtDamlLUlZKbVpIREtCV0lqRmdVeHVBekVTamd4TTF6NjZ6UU8x?=
 =?utf-8?B?Um9JTkprKzVrRGlQZmxmR2IxWFZ4S3ZDTjA0RFJ0WUlmbXdzTUY1SFdaMnZ6?=
 =?utf-8?B?SzlVV3YzZlBrUnNjN1BmcmhnR2N0RWs0UmNZSWdYVGswVklpWmJPM2l2Nk9L?=
 =?utf-8?B?YjJjeGtLTXljRUpQYVMxNHRSU3dVbUV1NTZQWkxtdnFlVW5DdXlhVlBvQnFJ?=
 =?utf-8?B?TlhRTUorN2xWalJ0WUorMnJnNmhNOWpySG1PVWRGRm9vZmhCRXU0RWIwbkVS?=
 =?utf-8?B?Z1ZQMkw1SzZQMTY0RW5OdHlmUXdjUllkSHIrMUdoWTlPQ29OUUJCUkY0VnRX?=
 =?utf-8?B?b3lMZHlnM1NiUktTUmt3bDlGVjZCenRGd3NNYTNCcXRJL2VBeW1vSEJoUXpZ?=
 =?utf-8?B?azVCZFFubGtjMmNRK0VBRFh6UWVYdndvTC9uakpmN3VIelBBeUo2OWlXWk9M?=
 =?utf-8?B?RFd4dC9kSTYvS1JXbjF2MVIreGFnbVFMUEVjb2Q3V1pza3FqOFBTd2htdmtx?=
 =?utf-8?B?YnFwSis3QkFacHA0SUpldGM1K3YzRDNDcS9WQ2p6WVd5d1YvNUVUQXI5bU0w?=
 =?utf-8?B?TEZ0U3prUk45Y0FNcEJpRTNkTWNORS9pQnZDR0pQUU92TVlXWkZiendlZlJ6?=
 =?utf-8?B?MTl4d29tc3lpU3lZVHJOUmdqajk3YTE0WHBtem53Zm9zMVpzWXRCd0VDQlFW?=
 =?utf-8?B?QStGWWRvc3pRelVZT1FjOTNOL2k2ZDdSOUxYdU1kNW1MVElhNXNqUzRwK0xD?=
 =?utf-8?B?ZCtPWDVoMWVwUFhXUXlzOXFQTi9DNlp4RGVVTGFrb3R1bGRqS0NkU3cwNTJN?=
 =?utf-8?B?M3ZiaXFrdER4YkZXajJFcXcrYXRKSXp1Kzg0bjdwREZ3TGlEQWdtUklESWhn?=
 =?utf-8?B?dXREMGQxdWVlTzZwMDhEYk9xWFI2Q0RoUTRjUWc2Z1JHc25tV2Q5Y056WFFh?=
 =?utf-8?B?b28wQ3d5SHdmQ2IwVGU4dFR0WHUzS3JoYlJ1MUM3NTczK1g3dXFZcnp0N212?=
 =?utf-8?B?alJxZFp0ZFZOcVRoNE84NHdGV1BuTnFMMzFwS1RBSURyQ09VS1lvQkRtM2Jv?=
 =?utf-8?B?a0dNeXppZDRvbUx4VkwveHNPNkJFWkdEUlBsR0JHTm5ueDd6UTViNmxFSXNj?=
 =?utf-8?B?VWZmRFJSSVk2bzNXRXR4S1V5S25IT0YyVm0xQUdKMzdjSE5uSWJVbThmY1pG?=
 =?utf-8?B?dVgwbWk0Yy94TFpXV1NnS0RUdFJqdXJQeTR3SHUzMTRTaFM0UXN0eStUUEwv?=
 =?utf-8?B?UHM5R1Iza1E2TGpvTHBCOUdPZld0UVk1bkpvRmVRQ0NUcWg1ajZpYm54aE5M?=
 =?utf-8?B?ZzhKTUxBUXZ0RWhSclBKSmpWWUp5YkMvb0NabUt0OUEyRWdNY3R1SzZvMUhW?=
 =?utf-8?B?U1RSN05PVUdETnp4Mml5TmtRT2ZGUURGNXFuQkFERjFtOGF4UFBEYi9ibktx?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff9086e4-a9c7-4ea4-c398-08da5eaebfca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 17:49:46.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6RfmOSKK2olEkwfl6PngmdTDTU99WPVN7YmsoETzdDyqC7fUIoMuv6rMT/sovr3bhUa+dhBCJG4ADTKLLgajV0zvA4RpKIq4trKc1964Y14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
X-Proofpoint-ORIG-GUID: rN2_vsdaMa7t5bZbvFovaiOU7fniCiQu
X-Proofpoint-GUID: 8voBmqkFTa45Nn0x_JbF2ieaMOfP-rV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167678

On 2022-06-01 02:36, Hitendra Prajapati wrote:

> Backport from https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67dfcadda6b42c9d0

I don't think we need this patch since:

$ cd .../pcre2.git && git pull
$ git tag --contains 03654e751e7f0700693526b67dfcadda6b42c9d0
pcre2-10.40

and we have that version in kirkstone:

meta/recipes-support/libpcre/libpcre2_10.40.bb

https://git.openembedded.org/openembedded-core/commit/?id=9cf49b4f07afcf48a5e6d1ed12d0959d5d040e00


../Randy

> CVE-2022-1587  pcre2: Out-of-bounds read in get_recurse_data_length in pcre2_jit_compile.c.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../libpcre/libpcre2/CVE-2022-1587.patch      | 659 ++++++++++++++++++
>   .../recipes-support/libpcre/libpcre2_10.39.bb |   1 +
>   2 files changed, 660 insertions(+)
>   create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
>
> diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
> new file mode 100644
> index 0000000000..1c3f5f1d3d
> --- /dev/null
> +++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
> @@ -0,0 +1,659 @@
> +From aa5aac0d209e3debf80fc2db924d9401fc50454b Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Mon, 23 May 2022 14:11:11 +0530
> +Subject: [PATCH] CVE-2022-1587
> +
> +Upstream-Status: Backport from https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67dfcadda6b42c9d0
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + ChangeLog               |   3 +
> + src/pcre2_jit_compile.c | 290 ++++++++++++++++++++++++++--------------
> + src/pcre2_jit_test.c    |   1 +
> + 3 files changed, 194 insertions(+), 100 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index b5d72dc..de82de9 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -4,6 +4,9 @@ Change Log for PCRE2
> + 23. Fixed a unicode properrty matching issue in JIT. The character was not
> + fully read in caseless matching.
> +
> ++24. Fixed an issue affecting recursions in JIT caused by duplicated data
> ++transfers.
> ++
> +
> + Version 10.34 21-November-2019
> + ------------------------------
> +diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
> +index 5d43865..493c96d 100644
> +--- a/src/pcre2_jit_compile.c
> ++++ b/src/pcre2_jit_compile.c
> +@@ -407,6 +407,9 @@ typedef struct compiler_common {
> +   /* Locals used by fast fail optimization. */
> +   sljit_s32 fast_fail_start_ptr;
> +   sljit_s32 fast_fail_end_ptr;
> ++  /* Variables used by recursive call generator. */
> ++  sljit_s32 recurse_bitset_size;
> ++  uint8_t *recurse_bitset;
> +
> +   /* Flipped and lower case tables. */
> +   const sljit_u8 *fcc;
> +@@ -2109,19 +2112,39 @@ for (i = 0; i < RECURSE_TMP_REG_COUNT; i++)
> +
> + #undef RECURSE_TMP_REG_COUNT
> +
> ++static BOOL recurse_check_bit(compiler_common *common, sljit_sw bit_index)
> ++{
> ++uint8_t *byte;
> ++uint8_t mask;
> ++
> ++SLJIT_ASSERT((bit_index & (sizeof(sljit_sw) - 1)) == 0);
> ++
> ++bit_index >>= SLJIT_WORD_SHIFT;
> ++
> ++mask = 1 << (bit_index & 0x7);
> ++byte = common->recurse_bitset + (bit_index >> 3);
> ++
> ++if (*byte & mask)
> ++  return FALSE;
> ++
> ++*byte |= mask;
> ++return TRUE;
> ++}
> ++
> + static int get_recurse_data_length(compiler_common *common, PCRE2_SPTR cc, PCRE2_SPTR ccend,
> +   BOOL *needs_control_head, BOOL *has_quit, BOOL *has_accept)
> + {
> + int length = 1;
> +-int size;
> ++int size, offset;
> + PCRE2_SPTR alternative;
> + BOOL quit_found = FALSE;
> + BOOL accept_found = FALSE;
> + BOOL setsom_found = FALSE;
> + BOOL setmark_found = FALSE;
> +-BOOL capture_last_found = FALSE;
> + BOOL control_head_found = FALSE;
> +
> ++memset(common->recurse_bitset, 0, common->recurse_bitset_size);
> ++
> + #if defined DEBUG_FORCE_CONTROL_HEAD && DEBUG_FORCE_CONTROL_HEAD
> + SLJIT_ASSERT(common->control_head_ptr != 0);
> + control_head_found = TRUE;
> +@@ -2144,15 +2167,17 @@ while (cc < ccend)
> +       setsom_found = TRUE;
> +     if (common->mark_ptr != 0)
> +       setmark_found = TRUE;
> +-    if (common->capture_last_ptr != 0)
> +-      capture_last_found = TRUE;
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> ++      length++;
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     case OP_KET:
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0)
> +       {
> +-      length++;
> ++      if (recurse_check_bit(common, offset))
> ++        length++;
> +       SLJIT_ASSERT(PRIVATE_DATA(cc + 1) != 0);
> +       cc += PRIVATE_DATA(cc + 1);
> +       }
> +@@ -2169,39 +2194,55 @@ while (cc < ccend)
> +     case OP_SBRA:
> +     case OP_SBRAPOS:
> +     case OP_SCOND:
> +-    length++;
> +     SLJIT_ASSERT(PRIVATE_DATA(cc) != 0);
> ++    if (recurse_check_bit(common, PRIVATE_DATA(cc)))
> ++      length++;
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     case OP_CBRA:
> +     case OP_SCBRA:
> +-    length += 2;
> +-    if (common->capture_last_ptr != 0)
> +-      capture_last_found = TRUE;
> +-    if (common->optimized_cbracket[GET2(cc, 1 + LINK_SIZE)] == 0)
> ++    offset = GET2(cc, 1 + LINK_SIZE);
> ++    if (recurse_check_bit(common, OVECTOR(offset << 1)))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, OVECTOR((offset << 1) + 1)));
> ++      length += 2;
> ++      }
> ++    if (common->optimized_cbracket[offset] == 0 && recurse_check_bit(common, OVECTOR_PRIV(offset)))
> ++      length++;
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> +       length++;
> +     cc += 1 + LINK_SIZE + IMM2_SIZE;
> +     break;
> +
> +     case OP_CBRAPOS:
> +     case OP_SCBRAPOS:
> +-    length += 2 + 2;
> +-    if (common->capture_last_ptr != 0)
> +-      capture_last_found = TRUE;
> ++    offset = GET2(cc, 1 + LINK_SIZE);
> ++    if (recurse_check_bit(common, OVECTOR(offset << 1)))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, OVECTOR((offset << 1) + 1)));
> ++      length += 2;
> ++      }
> ++    if (recurse_check_bit(common, OVECTOR_PRIV(offset)))
> ++      length++;
> ++    if (recurse_check_bit(common, PRIVATE_DATA(cc)))
> ++      length++;
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> ++      length++;
> +     cc += 1 + LINK_SIZE + IMM2_SIZE;
> +     break;
> +
> +     case OP_COND:
> +     /* Might be a hidden SCOND. */
> +     alternative = cc + GET(cc, 1);
> +-    if (*alternative == OP_KETRMAX || *alternative == OP_KETRMIN)
> ++    if ((*alternative == OP_KETRMAX || *alternative == OP_KETRMIN) && recurse_check_bit(common, PRIVATE_DATA(cc)))
> +       length++;
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_1
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> +       length++;
> +     cc += 2;
> + #ifdef SUPPORT_UNICODE
> +@@ -2210,8 +2251,12 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_2A
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
> +       length += 2;
> ++      }
> +     cc += 2;
> + #ifdef SUPPORT_UNICODE
> +     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
> +@@ -2219,8 +2264,12 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_2B
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
> +       length += 2;
> ++      }
> +     cc += 2 + IMM2_SIZE;
> + #ifdef SUPPORT_UNICODE
> +     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
> +@@ -2228,20 +2277,29 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_1
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> +       length++;
> +     cc += 1;
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_2A
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
> +       length += 2;
> ++      }
> +     cc += 1;
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_2B
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> ++      {
> ++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
> +       length += 2;
> ++      }
> +     cc += 1 + IMM2_SIZE;
> +     break;
> +
> +@@ -2253,7 +2311,9 @@ while (cc < ccend)
> + #else
> +     size = 1 + 32 / (int)sizeof(PCRE2_UCHAR);
> + #endif
> +-    if (PRIVATE_DATA(cc) != 0)
> ++
> ++    offset = PRIVATE_DATA(cc);
> ++    if (offset != 0 && recurse_check_bit(common, offset))
> +       length += get_class_iterator_size(cc + size);
> +     cc += size;
> +     break;
> +@@ -2288,8 +2348,7 @@ while (cc < ccend)
> +     case OP_THEN:
> +     SLJIT_ASSERT(common->control_head_ptr != 0);
> +     quit_found = TRUE;
> +-    if (!control_head_found)
> +-      control_head_found = TRUE;
> ++    control_head_found = TRUE;
> +     cc++;
> +     break;
> +
> +@@ -2309,8 +2368,6 @@ SLJIT_ASSERT(cc == ccend);
> +
> + if (control_head_found)
> +   length++;
> +-if (capture_last_found)
> +-  length++;
> + if (quit_found)
> +   {
> +   if (setsom_found)
> +@@ -2343,14 +2400,12 @@ sljit_sw shared_srcw[3];
> + sljit_sw kept_shared_srcw[2];
> + int private_count, shared_count, kept_shared_count;
> + int from_sp, base_reg, offset, i;
> +-BOOL setsom_found = FALSE;
> +-BOOL setmark_found = FALSE;
> +-BOOL capture_last_found = FALSE;
> +-BOOL control_head_found = FALSE;
> ++
> ++memset(common->recurse_bitset, 0, common->recurse_bitset_size);
> +
> + #if defined DEBUG_FORCE_CONTROL_HEAD && DEBUG_FORCE_CONTROL_HEAD
> + SLJIT_ASSERT(common->control_head_ptr != 0);
> +-control_head_found = TRUE;
> ++recurse_check_bit(common, common->control_head_ptr);
> + #endif
> +
> + switch (type)
> +@@ -2438,11 +2493,10 @@ while (cc < ccend)
> +     {
> +     case OP_SET_SOM:
> +     SLJIT_ASSERT(common->has_set_som);
> +-    if (has_quit && !setsom_found)
> ++    if (has_quit && recurse_check_bit(common, OVECTOR(0)))
> +       {
> +       kept_shared_srcw[0] = OVECTOR(0);
> +       kept_shared_count = 1;
> +-      setsom_found = TRUE;
> +       }
> +     cc += 1;
> +     break;
> +@@ -2450,33 +2504,31 @@ while (cc < ccend)
> +     case OP_RECURSE:
> +     if (has_quit)
> +       {
> +-      if (common->has_set_som && !setsom_found)
> ++      if (common->has_set_som && recurse_check_bit(common, OVECTOR(0)))
> +         {
> +         kept_shared_srcw[0] = OVECTOR(0);
> +         kept_shared_count = 1;
> +-        setsom_found = TRUE;
> +         }
> +-      if (common->mark_ptr != 0 && !setmark_found)
> ++      if (common->mark_ptr != 0 && recurse_check_bit(common, common->mark_ptr))
> +         {
> +         kept_shared_srcw[kept_shared_count] = common->mark_ptr;
> +         kept_shared_count++;
> +-        setmark_found = TRUE;
> +         }
> +       }
> +-    if (common->capture_last_ptr != 0 && !capture_last_found)
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> +       {
> +       shared_srcw[0] = common->capture_last_ptr;
> +       shared_count = 1;
> +-      capture_last_found = TRUE;
> +       }
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     case OP_KET:
> +-    if (PRIVATE_DATA(cc) != 0)
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0)
> +       {
> +-      private_count = 1;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> ++      if (recurse_check_bit(common, private_srcw[0]))
> ++        private_count = 1;
> +       SLJIT_ASSERT(PRIVATE_DATA(cc + 1) != 0);
> +       cc += PRIVATE_DATA(cc + 1);
> +       }
> +@@ -2493,50 +2545,66 @@ while (cc < ccend)
> +     case OP_SBRA:
> +     case OP_SBRAPOS:
> +     case OP_SCOND:
> +-    private_count = 1;
> +     private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (recurse_check_bit(common, private_srcw[0]))
> ++      private_count = 1;
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     case OP_CBRA:
> +     case OP_SCBRA:
> +-    offset = (GET2(cc, 1 + LINK_SIZE)) << 1;
> +-    shared_srcw[0] = OVECTOR(offset);
> +-    shared_srcw[1] = OVECTOR(offset + 1);
> +-    shared_count = 2;
> ++    offset = GET2(cc, 1 + LINK_SIZE);
> ++    shared_srcw[0] = OVECTOR(offset << 1);
> ++    if (recurse_check_bit(common, shared_srcw[0]))
> ++      {
> ++      shared_srcw[1] = shared_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, shared_srcw[1]));
> ++      shared_count = 2;
> ++      }
> +
> +-    if (common->capture_last_ptr != 0 && !capture_last_found)
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> +       {
> +-      shared_srcw[2] = common->capture_last_ptr;
> +-      shared_count = 3;
> +-      capture_last_found = TRUE;
> ++      shared_srcw[shared_count] = common->capture_last_ptr;
> ++      shared_count++;
> +       }
> +
> +-    if (common->optimized_cbracket[GET2(cc, 1 + LINK_SIZE)] == 0)
> ++    if (common->optimized_cbracket[offset] == 0)
> +       {
> +-      private_count = 1;
> +-      private_srcw[0] = OVECTOR_PRIV(GET2(cc, 1 + LINK_SIZE));
> ++      private_srcw[0] = OVECTOR_PRIV(offset);
> ++      if (recurse_check_bit(common, private_srcw[0]))
> ++        private_count = 1;
> +       }
> ++
> +     cc += 1 + LINK_SIZE + IMM2_SIZE;
> +     break;
> +
> +     case OP_CBRAPOS:
> +     case OP_SCBRAPOS:
> +-    offset = (GET2(cc, 1 + LINK_SIZE)) << 1;
> +-    shared_srcw[0] = OVECTOR(offset);
> +-    shared_srcw[1] = OVECTOR(offset + 1);
> +-    shared_count = 2;
> ++    offset = GET2(cc, 1 + LINK_SIZE);
> ++    shared_srcw[0] = OVECTOR(offset << 1);
> ++    if (recurse_check_bit(common, shared_srcw[0]))
> ++      {
> ++      shared_srcw[1] = shared_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, shared_srcw[1]));
> ++      shared_count = 2;
> ++      }
> +
> +-    if (common->capture_last_ptr != 0 && !capture_last_found)
> ++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
> +       {
> +-      shared_srcw[2] = common->capture_last_ptr;
> +-      shared_count = 3;
> +-      capture_last_found = TRUE;
> ++      shared_srcw[shared_count] = common->capture_last_ptr;
> ++      shared_count++;
> +       }
> +
> +-    private_count = 2;
> +     private_srcw[0] = PRIVATE_DATA(cc);
> +-    private_srcw[1] = OVECTOR_PRIV(GET2(cc, 1 + LINK_SIZE));
> ++    if (recurse_check_bit(common, private_srcw[0]))
> ++      private_count = 1;
> ++
> ++    offset = OVECTOR_PRIV(offset);
> ++    if (recurse_check_bit(common, offset))
> ++      {
> ++      private_srcw[private_count] = offset;
> ++      private_count++;
> ++      }
> +     cc += 1 + LINK_SIZE + IMM2_SIZE;
> +     break;
> +
> +@@ -2545,18 +2613,17 @@ while (cc < ccend)
> +     alternative = cc + GET(cc, 1);
> +     if (*alternative == OP_KETRMAX || *alternative == OP_KETRMIN)
> +       {
> +-      private_count = 1;
> +       private_srcw[0] = PRIVATE_DATA(cc);
> ++      if (recurse_check_bit(common, private_srcw[0]))
> ++        private_count = 1;
> +       }
> +     cc += 1 + LINK_SIZE;
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_1
> +-    if (PRIVATE_DATA(cc))
> +-      {
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       private_count = 1;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +-      }
> +     cc += 2;
> + #ifdef SUPPORT_UNICODE
> +     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
> +@@ -2564,11 +2631,12 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_2A
> +-    if (PRIVATE_DATA(cc))
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       {
> +       private_count = 2;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +-      private_srcw[1] = PRIVATE_DATA(cc) + sizeof(sljit_sw);
> ++      private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
> +       }
> +     cc += 2;
> + #ifdef SUPPORT_UNICODE
> +@@ -2577,11 +2645,12 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_PRIVATE_DATA_2B
> +-    if (PRIVATE_DATA(cc))
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       {
> +       private_count = 2;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +-      private_srcw[1] = PRIVATE_DATA(cc) + sizeof(sljit_sw);
> ++      private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
> +       }
> +     cc += 2 + IMM2_SIZE;
> + #ifdef SUPPORT_UNICODE
> +@@ -2590,30 +2659,30 @@ while (cc < ccend)
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_1
> +-    if (PRIVATE_DATA(cc))
> +-      {
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       private_count = 1;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +-      }
> +     cc += 1;
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_2A
> +-    if (PRIVATE_DATA(cc))
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       {
> +       private_count = 2;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +       private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
> +       }
> +     cc += 1;
> +     break;
> +
> +     CASE_ITERATOR_TYPE_PRIVATE_DATA_2B
> +-    if (PRIVATE_DATA(cc))
> ++    private_srcw[0] = PRIVATE_DATA(cc);
> ++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
> +       {
> +       private_count = 2;
> +-      private_srcw[0] = PRIVATE_DATA(cc);
> +       private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
> +       }
> +     cc += 1 + IMM2_SIZE;
> +     break;
> +@@ -2630,14 +2699,17 @@ while (cc < ccend)
> +       switch(get_class_iterator_size(cc + i))
> +         {
> +         case 1:
> +-        private_count = 1;
> +         private_srcw[0] = PRIVATE_DATA(cc);
> +         break;
> +
> +         case 2:
> +-        private_count = 2;
> +         private_srcw[0] = PRIVATE_DATA(cc);
> +-        private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++        if (recurse_check_bit(common, private_srcw[0]))
> ++          {
> ++          private_count = 2;
> ++          private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
> ++          SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
> ++          }
> +         break;
> +
> +         default:
> +@@ -2652,28 +2724,25 @@ while (cc < ccend)
> +     case OP_PRUNE_ARG:
> +     case OP_THEN_ARG:
> +     SLJIT_ASSERT(common->mark_ptr != 0);
> +-    if (has_quit && !setmark_found)
> ++    if (has_quit && recurse_check_bit(common, common->mark_ptr))
> +       {
> +       kept_shared_srcw[0] = common->mark_ptr;
> +       kept_shared_count = 1;
> +-      setmark_found = TRUE;
> +       }
> +-    if (common->control_head_ptr != 0 && !control_head_found)
> ++    if (common->control_head_ptr != 0 && recurse_check_bit(common, common->control_head_ptr))
> +       {
> +       shared_srcw[0] = common->control_head_ptr;
> +       shared_count = 1;
> +-      control_head_found = TRUE;
> +       }
> +     cc += 1 + 2 + cc[1];
> +     break;
> +
> +     case OP_THEN:
> +     SLJIT_ASSERT(common->control_head_ptr != 0);
> +-    if (!control_head_found)
> ++    if (recurse_check_bit(common, common->control_head_ptr))
> +       {
> +       shared_srcw[0] = common->control_head_ptr;
> +       shared_count = 1;
> +-      control_head_found = TRUE;
> +       }
> +     cc++;
> +     break;
> +@@ -2681,7 +2750,7 @@ while (cc < ccend)
> +     default:
> +     cc = next_opcode(common, cc);
> +     SLJIT_ASSERT(cc != NULL);
> +-    break;
> ++    continue;
> +     }
> +
> +   if (type != recurse_copy_shared_to_global && type != recurse_copy_kept_shared_to_global)
> +@@ -13262,7 +13331,7 @@ SLJIT_ASSERT(!(common->req_char_ptr != 0 && common->start_used_ptr != 0));
> + common->cbra_ptr = OVECTOR_START + (re->top_bracket + 1) * 2 * sizeof(sljit_sw);
> +
> + total_length = ccend - common->start;
> +-common->private_data_ptrs = (sljit_s32 *)SLJIT_MALLOC(total_length * (sizeof(sljit_s32) + (common->has_then ? 1 : 0)), allocator_data);
> ++common->private_data_ptrs = (sljit_s32*)SLJIT_MALLOC(total_length * (sizeof(sljit_s32) + (common->has_then ? 1 : 0)), allocator_data);
> + if (!common->private_data_ptrs)
> +   {
> +   SLJIT_FREE(common->optimized_cbracket, allocator_data);
> +@@ -13304,6 +13373,7 @@ if (!compiler)
> + common->compiler = compiler;
> +
> + /* Main pcre_jit_exec entry. */
> ++LJIT_ASSERT((private_data_size & (sizeof(sljit_sw) - 1)) == 0);
> + sljit_emit_enter(compiler, 0, SLJIT_ARG1(SW), 5, 5, 0, 0, private_data_size);
> +
> + /* Register init. */
> +@@ -13524,20 +13594,40 @@ common->fast_fail_end_ptr = 0;
> + common->currententry = common->entries;
> + common->local_quit_available = TRUE;
> + quit_label = common->quit_label;
> +-while (common->currententry != NULL)
> ++if (common->currententry != NULL)
> +   {
> +-  /* Might add new entries. */
> +-  compile_recurse(common);
> +-  if (SLJIT_UNLIKELY(sljit_get_compiler_error(compiler)))
> ++  /* A free bit for each private data. */
> ++  common->recurse_bitset_size = ((private_data_size / (int)sizeof(sljit_sw)) + 7) >> 3;
> ++  SLJIT_ASSERT(common->recurse_bitset_size > 0);
> ++  common->recurse_bitset = (sljit_u8*)SLJIT_MALLOC(common->recurse_bitset_size, allocator_data);;
> ++
> ++  if (common->recurse_bitset != NULL)
> ++    {
> ++    do
> ++      {
> ++      /* Might add new entries. */
> ++      compile_recurse(common);
> ++      if (SLJIT_UNLIKELY(sljit_get_compiler_error(compiler)))
> ++        break;
> ++      flush_stubs(common);
> ++      common->currententry = common->currententry->next;
> ++      }
> ++    while (common->currententry != NULL);
> ++
> ++    SLJIT_FREE(common->recurse_bitset, allocator_data);
> ++    }
> ++
> ++  if (common->currententry != NULL)
> +     {
> ++    /* The common->recurse_bitset has been freed. */
> ++    SLJIT_ASSERT(sljit_get_compiler_error(compiler) || common->recurse_bitset == NULL);
> ++
> +     sljit_free_compiler(compiler);
> +     SLJIT_FREE(common->optimized_cbracket, allocator_data);
> +     SLJIT_FREE(common->private_data_ptrs, allocator_data);
> +     PRIV(jit_free_rodata)(common->read_only_data_head, allocator_data);
> +     return PCRE2_ERROR_NOMEMORY;
> +     }
> +-  flush_stubs(common);
> +-  common->currententry = common->currententry->next;
> +   }
> + common->local_quit_available = FALSE;
> + common->quit_label = quit_label;
> +diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
> +index 9df87fd..2f84834 100644
> +--- a/src/pcre2_jit_test.c
> ++++ b/src/pcre2_jit_test.c
> +@@ -746,6 +746,7 @@ static struct regression_test_case regression_test_cases[] = {
> + 	{ MU, A, 0, 0, "((?(R)a|(?1)){1,3}?)M", "aaaM" },
> + 	{ MU, A, 0, 0, "((.)(?:.|\\2(?1))){0}#(?1)#", "#aabbccdde# #aabbccddee#" },
> + 	{ MU, A, 0, 0, "((.)(?:\\2|\\2{4}b)){0}#(?:(?1))+#", "#aaaab# #aaaaab#" },
> ++	{ MU, A, 0, 0 | F_NOMATCH, "(?1)$((.|\\2xx){1,2})", "abc" },
> +
> + 	/* 16 bit specific tests. */
> + 	{ CM, A, 0, 0 | F_FORCECONV, "\xc3\xa1", "\xc3\x81\xc3\xa1" },
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.39.bb
> index 36c51d700a..9e293b9d4e 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.39.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
>   
>   SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
>              file://CVE-2022-1586.patch \
> +           file://CVE-2022-1587.patch \
>   "
>   UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166353): https://lists.openembedded.org/g/openembedded-core/message/166353
> Mute This Topic: https://lists.openembedded.org/mt/91470098/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


