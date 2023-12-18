Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F41C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:00:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39978.1702889999704958876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rQg4IvHR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07166d5ec4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5o40e014728
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=g8NEQ5vem3+5xSm712PZYJXhvSlfq9rTtopZqF/8Prs=; b=
	rQg4IvHRFS3W1IJ08oMOwWMdhZf5CjGhp2lerszuhvSlFgl8CJrd9No5+oDCx8XP
	9RNmpHqR6oXTUV+aTLkG9BqtOk8VUpzX1Fb9m6hcy4rSyuBVz/UZjRAe31Z9ktz0
	CP1xhhhy/22GJM5ok22pGxH0k27gk2EqMaByHx3gLiiSV19CU1Jdo4pm8BHxN5Oo
	wMpABueVpEwBUyp/b9jzZ/DIXIA5+PFR8NZHzu5yBxS/wvYR6ZUB+TRK22LWjPfU
	9TZ/PL3e80qSujJwvzvWkj3R7Q/4sU1isaeesVkrt9iPUXaFxfsfbfICfMBQ1jPa
	/kgs2uTd9q9kHMzfIyDlRQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5sr53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:59:58 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BI8xwLM031763;
	Mon, 18 Dec 2023 08:59:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5sr52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:59:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePigsEHZ/4U8wTyC8XfP6oK0kE8FOJXfIhFKChk6jXcQc7PFiA3ELqJcnk30+GqYsZ6529B85jKv+qdWPnJXahZkJzj9peeyjSc67FDGM6ajaqGfG9BRSFUlqTNVUHOTxSnJ80eyJZa73nmr4jubKa46aottZLsnz485RAURuNGoIz1+bLXn4v/EGE5Fu4PaI++XVpx2uJoKQL2qc2SlPSFX15Zo8hzDMOqVO7XxRmZZxsl9LutK2JDDQYFzAliuMSNEUnjJcdI7Ilmn+s+HgPBUzITqDRPo+MM66k27VBTKCykEs6nMdARzdPjojOXx7qLiFgzPcNCqjV/GMFzPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8NEQ5vem3+5xSm712PZYJXhvSlfq9rTtopZqF/8Prs=;
 b=M65KJeOdYtm3T3Ur/dEFAy0XnoFJHhYHPPMlAB/2ZvCBbmOGEKANqcG/IQajbta0JlE+vTAx0znmdA8hsnnmrY+gLIF3t6cepG6ITLxuLHnMVsG8qoP1/boKiGkAeCftMZ87FDXkjn0CwpO7rnAax9P/c9QspgVtRbjadhPWT6Nm27SZccZzxTdPfxzD0mcRx8KZN1PGeN1JrfK1zpjlEmW8wNBhVhN83vKjIZInDV2MjcrfGVeKhOiTEUhTuacgtnPgSVdGNkwvI+9ndHrJveHrCBinV7yhprVaAtaKjFsL3FGxB+N9nzRaYGZFIhsec7jQlJGl96OhC5tNhq88nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:59:54 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:59:53 +0000
Message-ID: <b6f8b1b2-9318-07d6-c1f2-7d3cb260c2ca@windriver.com>
Date: Mon, 18 Dec 2023 16:59:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest
 failure
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231213102129.618430-1-mingli.yu@windriver.com>
 <90BE5780-D76F-45AA-9F61-E636420D62D9@arm.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <90BE5780-D76F-45AA-9F61-E636420D62D9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1067612a-d6b2-4a5f-303f-08dbffa7b2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Llm33nQt0IQoXaLFzsVcx3wKUok8dAHSLQ6eFvd7rekubKvImztTEfq1eQxYqLhwb3ZdU7fOcJFuE8AvLufL1fJwQ2eAm3rGJmMKmC8bMtabcuBba+73qFZNz+qCjQukGV97b1c1qNGUr9r+T5ekYjXQW1NzdBFB1Yd7wfydPun1RJoBo0N1ZuIoMUkXXjPjinICkYEZOyt011sPpzl7hbOM8eSa2ToCV7JJ3miNWiB2i4Gm9NilzDu0HKicjHEE8ieMmAzFJQ8NE1PKRCGEE6UfSvIBE6bSanmZmq2rECaV6EOg36sXe8MRIxUFbr55btKQm2VABzKQGQ8gh6gKzeD1nnt97kmWqAKehBPmc/A222WelyZuwrewjBzi0dhpMToxZFVzRhJBmMhj1aXgPp7J9mdVFNrhQp8h6wgJELlcEO3swGZH79G13pypJN0d9JIzFnWM/9XhPESpQ9BXAg6Bj13nnj5uggLupnZotFye1i8cf0TeLhmyifKeg3hLHQzPdWuH4F5TeiziYvp9iLLCKzp+3/jfbwYcmUhattWrBa/IBymVwTLAr7fuD4b9/job+JYKuAwtHHSTEkvZB/RLscGAsnKdLxLdM47PqFMhvr0AQU5CCYeTREF1gTvOE1IEkLfjnkRptYXuJFhDddc1j+8N98oJzlICs3gQjO1khYCDOLIWXFShyDV4/l7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39850400004)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(186009)(1800799012)(66899024)(4326008)(26005)(5660300002)(36756003)(83380400001)(2906002)(31686004)(41300700001)(110136005)(316002)(31696002)(6506007)(6512007)(6666004)(66946007)(66476007)(66556008)(966005)(53546011)(478600001)(8676002)(86362001)(8936002)(2616005)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWp5S04xYXNON3ptaGVPR3pxU1pFcm1wWkcwZEd1ampSZDhHNzRacDNydVdV?=
 =?utf-8?B?dElMWWdlTzB4dnNHcUgyTEFGakdoTi9lakdhVUxjWk8vREd3Q1B4aVBMQ1N2?=
 =?utf-8?B?ZFpydWFoWTBYRjVwdHMwZEFJM25EekFyVDByUzdTV2tMR0NsenJsMlRoU1dY?=
 =?utf-8?B?MVJtZ3Y5dDlhMzBqVjFzSlc5eGRoOGFORkVvbGY5YlF2UTVmVDgvM0hMVmEy?=
 =?utf-8?B?SCtnUjBoUG5IWkF6VzJuMHowNnpwTkczVUdvcStZQ2VRV1dpSDZmME5uYXFT?=
 =?utf-8?B?UFpuQU5HeFJxZ0hkNDdYc093RDJpSlVRcENjWTdWUlhHdmliMXRZc1F6NjEv?=
 =?utf-8?B?TDAyVW9oS2pLa0N3Mm4rKzVmM0pmV1BLNGxPU0dBVXFrVTBISU9LUGJDM2Y2?=
 =?utf-8?B?T3YxYy95d0p4blQ0bGFwaE1KVzRCWkkxSVl1YjV5OE5SdjlBWCt5b1c5U3FK?=
 =?utf-8?B?NTUvL1R6NWFlTXd5UHNTbDhVb0d2Rm90QTJuaEc5cTVNVlZKK3ovN0R5Vnls?=
 =?utf-8?B?NzFwMnZiZjhwUzNiaFp3ZG03SEo5eHZaeEMvSEEwOFdqUjVueWh4Z2tUYWwx?=
 =?utf-8?B?cmdtWFA5ak9pZFEveHRqZHpsZWxaTDVxSXhFQTFIaHpSOTJpR3I1QXFMbGNR?=
 =?utf-8?B?cnJ3enBtaXcyQUVYZDJyZ1VDdUNrSGZOeEx0T0llZnl2cGgxZHR2WFc5ZHN0?=
 =?utf-8?B?dGxnVGRkVlBJNmltcDFrMVViK3FxYTFzUGtWSHdScGdnQXVRTXhUSnF1VmQ0?=
 =?utf-8?B?SnFlVkczdXhxZzZoeDZCSmI0dzNPbTJraTJoM3JjUFV1MHc5WW4wT3hkL2hB?=
 =?utf-8?B?SEJvbkpDaGJEemJRVHpOUlZiV3poL1NoWEpGZmlnM1pXYmhtcThFN2prVU9l?=
 =?utf-8?B?Q29GNUhyUVNCdFVONURxbFhNVW9TZUZHMTdteDdZY3NMcWVzNzhKMVNjY3Zl?=
 =?utf-8?B?WHpuMHJmL2V1LzRQMWNmSUtvNmdHc2VDYWlZK3hHN2xVZnE4MEtITHl1czZl?=
 =?utf-8?B?S3dUSzR1cldidElHYmNUMFlHRnNBMEdHRFdsaFpsZFVvbGJHTmNrWVJVSVFF?=
 =?utf-8?B?QjR1d2RUamxxUDNnQi9CbENUWFVRaVhzYTZpZHRTTE1KS1gwM2djeXpKcGZX?=
 =?utf-8?B?RGVEOEpXZ0VQM0JrcUFnT2JBWEUrU1krVnRjNE9RMk9mQ3IvS21tbEh2S0pv?=
 =?utf-8?B?UXJkMnpjL2NMS3VUQTFTUGVHN00rN3NRRkR1ZlJYWnFVM1d3dUlRZGJia3dk?=
 =?utf-8?B?S2FieUgxNGNkN2dFWnhwK0JOMXJndlpEL3Z2dlZkdU1Uam9hRW11eWRycm85?=
 =?utf-8?B?MExPcDdyTS83SS9ZdjE1cUo5REQyb1Z5NEI4bmZQU3I3a0lESjRPK0tOcXQw?=
 =?utf-8?B?YmlGV3BDeUNhZHFOWmhHSWc4dGYyRnViNVBQamkxSDRqeEdoOWZLV2pyQnRR?=
 =?utf-8?B?aG9CdVNRT0IvSWQ3blcxTkdta3VmWWEzMDlpWWtaWlFBTGtTSHUxKzRiYzFl?=
 =?utf-8?B?dVdnR3FjYVNGOWZ2Umhtd0RyRUhpNndhWmsvYi9mNUgvQzBDcTVDRExhT2lS?=
 =?utf-8?B?QXdUNE4xamM2NFpXVFBOcUducCt4TFk2TjVCbit6QkhZVFVjRWFSOG56OU01?=
 =?utf-8?B?WDBLb1A0VkZ4N0NTN3dYS0lmUlZwdEpUcFoyWVpOZitpeWxjNTRjcjg1cC9w?=
 =?utf-8?B?M1BHbE9Sd0RYOVQ2UDRWU2pJYmorMjhNOFZOMUZhMjdCQUJoMXBqU3RKcFJF?=
 =?utf-8?B?M0dDYVRkd21xMFk0cnVRZnlJSnlNYUpsV3UvbytuanU3SWQvTEpiSkJaU2FU?=
 =?utf-8?B?MzlxREd1bXNRSE9rdXBOczZ6VC9SVmxVOHNwc2lnanJMdFM5T3AxZlJmdTBm?=
 =?utf-8?B?Vm9kOGRxUlVGWVAzaU1nNk94d09hWTg2c01VdGV4ZkVoc0xYQ2Y2SG85MGxP?=
 =?utf-8?B?NkN0UXdDZ3NKMEQ3S1l0bnJBd1ByUDhGYXhYK242KzRoUzR1WEoxdzhTemRo?=
 =?utf-8?B?cTBIeU1yUmN0ayt2T0F5OGFKdEpsSFpVT3RqWkNKVTB2R1NGSi90a0crRTJ3?=
 =?utf-8?B?SldEMXNyYjA0aW1TS1psRi9oQnZDUm9oNklXTGtMSXVFMlpOYXVjcUpLZEZu?=
 =?utf-8?Q?osJe35cKy7Lz48uJNl1W0DmHg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1067612a-d6b2-4a5f-303f-08dbffa7b2bd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:59:53.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kdvrXwOGg0hQSdM5WR6fveYnkc2pXM2QihtaW0ESK4C14sxEEq02K6AxaD/tvir1OZgB8+gpVQ1p/bU48DuiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
X-Proofpoint-ORIG-GUID: hYYg1_cA43Gyl3pshJ7tLhiN31i-r26u
X-Proofpoint-GUID: GBFmiLLZelTm0SOqBAtjvMNRI29QD4Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=669
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312180064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BI5o40e014728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192619

Hi Ross,

On 12/14/23 02:05, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On 13 Dec 2023, at 10:21, Yu, Mingli via lists.openembedded.org <mingli=
.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>> -pytest
>> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]=
//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED=
/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP"=
 || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else=
{print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP=
" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}=
}=E2=80=99
>=20
> python3-unittest-automake-output has a helper class to do this for you,=
 so you just need to "pytest =E2=80=94automake=E2=80=9D.

Thanks your suggestion! Will use "pytest =E2=80=94automake" in v3.

Thanks,

>=20
> Ross
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192309): https://lists.openembedded.org/g/openembed=
ded-core/message/192309
> Mute This Topic: https://lists.openembedded.org/mt/103146950/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mingli.yu@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

