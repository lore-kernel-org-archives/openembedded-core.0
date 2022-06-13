Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174B0C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 13:01:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5528.1655125307606357666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 06:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=j0pfSh16;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3163bef3e6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25DBKGO4032388
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 13:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0wsO2Qeh2GE+JYqSZAjsAzrCGexvwIyUfn36ZoGtW/w=;
 b=j0pfSh16SF6Tiv6TB/rgTaBD+kDEliqXtxuh1JDX8aRStljZqe6e1blCSovmM0kFJqmu
 1k1XqQFUG0T1tZwOgjhCn7khSOE+YMwq6yZiB58pVSKiXEX8fANusFhZkv2nG3OqLVot
 360YWrGLKD79QkAQtdoGYvhIozcBvRwe2H61dpSmYdGk5enpAiwLGMPcdFqqkVBw7JmU
 FwQtinVDku2eS3PIP0xTcTO0HABssN2OloXu/MIq/rD++nBBiCU5kRV9SYgEDtO7FDaj
 YyuwQtzsXkwBI122e318JCBmQH0S2Zyk7kWXTo3t9NfSPBgBCp6yk5agsNH9HZFlTBS9 sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91shwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 13:01:46 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25DD1jEV032008
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 13:01:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91shwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 13:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfthAMFreOnU/q6hKuRDmgpH2Oxlw828nfavjYu2XLp2XFPqgnh4LHGoOtOPKfG/AeO1SvsHLsQY4xEGumPaR+De58mqLjJOLeKvQPFQ33nVxR+MRi9J1Tez14MY6/isBIfYgzj7YQbxQyu60tyq3rZ6Ria69/j80wnQTrFswjkmtH3JyCWva2aLNVitKpKyyDBfzEfmgDJRzQ1ma3tL7TKLUcTQ5NlIXpj1bKwEY61ShJENh9ujEMWg2T2+8HYuFzAATW3sWlCKXYS7UeuOEfqa3iVwJ0sze4d+T7ccSJQGllzy117GbNQKs/Dy4at6Locf6gCfGQTDeojf0uZBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wsO2Qeh2GE+JYqSZAjsAzrCGexvwIyUfn36ZoGtW/w=;
 b=n6uX9u8EDqnpVCpV59fU1B8TFl5zrOZE9gYKtEMLGCKJFNa6AFXV1MRk9CPvJhzaWTDr4048+U+YtTnAZvPGf8EYc9VvGO8l3Rb4qtpoVZyt8X/mMUTo3+PAQaj1cLxqYJUto6vivgzTVmU2Sz+qJ42/irl/pCe4ih1Q9TQflAGmnAN2dcdAx/SPNcyi9tTw5hT6rwq5L1UZA3Dic6KqPAKUnRbAigWn5xvcxRqY0gd7YzEtumMdS0/4nTlOxfXLEyXHPjo9Y7gD/Tf/mzBo6NM/u1YYmsedbFtTaLKur1TdfRnK4iQOBptHn9SrCZRmXesfDDUGV5SxtwsUoZrNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 13 Jun
 2022 13:01:42 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a%3]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 13:01:42 +0000
Message-ID: <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
Date: Mon, 13 Jun 2022 09:01:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Gowda, Naveen" <naveen.gowda@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b8da10-a354-4a8e-6197-08da4d3cdcd2
X-MS-TrafficTypeDiagnostic: MW4PR11MB5774:EE_
X-Microsoft-Antispam-PRVS: 
	<MW4PR11MB5774EC7FDE69DAE8FF632DECF8AB9@MW4PR11MB5774.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Bt3S86/YYX8D70mhawP58IlhEJ7qGdO3pMmWC+nz+5wgz0roRXogT805kNzifQdewvM20UcYbO/siIAvDR0tL7bWaDnL17xxJRUYBmrWYhVnNc7/H6prb+iqHcW4+khFl2h167XsUMmhdnKU+uiWnSubTKebLzCNtXz+BNcxOCC5ZpmS7Skt3yLzjOutl/9Zod1MsWWxPzj79q2+kScPkXAK440t72iW0rlKpz895XKoJNrjMZhDomnzFQ8m4NXdo8ytBA01Tt6B4p1Enq5Vmr9xH86XWgBnVC2y54o8OXUi7KVUCXQ5mhXCoqx1jFHTSi4/DlSPpeMinjOzLVK+Rf96zFZn6JFbGThln1eTQIRPOndzyuyCLz5GtIst3IA6kQy0miBsLeWxzJnEZOyFgNnpNkVdHIZ8f96Po9ARL5mPpeDT9ID1/EJTVL0J88+eM1+5dMcWpiKpcgpiTqNigaEjLxnXrJWfR9u5lbGcBzLAz/NW/LRBYWv0KKEcHWw012G0+N6NYCgQ79jflm65ckheLGkiGMlfKHqA5A0bOPGjQYCrph1U1N5nUTEnCUW5Ew+vGpkyYJrdkY5cMx5ZwG0goCi2hALe79Ejcw4YzPQjpf19aKdE8gleNAUI2ELedFwtxU0SGOUmfO3OxJMXlQfYZflT3GgBAWB2fPCrFewCUB+dPrKKOVap7l6SUeMr3ZBsKkVODqJSqjCcDV/ilhzagQ9QbAb6ikO8IY+289Y/0cHdswmPgs47zaY94Le91v6efxkLp4BT5RRo8sCYdtwtU8jJKLC19JIpe4yXbC/vUCLlh4pk+7agDKPMegC7LechLQU3jjfj0sOT3HQoGbG0TaC/xCkNnI9Ye8qLJDRK8Ra4PbYH/sHkv3XfcXAIYeeZgwrT/EBr0B4xy0C6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38350700002)(36756003)(110136005)(86362001)(8936002)(66476007)(6512007)(8676002)(6636002)(31696002)(38100700002)(53546011)(6486002)(6506007)(4326008)(316002)(2906002)(2616005)(6666004)(66946007)(26005)(83380400001)(52116002)(5660300002)(186003)(31686004)(66556008)(966005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tko2R3U0Zy92SStDS0lBbUlpRmY4ZTViSEtLY0dQS0NZN05qdVNmRXdzSGxZ?=
 =?utf-8?B?WXZKVDYranJ3OFU3SHBnM3NFcFVUbzFkWWsvMDJTOWdzZ1Y3dVNOVG5Qb2Nr?=
 =?utf-8?B?RVR0K3BBYm5kdEZuS3B2UjB2YitEaU5La2ZPdmZpVk01bjRKdWNqc2VrRHMw?=
 =?utf-8?B?NTNYdnV3OTJlcjlRTFBTdzZkRzR4Y2N2NzBFdHhOS2pVRTg2Q3hLOE5mZjUy?=
 =?utf-8?B?Mk04YUtVZ1lMc3JOeWVuZkxWSmhySTZ4Y3ovNGxWaFZyVkI4K0JYdHJuTHA4?=
 =?utf-8?B?TkFPNWs0bEFyb1lvVEZ4UUQ2VDkvZG91M0Y2U201dHFxTUZCekVpaDZWc0xi?=
 =?utf-8?B?b2kwK3FJK3BNUWM4bzhRUFp5S3QrMFA5UGd5Zi9TN2FmSTJrOXA1RFQ0WUVa?=
 =?utf-8?B?T2pObXNISmN2Qzd2STlHNU8vWS94YmZnWkNnSGMwVGloanQ0QlpUbVQ2Z3RG?=
 =?utf-8?B?TlVuQzdHb3F1eTlQazdMdjR2aHd4aEpBN2hFSEJuaVp6bVpPVnNoZG81ZVk0?=
 =?utf-8?B?S3pKd1BMU3VMZXFKaEtuc29VZ2xMSisweGQzRXg4R1VXMGJWeFgrM3VhZVRC?=
 =?utf-8?B?Q1Y0bmlQSUs3RjZMRUR1WGpkeXkzdVI3TWtsZ1dFM0JTSGM4ZDFSSzZGeGhO?=
 =?utf-8?B?RWxVTVkyRVNiNG93QVkrTVYxZDk3aHE4cnN0eU5zTlFiMWw2c1QrMVgrYVVx?=
 =?utf-8?B?cE1Mdm1tdEQ2d3I1UmZtbzlJTHM5ZDNyQzlNck5sVTl0dEdjRFpkdkk3ZWNZ?=
 =?utf-8?B?bWFvNzVoakVOMlhPeURHbExUMVFHMnBoUVQ1T1ZvOXZNWFJiMDZzZlhmOUU4?=
 =?utf-8?B?d0hmWFArYjh5WFQ3YVF1TElBSHpSZWJFeUVBTDFFNUc0dzVxTVpvbk80ZnlX?=
 =?utf-8?B?ZlQwV3BhaHl3dTFmeFo0RGRZYndlUm1pT0hEcEpWdC8zRFplb25HOUtET3ZC?=
 =?utf-8?B?QUNnREo2bUFFQlVFT1FwWCtCbGlhSFRjYU1hcUhsSDdrMWVhNEwxa2R5Vm82?=
 =?utf-8?B?aFUyTHkydm5RY2pyOEtpNExJb2NRZktoc2hvS1dKcmxPZHcwUkdDNUNSQU9i?=
 =?utf-8?B?S0JhUDFhbkhGMUVoQndqT0tpOElyU1h4c2dheFVJQUE3WXAweDZFUlBHL28r?=
 =?utf-8?B?YWhLNGNHWDE5SG9DV3pjZE55Wkdpb2FOL2kxVjZweXJQcWV1NmJrTmJObUhK?=
 =?utf-8?B?dk1DekZsZkNFQzU2NG9tNER0WUtNLzNYaEtiRTZwZ1JkUXBOME94TFpmYzVu?=
 =?utf-8?B?YVdnL3MwS2lucUZ3VzFrek9ZUUQxYXBSTExBaDVHOTRCQ0w2NUZma3c0NXU2?=
 =?utf-8?B?bm1HZVpkZ1dQMnpHLzNGOG11dTh1clpNMmg2bWp0VkVOM2cvZlh5QTMyL2Ev?=
 =?utf-8?B?Y05MNGpSQTBmaTllbDZBSmNxWXlLVlhGSHRvYnVyVjFGZHFPV3RkcHlGL05W?=
 =?utf-8?B?UDVBOGVDWVdxajBXMnRHNlMwR3NMY2lhNUMzNFBlV2F2ZVNoYWlKRXdGT3NK?=
 =?utf-8?B?Z1NXUjJWVHdYMHpQQU4yY2lrTmJUV21EUUhwTGxqYmkxL2F3bmlCbVlrUlpk?=
 =?utf-8?B?d1NnUWw3NHJNVE5IWjd5NnJ1Z2VMc0RoSTRLa25KMS8rUXE2R1BoWmdCcDRr?=
 =?utf-8?B?UU1vNGJtZFZ2OTlDS3g0bllwRjF0cWhPL0x1cE1tSlRKU2R5TVJjQmhEMEFF?=
 =?utf-8?B?L0k0bnBsYUZHYUIrMnBXMSs0M0l4aDBycUJZeUVYdXN2OVk4NVhqUEJJbnh1?=
 =?utf-8?B?T2tyaXRNTFh1NEl1THNKY3pnOGdLV2QrV2lLR3BBdWgraXFhSmdzL1p0VzhO?=
 =?utf-8?B?dkNRMklQUlpkZjBnZDB1MUcyK05PdWRyY3ZmQWEvSEFVWHZsUGpzY2FNd2s1?=
 =?utf-8?B?Y2c1dEgrUVRyVWNacWtoMmVKQURmNEpLMENVbDljQlV3M2RZQ0NxOXJGQlpG?=
 =?utf-8?B?OEs3dG1jRjNRdkZoc2FQaW1nNWY2bzVJTklnSHVReWt6ekR3LzB3QzcwM09x?=
 =?utf-8?B?NXhzRmFxMXUwY3hSdjVFSE5vcHFrMU9kM083MitvaFVoUGlJR01Dcmd5TytN?=
 =?utf-8?B?N1QyMXYyY0lVaVNJZ0RBTlM5eVFsdXUzSWZmdmhIeGJEN0JhclhFV05KNmJY?=
 =?utf-8?B?ZnZjbnc4VzFZVjc3TkRLaE1iQVp5SHRRdExlZ1RSWS9mNENBS0JhQXErZDRR?=
 =?utf-8?B?UnFxZ1FteFU5WGQzQlFUWlMxRkxXK1lSbkk4ZVovYk1SMG5kbDc5NkdRYlMx?=
 =?utf-8?B?eU81aW9MSkpUR1h5NTJQL3VmTlZoMXl4bm53UkpTMDlSUWthd1plTlJXdVhL?=
 =?utf-8?B?MDBqdmhjYTVTRW81ZlMvdS93Q1JkdjZ1WU4vZktHSnpwbmZsTXYxajFPakdB?=
 =?utf-8?Q?XILvfEqboLmV/YxvapucOD1ipecRYh7oT1inB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5b8da10-a354-4a8e-6197-08da4d3cdcd2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 13:01:42.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r47sjcSv0NWE2V/9o8KM5bNAGQpxNtwNSPTHcWCge9Yh+pIASZmtrJTaE/ppv3h/Loa3CG0ZDdEXE3IYVADUXr7NnwaMG2vq9Hkz0RipI2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-ORIG-GUID: yxCuHpWLHYvRh9ZabyXpHbHb6zNMNjXm
X-Proofpoint-GUID: hV2lKdh9OmqDv0vT07zoUaWBGfLQDmTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_05,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 13:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166842

On 2022-06-13 04:15, Alexander Kanavin wrote:
> Rust 1.61 is held by rust-native regressing on red hat distros; fedora
> 34/35, centos/alma 8 all show this:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151
>
> Alex

Thanks Alex.


Naveen, Sundeep,

It looks like there's been a change to how or if libstdc++-static is used:

https://github.com/rust-lang/rust/issues/97138


This change is part of 1.61:

https://github.com/rust-lang/rust/pull/94832

so perhaps we need to change our recipe. Anyway, I only took a quick look.
Please work on this issue ASAP.

../Randy


>
> On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* has Failed (devtool error).
>>
>> Detailed error information:
>>
>> The following devtool command failed:  finish -f rust-llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
>> NOTE: Starting bitbake server...
>> WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
>> Loading cache...done.
>> Loaded 1643 entries from dependency cache.
>> Parsing recipes...done.
>> Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 35 skipped, 0 masked, 0 errors.
>>
>> Summary: There was 1 WARNING message.
>>
>> ERROR: Traceback (most recent call last):
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>>      return func(fn, *args)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>>      return bb.parse.handle(fn, data, include)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>>      return h['handle'](fn, data, include)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>>      abs_fn = resolve_file(fn, data)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>>      raise IOError(errno.ENOENT, "file %s not found" % fn)
>> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>>
>> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>> Traceback (most recent call last):
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>>      return func(fn, *args)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>>      return bb.parse.handle(fn, data, include)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>>      return h['handle'](fn, data, include)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>>      abs_fn = resolve_file(fn, data)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>>      raise IOError(errno.ENOENT, "file %s not found" % fn)
>> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>>
>> During handling of the above exception, another exception occurred:
>>
>> Traceback (most recent call last):
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
>>      ret = main()
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
>>      ret = args.func(args, config, basepath, workspace)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
>>      updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
>>      updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1671, in _update_recipe_patch
>>      redirect_output=dry_run_outdir)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 705, in bbappend_recipe
>>      appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 632, in get_bbappend_path
>>      confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
>>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 167, in wrapped
>>      raise bb.BBHandledException()
>> bb.BBHandledException
>>
>>
>> Please review the attached files for further information and build/update failures.
>> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>>
>> Regards,
>> The Upgrade Helper
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166404): https://lists.openembedded.org/g/openembedded-core/message/166404
>> Mute This Topic: https://lists.openembedded.org/mt/91480159/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux


