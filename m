Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BB8C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:12:52 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.27731.1639498371112191760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=TOIKmhfJ;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=798258f306=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BEAeID9032718;
	Tue, 14 Dec 2021 10:12:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=hUXJWLTHfNuD7OL8smvyeBmjEnRapjbeLxW3azQzPYc=;
 b=TOIKmhfJseOgmVCr3V957z5qKgBNAgEYRgSe6axKFpaGrDBNFO71doLOOfHoSpAkQkNY
 hrBulC5UbQcB6QjjLGW7L6ZOSQMJqozv1WKv0+Q6UA69jn+FpeVCC5u0jlvt61n8s2Wr
 DLZO/sHPHM2c6m6QFk1kz0T86b5hR6A6exND0GWzhBvtkoHavohV6jirLIBSb2+SrBSt
 i8ASL1N1MZU4vk9Ub9WGxnZhY6hyEW2tKcxQIPx91qC1omm0a9jVymjLAlKRxCBxknMW
 SE7MZLAgFsarvLAFh6y804aTc6lRmWAN0JvGZbXKJQ98xsSDxhqM76KtwhVnjNdJJu9c ew==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3cxawvjh65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Dec 2021 10:12:49 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kthpKJRYlTsGSLSoM/Sv8TwtXz2V2om5iZOf2gqYMl9he5G22kG7N+zCadbEp/Jk9TmwVP3meamdpIMFcGQtk/u2vCjOIrn3u/5Nh5T05YU8lStv7C7zgGZZVlZQgsG1sbTyWdvHsjgmZSIwb5gf6fwDz969fVL6iSayqTjN3ZDNho8DJ98Z6QCLtE5yCEfJWbf9PjuVLsedxinSs/IUHhSPqQyTR0xKB1e8mC8+oJG0cgyQYK7zOKJ5T+H0E1F5efwd5VjLpoNVpijEBAAXOdBkFouII76zSqcz+QxSixmAFx7AJoUAU7f5lWhN2jYlFHZOoJJxwANGfB8raxnOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUXJWLTHfNuD7OL8smvyeBmjEnRapjbeLxW3azQzPYc=;
 b=mh4sq7AeW+FUgW3VnH4zHaZhZf6ceXlhEvrVTyiFobvvQhgMydGhOaw9nTgN0DR7zwvr5fdxrh7SYG01ZBeXq0dF7IRMj81Jh4p4ybqDSZXgrDi84XqIxipU8iaSk4TM72A9umEJqXPeHqaf9gxmyP83AJkjngr3ZSBo6xTkJhFV5Lci4UVMDQboiU+ZM+OJ3xrrCitEJDA7d8xZwUZoEqt5M9cWkOmaXWGa458Ht9N8deZdDfVx8oLV4mS3gZvbUkZi2eP7Hp5dIqB6P5nVL+hfdWjragLsdey/bHFyFrrIx+4VhDSoTaIaWyNma+F1m5Lfnri/xmqTBVBy77NovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUXJWLTHfNuD7OL8smvyeBmjEnRapjbeLxW3azQzPYc=;
 b=XOicp5mL5EpBikfW/xDgiRSyPynKEYQa5fIlyswWasO7dSUK8twZ5gHDNnJYz+SBTCFeh4iO5YGrjQsgcHFPAu0YMYtKYYiPvjfRYDDn8oWPFKq/KmRSVrPSDyiP+8oqlrnSc5OJFbcbzjPlP/uY66ZNHS2r3OKdKb8ygeTIIdA=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB4224.namprd04.prod.outlook.com (2603:10b6:805:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 16:12:46 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67%5]) with mapi id 15.20.4778.017; Tue, 14 Dec 2021
 16:12:46 +0000
Message-ID: <62bb8182-6496-6896-54af-0530b259d005@ni.com>
Date: Tue, 14 Dec 2021 10:12:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] The state of DKMS in the Yocto community
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
 <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
 <CADkTA4P1OW_KGMFoBa5kPGb+zGBc4pkS0v+JHDbDF7+Y5LQ9ow@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CADkTA4P1OW_KGMFoBa5kPGb+zGBc4pkS0v+JHDbDF7+Y5LQ9ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:805:f2::41) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7096db4-550d-4858-d19e-08d9bf1c911e
X-MS-TrafficTypeDiagnostic: SN6PR04MB4224:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB42241522B90995837E1CA12FFE759@SN6PR04MB4224.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ftO4s2snWCeqwbdPnMOvK7Gai9y3C9UepMJcQ8DZ5AummxlauxW4q36IkK12nXUijbpChGvbV5w8koS+oZG7LOme1z3cMr9D0oRJiP1WG/vrl4AXDlY5Ls6Qh/mjsafhUNfO2igRIYXLBSDLky8bOJKrHocYX+ZkWTRI86FsCOlmUzlOH6+0kgufZ5wOBPg3aciHiRsSyLOpjHnOkfsdG5UrB1LosZ6Xsunr2oRQj+wJFQHdirDRRGqW1qvJMjLnwH0oKI/QcZDWKYP4DKWbk16HruCNLJltfaMcGJ9jg8EW6RvFINSWiKe6Zoc7/oTkVHkScv0zJ5k/jY5tiqgVqexx55PRYNQ4QE2bH9/RCah8etqLQ81fDZuNWE/mEDxtdKuVIs1QBW7j2s4PkBT/y5jjBnmFfPV/r04SPePzWBuNKyjIxaZ2wXiC1Ponf1FPG6B84FNui3swg6N/1UEPA8J3fUGgufLM1z4gsh3Df44JylF65Jv8I1IoO8zS3V4p6FpvQqWOp+cn+em3yiJUrvCAVHWWTc2qqFQwsDfYtAjAGT/CjnITQ95jLDZgnOejm66UnW5rB+7wHjU3ZuokQLMY2Jf7FLVX3u7N6Kmc4EpLM7vsqzTd5KVr37GW0lB3Iyzj9KOst6049CSthyB3ewpjATHKOI1/2pOcmttBqsI2DpQDrhiCesY4ySYZ1YTnA1CJZzWadC33qHAmwkpiKVxEgnTgKMCEcMMb/NJ2NnLfnIayrM4pu9NQ17ZnF14iWcR89A7X6dAQdZ07iRWIVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(36916002)(2906002)(31696002)(6512007)(110136005)(186003)(6506007)(316002)(6486002)(38100700002)(38350700002)(52116002)(8676002)(8936002)(4744005)(508600001)(4326008)(5660300002)(86362001)(31686004)(44832011)(2616005)(66476007)(36756003)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHRBUnlad09GOUVDa0g5Qm9VWFArbHVaQTZJdnZsTDZHNkdrYXpGYUxKZ2Jr?=
 =?utf-8?B?VGtQS0U2QlpCTnAzVFBKSmZ0V21reW03aXpvclVqb1Vqc0xWcXoyTWtXVy9n?=
 =?utf-8?B?QTZEWklFcUp5TmI0eGxYRXBWdWpTQ2NxcjFocWJhcDV6d1ZpZmdYMTRHdEtQ?=
 =?utf-8?B?T1EzMzlWaU1UcGVqcTV3VUtkZ2ZsaUFFSDZjMTdLVlVkL1doVHVuNkRWa0NB?=
 =?utf-8?B?VHZ6Y2xma1lSTG1wYXNrVHQ1REVvcktOWWdGS2JtdEdHOFV4ZWhJOGNwZXRs?=
 =?utf-8?B?Qk9JdzlYNE1sMFJwWjl0T0wzNGkrTGpab0VmbEY4TzkwYThjbDdJSDViNmJO?=
 =?utf-8?B?YU9zeEFtbTFkYXIyT2xjSDc0VUd5M1JreEZKNWpzUndGekhUQzZJeUYreHEx?=
 =?utf-8?B?MGx6N0E3ekdQRU52R2xWSWxtWkhJQmRxRXlqOFBXMDhSR3lqNzBTejBwQmRn?=
 =?utf-8?B?eWZQZEllZ3hnZGpqZWpMZWMrUlVkdFR0OUwzbERTRDFoSExjOTEwZHpEeXBI?=
 =?utf-8?B?YXp5aUlVeDZ2OVNKRU5ndDFxRWM0Y25vOHdBeHhhSTFNRjg2Y2hKUU5FbHZD?=
 =?utf-8?B?YU0xSXV4SXRQL0VQL1pnTUp5aWRTV2NvRGxpRFBRL0VtL0xsWkhONVNRU05Y?=
 =?utf-8?B?Wk9rTnlPaGRwVlkxaUtHbFp1VXorRFZqVlEvMXJSam5OdmlCSG9ibEdvWUFv?=
 =?utf-8?B?ZDdWbnNjMENwUDJzYnJYR1dIWVBnZU81UE9ySGJhWTIvUzlobDMzSFlsRnZP?=
 =?utf-8?B?aFFod0JpOFlRTVJGQWk1Z2Zxc2FKN3oyZld2L3NpVFZPeExLZ0txcEhRQ1FN?=
 =?utf-8?B?VS9FSVRQNzFwNEN4S2JFQzBpalJ5YWgyVWNCYXZuY0JGVWxwTjVGVFZFOXJS?=
 =?utf-8?B?TjNhYmlPVWpPakxrRFNRNVlyWWsxeDVSSGZlazBJYXRjWEhvTnNZaVU2c2xm?=
 =?utf-8?B?bU5YN0VhdW55SE03TWpVa2orVnAxc1JZQ0lNbWpDQWYrZHJTQ1lIK3RGZUo1?=
 =?utf-8?B?Y1dpVEJBYkNKQmxHb3MrVEpPaEkwYUN4RitvWEJFY3F0LzZhOFk4eTVVUWZR?=
 =?utf-8?B?cDV0cENYWmZDSjR2eHprSUJJVVNtUHo4dFF6TVc0ZG8xRHc3SFdJZGlyVUlT?=
 =?utf-8?B?ckIweXpaYnBha3dqQWx2akNTZk5CdTRjZmlyNnZiZW5mazRsaTVGU3M3RExB?=
 =?utf-8?B?N2ZTSWlrWlBJbnVXc0lDczUxR1JVcXpTTDJ1Y0tTeGpsVDU3WE5QK2pTSnc3?=
 =?utf-8?B?Y0ZPdzJlZkhDVW01dHdCL1AzSWt0NUg2M0VWN3RDNW80L3JuZjlZVjg4N3NU?=
 =?utf-8?B?dzJpRWtSS1VTbkMwVHV3VHF2UXluUU5ZWmV4RFFIVkovbjlnNE1pMlBpTHZq?=
 =?utf-8?B?a3BFcTVxR2dCb2w3VGFrV3orV2ViUm1LeDJjV1N3ZFJNUU5Fdm1ad3VJa1Vy?=
 =?utf-8?B?SUw2aXF5UUlYV3EwZEtLRVBTd0hqZ05KVSsxZ1JSVGJZU05xWFU4UXk2d2xv?=
 =?utf-8?B?UTkzTzZFUGpGaStNUzhvZ2FUdkUreTZrSGszTng4ejZ2aUhabzR4TmFkQkFq?=
 =?utf-8?B?SHZMaGJHazlrYUgzMFFIK2NubzUxWncxQlNiTy9kaG1sQTUyWEFqYmxWdkJs?=
 =?utf-8?B?RU9Mb1FmQk1nN2RnVjBYL2UzeGxRYlMvaGcyYXo4c2pMbHJSMXJObnEydkZW?=
 =?utf-8?B?aVBjMXZrdXZkQmJTYWttV1gvam1DeFBGRzJSeFM2UExwNkJiQ2lOY1NWMVVP?=
 =?utf-8?B?ZGhlZlhpOG5oUnRKdDhwRlJ3QmRWRmdsams4azVwWWZHRGhSc3JzdG5VS0No?=
 =?utf-8?B?UVNRLzJqLzQxT1A3VTVrVk9zbTFXNkdDdWp2djRnbVllRk8xSThSQ2FoTHZ1?=
 =?utf-8?B?RXFhZ0FxZUNuUHEzaFVhZ3ZNYWNFQVBLaTFyNTV1UmtSS2ZoRXBqYk9PYWZj?=
 =?utf-8?B?VmdWMEZ2SHRpV3plRzRyM1ZHSG0yc3E5c0lOQy9PRU5YUUJCekdXTEhMcXFU?=
 =?utf-8?B?eUFIVVgyTzhpU2ZqcWZVUG8ySHRvelJsVmtFOHlkVTlPbFM5UCtMVzhxY2Rs?=
 =?utf-8?B?ekg0cDl4TTI5SmlnNHcrODlJRkNmcDBoOG0vNS9ubmZRaWlDb1FIY3RQVDZr?=
 =?utf-8?B?VmtabzM5VVlYR0hWWDJRcllJUFgvdnZFL1ZXYVFIQzRqR3ZyclFCMkZlbGE3?=
 =?utf-8?Q?1uW0GRF42ixnQ3OSfFgtiUY=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7096db4-550d-4858-d19e-08d9bf1c911e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:12:46.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 faKxLGfPP4j7mpi3GtvLAK58OxGt+OsVCJceZw2zuwIMkjhagTej2mxg+sF4YbF7YeicAybtytrLrFm7M7LMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4224
X-Proofpoint-GUID: BkE1oREqAzBkdvMsu0rgIsBY7CMsCYwI
X-Proofpoint-ORIG-GUID: BkE1oREqAzBkdvMsu0rgIsBY7CMsCYwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=949 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:12:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159694

Converging threads.

Thanks all for the feedback. It sounds like there's no appetite for a 
DKMS recipe, and I agree with the rationale for rejection.

I'll motion to have NI's DKMS recipe migrated to our meta-nilrt layer 
and independently maintained until such a time as we can deprecate it.

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


