Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C30ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:17:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3794.1663143468077715482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=emRtrSew;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6256f4cbec=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E7qqOK013259
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:17:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NliaW0gi+yGuz96ve+7VB3rjdA1ly82OjVwYD+hZnfw=;
 b=emRtrSewG2kbOaRBMYH/57ybWTgLt/c5c1opXUn0oHCj8XEpJUVs1VskOsSdsLdGMXUn
 WYyzcuSft1c9WEEKac9hKNmORQGrBOqcObII5R7bC0672vr28Q1iqvtKOHclTc6xvPi+
 R43hQ5Lia84E0SYqNST+4z461KhfN6DSLacYzGrEX9WUU4AkSoAiF3PfpaLdJO4eaKNa
 3JP39ZnKUplcUhhiVzcdG4lNpfQPt71ALqgoG9C+sseINNWwd3jqZw0aFM9RMTb87kI8
 fLyoYdi01YJr4FSBpO9ippPacFMjX9apxGMDSE6rsNq4i0gVDtrW8z1DgI10bsOyaTG+ Fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdrahk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:17:47 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E8Hlwm008019
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:17:47 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdrahj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 01:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5EpDuaTZELKvtOxIUVGi0WxN0gGhrgr3iMLioRhQwmnxXVi+icjdP1iB/UfdzLWqLax6M6glUmZMjsyXXCmJMmPrQGHk9/x+lOluzgDiZgazrMEqyyqSUEilTOb/k7F/cUHdAnx99pUmgLKzGiGDEI5sEfevHjffEWayj25+GpW8w2fwOe7Cap5HVHozljFLJx7SJzAVYYH7yTwB+fJBlYlx4BuCPjfrXknilskUYEskQzdPW+J3nwlqWhlg7sastzvWRkj5+M2YMode1MxEHC/CE2lMltiBUCImdS/ognlRM7jUTpivxUIjbmKLqR8mwVO+MF3XtOdQAbLKUGNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NliaW0gi+yGuz96ve+7VB3rjdA1ly82OjVwYD+hZnfw=;
 b=fG6J2xJ0L/q+FahkTMpMMt2KE45doPqvty7SHZprNmz1tKllcjtCRyA78NWbuuW/VSGkQyaJPtBDc7tIOcn5se0KevEk3UYQp4AzGQ+hrOHhzXAq2YT192gEQDE7sm7hO7QcaFTN/heBkQ70VhF4yzUjpEU0TxX0QXBPhfp8OBrBOw7PegjfdBYz+/TpEEgneBMrex2YN6LAXuE2mYVtLXfVk2aTQJ1gUa492xSdOeOApsHwogXj+K6ZjxvSR2EAqmiPHTbTQzla5/WiQ6PGC0GkMU2xFm787mfuMnom/ynPsVc0dqfE4VnaeiU1Wy44lA9DKnQmshLSuhSwnjTIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 08:17:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 08:17:44 +0000
Message-ID: <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
Date: Wed, 14 Sep 2022 16:17:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Alexander Kanavin <alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: 
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0225.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fefc6f1-e4cb-4577-cf59-08da962999e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g0j0Iu1Uk2ahU4T6+xR3OnnRaU2GC/5IFW3zKbTBiXzWGbPRiPgGFEbCnVfzZpxoxDjFGEcHN4wE450cjBdfJ/OYP861fwJe4qziGHt9J4UquPv1hQ2DmwMxb/s51SRxBg96CSvgR3uhlJ0ycXPHpLCCFsLM+1gyl3SjZQYCa/QbEnNQqb30PsAo0+JTHRpaY/WEGmYyHNqHtH5iwdZN3aVTSAKml/U5wZpEX5bxbvdfmO8L81FNfxAbWRgcjQJzsgJf9bnUMKi1UxTY+Xi8fF4gcnokgdru5YO4/9ms/X4Tmnyn1YGIC2FlbNgwlANtFYM47F8jz6iR9tXUVG0AT79bPaPXPfSbudZSVlI1PcsIzjWOioey40rs3efXV3Y0RJ8mKTKmXruYLK8+pk5GxTa4R+w7GaoEOOKDZ364nKCrFMwKiua6YjFFM1r/7+NmSHSjt/H72GZ7BOraZEz6UAzVKndPknM+HQYXErmbdAbr13XwG+1c99VkhH3UWtu8YxrY582D8owG9C8EBP8ejA37rQV1HxJzWf9370DRw1WsrHp6IpcZZDwT87V9V+JL8s30rouf9/X74OXXXGbOKbUruNrTYxVzH7ng4d+exb+JldYxf7kAwgrLR6B7fB3W7fbi6FN6MQ4I+Oh4v9nFwTAzziZ15AFkjZNgvIQxb3DCZPuX8t2tDZugYtiSp8PbyPrisC5qJtPIEU4mY36jJFnpJMYe/APwnYC1vPI74CaDaWj4O2QtcR4To7mkIgHPhNDbphXJOJJqWm9zRFc8t7RW74NZ0IKxrZBr++1CS4a+1H7+CSfc95C76ud6dmxPg9mDLKP9IQGhqIwkiQA5Tm9eUAiWQo4bRdnw/230eN4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(366004)(346002)(396003)(136003)(451199015)(26005)(38100700002)(86362001)(66556008)(54906003)(316002)(6666004)(8676002)(4326008)(36756003)(53546011)(6916009)(5660300002)(186003)(41300700001)(31696002)(2616005)(8936002)(6506007)(83380400001)(478600001)(6486002)(6512007)(66946007)(31686004)(66476007)(966005)(2906002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDZtUDNNYSt4cURzQUlib09TNThSZFhyK1RJY1F3eFRXcDdTYlgvSFJPRldu?=
 =?utf-8?B?Q0lFYk1MZHQ0L2EvVmlRNEJINFVGTWNGbG9qZGw0L0lFWm5SMFRvdWZ2NTRk?=
 =?utf-8?B?c2JtU2g0bXJwc1NYd1NWd0lQTFdiRVM0UnhyOEpwVjVDbGVXdkwxWVVpd01G?=
 =?utf-8?B?NWhKTkhuOWpuNXBOMDhDeUxidFNZNUNpYmJFOWVFWHdvaFdsSUUvbEhHZlBo?=
 =?utf-8?B?OEtwc1JVY0xDR2dSTytNQkRjaE1UY2UrTkR0VS9kQXQ5ZkFXTlZaeTBxVmdR?=
 =?utf-8?B?dVBVTExUSmZvSW9rSDFhaHJlaStVODFGV3Uwamh6TWpaRDJ2ajl3UWVveUE5?=
 =?utf-8?B?c2ZycG1NYUd2WDVIWVpwYk5KdUZhVG9sWTBjNjZyMmtJUnNDY1QzRks4cFVP?=
 =?utf-8?B?SjlPdVFMcFNla3R4STFxcTgwMWxKbC9SWElJVmFISkpLUFNmTzBoUHVMakFm?=
 =?utf-8?B?Z3prWnNheHVpWVR5a1JNTDlSNk1KQUNkOUQ0WlFBT3FYYWxHVEVrWVV0akZU?=
 =?utf-8?B?MUFub0ZqZ0psWEorbXhrTGp2SC9mam94cmI2ajY2VjU3aGY3R1BOOS8xU0NB?=
 =?utf-8?B?REZaSndocEdsdGszTEpEVmpDZGgxcDBOLzlvT3RIazN4WEMvQ3pGMVcrVzRW?=
 =?utf-8?B?T290V3YyM1FwOTd2Q0hScFNrNlFRZ0w0ak9weEpYbXRmL1JzVHFsOTZxWUZn?=
 =?utf-8?B?NmdHeXpKcTV2WmhzQ0NpeVk0ZXZwRnB4S09tc2ZFYWltcHJsOGJDdDVXaVRI?=
 =?utf-8?B?dWZhUmg2azZSK215T3FXbTRTQU1USWFXdnpYeG92QXpWb0JVUEJWblYrK1dl?=
 =?utf-8?B?YzVSanBNYW9rMWtjeVgwWC80SllhcGlPZXgwTEhJNWFnekVNdkQxNXJNeHZw?=
 =?utf-8?B?UVo2MC84SDNxWGFqVzVscDBHTFhnc3VPemhzYW9IbVpaaW5MUmtXQTRwNUpK?=
 =?utf-8?B?WjNCYk9oZVdoUUlFaHRaWCtwcTZpMWIwUnFZU1FJSVlUdW5BOURMMVNtWUdX?=
 =?utf-8?B?MW1vK0FlSWsxaGo3ZytMd3QvbGVQcUdhWWtJcjB3RFo1YmswdjdleFl1a2Vl?=
 =?utf-8?B?VnYxRTB4ZUpIaHBGUGJ1ak9ybHR3dUtuYU5pdU9vczVYMzhEWGFHcDlGR212?=
 =?utf-8?B?d09FVWpDdTZJaDRvcEJuc0Myb2FQLzc0ZXI0aDRXWElJOE0vc00yS2ZVM3Fa?=
 =?utf-8?B?SE5scnQrWTJCcFE5UzFONTQrTVJkbmJqSDRTWldrNE9RQXdUa1g3VTQyWTFx?=
 =?utf-8?B?d0pYTVNjU095V2QyL2g4R2hWN21tclNaaFhURCtBMTRITHcyTGVEMEs5b1FN?=
 =?utf-8?B?bDVORnEzS3Q2bVlOQTZQTU44U0poMVJ4K3M4SDlZYm9sMWVhVFJoYU5aNGxa?=
 =?utf-8?B?NjV0Z2lLOGh1WUNxUDFISHZEQi93SUR6dHVBUGdxQS9ZUGUxQVdMMjRueHps?=
 =?utf-8?B?SGRXSUVVRURXT0NPVjgrSGhtSHBpNXR2bzNpQXVYRHlLckI5ekV1VUM3MWYr?=
 =?utf-8?B?Q2tUQXNtU2ljZU56UTBYTzJqdkV1aTVRVWJpQmg3VWJYbXg2WDQ2Q3Q1Nm9R?=
 =?utf-8?B?SUhkWjhJMTZmM000Vk8vZTRLT3dzVEdhTlo1WE5vT3ByVmNMclZuQ3VlT2Q3?=
 =?utf-8?B?bVpHRXhRcFVZSmcrTkxGeXRxak1za0lOOUVJemJtL01Db0VKUXMxY0w1UnRr?=
 =?utf-8?B?VnZzSjZ2aGtJa3h5Y0dzRXVTbjJuNlAzV2xkRjBGbmxUK1M4WDJ4WTY0QWF6?=
 =?utf-8?B?NXFuMzBQRThEa2VrRWhzZ0JzeEFiUEdyL0x6a3RPWmZHaVRxSjA3VVN0dFhV?=
 =?utf-8?B?d0htMjAwUFo0U3VOanhFTWZ0R2ZSUGpuMkRXL0k5Y2w1bmhaK1cwcUJCc1Bi?=
 =?utf-8?B?RktPeGdZVzNEcFN2eEx4cU5vNnNxcVVod3htcnIyQWFhWGFWUTRqaXhPd3lr?=
 =?utf-8?B?ZHBKVFl5cFVtVFBnYTRVdE0vOXNaNlBGQ1NhV0xxcXF5RTlLT1hUYmJsS3J2?=
 =?utf-8?B?YXo0dmFOenVYMWJxYlJTcWZ1a0QzdStBNHh5eU9yQ1V4bVlPK2p2MWU2NmZW?=
 =?utf-8?B?ZmVReXNHc2lZZXZ0QmRQRTBVb1FUVGpoTHViY2NDVUZLNVMyNzBzTzVtNjdU?=
 =?utf-8?Q?qKhlptUd4fg/KlqHttIVdMRJD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fefc6f1-e4cb-4577-cf59-08da962999e4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:17:44.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S8iTHBtCTtCsWFSXd3ZIzNSZfnjoKCGhQSXxCb0cu5gHHh1pcL6DB9wdsPxhropfODOU0rSxbO/49qlSFKwVtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Proofpoint-ORIG-GUID: w0A8sCjEjZwHehWvqSqx8JDWgU_-Z36J
X-Proofpoint-GUID: O0dgz8KDmX3aBP1MDnhi7gs-cr0O2wwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_03,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170641

On 9/14/22 16:03, Alexander Kanavin wrote:
> On Wed, 14 Sept 2022 at 09:42, ChenQi <Qi.Chen@windriver.com> wrote:
>
>> Yes. The bblayers.conf.sample is generated dynamically according to
>> project setup.
> Can we step back for a moment, I'd like to know more about how you do
> this. Is the code that does dynamic generation of the list in bblayers
> published somewhere? How a decision to include (or not) a layer is
> made?
>
> Alex

The codes are in: https://github.com/WindRiver-Labs/wrlinux-x

e.g.

./wrlinux-x/setup.sh --all-layers (this pulls down all supported layers)

./wrlinux-x/setup.sh --all-layers --dl-layers (this pulls down all 
supported layers, together with their needed tarballs/git repos)

./wrlinux-x/setup.sh (this pulls down the default list of layers)

./wrlinux-x/setup.sh --layers meta-xxx (this pulls down the default list 
of layers + meta-xxx and its dependencies)

And the final list of layers are in 
<project_dir>/config/bblayers.conf.sample, which will be updated if 
needed when re-running the setup.sh script.

Regards,

Qi



