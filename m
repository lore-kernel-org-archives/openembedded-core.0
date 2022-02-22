Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51438C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 01:26:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7405.1645493173650803720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 17:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=F+P7slf9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9052efca57=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21M1Nf0Z026983
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 01:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+miJdMHcNwY16rWFTTRbJUjXm89ue0hbgbhG4U6rSDQ=;
 b=F+P7slf9pzvtbtrXbGv0VYvreiyZlmZ6VfuohmuGV0RsjiaZ78GHcVDdoZiqeQaMehe7
 Tz+LA90a5xOpT8Ke7mDRW2iEiAL8W3ewrUKtMLQ38VGaVT5WxWkNiWljvRMiy97QzT2S
 ElWWBSseOetOfO3ADMsN0To4FSoT/1outWPD5oL7+dyeL21KEVrczOcILKUOl7U3Zt3q
 qOXPnbWMKAE4QCh4GWepa3o+7NKSJ2q/0+5hg4TTMcJmf6MXfHfgjuE+/B8Gob2Gduu1
 M+KA7Li8SVOyE+R0e8EabQct0sk7q3YBVqeA6Qoe/np99yEYC7X0MC3lU4Fy86YExF4W Wg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecjp3g498-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:26:12 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21M1NeFx026949
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 01:26:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecjp3g496-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Feb 2022 01:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzhemiVGqDQNRmhFnHtbgubGUSHQ9lkEAH1kinPVABR9mrR0yK7H2mIOxuelyXzQwwjH4Wo4aD0DZIY8tGH9KVeiupoLoW9u1+ZjGXyvnUWmsUXw6PrGw40ap5GPtQy2tD5F4PvQsZ8cx+eog6t21rBzhH3dxUmxQwZl+0/mCgfHkcgN2oNtW3RsFSN0Do4cJ3YTz6IeYsH/mMgzeAxvAW8xg3SIM7XHytoLjkn9mlBIil6nNfxfBlkTZ6dLTLqnQIEY7rOtD+njDgIdIRAFyckd1B2tDZQOS5enRl6nj19ZIxkYLXd3wLrxzyEfbzmuJ0aDcYD72cKm8Y7PTMHdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+miJdMHcNwY16rWFTTRbJUjXm89ue0hbgbhG4U6rSDQ=;
 b=k7oNWnj5z1lVEqgWqRu6cZdcHetakz0kL4CXse6t+e8W+TzcIYUWYtUnZnpRurPNjD0l1KY2GqY1+1VdTxLLoBnCq5ususZ6sIdipw3SDgr9fhmJo7LQhMe/8cSleDGsopatgZel9/NzayzqfSfbi16/qnPagRXcJlLudIHv0IHPiwSAd/VTuEC/Yq3bVoAQ6DhltOeWh58ZJKbk3g31vozHfSXSdcBFrJgC6CGFHy53zPJPfNa8Kj/lRIgl9A73B1LvNxzEc9fMS9W7kYBEKuYZAOtPeNWXr85ysNWNLGGsRB+3mhwapmkrle5yhQf/EyhifAl+sc02LwjY4DsH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM6PR11MB3161.namprd11.prod.outlook.com (2603:10b6:5:e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Tue, 22 Feb 2022 01:26:10 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202%5]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 01:26:09 +0000
Subject: Re: [OE-core][hardknott][PATCH] e2fsprogs: backport to fix one
 regression
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220221080815.1979337-1-changqing.li@windriver.com>
 <CAMKF1srQ-bYd6qmmb+YTH_qsNM6bgSOOWFDbwhsLJdJTiVDaQQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7947c43a-1b01-0547-1ece-39ce4bf08d70@windriver.com>
Date: Tue, 22 Feb 2022 09:26:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CAMKF1srQ-bYd6qmmb+YTH_qsNM6bgSOOWFDbwhsLJdJTiVDaQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::32) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d45afa-7bc8-491d-e543-08d9f5a24e25
X-MS-TrafficTypeDiagnostic: DM6PR11MB3161:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3161104383760D90362B3F8F823B9@DM6PR11MB3161.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZzdnAIODttklmaUMQ/O3Ivxavet8HF7LozzRkuuTtBpfJqTQzIMu0HR87kVrqdjQb/ympZkgjknzzstZxcRARGOI+SKkANwYiBNoX7yE+YBZoUD52NajslCY6zB38uHXeAS/kOgxubDWNGRfjsxelaa6NFfJF0BVI7VKLSM0e5WVpKsouEakfQxfqNvS8aTTKwVdt8/pNL40rmJ4liRyO5JGm212T/w9DkhI3uZz5g4XrMN5iMIJom8qHErkqiGUGZHlz1MQiZvA6Sxf7FEVnl5ARE8XCqfLVipdaVqF8Uhq5p/n7Maj+S9w3r/YqNyzU2ym+h9wOMXBGMfJK/eEKq/twsTcbbNNuF98oLbP1tWxwQsLojb8pXz+V6gKG64elN8DonN6YyLuYH5NZ5JjGQuWFNA3iEXo89GqBwTPhKVw45tdTTsjwDblq6ue5SR25IaTU64ExqvghJNS3oVZUcpWHFQ6DfLLF203gnkDtfWfGMs3awUirgrI9cm1TcQ6AadpCvCg9zvZp/EjMQxALA6nsFwx0V0IkSZR8H9AjiWfblNlYxMenzITvyAuJ1Yy4Xi9rfpzOXT81sflYLQ/aOyJI2irdjn0lPYwCIklt01LLsUIFd/h2mokLZCVUM8gFYOH94gT+i/kssRFf50U1emZczSMaD9hpj0nfJk0eWGwgq2DCZJlq8fWxZZiGqmtUKGHpG5Y74Ll4d9DCbh2cLZyrqv6IMhsQIxM6AmaUePdp9VktDt7yPCbnxzKqjhyGk/snzCgRWea1C1ta10yi4rmIjd6fsMaxI7l85K5azMks77saDRQHY6xHQe1mc2+a179KK1edhIMXuLAoH9FccS/CP/qYhjSMtx4zKE6NgpsTUgdLsnZ+rjePYi+SQYWjPVCaM1G+V0Pgl/7nSpyRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6512007)(6506007)(6666004)(38100700002)(38350700002)(2616005)(52116002)(53546011)(66946007)(66556008)(66476007)(8676002)(508600001)(83380400001)(86362001)(8936002)(316002)(6916009)(31696002)(36756003)(44832011)(186003)(26005)(5660300002)(6486002)(4326008)(966005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0VRV3NPZFVvNTVJdmhSRXBiWEJaVDIwUW5IUituZGFmTFozSzR6M0VMaWx1?=
 =?utf-8?B?VVpXazk1bDl3cVJLaGxzY05nRlFxVmV0aXJhR3RSa1FHSXNqemZVYWowdDF4?=
 =?utf-8?B?cDUyR1U3dDVJcFZIbWJsaldqUy9HazZQRFhUazdPQmZONDFrSjlodEJvdjVG?=
 =?utf-8?B?V0hzUzRLV1UvUHczdGNWVytqQ1VSdzc2RWphalo2cWRDTlN3T2dCWE5MOE5K?=
 =?utf-8?B?Mm52QXZzNzdOVDd5ZC9YbC9HNXF6d2xXVlVrNE1tVXUxcTBKOVR3WG1vb0hN?=
 =?utf-8?B?QW1KMmhQSnpYcUIyL1pBcjh2QUJBWWQrdWp1dm9uYXorZFZmWDlOZVBhTWhL?=
 =?utf-8?B?VzNIdTNJVXNSWEpDbTZxQzdNc2daRlQzdVJiQUhVcUsxMlRkaCtKS2FPZFZj?=
 =?utf-8?B?WVJQM2I3WUNxUFhiYkpQQytQeENidDFiaUZGM1lQanl4Vm5QZDYwQktBbHgz?=
 =?utf-8?B?SUNERXAvMDdMeEk2dGpKWkxOSTQzWmR3L25samswbkJIN3pLKzQwTnN2MlhG?=
 =?utf-8?B?OE45azBxb3J6bUN5WTdDaGVhZVVhbjAxQVlWTHRtR0FnSHZ6YUtJdS9FTWF6?=
 =?utf-8?B?WVBCZDg1YStSQURNWWZBTURUemlYT1VEcUtVUElrM29qVDhiSGJnMXc0TDJ1?=
 =?utf-8?B?by8wdkMzTXFzY2FtamF3SVRzdU1QMURlbTIzMjl2Z2t4MXhpRzliTTEydHVJ?=
 =?utf-8?B?a2lRNzhkb1RMSzhiYWNQQThoZGdEOWhjamlRUkM1WHlnMXgzZnc1U1dRam5N?=
 =?utf-8?B?Qy9LNmpoV1NXOStUZGd5c0VwcStZOFRiYU00WHVUR0NTWnhZMDBzcDFwQTUz?=
 =?utf-8?B?dzNZZWlsNktIWXJZZVlSQi9yK1RMMnFqL2VveSswWDE4VlF1QlJIWHh0V1VL?=
 =?utf-8?B?U2UwUXR5bzZZcnJ2ZTg4blRtbGRMTEUyZjJ3S2JGT2tuNmw2M1dkNHpmQTlM?=
 =?utf-8?B?eDVxYjlTdFR4aTZSZmxCSXlRY1pUQ0VEeHRDU1ZqNVBXTkJRZnpHeFI1WVBP?=
 =?utf-8?B?RTlWVlN2TWhMRExaODhzaC9Ga1JEQTA3T0ljS2E3bWthSitXOCtWUnlFamxB?=
 =?utf-8?B?bDhaT2RNUGhJTnl1RCs5b0VNVGFRamNLYU5PTmhtN1Q2R1FFdWE5N3Y3NmxV?=
 =?utf-8?B?YW84WDhmckdKa1hEd01CejBHK1hUSnpBQklwck0zVUQ4cU5ONEd2UmVQK3ZF?=
 =?utf-8?B?L0c4cGJiTTZ4ZVhFckEreldIMDRkRGtqQTUyblZvQ1BGaDk4ZVJaVHVud1p0?=
 =?utf-8?B?K2M5QkxaOU1yTTVEb1h0bEh1Z3EvMVF1azMrQU11Ykp4WWFJU3hyWmxuaUVx?=
 =?utf-8?B?bHNZVWNXY0N2WkpvaWZCMDlGc09sQWhGOWhrWWtWYnU4ZW1RcjA1bUMrRjZn?=
 =?utf-8?B?V3dIS0NDQlRZUEVoNUNkOEVFQzc1V0s2dHhXZmZIdTROSkRUY0NqdGl0VWRw?=
 =?utf-8?B?UXBBSi84VHN0aDFwOTl1MTM3OXNLRDg4TmlZVWRqSy9MenI5Z3FKYzRTM3VQ?=
 =?utf-8?B?VTBNOTlDRk1hcGtWSjVZQzNaV1BPZlFpUldrZTIxZzdkUnJ0TEo0UzFKWUtT?=
 =?utf-8?B?TGlkaEpYSFQ0dWFPNzlURy83R2htSkRmN2FSekhlQWk1VmVGK1hhUzRPdktO?=
 =?utf-8?B?RzZJSEgyZG9RLzZNcVJ4WVlnZkhtQ1U5K29JQXFkWDQ4di9IK3JhSDFMQzBF?=
 =?utf-8?B?dEFPYnhsTWhDTzhMaUFWTkRjMWcrZDUzajJBT0RIckh5cUVtVENPRGF5WWtn?=
 =?utf-8?B?eFZJSjJHMnZ4WTBOc0JtRXl3UU5lQ0QvSDErQVhyRG92aFpReklFczJqY3Rx?=
 =?utf-8?B?dkJaTFA3eE5TaUFsTzNJc3czOFdVUnpEVTZranpiMHNKN01GdTIrN0dxTEJM?=
 =?utf-8?B?S3dBUjN5VEY4emF1bXdicGh4ejQ0TExWNUhjU2RsNEd3NmhrMmRrWGZhaEg1?=
 =?utf-8?B?WVRLM1o0MUlWQ2FNUHRTQnIyTHF4Q0o5R1g0eE1MdmJ0NHNERWhLc3hxbjRD?=
 =?utf-8?B?aERsVzRPOWFIclZFelFsVUkyZE5ZYVlNMmloaFJGdzZpQkR2SkF1V0llNWtW?=
 =?utf-8?B?WGdvLzljK1ZTUDhGNEp2TUYyZUJSRll4MjVWUTU1Ym1nMGJXU1NIZkdZMnJ2?=
 =?utf-8?B?Zk1MWWkxSTBrZEc2OVUvZmJDZkVtU29kMlpmTmVnUEpnQjlxTnU2RHdueVV2?=
 =?utf-8?B?WmZxWm1xU0pjVWc5WS9IWmhpdG52R05kZkQ0QVpucVJ2Mk5HQ1pPeHJDRFhJ?=
 =?utf-8?B?Mjl3OXFaSWhvc2lqbWdFbzV2dGFBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 47d45afa-7bc8-491d-e543-08d9f5a24e25
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 01:26:09.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dbJBJdO/C/UbWEgPaq27bJgGXgkiZ7iU8L7TlqlgZA7PaVWjsxAHDjMqOuok5nbjghtkqJmhZbB+EFT7RzH2K5HPSbRdNiCATpXkwR7zpj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3161
X-Proofpoint-ORIG-GUID: agk93Bz5KUgTnHBX6HG1CWcjuvUV3MUq
X-Proofpoint-GUID: C1sJdwLf9GwuG37Nggn3mv9hYqm6aL4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_11,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21M1Nf0Z026983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 01:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162112


On 2/22/22 1:15 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> I am seeing
>
> CmdError('quilt --quiltrc
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r=
0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch
> 0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
> patching file e2fsck/super.c
> Hunk #1 FAILED at 1038.
> Hunk #2 FAILED at 1050.
> 2 out of 2 hunks FAILED -- rejects in file e2fsck/super.c
> Patch 0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
> can be reverse-applied

Hi,

This patch is only for hardknott branch,=C2=A0 which has version 1.46.1.

Regards

Changqing

>
> On Mon, Feb 21, 2022 at 12:08 AM Changqing Li
> <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Backport a patch in 1.46.3 which fix one regression:
>> This is what the changelog says:
>>      Fix e2fsck so that the if the s_interval is zero, and the last mo=
unt
>>      or write time is in the future, it will fix invalid last mount/wr=
ite
>>      timestamps in the superblock. (This was a regression introduced i=
n
>>      v1.45.5.)
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  3 +-
>>   ...mount-write-time-when-e2fsck-is-forc.patch | 66 +++++++++++++++++=
++
>>   2 files changed, 68 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2=
fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/reci=
pes-devtools/e2fsprogs/e2fsprogs.inc
>> index fb02b2006e..1250a9b99c 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
>> @@ -19,7 +19,8 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3Dd50be0580c=
0b0a7fbc7a4830bbe6c12b \
>>   SECTION =3D "base"
>>   DEPENDS =3D "util-linux attr autoconf-archive"
>>
>> -SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branc=
h=3Dmaster"
>> +SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branc=
h=3Dmaster \
>> +           file://0001-e2fsck-fix-last-mount-write-time-when-e2fsck-i=
s-forc.patch"
>>   S =3D "${WORKDIR}/git"
>>
>>   inherit autotools gettext texinfo pkgconfig multilib_header update-a=
lternatives ptest
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix=
-last-mount-write-time-when-e2fsck-is-forc.patch b/meta/recipes-devtools/=
e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-=
forc.patch
>> new file mode 100644
>> index 0000000000..d679b25b1d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-m=
ount-write-time-when-e2fsck-is-forc.patch
>> @@ -0,0 +1,66 @@
>> +From 2c69c94217b6db083d601d4fd62d6ab6c1628fee Mon Sep 17 00:00:00 200=
1
>> +From: Lukas Czerner <lczerner@redhat.com>
>> +Date: Mon, 14 Jun 2021 15:27:25 +0200
>> +Subject: [PATCH] e2fsck: fix last mount/write time when e2fsck is for=
ced
>> +
>> +With commit c52d930f e2fsck is no longer able to fix bad last
>> +mount/write time by default because it is conditioned on s_checkinter=
val
>> +not being zero, which it is by default.
>> +
>> +One place where it matters is when other e2fsprogs tools require to r=
un
>> +full file system check before a certain operation. If the last mount
>> +time is for any reason in future, it will not allow it to run even if
>> +full e2fsck is ran.
>> +
>> +Fix it by checking the last mount/write time when the e2fsck is force=
d,
>> +except for the case where we know the system clock is broken.
>> +
>> +[ Reworked the conditionals so error messages claiming that the last
>> +  write/mount time were corrupted wouldn't be always printed when the
>> +  e2fsck was run with the -f option, thus causing 299 out of 372
>> +  regression tests to fail.  -- TYT ]
>> +
>> +Fixes: c52d930f ("e2fsck: don't check for future superblock times if =
checkinterval =3D=3D 0")
>> +Reported-by: Dusty Mabe <dustymabe@redhat.com>
>> +Signed-off-by: Lukas Czerner <lczerner@redhat.com>
>> +Signed-off-by: Theodore Ts'o <tytso@mit.edu>
>> +
>> +Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/=
2c69c94217b6db083d601d4fd62d6ab6c1628fee]
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + e2fsck/super.c | 12 ++++++------
>> + 1 file changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/e2fsck/super.c b/e2fsck/super.c
>> +index e1c3f935..31e2ffb2 100644
>> +--- a/e2fsck/super.c
>> ++++ b/e2fsck/super.c
>> +@@ -1038,9 +1038,9 @@ void check_super_block(e2fsck_t ctx)
>> +        * Check to see if the superblock last mount time or last
>> +        * write time is in the future.
>> +        */
>> +-      if (!broken_system_clock && fs->super->s_checkinterval &&
>> +-          !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
>> +-          fs->super->s_mtime > (__u32) ctx->now) {
>> ++      if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinter=
val) &&
>> ++          !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSAN=
E) &&
>> ++          (fs->super->s_mtime > (__u32) ctx->now)) {
>> +               pctx.num =3D fs->super->s_mtime;
>> +               problem =3D PR_0_FUTURE_SB_LAST_MOUNT;
>> +               if (fs->super->s_mtime <=3D (__u32) ctx->now + ctx->ti=
me_fudge)
>> +@@ -1050,9 +1050,9 @@ void check_super_block(e2fsck_t ctx)
>> +                       fs->flags |=3D EXT2_FLAG_DIRTY;
>> +               }
>> +       }
>> +-      if (!broken_system_clock && fs->super->s_checkinterval &&
>> +-          !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
>> +-          fs->super->s_wtime > (__u32) ctx->now) {
>> ++      if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinter=
val) &&
>> ++          !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSAN=
E) &&
>> ++          (fs->super->s_wtime > (__u32) ctx->now)) {
>> +               pctx.num =3D fs->super->s_wtime;
>> +               problem =3D PR_0_FUTURE_SB_LAST_WRITE;
>> +               if (fs->super->s_wtime <=3D (__u32) ctx->now + ctx->ti=
me_fudge)
>> +--
>> +2.25.1
>> +
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162017): https://lists.openembedded.org/g/openembe=
dded-core/message/162017
>> Mute This Topic: https://lists.openembedded.org/mt/89289488/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

