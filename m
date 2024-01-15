Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C4C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 20:20:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.94558.1705350030532190214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 12:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ecoAoI1G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17448a1600=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40FKJ8bW003036
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=WhkQu1VfvLH+LimCehk
	wc3MbxQw8ZfVxOPhYWyLLb7o=; b=ecoAoI1GSvN/saYzASBCUkGnkkpH8bnl7Cp
	eaxhuXx0zCo/kSkDOgRuw4DiUXuASQ3vy6Tzyz74LnAxaPj2X+9ID+tNFqRfRuV6
	kyvMq3+nOw25CFVyEcYMpIZHG9MxQN2gG/RrxoiFgZV7GE4Q3epG23NL6+ckygju
	mY+px/DvOx3vId1HMAfAnkvGrADpw0I7eeSFzkfH/dAhsmu/qhUMPJIeiz72zplF
	xkT3hOcg+fn28aJZvera5sUqGU8zINbIw+fp+Fe+COQuQZyf4SozamckEn62Rjr0
	aRc0ssOAaHPBUD/9ldmSnXg8ozc0NDHPZLTg9X15SxJdbRhVQDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxafjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:20:29 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40FKKSGU005270;
	Mon, 15 Jan 2024 20:20:28 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxafjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 20:20:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTceMM9Z/EI3cyeu7OiXcbeH/ao8NvBJ23y8f9fOm6uC8ZS68W9tIWCmHUemHhIKR/UUL+sX2yHonQUH74IPdWDFSdQPM7/5DlVGydQIrXxi4U+eminjn26KWxj9Wc9QU456Z89o9ySGUlRtkWBy9zafYy7J6fnU3qOUN8npHMWWjVdawn0JSwJNB0UPME2+CVcRpCDiuggdOevlzlyW0c4xS6JhaJzVNx41jp4JN1FloVrXHB+qWJSfrHLgHlo0X2sjfvEVXV18jxXhoF+2E4p8nMSzsOdz12xV9losgr3IYVMEO4IeDUxS1/yeXmPMm3eZWGY1v7F6LBEIPuSGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhkQu1VfvLH+LimCehkwc3MbxQw8ZfVxOPhYWyLLb7o=;
 b=BArJUfPOvihUH5FGnLR7vj6XTVU2guWBa2PJtXZDZVL5aSUPQ6hwtJgIx3h9LSC1FQFDiL68PZumvadumj1I4W6sHUxa58emit8+mxnN3NZoCEi3kFLvm7umq3GCPC+x+0dTYDxo7mmfT71UAa9S1NSOKOhz/f9v2EKKzXHpFFddtO+Almecg+t3xzE5e65x0YC+SEtPVLIoWkOvpYEABEW10B1A5oK3olF4CjvhDifjHCpNZgLT5TW++uRmZ8hAtEwzateOAo3rQQXtG0l5WMa74jiLIZ7ZMDskaJx3zfUIEdOmr0hY3CCvF14PKjDSuGrvQXijtWkYH1/+H+zbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 20:20:24 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 20:20:23 +0000
Content-Type: multipart/alternative;
 boundary="------------6ND09hPLcLdbeWBmPNhH31U5"
Message-ID: <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
Date: Mon, 15 Jan 2024 15:20:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
Content-Language: en-CA
To: alexandre.belloni@bootlin.com, stephane.desneux@iot.bzh,
        jsmoeller@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
        david.zuhn@sonos.com
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com>
 <20240115165859d332c9cb@mail.local>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240115165859d332c9cb@mail.local>
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SN7PR11MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9470e5-5e25-409d-43b5-08dc1607678d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xbLiuWijEpdiJ3s/sidIJE2040Pzyt63t//SSgiwPv51xs2145BiqBrf6ol6btPxfwna/U8N0brcpgkP564K3czKM6h0p0RBdM+IGsPUtPqJ2oaXXJkCPZWnO4XV3RS1M1IooJuGlb1KqxcHcmhvIh9TZPLg3ViieZxcx727Nregkz4UaxXx9r2x6I2LkQQBmFHWutb8a9S9+gmKBN3sdushmVElTtSPDvX2Lx+B5KTFTcI1WQzYbES3CDx6H+nX3OcIK4E53i3nbar9HWjWEcWSC3i5fgKm2gh7SE+UNhYhneBXPTgrky5/N8s2aBy7b2vUDhf80kvtcBbql/KxCq5xLMVQvBNQ1bJu+s9zOFrPm8b2PXpHJZzQUVMxK4ABR/1Ga1pYKJ6A+b9TFAURV23ZJa+1hmGMhJbPrEzsvrQ/u+7VzSs+VKfs6DwpFezldSzoG1LR9oWq20B/zvor6EX77MS37WiGzbvF1y5jZ0wKXxZxB/ssV8La+Ah/ByFkPGOl1ckCjhgH8WUxmmzy07Z5M6n4AISvKM4rRG3ramS2be1m3iEDqFUhYyXIriq2jd9HMq56h2RixsgcJLsLlmdfvUbjd5J8pJOfpqRbJwY3XK0Fxs63yQk+b3eYR0X575+XzRpPDadxrJF7gox8XSUfBANWmCdgVo/njEasn0yuYdfNdFkiXeId4e6lzMm3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(30864003)(33964004)(26005)(2616005)(53546011)(6506007)(478600001)(6512007)(8936002)(66556008)(966005)(8676002)(36756003)(6486002)(66946007)(166002)(66476007)(38100700002)(83380400001)(316002)(86362001)(31696002)(4326008)(2906002)(5660300002)(31686004)(41300700001)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFFid1QwR2xXVGZDdVVHbEpZS2NMTXc5MFdrQ1ZDcHVpZUFhbDhuQVRscHlm?=
 =?utf-8?B?WnpYR1BzdnZpK3RiVGc4MXdnZW8vUHo3SkIzdXlTUE5ScUFUNTd6MUJ5Snk1?=
 =?utf-8?B?VE5YUzk5M2lQL1YrWDh1ai9RNFhKTDBPQjlHczA5QmZwdUt2Z3Mwa2NEOFQ4?=
 =?utf-8?B?NUZDOHVJdUhjN2tYZStEc2ZBZFNqcDVsM3JaSjVPRFBxc2RkRlhiRTEzdE93?=
 =?utf-8?B?aUtFaDhlVkN3Q3BvTGM3OXZBMkJraDhtdG5FeVYrUkcxTnpNbWIyempSQ3lR?=
 =?utf-8?B?Q3JQNWRyc3JvWkxtbGRkcWRabnE1RVVSVEtIYVAxQ1BFaG9ndmhScWpxOCtm?=
 =?utf-8?B?VW1pcjVHc2pVTjJ6dXNGcFVOMC9qWHFIWDVyQlovaXZhS2xtT21GdERZTDU1?=
 =?utf-8?B?Tjk3MHBKM3lLcW01Z2xjek1TejJFSUlUZi80bHV1aGlnZUh0dmxROWtkWkI1?=
 =?utf-8?B?M3NwL0dHU2xyOWZYM3J0cnpRejFYWCtkc2xIRzU3MVVuaytQWjRla2pIbXlo?=
 =?utf-8?B?Tmc3aE10ZUFBaWZheElCV1AvVjBvYWczb1d4Ry9FdjcvTmhmMlJrRTNCTHUy?=
 =?utf-8?B?SEdBaElyb2Jnd3dZL05weGRiWE9mVUd4bjVkS2FKdXhkYzFSdkNSRnplL3U1?=
 =?utf-8?B?czIzRExYZkZLazhNR1grZ3l0aDJBcituRUhXZjhmMU1VYnN2Nmh6T0hWUVJt?=
 =?utf-8?B?aVh0akIvczNUY2dKTXdlMXdaOXNDRnhzdnhVZk5vYWgzVkRJamNBa3NWZEhD?=
 =?utf-8?B?RTdpVTdmcmc0Vno0THpWTjViQVpOQ3lWQ1lWbmQ3N3RZQjYxTlRSZnNYb3JJ?=
 =?utf-8?B?RXJDUW9TTGxSaDJNa09qcmVXUTZPbU9FM1VFK3FLVnVXZ0RqL25VOEYxVWRE?=
 =?utf-8?B?bkFwSGRONE9CcEdtU3ZPSmpIdkNKcnNGZ3ZHMDZQbnBiQ3NCZjlVdlRScm5L?=
 =?utf-8?B?d3U3WjNtUEV0ODhlYkIraXUwTWlKOUNQMzc2eVhpK0l1czNQZW5UM3U1cnpn?=
 =?utf-8?B?dDlqY09nU1g0K29IQlNvKzg4T29LMTJsMm13ZkYwRTJzRzVzZVFFZEg2b0dX?=
 =?utf-8?B?TWtKc1ZiZEZvSWt4K2ozaWJnVXVSWDAxQlpzRnJzUTVVVDNvT0lRV2FIRnM2?=
 =?utf-8?B?TnpmTllYbjF6OWNScUNoSGM4OHNCQ2pIamdwU2NrMG11U3diR0YrSVRoZXNt?=
 =?utf-8?B?N25BNllzdVNSeS9yZVBQZHZZdGI5L1owbjE4a1FyQjdSRktKbWlnR09sd2Vx?=
 =?utf-8?B?bEJldmxWdlc4c1NRcUhRL093cmIzSmhCQ2lLejlCejdkUkhvTUMreU5waWRk?=
 =?utf-8?B?TWVUeVA2YVdLNGRKcGNLeHJjQzUrc1A3Uk1vYjUzdGFPTU5nakdJcjhISXZk?=
 =?utf-8?B?b2RjTnNpekJyb3B5enZlN0J1cXplakZMTnBlVHdXclhSY1lqNldEL1Nzb1c3?=
 =?utf-8?B?RldDMCtjamdRYmtTSGg4NHZobklsQU8weW1jMVBoVGxEa3dic3NZV1pGSm5F?=
 =?utf-8?B?QUEzVHFTbFZER1VqbFY4emo2cHYxM1JIMDRud1daa1ZLZzJ2bEJ1KzQ5VHpL?=
 =?utf-8?B?SmNoWm1vYkhHNE95VVI4SFBzMUVCUXdmS1NTWE1ERkM1YmZHb0dFTDhKOFoy?=
 =?utf-8?B?b2FwNG5wUldIZ21kSEtQRUlrZmtMaDVMRTJ0MzBuVC9PNjhoZEEzeXovNGxh?=
 =?utf-8?B?L1lFL1ZrSlRDVFJyRm01eWcyRmZkVlJTbk5lNWxhK0swcWp4cVp3Q2Z2UDVl?=
 =?utf-8?B?RThMVzhRVTNjVXpkQ0k4bCtKUmt3TW90V2NVVVVXMFZmVTc2ZDNwdFA3Q3cx?=
 =?utf-8?B?bU5wZlRuODg3Rk1lVE9zajNCSDdmTTNUQzkyMFh1VWR5NkNmNXByRG02WWZN?=
 =?utf-8?B?WEs1ZnFrbWM4bVdJYlhlUW1tZDFhMWhoa3BGMGZHZGtlRzBERkxGOGdvOFhT?=
 =?utf-8?B?dGNuTjdOdm8vcnJ4cktmdnJSTFlBWTZjS09ZM3J3bGRUNEhndWxBQThKVVAy?=
 =?utf-8?B?bnVramhzbkVqYmVoSThTNUVJQy9uQ1UybEwrczFiVEt1ZDZPdUdLRVp3Qzdx?=
 =?utf-8?B?cmhMUXh4eUpBT3VHZUJCWDk1Mk5EbTJhMkJHeWtjTVN0M3lYTHRZNWtpL3lC?=
 =?utf-8?B?ZGtSQlJQVEd6bGVscHVvMFhRMkJIUlREN2MwZE1ONXREM1lXaG41VTkyVktz?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9470e5-5e25-409d-43b5-08dc1607678d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 20:20:23.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNoa/lFQc+IiDvaOLuTKEduVTtlH4xz5VwAKIuNjroaj0qRglbrtToPcZ2jh6xvXFnAWOE/sfcLpga6TTUvkX0bnzzZ/u/brY6PAiGP+zn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
X-Proofpoint-GUID: s_fhI7I1384CMlsFQ8E-6MfTHla4Gsqf
X-Proofpoint-ORIG-GUID: 1iRZwjGklSBd3Z2ET1IGKw2MnnwXhXGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193798

--------------6ND09hPLcLdbeWBmPNhH31U5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40FKJ8bW003036

On 2024-01-15 11:58 a.m., Alexandre Belloni via lists.openembedded.org=20
wrote:
> This is breaking meta-agl-core until this gets into meta-oe:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849=
/steps/14/logs/stdio

Thanks Alexandre.


Stephane, Jan-Simon,

Is rng-tools actually still a requirement for meta-agl ?
It was added back in 2018 but the kernel algorithm improved as of 5.6:
https://lists.openembedded.org/g/openembedded-core/message/178518

../Randy

commit c55cb9e43a4ff26224cd917f91c057f15535ee3b
Author: Stephane Desneux <stephane.desneux@iot.bzh>
Date:=C2=A0=C2=A0 Thu Sep 6 17:53:26 2018

 =C2=A0=C2=A0=C2=A0 agl-profile-core/packagegroup-agl-core-boot: add rng-=
tools

 =C2=A0=C2=A0=C2=A0 On some boards (typically Minnowboard Max), the kerne=
l's random=20
number entropy
 =C2=A0=C2=A0=C2=A0 pool may fill too slowly.=C2=A0 As a consequence, if =
many processes ask=20
for random
 =C2=A0=C2=A0=C2=A0 data at the same time, the reads on /dev/random are b=
locked until=20
the entropy
 =C2=A0=C2=A0=C2=A0 pool has been filled.

 =C2=A0=C2=A0=C2=A0 This patch adds rng-tools in the core images: the rng=
d daemon will=20
start at boot
 =C2=A0=C2=A0=C2=A0 and fill the entropy pool.

 =C2=A0=C2=A0=C2=A0 Bug-AGL: SPEC-1655

 =C2=A0=C2=A0=C2=A0 Change-Id: Icbcf6a9ea685774dd13e33597689a3fd05aaadf4
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Stephane Desneux <stephane.desneux@iot=
.bzh>

>
> On 10/01/2024 15:25:01-0500, Randy MacLeod via lists.openembedded.org w=
rote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> Nothing in oe-core depends on rng-tools anymore:
>>     e7e1bc43ca rng-tools: splitting the rng-tools systemd/sysvinit ser=
ivce as a package
>> so move it to meta-oe for people who still want to run rngd
>> as a service for some reason or for those who want to run rng-test.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc      |  1 -
>>   .../rng-tools/rng-tools/default               |  1 -
>>   meta/recipes-support/rng-tools/rng-tools/init | 42 -----------
>>   .../rng-tools/rng-tools/rng-tools.service     | 32 ---------
>>   .../rng-tools/rng-tools_6.16.bb               | 69 -----------------=
--
>>   5 files changed, 145 deletions(-)
>>   delete mode 100644 meta/recipes-support/rng-tools/rng-tools/default
>>   delete mode 100644 meta/recipes-support/rng-tools/rng-tools/init
>>   delete mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tool=
s.service
>>   delete mode 100644 meta/recipes-support/rng-tools/rng-tools_6.16.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc
>> index 8dc63b138e..31023021ac 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -739,7 +739,6 @@ RECIPE_MAINTAINER:pn-repo =3D "Unassigned<unassign=
ed@yoctoproject.org>"
>>   RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi<Qi.Chen@windriver.com>"
>>   RECIPE_MAINTAINER:pn-rgb =3D "Unassigned<unassigned@yoctoproject.org=
>"
>>   RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia<hongxu.jia@windriver.co=
m>"
>> -RECIPE_MAINTAINER:pn-rng-tools =3D "Anuj Mittal<anuj.mittal@intel.com=
>"
>>   RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj<raj.khem@gmail.com>"
>>   RECIPE_MAINTAINER:pn-rpm =3D "Unassigned<unassigned@yoctoproject.org=
>"
>>   RECIPE_MAINTAINER:pn-rsync =3D "Yi Zhao<yi.zhao@windriver.com>"
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/r=
ecipes-support/rng-tools/rng-tools/default
>> deleted file mode 100644
>> index b9f8e03635..0000000000
>> --- a/meta/recipes-support/rng-tools/rng-tools/default
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -EXTRA_ARGS=3D"-r /dev/hwrng"
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/reci=
pes-support/rng-tools/rng-tools/init
>> deleted file mode 100644
>> index 13f0ecd37c..0000000000
>> --- a/meta/recipes-support/rng-tools/rng-tools/init
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -#!/bin/sh
>> -#
>> -# This is an init script for openembedded
>> -# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
>> -# > update-rc.d rng-tools defaults 60
>> -#
>> -
>> -rngd=3D@SBINDIR@/rngd
>> -test -x "$rngd" || exit 1
>> -
>> -[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-=
tools"
>> -
>> -case "$1" in
>> -  start)
>> -    echo -n "Starting random number generator daemon"
>> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
>> -    echo "."
>> -    ;;
>> -  stop)
>> -    echo -n "Stopping random number generator daemon"
>> -    start-stop-daemon -K -q -n rngd
>> -    echo "."
>> -    ;;
>> -  reload|force-reload)
>> -    echo -n "Signalling rng daemon restart"
>> -    start-stop-daemon -K -q -s 1 -x $rngd
>> -    start-stop-daemon -K -q -s 1 -x $rngd
>> -    ;;
>> -  restart)
>> -    echo -n "Stopping random number generator daemon"
>> -    start-stop-daemon -K -q -n rngd
>> -    echo "."
>> -    echo -n "Starting random number generator daemon"
>> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
>> -    echo "."
>> -    ;;
>> -  *)
>> -    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|res=
tart|force-reload}"
>> -    exit 1
>> -esac
>> -
>> -exit 0
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.servic=
e b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>> deleted file mode 100644
>> index 5ae2fba215..0000000000
>> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -[Unit]
>> -Description=3DHardware RNG Entropy Gatherer Daemon
>> -DefaultDependencies=3Dno
>> -Conflicts=3Dshutdown.target
>> -Before=3Dsysinit.target shutdown.target
>> -ConditionVirtualization=3D!container
>> -
>> -[Service]
>> -EnvironmentFile=3D-@SYSCONFDIR@/default/rng-tools
>> -ExecStart=3D@SBINDIR@/rngd -f $EXTRA_ARGS
>> -CapabilityBoundingSet=3DCAP_SYS_ADMIN
>> -IPAddressDeny=3Dany
>> -LockPersonality=3Dyes
>> -MemoryDenyWriteExecute=3Dyes
>> -NoNewPrivileges=3Dyes
>> -PrivateTmp=3Dyes
>> -ProtectControlGroups=3Dyes
>> -ProtectHome=3Dyes
>> -ProtectHostname=3Dyes
>> -ProtectKernelModules=3Dyes
>> -ProtectKernelLogs=3Dyes
>> -ProtectSystem=3Dstrict
>> -RestrictAddressFamilies=3DAF_UNIX
>> -RestrictNamespaces=3Dyes
>> -RestrictRealtime=3Dyes
>> -RestrictSUIDSGID=3Dyes
>> -SystemCallArchitectures=3Dnative
>> -SystemCallErrorNumber=3DEPERM
>> -SystemCallFilter=3D@system-service
>> -
>> -[Install]
>> -WantedBy=3Dsysinit.target
>> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/r=
ecipes-support/rng-tools/rng-tools_6.16.bb
>> deleted file mode 100644
>> index f0aa3ff93f..0000000000
>> --- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -SUMMARY =3D "Random number generator daemon"
>> -DESCRIPTION =3D "Check and feed random data from hardware device to k=
ernel"
>> -HOMEPAGE =3D"https://github.com/nhorman/rng-tools"
>> -BUGTRACKER =3D"https://github.com/nhorman/rng-tools/issues"
>> -LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
>> -DEPENDS =3D "openssl libcap"
>> -
>> -SRC_URI =3D "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>> -file://init  \
>> -file://default  \
>> -file://rng-tools.service  \
>> -           "
>> -SRCREV =3D "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -inherit autotools update-rc.d systemd pkgconfig
>> -
>> -EXTRA_OECONF =3D "--without-rtlsdr"
>> -
>> -PACKAGECONFIG ??=3D "libjitterentropy"
>> -PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
>> -
>> -PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-sta=
ndalone,"
>> -PACKAGECONFIG[libjitterentropy] =3D "--enable-jitterentropy,--disable=
-jitterentropy,libjitterentropy"
>> -PACKAGECONFIG[libp11] =3D "--with-pkcs11,--without-pkcs11,libp11 open=
ssl"
>> -PACKAGECONFIG[nistbeacon] =3D "--with-nistbeacon,--without-nistbeacon=
,curl libxml2"
>> -PACKAGECONFIG[qrypt] =3D "--with-qrypt,--without-qrypt,curl"
>> -
>> -INITSCRIPT_PACKAGES =3D "${PN}-service"
>> -INITSCRIPT_NAME:${PN}-service =3D "rng-tools"
>> -INITSCRIPT_PARAMS:${PN}-service =3D "start 03 2 3 4 5 . stop 30 0 6 1=
 ."
>> -
>> -SYSTEMD_PACKAGES =3D "${PN}-service"
>> -SYSTEMD_SERVICE:${PN}-service =3D "rng-tools.service"
>> -
>> -CFLAGS +=3D " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
>> -
>> -PACKAGES =3D+ "${PN}-service"
>> -
>> -FILES:${PN}-service +=3D " \
>> -    ${sysconfdir}/init.d/rng-tools \
>> -    ${sysconfdir}/default/rng-tools \
>> -"
>> -
>> -# Refer autogen.sh in rng-tools
>> -do_configure:prepend() {
>> -    cp ${S}/README.md ${S}/README
>> -}
>> -
>> -do_install:append() {
>> -    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng=
-tools
>> -    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-too=
ls
>> -    install -Dm 0644 ${WORKDIR}/rng-tools.service \
>> -                     ${D}${systemd_system_unitdir}/rng-tools.service
>> -    sed -i \
>> -        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>> -        -e 's,@SBINDIR@,${sbindir},g' \
>> -        ${D}${sysconfdir}/init.d/rng-tools \
>> -        ${D}${systemd_system_unitdir}/rng-tools.service
>> -
>> -    if ["${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', '=
no', d)}"  =3D "yes" ]; then
>> -        sed -i \
>> -            -e '/^IPAddressDeny=3Dany/d' \
>> -            -e '/^RestrictAddressFamilies=3D/ s/$/ AF_INET AF_INET6/'=
 \
>> -            ${D}${systemd_system_unitdir}/rng-tools.service
>> -    fi
>> -}
>> --=20
>> 2.34.1
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193691):https://lists.openembedded.org/g/openembedd=
ed-core/message/193691
> Mute This Topic:https://lists.openembedded.org/mt/103649050/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------6ND09hPLcLdbeWBmPNhH31U5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-01-15 11:58 a.m., Alexandre
      Belloni via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240115165859d332c9cb@mail.local">
      <pre class="moz-quote-pre" wrap="">This is breaking meta-agl-core until this gets into meta-oe:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio</a></pre>
    </blockquote>
    <p>Thanks Alexandre.</p>
    <p><br>
    </p>
    <p>Stephane, Jan-Simon,</p>
    <p>Is rng-tools actually still a requirement for meta-agl ?<br>
      It was added back in 2018 but the kernel algorithm improved as of
      5.6:<br>
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/178518">https://lists.openembedded.org/g/openembedded-core/message/178518</a></p>
    <p>../Randy<br>
    </p>
    <p>commit c55cb9e43a4ff26224cd917f91c057f15535ee3b<br>
      Author: Stephane Desneux <a class="moz-txt-link-rfc2396E" href="mailto:stephane.desneux@iot.bzh">&lt;stephane.desneux@iot.bzh&gt;</a><br>
      Date:&nbsp;&nbsp; Thu Sep 6 17:53:26 2018<br>
      <br>
      &nbsp;&nbsp;&nbsp; agl-profile-core/packagegroup-agl-core-boot: add rng-tools<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; On some boards (typically Minnowboard Max), the kernel's
      random number entropy<br>
      &nbsp;&nbsp;&nbsp; pool may fill too slowly.&nbsp; As a consequence, if many processes
      ask for random<br>
      &nbsp;&nbsp;&nbsp; data at the same time, the reads on /dev/random are blocked
      until the entropy<br>
      &nbsp;&nbsp;&nbsp; pool has been filled.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; This patch adds rng-tools in the core images: the rngd daemon
      will start at boot<br>
      &nbsp;&nbsp;&nbsp; and fill the entropy pool.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Bug-AGL: SPEC-1655<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Change-Id: Icbcf6a9ea685774dd13e33597689a3fd05aaadf4<br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Stephane Desneux
      <a class="moz-txt-link-rfc2396E" href="mailto:stephane.desneux@iot.bzh">&lt;stephane.desneux@iot.bzh&gt;</a><br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:20240115165859d332c9cb@mail.local">
      <pre class="moz-quote-pre" wrap="">

On 10/01/2024 15:25:01-0500, Randy MacLeod via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Nothing in oe-core depends on rng-tools anymore:
   e7e1bc43ca rng-tools: splitting the rng-tools systemd/sysvinit serivce as a package
so move it to meta-oe for people who still want to run rngd
as a service for some reason or for those who want to run rng-test.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../rng-tools/rng-tools/default               |  1 -
 meta/recipes-support/rng-tools/rng-tools/init | 42 -----------
 .../rng-tools/rng-tools/rng-tools.service     | 32 ---------
 .../rng-tools/rng-tools_6.16.bb               | 69 -------------------
 5 files changed, 145 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/default
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/init
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools.service
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools_6.16.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8dc63b138e..31023021ac 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -739,7 +739,6 @@ RECIPE_MAINTAINER:pn-repo = &quot;Unassigned <a class="moz-txt-link-rfc2396E" href="mailto:unassigned@yoctoproject.org">&lt;unassigned@yoctoproject.org&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-resolvconf = &quot;Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-rgb = &quot;Unassigned <a class="moz-txt-link-rfc2396E" href="mailto:unassigned@yoctoproject.org">&lt;unassigned@yoctoproject.org&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-rpcbind = &quot;Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>&quot;
-RECIPE_MAINTAINER:pn-rng-tools = &quot;Anuj Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-rpcsvc-proto = &quot;Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-rpm = &quot;Unassigned <a class="moz-txt-link-rfc2396E" href="mailto:unassigned@yoctoproject.org">&lt;unassigned@yoctoproject.org&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-rsync = &quot;Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>&quot;
diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
deleted file mode 100644
index b9f8e03635..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ /dev/null
@@ -1 +0,0 @@
-EXTRA_ARGS=&quot;-r /dev/hwrng&quot;
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
deleted file mode 100644
index 13f0ecd37c..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/init
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-#
-# This is an init script for openembedded
-# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
-# &gt; update-rc.d rng-tools defaults 60
-#
-
-rngd=@SBINDIR@/rngd
-test -x &quot;$rngd&quot; || exit 1
-
-[ -r @SYSCONFDIR@/default/rng-tools ] &amp;&amp; . &quot;@SYSCONFDIR@/default/rng-tools&quot;
-
-case &quot;$1&quot; in
-  start)
-    echo -n &quot;Starting random number generator daemon&quot;
-    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
-    echo &quot;.&quot;
-    ;;
-  stop)
-    echo -n &quot;Stopping random number generator daemon&quot;
-    start-stop-daemon -K -q -n rngd
-    echo &quot;.&quot;
-    ;;
-  reload|force-reload)
-    echo -n &quot;Signalling rng daemon restart&quot;
-    start-stop-daemon -K -q -s 1 -x $rngd
-    start-stop-daemon -K -q -s 1 -x $rngd
-    ;;
-  restart)
-    echo -n &quot;Stopping random number generator daemon&quot;
-    start-stop-daemon -K -q -n rngd
-    echo &quot;.&quot;
-    echo -n &quot;Starting random number generator daemon&quot;
-    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
-    echo &quot;.&quot;
-    ;;
-  *)
-    echo &quot;Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}&quot;
-    exit 1
-esac
-
-exit 0
diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
deleted file mode 100644
index 5ae2fba215..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
+++ /dev/null
@@ -1,32 +0,0 @@
-[Unit]
-Description=Hardware RNG Entropy Gatherer Daemon
-DefaultDependencies=no
-Conflicts=shutdown.target
-Before=sysinit.target shutdown.target
-ConditionVirtualization=!container
-
-[Service]
-EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
-ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
-CapabilityBoundingSet=CAP_SYS_ADMIN
-IPAddressDeny=any
-LockPersonality=yes
-MemoryDenyWriteExecute=yes
-NoNewPrivileges=yes
-PrivateTmp=yes
-ProtectControlGroups=yes
-ProtectHome=yes
-ProtectHostname=yes
-ProtectKernelModules=yes
-ProtectKernelLogs=yes
-ProtectSystem=strict
-RestrictAddressFamilies=AF_UNIX
-RestrictNamespaces=yes
-RestrictRealtime=yes
-RestrictSUIDSGID=yes
-SystemCallArchitectures=native
-SystemCallErrorNumber=EPERM
-SystemCallFilter=@system-service
-
-[Install]
-WantedBy=sysinit.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
deleted file mode 100644
index f0aa3ff93f..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY = &quot;Random number generator daemon&quot;
-DESCRIPTION = &quot;Check and feed random data from hardware device to kernel&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nhorman/rng-tools">&quot;https://github.com/nhorman/rng-tools&quot;</a>
-BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://github.com/nhorman/rng-tools/issues">&quot;https://github.com/nhorman/rng-tools/issues&quot;</a>
-LICENSE = &quot;GPL-2.0-only&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
-DEPENDS = &quot;openssl libcap&quot;
-
-SRC_URI = &quot;git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
-           <a class="moz-txt-link-freetext" href="file://init">file://init</a> \
-           <a class="moz-txt-link-freetext" href="file://default">file://default</a> \
-           <a class="moz-txt-link-freetext" href="file://rng-tools.service">file://rng-tools.service</a> \
-           &quot;
-SRCREV = &quot;e061c313b95890eb5fa0ada0cd6eec619dafdfe2&quot;
-
-S = &quot;${WORKDIR}/git&quot;
-
-inherit autotools update-rc.d systemd pkgconfig
-
-EXTRA_OECONF = &quot;--without-rtlsdr&quot;
-
-PACKAGECONFIG ??= &quot;libjitterentropy&quot;
-PACKAGECONFIG:libc-musl = &quot;libargp libjitterentropy&quot;
-
-PACKAGECONFIG[libargp] = &quot;--with-libargp,--without-libargp,argp-standalone,&quot;
-PACKAGECONFIG[libjitterentropy] = &quot;--enable-jitterentropy,--disable-jitterentropy,libjitterentropy&quot;
-PACKAGECONFIG[libp11] = &quot;--with-pkcs11,--without-pkcs11,libp11 openssl&quot;
-PACKAGECONFIG[nistbeacon] = &quot;--with-nistbeacon,--without-nistbeacon,curl libxml2&quot;
-PACKAGECONFIG[qrypt] = &quot;--with-qrypt,--without-qrypt,curl&quot;
-
-INITSCRIPT_PACKAGES = &quot;${PN}-service&quot;
-INITSCRIPT_NAME:${PN}-service = &quot;rng-tools&quot;
-INITSCRIPT_PARAMS:${PN}-service = &quot;start 03 2 3 4 5 . stop 30 0 6 1 .&quot;
-
-SYSTEMD_PACKAGES = &quot;${PN}-service&quot;
-SYSTEMD_SERVICE:${PN}-service = &quot;rng-tools.service&quot;
-
-CFLAGS += &quot; -DJENT_CONF_ENABLE_INTERNAL_TIMER &quot;
-
-PACKAGES =+ &quot;${PN}-service&quot;
-
-FILES:${PN}-service += &quot; \
-    ${sysconfdir}/init.d/rng-tools \
-    ${sysconfdir}/default/rng-tools \
-&quot;
-
-# Refer autogen.sh in rng-tools
-do_configure:prepend() {
-    cp ${S}/README.md ${S}/README
-}
-
-do_install:append() {
-    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    install -Dm 0644 ${WORKDIR}/rng-tools.service \
-                     ${D}${systemd_system_unitdir}/rng-tools.service
-    sed -i \
-        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-        -e 's,@SBINDIR@,${sbindir},g' \
-        ${D}${sysconfdir}/init.d/rng-tools \
-        ${D}${systemd_system_unitdir}/rng-tools.service
-
-    if [ <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','nistbeacon','yes','no',d)}">&quot;${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}&quot;</a> = &quot;yes&quot; ]; then
-        sed -i \
-            -e '/^IPAddressDeny=any/d' \
-            -e '/^RestrictAddressFamilies=/ s/$/ AF_INET AF_INET6/' \
-            ${D}${systemd_system_unitdir}/rng-tools.service
-    fi
-}
-- 
2.34.1

</pre>
      </blockquote>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#193691): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/193691">https://lists.openembedded.org/g/openembedded-core/message/193691</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/103649050/3616765">https://lists.openembedded.org/mt/103649050/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------6ND09hPLcLdbeWBmPNhH31U5--

