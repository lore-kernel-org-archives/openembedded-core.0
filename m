Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB67EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:19:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.103576.1692004774964627739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WJnPH1D9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75906d3704=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37E5fe0e002016
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=WTMi1/xQX39XaxgWY/78/NNTiKvO/AhRvjMnIWF/4Xw=; b=
	WJnPH1D9rmHWCVrqQ2b/Pl3erM7V+yoNMZAbgTv+g8tH7Itma5kAUiHe94L6NBzv
	K07L2c1ICGSEwegHWUmQ3vq8c1P4AlMD3s9uezQrRmMcEupPj7yud0BMKY/xXVm6
	ijWibCLwfL9AdMUw3vKvGdYAxTIkAbdHg+WzKyaimvwdmdopm9gkPADnvGESBOs1
	6udZhg9xO+oi2d4xQLEINQwNbolFHQ0oq6rlZ3EJelqh3B2npGU8/fDYmCMEJYfS
	QBFo6HU+PXeIyXuNDZrUsoPftiI91JUMSKX4qnK/fwPa41DuLcpiM7epgqituWn7
	kCIRDFzU07z9k5alpA3XlA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125sqvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:19:34 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37E9JXG5026867
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:19:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125sqvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 09:19:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG4HFz1Y/aSVONkb+JIhI2rh0sV+TkGoFhZtByk1koZw+kQuZUrDwKN/Q5dbSsQc9Iur8QexmlTaydvC23zo0SwcVqk72CsoSU3YfE+lk3yX/puQ3pb6nKCFL67qXIHkR+L+Uq/s4qemo9meFVLNgRv9YJEIuCpNXFaCeH7TZM3PQKiMTAOJWgW8dbAqibhtvPG6qs+tHsnoi7GEfWLtWHn7oHabdckgdB2LAJO+X8I5u8idgkgtQp0xzc93OwGfnWneSFfQ+s54OnXBja6MWQfRnjsVxQl0fTSmFWgVIQr/44zfBqyKQHsgQubHhE47fdAVFmYkNRYZNqG+UhAUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTMi1/xQX39XaxgWY/78/NNTiKvO/AhRvjMnIWF/4Xw=;
 b=gmg4iCBR37uCr3Y1C8gJFDl/LlWP/oIZw2lNclMnG9CDOn/G0agJr2MuMFkut+Zwi+xX53ALP/gqImHHGNyv/4aRENAw/cBbw7+QWHGAitKYI1ii/FVOtFp28dpkoSc0K6Z/MqJvt44zey9GbV/yd8oyq/tIdPtZUIXfYXduzjYQaM3QIpnQG1eKqOy0tWRALTU+AsPRtlV/3s7y1nyVfRLzOU/TEwr84AnTvRx+bbInnApwAaU28QBfI5WF7b9pCelNdSMdAVOX+zz+JlqkAEZbp6EXD2stZ9XoMWY9p8LhkyIEKNARFGLMFj9+2jfC08pARChIt5nZ/bm1VCwXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:19:30 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9b45:9846:7a7d:6b9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9b45:9846:7a7d:6b9f%4]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 09:19:30 +0000
Message-ID: <ad4d8e98-9163-700d-32b8-5d67b6b127a2@windriver.com>
Date: Mon, 14 Aug 2023 17:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v4] qemu: Add qemu-common package
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        alexandre.belloni@bootlin.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <177296216FD9611D.22245@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <177296216FD9611D.22245@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b63f9f3-de6b-4eb3-5db7-08db9ca79063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6NlhoVzsLltjgrCCOXZOSpVvfjWG08QftB6nG1Qv2yZsBWEWAmBQ6DqsYoh1HbWEPSJ3IHI0xO80nN2TOm+bUapYQAwZfZGhGGpi38Xwk3Gtj9UboOfefrZuMAiIsvmX0XBCiAaPA0cgEo+1TlJLL2pbI+dpKf9YDOOj7lDGnYekM2eUUIClU71VG0kokh8oRS2DJdDkLz7JaRAxQ+xJsZd49FWVV825hlii4fpL9ROSnRE+BGu83nDx1k/IqfqeR+VxX2atNkB/xqDWSrDGiglK2W67hOQtgGHMvCZNGNt4JxF270nFe7KZuyHCFYiIuv/eg6JzUZTZcuNvSlQHNveY0M5zoEqSkSl2FvvkHz+GosccaQniVdSHCvMHcba1ykXnmXG5nGmUFgNIXks19n7ofEH8O7dMxSPvb9pxP+X2aNcNbdjlso7jV88Fd8Txh/aY0YvjdTMZbXQb/yqEkUD+ZnA8gtiXJG/ofH02rmZZia7xk485pt8SRGCZl3mk6XOLmBobrF5nrUB9ll9zs98RM4555IFnVfrOZSDcubYjdxH3gXgi90x/u6rH4y4Q79/I/Bio7foEkLe/Ip5LuZBJbQW5/guEa4DdNrR8U9y/fcp8Li+lhs4VcY+M7eJhZrVoRFtbhHuA6Rots/DMPvp9vfnXSFJoQErtwrJzwLsBWVoGEdvpFt+tgRfh5qou
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(396003)(346002)(366004)(136003)(186006)(1800799006)(451199021)(83380400001)(36756003)(31686004)(66899021)(86362001)(31696002)(38100700002)(41300700001)(110136005)(478600001)(66946007)(6512007)(66476007)(66556008)(316002)(8676002)(966005)(5660300002)(8936002)(2616005)(26005)(6506007)(6486002)(2906002)(6666004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QU5pT0NsMUFxU3FSanZoL21NRFVrRXpON0xvNTZFVVd3Q0dpZkZ3c3IvMytU?=
 =?utf-8?B?c0NicEVZY1padlE4em40YlpWWWx3SkY3Q0VQc3FucjNTVG5RZEg4NDU0UE9Q?=
 =?utf-8?B?Tm4yNjlVQTdyRlNwUzFWMTFmb3dlc3hacGh3RU1TMjFKVVpqVlVrWUNZQkFq?=
 =?utf-8?B?ZE9ZMEpYRkdYcmdYMTNiby90V1BaVE1aMERnckppUmsyb3JaSG82UjRISFBW?=
 =?utf-8?B?TGVVVkNoL0VIZitNRlpBNHcwTXRqWmg5c0VrbTQ5a2UyY0ltVzc0REpJQ0lv?=
 =?utf-8?B?UXdNTUlEZHV4b2RmZmtzaGNPMVc3REVLSUhMa2s5bTcrUHlDMWxYM2xwaDVK?=
 =?utf-8?B?L1h2eHY3elgycEN1V2hPMGdqZks0OUtXSy9wYUdDY3E0WU1pd0xVQmRCRmNE?=
 =?utf-8?B?MFpad1lIYjRmKzdnaDVrNi9jKzlpR2tyaWRwOW9nQ2Q2QkR0NnJpQm9XeW4z?=
 =?utf-8?B?OWdWMFlRZ2VzcGU5SEhTc0lyL0tlcDJQY0FFQ1NMcll4bWkrSytkVnpZd1h1?=
 =?utf-8?B?THU0SUNKTnpaRWJ1WFRpQzNlalREVTNtMVFUUEtkVUp4WS9pUkh3d2dRbHU5?=
 =?utf-8?B?aXZZRG9GYUo3d3pZTCtmakVlOE1WQlRNaFNjQXNESFZheTVYVndUbFcwWnBG?=
 =?utf-8?B?aEhNSUV4TmhOSE1VU2RrYktFeGdtMllraXM2dHBzY0NCY0ltblp2cHI4UmRv?=
 =?utf-8?B?WmZBa25zSTVpR1JYMko3eGEvTmZ3bytDN3loa2xMZWRNYlF5SHFnaE5CR2t3?=
 =?utf-8?B?YzltZzJPMFNkNE5CSjkrUXFGaGo5b0UxTk1DK3ExSkhvYUtZa0FKazMvbi9q?=
 =?utf-8?B?V2t5UE9CQmVvSzVrblVsMFVVOU1wYkRVYWFzMVA0cGFjQ0xBV3M4dVlnTFlp?=
 =?utf-8?B?eE5tZWdTMHk1eEszeVNPTTFDYS9QRWNnUWNXU0ZkZ29sTDQvN1lwYkpVOUNF?=
 =?utf-8?B?dXVJYXIvaFRhRXlRRWNPcmlBV0p2VnF2SStZMTRrd0pGRzFBaTltSnhQZGNT?=
 =?utf-8?B?eFhhSmkzTGdncHJzMTNWSWN5YzhLV2xrME13ZlNMNW5NWGhad0hqU09XQWQv?=
 =?utf-8?B?OU9WZUl2ZlNFTkpadlZiY3E0TWJGQWdtN3I4eWpnb3BFSmVicWNyOUpzc1VM?=
 =?utf-8?B?UlhyRmV1VEFocWF0KzNtSE9MbnBSTWhCNHBQalFZRlpZdThPQ2U3ZVlrM3R4?=
 =?utf-8?B?SnhhM1RtUkVpMkJBQkUySytrS2xKWTd6V2NtT2tXa3JxWHYycldZaUJWaWwx?=
 =?utf-8?B?bHhmZ1BSWHBCa1JaWWs5a1N1dE9PODRVUWRoVEpZNzIrUGZJMFlONlFuLzRB?=
 =?utf-8?B?QVB0bG1wS0hsZ0VWbm9EUkRIV1hpeVp5azlFOVFYRVJRNVgyYmRrNmdkb2Fo?=
 =?utf-8?B?SUNIYU9OMHZFWmUxOHdXZGxFVWk1TXJxa3dmTlh0ZlpEQWFlLzhXbG4wN2NI?=
 =?utf-8?B?a2FSTzYycnFVVUFlS3UvQk5QMjdHTDlBenptL2FURzJNbHZNUWNvc1NjWWZW?=
 =?utf-8?B?WGdoUzNnZDNnMmV1NmNsdmJHR3BMMzdNNVRpUVNyUSttaDBwRUFJemNFVVpa?=
 =?utf-8?B?Smp6UkQ3cXpBSGpGL3NqWWx6OUdTdFN3SVoxa01CMUtRNlFpR3M4Znh0bGcy?=
 =?utf-8?B?enh6NGxsUG13MkozT01uZGlRcmIwOEJyQjFmMDByVWduL2xaRHdidWxFbHFz?=
 =?utf-8?B?NDF3Q3FxQmxaYTNaMUgvdWtBcW1zYjFidVVsZzRsSjFEdmVSeHF6elJsTk1q?=
 =?utf-8?B?MnJiaWJsZGFYWTE3eEtzTFlLSmJvVktsNXpPK1ZKQTJaRDh2SFV5RmRKRTFk?=
 =?utf-8?B?UHdPQ2RTVTdEdGhxWm9UajdLL0VoSkN0MmNSWHlxK1E2ME9Wb3NHM0hBejUx?=
 =?utf-8?B?TE12Z01BTHFnMjdKdXhuNExRMUNxWEIxd2VuN0sxQVVZNzY1S1hKbUFQaE44?=
 =?utf-8?B?UzdkczFVRllpNEgrN3NVMm5tZFdwVmhKelN5VG1kQ3dJbHJweUlQV0V6bVdh?=
 =?utf-8?B?amsrOUlwd1hZT1JRVGFjVk50N2Z4WExuTHZrTXBFSEYyUmZhajU5TmlFS290?=
 =?utf-8?B?RXY3T3AzdFVGbXlRNDhTSE1TcU9maExNR0V5bGF3ZFhPOThRRUNJQjJzS3dD?=
 =?utf-8?B?NnlJTGFMRndYWWZ0c1BpVjhkZUlVaUZNSnNHNmNqemNIb1puQWtVVmZjT3A4?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b63f9f3-de6b-4eb3-5db7-08db9ca79063
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:19:30.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhw3OicF759JfdG6BkGVOVmjjIy+TIl6a9kJNrI2+qC59rlOhoMMC80cH7n8tsh6kAgpDTbsgw5ity/XA+Yebw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
X-Proofpoint-GUID: 2dx34JgjQDQcOdMpiSXxng3Tg6yAlGVH
X-Proofpoint-ORIG-GUID: pz78ebgZ8Ay_6XfkfLHSFllQISpdoECD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_04,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=458 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308140085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185926

Ping.

Thanks,

On 7/17/23 15:11, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> We split the qemu package [1] to add support to make user can install
> one qemu arch emulation rpm to ease the concerns who care much about
> the rpm size in embedded device.
> 
> But for the user who only install the qemu-*.rpm can't do anything
> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
> explicitly.
> 
> So add qemu-common package to package all thing into qemu-common when
> not split the package, and package only the basic into qemu-common and
> other arch related to each qemu arch emulation rpm when split the package
> to fix the backward compatibility.
> 
> qenu-*.rpm which is meta package rdepends on qemu-common and the available
> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> 
> v3->v4: remove the added native-sdk dependency.
> 
>   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>   meta/recipes-devtools/qemu/qemu_8.0.3.bb |  2 +-
>   2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 16581db69d..76560f454d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -225,15 +225,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>   PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>   
> -INSANE_SKIP:${PN} = "arch"
> +INSANE_SKIP:${PN}-common = "arch"
>   
>   FILES:${PN} += "${datadir}/icons"
>   
>   # For user who want to install all arch packages
> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
> +PACKAGES =+ "${PN}-common"
> +RDEPENDS:${PN} += "${PN}-common"
>   
> -ALLOW_EMPTY:${PN}-system-all = "1"
> -ALLOW_EMPTY:${PN}-user-all = "1"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN} = ""
> +
> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>   
>   PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>   
> @@ -241,15 +244,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>   
>   python split_qemu_packages () {
>       archdir = d.expand('${bindir}/')
> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
> -    if syspackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>   
> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
> -    if userpackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
> +    if subpackages:
> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>       mipspackage = d.getVar('PN') + "-user-mips"
> -    if mipspackage in ' '.join(userpackages):
> +    if mipspackage in ' '.join(subpackages):
>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>   }
>   
> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> index 42e133967e..5d3c47c3b0 100644
> --- a/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> +++ b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> @@ -8,7 +8,7 @@ DEPENDS:append:libc-musl = " libucontext"
>   
>   CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>   
> -RDEPENDS:${PN}:class-target += "bash"
> +RDEPENDS:${PN}-common:class-target += "bash"
>   
>   EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>   EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184432): https://lists.openembedded.org/g/openembedded-core/message/184432
> Mute This Topic: https://lists.openembedded.org/mt/100190357/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

