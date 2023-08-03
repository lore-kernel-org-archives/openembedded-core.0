Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FD1EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 04:46:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7560.1691037992685180683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 21:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TOc+/51Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75794de740=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3734kWWd013683;
	Thu, 3 Aug 2023 04:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=08abJBMgnDpd0mS1vX4ySUyEQegG1Il/BAYNsoILfm4=; b=
	TOc+/51QN8NavEgT5NE0Cj9x7NygxVaOfyuwT5IOYJFH1fDaClgGLOpDS7PD5bPn
	vmHMuEzUov35NFUTxUHAw668r27Q7Q68CI7CZlky7TZEWU0/TyOSs4zTrCsbjpSt
	I2f9hBLntRTjuE1Wl2mZKKlMODn7zALnKB3nKsei2WY7kx60cCvQxleutXeDvosm
	C/ocCDdNHqcsp55QhVV/i4kDj/izO/xr97PY4OyrtjXFBSDjepFrop+lJNXrL7wW
	c2SLRlN8epRIy1mR4RpbTz6cjcbfJTAn8sL/WFgZarajOqcvqmhyIPYpBzGVvme3
	TVh30V+2DJ1NgV2CZAwpdg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr64fj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:46:31 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3734kVZS013678;
	Thu, 3 Aug 2023 04:46:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr64fj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 04:46:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMYtWIVk+cFNIDRQEwPuoSPgFBmMFsOdZHmOZ5LYkGco9e94n/FLXHLYECiinNNYvTkml7J3FX5JSLXCn+eAWkuTFuOCy6AE2gWgACivHK93EROBsb2SNzj7e/LcsFgf53kZzbVL1dlJB+m/5+lOt/BXEKg0ZGLOYKwLpC92A2CeSXVLqqb4z/EpQFXG7dducvrv5H15lBwEEUsDajjhK98H3SpLoNNbsTr9SUkDOfVR2SiNaSCEuPK2rWBVLPcFL1WxsxEWUkYBi07laoaexvEsMsB0/tS3wf0BqCpjshPyDRuExP1JNv+tx8VjqZ0157igsKy/HTGsYiXhD1t7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08abJBMgnDpd0mS1vX4ySUyEQegG1Il/BAYNsoILfm4=;
 b=ZagPxhuo6JBvNFhbgJDPoGoxE+k+QpJhyKf/DFUPy7qIeA5slxuzeOKecbFvJxhoWlrHuW5VyTxj2IrdfD7wWd9XaPnx/aTSMr0sKOOe3Do4+Sf5SPPhbRQbhtF9vZVe/QxcydsAeD3oqkedebZjHZJtM554O537yvQMXvyrNBdusUg6349yybEAR4jnrPpPMqf+uTbGnhpjo9YQCrknt9Jx23y2g1wmVwTdCDNHsdM2oN31K4EoZPmllGLkgPyn9DvtC6v/nCy5nMsEj5kDjXOJ6NvjCAODzUZiYmpYBaGZhqq6L8aG/bERLPoveNnTCpNvPBSiRMzFvA6y/mpfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 04:46:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d652:714a:1aa2:382c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d652:714a:1aa2:382c%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 04:46:28 +0000
Message-ID: <047729f7-53dd-e37f-f537-465fd0591958@windriver.com>
Date: Thu, 3 Aug 2023 12:46:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] qemuppc64: Set the default memory to 512M
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230801094823.4007276-1-mingli.yu@eng.windriver.com>
 <CANNYZj-B1hAkm_cRa+LPegNE7CpWBOZ=v3ZLg7=9K5-6q5R4MA@mail.gmail.com>
 <2428673e-04fd-a745-38c6-9e3c18f51cad@windriver.com>
 <CANNYZj_9iqUYACMUmXYLdJyHpZowjawTeGpPY7g+71AUQSDdew@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj_9iqUYACMUmXYLdJyHpZowjawTeGpPY7g+71AUQSDdew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 114b4c27-3200-4fd9-7f1f-08db93dc993f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uGcXCJAnKiAyTEFKd78qflWJZUeCIumsGmOYUkCiQS+QxU2dLcjQ4PdDnPnHWcFJNukWRoJg0A3M3Ne2afb1320uMgzZsCFUxM0pX69UN8miESGW6/EMbeg5I40a/a23khYH6JZg08t2j0QykmeO7km6xGGobI4pgcduPjeqHvAp06DvBHVDIV7z+5u+C8qZB3kQcWAdvzrjYd2v8p2CBcu5SWUgWPm2wSzPG99rlcNh/M+DpBm36t7a/x+CfvKzUFcnFSzxPlQT04H4rPsE5Q1t8A/RV33qMRFdzkpQSbldzIOo5WNR9XXE0lG+5NJUhniBnaUeIJuSlGPMdpn6MRl49N+KUO3JuR9L+/yFPkHge7p6kHHB35J/D7JhrrNXJQ0LuQDBaVoaFTz2qJ8cET9dFU+d+xB+4SItFBKFEcupPLpU3SA4wA8UKoagIiYDCcoL0bSa1IgGM9IxZgmtD5DGa2EmGxnFiLTf2QwFOaeILrbyNK6WDK7yfKu1mmYe8za4/AM41Hgo5BFL57imTHC9Z0vpQFhWFJkBLhxSwv1pRVwbVzNi2uURcWmaSERV6hYUQkeHRsC8IN0ye9lp4W1+Vn/1wyAP6HJCaNltkqbD4nQBWvo+8QnS0iZf+VVDulVBK5tQJQdnF8fRnpwaYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39850400004)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(83380400001)(4744005)(316002)(2906002)(66946007)(4326008)(6916009)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(6666004)(6486002)(6512007)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ly9HKzJkQ2ZGL3BYWkpiRW04Q3IxZjgvWjlhRFQxYVlCREpIcmFVQ211MCtY?=
 =?utf-8?B?bzB1MXBuTXBDc2ZPSjdPdTJZWmFIVGwrOGdyWFp4R1VnVy9rRXNva0xqckFw?=
 =?utf-8?B?SDhXRXdaVko4MXArU3N2NnErNkVCYjg3WmpTNEx4NElnVy9qdkFzRmxmWXBW?=
 =?utf-8?B?eER4VzdHWmUrV3JjRVlTYTE4QnNINmYwTk9vcTlpUDFUZlBDYnJ6RmJJWVBI?=
 =?utf-8?B?aXBkZjJIbEpIWThMbE5DQXkyeVNwQzhVelV6T3hGMk1kZ1pTQ2diZlA5OUdl?=
 =?utf-8?B?NW5ZZlpZdVRkd1pYb3JzSTZidUUzSFgyakR0cEdCeTE5T3B6c0E2Rmkrc3Rk?=
 =?utf-8?B?U3BVRFZUSlBoejFnRkMrUWhIcm4xQzV3U2tISi84R0xadCtFRlRvdStqbTlI?=
 =?utf-8?B?Vndoc0ROMnpLQXpYcXF1S2NJemxKR1FYcU1Eb0xvTW5iMW9vUFlvRlFCWEVT?=
 =?utf-8?B?Qng3cWFYVlp3MXU2SHhVR043VGFGWklYVzJwMjV1K0xjVFptcDB2dVBGNlM0?=
 =?utf-8?B?bnVUblU5dndqcTdVYjlPZXJaWFROTlo4Z244VnpCaDdLdnVBVmFmalJEUVJw?=
 =?utf-8?B?SlM2ZHh5UzA5UDNnVEJpSldQak01QWtnKzlYckNZRldJUHFlOWoxNjlZK09a?=
 =?utf-8?B?Uy9OaDNkQnhSTlhQV0k3ekZDYUZKSGJIY1AvSWVpVUJTWDQrNlhKOVRyZmti?=
 =?utf-8?B?aFVDTUJHYmR3RmtMTXV0TE9GcWFzT3hyaE9tMmFja3hMZGR2SXErZEp5SERU?=
 =?utf-8?B?bVlMRVVpUmE0ZzdZMmMzSWRBQWlBVkd0amVBVmlITENsdVVzOFZKbGhyTDF6?=
 =?utf-8?B?elA0ZVlualFieFpLT2g0Rk1NZzRsWDNGUk5jR1pHS2RXTmRSR1hUZzcranMy?=
 =?utf-8?B?OG9lMjJwZHYzdCtwK0p4cWxzMW5HYThJVEozbUMwV1RaNys1UFJrOFIrTitJ?=
 =?utf-8?B?aUl6L1pJSGVBaTJpSE9BZDlla2RzM1JFTDZ3WHErWkhaODV6ZHNjT1ljZUI3?=
 =?utf-8?B?QklpL254cE1XK3kxMlQxUVQ2cFNQRW9KWk9JMURyeTBUT2Y0YkhVTVpOK2tz?=
 =?utf-8?B?ZHZLNXpMdGgxME1ESHRaWk56SUMyYUg5OXhlREF0RCs5azY4UzNydGYvZjBv?=
 =?utf-8?B?aElGWWg1L2RlQlZ4SEdHNVk0ekxjdkQ1bEptQ2lPYTZkbC96WWcvbCtwYXIx?=
 =?utf-8?B?UFBhdnBkNnZKSStJYzdybDVmYlI1OGJzZkp2SVFpSjA1YzRicFpNRmZrWXE4?=
 =?utf-8?B?Nm4rSXp5ZE9kQ2toME1IaGFGNHB3Nnkwb1VSOGZOaEQzMUV3M2svWlNFT0Q1?=
 =?utf-8?B?cmtZUkhRTlNXdDI5dXRVUXJEaFRRQVJ6MTBJZ2pOR1Zpd2tSaS9TZzAyUXcz?=
 =?utf-8?B?czRheUpweXQxNjBlL3h1TDgxdElxR2xPYnMzaGROeWIxQUEveDc0MkFZVmxR?=
 =?utf-8?B?NHAwa2lKWm0xTGZydi9wekRFRmVVK2JLT1hJemJjemNKTE15TnlPdGpUME9G?=
 =?utf-8?B?VWtxZUVSUjFseW5nb0ZHeGxLYU9BUW9TdGxia2R6S2szUWpaQkRwc2NFTUND?=
 =?utf-8?B?OXM0VzR1NDF3dWpwbk9EcHNNSnBVeXdiekg2Y3lBaWVnMlRWZlg2c0w5LzM3?=
 =?utf-8?B?QnV1TTlHaUdiWU8wckpTeWEyYXhwVDhkUFE4RVp5cTdFbm0xYm5BbE5TZGZu?=
 =?utf-8?B?aDNQTVZpd3pGeWVVOTBxSnFsbkNQbVBmN21XTnc5eHV5SzVKbU9iL1JnVXdu?=
 =?utf-8?B?MkJBQXB0Z1NNOXBudjJTd04xUGRZWWNNaGtWd0ZjcG9hVGFoVmU1OEY3aGpp?=
 =?utf-8?B?UzRhdEJCaG1ZN3ZobVpzOUJvblFEaGZyNVJVMFhrajU1bCtTclprMXhGbUxI?=
 =?utf-8?B?NVRPc1dXcyt3QTV2eWpZN2ZnSVUrbzBtS3pHU0tPR255N1RWUDk1YzdrcDBa?=
 =?utf-8?B?RmMxRVNqOC8zSHFrYnJmRVVtS0RyOTJjMVJIS3BkNVk3N1IzRFFONFRzdXAz?=
 =?utf-8?B?Q2hKeUtzbW9icGpFUGVHeGVRclFId3lVYUw1bFg0cmlWQ0FYbG5lWDNBN1hJ?=
 =?utf-8?B?Z2F3SDZVRUxzcXEvbHNPZ29jdHA3cDhDd25RQURkb2dHaHZsMTZ6aU9HMjlY?=
 =?utf-8?Q?FyedgUXPSzmi5yvQZDMU8mPO7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114b4c27-3200-4fd9-7f1f-08db93dc993f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 04:46:28.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTQ/Qt2rhLrfaLtYJ4OJngC+wCHbkwva5M67ZCf5aTwz1SjEBs5MY8b/FyIcJVUvb0SmeopDMSZ2z/WeZOd9uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-Proofpoint-GUID: Ng07j6AiLoHV6yYOoJEF1WTzx8InMLuZ
X-Proofpoint-ORIG-GUID: hCnxZNlMtLmwlbaQlV8LBB7c32UaWhzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=920 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308030044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185453



On 8/2/23 16:32, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Wed, 2 Aug 2023 at 10:30, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> Did a simple check against core-image-full-cmdline with qemuppc64 just
>> now and it can boot successfully with the default 256M memory.
>>
>> But it failed to boot with my customized image as the attached
>> messages(/var/log/messages). If not change the default memory, how to
>> resolve the OOM issue? Any hints?
> 
> You can set QB_MEM directly in the recipe of the customized image?
> Oe-core does this in several images which have specific requirements
> for larger RAM amounts (e.g. test images where the tests require it).
> You can grep meta/ for examples.
> 

Thanks for the hints! I will have a try.

Thanks,

> Alex

