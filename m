Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C17C7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:28:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1887.1685471315078748861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 11:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=TEKplrd1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5514be20c6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UARsPx019326
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:28:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=JmnGRhebO61X/yQSipzYGT9+TW9qnSI2GbAOB6Bmrxg=;
 b=TEKplrd1xddBXlA3tAId/0gEK9755lWmHFhpYHpBHurr7XVxIawRaiwcfhDK7Y2sTRkj
 k+WnHTtrit5WLLzJflLbUagL3WCCLr/9yPenkUtUj8zqL3Rs4NaLsMkQsq0nrrVtY0lt
 HNG6zM5eAipL2iy82TVf8+3uCN1throD7TwKh5VbS/WaAzy9zXz4ii9FIKcMIkttFu3U
 C2XKYuivpu67FTE8tEywOn0tG1qbtPc+gwCuLA8X1DvAbnM3CrjxxOLlqBcbWgAtiFcp
 BJkVYClazmSleXaJA4ke4InTP256jfXsOVt7+pYoOeMDZHUCN1xrts8/Qjg/uF8E+DHg bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjaj7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:28:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34UISYb5024930
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:28:34 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjaj7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 11:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWVDZB7eXGu4lsJgyZ9FcbAyvR4XuZLzXN3MHM/KtCwsSeUKa2E/FeOfj7c45zGY36jNXkJYp1OCbQGaYZZLs+vqjny2zhbHjAJQSq55dJ6cf6Ch+BOG+aCVnxdSdCs4QU9S9qTRz9tyN3CJmA7tmiBX1Jh9XG2fFfPReHBmmDBHLlB5K+uBQWQZQ/jq0/f192edK0Lf0VnufokffUlfw1QgTFAAqLG1FpWVgaJ0FM57cWflGkRR2T47DuZZcbQYDAjhal8H9xtGwyDF40P5dxNBPi5pO+pkF52vG0iVjfBHReBYBAH+VqFThryuhHSxVa7IxXX+xoTw2Dg9OXWAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmnGRhebO61X/yQSipzYGT9+TW9qnSI2GbAOB6Bmrxg=;
 b=QgYzlwt+w29471xqCEbrGyRgt09FfoHVVZvwOokaQgIMA4BLXlhmSk9JKMfEgrvLTBr7Ve3OCQ5VR8ULHb8ptaQjxfla3MkmSJfG7Am2mz2qfWBRlYNKStEmfEY3t1sKaTvIHv9n56DWUV0QbH5L0aIEh9ueuzdY2dL3Kx9XM1zc8iarvKbE2IKF8Eek+N0KbVKqdmwWhdDlvkLiLLWz+3fhquaStJjsueZidy7HbdvUo1LEtoI8yQfceSSTFfXhcho+ehsOGCKCXjwW/fd4O+bP9lIG+2KTHC1GrCxZhXfSFOEyAvT36+TlWK7U/Asenyf/b1n+9yZySB700PSP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 18:28:29 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 18:28:29 +0000
Content-Type: multipart/alternative;
 boundary="------------DH7HKaRiaF9ZzW0NRLthb7VA"
Message-ID: <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
Date: Tue, 30 May 2023 14:28:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
Content-Language: en-CA
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash Shinde <yashinde145@gmail.com>,
        openembedded-core <openembedded-core@lists.openembedded.org>,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
 <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
 <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: cf558fb0-762f-4e31-1f19-08db613baa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vpVCjcSFqtZt3HUQkxiU8OtbXJxtOkAV3LRx0+bCm4jsO1P7uG4i/rj8CE+b1Z1FJyJ99OQYvSmxCKiDBNHMFwUBvxC9YNTbUprtpAISsOC37TMzKQ378EJf0egBu7fDXRynkKHLFuqhBTBK7BZ/Qjkl6nxbAiNySXxH7qyBL++GOL8gdrB6pQ57vT1xl4sXgSDidRJnPRn7LWOP2OhPqXVoqTQsniwFbbzjIBJCyMrYXlrw2CPUCfFZ2mzt4zlmiQ8PD+AnO9R5iccFN46x2+43WWpc92DPMok50lSWS69IbJyn6fK9feOS6/FX9NZXOWsKkzloP1umsZmlMvhcElwHF97FxiRvPY7e8WWtOHxONKViJfBFtvAhUlHTIM2c1+hdDQxtPxBD87ww43xQV1DFHA+kycvJD29pz9alCxmMdZoPCBQ5EjZiSHcXQHz4OEZIt5mT8wsMLsaFGGRvVBXoc08bEwhvzxVtKnRRVdMJKI5KlxvyNAKNu+HXF0FSgYX2Nj5nHLJUi1FyoQqKezSz5WjBl7kK90aLQOTPlOepgYGyFjeEwwVV/rEpFOJFobRGnINZJ2CNSo8m3wQ+OjSlgJzAk4UM0z8ie1P5J/kJCiZrEDrpzmNE/oR32lF3AA7dRiNNRBnnkbEQWpqt/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39850400004)(376002)(451199021)(316002)(8936002)(8676002)(66476007)(66946007)(66556008)(41300700001)(4326008)(2906002)(54906003)(110136005)(31686004)(5660300002)(6666004)(478600001)(6486002)(33964004)(966005)(6506007)(107886003)(6512007)(26005)(36756003)(186003)(2616005)(83380400001)(66574015)(53546011)(38100700002)(166002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2lDcVppQWQxK3dIZEZXTHpMWlRFZWFobXZqTzdyUC93a01XQzYycWVHbnNh?=
 =?utf-8?B?VGRMa1I2dzVwTkNCbWN4NkZXRWpJY3RtSnpaQkExQjBsdnFXbEwwY0htNmVm?=
 =?utf-8?B?OFRZRGdPcmw3OHEzTXFLVXkxOGRsRDRzajhFcnRZeHhDME9Ield3cW1hZmkx?=
 =?utf-8?B?UE5DVWUxa21hS1NocUhLVktDc0tmRjhId2FnbE1ON2xnMzhmMG1hcG41TjAy?=
 =?utf-8?B?YjcxNXU5VWxEWWgyaS9ZaFhBbVdvRXZKUHJBdGNwSHNJaWVnSWJnVGl1Ylho?=
 =?utf-8?B?emZtTVNiaU9rY0ZEbDl1eEdjaHhiejM4SjIvTElJV3J1VHpHa0k1cGpWMFVB?=
 =?utf-8?B?WU9LMlpYaStzeVhxWGdvVExQVmRtcjFtOGNzRk90eFhmTElud0V5bzc0bEd1?=
 =?utf-8?B?TG1ISnRzUmw2M3FNYzcvaVFDN01yQktGTHhuNHhxV242bkJnTHlNbmVMVE11?=
 =?utf-8?B?aTh1N3p5Mkk1dWZDL0Q2cjBXd29PUXlDb3BXWkJuRGlOT2pZNWZCMHVTeG1p?=
 =?utf-8?B?bHVRTGhDQUVmcUFobjBYTlZjczVtRmNHUjl5dFdZZ0E3OEFjVFNNVGQvUWtH?=
 =?utf-8?B?TnBGR1VXaGpFK2pXSzU1WTN6Yk1mcWp4Y2tzbVhqM0tZR0Jyb1FxQVF4Qm1I?=
 =?utf-8?B?cTRMd1ZZbUd6YmtVKzNJRThZT2pIaGIydTgvUEhEM3VMblF2dnkzQUx2cnRC?=
 =?utf-8?B?YU5BUmExU2NUNXdJNUlwakppejZMQXNWa1JzSUFCVStiUTkrV05CSW9wdjVw?=
 =?utf-8?B?QlZQNnN3ckpLeHJHdjR2b3ZjZWNIK2ZCcENwdE0ycjUxOTAyQkJZUkdyaUVi?=
 =?utf-8?B?b0VZTmZrdU5WU09nRUdGTTlOMmpMSFFqZG5qZ00yOVd6RHhuaHdxT3ZjcVlC?=
 =?utf-8?B?S3hWTXpZL2c3a1NnMTRJeHM4c0RaOXZjV04yZ1B2cFE2UUkyL3VpOFNRQ0F1?=
 =?utf-8?B?UUFiMnJYSWxPampmTm9ldk5ZKzhvdlliQ3lYRENubG9COEFNcUVFa1NzSjdL?=
 =?utf-8?B?WnVSU1IwTWRvb3l4cy83TTgwTm5KaVU1b0duYUhrUkFVa1V6a2lxa2l3RXNs?=
 =?utf-8?B?RXhkQmRxNWlMMDFYRVlxYmkwaWtjbm5GdjByV2tyYXhuVXZ3NTZ2Z0pvSDZs?=
 =?utf-8?B?Y2FGREcxOHN6eW91Mk9qbE5pVlNsQWRYbmdjemc4ZlMxOXdSeUlFT0t5L2Rt?=
 =?utf-8?B?eTBRaG5WRVNOUHdtZlVQUWJwU1hQamF1QTFrbGRVY2pqcGN0NXhEVzBKbFpa?=
 =?utf-8?B?T0U4VXNDNUFTNjlNQWdGWmR0clJ5MXlvQWZlUU1TR2w1SUxoczlpc2Nlem5s?=
 =?utf-8?B?a2JiU0ZueG5pN3F6SDRlNVVEQ2tZQnByekw1Q05odmMzeWhrOGJnVWI4TkFn?=
 =?utf-8?B?ellhd3RxMGRSdEdEUGNrY2NGQmVxK3hoa3RmWU5PNTBQamRib2diRG9xL2Fn?=
 =?utf-8?B?ZmE0ZWxML1hucGQyckFON2MxVHhHblNBZzlSend1d2RHdTFrMjZ5c2Z2ZGk0?=
 =?utf-8?B?RVRIMCt0Z1IvWjlOc2hpL2w2WEJLUWorK2tRYU9YS1pEcTVFblA0T1dLeUFU?=
 =?utf-8?B?bXROMlBVdHZuNnBGUUNhQmt2WU5RSUFnR0JZSUUzR1JpTnlpbVFYbUZtMHNY?=
 =?utf-8?B?Qk52cnoxeGI0MzRPZHFrNG9ZTjdjOFNTOTBrZk1qUmhKalpDUzM4RXpzV01O?=
 =?utf-8?B?eEsyQytPdVRnbm5UaHBpNytyVEUrcWRyZEIwd2lQT2Rya0tjYlNlYjduait5?=
 =?utf-8?B?bmxwN3lRZkxST0JQTlYyOWNXam1STGdrWjgrd3c2d2dGcGFkeGNLbEhhRTRW?=
 =?utf-8?B?RUVEaTY0YloxcHNsVUtCZ3hxTWZ2TjJaNWMyRWhXU1Z6YXBJZCtwTklMdnNz?=
 =?utf-8?B?MVlRcXIrRjR5aUVaK1ptTGJoZVRzVWNmd2xLM1FRRmpieUg3bWRSV2FVMHVw?=
 =?utf-8?B?SzNKUEdBL0w4azFPazBJVCs5cjhVMzBHckJZYzdodHh3QzkyUDFicDc1ZXZF?=
 =?utf-8?B?VE5Yay9wWlQzNGtLK1NqYk1LWkphc3lJaE44NzhsT1NmYU1lZjdRWGJ6SU1T?=
 =?utf-8?B?ZFY4Nm4vcExrT296blk1WWZTSm5neDFtUjFRVVRNRUN5R2FOYVMxKzE4NXdP?=
 =?utf-8?B?aDJhYzdWNCtqR3k2MG50STRxVXUxZHZIdldCRmJ4OUVCYWdVTXpuVFVTR2ZP?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf558fb0-762f-4e31-1f19-08db613baa08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 18:28:28.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3wlTWkhRSI+xAaSwqk9jsq9sYd9HgJJWTSgR1CrRRZuA/QOgDLa5zROuICn26erXCvASAM16oECVqrfetF2lzYRaGf585Dsf/4oGO/nMlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
X-Proofpoint-GUID: rYsUz5k8mALtoSxnOXDmDb5k-YJbrF7Z
X-Proofpoint-ORIG-GUID: OGA3T9ZC5BYbb6Zk_8ojqL_XOGqpw0Hf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_14,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=984
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 18:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181941

--------------DH7HKaRiaF9ZzW0NRLthb7VA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34UARsPx019326

On 2023-05-30 11:05, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Oh okay, didn't try that personnaly.
> the class is currently tied to cargo behavior so for performing rust=20
> core tests, it will not be suitable (at least in its present form)

Well, that's good news in that we won't have to change our approach for=20
v15 !


On 2023-05-30 09:59, Richard Purdie wrote:
> I did put this into a build for testing on the autobuilder. It hasn't
> been running long and I can already see build failures such as:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184
>
> and there will likely be more.
>
> I'm finding this rather frustrating and am not sure how this was
> tested.

That's probably my fault. I've been asking Yash to keep pushing and=20
suggesting that
I could help him with testing but the bad news is that we (Wind River)
have the tail end of a product release cycle happening now.

I'd like to help out with this, but it'll have to wait for at least 2=20
months and
that puts us close to the end of M3 so we might have to wait for the=20
beginning
of the fail development cycle.

Let me talk with Yashe and Sundeep and reply with info on what to expect.

--=20
# Randy MacLeod
# Wind River Linux

--------------DH7HKaRiaF9ZzW0NRLthb7VA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34UARsPx019326

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-05-30 11:05, Fr=C3=A9d=C3=A9ri=
c
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+cAkeqPd=3D5dodJ_mfEv_w-BsvfU=
CE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com">
     =20
      <div dir=3D"auto">Oh okay, didn't try that personnaly.&nbsp;
        <div dir=3D"auto">the class is currently tied to cargo behavior s=
o
          for performing rust core tests, it will not be suitable (at
          least in its present form) <br>
        </div>
      </div>
    </blockquote>
    <p>Well, that's good news in that we won't have to change our
      approach for v15 !<br>
    </p>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-05-30 09:59, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:7c9a0a78204958d84c4a3779da7c0f1=
b0e66dda8.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">I did put this into a build =
for testing on the autobuilder. It hasn't
been running long and I can already see build failures such as:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/103/builds/6077">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/103/builds/6077</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/7200">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/45/builds/7200</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/40/builds/7190">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/40/builds/7190</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/117/builds/2923">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/117/builds/2923</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/37/builds/7200">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/37/builds/7200</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/48/builds/7217">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/48/builds/7217</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/104/builds/6080">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/104/builds/6080</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/76/builds/7146">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/76/builds/7146</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/61/builds/7184">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/61/builds/7184</a>

and there will likely be more.

I'm finding this rather frustrating and am not sure how this was
tested.</pre>
    </blockquote>
    <p>That's probably my fault. I've been asking Yash to keep pushing
      and suggesting that <br>
      I could help him with testing but the bad news is that we (Wind
      River) <br>
      have the tail end of a product release cycle happening now. <br>
    </p>
    <p>I'd like to help out with this, but it'll have to wait for at
      least 2 months and<br>
      that puts us close to the end of M3 so we might have to wait for
      the beginning<br>
      of the fail development cycle.<br>
    </p>
    <p>Let me talk with Yashe and Sundeep and reply with info on what to
      expect.<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------DH7HKaRiaF9ZzW0NRLthb7VA--

