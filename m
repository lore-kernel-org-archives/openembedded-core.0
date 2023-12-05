Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064AAC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 05:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.93076.1701755185835840855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 21:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jIk3g5UY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0703390de8=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B55fQ6C014989
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 05:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=0Z2fd9Tbt22Hzajy1bHqVoO5IfS/IwZd6P/PZ/+/O/E=; b=
	jIk3g5UYUemWrPEuytWDbj0w+xVj233sWHjPZ9vkbnN71RO3dhKOJBxwDzms0ZTj
	Gf5opcYR/QawsVd2fYdzSCsggQAH+7d9oDPvrjBDjsbyL4TuWF0J+/s6uXLvmM4i
	bXoaeW9FHk9wi2DqPyVKU2HS5zJC3rWiU0NpzD10G0Md7NUApYcSwYjC4f0z6wtx
	WGUlzdAwJjgYPikme9FywhmcPoy5eR2NAfB4CLJikTP+z+tEZYB0xhDtAZm6NGve
	wWcfSoZhSko2E+6crYF+qYQCQDjMVBmlO/ZwqQMFKv/L2BJtFOmRv07XoRiMeTpv
	Sf//Z1MDEIx9oc8ZkKQY3A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss48658-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:46:24 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B55kOAb020038;
	Tue, 5 Dec 2023 05:46:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss48657-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 05:46:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PViF6BGxhx7PsGC5tzP7e2v4NW6xM6cntohBatRSh8hWPM8c2zNuDQj3OSgOObqjy0itFgTN0+LbaWy6rSF6IstR2olUJnVCKlJ/ZP6Yx+dABCt4OjwNLJg/+2LB+YcgMkCjIGTyjj5GVxEdbewjs2fIkDFJTgNdaZz9AljgGVc1S2aHcY43t21UrbAJDkLSUpppgJM664PIDK6rVvzeMGx+FuhLCAWbw+MHFGqJmVoX586jbI4XZQX6oB7SeO52vB+2JFvmDk5m0y+24P5F/J4XitMKVMR7TGzrFZGve1T0Rco0Pq95IFWDXScv/5OAAQiEaSPgWN+8BIWa5ysfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z2fd9Tbt22Hzajy1bHqVoO5IfS/IwZd6P/PZ/+/O/E=;
 b=A9EQqGA+Ez/YT74LxhK+EIEJf44QvCpnFYkP9qwyL3BxaFNYSH83Uc7aBTDtA/+owDInVYkB55NCPUHKg2p3TA1aaXvWSpiKRKpM42Mu9UYejDh0R4YzDcHxj7wOJVwEZaURQhB/0TrQCRhGs9CdG/Ej4cwywgqB0PBsgYhCPfbYFSZIdRXyfcD/F8KrStRrjMtuUbQ68yZ7OXGnnIcZLg414pqHo2djmTR6N54xvf7nGT8BPQQv6MggbaLBf0W1+qsxrEhwOcPygJ+Zghb0IvT1Uyjksxyi+Xqu5QqqLaGdYaRFh2AbVRlmDayWhn3LlVxrmPOL+1ItCTkpNeAdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 05:46:20 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 05:46:20 +0000
Message-ID: <07dd26ce-3ffc-4799-9d6e-0d910477622e@windriver.com>
Date: Tue, 5 Dec 2023 13:46:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com>
 <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com>
 <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
 <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e3562a-e0f0-4b59-8c16-08dbf555817c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8S+BuP37GcPl7XB6M141BZbwn5QA8asJLWsY0tIt/rlR+EVBtH04eymRS4kGoeBqgWxJIjS75hd4ltsJbfqWiddgo0sduc4vXqg8VfPMqYSmb/jym3sj7HmcuJqJWRttOr2L+cE3XkPDmOGWetNgw0oh8jGXo+9uXk6C5SuJRuJTYBCCij7iI/fjOaYpcIh2vhP3IwPzWY8vdQRvXUqTImysY0VbvOx0dTLxGfzZXvbfJq792j0AW1Snr11dd9BEpN8EaVu+KaSpClKpohxrH+0KKpIMOMMffMaH4WmdWn0mnB//dJHCRckpYcPv1XQU9n7nHlPMue60k7WcKTG5QeroQwCMyvUq1nWoMcEjAP5Jw0A7wWXOJtm1kk2Uvja3f5QgGHUO8yulldtFs9vs9ubvj3tTrRxG92vBgRGT2XbDfPehUaUeqmBdh8jBZvTto7/f7DahLv3UMreHObog/gJEjQYvYIMVCoDHYN9QPQdKgOk8fPZDc5yHhxHWmM9cG2sNv2ISqVg4Of+AWE5FRpMF/dCbeH+CvikNSV0JUZLgM1hkJAgA2ExvlLda1I44pz6Yst4/rKuUhOskaVD0YLNI2epc0UO1QsSAZ5Kzr4V/w2NoJXw2tJ4JaaeIfgTVaacimfpYEr4ximPjq2TtLnp1BAVhM3pQwwvmw8TEzYySwy20UagzuS+1Z7dovd37nMx83vA4PUkZyTETv1NP3bPqqp4Gfa6qJuIxI2toYtQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(376002)(396003)(366004)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(66476007)(66556008)(66946007)(316002)(110136005)(54906003)(966005)(6486002)(66899024)(38100700002)(2906002)(31696002)(5660300002)(86362001)(36756003)(41300700001)(4326008)(8936002)(8676002)(44832011)(6512007)(6666004)(53546011)(6506007)(83380400001)(26005)(2616005)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eW1nREl0VysrWDZaUGFTQjFza3drTzNSbGxBc1Y4bk9KWDNUYWpHbU9NZzZk?=
 =?utf-8?B?MUs4bDkwZ21VQ3dDdFZBeC9BeWNNT3hUUVBhWE1FQTJ5NGNDbnJBZDZhNDRD?=
 =?utf-8?B?WDdNc1laUTJKZEMrN0RobnQzVjM3bVdlZ0ZmcFJidXA4TGNrbTArQ2k2U3pY?=
 =?utf-8?B?ZFk1aFhrWDczUzVlcjFWcE56bDR4cmEzbjNWWVRBMnFzOXNCT3I2aVZNanBt?=
 =?utf-8?B?UGNYM0ptZTBweUNnUTJDeUN0ZzJ4QXFMRnZqa1JvaVJkNGVZUmRiajQ5cDZU?=
 =?utf-8?B?anIyYUNWWW92MFZhdmpiWEFEd0dYWVN0bzlIYnJ5NU9WUVhqeEJOV0NUUTRT?=
 =?utf-8?B?TmJ6SE80dGxwdmZZdENSVjNOWThkbDJOTTVjeUtDbzYrS2c2MzM0WDRQSmtC?=
 =?utf-8?B?eVUwNXduQ0ExQm1xaDQwdXczb0dzR2IzcG91U0RjdkloV2dMb0g2bWFwWkha?=
 =?utf-8?B?MGs3bm1TSGVVV1o3UUY1VGpBUzBMcmN1aG8zb0I5d1g1NWEzcDA4SUNoK2pI?=
 =?utf-8?B?RkhEMmVFeEhldi9uUGRlcnVyVHNHZUpqSlRacExHeE9mOUxuUGFXVjZjWnNK?=
 =?utf-8?B?VUl2Q1g4VXViZFJ1eHlwMm54enluMEEzL09rK1U1dllqcXBKbFIxUDN0ZTd6?=
 =?utf-8?B?QWRTc2x2TEQrWDNOVTJnOHAzKzBURDN5VVZCVjZUM1FBR3RlZGNZQ1NqYWFu?=
 =?utf-8?B?NGMyd0lzRmlpNTJybDZKQUU5Y1pwNWhaRUhkcjdYZmRHL1IralNNVWdyNjl6?=
 =?utf-8?B?OWhVek9RcmJvRlZnNWx5TGxmdHBEMWxLcmJhbXFLbDVWTUYxYi9xYXBNNHdn?=
 =?utf-8?B?YWY1SytQQmQxajh6Rm9aOWFrd00vbzNzWmFnSU5KbHNjb0dOVk9WSFJYWVhp?=
 =?utf-8?B?VWtZSEdQMWh6ZEFjZmc3aldpSVVGVFl3NlZhQWdUVkdNeEc4UTVNY3hXL0hm?=
 =?utf-8?B?YmRGZlgwb2EvWmxqQjFoa0lzQ2M5Z3hXMVh1ZzhxeURxR2g1b0l4eG1SS1ZQ?=
 =?utf-8?B?bTBsMG44WmdlU2xsMXI1YVVkWmtsL1FjQXZkbE52dkE0QjJTcDRTbkdrSHFi?=
 =?utf-8?B?VHRKakRhbEZDVERQYjB0R1VtMkJMWTUrQjJEKzJvWkx3T2hiL2ZrY0RXTVJr?=
 =?utf-8?B?N2pBSDFKRFkvTDFaaUlyMVhvWHBRaERxZzljQWdzNGd6RjdVVWszeTgvNDM0?=
 =?utf-8?B?QTBYMnFZblpuaW5lN3U2VkFFK1g0VlVkY2hpbDFrZ2h0WFNnUjNEOEIydVY1?=
 =?utf-8?B?UUVUMlRRRlNpTVJURFVBb1NFODUrdHB6WkN3VndLcE5NRlhPSVlrVnZ1RGow?=
 =?utf-8?B?Z05abU9nOURsK1RvcldxVktxRyt1by9CRWVFOHdzK2hWbjlobGtobzFYMW5C?=
 =?utf-8?B?elFJZjJTM1RxaThjaWZEVEdQYXplNHVCTFh5eGhnNDlMeVRZSkhqd2NlOG5M?=
 =?utf-8?B?UDVpVmRLM1dBN3NBVlBZaTlaSGN3NmlVU2RNK1Q2VzVlNkpQODdYdXRxSWRZ?=
 =?utf-8?B?djRSSDFWb0VNbFh6TnZodkJ2bGZ2K0ZXMGRUaGV3WWV3clp0RkNDWmdnU1NE?=
 =?utf-8?B?Zi9wOXpkemRVeHliTTJnMHJzWlVCMTBrQ2xSajFuTTBlKytFMjZkb2JlYzhx?=
 =?utf-8?B?b1IwcVVFbEhlREdmTUtqWU1DMzFrUFdjL3hKQTk5ZzBqWjJ5VEpvSVFOZ2Y4?=
 =?utf-8?B?U0E4c29YMnBGTENLZDFNc0tmOXNFUGJGT25Ya0h5aXVwMm9PaEY1My9ySktJ?=
 =?utf-8?B?Y2pQanNxSXkzM0pFZ2JGWTFRbmZ5S1NTL2FzanYwWU8raUZYM3hPSTBMYXd5?=
 =?utf-8?B?WVFFSXRnRzNucHlQZ0Q3K0RvOVdncmFIMTVlWXNiZVE2cHV2eit1Y0tCd3Fj?=
 =?utf-8?B?bU9XaHFYaGszdkVRSi82Sll4dkhZbGZxTGdKUVk3bDVrNENNVDJUQmkwbVI4?=
 =?utf-8?B?Vm5pcHd1QWZETTdDeEtrZW5sQ3JqV05JcnVQZXBKTUJHbkpCS0ttSmxXWE45?=
 =?utf-8?B?U3dPWmlDRTdkUzRFdnhlQkJSNEx6SmhZUlRIZ1VTYmlZenNzRmM2dDl4Vm1S?=
 =?utf-8?B?OGJTM3o3Zks2VXRjUTU5QlJvS2oxV2ttV05NTzBPcUdDQXFOOFcxVkpTUkdv?=
 =?utf-8?B?YUVHRjV6SUVuZlFCNkxvUUM5NmJ3TVI4cDhjSnZFZEtLbCtOa0toZEE3SC91?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e3562a-e0f0-4b59-8c16-08dbf555817c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 05:46:20.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xarZn8/vnNvGjUWXhYNLJNPRs4VnkABkexbjJerxzxj7alx/50CS1p4vp/adj+shJFXDTOOPjpbTdObkAiKaVtsRB4FCv+ruvs1sG7G3GBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
X-Proofpoint-ORIG-GUID: 03NspP2jAszyH7JpE_YAVTfJptfuWpk0
X-Proofpoint-GUID: iOE1RdDkbls3mAFJYm1wN2X8sLKvx9HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B55fQ6C014989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191793


On 7/18/23 04:22, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This merged to master and it should not have happened. I'm sending a re=
vert.
>
> Alex

Hi, Alex

I know that following patch already reverted.

https://git.openembedded.org/openembedded-core/commit/?id=3D49bad18012a40=
79f0dbfe6c541a46ec508940f28

But after review it again,=C2=A0 I think maybe it is still needed.

dnf works like this,=C2=A0 it will create log file /var/log/log_lock.pid,=
=C2=A0=20
and this lock file is designed to by removed after reboot, refer=20
following link.

https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d=
/dnf.conf

But following patch for fixing oe specific issue break above dnf design=20
about removing lock file.

https://git.openembedded.org/openembedded-core/commit/?id=3D742a1b71249f4=
da1c8d8e13e270b0eb6128a3f66

So=C2=A0 I add this patch=20
https://git.openembedded.org/openembedded-core/commit/?id=3D406a72a9a47c2=
735b7e18cefc682b1df00d5a9aa=20
to remove the lock file in rootfs.

Since for dnf-native,=C2=A0 it will not have reboot process,=C2=A0 so it =
is better=20
to remove it at post process of rootfs, to=C2=A0 make an clean rootfs.


Regards

//Changqing


>
>
> On Tue, 11 Jul 2023 at 10:34, Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>>
>> On 7/4/23 19:11, Ross Burton wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On 30 Jun 2023, at 16:07, Alexander Kanavin via lists.openembedded.or=
g <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>>> On Fri, 30 Jun 2023 at 11:14, Changqing Li
>>>> <changqing.li@eng.windriver.com> wrote:
>>>>> Remove log_lock.pid which maybe created during do_rootfs. In commit
>>>>> [dnf: only write the log lock to root for native dnf],
>>>>> native dnf changed to write log lock to root, and target dnf still
>>>>> use /var/log, so log_lock.pid need to be removed post do_rootfs.
>>>> This is not making clear why the file needs to be removed. What
>>>> problems occur if it is left in place? Is it supposed to be added,
>>>> then removed by dnf during do_rootfs, and if this doesn't happen, is
>>>> that a problem with dnf that needs to be fixed, rather than removing
>>>> the file manually after the fact?
>>> Absolutely.  If the dnf image creation is leaving lock files then we =
fix the dnf image creation.  Does dnf leave a daemon hanging around? Does=
 it leave lock files when it shouldn=E2=80=99t?  Either way, this should =
be in dnf or the image creation code itself, not a generic rootfs postcom=
mand.
>> Alex and Ross,  There is no dnf daemon hanging around,  you are right,
>> seems like an dnf bug, I will report this to dnf upstream.
>>
>> And there is no functional problem if this file is not removed, only i=
t
>> may confuse user there is an useless file that is generated during
>> do_rootfs, it should not exit in rootfs.
>>
>>
>> //Changqing
>>
>>> Ross
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184123): https://lists.openembedded.org/g/openembe=
dded-core/message/184123
>> Mute This Topic: https://lists.openembedded.org/mt/99869451/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

