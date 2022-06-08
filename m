Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57710C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:53:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7494.1654700004037679383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MKtW+SP5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31580cbef2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 258DOxH9027590
	for <openembedded-core@lists.openembedded.org>;
 Wed, 8 Jun 2022 07:53:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0Y9NFB3VzD9qNpi6faWOefYZvznTM3sOiyTzI6qXxiY=;
 b=MKtW+SP56DAfyxTQ3NrXiqJQPnb6PqXFZLzvsNCrlwwvU5HtlyagdNtDRphL/IV0+UT/
 +WbebexBPLhhDP7Rzc3WQK/I9jiMoTp+kriRxsngBl8xLcgtviz/oXifM0o9kdLAT/v6
 U05aNDgPslNAGFPdrDs7Ty3QepNZhtFqQLrLxrG2rqY5la8f/xLcm9+iWaLOeuUTCuHg
 UAniBkApLHasrMvDpzHeVvqsvplYhuZpC9rZAIqZ0g10iUvaAbtuAsXhY2RVF1wrwLqM
 KlDtLVWawZ+U/3F9/dKGSgOoaIJMGlsPWlzZADnb7eLF4WRCsmTNKmdYuUbaCvS4GTLB sg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmax94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:53:23 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 258ErN7i022942
	for <openembedded-core@lists.openembedded.org>;
 Wed, 8 Jun 2022 07:53:23 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmax90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 07:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4D+aDDYK1Tl9TzTY6Zpt3jPkFBGuhv6kCDhHvMtMTUQQoYhxrz7t1sGkoX06SvEK3bQuCCK4/u0caKfBti5bbqmijtDd44cS5XVeZbvmhQ8djeuMslcSkISxPtFGNOxcPgPm5wwgVqAsYBR23cWmtmwk8TgSQjQVoihAC+KblWeaAQ9fAecEOs/oFn5hwOtVWK4y2WsXnIdR2PXN6XFQl3XGtvGDIOdVSIsJNNh5tM+qIQNDvHain03ZgJ2C92SoMuHoPdcWeczg5AJrew30qpA6qIV4pMIKGR85+/epfYa8+6yrnGDHnH4FaE7Q3SKKw+MUehNHNOsGQo5jVjTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y9NFB3VzD9qNpi6faWOefYZvznTM3sOiyTzI6qXxiY=;
 b=CSAg6/pJSkiAePz/UJzpipS0oLG75nNQRXW62731yb9v2ClQVGBbAdFYaGHyUZ9i7zdCW1A8ZkQiGTrHd0cBqc85VEJ1LroepR6EyTAKfsRtTdKUKlQMV55W1iew8x97gC2HouhejveiUmAN0XqKpXReXV3Y+0b5Z8wbtLdTk19N59rpF6ACrEle437IRosFkdERKGUAlkEvEMaGHRrW1cbRGI2K46eykLpTgyg1tG1S+/BhA5UJhInT0ZxxDk1NTY5B9zoxQjSNhNSsQN8m+kB1mkRaxAYaRMTSsjiAKS7ZZbZ1r9imU0S9mzpj7ku9KGncePlnFn0gDkodIpcGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB3043.namprd11.prod.outlook.com (2603:10b6:208:33::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 14:53:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 14:53:19 +0000
Message-ID: <d21600d6-108e-53ef-8b07-4cb311a96821@windriver.com>
Date: Wed, 8 Jun 2022 10:53:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Rust recipe fails to build project on kirkstone but
 works on dunfell
Content-Language: en-CA
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: 
 <CAMRc=Meo0zQbMsG_feDcPXwruGkphWEePspjUMOMBD3t+8tiGQ@mail.gmail.com>
 <581f3396-dbef-0360-dd61-fb1ba387d30c@windriver.com>
 <CAMRc=MewokSYOKHBcGtW88snonNUh-OSu3HZdcYvDYZyf1bUwQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAMRc=MewokSYOKHBcGtW88snonNUh-OSu3HZdcYvDYZyf1bUwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73b60cd1-9884-42ef-608c-08da495ea031
X-MS-TrafficTypeDiagnostic: BL0PR11MB3043:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB304342235E871FC534FACF5CF8A49@BL0PR11MB3043.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	537icQgF9X4VwHoVvSTwiQ1N0ysso/EAc2TpjDwwGdZLlBJziu/kppnjmoDbdM1xOrzL6taPaUMUy5YFj5z/qcg6XZtwd1COlyeKWueCd3bCbOTms44S22s+sP8qdAVRz0DMK2DzUdGkd1FKRfwilDpkZUXSfMAhQa1TqFKm8py3iMgvyvA56eKLQ27W0eUX/CWvvqO7izmXuvyEBdLXWHVdcy+hKfbLXWW+Ocz1lUitb4gaThd4Mc92AvLRJ8SEIJhDEIfwZnAL0e+9DMksNuXxpE6/97boIXEFUHRFRqBzWg5AR5bPswcjAxZEYCHbSUC22lq63xcfafmyS+GcK6pn27TAIgbWk355+7gIvD6z3+gVMgyo7tO2JdVaH8S5x8zKDaLcAKCnVNe0VomZ80C2vBBz/7QoYfqTm3lDWoDP4iYbqwFICeJplq0ys7r9+ODL7zf+y23TMHhxmOrcfLxlnuYYuBdLJOoerH1ODNponKkSsPnTxIWnSQBJrNDeyS3oycvqlXbYMDB/ItMK0aJIJKoB0n4uOy0vtHvjoi9Q9+Ad+yB6RPmwZtt7d2TpItAoYPTMOgLnhE4di+fx+GkLX6tLemiuI8i2LmPw7axSmrIcTmW3RF9igigFGAfX2vmu/3E65VsylkIAiHB75TPwyaseJqHSqDpZcrKxSvd+kChcx1AQuPi1r9yRmRfTh4nAh/xgqqeFzK3sMVTXlHd83CzRHM4tpy8VluDgEhr0A4cyQuz6QXOwlDwUn2r/YO+V2KCKwygx6jkjfhPGFeAYEi+1CijwxreI1CSYkosQBvGE2MrnwxokLYIxzqMZmDkZzROhepCAylJGg2jrJjwOWkH8CLX1fbHfbBImrs8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6512007)(508600001)(6486002)(966005)(316002)(2906002)(86362001)(31696002)(54906003)(6916009)(6666004)(26005)(6506007)(53546011)(52116002)(38100700002)(38350700002)(186003)(107886003)(2616005)(8936002)(36756003)(4744005)(4326008)(66946007)(66556008)(5660300002)(31686004)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXJuSlJ2WEZ1cFJTdVlkUzREUXBXajVSbnkwT0hNSzREV1dHUW5Ec3p4alM2?=
 =?utf-8?B?Ynh2bVhhbUlJV1JLbUVBbXlqQ3NTUmhqOUNaWjdPQkdseVRyUWhnMncrU2cr?=
 =?utf-8?B?WUJhcnFITTZKbHJ4Qm1vN09qaHdrT0RUNithTGUvMmZ3cXJlVkFwY3NJdlNv?=
 =?utf-8?B?aktXV0xJckZJTmdlSDJEQnh5bmo5RHZXZ1ZSbXFSdGxqTWFLdWc2YzFFRk5T?=
 =?utf-8?B?R0dRbmI5WDAxei84MGpiLzhGK1hNZzVrU3gvY2pXY1dhRWs4MS9wcDVaUUJs?=
 =?utf-8?B?QTM2UFRaVkU2bnY4UWVlanpDcFpNaGFwSUFGUVFiaW1wOXNBU1R6OFpXR0xn?=
 =?utf-8?B?WGF0Uitic25tM0xqY0lHN2ZLQ2trbklKMjhEa1RvaWo0a1h6b0UrQ21SUWlN?=
 =?utf-8?B?cEZLS014REtJNUVxTy96eGxPOE9wSFVyQnlXcGE3eFFNdXM4R0Z3Z3c4MTBa?=
 =?utf-8?B?ZUdldnBjRjIzOFpnRHVNd2pTYUw2anBvRUhkbktoZG96Qm55aEFTN0R4RFFG?=
 =?utf-8?B?ekxLcmRHOFF4TlZaREdMeldDNVFsdUhnTEVWZFBjbG1MRHVWa3NycS9oVTJV?=
 =?utf-8?B?YjQrajdRcFQ3TkpZTVE5c2xGb0hwZ09CR3NBZU0vNm80U0t3Y0pubHVuZ0Vi?=
 =?utf-8?B?OGRKUlhIbmsxK2c0b1N2RVdtTlR5QWtsY3h0ZmpKdy9YTGNqZC9pdzhHVDBx?=
 =?utf-8?B?NzVNbC92c3VIZjZHOGJkT3JVcER2VUVneFkvWldyWllwc3BvMDN3ejBhZU5J?=
 =?utf-8?B?c3R3STl3TUkxYUxkQmMxTFFRN2ZPbWxrQk81UlhJbUZNZEY2RmMvUGVPVzAy?=
 =?utf-8?B?TUNXVmRjN2YxTVo4NEF4ejNGMnk1S29yNGpld1hMMFNxWlBsYTNDVU5ReUFG?=
 =?utf-8?B?ZWZMRU1CekwwdlVNSkkwL3BZMUQvalVJc3g3NlY1a2VxSjJwVEc4K0xPSmUz?=
 =?utf-8?B?NDRqSzBjVzZIOUkzcllSY0h1SWEzZHQvYkdPZElDUThBRWtPMUdkcUw4ZlNt?=
 =?utf-8?B?WWo1ZzFQcFVXcktESTFsSFBlV1Z0R0RFWldzOUQ1N0l2K0IvWVhTZGhKVGdO?=
 =?utf-8?B?dzV3KzByaS8xNzBHR0ptT1ZjY1NaUGNOVVpORUNFR2w3ZHB3NWtJRHVFeU81?=
 =?utf-8?B?MHczYktWbjNVV3Azcm4rWjlPWk41dWEwZFF1REtNcU9ubUpzWW5zeUc0UE54?=
 =?utf-8?B?dUZqQThDRllNQVFTckt2b09HbVVCcUU3ZDRhRXhKaW1wekFSK2gyQmVHSk9T?=
 =?utf-8?B?NHU4STQ2RVJYMk1GQnFKWVp3WFJsU0xRODBXVWtPbTNTcGFkUngreE1VZHhN?=
 =?utf-8?B?cDREcm1hWFNlWlFwcXZHUER1VWRkS2V4QXVUMHo4QlhyTitvQnRnK1drSkpN?=
 =?utf-8?B?bkNhMmtINEsrWXY3UU5wdGIvMXJ1K29yazRBdGpXdURtOEZnY0F4SzNKd0w5?=
 =?utf-8?B?TkhxSWkvdjZKa1hsa1JsUkZqUERqVTEyS3pZTFdWazV2K2ZHd0NTVCtJTU1k?=
 =?utf-8?B?dU9IMEJMK25FRGdvMnBHcjRxQUxHa0h3ZUJodWdZbkp4N2hzZkZBUHU2R2k2?=
 =?utf-8?B?OXVzSDJNY2tDOGFqS0x2R0FGZ1dDT3ZEVE5odG1ITFpYNTZGOFAwbmdPRVJK?=
 =?utf-8?B?Z21kQXlOeTdOazJ6STJkRHBvT1NLQTRGZW1sNVRrUHE0UHZPUUFrVEsxWnRP?=
 =?utf-8?B?UzY2ZEMzT1h4MHZhK0ZMcWhNRWNNNHUxdm81Tm01TjlOVWI5QjRYdExNZFhO?=
 =?utf-8?B?ZWkyMERMTFFxZGlhWm5sWnNMbE1pT3M1TTVjUVRwSkhiUnhTam5sYnJNN2NQ?=
 =?utf-8?B?U0hkclN0cmxpWWM1UlJDNmZFaDluMUdLUEJiYU92cE9mMDRxM3VVVHlmd2NF?=
 =?utf-8?B?Yng3S01qdzN6STlxTW1PRnV0RVR6alA1b0kzSnJoSzNKeExPLzZYMElRMVp5?=
 =?utf-8?B?SFpFVVorM0NNWnVXRWxXc1VTQlBwWlFIMmdraENtSm9XQWNpblkxcmdwbzhB?=
 =?utf-8?B?ZlU1ZGlISjZWUWtnN2h6N3NJbFFiZlkvcTB4UG1rSTJxdkpQMmFQL2JVSWpP?=
 =?utf-8?B?b3RVekRTQThBSCtWZ0VOY0dRSDg1blp0SFpNS1FEbVMxQytTVXJSNmhzenJr?=
 =?utf-8?B?VGM0OGRML21tekQ0NGt2UDh3MlIxai9ISmdRa29PZGRIdjZHMUhGeDMwbVpD?=
 =?utf-8?B?L0tzTk1pKzA2OCtMTStiY0NJcXl2QVA1dXh1RGowMmd3VUxlSjdadGEzeGJy?=
 =?utf-8?B?VkIzQ2hvR1c4NWFMRlZySVFGTkZ3ODVhckoyUFgvRWt1VlFxcXdoS0JQbzFx?=
 =?utf-8?B?QUtUODlUVWdGMDA3U2g4YlJiY0Q4dW96Ulo0RnZMZ1h5MmMvWWdRWjlxU1VP?=
 =?utf-8?Q?YL9eUuuMCoRl1zUF+WEMKLOxvUgmAnoixhDpH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 73b60cd1-9884-42ef-608c-08da495ea031
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 14:53:19.0940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XFRXoa4pnZ3PHhtatxKcPUx/0ilvcyxsatf7Arn8aHXzlBedgprMey25kHRKpDkQGvrbjxZue9CT7UEs/z+NOwJOBER/SncqtKe5APsbvuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3043
X-Proofpoint-ORIG-GUID: Ku0C-vYvdZv5xCZzvbHBPvNEMruz5Bys
X-Proofpoint-GUID: uanVv6kYbtwtXqd37OAsI1EdznpuVSxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=886 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 258DOxH9027590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166750

On 2022-06-08 10:35, Bartosz Golaszewski wrote:
> On Wed, Jun 8, 2022 at 3:21 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> [snip]
>
>> Naveen or I will take a look at some point and at least let you know i=
f
>> we can reproduce the error.
>> Can you try using the master branch to use rust_1.60 ?
>> I doubt it will help but it might be easy to check.
>>
> Actually, the reason seems to be with outdated packages. I updated my
> recipe to a newer version and hit a bunch of different issues but they
> seem to be in cargo and not in oe-core (for reference:
> https://github.com/rust-lang/cargo/pull/10730).


Then, I'll conclude that this is now in your court and there's nothing
you need from rust/bitbake in=C2=A0 oe-core.

Let me know if that's wrong.

../Randy

>
> Bart


--=20
# Randy MacLeod
# Wind River Linux


