Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B769C48BF6
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 01:52:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13018.1709257924118270246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 17:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=itzy4HQz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790d8eb03=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5fSS9004499
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 17:52:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=6CHBQjcFHRYPjW95aj8
	sMBst2f7VTFC1lAQRcnLum1I=; b=itzy4HQz/W36UORrOyyyCp3IOE18FZ51fHl
	lFuwD1f4zvmO9sRE/osIoViX0b/dTXtcXacKb8FqXjC+FcgfG1nbvN6XtJIuujaP
	CnXW0COqGzLIoeN5ECX9BreUG3WOttMYU4gU07CgYMGv59aFYqHBjreb0ky7hw+3
	7aLUDJFSdWWIQ/PELxv2vtabyfOB2/QPYp8oWjJgN0nd6P+HS4GsYgf3TXvloXBN
	+vFc+ZlfQ4Ci/WftSpoHzkWkNnWuRM6NzxIJ/CQQK14gN5AhmeyjQFKx/gSHmYK4
	hi/R+8HqxBQUMwes0V0gl3uCv3ujJzWHxiRelSg65G/mZRAV3DA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumnte7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 17:52:03 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4211q3Gf014396;
	Thu, 29 Feb 2024 17:52:03 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumnte6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 17:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDQiMI6mFS68INIIUpE1upALpH1OUfd6r9XmKgSsadvebx06sEux6y4/Dhfk8ipX3YN2MfJwEAaRFYi6K/CFaukqiaq26m4eDpNnGhE0n9X9yBg6YQ28u7rdRDMcm/r7qfvg+mMYIOqeONoVrrf3Xdi5RGB9EA/Lg4AuFFqISeLwPu0I+UWF0W6Rl4KcPQGS4krVc67PxW9x8zRAMz51c6QlLheUtZQgV1HjjiMejhHcdp2ePPrnYhP7sawh8be/bvzoHcuMinld1miRv73Pij+UPUEpZoRNXulauB7hLY2Xko7fL5caND6fBEqrpZmEllRrIOhmXqNvxTX9E6VaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CHBQjcFHRYPjW95aj8sMBst2f7VTFC1lAQRcnLum1I=;
 b=ieWqzpo6Vb199/9CEmCHYJ+T8W4s72JrOxvfQugI/Q1mnD+jYEcHViH2xHCTTyPMJPcG++mmHuXKom0LMaJsoYl7wIE8/qIPadv6QRMVLp6yawFx5RRimQ/ehAsJdjUw3+ubusOqqLGQ1or0G2AWfCcMbtM2LAyXN08YC0k7JVk6n22trWgf3MOsIdmvsBNpmMM7ZPJPL0AQieKCWsFEpVmUj4Y6SaX/jQbIeBjP1Mzx5ZfUswphtSQiRhXkod/6OoWnqf8OOIpdYmx6hweQo93FG0EQ5KIqDks1wC6EFZWAiokuVNeiiWg1dL+RP/wRd4drdnqoxmwGmVVn9fnKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 01:51:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 01:51:59 +0000
Content-Type: multipart/alternative;
 boundary="------------AQrGakYXxNcijkvmEpKVWTvX"
Message-ID: <74ac54db-a309-45d5-8af2-a2f451cdff58@windriver.com>
Date: Fri, 1 Mar 2024 09:51:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
 <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
 <CANNYZj91UZ944b4a7vEC0bUyEPoYdvD5fE4w=-xUHd-wVdXaoQ@mail.gmail.com>
 <DB5PR02MB1021305D36FC512A6EE3AC1CAEF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB1021305D36FC512A6EE3AC1CAEF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f497019-1167-4ea1-9ba6-08dc39922e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Agcs8cn9O6AypsDC03D5Hk64mO8b/d/RTVINtSuuaMKQbTiSJ8FlUI3HDMKIV5A5AOiO6XPzOEYH5UviR8OdsauRnic8WO4JlRN/9zf4ufTbxH3CbGOJ7tBoJA/MHvueITU0WZ4ERXO5pgXgcWYkFur/AGElPoeMMqT+lE3kQ5E2SSCjIoKSlDu0hQCUHr2v8vP2gwUeQnnC6Z+1UaCUpLUIFyKHgirjt78H85VWH071vJMY3CRtxg+7jO1SqPkBg9V/WpzxnPksPVnIEJ+nHRtSB33np7VzwcOFWagdimKXcYikZV3LMexHtyVlUDlu4Dxg2K9GvlIwSVu8XAJoo/5Ky/0GdX5ZHXm4FdKptztjQIAWQHkq6m/W14Bmc7nH7FUdwm63HFDnt6BdHbaH940HFkhQnJZhCReZs9OGHJup1VDLerB1FhOJEJMJTM3I3lb00l/0aVckE/j6x2I4MF+AWIlKrcxOSPHnlHlyDTqhJunqJrI6aPx3SbZbqjhCwpvvpleMd8rdX9fLwlj0y9jdqf1FRAQ9o6Jxl7KOpaTWzbrQ2vkXgjhHWew2iK7x4TJGfrGT561Y3zW1GxtRgNCb7uY/69ph8JBGOd1oqqwNhujN2jTbN1gY/fq57CS+hRsjByGBoX94ht2D2KtUPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Um40V2p6cnBhNnkyZHplQzVzWVdWTjlxYytFb3NER245VW9peWN1eWhOMDMz?=
 =?utf-8?B?LzJld2h4N3Bra1djcjBTaTVZMlNtdXI0czljdFpneURiY2g5blBTcGpLOGky?=
 =?utf-8?B?K21qNWRaek9HdzhvSFY5azFnQW9kY0swSlNtQTFBVWtTTkNiVEd6VE8vWHk2?=
 =?utf-8?B?T2htNHpmYUZDMStLYVpOUUJMN1BISUpPamNBZFExY1U4MXp5K2xoaFU0K280?=
 =?utf-8?B?a25FT3dtcmhpVXBwQTYxdllyK3VUR1B3b2ZzL2R5QzFrL0NaTFFGQmYzUkVY?=
 =?utf-8?B?cVZURWd0Rk1zekprWkVHWEUwR0J1WlJRV09uZ0lTMm1sa1Y1REJheWxTdUJH?=
 =?utf-8?B?V3A3U0pidUVpZDNxcE9hdzNLVGxQaE9JUzhFOUNvM3hPYm5sSTVzMDNoZVNr?=
 =?utf-8?B?YnEzMlJ4UUxodllNSUZWWGlheEcyelR3a3pDY25CVkdkejlFTFZTVmE4c0RL?=
 =?utf-8?B?Qi9SNHZQY09LeWJTcnJQVDE1Si90NTVORmh5ZWluUmNwc09melBxdXpPTVdM?=
 =?utf-8?B?NEt3VUZVN09wNXRkd3Rld25vL25WdFFqdXVCQytxS3lJV2ttN0QycVhzYWxm?=
 =?utf-8?B?OHM4cW1NL2dMQlZ6bXlablY0Q250ODIyVkhnYmY0Q2tJK2p5ZTdQMC91Q3VB?=
 =?utf-8?B?cVhLeHRDUllXdE9nd1pOU0oxblVnK2JQQ2o2ZVpRTW80WFpBUlRoZnlaZldL?=
 =?utf-8?B?Wk9lVy9Nb1dOYlJpUVdFOW5BTmp1V1AxVElxdk1vT3ZoSkdUYTZia2FnSHlK?=
 =?utf-8?B?WlNPamNPUVhpNWRVM3UybHk0K1E0eUJEWGRjZDdjMFZlME5PcXlFZDkveGor?=
 =?utf-8?B?NTdmbUZIR2hNdDlUQmU5b3pBMnZaOE1Eb2pRSy9pTUF4WlJUSDJWMDRZaE4x?=
 =?utf-8?B?KzB2RTJlSUNtL0liQjVybk8xRE8xdjdOQ3gwaTE2MlV6N2hDZEFTZDhONUdv?=
 =?utf-8?B?SDkvSm93OVhidUJDVCtmK0EyNzFYamUvV2pDMFhrT20wRGEvc1o3dS83dkFJ?=
 =?utf-8?B?Z2h0ajBHWkhIVHFzTnU4Q0lIcVJTYXNiUm1PQmZhbURGdnFPMWpKbUdPbTlK?=
 =?utf-8?B?L3BFZTFwUUtuS1FaVDdIVHZ1WUlaZHViU2NQbDVTZzBBS3Nubm5Zc1F1SG1H?=
 =?utf-8?B?Vm5VenNuYUpVVGRHcVRwTTl1TWN1dUhWeE5hRDNTQ1kwUlk3ZndTQ0hJaUJC?=
 =?utf-8?B?WnJHMFBJQ2xCNUtQb3JjNGd1a1JObkUvRkNscERQcExXazE2Zk0yY0F0NGlj?=
 =?utf-8?B?Z2dlYTJTL3ZhTkFqN0swdUlwYjZBbzUxZEl2YUtidmlvMEZBeThvUHBSKzRQ?=
 =?utf-8?B?ZkRVTFhEM0RQL3o5MTJlNHpxNFBlUEVPS3hxSTFQRXJLS0dpTnRBaHNNOWlD?=
 =?utf-8?B?SHFxTTJnYnZiMnZrcEd4aGo2SElIc2RBVGpCYTJNSnVuQk1FaTNSWFNCejNE?=
 =?utf-8?B?d29IZVVJcndUemxEdG5VZm1pL0RBWmdrUUpzMVM0dVZNUGxvVEgvV3FKcUFV?=
 =?utf-8?B?RVdpVEUwLzlzVlNQTWZlNTYvYVl0VHRPaEFHUXBwTU5PNkdsbEVhNllDMTFH?=
 =?utf-8?B?QklSanhuNGp2bWRqZUh0ZXUzNXRQVjFiT1hISUlhY2dnd3k2SUVaRGZiV0lI?=
 =?utf-8?B?OXJnRzMrRXNYbmZrRXZKWmxjdDVBQTlnN3RhTWg3U2tuaENUSEczck9QWUhM?=
 =?utf-8?B?YnIzT1BQTlBTeEYzMjc0NzV2aTFWMnRqOGFaVmgxbGc3OENNMVBzTE45bTZy?=
 =?utf-8?B?ZGppVlgycEM3WW10TjBWUzhLY2N2NGduMWt6Mzc2dzZTZ0M1TTI0RlUxUEMv?=
 =?utf-8?B?cDlraDFmNG8zcWZucXN0YXc1QUI3a1BaSzI1bG1FbmU0TFNFVG9GRmFMaDhT?=
 =?utf-8?B?WFgrV0ovZFJKYlRqQlE3dngzR2dUMXVnOHdya2FveGx1cDFYWGpTQzl2U2Mv?=
 =?utf-8?B?dGRIQlkyTmpGenByT2xZQlhIYWJIL25pL09HcnRySURVZytyNUcvZXZyc2E5?=
 =?utf-8?B?WE9RNjVadG5nM2Nsa2RMRFJvcWx6S2NpZjZ0bCtxaUdYaEw5dXoyb2d2QWxI?=
 =?utf-8?B?dnlDQ09IaXhjUXVFQjM1ZGQybzNUK3lUamk1N3RTOXRIVkJyOCtSQzlsb3dp?=
 =?utf-8?B?T09DcEdneWhXakVnSndVam5lWTNrY1crRkRGR25Xb3RrM2M3YmRnalNOUWQ1?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f497019-1167-4ea1-9ba6-08dc39922e74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 01:51:58.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJoPz5jrqz7iRS0G2SUoEq7SGQdVScyL3AtkkjUfofD1+8lzLt8jhm3P+rIqSeBsWWrMnE3VDGL31mCxanrk9a3tFnq4bnPO/zmZl2YFaXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-Proofpoint-ORIG-GUID: LXQfMfpHhn27Jqy9qvsCkn8W0HyDNsb6
X-Proofpoint-GUID: VTvbqqS6-47vmPf_KXo_snAL3oqz60Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_08,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 01:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196453

--------------AQrGakYXxNcijkvmEpKVWTvX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41T5fSS9004499


On 2/29/24 19:56, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From:openembedded-core@lists.openembedded.org  <openembedded-core@list=
s.openembedded.org>  On Behalf Of Alexander Kanavin
>> Sent: den 29 februari 2024 10:01
>> To: Changqing Li<changqing.li@windriver.com>
>> Cc: Changqing Li<changqing.li@eng.windriver.com>;openembedded-core@lis=
ts.openembedded.org
>> Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/=
log
>>
>> On Thu, 29 Feb 2024 at 06:56, Changqing Li<changqing.li@windriver.com>=
  wrote:
>>> The solution is also good. But package "${docdir}/systemd/README.logs=
"
>>> in package systemd may make things more complicated.
>>>
>>> since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and
>>> FILES:${PN}-doc =3D "${docdir}  ...". we need to adjust the sequence,
>>>
>>> and may have influences to current list of files and directories that
>>> are placed in a package.
>>>
>>> So maybe this patch is more simple and reasonable, and will not have
>>> other impact.
>> That's right. It's possible but not obvious how to override that (I
>> don't remember that from memory).
>>
>>> That's ok, but can you make fixing the path to an absolute one a
>>> separate, second commit then?
>>>
>>> if  use solution in this patch,  it is better they are in one commit.=
  I
>>> can update description more detail.
>> Please no. These are two separate issues, let's deal with them as
>> separate changes.
>>
>> Alex
> Given how much churn this patch has generated for a file that probably
> no one will read, how about just not creating it in the first place?
> That is what we do with the following patch:
>
>  From 49483effbcb920d097487c58214518f2f3a9d479 Mon Sep 17 00:00:00 2001
> From: Yang Lyu<yangl@axis.com>
> Date: Mon, 20 Jun 2022 09:07:19 +0200
> Subject: [PATCH] Do not create README in log directory
>
> ---
>   tmpfiles.d/legacy.conf.in | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
> index 4f2c0d7c43..62e2ae0986 100644
> --- a/tmpfiles.d/legacy.conf.in
> +++ b/tmpfiles.d/legacy.conf.in
> @@ -12,9 +12,6 @@
>
>   d /run/lock 0755 root root -
>   L /var/lock - - - - ../run/lock
> -{% if CREATE_LOG_DIRS %}
> -L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
> -{% endif %}
>
>   # /run/lock/subsys is used for serializing SysV service execution, an=
d
>   # hence without use on SysV-less systems.
>
> //Peter

Hi,

This is also my V1 patch solution.=C2=A0 Please see Richard's comments fo=
r V1,

he also recommeded turn off CREATE_LOG_DIRS, but this CREATE_LOG_DIRS is=20
not only

used here, it will changed log save location default behavior when=20
volatile is disabled.

Thanks

Changqing

--------------AQrGakYXxNcijkvmEpKVWTvX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/29/24 19:56, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB1021305D36FC512A6EE3AC1CAEF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> On Behalf Of Alexander Kanavin
Sent: den 29 februari 2024 10:01
To: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
Cc: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@eng.windriver.com">&lt;changqing.li@eng.windriver.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log

On Thu, 29 Feb 2024 at 06:56, Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The solution is also good. But package &quot;${docdir}/systemd/README.logs&quot;
in package systemd may make things more complicated.

since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and
FILES:${PN}-doc = &quot;${docdir}  ...&quot;. we need to adjust the sequence,

and may have influences to current list of files and directories that
are placed in a package.

So maybe this patch is more simple and reasonable, and will not have
other impact.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That's right. It's possible but not obvious how to override that (I
don't remember that from memory).

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">That's ok, but can you make fixing the path to an absolute one a
separate, second commit then?

if  use solution in this patch,  it is better they are in one commit.  I
can update description more detail.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Please no. These are two separate issues, let's deal with them as
separate changes.

Alex
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Given how much churn this patch has generated for a file that probably
no one will read, how about just not creating it in the first place?
That is what we do with the following patch:

From 49483effbcb920d097487c58214518f2f3a9d479 Mon Sep 17 00:00:00 2001
From: Yang Lyu <a class="moz-txt-link-rfc2396E" href="mailto:yangl@axis.com">&lt;yangl@axis.com&gt;</a>
Date: Mon, 20 Jun 2022 09:07:19 +0200
Subject: [PATCH] Do not create README in log directory

---
 tmpfiles.d/legacy.conf.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
index 4f2c0d7c43..62e2ae0986 100644
--- a/tmpfiles.d/legacy.conf.in
+++ b/tmpfiles.d/legacy.conf.in
@@ -12,9 +12,6 @@

 d /run/lock 0755 root root -
 L /var/lock - - - - ../run/lock
-{% if CREATE_LOG_DIRS %}
-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
-{% endif %}

 # /run/lock/subsys is used for serializing SysV service execution, and
 # hence without use on SysV-less systems.

//Peter
</pre>
    </blockquote>
    <p>Hi,&nbsp;</p>
    <p>This is also my V1 patch solution.&nbsp; Please see Richard's comments
      for V1,</p>
    <p>he also recommeded turn off <span style="white-space: pre-wrap">CREATE_LOG_DIRS,  but this </span><span style="white-space: pre-wrap">CREATE_LOG_DIRS is not only</span></p>
    <p><span style="white-space: pre-wrap">used here,  it will changed log save location default behavior when volatile is disabled.</span></p>
    <p>Thanks<br>
    </p>
    <p>Changqing&nbsp; <br>
    </p>
    <blockquote type="cite" cite="mid:DB5PR02MB1021305D36FC512A6EE3AC1CAEF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AQrGakYXxNcijkvmEpKVWTvX--

