Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D0AC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 23:06:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7351.1703199973981968870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 15:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rPHOK7bf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0719615cdd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BLLGrgF018078
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 15:06:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=kQrKkWkRn+aICp+F9P7
	CaijvLfPHs81Nva96gbptPRQ=; b=rPHOK7bfvhlLRX6DW1KePeGOJ84vkJkAKqi
	+3FtnxA48/9KMaZRrW/Y5MIYmLHoyFlrOqV4K0M5IpcnwKIi18YL5ayAfzBPUyE7
	ewCWaKWrLa3rxzJrHY3E8nn4f135ofeEYvahOHp1uMxxkvaEsu8AfRGR0Yw0p2Ne
	CoYpy7uabj6ajoiMXfOZ7229QRlFrAPsFtU88Taefuho1OC6beiheQdAN4g6cb7X
	9fbDuLsfmLOc0aR+SweXniUAcw2CsUyo7dqTpZaSJPTMDf39/NH/fAYS+/DfwuUA
	U4TnrB9/vpAS4H4Dd7yA7cC2Eti0M6SHkTZ2MpS3crflOpSbv9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kpw36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 15:06:13 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BLN6DBf010757;
	Thu, 21 Dec 2023 15:06:13 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kpw35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 15:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiytvnRXpfNnP9lt0EpvpPLK2GV9cC6oICclFtqD6bD7/nqaNxEjckE7QDa0mXxkLyEJWNy2n8EPXWlrLiQaTy+JKlJ6U7jahKOfcVqGZmajW7Cf63fTVnDS54tNe1zoN6tlZUJJPYiazXZVStVz3QWNXdIapwvSmEnfpbNLcpIlUsTC4qAHwcdH86kkHY2xkQD3ytUWAU4iv5D5Ssag6iQ2EC4xVzU9F71S/HY+T/esdGUd50sgkoDSxR4GYOthLB3W9tSphc2/mkSxBO63sUcMsX+Dw6BeXQm4F9n0/f6yAIg9NKvzJrWQ/0ySclKc4lAUGH71BTbZ+ZZRKikq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQrKkWkRn+aICp+F9P7CaijvLfPHs81Nva96gbptPRQ=;
 b=YvQ+9KhZGEz1OD3QG3NNbgYZgNSsrRGsmsOx9NJMP6iLvILfX5qQ1wmSb0DO3Ma/J293okyDyj5J6yAFxubSXlFjFCnZ4KRjedAyn3i7/La/qsofBQLik0BKYPzNFYXtl0e4Ml1llibmxC73MKPZNYvTcT+6Mf9RZ/zpFqLRmzO8jfKEk4sb+cUPGJhmYeYTB0tATalE09RdrATBPmzx8Z8PNACyEC0vDjc/ShbQwYhsK98pH19J4NbafDmlSTrFik24HJMZpREvxREUyCml0Dab5ZsfhvkvN+ycsMrYICTuO9K1/3wayP2USSUGyBGqI0WFN/zCYtB37lm50tEaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 23:06:08 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::78ff:37e7:880d:8c8e]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::78ff:37e7:880d:8c8e%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 23:06:08 +0000
Content-Type: multipart/alternative;
 boundary="------------GKFkphqxaBZHmsULdgIgcIju"
Message-ID: <d11ce5f1-161b-4bd2-9bc5-2bd12d7659a9@windriver.com>
Date: Thu, 21 Dec 2023 18:06:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-CA
To: Martin Jansa <martin.jansa@gmail.com>,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: zboszor@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
 <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
 <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com>
X-ClientProxiedBy: SA0PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:806:d0::21) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3998:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: 8969024d-d997-47c7-c97e-08dc02796a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jS22JJreRHFD56aENko3/ek0hbADrfG7kZ6u7EAiG7jZKlRAQeUkgL/sr9Hzo5Tz/Tc0kbqOVqIlKsAnbcyliKKLMfSawIRAkA/NjKoE/zHfdAvX2C53eihEPXWvz2ov5I+o3XHtCArPYdXux0Jc5RunNXXPtxaQJKwkLdvvOC4gka7/Gu5XE1udnSgWqOtG6CeFPglUvY1A8Ha8mhZqsHuwS/nWoxLkg188Qv9jTAfHGh17iC8vXo/vrFEvHZJmuNAguQH85beU1x4sveZB5UWcorH5azTKyDJUCviH4DXJ26GFXvLlHZqAqolSKuO1Awk0GP5zJFaLDJ92Cp/iVHet3+sDbThTAI3AfPOSo4s3mEtMs4CGRqOUjo/pvbsv1QHcdtVo/SIJUHlecfBK5B51WMELI93DzRczV0ckWfkiBzhzkzysBWw77CSED/ypyDHqi2Dq5fsuoYIAwoMGyQQBxPTqj1b/P/PalUc/qvuOg96++SvpE5PtE6Wo7P7OZPaYy43t6XryJx5eQj9OnFWDcSCYjs1FiWRR+A8I/NlSwQ6dKIT7Rvi2uYS9omfmCVZssYzUxqS9Q6IQCXaNy+RVTpRkpgV8NQvoUkmn5PoFiBCOArN/jyr/GNCgJYNknp08756z1dn8dJwLQiGCPVGajwPPmVHaFWRC2Lf3KQQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(136003)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8676002)(8936002)(4326008)(6666004)(66556008)(66476007)(110136005)(66946007)(6512007)(316002)(5660300002)(2906002)(2616005)(6486002)(478600001)(31686004)(83380400001)(26005)(86362001)(31696002)(41300700001)(6506007)(36756003)(53546011)(33964004)(38100700002)(166002)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2lNVXhKbjZhZGhPb1ZxTW92UFBJblIzR3N0Y2N5U0ZaMFdGMkczMW44MzhG?=
 =?utf-8?B?OEpHNWZtaTg5bUZMVEpSSmExcjRQa1NYYTJKUHFFRW5WbnNSajVIQUdHc3M1?=
 =?utf-8?B?cTd4c2U4U1RwMzZiVUJOS3ZleGJrTVRVZGlXeXNJNkxudHdYOWRiM0VDZGJh?=
 =?utf-8?B?N0ZGMG1ENDdQZW9TQmNMdjdGTmNpZ3RsdWhRNzF1bTN5V242OUkyOTNxSGNH?=
 =?utf-8?B?UzhCMTFaQmRhTDJ4RUxsTXBUcjVzQzBVRms3TVNld0ZDQWcySzBOb3JwTExr?=
 =?utf-8?B?RVl5a0haT2hFZlBMenh5am4rMkxLYnM0bGg5YzIwV2hXb3lMcjNOOFB1clM0?=
 =?utf-8?B?by9wU1RWL0FrMURKcDVvbldKNjRjL3J2RTkvMkJ5N2VlVEM5cUx0ZHFNKysy?=
 =?utf-8?B?Tzl1NjV5aTlRZ0s2K203REc4RWdpVmlNTXJRaFoxbTdoSXVPMVA5NWZGWU9V?=
 =?utf-8?B?OEhtNVdPNzVTZVlydmVMc3NCbDdzSzNxaFVqZVljZU9RdFRBVERqSnNJclBK?=
 =?utf-8?B?VHZacmw2U0UwSzF3QU1aTDdoZTU4TGdIcG9qa2hPcndXV2FraGo2OWg5eXVw?=
 =?utf-8?B?cGcxTFRmdDRONENTc0tXUmNabUxSNXZ1VS81VmNuU0t2b2ZCZFZXQnYrOG55?=
 =?utf-8?B?N0ViUzdrcFZaMll2MlpLMDMySHJMaG9hbTFwdEpDM2hXRS9POXVWZm9DNUFK?=
 =?utf-8?B?bG5GaEQvSDY3SzlUS2k5ajhFQWpHUy9XTEwyQVAvQkZheFZaYTRsNlkrNFE4?=
 =?utf-8?B?R1cwNFdWQzZQbVdaem9tN1NjUDMvMHFvWHN2R3dJRXg5ZHNrUExaS2FqVVRK?=
 =?utf-8?B?Mk8zQmZHTklNdkUvUUNNTmhLTVBkNVN3U0xJNjcvWWNMSENwZXIxNXpUMjMy?=
 =?utf-8?B?RGkrNkxYeDh1c0EwZDJTSW5YTllnemFqMTlzSGJUdklXQVlwOXI5amdNOVVS?=
 =?utf-8?B?d0tHcmNjKzN1dFozczYxYmVwL0xEWGU1MG8rYTBSeVRNWktueW9YZUY2WE1M?=
 =?utf-8?B?RmUzWTBkVlE1SGRXV2lyMmR2bk9JN2tGeGxtejFBNlVCYUJaWVRWMHFZdkhW?=
 =?utf-8?B?NVgyTy9tdkh1OHREOGYyZGdUMFI0UXhGMXRWRmdDalBwQW9PN2l6MFVwYkdL?=
 =?utf-8?B?OFRPQ25PbVhuTWFSWGxZcnZUM3czT0JxTHZYOW9rUG82K2JGSkZ2T2M1YnFG?=
 =?utf-8?B?Ymg0eHZQOUt3ZERjazJtOXduNUdPdkxJVTZ0bVFaTThNZWlzZW81TC9qU084?=
 =?utf-8?B?amZiNk5nMEkzZmprZ0VLdFF2VnBwZWUxWCs2U29GNTBTMHZEdldKcGVRUHpo?=
 =?utf-8?B?UXF4YkUwZmlja011b204WlY0bCtScWx1MENUTVVSa2JEdk5rcjUrQXJkcENP?=
 =?utf-8?B?QlpHMTA0VVVENitkaEtSK2V0KzI5ZFBVWDgzcjRxaDdRTVI5em4xU05USHJq?=
 =?utf-8?B?ZEF6Y2hKSlR4M0Z2Z21UN0xOUVIxQ2pzY0NMRlV6c25teUJIbVBJbFB2bC9i?=
 =?utf-8?B?TnhmTUlGYUgzOGtIMnoxWTNGL0FZNWxOZTRoNndYNWxnMW1BbFdkUVR4NDJ4?=
 =?utf-8?B?eFB3ZXQwWUVHZjJ4OUNmRU8yT1l6bksxR0liYzQxT3JFYXJJL0NSK3puOWxN?=
 =?utf-8?B?dlZac0cyKzFlVlJqS0pqa05IOE1GeHl2RUl6aVZrMlNZWThCdHJCTU5xbEJN?=
 =?utf-8?B?Y25xRVRySFkyN3B5aG5tcjVzMlM2VytlK3RWZ2pUWFpZM1lESWxJUFNrN1VY?=
 =?utf-8?B?Ylp1bzV1QjdmS1FMSVdTaytBcEdPRHR2NWFNajVKays2YWJueG5jTmhaVEFa?=
 =?utf-8?B?ZEVhYUJHZEpmVDRvWG0xejRUSDZqTWc2Ykc5eHc5enNNOUl5KzluMERsMHBJ?=
 =?utf-8?B?cnpBRjRMTy9NdXdlUGFQUmFoYVd4T2cya2NVSjNqV1FEMDJmc2tLaGgvMmxz?=
 =?utf-8?B?c1NCYnZEejY0L1RUdnpCaVZVYStncGpxU2l3QW96QlhGK0xZaWlvelp1STNJ?=
 =?utf-8?B?NXg1andtblZIWVFpVW9UeEtEUEVlanlEbEliT1pGM2lJdlhmT1J5RXYrSkZx?=
 =?utf-8?B?K2E5ZXRGaUFmb2JMTEpnSUQ4OE93cFRrYXRDRkMrWGJ5aUJMNEdQZUpGQ1Vv?=
 =?utf-8?B?b2oyV1B3Y1dITm9hNkJYekhOTklaMGtOQ1R3SnZBVnA5dFdGWFJQZHBvN2hS?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8969024d-d997-47c7-c97e-08dc02796a63
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 23:06:08.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQlwXVQf1vsNNTc3YmtGc++f4t5OfIkNm1XnYj6jmGPt5jWbu4fHFtLuMcr6GQ3+hzW7oETXKliVTgkaBCvigAVK/xv3PoWxfcDgpm6Cybk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
X-Proofpoint-GUID: yzb-S6Be5Lpw4Zk4ZN5nMuZHl813wu4o
X-Proofpoint-ORIG-GUID: oIeSjs-TLX-h7hbbqhm9FHB0ZBGbh784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312210176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192854

--------------GKFkphqxaBZHmsULdgIgcIju
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BLLGrgF018078

On 2023-12-21 1:56 p.m., Martin Jansa wrote:
> On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy MacLeod=20
> <randy.macleod@windriver.com> wrote:
>
>     On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!dmJtTKioa9DzcUCj9Bnd0SAhV_iwzhIPFdUGgYGvfCcHJTBSqwE1j07pX4x-RmoIf=
ylxSh1gB9shlAshIeRlbYI0P5Q$>
>     wrote:
>>     So it's not just Fedora, but Python 3.12 in general.
>>
>>     Googling for problem with threads + fork reveals that
>>     it is indeed an issue even in C / POSIX: only the thread
>>     executing fork() will become part of the new process,
>>     but not the main process starting the thread or any
>>     other threads from the original process.
>>
>>     The warning is justified, and apparently the issue
>>     not occurring in bitbake with previous Python versions
>>     is pure luck.
>
>     FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or lat=
er.
>
>
> But this fixes it only for bitbake master, right?
Even master might still have some problems.
I can do a simple build of a package but in doing:

$ bitbake -k world

I see:
NOTE: No reply from server in 30s (for command ping at 17:50:35.510798)

After some time.

I'm not going to try to debug it at this point in the day/year!

>
> With bitbake 2.0 used in kirkstone I still see bitbake processes still=20
> running after the build is finished.

I didn't try kirkstone. Maybe Steve has that on his list of things to do=20
in his spare time! ;-)

../Randy


--=20
# Randy MacLeod
# Wind River Linux

--------------GKFkphqxaBZHmsULdgIgcIju
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BLLGrgF018078

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-12-21 1:56 p.m., Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp=
5NAPL56yow7bPAjSBngw@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy Ma=
cLeod
          &lt;<a href=3D"mailto:randy.macleod@windriver.com" moz-do-not-s=
end=3D"true" class=3D"moz-txt-link-freetext">randy.macleod@windriver.com<=
/a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via <a hre=
f=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!dmJtTKioa9DzcUCj9Bnd0SAhV_iwzhIPFdUGgYGvfCcHJTBSqwE1j07pX4x-RmoIfyl=
xSh1gB9shlAshIeRlbYI0P5Q$" target=3D"_blank" moz-do-not-send=3D"true">lis=
ts.openembedded.org</a>
                wrote:<br>
              </div>
              <blockquote type=3D"cite">So it's not just Fedora, but
                Python 3.12 in general. <br>
                <br>
                Googling for problem with threads + fork reveals that <br=
>
                it is indeed an issue even in C / POSIX: only the thread
                <br>
                executing fork() will become part of the new process, <br=
>
                but not the main process starting the thread or any <br>
                other threads from the original process. <br>
                <br>
                The warning is justified, and apparently the issue <br>
                not occurring in bitbake with previous Python versions <b=
r>
                is pure luck. <br>
              </blockquote>
              <p>FYI: Fixed in Fedora 39 if you update to get
                python-3.12.1-1 or later.</p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>But this fixes it only for bitbake master, right?</div>
        </div>
      </div>
    </blockquote>
    Even master might still have some problems. <br>
    I can do a simple build of a package but in doing:<br>
    <p>$ bitbake -k world</p>
    <p>I see:<br>
      NOTE: No reply from server in 30s (for command ping at
      17:50:35.510798)<br>
    </p>
    <p>After some time.</p>
    <p>I'm not going to try to debug it at this point in the day/year! <b=
r>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp=
5NAPL56yow7bPAjSBngw@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>With bitbake 2.0 used in kirkstone I still see bitbake
            processes still running after the build is finished.</div>
        </div>
      </div>
    </blockquote>
    <p>I didn't try kirkstone. Maybe Steve has that on his list of
      things to do in his spare time! ;-)</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------GKFkphqxaBZHmsULdgIgcIju--

