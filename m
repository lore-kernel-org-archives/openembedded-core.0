Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B5ECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 13:57:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11826.1661867815544994220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 06:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kVegFxVe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=624153075c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27UCgbSj011692
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 13:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=UPP3LQm/gMXeoV2pPFSOyt3Sy31asab2FUYrTogU5WA=;
 b=kVegFxVeqmf7Noxi2My/TqSleEsFHbbYMvSz6uWakXDjbVC8jNxaUxHj3UUErA6/rVK3
 f0+4DFiva+eY6+i0XTf1cvnclLXLMk3zxZXrZpSdS3F9Nkh4XOm/NTspUQEhojy+EJlT
 Cy9UvaPjUrjZcBKFsrZX1kbx9r74ooWRiSqgsDu4QKET1arBw5H8NrQpai3QaayPXsv+
 Ogeq0OuInx1Phfb8Rp10E95/8omi6uXye6xccU5I180c1t7WfCjhBx6Eb+QyBl7aX1mx
 F9RzUg8atKx+uPAPS2fW/KmKHD/+JdguDyoBfloDGnOVhCPPTPxX8+MAwroSNVeYJTW3 WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89jkwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 13:56:54 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UDusPm004498
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 13:56:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89jkwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Aug 2022 13:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI9XO/KEMZmGTgoRkv8S1AONNCpkvOqrt1mppQuu4Zb84AYdaPMQ+hHv3LjAxxjBly/uax4ybXij+tF8/NyEQj2J2fgI2UsnMbc7jk5krny79LleRF8U8pObsPhXsYx50KE0Q9tKXpfYsVn5gB+J9WbVhe4WgQi6IeRQx9LJinzJS17RJO3VBgqMPx2faOfFBZUkZPXkeUtnTJasCY6gEEcPnG7vvDmClcjmb6YGAngCrP5zFJFFkieNpf4D2gGtZxrQoewE9PaPrITCcLBFcBhiCx8KOhxt8nuvXRo169YNmXuq5AUJ52bvfZO6TkgboC1mmdZTnUDtUdUUmUfwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPP3LQm/gMXeoV2pPFSOyt3Sy31asab2FUYrTogU5WA=;
 b=YYEoLfwS+LeQck1Dww5E0yUFk/fozkzZ+Z5KmXgse4YHPYAgN4LdqVgaRfsd8G+NQxkanZlghYizbHUbrKGBBVHxB7yCN1g3on/TwRet+GJHeQyIhAvQIAmns4uVbW4euVYZ6OAlDFS+a7PFKpwGF2W//id6IO5E8FfFsWHwq98JHn7FZS4dbUfgJlbpCwl1SF+b8ZobT5Od3vlCzQRsWkQ8jJ1TYko+xlr95/kB4d/AgB2AinOQ4XjGcv88s/+9c/oK3IBgA+hkiYsciI1Zux2ihGIDXG/YIuNFmP8s4xcjnrowsR2lMFSoGFWHOlnDxsLGWGaIrJkrXvQgsFGLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN2PR11MB3965.namprd11.prod.outlook.com (2603:10b6:208:13c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 13:56:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 13:56:52 +0000
Message-ID: <a5b31549-47d0-4acb-8bfb-a3c293a2e49b@windriver.com>
Date: Tue, 30 Aug 2022 09:56:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v2] rng-tools: Remove depndencies on hwrng
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
References: <20220823014705.1368891-1-raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220823014705.1368891-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5feac9f-9317-4233-f051-08da8a8f7d91
X-MS-TrafficTypeDiagnostic: MN2PR11MB3965:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iyLn+0Y2i5r6Leldx0MSiaEGAdHoO1oZ49ZM8sq7X5y9SWEinGcUlQFkXrI5BmPDr+SuPAtL7BUwWoDAcEI/qNjBOJDtrsX8KRqcHBTdhA9IP+lspiKh1TnN0zXrqcy+5jy4vB/KkEZVtcNbX6l+yQsWf4BLtaZBI/G8d0WRTkBKZeaKpSXRXmc5HLgr6avAWtMLfPC1Nfk/FIAftLD2ZWRQs8+GJ0HFezWJU3mhdY/s30Z1qOtAPKirhtP8W0dedHRW09u0eu9ZROlSRSHDk484XDf5/ZRUApnGtDQcirT59kFNa0R1jz5OwrmidPQI7z0MgZz/RPbutmF0b7sZkUlzlqj2pII9A/JnyvhpWmirnzu0/hSjtpdJYun9AJVXK3Q4Brj6NjMb3i4SvmduZpGuNLybCPEf/e+b3vBpziVOXEO3tayOd0NveEUkuxKS6Q3XyFwshjvgmQmUp+jLwCCVBpT+5XXwVa8oR0kildTfxVpbs5e3yG1lp3Yvg0fqDDO4Y1W69hMD20DL4C8BTZ7RWOGCLw2y+T2kKyDlvWjJJQhCSEUbJlED7vXQdWMDOBu+HpCJ9rrrxdGCptl7m/P5KAfV5LyM+RHXAV2t53T6F+b4SuiKHH/UaPJevaGTuzE4NCidhdxfne+RW3P+LWfdvFTgv55G9UJQZLR5mH/EhdsX7fzoQAiKGbrBFy3zWfA7eF108ltE4gu7z+iNstPLi5K1/+MrtoSN3Cp6BLrqcTVAHqlw6zBNn52Is/qiabjHnc63kdey9SspHOUBUvp9bvoNLurfcmJ1MYNQZbzSZekosYYEKtzkOVLyZfplOSVESxe+5shlTpVHOziVXsyV3rcy9uw+RnL/1OwvKC2XLjJplOZjYnwjz6XqQut0Y3AbJjGoPuKfSZOHnGMV+nRwhq9gEdJ1PCcrOIU+6uc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(2906002)(6512007)(26005)(6666004)(53546011)(6506007)(38350700002)(38100700002)(2616005)(186003)(52116002)(83380400001)(66556008)(6636002)(316002)(66476007)(66946007)(31686004)(31696002)(966005)(6486002)(8676002)(110136005)(41300700001)(8936002)(36756003)(86362001)(5660300002)(478600001)(17423001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0ZoRndJTjNGUU5ib1RDU24vNkM3YUs0ZS9tYlAwVXJVNEFIRzVqeDdveUQ5?=
 =?utf-8?B?MngyOVkrcFFRNVpPUlphU1NaZU5ycXorS015MUNMVGpkdys1OGQ1Z3hRVjZZ?=
 =?utf-8?B?SzVMQzdMTXdMeWEvVEdtSUxmSVB0ajROS0FTRkN2SWlzR3ltaEhodmdjbUFy?=
 =?utf-8?B?RlZFRnlmcjBDYXNNQzNuT0E0aXhwaUR0cnVEWk5tNitub2dnSTZMZ3dtK2ZR?=
 =?utf-8?B?QUNSYU9wT0VseXliTVNsU2N5K0Jqc2ZkaENtVWNpUkYzVDNKYWhzRmhwVDVK?=
 =?utf-8?B?bGVnMEtodUUrVVBlUTNpS0ZRdUJmNW8rOTJOVXBkK3JpbFh3UEY1VWRGY2R1?=
 =?utf-8?B?SzZiekQvbm1lNFViVFdqYytxOXNaNmFZZHpWTGYvSDhIK0EyWm1haitpOHFV?=
 =?utf-8?B?R3pXb2dNTlRWYUJxVXpicUFoN1M4WDg4YXdHVWVSOEFMRTFkYnRtN2ZZS2ho?=
 =?utf-8?B?R1VtWTQ3RjhBczhhaXk4WWo2WDlQR0x6d1FmSkt6cUtkRk5Bd3oxTUU3VUYy?=
 =?utf-8?B?dGxpYUhXWVNjczQ1cmk0bzF0ZlkwUVV0TEl1VHVTNUxsbnlIaDMwOEFCdkhL?=
 =?utf-8?B?cXJLZkhpcnZGdlFDOEZDQmhiaFBQUXZ1cDZVV2pHWTBOZDFjM1Z5dGt6aW1v?=
 =?utf-8?B?USs1MmlzOGpJd2FJZXF5UjgxSCtiSUVPeXVTR3BnNnRQS2VNUEZjQWlNbExT?=
 =?utf-8?B?a05VL1JoZ3BCMDZrTkYwL0lEa3U2UGc2ZFE0bFozdGhqTFFkTVlMQ2ZQQVN1?=
 =?utf-8?B?U2d6ZFQ1RjhtejFGQjcreXBWQzVKUWxrMnl5WFA5VzNtZlJyN29CK004Uis0?=
 =?utf-8?B?aVZjU2NiRXhabnBPa05WVk5YMFpjTXlRRC9aTmxXVGkrL2lPZ1NjeFI5NVlz?=
 =?utf-8?B?dnNhVUtDcG8vMXEwTjNtSEhKa2s2cTU1TFRPU2d6Skxrbi8yN2tBUWRrd3VM?=
 =?utf-8?B?Slc3YmNTVkt6TXZpcFdjWjMxRjB2cFU1Q2NkRHYzUmRDY2p1bnI0VlNORVJz?=
 =?utf-8?B?NHZWME15VFFjb29kdm9ZTkdDWlNGY29wcTBoTHNIdnFoTUc5bUp4b0pzZjN0?=
 =?utf-8?B?dnVrdTRuSFR0SmNyRUpoaHNOVEp4UnB2OGdVM2kxWks1TlpnaHgxZXRIY2dK?=
 =?utf-8?B?akxGamQ3TUxZNFQ1Q0htN04wRGozRHlUZm9TaCsrNFFZL1VxNzZ2dndSS2Zv?=
 =?utf-8?B?d2paejJmZ3FFQ3ZiR0lVQ09TTFlOcEt0YjFkc2E0ZG9TWGhrY2hWOUM1QUxW?=
 =?utf-8?B?K2hpWWlpdFBvRUNvaUY4S1hFdkFUWGxYVVZHbjVoTi9nOWtCNWNQWjZSem5Z?=
 =?utf-8?B?eElrb3JqbHE5ejFRR2xlWnlpNUNRV2w1OFF0NDFPMkt0cTNrTHNMb0wzY0JF?=
 =?utf-8?B?MkZJVXN0R0krbWpTUVExNi9uMTUzVTlUaWNuNjgwS2tFdzgxd0NoZE9SNC9j?=
 =?utf-8?B?TENWMkhaeFNvYkZRRnZFeklLU1BmdExrSXR6ZHpZZ0VOd1NQcmN1QStuOC8r?=
 =?utf-8?B?Mm1IYnNQd01XYmlPMCtnYTlybHhXNGlKZDUzNHRWQkdBWnhQZnJVYXd6cUtK?=
 =?utf-8?B?dDlodkdGU2x3NzlYZDBSRlY3cXpsWXRaVkVNTnpGb01USERKU0QrR1FZV2RF?=
 =?utf-8?B?TTJIVnp3WE8wT2lhNWFlN3d6MWkrS3hmYzJSUEd5a1EyVG1sQjVtcTEwRlU4?=
 =?utf-8?B?VzI1ekRwNitodTl4Vy9GYTdDZTVTMHZpaDBqRHVNbmFSdWlId2JDMWN2Yy8w?=
 =?utf-8?B?NXpQeE15aWMvQzkwVkpod3ZuU3VtZFQraFBjQjZFK0FCdjJhY0ZpT3RTcits?=
 =?utf-8?B?NjF4SXFGWWJpOUQvWHJEZ09EV2tURW0welN1Nk96cFE5bjdsSFdLYkF0Tjc2?=
 =?utf-8?B?UFp1enRQWTIzcmZWVUxEd1QxZWpLVmQxTzVUeDBqNm5rNXBLckswcUo2TFRM?=
 =?utf-8?B?QU96bXhrblBhZDV4TGh0Z1h1Ly9HalJDVEZpUHR2VGQ3R1RvZnlVSmduTWNL?=
 =?utf-8?B?TXFabWdVUDRGc2c0TFdWQ29BTEk1RzlGbUVFNHZJWnFjbEZER1BPdXcyZzMr?=
 =?utf-8?B?Y0YvQ3RhSlA3VlZGZ2xmSTdncW5BZ2xoa0pJZHFSaTA4NnlmeGlBZDlmOWNU?=
 =?utf-8?B?dWYxbGlHTjluL1k4bXRxTlo2cnRxL2k3WlorRDczNE1EU0lKaHg5Y0w0VTU0?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5feac9f-9317-4233-f051-08da8a8f7d91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 13:56:52.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SPOMMan5pEiBHrRU+sY3EBdcTywxlJYBCjkfD4f0tdCe8TzuMuq2WlUETMLWrCfZnVvNB1u84vIQEF1/khCKLeJl/sFVkv2mlnWKLykuVXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3965
X-Proofpoint-ORIG-GUID: nd9BEPxSe9TcP4r-VKzvzjYa47CylfLy
X-Proofpoint-GUID: KRx6yTUcgt2ulfkgZaQDdaHf27HGRVIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_08,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=932
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208300070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 13:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170072

On 2022-08-22 21:47, Khem Raj wrote:
> Delete dependency on dev-hwrng.device and systemd-udev-settle services
> as they can be troublesome because difference devices may have different
> devices to detect resulting in delayed boot.

As Kevin pointed out to me, it's also deprecated:

https://github.com/systemd/systemd/commit/77ee1783ebc8385013e95161427e1f945691ced0

../Randy

>
> do not run if included in a container image
>
> Add EXTRA_ARGS via /etc/default/rng-tools e.g. if your device has
> hw RNG then something like this
>
> EXTRA_ARGS="-r /dev/hwrng"
>
> You can also use drop-ins for enhacing systemd unit file from machine
> layer via a bbappend and adding a fragment to systemd
>
> /etc/systemd/system/rng-tools.service.d/10-hwrng.conf
>
> where you can add
>
> [Unit]
> Requires=dev-hwrng.device
> After=dev-hwrng.device
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Break the sysinit.target dep cycle
>
>   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 0f50890dcb..5ae2fba215 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -1,11 +1,9 @@
>   [Unit]
>   Description=Hardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=no
> -After=systemd-udev-settle.service
> -Before=sysinit.target shutdown.target
> -Requires=dev-hwrng.device
> -After=dev-hwrng.device
>   Conflicts=shutdown.target
> +Before=sysinit.target shutdown.target
> +ConditionVirtualization=!container
>   
>   [Service]
>   EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169691): https://lists.openembedded.org/g/openembedded-core/message/169691
> Mute This Topic: https://lists.openembedded.org/mt/93196191/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


