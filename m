Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8B9C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 20:40:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32123.1713300023226621010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 13:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QOwndMfi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48369c933c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43GDVU3p016269
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 20:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Mj2u3DPEvNzi+2q1Fsh
	dD5ukXNy7kDVLOGAyaDQ0ToI=; b=QOwndMfi1eve/E94Qt6ngbFfz4JL22FnPJ1
	jvTlHPyXzXKwtJZNfL6g4ifgzCuILeo/nBUypXamDGYm2fsaFJXVG18CQkTN5Je2
	LQds9sRq/fevCrv2uJisUmP9N4UREln3CAiFmge/n/703vxaSZmTEDMjtXr3wL44
	epUEEW+wVJkeTgcYtqQ1xmRugXMx46aRS8E4XVqfAGPv0b47jHcZ90Zzu0TSNkIQ
	JSTlaEq3LaHF+nbwQtAf7MzUqgeWE2moLT10aiw8LF/rH0esg0Q/DES6S+Dkx6Oj
	Leei0s5SL2PpcHOLxk6HGk9jNALBuXD8PqaBm78YWEB3woRXmVg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16k6nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 20:40:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGsSQXR+xS1rs/rOAX5uNT7uKbCUYqkDdTgoVcZtgougQXd7XH7L1nNjQtTJQ7n0MLu2yNWI9Oa7EQoIJk9/DU+4EOWbVwncDU2/79yErPcSWOAnPfQsPRPuG4SFL9MNmM7iiRAPHdB50dxwRiw4GJQyV1CTFEzj9j76inxKjMpkoTRM0k9BbGi85L3QBGdN1+6TkLvc4tjqWvTeCoVufb7Js0GM+JANTQE6gmonCxZy5SyUjnaqbrtl+p4XHbkffu+VtYKl3frbQmQ//1GXdRDlGNTkn251ucBzHHdrYCqhXO605ejnJHQeZf/yofhhrvZy4de0xVx5rzRD0b4kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj2u3DPEvNzi+2q1FshdD5ukXNy7kDVLOGAyaDQ0ToI=;
 b=mDR3f2s5TjZiIIepeU51Ikd9WrckSse1YZe1rUj2hQbyFvLYTMbZrFd0I2n7NOoslGMgbJP7z6Rpu03dqt34AI4ytQdlHNmjrbCuslvqeZoImaNHgMkBVUqvqENRFDlo+4DN1c+l8qpj73csfF61myCZHMRN5eSaRyXWmu/S6JzxKxJzw/0PXEHkRQJc7zx8DnQKDQqElqPmx/5m+EbUw+HruuFICxfu4v7QrlwyZ681VLu+K69/uAiE9E/Qq6eu1EMrWH0c+wv39Fek0r+wqd1yLz1LEPQfWT8wTuU/05inlIxrSDm0wGNn3KZii1HVaz13CrFK8KnK19ViUObZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Tue, 16 Apr
 2024 20:40:16 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 20:40:16 +0000
Content-Type: multipart/alternative;
 boundary="------------0ipxGRu4wA3AVKCIZaC6o6bS"
Message-ID: <3c49ed4e-ba35-4d00-be27-8c937483a243@windriver.com>
Date: Tue, 16 Apr 2024 16:40:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3] Improvements for performance test report
 view
To: openembedded-core@lists.openembedded.org
References: <20240415144129.92641-1-ninette@thehoodiefirm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240415144129.92641-1-ninette@thehoodiefirm.com>
X-ClientProxiedBy: CY5PR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:930:80::11) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f301dc4-68a0-4e06-3335-08dc5e556bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3kSj+OG/UIGch2M+28VRcGFoKExmQHDNmGTtzu5buoiowFgezQ+Dey35EA78lhdVAMQoRUB8FrCYfUPiFs+VqJ/uDf5jv3UCO+oV2GwN+T5sm1LGLg0EktrlG/mvjNVQ2LJjJyKJ+dWvBMm4uAtsyrWHnkMM9tZ8D6ZfRHyXq7NpNqcGXYvwE/Xzpxd6g4HR/B7u1lM/+5K+17C5eAsr9rB1BU9IWDoa5tl0VqKXxSlpY1byworC+MR2vqdGsCAXvt43gsi3fT761u8uB/Yc5pDYwDBzEVRSlcseHnysZRbPBb41I8p8A20S/WmElEWXs9kdzVqN8F8GYgC3BmUXfdZafsi//fPQiJclISOrosjYOUNXza4wYpuy1I8hJugBvnsfzDRVRHMXl0Bb6aWCtUCcdLF5EOpMDr1dZbb8pHN+9KZPCludXBgqQ9+vwA5ST+HycmX2rKH45kttxZY8tooG0r7zdblCsThUUqIvppv5gpaMPhbUGVyXOe88vS15Y52E1qpDMUcmedSdK7eJ5S+TWkcan2MPA6E3boPV+5PMPjiOT8P9msOcn0ItrspkUEnULpHcFJbhXI4E6o19sBXM7mTO18FBq1GQiVNjkRo55UOzrRekhYhyXUcP3dF+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjF2NTR1VWxlKzRyS0ZzN0lnUUY4N3Qzd1JxVGZxMVNBYlc1dDUwOW1kN2N5?=
 =?utf-8?B?U25tNWREclJIb0Q4WVkyWk83V2VGS0ZIVzdqN2N3eWU0bERrM1A3L3JhRzVZ?=
 =?utf-8?B?c3lkc3l3T1FRd0txR1FrK0cxS1JYWFFpdVNVQmllMkxyTVFUMkN6OVdWYjZF?=
 =?utf-8?B?aXI4YnhER3UyckRXQWRxakZqaG1NdHhGZHpTeUVxRWF4R2I2a3F2SE5PT0JP?=
 =?utf-8?B?WXZ1ZXdWV213WEt1azVSMW1za1FBSktTaWhNTlpESVpONWdCaXZ3VVN2YmFZ?=
 =?utf-8?B?MHMvV3VFTDVQNnJXcmF3MmMxcGQ4MHBoUEN3S2Z4U0ZBYmZ2MytuNzd1Wll0?=
 =?utf-8?B?aDdiaUE4UVpSeUdYd0lGOGNaSTBaV3F6Y1J6R3BadFFKVEVUM3lRZnZTUTBD?=
 =?utf-8?B?ZjJ2UUtQOHFiVkpHbVU3Z0lsakFsZU5HRStFQjQ3VkU5VTVMbm5BV09XRWxC?=
 =?utf-8?B?VjN1OUJFMkE4ckM0YXZEeS9yUzJOaUM4N3UzZmZrVDVIem5WM1dwYStIRGI4?=
 =?utf-8?B?QnJFcndnRTQwaUZsVTdwU2h0VzhHWnlQVGwyV01GeENuclMwdDhlWFNjT05W?=
 =?utf-8?B?eHFaVENtT2ttRFZhdU93NG80UEdQSXpVNGZ6aWladExieXl0QTh5eERTcWdh?=
 =?utf-8?B?NDF5VXhTdmMxZ1dqMFpiS0RVSERCZExYZTJycGJCWW0rMjJKL1FJZ1UrbFBG?=
 =?utf-8?B?WHJHUy9DRXJ2YmdFcUVSaHN2RkF6ajhuQ3pCRTBUR3Fha1dTN2xZcjY3djM3?=
 =?utf-8?B?dTcxL2d6U2RTbC9YTnFrS2FYMHRnZGlRQVNQSk5Gbk9jQ2tQbVl1dTBJU3VI?=
 =?utf-8?B?MDZjUTZSVFRBeWVkVFNud3JoNTZKTnRVbkt4RzUrb2t1WEUwWCt6QWplQW1T?=
 =?utf-8?B?RTJLK0NQcVdXd2JYSWpTUlNzb3JhZXRkTElFWUJYMzNsdm1nRFgwRTdOaE1h?=
 =?utf-8?B?V3l1QmI3NmU5Y1ZaYWtDVGt0Q1pWOTlCS1llOWhzTjNRR0RCZ3hjUEw3QnRJ?=
 =?utf-8?B?Q1I2UDhIRDlJWlJIYjMxVDhZNEx3RFNaL2xwYVJCSkNHUDlxNnNEeW11TWhU?=
 =?utf-8?B?djMzVEs4SDFJNkZsYWQvcUFPSHlhQXRwUmxRMHl6MGhFU3VhdDc3RXBKcERm?=
 =?utf-8?B?WnNSNE42Y2ErM1lyTDQyajFlbEhoT2p1YmFYMVRJZ0srcG9oR0Jjc2dlQ3hn?=
 =?utf-8?B?SFRJL0l4TkVoVTVqaW5qcFRiUDYrd3QxeFVxSStNRVd6c1dqWGdXc0tWTGM4?=
 =?utf-8?B?Tm5BWTZDV2xQZDdFU1I1b2oxTklrL043T3cyNVlLems1RkdnYncwUjJlaVp5?=
 =?utf-8?B?eUs0K25OUGhGQkdxV1A2V3FCYUsrNTNGYkY2bWFpcEQ2YUFJdHdicUNVSmFD?=
 =?utf-8?B?T01NRzQrUFRMVkUxQ3RVZ1hIUGdPOXl6YzhSOEVGMi95QUIvRHFUMEdyZU9s?=
 =?utf-8?B?M284dG92bVcwZUU1SHFHNUtwN3N4TUorRkV2aDZrTnNZaVZwZTV2VXBjZytj?=
 =?utf-8?B?TnVyb0ZFMlUwR1BGcnpuUlljL2hXMFBaL1R5UHpRNzl0YTBrc1A0NGsrMGlR?=
 =?utf-8?B?WU9Yb3Y5T0pvWjFtRjlHRGpKSkNxb2F0TmJaOW90eGlWaGN0NlZ6azdSOUJ4?=
 =?utf-8?B?S3dQSHJyL1MwZm4zaERqaXN4RGx0c0ROeS9Wb29HQzJFWURnWG5rTkt4ZFpS?=
 =?utf-8?B?SjdFbjFXaGhzaitzVndoeEYwVTNXSzZHN3l4YVRCcC9hczNOZisvZSs3YmU4?=
 =?utf-8?B?UUNKNDFybEw3RlMrb0RiK291bkdpZ3J2S2RmZit6WEZiSGpLcDdrT1FrcStu?=
 =?utf-8?B?eEF3T29lSTJMdTJ4MEtkQVlaYmo1Nk9yeGpWV1Q1Z2w4elhsRHNrdDQ0RUtV?=
 =?utf-8?B?c3dPVnQ3Y2oyTSs1UHdRSEdJbnQwK29uRnk3ZnNKcSt2ZWpXb3FtTzR1b3h0?=
 =?utf-8?B?UGxnSFZXVEtwcUxoNUdnZ3p4VzFuUERXa2llQmkwSjBISXZJSkRxZTFDWWd4?=
 =?utf-8?B?bUg3YXhZaFBMUHFiTmVkNmdMeFE0UUlTT1lqS2VtSzBFNXJwbngrRHp1d28r?=
 =?utf-8?B?NnVoYUJpZTh3MGNnUy9HMDVsTWlSOUdHNXRaamc4NEptZHByTUZLTU1EVElY?=
 =?utf-8?B?SFBOYmpBM3NaVlFlU1FiMFpqNENqUmkrVTZMcU1TSWVJZkQxYXdYeFg2MkFz?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f301dc4-68a0-4e06-3335-08dc5e556bf9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:40:16.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xju2Fr6rBNWDg/QgrPUGw/AzW6Ayg/VQbY0XBP4TfzM1iyi0HFro+zWn6j8N031JULOVNOvUrAxGZHObZIWvgxZ++Np5g+hGIkWM5jj4vNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-Proofpoint-ORIG-GUID: 5J2YLpjJI7FfHnCP7zhzJCwH5_buUpYJ
X-Proofpoint-GUID: 5J2YLpjJI7FfHnCP7zhzJCwH5_buUpYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_18,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 20:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198456

--------------0ipxGRu4wA3AVKCIZaC6o6bS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43GDVU3p016269

On 2024-04-15 10:41 a.m., Ninette Adhikari via lists.openembedded.org wro=
te:
> This work is done according to "Milestone 9: Build performance test rep=
ort view" as stated in the Scope of Work with Sovereign Tech Fund (STF) (=
https://www.sovereigntechfund.de/).
> The current report can be accessed here:
> Performance test report HTML (https://autobuilder.yocto.io/pub/non-rele=
ase/20240117-15/testresults/buildperf-alma8/perf-alma8_master_20240117090=
048_663f180574.html)
> The report is created using the `oe-build-perf-report` script in the po=
ky repository. This script generates a performance test report in HTML fo=
rmat using the data from the yocto-buildstats (https://git.yoctoproject.o=
rg/yocto-buildstats/) repository.
> The report displays the performance test results in line chart format. =
The chart x-axis represents the commit numbers, and the y-axis represents=
 the test duration in minutes.
> The report also includes a table that displays the measurement statisti=
cs data for each test. The report is interactive and allows users to zoom=
 in on specific sections of the line chart.
>
> The current report format required some updates to make it more interac=
tive and user-friendly. And this patch addresses such improvements:
>
> - Add Apache echart (https://echarts.apache.org/en/index.html) library =
to create oe build performance report charts and make them interactive.
> - Restructure data to time and value array format to be used by echarts=
. It also converts test duration to minutes and adds zoom to the line cha=
rts.
> - Update measurement statistics data to include `start_time` so that ti=
me can be displayed instead of commit numbers on the chart. It also updat=
es default commit history length to 300.
> - Add styling updates including page margin, labels for x and y axis, t=
ooltip, and section descriptions.
>
> Updated report screenshots:
> https://github.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-4=
0d4-ac90-f13055735e53
> https://github.com/neighbourhoodie/poky/assets/13760198/1ed43876-73a9-4=
87e-aed3-ca0edf97514c

Thanks for the nice, dynamic UI web graphs!
Overall, I find them useful and well-designed.


Would it be possible to present the data in a more discrete manner since
the interpolated view presented now, while nice to look at, does not alwa=
ys
reflect the underlying data trend?

For example, if I have this data plotted as 1) stair-steps or 2) line=20
segments (I didn't take the time to do a spline fit),

I find that the line style for 1) is usually less misleading about what=20
we really know about the data.


1) stair-step



2) straight lines:



and I'd like to see this data:


plotted in the stair-step style.

From:

http://autobuilder.yocto.io/pub/non-release/20240413-19/testresults/build=
perf-debian11/perf-debian11_master-next_20240413064005_7116cd908d.html

> For local setup, you can do the following:
>
> 1. Clone the yocto-buildstats (https://git.yoctoproject.org/yocto-build=
stats/) and the poky repository (https://git.yoctoproject.org/poky/)
>
> 2. In the poky repository run the following to build the report HTML:
> ```bash
> ./scripts/oe-build-perf-report -r "LOCAL_PATH_TO_YOCTO_BUILDSTATS" --br=
anch "master" --commit "663f1805742ff6fb6955719d0ab7846a425debcf" --branc=
h2 "master" --html > test.html
> ```
> Note:
> - Add your local path to the yocto-buildstats repo
> - The above command builds the report in a file called `test.html`. You=
 can access it in the root directory in poky.
> - This exmaple report uses the commit `663f1805742ff6fb6955719d0ab7846a=
425debcf` from `master` branch.

I tried that out:

=E2=9D=AF cd .../distro/yocto/yocto-bs-html

=E2=9D=AF ../poky.git/scripts/oe-build-perf-report -r=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-bs-html/../yocto-=
buildstats.git"=20
--branch "master" --commit "663f1805742ff6fb6955719d0ab7846a425debcf"=20
--branch2 "master" --html > test.html
ERROR: No buildstats found, please try running 'git fetch origin=20
refs/notes/buildstats/perf-alma8/master/qemux86:refs/notes/buildstats/per=
f-alma8/master/qemux86'=20
to fetch them from the remote

so I did that.=C2=A0 It was > 3 GB of data...=C2=A0 !!

Receiving objects:=C2=A0 89% (10568/11747), 2.03 GiB | 3.28 MiB/s6 MiB/s

=E2=9D=AF du -sh .
3.2G=C2=A0=C2=A0=C2=A0 .

Also, one shouldn't have to call bash just to run your script since you=20
shell
does that already if you have the right #!/path/to/foo and you have made=20
the script executable:

=E2=9D=AF file ../poky.git/scripts/oe-build-perf-report
../poky.git/scripts/oe-build-perf-report: Python script, ASCII text=20
executable

=E2=9D=AF head -1 ../poky.git/scripts/oe-build-perf-report
#!/usr/bin/env python3


Anyway, that did generate a test.html file in ~ 10 seconds for me on my=20
Pop!OS (Ubuntu-based) distro
and it rendered nicely in Firefox 124.0.1 (64-bit) so that's nice to see.


Thanks again,

../Randy



>
>
> Ninette Adhikari (3):
>    oe-build-perf-report: Add apache echarts to make report interactive
>    oe-build-perf-report: Display more than 300 commits and date instead
>      of commit number
>    oe-build-perf-report: Improve report styling and add descriptions
>
>   .../build_perf/html/measurement_chart.html    | 116 +++++++++++------=
-
>   scripts/lib/build_perf/html/report.html       |  96 ++++++++++-----
>   scripts/lib/build_perf/report.py              |   4 +-
>   scripts/oe-build-perf-report                  |   6 +-
>   4 files changed, 143 insertions(+), 79 deletions(-)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198239):https://lists.openembedded.org/g/openembedd=
ed-core/message/198239
> Mute This Topic:https://lists.openembedded.org/mt/105537213/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------0ipxGRu4wA3AVKCIZaC6o6bS
Content-Type: multipart/related;
 boundary="------------60r0rzn6Pt0e29kkGxBoEhG6"

--------------60r0rzn6Pt0e29kkGxBoEhG6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43GDVU3p016269

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-04-15 10:41 a.m., Ninette
      Adhikari via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240415144129.92641-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">This work is done according =
to &quot;Milestone 9: Build performance test report view&quot; as stated =
in the Scope of Work with Sovereign Tech Fund (STF) (<a class=3D"moz-txt-=
link-freetext" href=3D"https://www.sovereigntechfund.de/">https://www.sov=
ereigntechfund.de/</a>).
The current report can be accessed here:=20
Performance test report HTML (<a class=3D"moz-txt-link-freetext" href=3D"=
https://autobuilder.yocto.io/pub/non-release/20240117-15/testresults/buil=
dperf-alma8/perf-alma8_master_20240117090048_663f180574.html">https://aut=
obuilder.yocto.io/pub/non-release/20240117-15/testresults/buildperf-alma8=
/perf-alma8_master_20240117090048_663f180574.html</a>)
The report is created using the `oe-build-perf-report` script in the poky=
 repository. This script generates a performance test report in HTML form=
at using the data from the yocto-buildstats (<a class=3D"moz-txt-link-fre=
etext" href=3D"https://git.yoctoproject.org/yocto-buildstats/">https://gi=
t.yoctoproject.org/yocto-buildstats/</a>) repository.
The report displays the performance test results in line chart format. Th=
e chart x-axis represents the commit numbers, and the y-axis represents t=
he test duration in minutes.=20
The report also includes a table that displays the measurement statistics=
 data for each test. The report is interactive and allows users to zoom i=
n on specific sections of the line chart.

The current report format required some updates to make it more interacti=
ve and user-friendly. And this patch addresses such improvements:

- Add Apache echart (<a class=3D"moz-txt-link-freetext" href=3D"https://e=
charts.apache.org/en/index.html">https://echarts.apache.org/en/index.html=
</a>) library to create oe build performance report charts and make them =
interactive.
- Restructure data to time and value array format to be used by echarts. =
It also converts test duration to minutes and adds zoom to the line chart=
s.
- Update measurement statistics data to include `start_time` so that time=
 can be displayed instead of commit numbers on the chart. It also updates=
 default commit history length to 300.
- Add styling updates including page margin, labels for x and y axis, too=
ltip, and section descriptions.

Updated report screenshots:=20
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f13055735e53">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f1=
3055735e53</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/1ed43876-73a9-487e-aed3-ca0edf97514c">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/1ed43876-73a9-487e-aed3-ca=
0edf97514c</a>
</pre>
    </blockquote>
    <p>Thanks for the nice, dynamic UI web graphs!<br>
      Overall, I find them useful and well-designed.</p>
    <p><br>
    </p>
    <p>Would it be possible to present the data in a more discrete
      manner since<br>
      the interpolated view presented now, while nice to look at, does
      not always<br>
      reflect the underlying data trend?</p>
    <p>For example, if I have this data plotted as 1) stair-steps or 2)
      line segments (I didn't take the time to do a spline fit),</p>
    <p>I find that the line style for 1) is usually less misleading
      about what we really know about the data.<br>
    </p>
    <p><br>
    </p>
    <p>1) stair-step</p>
    <p><br>
    </p>
    <p><img src=3D"cid:part1.YXjCH85a.FRR0q97x@windriver.com" alt=3D""></=
p>
    <p><br>
    </p>
    <p>2) straight lines:<br>
    </p>
    <p><img src=3D"cid:part2.IVGJhNtB.pfJQuKbN@windriver.com" alt=3D""></=
p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>and I'd like to see this data:<br>
      <img src=3D"cid:part3.M81qVwrH.r1bBOPQK@windriver.com" alt=3D""></p=
>
    <p><br>
    </p>
    <p>plotted in the stair-step style.</p>
    <p>From: <br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://autobuilder.yocto.io/pu=
b/non-release/20240413-19/testresults/buildperf-debian11/perf-debian11_ma=
ster-next_20240413064005_7116cd908d.html">http://autobuilder.yocto.io/pub=
/non-release/20240413-19/testresults/buildperf-debian11/perf-debian11_mas=
ter-next_20240413064005_7116cd908d.html</a><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240415144129.92641-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
For local setup, you can do the following:

1. Clone the yocto-buildstats (<a class=3D"moz-txt-link-freetext" href=3D=
"https://git.yoctoproject.org/yocto-buildstats/">https://git.yoctoproject=
.org/yocto-buildstats/</a>) and the poky repository (<a class=3D"moz-txt-=
link-freetext" href=3D"https://git.yoctoproject.org/poky/">https://git.yo=
ctoproject.org/poky/</a>)

2. In the poky repository run the following to build the report HTML:
```bash
./scripts/oe-build-perf-report -r &quot;LOCAL_PATH_TO_YOCTO_BUILDSTATS&qu=
ot; --branch &quot;master&quot; --commit &quot;663f1805742ff6fb6955719d0a=
b7846a425debcf&quot; --branch2 &quot;master&quot; --html &gt; test.html
```
Note:
- Add your local path to the yocto-buildstats repo
- The above command builds the report in a file called `test.html`. You c=
an access it in the root directory in poky.
- This exmaple report uses the commit `663f1805742ff6fb6955719d0ab7846a42=
5debcf` from `master` branch.</pre>
    </blockquote>
    <p>I tried that out:<br>
      <br>
      =E2=9D=AF cd .../distro/yocto/yocto-bs-html <br>
      <br>
      =E2=9D=AF ../poky.git/scripts/oe-build-perf-report -r
&quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-bs-html/../y=
octo-buildstats.git&quot;
      --branch &quot;master&quot; --commit
      &quot;663f1805742ff6fb6955719d0ab7846a425debcf&quot; --branch2 &quo=
t;master&quot;
      --html &gt; test.html<br>
      ERROR: No buildstats found, please try running 'git fetch origin
refs/notes/buildstats/perf-alma8/master/qemux86:refs/notes/buildstats/per=
f-alma8/master/qemux86'
      to fetch them from the remote<br>
      <br>
    </p>
    <p>so I did that.&nbsp; It was &gt; 3 GB of data...&nbsp; !!<br>
    </p>
    <p>Receiving objects:&nbsp; 89% (10568/11747), 2.03 GiB | 3.28 MiB/s6
      MiB/s<br>
      <br>
      =E2=9D=AF du -sh .<br>
      3.2G&nbsp;&nbsp;&nbsp; .<br>
      <br>
    </p>
    <p>Also, one shouldn't have to call bash just to run your script
      since you shell<br>
      does that already if you have the right #!/path/to/foo and you
      have made the script executable:<br>
      <br>
      =E2=9D=AF file ../poky.git/scripts/oe-build-perf-report<br>
      ../poky.git/scripts/oe-build-perf-report: Python script, ASCII
      text executable<br>
      <br>
      =E2=9D=AF head -1 ../poky.git/scripts/oe-build-perf-report<br>
      #!/usr/bin/env python3<br>
    </p>
    <p><br>
    </p>
    <p>Anyway, that did generate a test.html file in ~ 10 seconds for me
      on my Pop!OS (Ubuntu-based) distro <br>
      and it rendered nicely in Firefox 124.0.1 (64-bit) so that's nice
      to see.<br>
    </p>
    <p><br>
    </p>
    <p>Thanks again,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240415144129.92641-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">


Ninette Adhikari (3):
  oe-build-perf-report: Add apache echarts to make report interactive
  oe-build-perf-report: Display more than 300 commits and date instead
    of commit number
  oe-build-perf-report: Improve report styling and add descriptions

 .../build_perf/html/measurement_chart.html    | 116 +++++++++++-------
 scripts/lib/build_perf/html/report.html       |  96 ++++++++++-----
 scripts/lib/build_perf/report.py              |   4 +-
 scripts/oe-build-perf-report                  |   6 +-
 4 files changed, 143 insertions(+), 79 deletions(-)

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#198239): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/198239">https:/=
/lists.openembedded.org/g/openembedded-core/message/198239</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/105537213/3616765">https://lists.openembedded.org/mt=
/105537213/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>
--------------60r0rzn6Pt0e29kkGxBoEhG6
Content-Type: image/png; name="C0NlrGL0XCzOLWe5.png"
Content-Disposition: inline; filename="C0NlrGL0XCzOLWe5.png"
Content-Id: <part1.YXjCH85a.FRR0q97x@windriver.com>
Content-Transfer-Encoding: base64

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
jqLPABZ/LAAAAABJRU5ErkJggg==

--------------60r0rzn6Pt0e29kkGxBoEhG6
Content-Type: image/png; name="PK30ZAoDLv3EqTSr.png"
Content-Disposition: inline; filename="PK30ZAoDLv3EqTSr.png"
Content-Id: <part2.IVGJhNtB.pfJQuKbN@windriver.com>
Content-Transfer-Encoding: base64

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
Yv4AAAAASUVORK5CYII=

--------------60r0rzn6Pt0e29kkGxBoEhG6
Content-Type: image/png; name="YdeAn9rTv39nGigR.png"
Content-Disposition: inline; filename="YdeAn9rTv39nGigR.png"
Content-Id: <part3.M81qVwrH.r1bBOPQK@windriver.com>
Content-Transfer-Encoding: base64

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
29G1HeuRRx4JndejR4+wcZcsWdKquiJi1SrDMCPDhte0ae1/zbHuuccwHI7jx5EMIzXVMDZsaPs9
tZeFC816XC7DKCxsnzHff98w4uObvu+YGMN46aXWjdeez/HWW5seRzKMhx46/vyf/MR8b82aE4+5
fHnDGE880bp7AwAAAAAAOE0wQ9oigUAg7NVY4wX+kpOTNWfOnLD3Bw4cqPPPPz+0f/DgQZWWlp7y
tR1dW2PFxcX69a9/LUkaPny4Fi5ceNw5nZrfb85c7ehrjvXaa9L990v1fy6pqdJ550lut7l/+LB0
1VVSScmpfc6p2LNHev55c/v666UePU59zIIC876qqsx9p1M6/3xzVrNkzlBuzUzp9nyOX34pPf64
uX3NNVJhobRvn3TJJeax3/xGaty6Zvdu6W9/k2bPNmdCn8jMmdK555rb990n+XwtuzcAAAAAAIDT
CIF0CyQlJemee+4Je11SHz61UL9+/RQVFRV6rVmzJvTenj17Qtt9+vRp8vru3buH7RcWFp7ytR1d
W2O//OUvVfZNj92//vWvcjqdTY7VaT38sPTFF2Z/5FmzOu6aY/385w3bN98s5edLW7aYrSzGjjWP
FxRIjzzStvHbw8MPN7SYuOGG9hnzwQelykpzu0cP8343bTL7L2dlmcfr6qTf/rZl47Xnc1y3zvxn
TIz097+b9fXrJz35pHnc45GysxvO/9WvzOfz4IPNj13/Q01BgfTqq82fDwAAAAAAcJqJinQBp4Pk
5GT99pjg6+GHH9Z7773XLuMvW7YsNDM5Pj6+yXP2798ftp+enn7K13Z0bfU2bNigZ555RpK0cOFC
TZ48WStXrmxxDRF36JB0773m9n33STt3dsw1x9q3zxxHkqKipD/+0fynZM7wfeghs3exZIah99xj
ziRujmFI//qXec3u3Wb42auXNGCAOcN5wYKGz2lORYX07LPm9uDB0rhxrbrFE3r99YbtRYvM+iSz
N/V990nz55v7b78teb1SdPSJx2rv53ii3vE2W8O232/+c+NGM1heuNDsW92ca681e1P7/eYikddc
0/w1AAAAAAAApxEC6U5g/PjxJ31/1apV+uyzz0L748aNU0JCwilf29G1SVIwGNRPf/pTGYahLl26
6He/+12LP7vDfPmlOTtWMmfHZmae/Py77jJn644caS5IeMstzX9GW6451ldfNWynpkrH/iAwZEjD
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
gTQAAAAAAAAAICwIpAEAAAAAAAAAYUEgDQAAAAAAAAAICwJpAAAAAAAAhFVKSoqMRqMqKytPGaur
q5PZbFZMTEwEKou8F1544Zxz2tradO+99yorK0uJiYmaN2+ejh49et7jPV3vZHv37tXMmTN7fmPA
CQTSAAAAAAAAiIjXXnvtlOfeeOMNBYPBCFQTedu2bdOSJUvOOW/+/PnauHGjnnvuOa1cuVKNjY2a
O3eufD7feY33dL1PeDwefelLX9K6des+/83iimXw+/2hQCAgr9crp9MZ6XouOpfLJUmKi4uLcCUA
AAAAAABXppSUFOXm5spqtWrNmjXdxm6++WY1NjZq165damlpiVCF4bVjxw69/PLLev7559XQ0HDG
4FiSSkpKlJ2drY8++kjjxo2TJFVUVCgzM1ObNm1SWlraWccnTZrUo/VOnv+d73xHr732mmpqatTR
0XGhPw24QrBDGgAAAAAAAGE3f/58rV+/XrW1tV3Ptba2avXq1Zo/f363uQcOHNDs2bOVlJSkhIQE
zZ49WyUlJZI6d1THxsbq2LFjXWv069dPf/zjH8N2L59XWVmZmpqaVFBQcNrxZ599VgaDQfX19Wps
bFRBQYFGjRrVNR4fHy+z2aza2tpzjvd0vU+sWrVKr732mn72s59d6NvHFYZAGgAAAAAAAGGXmZmp
goICLV++vOu5FStWKDc3V4MGDeo2d/bs2TKbzVqxYoVef/11VVdX63vf+54kae7cubrpppv0rW99
S5L02GOPadCgQbr//vvDdzOf0y233KLf//73Xffwj8aPH68nnnhC0dHRGj16tLZu3SqLxdI1/pe/
/EVGo1Hjx48/53hP15Ok+vp6LVmyRH/+858VHx9/MT4FuIKYI10AAAAAAAAArkwLFy7Uq6++qq9+
9auSOntKL1iwoNscn8+npUuX6tZbb1VGRoYk6bbbbtOrr77aNeff//3fNWzYMP34xz/Wc889p8LC
QhkMhvDdyEU2bty4rnYaJwsEAvr1r3+tH/zgB3r66aeVmpp6XuM9Xe++++7T4sWLNW3aNL311lsX
4Q5xJSGQBgAAAAAAQEQsXLhQjzzyiJqamhQdHa0VK1bokUce0ZEjR7rmWCwW3X///Xr99de1e/du
7d+/X++9957y8vK65vTt21e//OUvdc899+gXv/iFBg4cGInbCauDBw/qjjvuUGlpqV588UUtWrSo
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
REREREREROS0R08YE3mNdX1kOu9ou0BK0IfE7mFLSpErOxXOnW61URaOuvQUhcvD9xRGi4iIyOfE
WxjXhqNF5G/vxFOf258lPr4TSQmaSnMEROTiMMZQFhX39uanPp4SzJcdu/tztsblOa1ORERehCqk
5UKJMTFf9nhr6EOk8I4+rAAYN57C60dCREREzt7OyFA4w//8bscf/WW/+fiqA+8MX35LdSQicrFY
a9na3uHTm59y++4BzllCjFhjmC863rg64Z03d857mSIi8hxM3/cphEDbtkwmk/Nezxfu4OAAgJ0d
vXBdRLd2F7Rd5Op2lSudyd2eQ0yYoQ2HiIiIyHkIMVdE/+R24uO7Ee8M7113jCpwVr+kiMjFlGJk
Oj2k7Rbs3tvn/Xeu886bI65ffv3zCxGR15XKQeXCS7AJp0VERETOi7NwdcvQB9g9MhSFZavR7ygi
crEZa5ls7TCbOQwHNM2Ia5cURouIvMp07Z9cKAaIQd2fRUREREREXkV6Nyci8upTIC0XSlN55suO
pN9iREREREREXimJBMad9zJEROQFKZCWC2V7XNBUnjv7S1ZdVDAtIiIiIiLykkspEUOLMQZri/Ne
joiIvCD1kJYL59rlhrv7Sz75bMpkVNB18byXJCIiIrJxMDd0vcVbQ+rCeS9HROTcxdiRYg9YsKqr
ExF51SmQlguncIYbVxuWbUldOo5mHVGl0iIiIvKSaBpDU8O8haTgRUQE6yq2drYJSRGGiMjrQM/m
cuHUVe451tz3t4iIiMjL4t3r570CEZGX0Pt6chQReR2o5EJEREREREREREREzoQCaRERERERERER
ERE5EwqkRURERERERERERORMKJAWERERERERERERkTOhQFpEREREREREREREzoQCaRERERERERER
ERE5EwqkRURERERERERERORM/H/0h8nWuaQ2VgAAAABJRU5ErkJggg==

--------------60r0rzn6Pt0e29kkGxBoEhG6--

--------------0ipxGRu4wA3AVKCIZaC6o6bS--

