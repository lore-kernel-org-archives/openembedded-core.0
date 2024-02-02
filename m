Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE272C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:16:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2569.1706904982868143559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fBldwdMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762c8d993=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412BRK82013871
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 20:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=zDkGWUz6HmaFhqQLnQj
	c8opT1yeW/5oRVG+gzEn9Vgs=; b=fBldwdMXpiG2BOVu4939kuaFnxTc6Cn1s+L
	KQZ6jRUTLvOayNfVWvhrOhgUA90OF3vcfajEX7E+oo9TM1nSd4vdxyAJhlH0+Tdn
	G6O42AYb16/QZYcqBhYHgJaCWAHs0/hFEwamQ8jtzJTt1TJfrqzIHQU8IJkIOjk4
	0DOjGXUsvsT+xzo4nmehO2RedNlW8z8tZ23eOh0kl3c1YArxv7U0qdhQzCj8Ve26
	CwCKfv9R9UWD5LfTwcmAChFmefB0DCR4cjs/ZvOmyJHBZuBzWsQLrDivsb/pfOyp
	zKp7TITCeYpChWOsufMJX+QM+C53fZDrnIBqCANII/G9kPxGOrQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0u93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 20:16:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412KGLrm031235;
	Fri, 2 Feb 2024 20:16:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0u91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 20:16:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMdnRjFVQCNO27fl9pQ/sW4l+aFHXj2KX2348aJVVdl3BbZ6v0f2Wrg7xd4Rk8yDVi+kbzkaTVIdJYovCYTXT7P9DylVt3H6OM8QVUvvxPZb0emrTjlvlYW/wcoj5PNtjhPS29KlL5aVBWjqFoxlQmOaTeg1NmpBtLrB95a3WGiJjKaHl313tte4ag7tsb3XAFzutS755+mvruiBMW/uDOr8nzYKAuB2fFDbbhOgxD48itXxCN9IcEtrpuO8ap61cu5EGkX1qWJobzRXMSncqVUAerswrybicynS7YLDNlym32etu+6hnVZxmvt/eSf8gq5RFv5yO09xQsVx6HGZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDkGWUz6HmaFhqQLnQjc8opT1yeW/5oRVG+gzEn9Vgs=;
 b=Av3aTqFn2LRHB6680lcPBJ7nC4UUpaMqpI3XqnFpkmosh9WbprMkfzESRan/lh8HdmaAvsY9Ipj8oebmB5345xVKiWIGkNS4k8zq+bKlFtbRlrbPgAOevaRl4LblvHPj5Jg8/EYOVlEvS4Z6B+QaSgrvOkHX615qjnrf8ggpBCMcAzUiJQITQxq5PZZmx1Ec7tEMOuidegcw7EeWkfueOC/egxsXxO9ikAIKZ6HXc5Vh3tbwxBWL2Eak26t8YvH+iiCFmrF+U/WtHFn5iJf1eo/l3uSQOZahYftWcXv22JI7/2VIgGyXagNdt/S5sL3cOEhzZ8EDtquFp5hO8xBq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Fri, 2 Feb
 2024 20:16:13 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 20:16:12 +0000
Content-Type: multipart/alternative;
 boundary="------------jn2ExKqXDB7WwuYLRrKUlWF4"
Message-ID: <c2c41b76-555e-403e-9ebe-1dc5d57f5501@windriver.com>
Date: Fri, 2 Feb 2024 15:16:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Content-Language: en-CA
To: Ross Burton <Ross.Burton@arm.com>,
        "Deepthi.Hemraj@windriver.com" <Deepthi.Hemraj@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
        "Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>,
        "Shivaprasad.Moodalappa@windriver.com"
 <Shivaprasad.Moodalappa@windriver.com>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
References: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
 <92C1939A-88C7-4540-A81B-54B2D24EBF70@arm.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <92C1939A-88C7-4540-A81B-54B2D24EBF70@arm.com>
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c400308-6de5-4250-602e-08dc242bcd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dfh1NOphkyue/+j2+CkxV8mifz8RSYYdQGSAR4bZzTzAbl3iafVijjGQQbckSAO4D43glx+4H76x91ZsSQitJtvhQpKw0Zvi/5yoq76mQBN7e1tg7lo7pTAIpmVCSK9uBcsVeQpdiviHsu755FDrzJxOa4bok894zV/KHt1oyRGicNs+kDeiL5mjmIGbvhKOZeBMHRzNNDJgB3sqYZt/Bpjj3pcmrasEVdOf7k5tVo3n7vwi8U4dwsoXp4wNpn5k0nPmI9mEVYQFq3xW+ywmWBqDODvTN35/XX4e6bwa+nV55ms8T6tYktVHXMCFCCy44t0TOmAOJbH0l7G6zmaYfQrGxH1jWjctMfvZWBXu180fQ0vuXBtZQoeIksutNIKGwRs1UIcnWqoerYNvJ+kuoTkdVJwklIBFx7N4YGeerhfdzJ3Bw7byGMSfW3Ho25wkmpx/ExhQ3v0RxNzk3CYtTYaeYGnwDrDk9jMJ85W86MvQV6XZP7tqv0KZ2Fwic/G2Nf2Sjw+B5yHIMFeRQHqXzNSaYMZN26RmJQLzN9oXQ0WHOHLTfCln8RgT6a6WYTi6s/RD/xIfmVOpJReTQLWBWCTnmI8o5rH/NlyeXoO8nyaE5LpGQ8FIMTKb5mf+3Q9KdOsIvXvqCgu1MQVlGoDiAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(41300700001)(83380400001)(86362001)(36756003)(53546011)(31696002)(26005)(166002)(4326008)(5660300002)(2906002)(8936002)(38100700002)(6512007)(2616005)(33964004)(66946007)(6506007)(4001150100001)(66476007)(6666004)(316002)(8676002)(6486002)(6636002)(54906003)(478600001)(966005)(110136005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkNnZW1tWnJwVlhraGQ2MFNoNzUzMGVvZTRTbGxIamNPSld5VDQ4WUhQbmpV?=
 =?utf-8?B?b3J1bUx4SWZVeUIzcDN0SitHMkVqRHdnRjdObHBRUFRjRDh5bUFBcCtKWWww?=
 =?utf-8?B?UVhVeWg5Y1pBV2NlOUJDdjA1OFBTVWFZSjRvRUhlZngwcHNXNWFZZ0pJM1li?=
 =?utf-8?B?T1JRMUFyRVhOOEp6cWN5cXd4MDdlSDd2QTViSDNiQjZ1NzhMazVYZWlMVlg2?=
 =?utf-8?B?RkZERFFlRUgwUllkaHl6N1JQdHhUUEJ3dUpncDEvd3R3TDFGbWZ3OFpjQ2JN?=
 =?utf-8?B?MVRjQkRyb05zcXNJWEVZUEFRTWZSRVZrVjVadm40QXBjT1psenVWNTRqR2dV?=
 =?utf-8?B?R2ZoRk9VbGM5TTNKUmFnQ2pPWlNlMmc4SXRPc3RzRnBnU2VOanc5bFlDUHdY?=
 =?utf-8?B?a0xwYlA5S3VEWFpqUlI1NDFRTWtTM2lCd1NiZUpqbGgvemlDM0xwV1prNmsr?=
 =?utf-8?B?VlJtMXFabEQxQkVXOHdNWDMwcGdwMkJHc1g4Rm13TE5aUE93aEVrZXU1RDFD?=
 =?utf-8?B?dDdBNm9IOTBwMElTd3FETUYyYjVXZGRGVjk0bHpPOWdJQjNwMGFTTCtVdThS?=
 =?utf-8?B?RVlyYnRYSmY5RjI2Rm9xU1dJNnQ3REdxZzVsMC8yZkVzVS8zM2lCU1haV2VV?=
 =?utf-8?B?L0F3RG1xQk9mRld3VHkzVnJhcG5EQlhwRjdVUkZWS0xqc0hQM2tEUXNjYkc5?=
 =?utf-8?B?elh5ZGEzeXQ3aTV0TzFFODRHNU9aZm5WZ0ZtWm9CU0NhMHo5cEt1MytjSWt4?=
 =?utf-8?B?cXJxTTFqeVZuMUNzYVZtcEE3WThmU1NSdm5CNXZLWDBHQksxUjN0bm9PcEM1?=
 =?utf-8?B?WW9STlBMd3BwUEJoaUk4a2V0ZkN6UFJvVEl3eGo5WThVaThDRG9qaXQ1dFBq?=
 =?utf-8?B?ZnovRWNrbVMxcERyZUtlNVpyRU5WWE1VeVRXQUo5MlE2Y2ZBREtjZGxUQ1N6?=
 =?utf-8?B?ckFsbWhtdU9SeDBjNC94UWFSamViTGhHMnl1NHg3NTh3Z1ptekd3bGtwd09B?=
 =?utf-8?B?OVdOTDAvUTlZSW1PMFo2aW9xcmNIZGg3K3BCKzgzaHBMcHpZUFAwWGJzMld4?=
 =?utf-8?B?SkNnY3NNVUJjOTl1c3Jud3hMNjBFRGFrRUNQd2QxcUtHczM4djV1LzFIZnU2?=
 =?utf-8?B?OXEveDhLWjkwRkJMdFBBdjhwNFpPcjBORkpWdjJQWU53QjBaK1RiYnJZOW5r?=
 =?utf-8?B?c3Q3aFlxSWs5aGZCc3RxdnRNZmtaSFRISURwaWZBZjJRVFFTR1JKYkdFTFR6?=
 =?utf-8?B?WGVCbE04d0gxYkNvcFU5Y1N1eUhDUlBsRUV0RXM3RHZxTFBWYk16WjhxbE02?=
 =?utf-8?B?TWZhOXYwNW1Eb3hzUnVPLzRERy8xNzgvS1VOSHVsOTd6Mm5JZ3BrWDhRUHNa?=
 =?utf-8?B?eFF1eW8yNWxzdlZOZ1RkRkJTSERLTk9Zc2EydzlqYWpPKzRIcU5GVlpkNG8w?=
 =?utf-8?B?MWFuQlJRVW9tcjh2RGtMQmp2VUNRQWliS0w0UG9TK0ZMMk4xalNnZHhjRmxo?=
 =?utf-8?B?Z1Q4REppMTZpSnJWay90dy8yOU0rK2Vla0lTZ1dPei9Dd09maVlQeXV3S1N1?=
 =?utf-8?B?bW5kTWNscVFHK25vMVdSenJoemJiSCtHR2RSSmFPY0ZqT2JnTUNjdTZaVzc2?=
 =?utf-8?B?Z0xGWVhWakNOQTBlRkE0V2gzbDZJaXJoS0ZBQWQveXVtOVNZVEYrY0hpUTZt?=
 =?utf-8?B?TEZMbE1VdlhuOVdMT3RrK2tCRUd1REJkUWo2dTZoUm9EQVJHMFBPcTFlaHpF?=
 =?utf-8?B?MUFTQUJhcTduZHhRc2RrRTBENGpDUlVnM0pGeFo3R0hnTjJzT0JYR2VWS2xF?=
 =?utf-8?B?ZFk3SjhnQ0F0SGRsME1PT0dyVTJ2L1Z6ck9DWVB1cTFkMmFabUZPcFpPSXZl?=
 =?utf-8?B?VHJWck95anlNNnYrMWpRYklHeXpwWTFQcHRHUkJFVmVHU2d1SHEzRkNDRW5s?=
 =?utf-8?B?b2tTam56bHFtZzJBUzVxQjJoMlpWblJCbzEwV1dkekRHOHFtTHltQ0FWcTBX?=
 =?utf-8?B?L3pabStGRzhpZUw1R0xxSG11WkM1NXVoMzNsR0FoalpXTHdaczdLMkNtc3Z4?=
 =?utf-8?B?eW5QdlBCdHlGTVpKVURsV3krdHFqR2JycnFwWWdpTUVJMlJWK1FBRDRQS0Na?=
 =?utf-8?B?QXdENlN3dEU2UUVLcEZtdS9kTUEyY0dlbmtYOEZicnBqZG5Eb0EzR2ZscFFH?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c400308-6de5-4250-602e-08dc242bcd41
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 20:16:12.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+x57JKlTrUrkOwIZfEcLMgZYjetrrt2UD1KxUo0xdGrhC/EEiLKxn08lKQW6zY3a6FOVz4AdxxBL5XgYjPfZHKf5SaYFce+ybcdQgqAqTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
X-Proofpoint-GUID: RhRsOVC7iknZtWPH7glSZJgqufMjalZU
X-Proofpoint-ORIG-GUID: hlDY5naw9sc7JzULX4wId3nCi_O1ljU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 20:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194816

--------------jn2ExKqXDB7WwuYLRrKUlWF4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 412BRK82013871

Add Alex, who might actually be using YP Rust with multilib support.

On 2023-12-22 9:40 a.m., Ross Burton wrote:
> On 16 Dec 2023, at 08:56, Hemraj, Deepthi via lists.openembedded.org<De=
epthi.Hemraj=3Dwindriver.com@lists.openembedded.org>  wrote:
>> The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH ma=
cros that uses MLPREFIX based on the multilib architecture.
>> Hence, creates different file names for the environment setup scripts =
and resolves the issue.
> This solves the file conflicts if you put a 32-bit and 64-bit rust cros=
s-compiler into a SDK, but is that actually a usable setup if the environ=
ment scripts are both overwriting the same environment variables?
>
> Ross

I think what Ross is asking is how would we actually use rust in the SDK=20
if we wanted to target different multilibs?

The rust compiler , unlike gcc, can actually target multiple target ABIs=20
(x86-64, arm64, x86, arm) using a single binary:

Try running one of|:
|

|=E2=9D=AF ||rustc --print=3D[target-list, target-cpus, target-features]|

|eg on my laptop:|||

|=E2=9D=AF rustc --version
rustc 1.71.1 (eb26296b5 2023-08-03)|

|=E2=9D=AF rustc --print=3Dtarget-list | rg linux | wc -l
70


=E2=9D=AF rustc --print=3Dtarget-list | rg linux | head
aarch64-linux-android
aarch64-unknown-linux-gnu
aarch64-unknown-linux-gnu_ilp32
aarch64-unknown-linux-musl
aarch64-unknown-linux-ohos
aarch64_be-unknown-linux-gnu
aarch64_be-unknown-linux-gnu_ilp32
arm-linux-androideabi
arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabihf|

|Please reply to this thread if you have a question or
once you have confirmed that theses commands also work in a 32 and 64=20
bit SDKs from a Yocto build.|

|Furthermore, if you have just one version of Rust, can you (easily)=20
compile, link on the dev box and then copy the executable to
a qemu instance and run hello-world for both multilibs. Please show each=20
step to confirm that you are using the SDK
version of Rust and then you aren't getting any help (rust or linker)=20
from the host distro.

The linker is target specific as shown, for Ubuntu, here:
https://medium.com/swlh/compiling-rust-for-raspberry-pi-arm-922b55dbb050
|

|Does it make sense to have two versions of |cargo.sh ? I suspect that=20
it would not but I haven't worked with multlib SDKs very much, at least=20
not recently.

Also, I'm not sure off-hand, exactly how we should fix the original bug=20
but maybe we should be adding code that just checks for multilib=20
configuration and 'magically' decides which recipe will provide the Rust=20
compiler and only installs the version of the linker needed or the=20
non-default tune.

|

|

|
|

--=20
# Randy MacLeod
# Wind River Linux

--------------jn2ExKqXDB7WwuYLRrKUlWF4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 412BRK82013871

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Alex, who might actually be using
      YP Rust with multilib support.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-12-22 9:40 a.m., Ross Burton
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:92C1939A-88C7-4540-A81B-54B2D24=
EBF70@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 16 Dec 2023, at 08:56, He=
mraj, Deepthi via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org">=
&lt;Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">The current patch modifies=
 CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macros that uses MLPREFIX based=
 on the multilib architecture.
Hence, creates different file names for the environment setup scripts and=
 resolves the issue.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">This solves the file conflic=
ts if you put a 32-bit and 64-bit rust cross-compiler into a SDK, but is =
that actually a usable setup if the environment scripts are both overwrit=
ing the same environment variables?

Ross</pre>
    </blockquote>
    <p>I think what Ross is asking is how would we actually use rust in
      the SDK if we wanted to target different multilibs?<br>
      <br>
      The rust compiler , unlike gcc, can actually target multiple
      target ABIs (x86-64, arm64, x86, arm) using a single binary:</p>
    <p>Try running one of<code>:<br>
      </code></p>
    <p><font size=3D"4"><code>=E2=9D=AF </code></font><font size=3D"4"><c=
ode>rustc
          --print=3D[target-list, target-cpus, target-features]</code></f=
ont></p>
    <div class=3D"md text-14 rounded-[8px] pb-2xs" id=3D"t1_gghu5a0-comme=
nt-rtjson-content">
      <div id=3D"-post-rtjson-content" class=3D"py-0 xs:mx-xs mx-2xs inli=
ne-block max-w-full" style=3D"--emote-size: 20px">
        <p><font size=3D"4"><code>eg on my laptop:</code></font><font siz=
e=3D"4"><code></code></font></p>
        <p><font size=3D"4"><code>
              =E2=9D=AF rustc --version<br>
              rustc 1.71.1 (eb26296b5 2023-08-03)</code></font></p>
        <p><font size=3D"4"><code>=E2=9D=AF rustc --print=3Dtarget-list |=
 rg linux |
              wc -l<br>
              70<br>
              <br>
              <br>
              =E2=9D=AF rustc --print=3Dtarget-list | rg linux | head<br>
              aarch64-linux-android<br>
              aarch64-unknown-linux-gnu<br>
              aarch64-unknown-linux-gnu_ilp32<br>
              aarch64-unknown-linux-musl<br>
              aarch64-unknown-linux-ohos<br>
              aarch64_be-unknown-linux-gnu<br>
              aarch64_be-unknown-linux-gnu_ilp32<br>
              arm-linux-androideabi<br>
              arm-unknown-linux-gnueabi<br>
              arm-unknown-linux-gnueabihf</code></font></p>
        <p><font size=3D"4"><code>Please reply to this thread if you have
              a question or <br>
              once you have confirmed that theses commands also work in
              a 32 and 64 bit SDKs from a Yocto build.</code></font></p>
        <p><font size=3D"4"><code>Furthermore, if you have just one
              version of Rust, can you (easily) compile, link on the dev
              box and then copy the executable to <br>
              a qemu instance and run hello-world for both multilibs.
              Please show each step to confirm that you are using the
              SDK<br>
              version of Rust and then you aren't getting any help (rust
              or linker) from the host distro.<br>
              <br>
              The linker is target specific as shown, for Ubuntu, here:<b=
r>
              &nbsp;&nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"https://medium.c=
om/swlh/compiling-rust-for-raspberry-pi-arm-922b55dbb050">https://medium.=
com/swlh/compiling-rust-for-raspberry-pi-arm-922b55dbb050</a><br>
            </code></font></p>
        <p><font size=3D"4"><code>Does it make sense to have two versions
              of </code></font><span style=3D"white-space: pre-wrap">carg=
o.sh ? I suspect that it would not
but I haven't worked with multlib SDKs very much, at least not recently.
</span></p>
        <p><span style=3D"white-space: pre-wrap">Also, I'm not sure off-h=
and, exactly how we should fix the original bug but=20
maybe we should be adding code that just checks for multilib configuratio=
n
and 'magically' decides which recipe will provide the Rust compiler and=20
only installs the version of the linker needed or the non-default tune.
</span></p>
        <p><font size=3D"4"><code><br>
              <br>
            </code></font></p>
        <p><code><br>
          </code> </p>
      </div>
    </div>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jn2ExKqXDB7WwuYLRrKUlWF4--

