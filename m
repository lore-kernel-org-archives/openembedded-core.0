Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021CCC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:45:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1384.1646415938304405647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=GllsKwd8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0062b98726=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 224GG0oX027954
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Mar 2022 09:45:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KtWF3sEKNAcInJCk7e8dPKe3N88TrHlZaU6D2EOBz3Q=;
 b=GllsKwd8tQK4jdARvMlL9IoQmbzOmnRD9YMKc1y9+TrmJ3FmQZKZhw4vZhh/zz+jHfd9
 iHYmhExuLzwXLfvNX4BG3IRHpGBZMrtcEh8KM6v9R0uxQ/CSUQZXKObPhOK204FErfTJ
 pPiOBENhnR5cXzxPJA3rsnJ77CdgFdqy4stYug5YtoAXtkgH94J/uYMdqIHRTAtc0eqA
 XSHlvzjnnUwE9M00Ltp06C2gEZbxwI3JGonhvEgG+LIefoDcowLN5uOcvZegtcxILEBp
 8x+rAkt/+vXHZNjNl+1buJ6t9D/Bjz8nySWC1H4qeipX9N4YjdcXkiFLomb6Jg2TuOIi Zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jj8s0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:45:37 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 224HiHIU010547
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Mar 2022 09:45:37 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jj8s0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Mar 2022 09:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3wrt6WjqKJGJBgTU+9yEwvqeR7DQx36fDxdNPXiD8OUmIQJ2UCGLhlAXRbam9uOFYcV856e52JL0n8yvbdq7sL0kMnBFzonNuM2tzbdJF9PRrDqTbyFFL8lZxnVU9WRvDpCZBNVsZhH4EKprk3koWsATStfZ8VDcUDyP9OdYw9v1bu0CgDJadUKlOjL1AY2fzjAqZKH+qmySOMhKhnz/VpLuPjKbBgOXdJf5QHNAQEzYfNgsn+n6meAauDGGGahubBRyNNugMNKc6ps02Fe0d+Nwr0ArtTsNiL7xGio5gTKF0TCTcEScKGtCD0c3xhXShzXNJ0NpJ1EPlqSzRU4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtWF3sEKNAcInJCk7e8dPKe3N88TrHlZaU6D2EOBz3Q=;
 b=TUlimu5m6E+LLdVPuTK8u0erVHm4PKsXdB4scu+ZkYl3KAouyLRr0oJdpYpSGwWlaLP5dYIA++p6SOTfxHXcSlItISRCMRrFIcX+F/nqRVXIHX1GbV29ftv4DnCXMeld3a/arAXx3bUzgkVWhdQNTb6ZEjm45yC2fsg+KtKN+qLOB46S49rYNsiEDatdH1su855+V2ZM5QOCob6qJ2U+rM4YrroZdYVUJq/xOAFhI9R6qS2D3cdDnmFt2Iy3nXjB2SSooBLHWDHD0vuEJgc4AFMHipvyDiGTPTHdLEwmBtI4qxQ56EthPwriDvm+1Ag5NoO6WJAVRwVL5HGE/kCGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 4 Mar
 2022 17:45:35 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 17:45:34 +0000
Message-ID: <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
Date: Fri, 4 Mar 2022 12:45:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [AUH] rust-llvm: upgrading to 1.59.0 FAILED
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>, Pgowda <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e963be10-682e-4240-9a85-08d9fe06c90c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4185:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB418505E16BCEB295F3C99937F8059@DM6PR11MB4185.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9YicJImPqEkChuZd8G037wgZbDKR+pQit2G/Yvmw/u+FksJb1MOxqoc1IQdezuLacG/XeRA9GK7arpv09CE/hVQnnuyd8ibsyOXeOf+EIQUj5vEtDEOt3UL3MYc+kr9JyNPlrow+m2CwVR4berZuRciFsboDxIzsESAiUvG3U9vbGu89aY9sSJDIbxA5XinCRKdtoO2p4uc66TfxsncmHG3q65J0VkRsJ7EPFEPnEYkpHfwjkG9DLgsqG3OxdQS72UbBdED40Yz3qbWiCaoRfxx6b7O8AaJ8sQwiS2B6EjIPqkv4u1l/Cwx5lr15BN5A4YuOT5ihd1EbKOQGD3JywrEOSVfceHJAlQB+sy6qQr4gTuqZIN15atJyFSUMfGHLQ6ELV2GGY2EcQLmXlQsaUUl6m1/tGFGEGztzGyiQiYZo0yaBpCUBrpKHSaiwsfE1Jdwmn9p9Nkwm2qjRV/oefD7ud2mBABencMPZ8v+SqdBUwFAip4ZwFYO86vq72QtITTqvxGWV7aveiSsW5+73uY8Dr8MQU1wHX99oy5NitGdr+MQvguLAz2mGNaEsFgA4Ghz2RnyctzqudWsfMuOxBuezWhvsbnEnI+M8805VGmA29homaL8tb+dVtvWcoimTEyfxEsGNTP1i0gMsVAJoJ2rQBL39k+ZRGDqWiCwUj4EM0XNc5tCe66Lycf01LjeL01pKsutOTwTgrySWi8TSBMpUpt3D5czDZ3fk5aYVBW6gzqctnMwFwoKtmIxYIZjNV0/CJlVPQwjEKJII0BE1OrDRNB6Ae7KgWSGKoQFadO15+QsYGrmPHHBJkyjF9x8CG6DQMMnjILb57RalHCRHwCl4xpH8n9MibVeCesd1N5A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38350700002)(38100700002)(8936002)(26005)(2616005)(186003)(6512007)(6506007)(6666004)(52116002)(53546011)(31686004)(6486002)(8676002)(2906002)(86362001)(66946007)(36756003)(110136005)(316002)(4326008)(83380400001)(966005)(66556008)(66476007)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGw3TTJtYm42ZXlsL3AzZ0VoZVdGNmRmVVl4N0pPZ09Cc3lUNjg5YUxqVUNC?=
 =?utf-8?B?WWUza0ZJSzFibUVQdlBGcEFpOXNzcmJOMHBQOGxNSzFoWUtmbHJmVUkrNXJO?=
 =?utf-8?B?Ym14Q2p3NHVIdzlXVktFeGVsMEpIdmJlZHhtQ292NEFEdHZWcEpjbUFZa1l5?=
 =?utf-8?B?TlAyVk5hSmc5S1NWcWxGcFZBNkt4bWlUZUcvSlNzaHlhbFJnZnRsS3E3M2ZN?=
 =?utf-8?B?WVhRMjZrQll1Wk05TjA5MlJmQUFKa1M2VDJ0VWptaXlodEZGbjhTZFAxTmlG?=
 =?utf-8?B?TEVCenpQcWFXSlNCenBEUVVYSVduakhkeU10d3NhVHltVDNJMFBXcisrVFhB?=
 =?utf-8?B?YzM0WmxpWXYzcy9xeWRRb2xEa2hEempBVkMybE50WWJDUmdSa3pRUFByY3Vt?=
 =?utf-8?B?MVBndkZOMW5qSGVWSVR4R2JPYnppRFFucmlFa0hud1V2SUl1MTErdzlvSGpQ?=
 =?utf-8?B?UnJ0YmRQL2Rhc0VKWHg1cThaMGQ4dVlzTnJwRlpRdnlORHFLQkZXOGRqZ3lt?=
 =?utf-8?B?ZFBtSnZuWnh4aU1ESTBrcmxObTNlR2Fta1ZPYUhjRWZkblduRGttb044SWZ5?=
 =?utf-8?B?N3pqMENEbWNxNCtISDFJc3A1blBKMU9HSG1TTDRWQXk0V28veXB0eGorZ1FR?=
 =?utf-8?B?RTg3dFJqQ091STQvWnY1WXFXNXI0V2poUzVmRURycmJBSUtFUm9ZS2h6azlR?=
 =?utf-8?B?NHVvaGNray8rSVVoWVl0RnJqNDV5WVJLTTJpOG13YVJPWlR1N2R5MUJOMWpR?=
 =?utf-8?B?M3llNllXWjVlSWlFc3J2ci9ld3pqVmhOR0NqdWt4dDArQUh1VGpFRXhTTU5U?=
 =?utf-8?B?S3hqRzBZblpMYUxYR2RRakNYNWR1RWVhdk5WNFNJaU41MlVVSm9kaHJ4Sm50?=
 =?utf-8?B?VzNvc0pVK0IxdUY5NVBCRUpoZTMxSXFUaDVlc2xzR1laN1FCVEVVOVRSME9q?=
 =?utf-8?B?dE4vUi9MZ3drd3VmVFZYTkpVdW85WGxnVEV3OWV4NkphTHFKQVlCVFlkRWdm?=
 =?utf-8?B?cDFGTnNoU3FCQ244d0VuVzJqaTVaSVhYam0weDBiSTZIZVBOZVB0R3JVYk9x?=
 =?utf-8?B?VHZtOWI4NFhJVkZHdjRvcEs3TkgwRUlycUdjMW90aHlueHdkUHA1MVpTOW5O?=
 =?utf-8?B?ZnhxWm10RndjbW5tQmRXZm9IZHNXMTVFWEZNQUw4Q3Vpb1RlVGphY0o0TTZ1?=
 =?utf-8?B?d1hOMzFtUHpwS21PUTI2OTdYRmFTUmxKYTJOVHp0Yk5rTm5uZTFjdEpFNlF1?=
 =?utf-8?B?NFZRbzJQUWF6YUFHMllhY0tPMFNhR0RMeTEzdDd2dTduZmNCUW5yWEV6ajhu?=
 =?utf-8?B?ZXdDeDZMZGxBamJTTUxtYzlIQVlJUlVjZ0ZLTUhiSVM2b1RRVVZZMG1kVXNT?=
 =?utf-8?B?VXU0dCtjYmNtUEZUaXRHcVE1dUkyZ2NuU29YcERtT0dsRFNSSzZTV2NXcVBa?=
 =?utf-8?B?RTZjSzVENXZiZER2Ri9YbUZZZjN3M3kwMm15MHZCNEpLd09BeHNUQWZNdW1J?=
 =?utf-8?B?TzNGeUYvTWxIS1FOZ05uNm9yVS9yMmZSdEVncmlqWTdEQXhPVmFRY2dTOHEr?=
 =?utf-8?B?a0JNUGVKck1wUkVGVS85QmNSQ2FMUmFqOC9iM2I2eDY3c2libmhodmdzUER1?=
 =?utf-8?B?bXhLZFZpZXlKWFBhWnFhZE5zL2FEY2NPc2JaeHRiSUsyL0JNMTV5Z1JSbHJk?=
 =?utf-8?B?MXJJbGdnTXlvQ3NZODVkd2pqQlhCSjlkMzN3bXhGSXRJdFNNZm5EdVNkb1Rv?=
 =?utf-8?B?c2J6T2h1ZmY2WmNtMjFZeGV4SEFLRW9hSUNMbjJtQ1FOS2Y4emNCK3VSNHRG?=
 =?utf-8?B?Zm9ZREVmVlkyczRUamhFVVRlS09zdTVvak9lMU84akxoais3N1EydStxTXJP?=
 =?utf-8?B?VVd6N3l1cWR5MGJBMWZ2dG5kN2xIRHV2dkk1NlRtVW5nSE9sK1pHcHBrQWJZ?=
 =?utf-8?B?MGRuUEtET3F2WE84MnBMeitWSks4S1k3UUUrZVVTbkJBeWJCalYrc0c3cnpM?=
 =?utf-8?B?T1hSVElDSTJMZWFSTzFVMFdTSGVubnhtZDhJaklKWktrdDhxZnFsSjFPeWNq?=
 =?utf-8?B?N05aam9RQXhuYWhkQjFUTkFMMlZTNkZDYmVBdFNXQTQ0dEUvOE83U3c4OXFJ?=
 =?utf-8?B?Mm1hS2NHNkd3c0lDOFRSaWZXUkVnZmVlZ2NZYk8vRTNIMzJjSVpHOVNlU2Nr?=
 =?utf-8?B?MDBGSHZTRC9BUTJQNjBDckNFS0UxdmpmNVhIRVVlcHBGUCtWdzdNOHdKWTRk?=
 =?utf-8?B?emRZSHlkRGFRYXYxSzFaNW1vazN3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e963be10-682e-4240-9a85-08d9fe06c90c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:45:34.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2ADoNP6qk0/olAF213JQlekuFC5b23bBAjNBIo5SZm9lThLvVulDSEtdlwxQV6JwUL5JRKlqGa2Gnwa/7dIIe5Me4m7/I3x+KWI95no9qXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4185
X-Proofpoint-GUID: g4jSCwAS-wqPG4P7NGJjpGo8aY740eSg
X-Proofpoint-ORIG-GUID: MSjBn4rYvyEK3TzYdo1aAWWRflvxYKNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_08,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 224GG0oX027954
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:45:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162749


FYI: 1.59 release notes:
 =C2=A0=C2=A0 https://blog.rust-lang.org/2022/02/24/Rust-1.59.0.html


While there are interesting features in 1.59, such as the inline=20
assembly support,
we are in feature freeze so I expect we'll stick with 1.58.1 .

It probably also makes sense to skip 1.59 and wait for 1.60 in early May=20
for 3.6
depending on when we branch 3.5.

../Randy

On 2022-03-03 12:42, auh@yoctoproject.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.59.0=
* has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  finish -f rust-llvm /home/pokybu=
ild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> NOTE: Starting bitbake server...
> Loading cache...done.
> Loaded 1521 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 844 .bb files complete (843 cached, 1 parsed). 1523 targets,=
 34 skipped, 0 masked, 0 errors.
>
> ERROR: Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn =3D resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 131, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/pok=
y/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybu=
ild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/lay=
er.conf not found
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn =3D resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 131, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 334, in <module>
>      ret =3D main()
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 321, in main
>      ret =3D args.func(args, config, basepath, workspace)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 2108, in finish
>      updated, appendfile, removed =3D _update_recipe(args.recipename, w=
orkspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remo=
ve=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.init=
ial_rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_override=
s, force_patch_refresh=3Dargs.force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1814, in _update_recipe
>      updated, appendf, removed =3D _update_recipe_patch(recipename, wor=
kspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_rep=
ort_remove, initial_rev, dry_run_outdir, force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1671, in _update_recipe_patch
>      redirect_output=3Ddry_run_outdir)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 705, in bbappend_recipe
>      appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcar=
dver)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 632, in get_bbappend_path
>      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confda=
ta)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 167, in wrapped
>      raise bb.BBHandledException()
> bb.BBHandledException
>
>
> Please review the attached files for further information and build/upda=
te failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


--=20
# Randy MacLeod
# Wind River Linux


