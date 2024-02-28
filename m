Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843F1C54798
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 03:19:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5259.1709090387847743898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 19:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kcBzyq4q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=278829b580=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S1NwVO003560
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 03:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=PGvG47x0y75AVqUO1xS
	eA/1aFJfqlYAHG/R7Qvs3Whs=; b=kcBzyq4qXbP1kRlxeU0h2IN8h31PzrbmOR2
	9Nri3Oi6XeiaWMxrkEOTFxdIZqbYEDZey0EZScVd82udY5Ax0n7TPDu53SkgP/Te
	tc6miuOrmfw+Dh0joEJO4NWC70dBcMPo8vD1pHXZfF7QTrV2lUqNNiK/fbduXakW
	NtsP8WRdkmJGJRRs5A+pwoZSb51J7B8ahbphl4tjs/VEdfv4i37sGgDbWu0mOCvd
	D8CZgQyAo/LqJ67lFtsSoRUHRoAWM5iFCFYffV0KtkoSThl24S3nekMfSZ+pqbej
	NgrgpxAfP4dWDQKhbJT1yI0HrKhYiKpZjzfEYd3+3KuhCRb5sLA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6buqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 03:19:46 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41S3JkKK004913
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 03:19:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6buqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 03:19:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvZwnyEZiuT2mdAGcxl8ioAB2BzeDUdLVTFsVCkC+JkGYv+dOJ3ESNy0Zu0UWmGZ0tsykYlUkDXVE3+uJz8FhFC11FG1UXXdwOxjRwwJoOysIDB2Pxv73uHGnW5Vu9Xt+e+y51X2D9y3NXI8OhTuV1wCNgC6Md2gtZcumQw3TBI1UkDHqAZHzOJGL0H9DbdBOBT1h18HH0ej+8fUTT7ow3My07UjHvY5pp63t6XO5dpBXUGixjKm1bBWv+cO2B8TsDsvJ+5m1+/no3zEP9C6vT+cDm3B0UpK1W7jj3eZvjFQMEIWZnOY7PgQ3QNI0ii5rUz/JOxhlsa7NtiZG78Fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGvG47x0y75AVqUO1xSeA/1aFJfqlYAHG/R7Qvs3Whs=;
 b=GquCtyZQk/19XiRxDYjU+owwjiguYj05TGu2UnbTWkNMiDFO45RKB2exzNovMoCoBS1qriC6fQxVplKNn2AcOcfo1NrRHAN99/UhI0mOpWsEM57LysttbsavW41q1wCl1X5/GVk5shy9bU5CZDCAKHaieOa6/7vTG/FN7/6pFLv9ErAYI5pro8Zsl7ntrygqHeZRI5J+OcjbFHsv2zr/15WrgjzDfOlMDi4OOOFUs+K8vbh+W0JP9fMIQxL9J8TKpp0LwldddxQy1TmZLKyPBtT4bUuElBhP96ak7XUWCahw07xhCbzi9R/IKeJlcRpDtwp+4jXfUzhJl/KVgKcpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Wed, 28 Feb
 2024 03:19:31 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 03:19:31 +0000
Content-Type: multipart/alternative;
 boundary="------------GqIF3Rn5zwCJk74YybS0bjb4"
Message-ID: <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
Date: Wed, 28 Feb 2024 11:19:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 05752eba-4516-4f25-55d9-08dc380c1452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y9RGL4Y3AnAH7cUxIdiyeJ1CJeCR1q1tKDoGsvkd1aNUSERh/l04bmItZlSYNKHPWJWrIP5mXLj5dut2ofpJCsFHFCiO1rvij3Sq2yC7yNpKLx7HJm2m/XrNeiP1hynqCh/o2zOKuQKUSA2ZDGevIkDnCp1mC4odPQR3nls9b4YVyuZ4nC57hzH11+je3OAr5UkmkyXngFaMjGy5nVlAEt9NjzQytyZlV7dNUS7vOG3T8CnZxG5f8w+KYyJumeo9uGyJIn8uDBCgPv5ba5dkLn1wS59kH/neB7TiXAVEM/0haTQF7pHkEt1S7wDkZbgOpCimfbAI3gk7Acshr3USkqP2mujpEqGnWxcYNUzDNH9R4b9bhqqcw9RIUeJw3mbAxEXum4wyloBmny8Fio80E5VcATw06ZKGTqD5QwULNkHZ+z5QedZpHm5+fBvN4OmSv6EhiNeWYa2h18ldNEmCzoUVGcPAuaDMe5KKOn/d5YscEysKaA6FmVUAzvYjVIlA8fMVXOWRAEgf4C0xvbKO1z7fmhPpIGWxjMF8Phyu+aC8cUZC8yUVNakdSsSExWxAfBZH2S+GSRyh37RNJCAka5C5Q6qvkwcezEabSffuRB9/fkUfaNzH/CXQ1kPXP25jvHW3MFYgLxjMKgbd1OeQvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTdhVHQxanVlUXZDQnpLMHFqRy8wb3VkZzlSV0hlRDFIOVdtS3J5UGVWY3ZO?=
 =?utf-8?B?enk4dWdhL2gyWUxhMmEwSyszVkxQV1BpQzYwQkV4TlhlVzNoWUhZTW5nUVcv?=
 =?utf-8?B?YXZWd0pLSkpXT3ZpZlRqSk5HcC9OZFNTS3RLbHBYWUFRcnFkNHpSdjZxMVJp?=
 =?utf-8?B?dncvelNsVCtFL3REWSt0NDloc0w4NFlyYUxUVjNVemtRdDQyRXYrQ29jSkVy?=
 =?utf-8?B?cTlGTjhtdkNKbmNacm5rMlpNNmJOMkJWei85NlNwbE1iT3YvSFlEb3NxeUZ0?=
 =?utf-8?B?dmdyY0d5UWlwSUE4V24zd3BlOEJBN1V2YkFDUkNHeU4rRU9hbW9RKytiVWFY?=
 =?utf-8?B?cWtHTlpPdmVBM0JVa0p3b1cybDcwYklNN3VpQXR1SlVTNklYZWtzT2hzZFRI?=
 =?utf-8?B?VDZ2ZFFqamJLeWN5c3BCMUNUYU5CS1RyZEQwQWkxaTZuck9yZU9KSUdUbUhy?=
 =?utf-8?B?ZkZPeDZoYjdpZmdBUWhwaE4vUDlySTBWaTM5NWhGb1E5WU9NNGN0MEdDdUlr?=
 =?utf-8?B?Si9iRmFwaDdGVUptN3ZmOVRUdmtXdFNENW55OTVNVnovSWVKblVoOWRXZGdQ?=
 =?utf-8?B?MmVzMk5WenRPaHhha2wybEVLWElKV2xHMisyd1NTbWZoY3BvUmpYdzV2L2Z6?=
 =?utf-8?B?aFBNdVNOSDBQTks4bTNDQmZhakxpU1JHZDBzR3RjK2h1YU04Zk0vTWRLRlZB?=
 =?utf-8?B?TXBIQmRLOTZQU1F5bnFxeERJa0lFU2VGcU1IMzdRU2pqVTRFdFlBZmEwR21h?=
 =?utf-8?B?enZDMGNsMk1XRTJSSEQzTWR4NTcrL1RLNDl5OVBNZVhzMTEraTNQc0tHZld2?=
 =?utf-8?B?aDRVb3V6S1RCbGppazhueW96a0tVbkxUSnYxY0xHUjV5RU5DemV6OE9SRWdS?=
 =?utf-8?B?MVA1aHQ2MzAvYjd1SXB4VEdaS3pGbkRzWW56L3E2QUxxaU1KS2REbllSR0Mz?=
 =?utf-8?B?UjA4cy8zNWhoY1l0em0wSzZCcW8zd1JubUZORXBhUTVJMVFRa1ZpOUF0OGEv?=
 =?utf-8?B?U24zYWhkdmJrQXREblNuY2d3bEtkaFgwNzRmQTFhdS9rbXZRbXFYSnV2MzJF?=
 =?utf-8?B?MmJzQlpXRnd6ZXBOUTlidmpuSndkeEcvV05Gd3htNUVnUFU1QitSTkpES3Ni?=
 =?utf-8?B?VVRDQVhWbHJiaC9YemRGTDNHS2R6aXRjZjRQbmpRbHUzellzZW1uUUx2dloz?=
 =?utf-8?B?b2dRSHcyY0JIZlFBYzlyTVZNdWtRV2lKcUVhbFVLa1N3VUpYdFlyeFJ4ajVh?=
 =?utf-8?B?ekdkTjg2MHo2OW9BVGZlSEg3K0pieWZ4VzBsbFNiVUJZR2JnODdaQ3JWV1lm?=
 =?utf-8?B?c2hmRXhvVjFCRWpCbHJaWFJEN0ZScGU1VjBNQXpBV1h3Z0Z4MnBnY0lIbzRh?=
 =?utf-8?B?VTh4cS8zdHdNRkFBL1dNOWJFeFBlN05HL1FOR1ROeUdPbk1GSmdTQUJXeGE4?=
 =?utf-8?B?cndlN05MTVFucnM2SmRmOW1YS1JEblp5UzQ4ckN3QVlvaWZSRDQxTVg2T3Qx?=
 =?utf-8?B?RTFSWmNwQjB4QnhmeUlHSUpSVnZZQVUvL3VTN2tFWmtoempCVFB5bk9LU3hT?=
 =?utf-8?B?bk5MTkVCQW1kNUtFdmVuSm5zQmV3ak1KTFUwZk1DZDVTaXVpMFk1dmN0dTEv?=
 =?utf-8?B?U0ZOc3gyUlBhZ1lnRERnalNhSDRKQ2pZcVFhY3NSSWFlZHp3aTc0MXhha2J6?=
 =?utf-8?B?VGg2Q2hEaUtFR001cXZoZEE4Vks0ZURjbllURXRoVmpUaGtFY3pjSG1BV3Zp?=
 =?utf-8?B?NW1RejBpQWRibU9LSnpKMUZnRFNOaG1tMUlyOWhEU0RhTHl4VHZWbk13Risv?=
 =?utf-8?B?MWxkZTJOMG5uZUFVS3JIVTVDSUt5djdlcWhJY1M0Y3VQTzlwbzVDOTcrTGFR?=
 =?utf-8?B?Umc1Y2JGVUkyZzRWYnd4VGd4eU9SSWhhaXkxYWZHcFpGTkdYYW9Daml6VWZx?=
 =?utf-8?B?Nmg3aWFDY0MvLytVamJzYWZDNUJHSWdxdDYrcUgwRGFFM3JRNnRuUndXNFl2?=
 =?utf-8?B?Q0RQZ09ycUMvbk5FdWhjM3ZNOCttU1NDY3VqMjdSbEY0aU1FYmk5aVcyUWtz?=
 =?utf-8?B?K1VxQnZQWnpQUDVFMGIzVlVsTWgvUE94M3Vld21vWGpRc0poZ214aFBZRUx2?=
 =?utf-8?B?clAxM1g5QlZQZE9kNUVML2swRndQbWdwdnErajcwaWkzZ2doUWRobVpmb3hS?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05752eba-4516-4f25-55d9-08dc380c1452
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 03:19:31.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTmrQbJTcfGUv07QslYlcMJbiRcAEbOoQMf4mTac9jOknSTIUrnqLiRqvhcVcK3KQ62CxgR3NxnPKe6kAALipYAUv8yI1Dcne7ZI2DVrstQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
X-Proofpoint-GUID: XAAkgO1U4rrVMROVuW_ed3OvxXjyg_Jp
X-Proofpoint-ORIG-GUID: IXqM6-xnE8FxIY6zerYxX6jgEmNfrF_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402280024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 03:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196321

--------------GqIF3Rn5zwCJk74YybS0bjb4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41S1NwVO003560


On 2/27/24 17:28, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> The patch description doesn't match the patch content. The packaging
> doesn't change for README items, and VOLATILE_LOG_DIR isn't checked
> anywhere.

This patch is for fixing two problems:

1.

Currently,=C2=A0 There is one line in /usr/lib/tmpfile.d/legacy.conf(this=
 is=20
in package systemd),

"L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"

This line will create an link to "${datadir}/doc/systemd/README.logs"=20
during boot,

and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So=20
there will be dead link when systemd-doc is not installed.

So that's why I create another legacy-doc.conf packaged into systemd-doc

2.

The symlink in legacy.conf use relative path.=C2=A0 but for oe,=20
whenVOLATILE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so

/var/log/README need link to ../../../usr/share/doc/systemd/README.logs,

while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README

need link to ../../usr/share/doc/systemd/README.logs.

After change it to absolute path, checking of VOLATILE_LOG_DIR is not=20
needed.

>
> Also, don't tweak WATCHDOR_TIMEOUT block, it's not relevant, and hard
> to tell if something changed there.
ok
>
> I would rather suggest packaging the needed README item into the same
> package that references it from other files. What is beoding done with
> sed and grep is *really* hard to understand.

I think these is what I am doing.

Any more comments? if not, I can update the description of this patch

to make things more clear.

Thanks

//Changqing

>
>
> Alex
>
> On Tue, 27 Feb 2024 at 06:11, Changqing Li
> <changqing.li@eng.windriver.com>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
>> install README.logs under systemd doc dir.
>>
>> But for OE, systemd doc dir is splited into package systemd-doc, when =
it
>> is not installed on the target, there will be an dead link:
>> Eg:
>> root@intel-x86-64:/var/log# ls -l README
>> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/s=
ystemd/README.logs
>> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.l=
ogs
>> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such f=
ile or directory
>>
>> First, package this link into systemd-doc to fix above issue.  Second,
>> Source link path created by systemd is not correct when VOLATILE_LOG_D=
IR
>> is true. Create the symlink using absolute path to cover both conditio=
n.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_255.1.bb | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes=
-core/systemd/systemd_255.1.bb
>> index 9e09c89355..73ef0f01b2 100644
>> --- a/meta/recipes-core/systemd/systemd_255.1.bb
>> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
>> @@ -382,10 +382,15 @@ do_install() {
>>          # add a profile fragment to disable systemd pager with busybo=
x less
>>          install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir=
}/profile.d/systemd-pager.sh
>>
>> -    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
>> -        sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D$=
{WATCHDOG_TIMEOUT}/' \
>> -            ${D}/${sysconfdir}/systemd/system.conf
>> -    fi
>> +       if [ -n "${WATCHDOG_TIMEOUT}" ]; then
>> +               sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdog=
Sec=3D${WATCHDOG_TIMEOUT}/' \
>> +                       ${D}/${sysconfdir}/systemd/system.conf
>> +       fi
>> +
>> +       if grep -q '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles=
.d/legacy.conf 2>/dev/null; then
>> +               sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_lib=
dir}/tmpfiles.d/legacy.conf
>> +               echo "L ${localstatedir}/log/README - - - - ${datadir}=
/doc/systemd/README.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.c=
onf
>> +       fi
>>   }
>>
>>   python populate_packages:prepend (){
>> @@ -622,6 +627,8 @@ FILES:${PN}-udev-rules =3D "\
>>                           ${rootlibexecdir}/udev/rules.d/99-systemd.ru=
les \
>>   "
>>
>> +FILES:${PN}-doc  +=3D "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
>> +
>>   CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>>          ${sysconfdir}/systemd/journald.conf \
>>          ${sysconfdir}/systemd/logind.conf \
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196242):https://lists.openembedded.org/g/openembed=
ded-core/message/196242
>> Mute This Topic:https://lists.openembedded.org/mt/104598170/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------GqIF3Rn5zwCJk74YybS0bjb4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/27/24 17:28, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

The patch description doesn't match the patch content. The packaging
doesn't change for README items, and VOLATILE_LOG_DIR isn't checked
anywhere.</pre>
    </blockquote>
    <p>This patch is for fixing two problems:</p>
    <p>1. <br>
    </p>
    <p>Currently,&nbsp; There is one line in
      /usr/lib/tmpfile.d/legacy.conf(this is in package systemd),</p>
    <p>&quot;L /var/log/README - - - -
      ../../usr/share/doc/systemd/README.logs&quot;</p>
    <p>This line will create an link to &quot;<span style="white-space: pre-wrap">${datadir}/doc/systemd/README.logs</span>&quot;
      during boot,&nbsp;</p>
    <p>and <span style="white-space: pre-wrap">${datadir}/doc/systemd/README.logs </span><span style="white-space: pre-wrap">is in package systemd-doc. So there will be dead link when systemd-doc is not installed.</span></p>
    <p><span style="white-space: pre-wrap">So that's why I create another </span><span style="white-space: pre-wrap">legacy-doc.conf packaged into </span><span style="white-space: pre-wrap">systemd-doc</span></p>
    <p><span style="white-space: pre-wrap">2. </span></p>
    <p><span style="white-space: pre-wrap">The symlink in </span>legacy.conf
      use relative path.&nbsp; but for oe, when<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">VOLATILE_LOG_DIR is true,  /var/log is a link to /var/volatile/log, so</span></p>
    <p><span style="white-space: pre-wrap">/var/log/README need link to ../../../usr/share/doc/systemd/README.logs,</span></p>
    <p><span style="white-space: pre-wrap">while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README</span></p>
    <p><span style="white-space: pre-wrap">need link to ../../usr/share/doc/systemd/README.logs.</span></p>
    <p><span style="white-space: pre-wrap">After change it to absolute path,  checking of </span><span style="white-space: pre-wrap">VOLATILE_LOG_DIR</span> is not
      needed. <br>
    </p>
    <p></p>
    <blockquote type="cite" cite="mid:CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Also, don't tweak WATCHDOR_TIMEOUT block, it's not relevant, and hard
to tell if something changed there.</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

I would rather suggest packaging the needed README item into the same
package that references it from other files. What is beoding done with
sed and grep is *really* hard to understand.</pre>
    </blockquote>
    <p>I think these is what I am doing.&nbsp; <br>
    </p>
    <p>Any more comments? if not, I can update the description of this
      patch</p>
    <p>to make things more clear. <br>
    </p>
    <p>Thanks</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">


Alex

On Tue, 27 Feb 2024 at 06:11, Changqing Li
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@eng.windriver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -&gt; ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

First, package this link into systemd-doc to fix above issue.  Second,
Source link path created by systemd is not correct when VOLATILE_LOG_DIR
is true. Create the symlink using absolute path to cover both condition.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..73ef0f01b2 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -382,10 +382,15 @@ do_install() {
        # add a profile fragment to disable systemd pager with busybox less
        install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh

-    if [ -n &quot;${WATCHDOG_TIMEOUT}&quot; ]; then
-        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
-            ${D}/${sysconfdir}/systemd/system.conf
-    fi
+       if [ -n &quot;${WATCHDOG_TIMEOUT}&quot; ]; then
+               sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
+                       ${D}/${sysconfdir}/systemd/system.conf
+       fi
+
+       if grep -q '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf 2&gt;/dev/null; then
+               sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
+               echo &quot;L ${localstatedir}/log/README - - - - ${datadir}/doc/systemd/README.logs&quot; &gt; ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
+       fi
 }

 python populate_packages:prepend (){
@@ -622,6 +627,8 @@ FILES:${PN}-udev-rules = &quot;\
                         ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
 &quot;

+FILES:${PN}-doc  += &quot;${nonarch_libdir}/tmpfiles.d/legacy-doc.conf&quot;
+
 CONFFILES:${PN} = &quot;${sysconfdir}/systemd/coredump.conf \
        ${sysconfdir}/systemd/journald.conf \
        ${sysconfdir}/systemd/logind.conf \
--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196242): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/196242">https://lists.openembedded.org/g/openembedded-core/message/196242</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104598170/1686489">https://lists.openembedded.org/mt/104598170/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------GqIF3Rn5zwCJk74YybS0bjb4--

