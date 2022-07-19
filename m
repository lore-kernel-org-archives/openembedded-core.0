Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6486C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 01:36:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.35767.1658194561230645509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 18:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Kou9d5MH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41993c891d=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26J1XKUR007336
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 01:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KPPIHCbpP2cFmnylntOyDzlTwaDr5k7I1Kj/UPUaG3o=;
 b=Kou9d5MHhLtnMXlv+T9Y3fe1IAtLiJGXhXyI1QCxdfIrO41iavEG5VV1bz38Oi0oDunG
 vXDQhyVeCjUdFArpe10Z6jVdpi+nwAEkSuHdRaFb4AQgSPWg5bdztOgMushmlplSw5x2
 NDHJU9dH5LdnHiCLOTz3sexhPekkxy/z74xHpYImuyto2ox3Mcx4VGPjHPXKUJU8njMf
 /S/I84+9bkogiZPht6dpJ5JVLaz0CqOeza9sfknPBO+4RTsKLBjf/GJq4IUfhGKHbAbb
 wWyZhUb3TKiG0iqLKhV5KYmJNsBrLCMWEPol1+Gzc7ULRKx1myzo0EKhSAbN+bJSuHFs EQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbptn9sm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 01:36:00 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26J1ZxJX012985
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 01:35:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbptn9skx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 01:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSY/sho27Ey4jn8ESH5La8Ivav4lEUVy8ACs6bWmBCxMJ8PwImQtj+Es1cgEl8AwKNNiNbf4jVsWIzCs/HOtnLCIBvcDZCNbvlQeo8qScMTrg5GJbDZNN55LwTcRT3cJ4tMNo/SsqJtMK7vKh1xQcew6g5xgU3L1M1XVp7iEUFj/obx6nKA89ToETQ1bEf3TvlBYBVEt+PngqbhcoViS0oMvSAdfMWFUlG3t2LyvUE0PB3XQdXnZrM4hbXaMIC8UVPejAp1uMwIyu5u7OFva4LpC6sNwRZfLyvVvUQsWccvCyBYENUuNszSpe8YmetUO9CMWYnvyxpcCLPlOJYXDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPPIHCbpP2cFmnylntOyDzlTwaDr5k7I1Kj/UPUaG3o=;
 b=bwCrM6RWeIuce13DMBVDwrSBQu15UUwRBq3v6FXG+hBJ783n0vsaRrmFSt+ju1FeVG5UHCJpMKphcYiCrkMAGlkwfrFQq8OG/N39F8IRxyxO7xPMh84MYKCwpgAk1QlmK4H6TB8Ai5EQxNSrCWqry1tbJSAZ/Dj/IWJYYOOhVox5kyv15romwHMnHSCJW80re5vhwqMebD4q+65MsLYmVgkDWPJ+pk9GQJyvcoGwfO+Xz6IyfjzXjkGyu0fMldZCFRBJmgn2mIrMxwACkPJ4yrBCKFFVXaBnfatoWyy0puRiOr4UvJoieSyEhUhBwqkvguNOsmrqezBnYM1yschJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 BYAPR11MB2966.namprd11.prod.outlook.com (2603:10b6:a03:84::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.22; Tue, 19 Jul 2022 01:35:56 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8095:3dae:710f:9887]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8095:3dae:710f:9887%9]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 01:35:55 +0000
Message-ID: <670e9e10-891f-1629-9ac6-f529ea8f5dc7@windriver.com>
Date: Tue, 19 Jul 2022 09:35:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] mesa: fix with DEBUG_BUILD enabled
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220718022159.39781-1-kai.kang@windriver.com>
 <17A296B6-EC58-4507-8518-E3C3520E428F@arm.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <17A296B6-EC58-4507-8518-E3C3520E428F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b75079e-9d28-4247-4240-08da6927062c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2966:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tpX57MY2Dbhf4jicosnKrRMEAigWW+6sfwyBH0jLbs48t06xTFVl1lIJwJYNm1I6sI0f8gbH3IXd77S7UpdSy7GteiqCFmkKMq046pm3emS9mdKAT8XBb3XL0eswmR9v3ZB8QxdO4K9fVFumnDZ2UG5HP2u19o8RKVedknwGQNrW7EAoQClHhKZbWiz68ldZsqvFZ5T8o+zP0ZeA7m76NSHUczfFg47Sbp3aUVvQO+9k7CE6eI3v0d6RVxKVFNdCKQJ8CWxDNH1zb2jaX0aic6h8hApcRDIBFzQlmsvxsAuXg2pAfTfv8buFt04Og/ilj3MAUgVScyFCqXF2iEAai5KuAZy+De86yR4k+9YEirLBfQbOXP33sQ952hOX3XGi5JVltOjkbmx0ZkjeIzb7PDajyvxnV2JtFUFHoUPuyKYkZfeJBY0u286dMfxTHPagd9Zq2NQldPkiSVvlWoeFZSKqpt9LWcPoX1CENQKEKIsU+Tr4uX0rv/zLzeDUqmNkxAQoKIah0o46V0iOKrxHuHA8ly9q2dnFrDLlgchRvKXg2A6T6pd49ZDy/ZwqD68NyKAXaMB4I6wFs07XbJVnM4tcPA9ElpwYppqJvVAzRj47ojZT98+HRfGJECjDoTqfAyKXX5P81s52Iaclw4R4EIBbsyQ8tEP5YEVVpQLV5W4f2mNCap13fK3mA4LFC/xwKt+RqokRvClAXxZldYUsjJwh1VdgHXv4dbwMYqtIx16a75ceHsegGwL7h1W9t7XqMNCImHrxhIO2/OIyAb6aaboHfs6elU3XbJzY6p+VKyXLiql8cTBRsIE7r7PaFk8eHcfg7sk6La3TfitHppFkArkjRjXYBEWjTIaFpaFrRjLBmQwDFzbY3ziMtc0INneZ3RuYsKy2LgsYdbfuL7S9Eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39850400004)(376002)(396003)(366004)(31686004)(316002)(36756003)(6916009)(83380400001)(38100700002)(186003)(478600001)(6666004)(66946007)(5660300002)(4326008)(2616005)(66476007)(66556008)(2906002)(41300700001)(8676002)(26005)(6512007)(966005)(86362001)(6506007)(8936002)(31696002)(53546011)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEFqb0d3NzVBcWd0N05SY0xxNytVd0FvVkRWT1NOcjAwVzZTeDRobTBKYmw4?=
 =?utf-8?B?OXFNQlh6TU1WS2x3WTBXUVJUS3kyOGxyOUMrSmpicmhrS3paOFprcGRkRlB2?=
 =?utf-8?B?Slh3K3QyMFBJa1pBb0JGWGRza1dWTTlwbXIxbVNtRnJHOFBxalRpb1h3RUlw?=
 =?utf-8?B?NXZxb2ZhKzFDWFZONXRKYVhWbWwyM092MzRPQVF4b0lLT1FBQm5VN3RscjZr?=
 =?utf-8?B?RWZLUWk3cDV4OXVzS0hmMmJjd2IrNlJ1WndmZ0RPODZSQ202WFNVejJXeVRN?=
 =?utf-8?B?cDg4UE1JSFRYbUg0cklVUzNkUVFraTExdkFQRjgvWERaNnBla0FVS3MxS0NV?=
 =?utf-8?B?bzJQZU5QeXhFMVlDdWFNdkVrRnY0RW1JUUJBYlhnMzFDQmhuTDNyQlprR2xX?=
 =?utf-8?B?aVlxS0kxSjA3MDNONHVqQjVoVHJsTzdMUk5ubEltVmxLWXY1dEhBL2t2ZFhQ?=
 =?utf-8?B?enk0RGh1M2grRkdlRXlvRG1nVjJQSDRackdLMC9ONHVZUmhsclF0UG1oQndN?=
 =?utf-8?B?YjFKUWN3aEk4SlphM2xqV0RNbkQyTlAxdy9wZ3YvMWhYeDRRK21FYkF3eWFs?=
 =?utf-8?B?Wng0bWl5UGlnc21XMko3eXIrVSsyT2doTk9ZbVkwbDF5UE1sOWZWL0tPSzcz?=
 =?utf-8?B?bDYrT3padzkrR2NyUi9tTHRZVTFhNTRvRjc5SEFBN1A2NEVIOFdHMjc1cnZP?=
 =?utf-8?B?eTdkMEFxRWhTZGxrUzhSSXdiL2YxVCtieVUyRHZtbnhrOFhHbFl5ajdNeDlE?=
 =?utf-8?B?WnJ6QVZIY0laVmNLNGtXOUNnbUZ4K0F4S2ZIdHFzeFJ1RjB3czdML2tzZFox?=
 =?utf-8?B?elpWa1JSOGVCK2J4ckNlQXY2ZmtJcWVvZjRMQlRHSEM2VjF4TEMwRXNSN3U0?=
 =?utf-8?B?Rk1JellkTEE5bkhWMU96LzRvQkpoV3VqTDQyRmlDcHVWK3ZHMTYvK1c4OGRF?=
 =?utf-8?B?N2Evd0taQkhQSUdRWkVncm44cU1HWFl2cFFKSEpNNWtrU2NYMjlrQ28xNlVG?=
 =?utf-8?B?WXNZV1EzaDhpazdFRDZmc055bm5VS3E4c3BOaG92VnJXWTJlQmZNOGlBTFZk?=
 =?utf-8?B?QUtPVjE4L0ZmRWNlL2pSS094cmNhU1IxMk1XblV6ZWFuSFpTQXM5eW9NUVNr?=
 =?utf-8?B?M0xsWldtWWZLNisrWkw5VUdpc3ovYUl5OUs1VnM4YzFMU25GYjM3a1JWNmdk?=
 =?utf-8?B?L1RxRExVcWEyYkpERlh3UDg1T2EzTzNSZHFKSHdhNTFhZmc2dGh6MlZVcHRN?=
 =?utf-8?B?STBUUmp3OE5MdHVxTWwrT3Z3NEtldXFHV0RoUmZaUGVPUlIzdWoxWmhGSDhy?=
 =?utf-8?B?WDc5Uk1lWlRPeEJhTHVBU0NHNG9Kaitwcm5RdjEvQ0VPcktJYVBROHZ4QW44?=
 =?utf-8?B?Q1MrUFZYMXJqZzBMOXl3R2tMNzZIWEw4anpxTHM0Y2lCamtGR1dyajNsdnZu?=
 =?utf-8?B?QTRiMkhIeW9qRk1VYXd6dFNzQkFNL3JCbTFxQ1JFR08vbXNpcGlEeWx1STRr?=
 =?utf-8?B?cDdXWEo0eFZXeEhhenJ4NEhZU1pTbWlPWTFVeWl6VUtHY2piWGlDb3NxSTg0?=
 =?utf-8?B?MlFsZUdLZzcvbnpnalZCRkQzN3JJUzVNN0dsQWQwSWdpeXg2SUg4a0NDYU1K?=
 =?utf-8?B?bWZLWDdsVUdVQjFNNWFoYStUSzdRYVVkOUlFSFJYMC9iVHpkVnZMN0E2S1dJ?=
 =?utf-8?B?VW9lVCtDQmNYak9lbE1CQUZSZ3dEUitDZFQxbEtjcWEwTTlNVXNiMFJGT0Jv?=
 =?utf-8?B?ZDJnSmJEWU1MY3d3cGxBMWZXejNoSklyYWgvV0R4Q2xmN1hraCs3UHBxMmpm?=
 =?utf-8?B?dWIyRDdtZW03K0RBUFBqNGRDZldPNHVXV1JEUHc1ZmZVL3FSZlNWZGJ3YlhD?=
 =?utf-8?B?UEtjSVNBQVMyNERQeXBvaTlJSTg5SWhqa1NFL2hYQXU3TjFLMVYwMmRPVXIv?=
 =?utf-8?B?OUFRemNMbXgvSDJUTWR5SUFkbzZmbUZvUFhIWjVXaFl4U3FxZ1lRM1RFWEVh?=
 =?utf-8?B?THNEcGlqZWlKenA5bTlMUDVidTRhSVN0NVVMWXQyUmNxclJseUlFK25Ra1po?=
 =?utf-8?B?d3gxZWE2Uzk4NUtaYjBoSUVKczNJc0kwQmtDMkZ2R0RZTjg5SmtOdkZVWUtH?=
 =?utf-8?Q?fWdc+/zkYxGYdPhDgXrDgYrV6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b75079e-9d28-4247-4240-08da6927062c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 01:35:55.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fo1wsX7R3QECqVuv7dAh8YcJ6IZzwui+BXEhgZ1sCEpEs1lxdAyOv7vokHcTMuztZC69c8F8Cx8Veco3qhd2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2966
X-Proofpoint-GUID: hpHdK2UIPL-MnpcJLfqeOyK7g63NVYpm
X-Proofpoint-ORIG-GUID: IXIBar0nf5gfNFG8HzgMdCd7tTExbGJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207190005
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 26J1XKUR007336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 01:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168266

On 7/18/22 23:09, Ross Burton wrote:
> This patch has been rejected upstream, please switch for https://gitlab=
.freedesktop.org/mesa/mesa/-/merge_requests/17439 instead.

OK.

Kai

>
> Ross
>
>> On 18 Jul 2022, at 03:21, kai via lists.openembedded.org <kai.kang=3Dw=
indriver.com@lists.openembedded.org> wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to compile mesa-native when DEBUG_BUILD is enabled:
>>
>> ../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=
=98nir_opt_move_block=E2=80=99:
>> ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining f=
ailed in call to
>>   always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call w=
ith a yet undetermined callee
>> src_is_ssa(nir_src *src, void *state)
>> ^~~~~~~~~~
>>
>> Remove 'ALWAYS_INLINE' for function src_is_ssa.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> .../mesa/files/0001-nir-fix-build-at-Og.patch | 31 +++++++++++++++++++
>> meta/recipes-graphics/mesa/mesa.inc           |  1 +
>> 2 files changed, 32 insertions(+)
>> create mode 100644 meta/recipes-graphics/mesa/files/0001-nir-fix-build=
-at-Og.patch
>>
>> diff --git a/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og=
.patch b/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og.patch
>> new file mode 100644
>> index 0000000000..5b4a5c7231
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og.patch
>> @@ -0,0 +1,31 @@
>> +At -Og with gcc 12.1, it fails to compile:
>> +
>> +../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
>> +../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining =
failed in call to always_inline =E2=80=98src_is_ssa=E2=80=99: indirect fu=
nction call with a yet undetermined callee     src_is_ssa(nir_src *src, v=
oid *state)
>> + ^~~~~~~~~~
>> +
>> +Remove 'ALWAYS_INLINE' for function src_is_ssa.
>> +
>> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/=
-/merge_requests/17589]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + src/compiler/nir/nir_opt_move.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_o=
pt_move.c
>> +index 81bcde5c436..09db6717002 100644
>> +--- a/src/compiler/nir/nir_opt_move.c
>> ++++ b/src/compiler/nir/nir_opt_move.c
>> +@@ -51,7 +51,7 @@
>> +  * lower register pressure.
>> +  */
>> +
>> +-static ALWAYS_INLINE bool
>> ++static bool
>> + src_is_ssa(nir_src *src, void *state)
>> + {
>> +    return src->is_ssa;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> index 710cacb09d..58e662efd4 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -22,6 +22,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz \
>>             file://0001-util-format-Check-for-NEON-before-using-it.pat=
ch \
>>             file://0001-Revert-egl-wayland-deprecate-drm_handle_format=
-and-d.patch \
>>             file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-d=
riDRI2.patch \
>> +           file://0001-nir-fix-build-at-Og.patch \
>>             "
>>
>> SRC_URI[sha256sum] =3D "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70a=
a2f103e2b6c3f093e3"
>> --=20
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168189): https://lists.openembedded.org/g/openembe=
dded-core/message/168189
>> Mute This Topic: https://lists.openembedded.org/mt/92451455/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


