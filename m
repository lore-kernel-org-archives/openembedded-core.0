Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E37C2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 06:47:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.134677.1719211638901282925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 23:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6905e5654b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O5P3Vt003223
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 23:47:18 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fs3f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 23:47:18 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45O6lHMl021132;
	Sun, 23 Jun 2024 23:47:17 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fs3f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 23:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuqVSDufGvS03r+ohRpYH0+hGa9aDa0L+0S5WvWNeoUZWBeIGS1jJZvCL/u7jboFoPExL2MNqkg6kZfExl7cPva0IogLgXauXB1h84SrARsynthLRvhhth5YFrjNkKN2PDThsE2W6R6dInpzW95Qb9Z21zHRpjoIK9GzpfXsDadfVXQH3gKqfDJqwYwkQwI+SWpwWjMTBysLCZbVLeC6oqqATjEP79UAojq/ESCeThzFCxpV+XDmLLLJt4A5eLeEN8lQxU82vhbDjjwVFRnxyKSsFx4zB2JIpwWuCiN2Bx3w4aA42baw9T0TZfXY6mW419FHtquIOFJ9z71T8Xn9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOG3qVwBP4ScqwmDf5SjtePMIBHC/c2Ol1Eq8r3Yms4=;
 b=EM7F5ZZDpqC08PllPaf9d791YOB40CLyRxEnm+drLaDLBoiXfd83747ZSWnQtRoRLd25+NEsnzm2F18Hz9L69pqp91zD6BiRH7MMd9GHMXE21wDSfvY8yZQQVrTDu9K/6kmu5Dz/1nJxju8wdHHOs4tGkLYyCGFkiYkUZ/ZD2UtmvDso1uiBSpYDfRd/DzPo/1RGyj5NBuX+ap963JD8mTaq3AhBiVPwsBXcajYP186flfr5Mu7frW8J4EVlVIESrgc3SxipsEwLnxnGyFp9FmkmhVsxIbrHFs/lENCuAb48rhnkm0fOX785QQvsLMIQtxnVlWZiEI+sVNIK1gQlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 06:47:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 06:47:13 +0000
Message-ID: <6a1d0acf-efcd-4ccf-b023-65eb9a2d7696@windriver.com>
Date: Mon, 24 Jun 2024 14:47:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] acl: Fix nfs ptest failure
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240619091703.1410186-1-mingli.yu@windriver.com>
 <1AA24A74-8081-48D5-AFA3-9CFF5657988F@arm.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <1AA24A74-8081-48D5-AFA3-9CFF5657988F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:54::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee34c30-c28c-4de6-296b-08dc94197a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTdFRS9TMk1JczdyNmZURWVVVVNBK0s3eUU0c243ZTFLRVVEalVpeWI3Tytq?=
 =?utf-8?B?MXNtUEZSenE2MU81NG1QYW1hTC9Ja3Y0ZTJHZ25Ud0h5SnVFSGt4OWNZQnlE?=
 =?utf-8?B?bWdGSGdhQU5JbjBoSEVSc0pTN1VSUm1sNVdnMithd3lqR2c0NlJKRTFaMjBB?=
 =?utf-8?B?R21KMUczdDUxKzBIYjJja0xOZTQ5V0JZWUYza2gxbmIyYTg0R3VjMlpzb25N?=
 =?utf-8?B?MXYyL2FXdnZTRFZHeUxpWmpLeG1HQml1VTB3RFJlNEkvMjVDZ252ckQwclha?=
 =?utf-8?B?ZjRyOGtlU3kzL2tkRVdBUWl6MWFuL05kUUR2UlVzNmpWTVI2TXo4TG95WXJY?=
 =?utf-8?B?M0RqMWhIbDFESHIwdGs4NGtFTjNFaWw3ZFpPU3FtZTNrKzl6OHZ5T0tBcDNL?=
 =?utf-8?B?WHZ2c0tuVDFYUE81M3FpTllLdUN6eldjVm9WdllnVmEvelk3bG5DYnlTSWQ2?=
 =?utf-8?B?Yld2bWV1TlRLM3lnOUZaOXMrcjduQ1lSTDd3TXEzNGxaazVIYUx4enVKUWJx?=
 =?utf-8?B?Mi9ocXNvR2RqSVh5aWxzeVcvQ0ExbEg2VW9rSEI3ZDNYdGdpSGh5U1hsdTAx?=
 =?utf-8?B?SXJRYmdHU1l4Wng1aTc3dU5rbEhGdmJpWFl0VTNRcUdZSjVRTzcwWGxRRERx?=
 =?utf-8?B?Q0ZodjQ1NGVWRG5qQk8wQ1RROTRXTWZlbC9ubjVQR085aklrcy9NZUorV3Vu?=
 =?utf-8?B?U1VzamIyWFZmay9kbTVCVHdxajhuUFo4ZHVubjF6TEc4cHJxRXF4ZnEyZU5p?=
 =?utf-8?B?QkZhempJeVF2Q2oyck01VmU3ZmpNUFNpUnRGekllNjJxcjJjS2VnRnp1L0hi?=
 =?utf-8?B?dkxXREtabmVXbmJ3U2wxZkFoL3hEQk43ZktuekhOS3FPSmU0aCtyOEVPWUhE?=
 =?utf-8?B?SkxqS095S1NueVhHMmpQVEhtUVhuRVl1U203TGlva3hzcHJRcEZDdC90N3Js?=
 =?utf-8?B?SVE2YTNOSnYvMFZUdmdCTHJPMmFhVFRsUWVjcktPb1RXMjk5cEZwcDdBc2dy?=
 =?utf-8?B?RGdYMk9ycWN2UTFmZ0lMcElZQkYwWTQvYkFYQ0ZtZmcxR3BGd0NkWlZKcG0r?=
 =?utf-8?B?c0ZoN0xlOEhub29lTXFuTk9CTFpFekQxQ1QzeFdFK2xyY0dHcWw1MVV3eUtX?=
 =?utf-8?B?a0hsZFJpSkFCZ2RzM1Y5cktCN1RsY3NKVEEwbTZJL1pubkFQaGxxRDhqY2Zn?=
 =?utf-8?B?ZVl0M0Zlb0FTQnc5aE4wU09zZnI1TEJzMmdpeHJIYWdsbGRqOXk3ZE5yQjBE?=
 =?utf-8?B?UTdNUUs0MklqalRITld2MnVPd3czUWZoejRjYk8xaE5BVVM3cWUwUlFoV2wz?=
 =?utf-8?B?Z1l5ZE1HMGdaZXZqZWhiYitZRElSd3E0R2JsOWtRSk1EdUtMbWx6ZkowaE9Z?=
 =?utf-8?B?cWc4VlU2UWhPTGRPZDZNZDhja3Fnb3lIZ0J2U1lES1VtVmR0Zit4MllhNnNK?=
 =?utf-8?B?Rm9JT2dTSHFoZEZFMGF0NEsvS3pRaUE1TXpOY1BYd2tFMHRweExhS3lvWUdW?=
 =?utf-8?B?eDFJb1VhelNhNll1OWR5MEFhK0RCeGdmU2VRN1pTT0hYKzdUdU5ob3YvYUlw?=
 =?utf-8?B?ME5XM3NwUnNHNUw5UHc1Um92Q2pTRk9zSUM5UUd5Wk9sVjVvUDJwTThCNERQ?=
 =?utf-8?B?d281UFJkd2g2VnV4WFNOM1dQT0M4d3VEL21aZTJRdTRaZkxxK3F5QWlXbmE1?=
 =?utf-8?Q?fOeBBRhI5wBN91K+WKFp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2pUTkMzaGl0MkhTaDlHN21Fd2xrOUR6SlQ4Vy9DVTFwWUlJdmp4NTBta2dj?=
 =?utf-8?B?c1gxYjhXazVhOHlHemUyNjRyL1VpN0k3aUJrN3JhbGFzOFlLQmx2b09JRXJz?=
 =?utf-8?B?emJpbXpRaDdrMzZ4Tms2a3c5di9ORzBPbUpmMzlnNUJ4djRoM2t2QmR2TVRW?=
 =?utf-8?B?NHc0VW5qN3h3S2Z6cUhGR203OVZlOEgyNHljWTNlOWY4cVJyMWNUL1hZU2pw?=
 =?utf-8?B?cHM2ZFRvd1ljWUZJaGs0bXVRbElwWkVZRkZZU2Q4eFk3Ty9xZWh2dU9qSWY5?=
 =?utf-8?B?eG1QbEx2OW4wN0FVWTB4TkRncEtxYWloSElleEoxODNhU1MyVHB6QWtQRloz?=
 =?utf-8?B?VTVCSzUrWnlvbkxNdVlBbWMrbVNiK2lESzZWQWVTUlBDdGpaUi83enlaU0tI?=
 =?utf-8?B?QVdvM0NVSUJMNlRmWlZrQ0QxMVpsSXI2QkNTS2MyWW9rdzV4a1UzK1RYMHA3?=
 =?utf-8?B?UnRJN0ttczVhVFljbENXQnBsdCtpTHJJdVl3ZXJMQVlMRG14bjlmZzQwTzJW?=
 =?utf-8?B?MFRRazlEUTA5Tjh4U0VIVDV3d2RaNlJkenc0Y2ZMZGNaVTZCS1NMWjlvc2Fh?=
 =?utf-8?B?VlNuY3NVa0JiTllSRnlFUjJhMTF4R1U4OU9HVTVMU0NuNnoyS0lVM2NaZnoy?=
 =?utf-8?B?VVdJdHZJMitNcW9iWXFBMjZobDdXYU52eVVkL2w3Mm1Va1ljRlZWNUcxemlv?=
 =?utf-8?B?bm43Q2g2bGNZclJDSlFCYVdOcHp3U21VUit0bFMzcGVQSW5OeGZIM1NCR0l2?=
 =?utf-8?B?WUxGTFJxczh3WFJUdkphZmxNOVV6aWI2eEFKbTc2TVFUN1pJRktiRE1waXFl?=
 =?utf-8?B?d3FRQ1JzMEM4NzkvVzRXMmlJTlhVMzNqeG9xTDRZWS9qbXY5eDFUYi81bDVs?=
 =?utf-8?B?UlhzMSs0dGgvbG5KNm93ZUt1QkQ1UHNncGdnd0dYY0htRGdZMHMxSlZPV3Zi?=
 =?utf-8?B?VHhWZDN5d2k2dE1sMzdES3YvOU4zN2dkVm5jVG91bERnWW5OaUVnNGNyYmd4?=
 =?utf-8?B?bXJCc0Q5OWZ4Ymc0amV2RkhlM2liczlQdll6S0tFYWRsWm1XamRsWk1xUlRX?=
 =?utf-8?B?M3BseE5FZW9CMm53Ym5uNC9CMmF3T2VUZjJic0hPZElZQllhRUt3K1RIMGVa?=
 =?utf-8?B?eXZDRTBNc3FXd2pTQ2V4MTZTUW5jY1IrSG5hWEVuNXVDSWlsakJRVWdQbE0y?=
 =?utf-8?B?K0FCczJMMmg5Z3ZFcHdYUjVTK1lwblFSR1NXeFVHNWpnaUxkQVJtdExWejd0?=
 =?utf-8?B?Qy9oYmt0Q1piVytUVEs4U2hOL3M1MzNwbWNGOHZ2RWxEVWoxeWlsWGxUdC9Y?=
 =?utf-8?B?Sk1aRzNKV2pWdVlGS0hCMzZYNWM2REp6ekIyVnR1NC91Y0ttdGlGYkpTazJY?=
 =?utf-8?B?RzJVam5YYWtBZEY3WXJydlFBVUJjMWo0cmd1UGxhNExrNUhrUGt5VEU3UGk5?=
 =?utf-8?B?VWpLNno5bHM2NmpJQTl2NFhtVkw1TWgvK1RGSmllVDdCc2JhK01zclczSC9q?=
 =?utf-8?B?UXl4cGR0MDR6TWRoODdwMVVkdFVsZDcrVmN4eUJjdUpMS2daOFZGYWRTamJx?=
 =?utf-8?B?dmdlNms4Y0pVN0l3UDVFam4ybHVHcHRVbEFJVkFUYnRTakRXWGhKL0kvNXM3?=
 =?utf-8?B?ZVNnVy9OWktlemttV3RSY29zc2VHRC93T00xUHFSQXlyWWNhcVVGM1BLdEtz?=
 =?utf-8?B?MEI5elNpRjByT1RML1ljNGt0a1hhM2NpZzFSWVdieFpQL0lNV25ZVGNVclZn?=
 =?utf-8?B?WEttMGh5VTd1RjVkQ2l6SG5YL0pFeE9QTmxwZFc4bitoeUhhd0ZTUFNDTmMy?=
 =?utf-8?B?b0FKY1NjUGpHOHBYZVdVaXdrVXMyMTVDOElwbFVTWE1DK04wYlBXZE9nNG9k?=
 =?utf-8?B?OVUzYTdEcjVXWG1xamxvcll2eFpNRzREb01MVHJVUkpFWEhVVTJuYUlhV21i?=
 =?utf-8?B?ZFhuVytPeG15NnhUMVNCTDNtZG1SbEFyekk5RCtVNGNpcy92dmFIT1FqbTBK?=
 =?utf-8?B?M2NBcDJReHduVXd2MHVyL3VSRVpYWFZZeG01Qi9pUTdUa3BudHMzWFNUYkdj?=
 =?utf-8?B?bTN6UW4xWkRYM09kbENmMFhGUVZvOVh5WWdVQlJjNE5EdmZIV1VZZ0MvQTFq?=
 =?utf-8?Q?hkuR9jzk7cSSRvrigBd39kY9q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee34c30-c28c-4de6-296b-08dc94197a63
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 06:47:13.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKBCFY9tpvZuWGf+pbiZ6E0SIsBuRS14JwZ5u/1uFZyMtMDcRJoMckDGMW8OMLWqQ1FmlYEHZgrHNIya/tyXQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
X-Proofpoint-GUID: P4LHvtU5uYQ55qj-rOGHM9Nkt-E6dmc8
X-Proofpoint-ORIG-GUID: QbaB_G5i2EsypnZE6CPCs7ImJlsvVzRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_06,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406240053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45O5P3Vt003223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 06:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201065



On 6/20/24 00:45, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On 19 Jun 2024, at 10:17, Yu, Mingli via lists.openembedded.org <mingli=
.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>> +The nfs tests will be put into XPASS/XFAIL category as it defined in
>> +XFAIL_TESTS target, group all the test only in TESTS target as we pre=
fer
>> +use PASS/FAIL/SKIP to indicate the result.
>=20
> XPASS/XFAIL is fine, we don=E2=80=99t need to change the tests.

Okay, I will move back these two cases to XPASS/XFAIL.

>=20
>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-C=
orrect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs=
-nfsacl.test-Correct-the-check-item.patch
>> new file mode 100644
>> index 0000000000..f990ca4a31
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-=
the-check-item.patch
>> @@ -0,0 +1,51 @@
>> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Mon, 17 Jun 2024 11:00:43 +0800
>> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
>> +
>> +The date such as "Jun 13" should take 2 columns, so the expected chec=
k
>> +item "test/sub2" should the column 9.
>> + # ls test/sub2 -dl
>> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00002.html]
>=20
> What this why the test is an XFAIL?  In which case the previous patch s=
hould make it clear that we=E2=80=99re not removing XFAIL because we don=E2=
=80=99t like it, but because the tests are now fixed.

That's okay, will move back these two cases to XPASS/XFAIL.

>=20
>> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-su=
pport/attr/acl/run-ptest
>> index 3af75c84fe..7d88cc8484 100644
>> --- a/meta/recipes-support/attr/acl/run-ptest
>> +++ b/meta/recipes-support/attr/acl/run-ptest
>> @@ -6,6 +6,7 @@
>>
>> mkdir -p /tmp/acl-ptest/test
>> cp test/test.* /tmp/acl-ptest/test
>> +export EXPORT_PATH=3D"/tmp/acl-ptest/test=E2=80=9D
>=20
> Whilst you=E2=80=99re here, this looks fragile.  Can you use mktemp -d =
to make a fresh directory for each run?

The directory which used to include not only the test file, but also the=20
file used for test such as test.passwd and test.group, and this=20
directory is preconfigured during build as
https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/=
attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch.

Thanks,

>=20
> Ross
>=20

