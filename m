Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0703DC38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:49:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64573.1674179339471388613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 17:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=DngYMGVe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0384a80f54=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K1MMmR006531
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=m5J4NjzoLxozBYpEoG0rG3v9Xxpn6AAhaO1H4NsycZ8=;
 b=DngYMGVe0YXj4KCmZNcKCAXz1/eHFiTzLJz9yJelM5G2UuEUzEphx4PQd+KuvnBdtlO1
 yDtXQvbOYwcG6HiTQjjOWz1GUcblFoEQ5qYrRHlPFTquTETyuqg9TZE4Q68o0RuPIS5f
 5I5gUwHgZwp8qkmz5mzToqUsZy8VKMixERGKI0jwwq7GYPiKJhiREHkqbN/TBaVMhReC
 vTWZRsmSMr8zlLfLgXZ/Syej/CV0ox/a/VKDhSymJqGnnzD9TiJALpRdKTQvzQ4Mx0oI
 n9N19Y0jCaytMywNgozeHjLkm50RHwTUPVkby38kZfNJWvf5+xUQPN5usxSvgeVRgGAO Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6p01w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:48:58 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30K1mwk9026492
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:48:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6p01v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 01:48:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzBZmZXh99XnhiDChgGRnER6XjektKmarqrikzHNmaga1VdgIkevTg4ieBY99kl4IZHzaad48IvUzbqlBOMBMX+F+IqjiCbOHdpYj3LSZIhSIdChIJAWz12Qiy08dHzPWMNRW78S0fpvWPlnogqSg1+suYCCHprs8K2WDM9U7LVFPkaIjDTo6JAmPa9dYwb5E6u/W7L3vB43QJhkyLvXC+XI+DHdxUfZJIsKsLjTSiZnpHHiHdNvnjdy0XfH9O8gQDHz/fwnDQ00j5Th9H+cy+KOoRv6F2ae/8krBzbtM3jadzf4ymzy/MnIobKJBplm+wJvGRecksOpOTQUGg+6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5J4NjzoLxozBYpEoG0rG3v9Xxpn6AAhaO1H4NsycZ8=;
 b=jlAHo77tYVM5c6EFNn/nsJjjijGB1n0KhuXQynx7W5sG4Y8u6sv/3CTA2OKck8npzQrHOrDKVcC9abH/Q5KSWkKJIgyGv9m8USdtnr1KIj9C5nXGEaMIo+w92DeS2kE9wb88dd+RXMe/vpmUjFQKs/wWDtD+Fug6lmFt7EudwTaSRLHUKgO89V54WU1FOUEQ17FW3Uzp3je28d7Jxuql3+epcQRgcvJg340l5AEeJj6CBPrlh/72CflIsClltjjdn/nP7sCFPJlH2mYvgXFHEnruEOTG3J0pbcteki4t/wR4cfcCT1ZcOMrKqHUuYrfxOoACYpaLCzcAF1pTl7MkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.26; Fri, 20 Jan 2023 01:48:55 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::f1d4:6e68:1a49:7364]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::f1d4:6e68:1a49:7364%6]) with mapi id 15.20.6002.013; Fri, 20 Jan 2023
 01:48:55 +0000
Message-ID: <0f86de9e-4687-2a29-ab1e-a2ab799bf06c@windriver.com>
Date: Fri, 20 Jan 2023 09:48:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <Y7baMI4MLdLKahf+@mail.local>
 <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
 <Y8RwajkarV+GAz+O@mail.local>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <Y8RwajkarV+GAz+O@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2548:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf1549e-9a74-4911-2841-08dafa887d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	drfmlCb3Z1a8IsAynHX9P7RatcBJU0pqF+Bv53K/xYC4U5g3ZEi0BRG44nYbeFlsQPoImqbpNT+5HTY23hFdQ+2f6d6BFCI0FJYW/cWrPpwjNwI3IBxWf5WuMM4Og86xZXZHNH2igwxd/TGnNsmc82/X0VKSE0nE6oZwVuxXnGmc7WjaLcxuBMKKhIIQk0vKwmavMa5QLC/UJ9wJKxXkij4GvQrnUwAltKXo1PlWifWqM4/TFbf9uSAk6csEEGDQB6lYEVsUST0HW7U/maj9Z5ftaJJrdNzGcpr3E0wxI6yIF1hJEQdixfvn5U91lCMz+eg6WgHRfap9F+8K4yeIN8BhslpJWomXYTYZ1iYAtmPvOoSzR8g0lH2etYj+t9S1rAKsjtwjz8FbrHrruP3MuUC73InnDdnfyIw35Bimqv+ponnaY+OOtyPI8KWByyyRb0rOL0VNI5pivGULISnnKr0aXwkzDVsuOsxJHX+eOWrNQIEJHFbJacnacAirLLmnCxVjltRDuPueyRAhJ9iX2xkoz93kWhZg7ZOoCF1kOULtu35+aN7T1ISq6Jx04X7d62egOiBtOYfACJqs257VLNT59lIsyq0Q/+iY4kv/+Kpl44KPWmneOjyBmHXtOKGsDAWCsKMkiBDJB90tK8AcReRhD243IuvSle37yMEApMWDy2i9yLT8mA4+MjDFWSwEgvRVLfgO5syo2KsgPmCcUx6kO7jwTRN9PH5yUed/09ytyocTm+yteQeQz2UaiRAhF+5YmZLspVxz1zesFqQzEpXt2b9eDIlPly0pep5hlkQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(451199015)(31696002)(31686004)(6666004)(6486002)(6506007)(966005)(53546011)(66899015)(478600001)(2906002)(86362001)(110136005)(316002)(5660300002)(4326008)(2616005)(66946007)(66476007)(83380400001)(30864003)(44832011)(38100700002)(41300700001)(8936002)(186003)(66556008)(8676002)(6512007)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDIzZ28yMWhzZzFPVFJIYkZEczQyQ3NBTjhlTFUvNUhGMUVJeTVDZERkWVRP?=
 =?utf-8?B?d3ZQanB1bEoyNDNSdkhQVDBaVVdPdkJvZmN3M1JFVjRNQ0d6OHAyb0Z3TEs4?=
 =?utf-8?B?a2lXejZ1RmlYbmlpc0tLNWRaMmNZT05VNGxOVTJvSlcvRzhOV3lUekh5cDF3?=
 =?utf-8?B?Y0lYNlRVQS93akNPaXk0Vm85Nm9iV2NsenFKQVhWQUltR2I1TXVyRTY2NTRr?=
 =?utf-8?B?SVY0OVlKb3J6TTdNaVZtVHFOR3dMZDdESWlHUHZZQjZhZVAzV2FuaE9qa29a?=
 =?utf-8?B?UEZPQUQrNDhYNC9ibE9VQVNTYXF2OXh3WE45VWJLWnJqV0FHajFaaDJhL3hI?=
 =?utf-8?B?bHJUVzFKTGVEY0ppeStHeTBoZ2NRNFFpUGR0ejV2UlViMVgzb3FHZ3ZveXUz?=
 =?utf-8?B?ZGFCWWdNem1KdUJDZCttVStkbW56eGtpY0kvUzZlT3RLWFhlSXM2aWp5OWFq?=
 =?utf-8?B?NlFjdGE1dHJiMlYyZmNzY2kwWnhrZFVvS2dKSzY2UDNIT3lFMlU3b0h5RHAr?=
 =?utf-8?B?dDBScHVKVXdtY0psTGFXbmxxRGZlTVZwT0JudnJNVW9XbHBoRkFKZnZGQm1t?=
 =?utf-8?B?Z25lYUxHZlpISXEzVnUwdzhVejhPQUo3WWd2UEtLaEdCOWdCUEdpRTFUa2Yr?=
 =?utf-8?B?QWxramZtbTZWN2NqQnE1eW9QSnhwT0FqT2FpR3QzK2FXVFhPMU9FNW1vUFNB?=
 =?utf-8?B?UVNnbVlCZTZaWVBLQWJZMUlpdEc3ZGhocnROdjJZb1BJOGFNMUJabTc1bzdK?=
 =?utf-8?B?aGZmSXN4SE95MS92T2QyQk1DcllwaGN2a2pTOVdlMG12VlVCMTNWeEVLL0or?=
 =?utf-8?B?cVVvdHdDNnpGQkpuOE9uV2pyVDU3bDk2eXEyNlVVTVJ4SXhHN2txcGRuUCtj?=
 =?utf-8?B?ZElmKzFDSEl1SnI3RVI1VUFiVEtmeCtyWjNzTStvTk16bVhESlRpQ04vNHVj?=
 =?utf-8?B?ZTlXTGJrYXoxYjhnM3RXS1lWbHZ1dlFtcXRsbkl2TENUMjZocFVVdTkvV1ZQ?=
 =?utf-8?B?Z2JVMy9IUkJncXMrVGM2NFE0VVFrcmZxclNxNXFpdXNkK1REVHBBVFFKdWtx?=
 =?utf-8?B?QjRBeEZMbnJiYzVaQ0thWDNlWkdSbEZpc2NrZUFkTGJPYytGSXpXenJoV1h5?=
 =?utf-8?B?K3dPTGVxOUlkMmY0MVFQTnlXVnc5ek9JbXR0VFBrdjBZNG9hTm1vaTZqT3Z3?=
 =?utf-8?B?T1ZxbWh4QmhaZ2tFYUFrSXZiOEpFUEFJa0hMQ2l3bGN3RjdKajY4WjYvZm9u?=
 =?utf-8?B?Z2xObXVTNjdRZmdKdDdtbThYdDluZTFNRHcrL2h0dWtEWmJNTklPOTN2bWU5?=
 =?utf-8?B?Z2s0ZnExODByQVFtanY3RE5KNDhrWmxSRTg3RHltSjk3K0huQlZrU3BQa2N5?=
 =?utf-8?B?VVRmaGpGYU1FMWpkbTRiMmc0M2toeHRhUm1rRmFPWEw0N2FwbnNZZDBLMTRY?=
 =?utf-8?B?aHQ5ak1MVDdma21FNndxbDVpVGwzNHlWaStpSWZPTUpLcWJWNFYxaW5tcmk0?=
 =?utf-8?B?Qm9BZE95UCt4OWJpcVVGd0dqZy95WG0rNzlOUFBOZG90T3hXVHF4TStXWVBU?=
 =?utf-8?B?b0krRHI1QXlMZTN4UFVsTTFoTjc3clViNXZFUUlzU2dQMitCczdETTJwWlE4?=
 =?utf-8?B?akRZZnQzcXJnSk0yUEJSbHptRWRnUWUyNVhIZ0MrK3d4L3U0MlJiQ0VEZmlZ?=
 =?utf-8?B?ZlNhZjlSUlVybEVnblNNNTR2SUYvem04M2toZ1NqdXRtaHk3YkI5YlllemhX?=
 =?utf-8?B?S3pyOTJwbXIxOW1nMHFmb1NyN1N5NDV6aFcwMTFhQWRERjY5bTZDeVNFakFS?=
 =?utf-8?B?d3JwaWRNV3dWSXdvY05FbEhtYWFIamlGMnhZNjB1aTMralhxTkxsOE02WGsr?=
 =?utf-8?B?WUgyalN6R1VLSG5jSzg0RXFpNCtrTFRYNTM2RngwdTlUZzU1Znp5Zk5TdUcv?=
 =?utf-8?B?TFhuWGRtTjNQR1FvQWJVSkUyYnhWczcwcm5GZkZ1Z3dBMkgvNkRtN3h2TUFK?=
 =?utf-8?B?aHNRUHhsRTZtQ3Y1TEVzM01ualFSVEZLa25pbWEzNVZWY1BsRkk3OHYxREls?=
 =?utf-8?B?eHhBVTBhNEJ2R2l4bnUrdXJaQTFzYnVOWUNGTWd3MUsyWFc5bTlBdVN4Wlda?=
 =?utf-8?B?ZVVoeXhwZWtKVmFPZ3lWVW5FSDlXdTl5Q0NBQU9Ea2ZMZ3JtTEZIODdrbmdm?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf1549e-9a74-4911-2841-08dafa887d45
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 01:48:55.3183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W204YrJXUtPd+YTT6nzx7TvSizqscXvWjAZ29jCs3qMAplolsfwKW+0TyZB135wZr9b1MVFnQV2NXvN1my0vLKI0Yge3rLyLhuMYN+zvoqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-Proofpoint-GUID: y1JQfkUk8PTqfq_v9hoNQeXXILpWfGA-
X-Proofpoint-ORIG-GUID: rgkr5bjJr6L9eRCwWcFnKk0sDoLv63P2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_16,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200013
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30K1MMmR006531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 01:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176177


On 1/16/23 05:30, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 13/01/2023 16:04:42+0800, Changqing Li wrote:
>> On 1/5/23 22:09, Alexandre Belloni wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> This fails on the AB:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/458=
0/steps/14/logs/stdio
>> Hi, Alexandre
>>
>> I need some help to debug this issue.
>>
>> I cannot reproduce this issue on my host. First,  the gcc command used=
 to
>> build the binary conftest will
>>
>> have as-needed enabled by default,  so actually,  these libs will not =
be
>> linked, and runtime check will passed.
>>
>> Refer the command:
>>
>> gcc -o conftest -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/c=
url-native/7.87.0-r0/recipe-sysroot-native/usr/include
>> -pipe -Werror-implicit-function-declaration -g -O2 -std=3Dgnu89 -pedan=
tic
>> -Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winline
>> -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long=
-long
>> -Wbad-function-cast -Wfloat-equal -Wno-multichar -Wsign-compare -Wunde=
f
>> -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes
>> -Wdeclaration-after-statement -Wold-style-definition -Wstrict-aliasing=
=3D3
>> -Wcast-align -Wtype-limits -Wold-style-declaration -Wmissing-parameter=
-type
>> -Wempty-body -Wclobbered -Wignored-qualifiers -Wconversion
>> -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion -Wformat=3D2
>> -Warray-bounds=3D2 -Wshift-negative-value -Wshift-overflow=3D2
>> -Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond
>> -Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-zero
>> -Wformat-overflow=3D2 -Wformat-truncation=3D2 -Wimplicit-fallthrough=3D=
4
>> -Wno-system-headers -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-lin=
ux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include -I/mnt/lincd/b=
uild/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-nat=
ive/usr/lib/..//include -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/cu=
rl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
include
>> -DOPENSSL_SUPPRESS_DEPRECATED -I/mnt/lincd/build/tmp-glibc/work/x86_64=
-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../.=
./../usr/include -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-nati=
ve/7.87.0-r0/recipe-sysroot-native/usr/lib -L/mnt/lincd/build/tmp-glibc/w=
ork/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
>> -Wl,--enable-new-dtags -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work=
/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib -Wl,-rp=
ath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/lib -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x=
86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib -Wl,-rpat=
h,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/lib
>> -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/mnt/lincd/=
build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/..//lib -L/mnt/lincd/build/tmp-glibc/work/x86_6=
4-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../=
../../usr/lib -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/=
7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>> conftest.c   -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
>>
>>
>> I also tried to add "-Wl,--no-as-needed" in above comand, and manually=
 run
>> it,  then conftest will link those libraries. These libraries can also=
 be
>> found at runtime
>>
>> since these libraries will be in recipe-sysroot-native.
>>
>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build# ld=
d
>> conftest
>>      linux-vdso.so.1 (0x00007ffd447c1000)
>>      libnghttp2.so.14 =3D> /mnt/lincd/build/tmp-glibc/work/x86_64-linu=
x/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libnghttp2.so.14
>> (0x00007f6bd36af000)
>>      libssl.so.3 =3D> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/cur=
l-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libssl.so.3
>> (0x00007f6bd3606000)
>>      libcrypto.so.3 =3D> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/=
curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libcrypto.so.3
>> (0x00007f6bd31cf000)
>>      libz.so.1 =3D> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-=
native/7.87.0-r0/recipe-sysroot-native/usr/lib/libz.so.1
>> (0x00007f6bd31b5000)
>>      libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6bd2fb900=
0)
>>      libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
>> (0x00007f6bd2f96000)
>>      libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f6bd2f90=
000)
>>   /mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-li=
nux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build#
>> ./conftest
>>
>>
>> This should be an host related issue,  Does the worker "debian11-ty-3"=
 means
>> that this build is built on debian11 docker or debian11 host? Thanks.
> This is a debian 11 host.

Hi, Alex

I cannot reproduce this with debian 11 docker image.

$ cat /etc/os-release
PRETTY_NAME=3D"Debian GNU/Linux 11 (bullseye)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"11"
VERSION=3D"11 (bullseye)"
VERSION_CODENAME=3Dbullseye
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

configure:33927: checking run-time libs availability
configure:33983: gcc=C2=A0 -o conftest=20
-isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/include=20
-pipe -Werror-implicit-function-declaration -O2 -Wno-system-headers=20
-isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/include=20
-I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/..//include=20
-I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/include=20
-DOPENSSL_SUPPRESS_DEPRECATED=20
-I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/include=20
-L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib=20
-L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/lib=20
-Wl,--enable-new-dtags=20
-Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0=
-r0/recipe-sysroot-native/usr/lib=20
-Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0=
-r0/recipe-sysroot-native/lib=20
-Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/r=
ecipe-sysroot-native/usr/lib=20
-Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/r=
ecipe-sysroot-native/lib=20
-Wl,-O1 -Wl,--allow-shlib-undefined=20
-Wl,--dynamic-linker=3D/mnt/yocto/build/tmp/sysroots-uninative/x86_64-lin=
ux/lib/ld-linux-x86-64.so.2=20
-L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/..//lib=20
-L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib=20
-L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib=20
conftest.c -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz=C2=A0 >&5
configure:33983: $? =3D 0
configure:33983: ./conftest
configure:33983: $? =3D 0
configure:33985: result: fine


Is it possible to login the autobuilder host to check this?


Regards

Changqing

>
>>
>> Regards
>>
>> Changqing
>>
>>> | checking run-time libs availability... failed
>>> | configure: error: one or more libs available at link-time are not a=
vailable run-time. Libs used at link-time: -lnghttp2 -lssl -lcrypto -lssl=
 -lcrypto -lz
>>> | NOTE: The following config.log files may provide further informatio=
n.
>>> | NOTE: /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-s=
t-109066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
>>> | ERROR: configure failed
>>> | WARNING: exit code 1 from a shell command.
>>> NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
>>> ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-=
debian/build/meta/recipes-support/curl/curl_7.87.0.bb:do_configure) faile=
d with exit code '1'
>>>
>>> On 29/12/2022 10:34:42+0800, Changqing Li wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends o=
n
>>>> libcurl, but it needs http2 support, otherwise it will fail with
>>>> error:
>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate=
_next_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>>>> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:=
886:initiate_next_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1=
 =3D=3D 0)
>>>>
>>>> Enable nghttp2 to fix above error.
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>    meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes=
-support/curl/curl_7.86.0.bb
>>>> index f5e3e7235d..6cee548f35 100644
>>>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
>>>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
>>>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_hea=
der ptest
>>>>    # Entropy source for random PACKAGECONFIG option
>>>>    RANDOM ?=3D "/dev/urandom"
>>>>
>>>> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', =
d)} libidn openssl proxy random threaded-resolver verbose zlib"
>>>> -PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-=
resolver verbose zlib"
>>>> -PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random thread=
ed-resolver verbose zlib"
>>>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', =
d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
>>>> +PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-=
resolver verbose zlib nghttp2"
>>>> +PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random thread=
ed-resolver verbose zlib nghttp2"
>>>>
>>>>    # 'ares' and 'threaded-resolver' are mutually exclusive
>>>>    PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,th=
readed-resolver"
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175812): https://lists.openembedded.org/g/openembe=
dded-core/message/175812
>> Mute This Topic: https://lists.openembedded.org/mt/95931602/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alexandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

