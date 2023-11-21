Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E8AC54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:30:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37678.1700566237721674897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qv7+7gt+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9689fec1b6=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ALBRQCZ008293
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=NSvUvJ94JES2ig6q1lF3+SxRcRIBy7mr11oKhFBn3gA=; b=
	qv7+7gt+OjyS9ZmJHcGppk/gYnSleUaYL8JYjqcwZh7zIzCcYWe/QJL3bf78PreW
	hQIrDTy8AlVzbCT33hm5OIHRJZhLhXrqISPh8RVmcUWVwDQbW2XBvHXTSF6KLkEq
	lZwyB5R+wH8zV7OoeoYjUU8aaFwv1FEMjMFvpUvi+xk2/QywdmeAekOYOzCcazNU
	Smcux1tMJ1by2wk0b5u8vT6pwTbkynW8Yb/NtSEf9MJ20wvirryZaqGw+UfAbCa8
	4ECF2E3JquKusjX6RLRyBag/Uz/fEudoiImp+DyxRCt+sIBPBrI3DxGtNCjdcjuV
	skGb010r0DFKWdQ2vdpLfw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uf41s9xmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:30:36 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3ALBUatW011784;
	Tue, 21 Nov 2023 11:30:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uf41s9xmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:30:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HidqsFC/p6IuMuPx9J2b7zAGG4fiQzzrCcQp9iy1QHCKy45XXfLidN7ZRxXK/+qswUcCKZkkk8C7OEJO4dfU/JOP5l9j+/TvDwJL059ISg0ol9qRCn/HPcNtuH46Q+ldyM4L3/gmU10l7XIDYnbE7XU0IMGcZvGK8Jj5Zep+kJY3oec9hZGKl5uSM8PdZO99ijDwTyYKLsr27b7KvnxxDdFcwKFSSKMpHI5txZa62o9Bx0bqEaoz2Mnd0W3Ak1HmazzE8pnQrFJG3XkjQEXudRtNYrJuIXOS3NNMMgTUC4EL+HgwbP1KQFUhRQf89mY30RVJ9q2wAascVyZxAdQtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSvUvJ94JES2ig6q1lF3+SxRcRIBy7mr11oKhFBn3gA=;
 b=WNjBl9uynoxhnaUqAOLec6/v7pMQHa/qzGGIykTAe7ZjCTE+H3ujwEdqLBnL+ZWluY9CpEGoZt4W9Ewc6ClyQ1002up9JfuAoQHdb4CEnIGl3FUvGLsZIkjMpey/Qcoj1gS0hH9R28sLl3345m5bmQ03jdvM2nYIQp/ToGjdqodZ5O9vFxoMCdq0wkNkduQqxyxuzCHgcR8skwEIBW0l0rhWRoJre/cuuLmRVh40aCU1K6AI5T6LgdGrQ9aoPAuYaQaP3g2ajId1t/RJuPjilK/31Gxrx58AdkQ+7WXXyhvuPbUTJ1OKxKtPdPPIY2gPEGcbZN0sfmHOZ0zdj8Wf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 11:30:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Tue, 21 Nov 2023
 11:30:30 +0000
Message-ID: <2d435d97-a7c0-40b4-88ea-6e8b9f245dab@windriver.com>
Date: Tue, 21 Nov 2023 17:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
To: Alex Kiernan <alex.kiernan@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com, Alexander Kanavin <alex.kanavin@gmail.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
 <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com>
 <179867874B67F596.6542@lists.openembedded.org>
 <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2babc7ef-83c0-471e-7974-08dbea8543a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HOypI3QzX5k81Y8jQ9h8++ifNGF68Ki2ORu6jI5EEu3A25IAUiZYWoER3Xhbh1t4SeK3rmvbpIGnde8qd19KSrdyTydoMDb2sFHirNpgP2VuvwYUzGzZZfioC3GlhF3KhuEn80q//eWg6zOv2SNGGsSvZ+ZQO+KOio1xkv0yY1JzjOjU9RSq2o0pAOr0sc6zLp/4kYCC0D/33IPE3+emRlXfpnT7YOrUpxavqOCv9OnRCROLWoPtgmml/nLvNL+k7LqXSc4zw9kZJLkwgogjDsqkHtr3qCDMw8ho9WisPII18aoDbZ2Uok5W3viOKZVKwCIOHvR1O+c8PcIsxHp0xgb+h0Rd9VZJXSyEDCysIiqPt7W7QOQ2PSfo4jN/iMk0ssdF6mOELWBWvRhGLZbHTVEqZx2iLzg2Uf2FfUWETrZKl9zL/lsJK8KchszssWmgM3yTPwKSGpJq7l2nTa8UGe+QGeSlGvSwZIyvofFpLPTLemM+v0WW7H6PMLXorVomF1gk2f3vuwJaoGCQImxlN5raoigcn40k1xSdJjbSFpbsgwjQ7B0DGG8yI+6fAi/ZTo6TaEHxeh7j1D13odNyHTlJHjo2K5OTKuoajoWR+H4urii2oVbQHh7IT9iTg0OQ146PSiCc6UchSUx6Iqi07H7QxNTHGpQxe0VY61M5lPP4uFauOFjKuiSqcTVrmq6R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39850400004)(376002)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2616005)(86362001)(31696002)(31686004)(110136005)(6486002)(6666004)(6506007)(66476007)(66556008)(316002)(54906003)(66946007)(36756003)(107886003)(53546011)(6512007)(26005)(83380400001)(2906002)(5660300002)(478600001)(41300700001)(38100700002)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2RvWkhKdVl0TTdUK0dKU1JlbllvSTNHV3VyLzZIQUEvbWdDUzNWTUdjU1Fy?=
 =?utf-8?B?anpZeFdrMXNrOERZa1c0MDJudGU2dm1VSFNVdWtTM2kxc2U2Ky96bXdUQ1Q5?=
 =?utf-8?B?ZGU0blo5QmwzSmxjMjI2NWZ1Zmp3dGN6SnNMQjVPLzU4emhyMHRuQzhoUGRO?=
 =?utf-8?B?c0xuaFlOR1BmR1BpODkxSFlqVU9NdjZvQWZQQ0JXNUEyTiswN21DeG9PQXdu?=
 =?utf-8?B?REdpK0xkZmNYMUR5SjFVK0ptb2h1R0xXVnRGTys3WkhxaGkzN2V3STBlSXpS?=
 =?utf-8?B?REhjUlZMM0x5Vm1nTFAxM1luME1SbmJxM0FoNFhQVlo0dU1DZmFKVXZGbjMw?=
 =?utf-8?B?YVJKOFdRQ2hRTHQzMlE0NTJLVk84NVRnbTdhV1B4ZmQ1ODRTaFdtRHIyQk92?=
 =?utf-8?B?VEJVNHdnUW00QWRkaXN1SHdmU1RCWFlvTEJpcUVBYVVUSHFOYkhPRElTMTQ0?=
 =?utf-8?B?QzRsSTlZTDlpcnpKLzlzUENMMTJJa3ExbUV6NlFtektkK3pSaTl1RSttQkhX?=
 =?utf-8?B?UFdjbU5nTEJkdlQ4QXlVWHpPYUlQTS9VZzNNU1RhYXRHWERwR1FwdHMzQXVU?=
 =?utf-8?B?dUkxV29GdE9SbWFCYW9IY29YZVYyUC9jdWxUTW9QRWFhRTNGSTJIOVNwaTNp?=
 =?utf-8?B?dHFrMnVTbW04V1IzVG9QOWIzaDBGNVZBWTlPWkVXTHQ2ekJGUHRuaXJodVI4?=
 =?utf-8?B?NXFCNWNNWStHYmZ2TTNUNkNnaUhKU3JPYXVDYUlvbHhuTUg3YUtMWCtzTW5B?=
 =?utf-8?B?em1tZXFwZk9nRllySjhmM0h5dlV6VW9HQ08wVS84Y1phTWFoeGVsdkNjODhB?=
 =?utf-8?B?WXBFcWIwL2lnblNFUU5wT3VrbDg2S0ZzRG5CcVFyQWhkdlBJT3d6TjlDTVdm?=
 =?utf-8?B?TUdlcmJadGJWYVNpcW9FRjRlaVZHdTd1ZUZ3eU95UHlXWEF3Ulh0aWRSUVZu?=
 =?utf-8?B?RTdidHlmMUp1T1RoUGU1R0hDN0NaRUh6YkxlWlFsZGJSOS9xK1hNYkU1QzJG?=
 =?utf-8?B?cTdnbkJNdUZkRnp3azRxWEFoVnpBbjlEaUJkRmNwRGUxVEZ1OE5DL2hVVW9Y?=
 =?utf-8?B?VitDeFR0aFBZdjdWdDFUQTl2RW1YWGlieXBjWEgxbDNrTFY4QkRtdGhZRFBU?=
 =?utf-8?B?ME5nL0J5WmQ3b3JONjRmK21mTjNUQzZ6R21PN1BHcWxFYkcrQXNCUHZ4QmUx?=
 =?utf-8?B?YmdieW96UGVwczh4N2s1V3hFQUJRelVVVGtvK21oSzZrTDJHVklnVG5EVVVV?=
 =?utf-8?B?VGJLT2VRekNhUm5CaXNmSjlRS3JUSkc1OWFHUHF1QzRaZ2Vha2N3M1d0Y0xM?=
 =?utf-8?B?UXNxdHRKYVFtcFNnN04rUzZrVjJZK1JWdGsyNG5iN3NOUVZ2MUs4aU1aajh1?=
 =?utf-8?B?dUFIdEpoK1M3RjBsNjJGSG9KeGV4MitwWmlINmVPdGFJa01rNUdNbnBYeStC?=
 =?utf-8?B?YkhCNm4xOHdGdzVpZEtwS1I0eDkxeVVjWE5MMnAvRTdLWjA0N1ZMaHdTQ3Zy?=
 =?utf-8?B?dGhIQUFUZ1dCSDJ3TTVzTjFnc2F1YXRTeERFaGMxQ1MvRzZDbzROSDJyMFNt?=
 =?utf-8?B?NXFYUUxpeXhKbi9aQU5IMVp2VXFTdDRKZndXR0duNWQ5UTZLZk52MktTZnZ2?=
 =?utf-8?B?dlY3STB2cGZQQlFnczJrdERJbGN0TEFvOGd4L0swLzJuQzYzSko1V1psdFVS?=
 =?utf-8?B?WE56R2EzOHlaMUtDZWhmSDFqWHk2VUt6YTB0aVZTajF2cHlvUzRwVlhXTmpy?=
 =?utf-8?B?K3QvME5meDMrNnNwblRJbEljSjJsTCtCejgwQzBhcTZabnRYVjB2NHVCV1Qr?=
 =?utf-8?B?TXJFazM2cC9yaTVta2RsckZzQ0NkbmM3WUpRamRidWg0SDdCM053bDBRS0pu?=
 =?utf-8?B?aFEwK3NiTnRtcjhWbHNDandYQVR5R0R6Y0VEM1cyejFQTll1Wi80aWVEc2N4?=
 =?utf-8?B?dC82dXk5NGxadTFPQS9ZdmlDYk9BeFBUVVE1SysxYXp3QVRPTmdBTUFjTXNF?=
 =?utf-8?B?N0ZEWUFvQVpkRGhKNTdsenNCOFFlc1A0UUprWmpmVngraGlZdTZNR3ZHc1h2?=
 =?utf-8?B?NFl0VzBlTGphRSt0TklvK0xOOXdETm9qODg0OTVYakpoWkhBY1VLeVBGbGg2?=
 =?utf-8?B?OEZDUDlOZnkvOEQ4TFV6WVBpUWNQMVNxRit5L0hqa2xJZlc5WU5sK2ZtYUZQ?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2babc7ef-83c0-471e-7974-08dbea8543a7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 11:30:29.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7HOrGe5SWkIXlgF2m+b+rm5F+1WsjD0+IEVWRaldqqU1MwaZ+q1WedbEuInKSOkq/+RSkD7AV+FIBc1ROj6vPAkpGOzWrlm1eC/N36V8U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-Proofpoint-ORIG-GUID: _Ad-OZGMB-6XCCF-sv1T0xfIWnWejY5R
X-Proofpoint-GUID: t3r3zvZlv3pJ634qsYxNT-2ES449tspF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311210089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3ALBRQCZ008293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190966


On 20-11-2023 21:57, Alex Kiernan wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I've finally got this running in a way I can usefully inspect and try
> things and it's beginning to feel like we've headed into something
> which simply isn't supported.
>
> The failure is this:
>
>    thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30=
:
>    no entry found for key
>
> Which is empty because the mapping list is collected by running rustc
> with -Z unstable-options --print=3Dall-target-specs-json, but that fail=
s
> because we're not running a nightly compiler:
>
>    error: the option `Z` is only accepted on the nightly compiler
>    help: consider switching to a nightly toolchain: `rustup default nig=
htly`
>    note: selecting a toolchain with `+toolchain` arguments require a
> rustup proxy; see
> <https://rust-lang.github.io/rustup/concepts/index.html>
>    note: for more information about Rust's stability policy, see
> <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-=
features>
>
> Basically feels like running the test suite is only supported on the
> nightlies...
I saw the same error earlier.

Investigating further, we understood that the issue is not related to=20
running on nightly channel. The '-Z unstable options' were also present=20
in earlier rust versions and removing of the newly added -Z options=20
after 1.70 also didn't solve the problem.

On doing further analysis, we found that the custom target config/specs=20
were not fetched during the rust build.

The log for reference is as follows:

Building stage1 library artifacts (x86_64-unknown-linux-gnu ->=20
x86_64-poky-linux-gnu)
error: failed to run `rustc` to learn about target-specific information

Caused by:
 =C2=A0 process didn't exit successfully: `=20
build-st/tmp/work/core2-64-poky-linux/rust/1.72.0/rustc-1.72.0-src/build/=
bootstrap/debug/rustc=20
- --crate-name ___ --print=3Dfile-names -Csymbol-mangling-version=3Dlegac=
y=20
-Zunstable-options -Zunstable-options '--check-cfg=3Dvalues(bootstrap)'=20
'--check-cfg=3Dvalues(stdarch_intel_sde)'=20
'--check-cfg=3Dvalues(no_fp_fmt_parse)'=20
'--check-cfg=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(no_r=
c)'=20
'--check-cfg=3Dvalues(no_sync)' '--check-cfg=3Dvalues(freebsd12)'=20
'--check-cfg=3Dvalues(freebsd13)'=20
'--check-cfg=3Dvalues(backtrace_in_libstd)'=20
'--check-cfg=3Dvalues(target_env,"libnx")'=20
'--check-cfg=3Dvalues(target_arch,"asmjs","spirv","nvptx","xtensa")'=20
-Zmacro-backtrace -Clink-args=3D-Wl,-z,origin=20
'-Clink-args=3D-Wl,-rpath,$ORIGIN/../lib' -Csplit-debuginfo=3Doff=20
-Cprefer-dynamic -Zinline-mir -Cembed-bitcode=3Dyes=20
'-Zcrate-attr=3Ddoc(html_root_url=3D"https://doc.rust-lang.org/1.72.0/")'=
=20
--target x86_64-poky-linux-gnu --crate-type bin --crate-type rlib=20
--crate-type dylib --crate-type cdylib --crate-type staticlib=20
--crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo=20
--print=3Dcrate-name --print=3Dcfg` (exit status: 1)
 =C2=A0 --- stderr
 =C2=A0 error: Error loading target specification: Could not find=20
specification for target "x86_64-poky-linux-gnu". Run `rustc --print=20
target-list` for a list of built-in targets

Build completed unsuccessfully in 0:04:38

Regards,
Yash.

> This is the full piece of useful logs for reference:
>
> Testing stage1 compiletest suite=3Drun-coverage mode=3Drun-coverage
> (aarch64-unknown-linux-gnu -> aarch64-poky-linux-gnu)
> thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30:
> no entry found for key
> note: run with `RUST_BACKTRACE=3D1` environment variable to display a b=
acktrace
> Note that not all variants of mir-opt tests are going to be blessed,
> as no mapping between
> a 32bit and a 64bit target was found for aarch64-poky-linux-gnu.
> You can add that mapping by changing MIR_OPT_BLESS_TARGET_MAPPING in
> src/bootstrap/test.rs
> Testing stage1 compiletest suite=3Dmir-opt mode=3Dmir-opt
> (aarch64-unknown-linux-gnu -> aarch64-poky-linux-gnu)
> thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30:
> no entry found for key
> note: run with `RUST_BACKTRACE=3D1` environment variable to display a b=
acktrace
> error: the option `Z` is only accepted on the nightly compiler
>
> help: consider switching to a nightly toolchain: `rustup default nightl=
y`
>
> note: selecting a toolchain with `+toolchain` arguments require a
> rustup proxy; see
> <https://rust-lang.github.io/rustup/concepts/index.html>
>
> note: for more information about Rust's stability policy, see
> <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-=
features>
>
> error: 1 nightly option were parsed
>
> thread 'main' panicked at synthetic_targets.rs:66:9:
> failed to gather the target spec for aarch64-poky-linux-gnu
> note: run with `RUST_BACKTRACE=3D1` environment variable to display a b=
acktrace
>
> --
> Alex Kiernan

