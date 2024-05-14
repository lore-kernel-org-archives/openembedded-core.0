Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E974DC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19561.1715701929087752348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 08:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5864fc38da=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E4U2v3026967
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 08:52:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xyjqsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 08:52:07 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44EFq7XM010733;
	Tue, 14 May 2024 08:52:07 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xyjqsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 08:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBS1CKGZUpD7ejgJ6mNY+7mw/UzOASYOg7jaCRy+JL7U74P5QUqSv+ibAk2C5sWRmwCDod8eZ7c5GBpfhheT7505Pw3FAWqQv5rmfE8gyiCU1CEkki4UkYvuMwNyZstbpjkkmT0GeXBdch4Rv8CwTkWBQeqK9Kafl5uLedgjmKf3mHzQ20SmUJxiP2eUe+PRJFbHPInoWWKe0oh8MKRrgQJOW04ZfXRlsLO3KsmB86i9PYUPI2skgFZQRSVkXjtztx9s8wQOWjPc3MIMcdKzHD/N2BpSh5MWOLd8mxnnDSnSjc1xlE6vMWGZzTSD6+H/DJPkKCgmaaMY36eYhAoWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6Sv2X3Ww2GNTj/PI8aXZ1WgAlf+iv75jKcgd8OEkd0=;
 b=KppPLmPiJWT2FNafKw8XIIOhxHzq9xvFQtI2C6O3mitsemQ3/bg+isAv9licnEdU+eKoIAnLGhUEvBprvhrXkZyEF+6FAfNSGvdfxvTUoXjbMSZ3FRvMfoXLTuHGvR+/AbALvQvuHRDzznNRThfZFrk8sii2qDhh/zot8X3NGgm2diU8Ym6F6/+aBAg/sqK/qZm2nahxbNVpEHkKt84EmWvRggmD6dgfDlXUoWs0JwLTaLFT/JNWC6XOL4jub4g8cpqBFYJRzzXfRh+q+EIcuZs9saUOX1nEjxgp+VRNlr5aJSlXTrAtClNQUOYMnqkwiMxh3yqMr1CU0IJS7qXOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 15:52:02 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 15:52:02 +0000
Content-Type: multipart/alternative;
 boundary="------------0ZFwefpdTygRz0IyblB10pM8"
Message-ID: <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
Date: Tue, 14 May 2024 11:52:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: alex.kiernan@gmail.com, Yash.Shinde@windriver.com,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org>
 <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7002fe-9639-4902-60ab-08dc742dcc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXl4VjVQdW5WZkxkR0Y4MHNEbmJhZlF1VGZQbEpkbUUyMms3TUxzOG9Ud3c5?=
 =?utf-8?B?dEpNZ20xWFNuS1pVQW00SUhTS2Y0TWpHd1lqdGl1K2RXdk5iRUhYeWY2NDFP?=
 =?utf-8?B?aWtPdVExTzIwdko0UkRZeEpzYkw5MUxlY3ErblJoT3I4ci8rcW5NRytvM2Q0?=
 =?utf-8?B?NWY1eXdQcmpFNG93TWlRVGdhOUFaSVd2bnprQTFreFp2bnpVT3pjZXd1cnVH?=
 =?utf-8?B?TmpOeXhIU3BUQUpNV2JKU1ZoSnhid2lMd1h6WWNQVjJIN29qSEJuNVZIeWRG?=
 =?utf-8?B?cHdQZ3BPRnoreCtnNDNadmxyb3lLWUt0MHJMRlBzd0IxOHFZb0xQeVdrZDNj?=
 =?utf-8?B?K05TOFVXc1NaQ29ocW5XL01yRkFJRHRuaXdmZmNIdzVESitCREFXNGhNRjdm?=
 =?utf-8?B?c3FyZjUrT3VTM1BMaVZVbjRuYlFBclFWMjBVNEtJR1RNUGFxeGJ3bE9FSTF3?=
 =?utf-8?B?TGVQckU0VWZSYjdscmlzTi9DUW81WUYwWmFtSkdpRjErbVg5aVhmYTVScmd4?=
 =?utf-8?B?eERuT2RIT3diK2tJQTNxQlhYaUhNN0FKMzc3RmRYdVhla2lLb0RnQUtlNk1U?=
 =?utf-8?B?T0ZWNTlkTUJSS3NFeWFsMUx0VGdYNTdyQUV4bmVubTNUYlJHaXV6WTZvWU9K?=
 =?utf-8?B?cXp4czFDb1YvRTZnc3EvNHBjejVrZSt2S3Fkc1pHdkZwZUc3QWFqN0ZEenNk?=
 =?utf-8?B?OHlXWWgwSFlMNmJaS1RHd3NTeXF4NjBoMUJtZ0NtdHBGemQ4RkxIQ09sTEN0?=
 =?utf-8?B?MFc3c2syM2ZQSVJ2bGxqZkxEUTc2K3A3RFFDRHVpYTNoNWpZd2tUeFBjYkZQ?=
 =?utf-8?B?TnhCcXcxNmlEampxWmwyMFBFMkdZeUhGb3BUR1JDRU5adm13akdseGYzU3Rt?=
 =?utf-8?B?OW9PRHlhZDM5NCtIUThneUlHL29FWGI5RmZiM3JSQXZJcWRNSmxhVml5M0tK?=
 =?utf-8?B?N2J6K0tiTTZJYzNhZWxtZDdKM1ZQaGwzaFA5Wncxbm1UbElnTmNoVE42WnZm?=
 =?utf-8?B?emtaZHA1cG1ESkp6U1ZXRWc0R2swSUtXUjJFQ2RHdjVkRWZEajNFaGE4UWFJ?=
 =?utf-8?B?Wlk5cW9HSnh5VW4vcVJaMFE0OTZWTkgzak1jL0ljUUxaUVVqZmtBeHdHVENt?=
 =?utf-8?B?aTVpYmJzRnVvUUI0OEtlem4rNnRVc2c5ODhJSXQvKzJaalc0d1NmVjNvSWJj?=
 =?utf-8?B?Z3RaNTVLK2dCdUpvL0NFR0J0YkF6VGc1bzIvVG1IbGZyOFV0TVI2OEFnKzQr?=
 =?utf-8?B?aHA4NE1EQ0NMc0NmVFJja2RHQU5OQWdYTU9YeXU3UGlkU2Q4b3hFeHJBRG1L?=
 =?utf-8?B?WU52UEgwR004WS9IYU5VWmVJUU4xSDVnMysrYk1sQ3lLZU5qc1lINjdVM3M3?=
 =?utf-8?B?VHVuNFNNc3d4bmliTmRtKzQreGxTU3ErOXdxcHlyK2ZTSGRrUDN5TW1VT255?=
 =?utf-8?B?QkkvVXZaeHEyOGtJcktFMWw1Ykp1a3hkcHlocVgzUVB0WDcxWmVjcW1IV0sx?=
 =?utf-8?B?dFJiWUxVcCtpTzFwUnQxY1FpU285ZTRneVlVekU4cWpNUytFd25WcXlaMVR3?=
 =?utf-8?B?OTU5aVJMM05PelIvSXdZOUVUQkxMY2RKMlBhcWwwdWFBVU80bWlLS0NFM2Q0?=
 =?utf-8?Q?LrZjjXTNVetzhA8e3gPBs8RJqe9SVGSVI5ZbJVMSW5d8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjZwV3V6Ymk3Y3VzS1J5dC9uL0RGRFVDZ0FUWHIwRm1QaEt1dDlUeGJLUDg0?=
 =?utf-8?B?RGlZVGxrUmZIWkkvS3F3dysvUXNLWkdiTWlnSy9hWTdnbjhsNis3Tm4vM2Vo?=
 =?utf-8?B?SVhWcENFeDAveGdIdjJWckI3TG55Vy9pSHkxb0NFaW02c0lWbDZuYXR0VVF2?=
 =?utf-8?B?NWllaVI0bis1VmJ2bDl1UWV3T1pUcHhoRU9Rdk9HYlhkZnYwZzdPNVp5SGlD?=
 =?utf-8?B?TmtraUExc3gyVHVqdThIdmlmUHJtQkdFd2g2WTZ2NmRFK3NLYVVOWkRzVDJQ?=
 =?utf-8?B?a0xTbjdOWkdIZFRDVXVzVnM2K05WMlBYNU1URy9sSDdSN0EvbTRvZktVR1pV?=
 =?utf-8?B?a1VvNm1xTkRvcW0ySVdJSDNBNHV0em91OEhGdm1qRWI0NWhtTHNSMHUvQmlw?=
 =?utf-8?B?QzZKalZwZXU5YnJ2MDllbk90LzVBTElLejBKWjBuY1UxVzdNNnBGRmhUOUl5?=
 =?utf-8?B?eld4bUxkSmltZ2ZodkUycFUyWFB6dkdlNmFNcTU5WHVreWJsVVhnT1d1a2Er?=
 =?utf-8?B?b2ZMWlZzRndneVJmRmpPSEE5bjcvUW5qdmllTG5BTlFacFEvN0tRZW93Ly91?=
 =?utf-8?B?OGFqNmJVOE1IcllweHQxWVpLQVlwNjBSZm9vdWdLVlV4eWdVeFNMaG9RWXNG?=
 =?utf-8?B?UVREU3A3bThXODFjYlloRjRGalk1SzdvWmFUNnBrT0xkZHJVQ2R0Ulk3ZmZu?=
 =?utf-8?B?WFFCbjVsQlFRenRJL2pXenhSVWVpcXJOOGhFa04wbmlXY045eDY3MWtKMWhn?=
 =?utf-8?B?cUxvdlRpc2czMUZqRStiT0ppZTBTNGpkQVJMUXlaOWNNaS93eGxaUTBwcElK?=
 =?utf-8?B?MFJwNjF1bStMY0RjTDY5NGdObVp4YmQvRVVSZitIUTFXL3RvVW9ZWUh3NlVF?=
 =?utf-8?B?bzJpWVVzWFZpR2FHcHZ6L1UrZzByM2ZyTzlZNXpNZzY1YUhuSEY1U3RsUThk?=
 =?utf-8?B?SzJqMVRuYi9NWnRkYUhMQkVNeW1wOGI5VDduWi9QSHBTS0txZnNlaFg2V0k3?=
 =?utf-8?B?alBWOTB6cGtMQ1pkSW9TS2tac2VIbFhsSFV4MnhscElhclFqZ1lzOG1hbExw?=
 =?utf-8?B?SHhhbnZ3Sk1Ka3d4NnF4SmhBS2JiYTdFRUpqOGdpR0xjczlWWCtNSVorcnRJ?=
 =?utf-8?B?V0Nrd1ZEbnJYcVRra1BaQmFPY1pyeGJubHVnQkE2eWpzNWNlRDdTOTM1TG9o?=
 =?utf-8?B?QjJMZFQ2eEhCcjFDQ2phaDhCSXRna2VOZjVySm4ycWNWWjZkYzdiUDgveGxP?=
 =?utf-8?B?bFYrYnVYdWh2WFBMM2E5dmtZSEdXRFFtaFFMbHFITURGR3N0T0oySVMwbkVz?=
 =?utf-8?B?QXREZlhKWkd4THJabHJCcWF2M1pnV1htTWQxcHEvTkRZSm9RMEJOUmwzd3gz?=
 =?utf-8?B?di9WTXBXd29LUzVUZnErcEJJd1c4bEp6WDA2UktxVDZhaW0wKzhubUxWcDJl?=
 =?utf-8?B?WmsvQ0NlQ3NCSk4vYTNFN3p3QUllTmlYNU5pVGNYMDFNSy8zOERZU2YzUU95?=
 =?utf-8?B?QjluY3diVC9MM2FNVWUvRmNsUlYrZWRJVkRSU0V0RytCbk15Q2llZjJpY3Ay?=
 =?utf-8?B?dXgxQzJ3VldzUjhSSjlmQnJHWnJRM0pYak5Hc3c0Tzg4YXBGQlFHYkZUQkJD?=
 =?utf-8?B?ZnM2S0VxRFBiblVPRm9oeGdydlJBbnQwbm0wWllGQlJxSXBtMWc2ejJ5L2hM?=
 =?utf-8?B?bmNVL3g1Y0hKM2pRbStGbWh1Z2NoSTFQR3BDTnBBVWMvc0svdUFvUFFvOTMz?=
 =?utf-8?B?MDdzWUhsOUt4Mmc5VGR5UUJZSjlSdjZldFZwNVhFdEIxZUhQb3hLYm1rRHZM?=
 =?utf-8?B?OGtCR3BDb2N6Wmw4b0cvVm44eVA4Q1l4WnVTeWJZM0pZOW9kcnFsWFBDUFpt?=
 =?utf-8?B?TVBkZHIraTNlV0UwRWVBZFhkdSs4MXZHckFLbmJscUR6Tmoya0YxM3drU0sz?=
 =?utf-8?B?WWUveHRVU3BZN2FLejl0N2kwaldsWDhlaHEydkp6VEtaWFhLdmwwZGE5bFVG?=
 =?utf-8?B?MU5Vdkd4clFlNG1zNjFnbmhIb3IrRjJCL2R1WnBpRUZXTnJCU2xmOS83MHA3?=
 =?utf-8?B?SEJKQVhRbjVsVEV4RGZ2cW5WR0VLMnZGa2haM2VnbGJWaGx1eGdRRy9hY3VM?=
 =?utf-8?B?Y1phUkR2blZvQnlSWUJqdmVGZmdYNDJEYm9FYWQxNXRBYWNLZElCaXlDQ1E4?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7002fe-9639-4902-60ab-08dc742dcc0a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 15:52:02.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcLQ6Sqy1LeUtnnK5fxsc8l7nITFDVSVioM99fyITa5rxfsIjQakJV0g6iDCwmfZg40V7fV0z92HihpMwLhClap+nQAuoXlgjR4p4Yvb/hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
X-Proofpoint-GUID: 0QzHk_Oce3ZBAmp-2IM9IsgmAdWHuuU1
X-Proofpoint-ORIG-GUID: a3swmb68rqAklUnuAtBiUj5icnNTswDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_09,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405140112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199262

--------------0ZFwefpdTygRz0IyblB10pM8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44E4U2v3026967

On 2024-04-05 7:28 a.m., Alex Kiernan via lists.openembedded.org wrote:
> On Thu, Apr 4, 2024 at 10:07=E2=80=AFAM Yash Shinde via lists.openembed=
ded.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org>  wrote:
>> On Wed, Apr 3, 2024 at 05:51 PM, Alex Kiernan wrote:
>>
>> Hi Sundeep (or anyone else with insight on this!)
>>
>> How do you go about debugging rust oe-selftest failures? I've bumped
>> everything up to 1.77 (https://github.com/akiernan/poky) but
>> oe-selftest fails for reasons that aren't immediately obvious to me...
>>
>> https://gist.github.com/akiernan/6cc6131c1ec3af866098a9318679cf1b
>>
>> Any clues?
>>
>> --
>> Alex Kiernan
>>
>>
>>
>>
>> Hi Alex,
>>
>> I faced the same errors when I was working on to upgrade rust from 1.7=
5 to 1.76. I discussed it with rust upstream here,https://github.com/rust=
-lang/rust/issues/122075  and the following change solves those failures,
>>
>> https://github.com/rust-lang/rust/issues/122075#issuecomment-198515352=
4
>>
>> PR-https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06ba=
aa745784d118db862b3e3ccf7f8
>>
>>
>>
>>
>>
>> After this change was backported to poky, the rust build was successfu=
l but it was seen that not all the tests are executed.
>>
>> While discussing upstream, it was known that removing the --doc option=
 from python3 src/bootstrap/bootstrap.py test --exclude<some excluded tes=
t cases list> --doc --no-fail-fast --bless --target x86_64-poky-linux-gnu=
  cmd in oeqa/selftest/cases/rust.py file execute the other tests also.
>>
>>
>>
>>
>>
>> But, while doing so another set of failures are observed as mentioned =
inhttps://github.com/rust-lang/rust/issues/122285
>>
>> Complete log using --doc option-https://gist.github.com/Yashinde145/7d=
b6bd4a064021bf756b0c0dd6c8777c
>>
>> Complete log without using --doc option-https://gist.github.com/Yashin=
de145/036a934f0523307859f7c855b83ecfd6  (this file is truncated in gist d=
ue to large size, please see Complete raw file)
>>
>> I am not very familiar to these failures but  trying to understand the=
m.
>>
> Feels like you're way ahead of me. I'll have a bit more of a poke at
> it when I've some time, but it feels like we may be mostly waiting on
> upstream (and a big +1 for getting them engaged!)

FYI,

Sundeep and Yashe have Rust 1.77 (8?) compiling reproducibly.
They found some problems with the rust test suite and
are working on fixing or avoiding those errors before submitting a patch.


../Randy



>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197983):https://lists.openembedded.org/g/openembedd=
ed-core/message/197983
> Mute This Topic:https://lists.openembedded.org/mt/105307188/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------0ZFwefpdTygRz0IyblB10pM8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44E4U2v3026967

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-04-05 7:28 a.m., Alex Kiernan
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-=
607c_RK8xm2dshyfHWJw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Apr 4, 2024 at 10:07=
=E2=80=AFAM Yash Shinde via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver=
.com@lists.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Apr 3, 2024 at 05:=
51 PM, Alex Kiernan wrote:

Hi Sundeep (or anyone else with insight on this!)

How do you go about debugging rust oe-selftest failures? I've bumped
everything up to 1.77 (<a class=3D"moz-txt-link-freetext" href=3D"https:/=
/github.com/akiernan/poky">https://github.com/akiernan/poky</a>) but
oe-selftest fails for reasons that aren't immediately obvious to me...

<a class=3D"moz-txt-link-freetext" href=3D"https://gist.github.com/akiern=
an/6cc6131c1ec3af866098a9318679cf1b">https://gist.github.com/akiernan/6cc=
6131c1ec3af866098a9318679cf1b</a>

Any clues?

--
Alex Kiernan




Hi Alex,

I faced the same errors when I was working on to upgrade rust from 1.75 t=
o 1.76. I discussed it with rust upstream here, <a class=3D"moz-txt-link-=
freetext" href=3D"https://github.com/rust-lang/rust/issues/122075">https:=
//github.com/rust-lang/rust/issues/122075</a> and the following change so=
lves those failures,

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/122075#issuecomment-1985153524">https://github.com/rust-lang/r=
ust/issues/122075#issuecomment-1985153524</a>

PR- <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-la=
ng/rust/pull/122205/commits/5aece7fad06baaa745784d118db862b3e3ccf7f8">htt=
ps://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa745784d=
118db862b3e3ccf7f8</a>





After this change was backported to poky, the rust build was successful b=
ut it was seen that not all the tests are executed.

While discussing upstream, it was known that removing the --doc option fr=
om python3 src/bootstrap/bootstrap.py test --exclude&lt;some excluded tes=
t cases list&gt; --doc --no-fail-fast --bless --target x86_64-poky-linux-=
gnu  cmd in oeqa/selftest/cases/rust.py file execute the other tests also.





But, while doing so another set of failures are observed as mentioned in =
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/122285">https://github.com/rust-lang/rust/issues/122285</a>

Complete log using --doc option-  <a class=3D"moz-txt-link-freetext" href=
=3D"https://gist.github.com/Yashinde145/7db6bd4a064021bf756b0c0dd6c8777c"=
>https://gist.github.com/Yashinde145/7db6bd4a064021bf756b0c0dd6c8777c</a>

Complete log without using --doc option-  <a class=3D"moz-txt-link-freete=
xt" href=3D"https://gist.github.com/Yashinde145/036a934f0523307859f7c855b=
83ecfd6">https://gist.github.com/Yashinde145/036a934f0523307859f7c855b83e=
cfd6</a> (this file is truncated in gist due to large size, please see Co=
mplete raw file)

I am not very familiar to these failures but  trying to understand them.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Feels like you're way ahead =
of me. I'll have a bit more of a poke at
it when I've some time, but it feels like we may be mostly waiting on
upstream (and a big +1 for getting them engaged!)</pre>
    </blockquote>
    <p>FYI,<br>
    </p>
    <p>Sundeep and Yashe have Rust 1.77 (8?) compiling reproducibly.<br>
      They found some problems with the rust test suite and <br>
      are working on fixing or avoiding those errors before submitting a
      patch.</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-=
607c_RK8xm2dshyfHWJw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#197983): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/197983">https:/=
/lists.openembedded.org/g/openembedded-core/message/197983</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/105307188/3616765">https://lists.openembedded.org/mt=
/105307188/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0ZFwefpdTygRz0IyblB10pM8--

