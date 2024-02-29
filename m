Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EE4C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:00:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21227.1709200806720684694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=378913ab4c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T7d3CC031219
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:00:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx5bvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:00:05 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41TA05i4004508;
	Thu, 29 Feb 2024 10:00:05 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx5bvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 10:00:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ls32MYCSLcCyOlIrkCmLKFFpg4RNQ16gC25ai2EHBn+ZuwOjsZof+2aseMojyPQuOEO8rcc8xQyTcu2rvtsm88PL7GLh9MooLPi/+HwzNOkdEb6quiBCqa2tnavJUeCesM0hCxmGdirRipkw5KHdvRJUmT6LNRtnHzUHStkgzc5xELo3GDoRwXc4ZRbVB0HVVCA9PVtvJdToTYC9O51fmc6QU11YDYHRRWk01nGZnIrMbQT7HY4LvP9uJ7QmQZtKb8a1REWSHg2Z8AMdoaioHu98WK7EIPdCImwq8HojAkEN0mkXBkoiGkhcWv9wUo7IzbWgw72MeQoAnG4uK4AXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUmU5fqXM/CA/dVVZp3EE50axEt032cMsHFsvzBPV7E=;
 b=FnJ5YZ79BrBvpxCOKvqPPEqwsc8x95StPKHkaIKp1ifs4sTH6mzX0jMDGBU8l2IYmTQyzwbu36K0rg2jgjNQur2pgcGhhn9Wif6r+m3TGV8/RXQPDtHlfgxO8Hum8jaVhKgyGbNtS2oct8rDTPXo6BVKbPCT1UAVOu9VSNHGODyNEJQRxvmNPYMeJ5PeHEVSS6HNkIBvvyZg/wEvTrNsxFnKEbKyTQkkcz4uFr6Pw/72Q2y6ODi/HDuonYYlH2qvdH4PRyoVxrmKnWikJkbgYTDBGvXfrs0ui1mJuPpOl29bOG9McTLzusMC9Ar4jj8UTX5WYKEVMV7G4OPiJe8ndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 10:00:02 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 10:00:02 +0000
Message-ID: <baece317-a250-4e8c-adb3-1e3227d0e9a6@eng.windriver.com>
Date: Thu, 29 Feb 2024 17:59:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in
 run-ptest
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
 <4823ed44-2ba4-4d18-86c2-e6dc426e0a46@eng.windriver.com>
 <CANNYZj-FRp6uO9zVW-82JXBcArSQ6EMB7S444Wff5RNOtv6U1w@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CANNYZj-FRp6uO9zVW-82JXBcArSQ6EMB7S444Wff5RNOtv6U1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: c0909605-1d4f-4908-1e7c-08dc390d3240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UFdJ/FD/fJPtdPebZSg+L2skgsMpu/gxNfI3uSDXV1Td7x58j8Ujvdnvn/eg6msxtY8SYatImYCWoEDGixinpjg4iSKFiY+nwUSDb2gNlDcj4HitJXyznFFqhEsmTQZX8BIejjEyeTqpxgUpaDnceTt/z2AISbTPWYeYjnuYqxF5bBDKjt6ujQSbAzdiwCfV4/w5OxzFi3uRZeoKWCXrT6IM3dli2hQZavDWbrAWlbK7C8BUkRaNTn6vS7qCMQk5DBo480d5I94khi0H/jNsHd/Mvllj40e0fSpFsEG1ZTboadqarUt9wSzOgLuNat1gGCu5bjhKqZsIrjbaacoDItrU5ztMvNZCgRYqRPmIkdl0qa/ipkTZeblnD6lxFj0DRphIbx/aMEmrKvYT9xXTAUvbyRt7esFPHAm7861uDvpkyFQ0Mn+KEoInZG4iYjp6gkKIWOkt846jj99v1Zg3NH1HMV9BmjVfjmhaCBSj36b7q9+b1gjdhHivYTIEvb+rtGh+OnvsyghddKhe8qSqKHaaQrv41Uo15o4RNljwld4tIUA0enZkqJ2bCzdfVcKNtg8lbmov18e7Vgp8YFnXdxaDt4tO+ANYyMA0uywFcCICnInj7ark046Gc9GI2EQB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTB0cmV4eVN1S3JIWnliTGtPVTdWV29zTHRaRXNqOE9vbS9MS2JjSFk1dHFL?=
 =?utf-8?B?WU5wOGJNSkVaRElkYmt1M2tnYkd0cDVyemxFeFNiQVVoZUlrYlN0VlBHYjBV?=
 =?utf-8?B?K2l2VzdUSFB1cTVNMzdDcGYvQVN3SHNYbnUwZ3ExWXVWcHNvaG11OVhEV21v?=
 =?utf-8?B?RXBTM0lnT2VMZXRieTk0ZWQrMW02NFVrV0ZaQ0FCUWQ1a1Frd3d4Vk1sV0NC?=
 =?utf-8?B?bCt3MDg2RDNRTlRQMzZjck9ESUJ4aDl5VG5LK0VFOUI3Vk9xSkFlTGZBaXVJ?=
 =?utf-8?B?cjJFNG1EQ2hLb3dsVHdsVGhJLzRFQWlja2ljaDhFV3U2SnpncUQ3SGhFclRE?=
 =?utf-8?B?SDNLaE5iWWErL0pHUjlna1BZVmlRelhtTUxEVVAvbHQ0L1cxSUNrRVRxQ3o5?=
 =?utf-8?B?M3JqSGFsaDhZRWYvNFV6R1RGQ2N1amxyRElZTGNoeE9JZ1FxZFJSdnAyZEJa?=
 =?utf-8?B?OUFYcmx2Mm82RExCajhLaU5NWkdWYUozUVVIUnFmdFE3S2VPeHZ5dE52cTFF?=
 =?utf-8?B?RlVONjh2Um5kd0NuUTZDMTUzYzBHMDNYQnJIbjdZamxsVTdVUitlcmFFa2Vx?=
 =?utf-8?B?UXY3Q0hWK0YwejNscUtwaVdCYm0rQzhpMUlhaUYwZnE4OTJhVnNSdFF1NUNP?=
 =?utf-8?B?M3ZuMG1IK2NJL0RMbGdPZFZocFM4STh1T1BRc2kvUFVDK2pWblBjbFhhNkwr?=
 =?utf-8?B?bVoyY0d5QUpGVG0rZktQTERrbnV2ZHVneHgrVy9tbTNpVzVKb3FlTzVSMmRa?=
 =?utf-8?B?eEFwN0dYRkdsWTY4ejMvOGp1V1A0Vm52N2cxV1A0cElzSFZmYUpoMzJlQlp3?=
 =?utf-8?B?azVlbUROcEpFQTlyK3ZLQ2h0d2FDUEZGRiszRGNWMEs0SUFwY2JGRTkxT3gx?=
 =?utf-8?B?UjNVTUtNRExBcEE5YU43SEhYMGF0bm9FSGpYNVc1UmxjQzg4S1JMc1ZVOEwv?=
 =?utf-8?B?QmtMWmZ0U05BOXYrZGNESXk2cHEweUFHZ0JMTitwUS93MVM2NUNiU2hTN0VW?=
 =?utf-8?B?bWhPZURyRkxhU1NDKzBmbnMvcXJhRlpJZXIxa1FPYmtxa0pBUW1Ld3kwR1Vn?=
 =?utf-8?B?aTJwVmpSRGtXVjI3Tk9oblE3Q2RlMzBUUGJ4MWdPdXFvdXlEQ283RUZITDkr?=
 =?utf-8?B?UXhhdkVuTFhpb2VKM0pnYitJRjVSVEYwR00vOUE3dHF2d0VnZXFaVWN5V21F?=
 =?utf-8?B?bGdsbnZDRnZNbkJmUDJnbkhhSkczQ2JyOHVDWWZhMks3REorM09OL1ZmcGNy?=
 =?utf-8?B?bjZnOURBTkgxYXRvTE9sUWVadXkzU1RKV055eTN6MGhLbG0xaE43dlVtV1lt?=
 =?utf-8?B?dE11bytWSFRDZ0x4SVZnYWRGTlpGUmVUeFhseWVFMXhvZDZzQTdjRXN0RDhx?=
 =?utf-8?B?eElyOVZTQ3A2TUF4Lzd5Tmk2MDdLWlh5Y1RaVWVFdE1zOXNYYlpIenRHRG5E?=
 =?utf-8?B?SnB6dFJWajlnOVRwUFB0ODZBL255dnNtNUxGejJlWlpTdUQ0TEFMbnNRS2U4?=
 =?utf-8?B?UVVYN1VPYXNqK1BGNnRNSy92WGY1ZDhVQlZLK1RHUDBmeVpranlVUkk2bCto?=
 =?utf-8?B?U3o4Z21kSTBvMXJlNmo0SUVMdUsycW9Ub0lwRGtWcU5JOXFEZjFFZUd1cTBK?=
 =?utf-8?B?NkFNVEp3TVJPc1N5dHNUQVZEaitRdXNVMWhBQXBPOVZSbXFYQ3pjREhhNHFh?=
 =?utf-8?B?SW8ySFlXd2Vuc1BpQ3VnOFRndXhseEd0dTQzM1UramVJYmxjMU1LSUVJTzc2?=
 =?utf-8?B?VmVPMDV4b2s0T3RKaEs0b1lVNFA0bkVZRUlTV1c4VHRjZEZXaEVYaEpVaVh6?=
 =?utf-8?B?VUxUbWxjZUNqM2JHL2tBekJHNlFRdWppU2FMZVFmbHZiOFp6byt5bDJJSlMv?=
 =?utf-8?B?RGxtalhPamlPbEVoSnJGSFlNaGVRL2o5Y2RUSjlLSS9qd0dLLzR4WmRnSllQ?=
 =?utf-8?B?cHVGMEEzSWozb1NQQm5VZVVsN00vRXVPdlF2NVpRQkFTcWNycXJmL25pbWov?=
 =?utf-8?B?am9OZm5WQjcweEdXZk9OaGlTS00wRGdkaXJVd0FQc2ZIMVFvRzFNaHZQZGxt?=
 =?utf-8?B?TGJLdmRKZExMbmFPV28vV1RqK2V3dmE1VDZoY1Q2aUlXZkE2dWZrd0dTVHl4?=
 =?utf-8?B?RzNHOFpwTzAydjMvZklmTU9qUTVBTTNxeEdqL3RTR081d0Q3b1ppbW4xUkMz?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0909605-1d4f-4908-1e7c-08dc390d3240
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:00:02.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRr8Rc5zAC79dgM45WfwQPd7EbXfsgVcBJ1YeQLZY99ujcrjFySPuw30G/uALP+OqXxu8LGZCLEw4P+uaq+KXVGTy3/cX7eQcQrILnae690=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
X-Proofpoint-GUID: rn2zaAw4CHjJfXvoNTUSeQfpx506cpzL
X-Proofpoint-ORIG-GUID: VldO0MNBWrfiGeXgWRMZT9vM4HJmAsTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402290076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41T7d3CC031219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196424


On 2/28/24 17:38, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 28 Feb 2024 at 03:45, Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> Since SHIFTJIS is not a ISO2022/posix compliant and not in the list of
>> glibc locale data support, it was generated by manual with localedef a=
nd
>> don't have a unified name.
>>
>>
>> The following name has been already found on different linux:
>>
>> ja_JP.SJIS ja_JP.SHIFT_JIS ja_JP.shiftjis japanese.sjis
> Hello Chen,
>
> I need to note that we specifically exclude bash from ptests, and this
> is the reason:
> https://git.yoctoproject.org/poky/commit/?id=3D2758f6d0337ec84c9143546b=
c65a80559e8d7808
Hi Alex,
>
> As a result, bash ptest would keep regressing in various ways, simply
> because it's not executed, and I would suggest that you either first
> fix these failures, so we can restore bash in
> meta/conf/distro/include/ptests-packagelists.inc, or drop bash from
> your own testing. Is there a particular reason you need to run those
> tests?

Thanks for your information, recently I am trying to fix the bash ptest=20
failures.

Currently, in my local setup with master oe, the test failure is 5(total=20
83).=C2=A0 The failed cases are run-intl run-type run-array run-execscrip=
t=20
run-read.

After checking the failure log,=C2=A0 the following is a simple of failur=
e=20
cases analysis:

1) run-array: egrep output warning messages cause the final log is=20
different from pre-log. A patch has been sent to bash bug-report list to =
use

grep -v -e instead of egrep[1].

2) run-type: there is a patch need to rebase, fix has been merged to=20
oe-core master[2]

3) run-execscript: it reports the failure but not really failed, it just=20
differing only in line numbers is produced.

4) run-intl: due to no shiftjis locale in system, some of unicode tests=20
were skipped. That cause actually run 1251 cases mismatch with total=20
1378 cases.

5) run-read failure cannot 100% reproduce, when it failed, a character=20
was missing in test log, still in debugging..


And also i met a problem, most of cases are comparing test log with=20
pre-test log from maintainer as the test result that line=20
number/space/path/new line is produced causes diff failed,

but in fact they are not a real test failure, the result still need to=20
verify by manual, seems cannot do the automation test, any suggestion on=20
that?


Thanks,


Ref:

[1] https://lists.gnu.org/archive/html/bug-bash/2024-02/msg00154.html

[2]=20
https://git.openembedded.org/openembedded-core/commit/?id=3Decb698ca5b4f7=
6937dd3bee927465b17866d50be



Br,

Xiangyu


>
> Alex

