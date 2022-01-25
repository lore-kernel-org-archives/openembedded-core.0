Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44733C5DF62
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 23:07:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5104.1643152042390132983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 15:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=hC+eNeBS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=802412c067=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20PMtElY001506;
	Tue, 25 Jan 2022 23:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ULN+3AO1uQbta+BrOtVm51ksgqxSEYG5eaHHtPUVXLY=;
 b=hC+eNeBSyCgcrpXLMrbISwRTMHKzlDS2XBlwj7tdnXJyniHN4JOBtNcHtLZFZphtgZNy
 ok2J75Te7lV4ZWX2Fg+yQyiSZF3YJqnGHu2RK/6tjsLNlpE65Z1dB/UNrDM3pbzamenM
 tiFKXGoSA18bLEbxZXO88zXwbBLUCvIkoJg7k4pbXcQVkmZjyLkbnkiTLBNXZfMHc0ka
 D5l6MKA1G+l8UWiKhqsjOFcTx8OgGHQYk8lOkbNmjIy3qzhPYMeEVOMzAKFwrR1pHosK
 H41qidgCq+zU1KwQFhJS4klLmAvHipza2Eb6fAADFHGFmba1Qqser9yYHmO/Nk77O0q8 zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsqcvhg0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jan 2022 23:07:21 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20PN7KbI029071;
	Tue, 25 Jan 2022 23:07:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsqcvhg0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jan 2022 23:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIl79kXqIXTbQEg2U94zboWCzkN6qIoYFaU4N8gbETCQouy8t/5MySiGSrZ/qI0vPDsN7uA6cRKn11UeS+khIo7CXbyuiEtwrAF5aX2y5/2KaTQ9X/8Ra23gqclw4Os3f/MnlLb0cbC2b1zpq+9SDNx5U0g9TiwLPCaIPID6gcMNhEQeoKXuvJ8ADGxcLYNx1WmcRDiG2bQMDIMvvwJaTr7WDN++/synjZgODzDlNUNK8lb2P6XL0h3dyWJ0qOscFObuD+YICFpskh0Z4UD217Q+yE5ysFUe4ib4csHYuSC7kvS6OU5ZYn9V2ZjyAtSfCIfUoO5OM7LnsdNAQrOesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULN+3AO1uQbta+BrOtVm51ksgqxSEYG5eaHHtPUVXLY=;
 b=XtxOQ4GRAzesdMBgJjMr1UEFxom3U+cWkQnI90dXMbuxJA609IBq3VUhDurZkOs7DS8I7tj0A2Gr4QnsdHSKrRGGkdmbcCi7yYOesMLqsqTlt5Pn9hw34DFvGXzssPw14KMeH+1HEtl9/3b7NWeMXwsqEoSH2h829bYRee0E3B7zP5OeGy7k2lqkqxvE8Rae7zlQ5NN/fYKuZL5ikhtE0BqWFxM8IUTdPO+MU8vqQH41oYfzLON+gcDMXMjbclOt5a2hD+n5r2UgYQm0xsOXfSiMhBYdCcfqT9nSoqpSShTt2bauRLlzHf3pd36gVDNYZ8sE39FDCOKyolcy/NBLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1387.namprd11.prod.outlook.com (2603:10b6:3:7::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Tue, 25 Jan 2022 23:07:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f4ad:a867:7f2:8958]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f4ad:a867:7f2:8958%6]) with mapi id 15.20.4930.015; Tue, 25 Jan 2022
 23:07:18 +0000
Message-ID: <028eb842-5749-2f0c-a028-8717dc948821@windriver.com>
Date: Tue, 25 Jan 2022 18:07:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] Inclusive Language Proposal for YP/OE
Content-Language: en-CA
To: Jon Mason <jdmason@kudzu.us>, yocto@lists.yoctoproject.org,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eaefb46-c174-4d24-f89c-08d9e0576f03
X-MS-TrafficTypeDiagnostic: DM5PR11MB1387:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB138767464FBAD3F770655B3AF85F9@DM5PR11MB1387.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	veGliB8Du2atSJQvnPC5t+ePoMl3KvS+D/9o0rAQOpZP6dih2UZmLoMfZV2WoS4YaXD3RB1xthAV5qaQ3sM2orFr3NyqSQTe5Syt5RMJY42eAKT5v8y+EIL5B2F//S+dWl/Bxjb9G6b4OKKEH5n0tMkHJQr4wFLO1uz4SO+6qYkicEuVGSvUkaAPhqG8S7oxn/5B6XnfoucG75pTlVHjJ4QekXqiCuufZkzEQXFKO14oi7+TNhhkMZGEwWLUzwsc478NH4YyCDtiWByKSb0o5LEiw/qsD6nslHgj7wpVjgWUQgtDAtKepz35EVCls/qoO/QgYagcO7s88cigu2A/dgg+Vpopm8O0NdjigE3emsxqlM663Fd7kic62HagAVB2xMW4ftrifCG+rcR/IGf3qPQ6osBJC7LkwdJiMaBugJWpVNnaLTkiDdxFs3WJUEa513QPumkbFJ8RutN8JaDaKv5AwvX3qnHztzdHOaQPHXLLRlQ8uEG9f3HpU4ZnI22URifzW7LxTwy/WojiTxu0CwE5VUgUIC4Cm3mByQVomnNCFeEGDGPDxUh7xgZIVPFJlC7dnQcFqIEJmfv+bsLVGGde5SYSPbdCRsb+Ux//zQgohplyuBt0dpD6VCWUSq3kOOynAY1BFKmCUkc7ZJTG2y+wmTvNZdJzi8lrauo4DFqQjZMG++O1Lqyp57Es4oaIhFIUolbwEXaCEOx+cRIQH5CCrbcYpQj1LkMJBjJHWdCY4KBcp0NA6K5d8O/MbYsjdXP5TUOEhrPIsSBGwmRL9/FpeOyi+jqGVNgIGesZqbIDRreKalk0QyhwXvT2iZUgtD+RUjJ+XyVZxXqygt6X6Cb+u0kpV2h5hci6p5jIZkYF3H6dEak4yhI1+K1Wgb2xPszG7Z53xGY3Z47+IlbuOs0cd+Mtk5CKK5AJs0Po6gU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(966005)(66556008)(66946007)(66476007)(186003)(38350700002)(52116002)(6512007)(36756003)(38100700002)(8676002)(6666004)(2906002)(26005)(6486002)(8936002)(5660300002)(86362001)(508600001)(31686004)(6506007)(110136005)(316002)(31696002)(53546011)(2616005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTNOUmcxcWYyUURHZGlCaHBkejBJYnJDT0ppSzJ6aFpZd1Rzd3ljM1NTOU92?=
 =?utf-8?B?elFhRjRENXZmVzZEUHFIK1JJNGV3R2hmRWtMbERiK1Z3MVFBVFpteld3Vmcy?=
 =?utf-8?B?Y01kZGtZVXhvdit0b1NXWm4xSzdtTll5VDkrZTcwcUNuTTZjTGZZTDlJUENJ?=
 =?utf-8?B?U1JiSlhpSUdad1pTcG56QjBLTWkvZ3p4L2RaQkZ5UU45Wk1xczNidndnbFBm?=
 =?utf-8?B?N2d1aytrb1FqTHdnMXkwR0gyMHc5MzVKZ2NKUmNvZ2dydXYzMGhnTTd1SXhx?=
 =?utf-8?B?cU0vaFJVSG9JUXNGcWhSd3lwejFyMkhEWlBsMHVoODBJSjJMc0tpVnVlNWpF?=
 =?utf-8?B?SjFWNVdJeGxKbEI2N0g2c0RCVDhBYmRod1FxamdGM3pMdytxYXprMTdTUXli?=
 =?utf-8?B?T0Q4VCtXTVA1TnVacjh6NnVrWWZKelVJanBqOU9EdmVUdW0zVG12SVRDRG0y?=
 =?utf-8?B?Q2VEQ2JPZlUwblUzbStMS3lBdE1rNUhNandVY3BWaXY2cFlYVVpzM0xKN1RZ?=
 =?utf-8?B?NklVMjBTSEVxemtiSStqWmNMVTR5Q1dXSVNrb2s2Q3hpaHVVZUNiYVFGYzNz?=
 =?utf-8?B?SjVUa3VsbnlGY3hUczJUSzhFNVVUbU9VN3hhekxDUk5NbnJnTHpjVFBkc05P?=
 =?utf-8?B?NDVSdWpQUkFYRDNQNmVYdUM5amx0TWNwYkpibzJXS1h5bi9PeWFnckszTnhO?=
 =?utf-8?B?QjVKTktVRTgxUTU1bGVHV0NnNkIxTC9zNmxqQWtSWis2NklFS0ZJcFZpT3dT?=
 =?utf-8?B?UXhYTCtCc2xMWUg0STRucjNSdzZYajliSkpTUUZzR01WWE5ETFVKeWhnZWhi?=
 =?utf-8?B?NzVCODVhZ2gzYmUrY1I1Z0ZQZzR1T0Y5UnpPUGdvRlYvQXBHVFdKZ0lKUnll?=
 =?utf-8?B?M1A5K1JTUjlITXBURmZPaGdqaVVHU2o0NmgrWjRCbEdpSU5xVzlnV25VRCsy?=
 =?utf-8?B?bjdWcjlFREphenpMRXhFdGhybm9vUGtBY1NXUmpQUGNRcHFqTWpZUG90cUtS?=
 =?utf-8?B?MWlIbEVCeDJjdGE1MnV3eDliMlhQUWthUDBieUN2ZjltMzB1VUMwK3dSYXlx?=
 =?utf-8?B?N0FOTzdOa3kzVlg3NHY1MHhCMnNNQytva2orV0hPZFlYUHBKYzc1OW80dkZi?=
 =?utf-8?B?Q3hYKzJ3Yy9vc2tnWFdBMFdvTHFQOU10anJLSG5TUW9SRlFUZFRHakZBZTMy?=
 =?utf-8?B?K2FCbENPT1JUUExwZDBqZDFmQWtGdUQrWHhycDFCbXUwY0ZyVmJpbGF4ZzA1?=
 =?utf-8?B?U1VPbk9WbnFTUkpWUVhiODY0cWs0QTVlcitTWXJwckJ5aGhxd05rUldtc3pM?=
 =?utf-8?B?amFnWFpkcDBFcWRLYU95aXhVZitPdWN5Tnl4VXpJU0RXcXpUVDArTm1YMjYx?=
 =?utf-8?B?OE54UjVoQVArcGM0N0JVZmVROTZ5aGthVkt0VjNMa1czNHlrNTVNVmZQbm1F?=
 =?utf-8?B?RmpDeHkydENlWURBbzhWbnU0SHNpL0lMOHNGbjlpbUc1ajlzOWZIQW9YK0FF?=
 =?utf-8?B?T0hpemdualA4eVRnaEZlRUF2OHJockl6QktseVd2eVdhRzJZZ2swamdnY1pZ?=
 =?utf-8?B?eGY0RGt6YU1UYndFbFRWdVNWT3pQSTBhUjl2SzkzNmxtOUpSbGx4eG9rR2o4?=
 =?utf-8?B?SEdTNmJoaGtXeTdrZXlHcGVYSEZnOHloNGMzTlY2R05mMWN6Zm1wSlBkUVlD?=
 =?utf-8?B?R25GL3JmbUVZL0RHKzZobUE1RkNlcUxNVXNMWlkyY1VGaVRvZ2RETzBRSGFD?=
 =?utf-8?B?YXpic25CdTJvYWZPNGIrOVNqWDNyeGhOU3lwbUJXVlVlM1c1Ti83czljRFk4?=
 =?utf-8?B?STFPSWdEclZvUTJzdVlmVktFZHkzN29jdVVYd2VkWnJKUElXOG5xUVpybURM?=
 =?utf-8?B?Y3IvcmtJajcvd3pKKzdqU2oyVlhoVUpVM3hOVDlwdUhweFFpalZRWDlGNGNK?=
 =?utf-8?B?T1hkQU9ySVlUcXIrQlRjV0FwSFZLTnVFeExWeXR5alJzaXZrYTlGVDdpSnY3?=
 =?utf-8?B?Smp4Ym9IYy8xVWE0bmZxN0o0SXlVUjRpSDYvWHlnaFhaa3UvU3FzNERSbThm?=
 =?utf-8?B?eTlXaUhnV2UwM1A4cVpQbFQ1WlAwTnE2ZHdaR29Hd0RGRm9nVGFwaWxOY2Jm?=
 =?utf-8?B?aFl6eVk4SWJyNjJKeVlUZDJyOE15Nm1YYXZIYWkwVDZUVjVyV3NmZlVWbWRJ?=
 =?utf-8?B?TWFrakR5TXBVT1pyOXZFeWMxSFRqbU50WW11MCtGcm1xTVhLU3hpa2JycmQ2?=
 =?utf-8?Q?ApL0JxM1Ml+gglK++fG4+CoRKla0xhCKkYY3yJxdi0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8eaefb46-c174-4d24-f89c-08d9e0576f03
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 23:07:18.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VriXkSRMIDgKc5wRFubyb0AkACw4J+nahMqWH+tkMHhhVOv0pSsXffpGuzFvmikfBJux3OfG4ni1RFx41mbjCYG9smaX9gp/rddOwkAZcAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1387
X-Proofpoint-ORIG-GUID: AgmJ3mAE-DqtQHik2zVZuXFWi4gPQpSX
X-Proofpoint-GUID: FtMLbgSTRx66v3YYkwJlLGMtls7E9jY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250140
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20PMtElY001506
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 23:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160952

On 2022-01-24 11:17, Jon Mason wrote:
>>From the beginning, OpenEmbedded and The Yocto Project have always
> strived to be as inclusive as possible to all races, sexes,
> orientations, religions, nationalities, and any other thing which
> might divide people.  As continuation of this striving, there are
> suggested changes below that are being proposed to make the projects
> more inclusive and show the community as the professional, friendly,
> and welcoming group that it is.   There are words in use by the
> projects directly or one of its derivative layers that could be
> offensive to some.  For more information on which words we selected
> and why, please consult
> https://inclusivenaming.org/word-lists/overview/
>=20
> In the process of changing these, we are using this opportunity to
> make the terms more obvious and useful, as well as removing cruft and
> other unused code.  This is the pure definition of a win-win solution.
>=20
> With this in mind, a group of people have tried to identify issues and
> come up with a plan to address these.   We=E2=80=99ve divided the tasks=
 into 3
> areas: bitbake variables, oe-core variables, and everything else.

Jon,

I've looked over all the changes and agree with Ross on his one suggestio=
n
and that the rest of the changes are fine.


The new terms are equally or in some cases more clear so hopefully that=20
will
result in less confusion and a better experience for everyone at the=20
one-time
cost of a hopefully not too bumpy transition.

Thanks!

../Randy




>=20
> Bitbake Variables
> Taking issues in turn, for bitbake:
>=20
> For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN" would
> become "HALT, NO_NEW_TASKS and "WARN".
>=20
> BB_ENV_WHITELIST -> BB_ENV_PASSTHROUGH
> BB_ENV_EXTRAWHITE -> BB_ENV_PASSTHROUGH_ADDITIONS
>=20
> BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
> BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
> BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
> MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
> BB_STAMP_WHITELIST and BB_STAMP_POLICY -> delete the code (already merg=
ed)
>=20
> basewhitelist and taskwhitelist as used in sigdata/siginfo will need
> to be renamed and older file usage of the variables renamed at import
> for backwards compatibility. The variables in bitbake along with usage
> of abort will be renamed as appropriate.
>=20
> For most variables, errors will be shown to the user if the old
> variable names are set. Mostly this can be done in event hooks but
> some like the BB_ENV changes will need special handling.
>=20
> These changes hopefully improve consistency (e.g. a consistent BB_
> prefix and BASHHASH as terminology used elsewhere) and also improve
> the description of the variables to be more understandable to users.
>=20
> OE-Core Variables
> For OE-Core, the proposals are:
>=20
> For blacklist.bbclass, the proposal is to add the functionality to the
> anonymous Python in base.bbclass instead. PNBLACKLIST[xxx] would
> become SKIP_RECIPE[xxx]. INHERIT_BLACKLIST would simply be dropped.
>=20
> SSTATE_DUPWHITELIST -> SSTATE_ALLOW_OVERLAP_FILES
> CVE_CHECK_PN_WHITELIST -> CVE_CHECK_SKIPRECIPE
> CVE_CHECK_WHITELIST -> CVE_CHECK_IGNORECVE
> SYSROOT_DIRS_BLACKLIST -> SYSROOT_DIRS_IGNORE
> LICENSE_FLAGS_WHITELIST -> LICENSE_FLAGS_ACCEPTED
> UNKNOWN_CONFIGURE_WHITELIST -> UNKNOWN_CONFIGURE_OPT_IGNORE
> SDK_LOCAL_CONF_BLACKLIST -> ESDK_LOCALCONF_REMOVE
> SDK_LOCAL_CONF_WHITELIST -> ESDK_LOCALCONF_ALLOW
> SDK_INHERIT_BLACKLIST -> ESDK_CLASS_INHERIT_DISABLE
> TUNEABI_WHITELIST - already removed as obsolete
>=20
> For the ICECC_USER_XXX and ICECC_SYSTEM_XXX, we think these can likely
> be merged into single variables:
>=20
> ICECC_USER_CLASS_BL -> ICECC_CLASS_DISABLE
> ICECC_SYSTEM_CLASS_BL -> ICECC_CLASS_DISABLE
> ICECC_USER_PACKAGE_WL -> ICECC_RECIPE_ENABLE
> ICECC_USER_PACKAGE_BL -> ICECC_RECIPE_DISABLE
> ICECC_SYSTEM_PACKAGE_BL -> ICECC_RECIPE_DISABLE
>=20
> For license handling, we=E2=80=99d use the opportunity to clean up the
> WHITELIST_(ANY LICENSE) syntax and replace it with a
> INCOMPATIBLE_LICENSE_ALLOWED_RECIPES, which would be a list of recipes
> which are of a blocked the INCOMPATIBLE_LICENSE list.
>=20
> Everything else
> The migration plan includes writing a script to assist with the
> migration. In many cases it can likely make the translation. In cases
> where that isn=E2=80=99t possible, it will aim to list the areas the us=
er
> needs to fix references.
>=20
> A warning mechanism will be added to bitbake to detect usage of old
> variable names (post parsing), except for BB_ENV issues which will
> likely need special handling. A (limited) conversion script will be
> created to help with the migration. For those instances where a 1-1
> mapping is not achievable, a list of the occurrences and what it
> should be changed to will occur.
>=20
>=20
> Patch files in OE to be renamed:
> 11_tcpd_blacklist.patch -> 11_tcpd_blocklist.patch
> mount.blacklist -> mount.disallow
> 0001-lxdm.conf.in-blacklist-root-for-release-images.patch ->
> 0001-lxdm.conf.in-deny-root-for-release-images.patch
> 022-RH-Remove-the-property-blacklist-exception-builtin.patch ->
> 022-RH-Remove-the-default-property-exception-builtin.patch
> 0001-Cargo.toml-do-not-abort-on-panic.patch ->
> 0001-Cargo.toml-do-not-exit-on-panic.patch
> 0004-Cargo.toml-do-not-abort-on-panic.patch ->
> 0004-Cargo.toml-do-not-exit-on-panic.patch
> Also, there are a few others outside of OE that should probably be patc=
hed too.
>=20
> Branch Names
> The =E2=80=9Cmaster=E2=80=9D branches on the relevant OpenEmbedded and =
Yocto Project
> git trees will be changed to an alternative name at some point in the
> future.  The current preferred name is =E2=80=9Cdevel=E2=80=9D.  There =
is no time
> table for this currently, and there is no obligation or requirement to
> change the branch name for any downstream project which is beyond the
> project=E2=80=99s remit.
>=20
> Similarly, there is no need to change any recipes that are using a
> =E2=80=9Cmaster=E2=80=9D branch as part of the SRC_URI.  Those are outs=
ide the scope
> of YP/OE and this effort.
>=20
> Note
> These changes are only to bitbake and OE-Core.  There is no
> requirement to change any other layers but we=E2=80=99d note consistenc=
y is
> encouraged and helpful to users.
>=20
> Helping
> If you would like to help, please put your name by the items in
> question on the inclusive language wiki page.
> https://wiki.yoctoproject.org/wiki/Inclusive_language
>=20
> Thanks
> Special thanks to Richard Purdie, Michael Opdenacker. Marta
> Rybczynska, Scott Murray, Jan-Simon Moeller, Saul Wold, and Armin
> Kuster for providing their time, technical details, text, and feedback
> on this task.
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160881): https://lists.openembedded.org/g/openembed=
ded-core/message/160881
> Mute This Topic: https://lists.openembedded.org/mt/88650128/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
# Randy MacLeod
# Wind River Linux


