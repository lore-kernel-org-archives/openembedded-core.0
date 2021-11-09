Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F8AC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.10104.1636451511009935078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=hHEw5Qkg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6947b2a56d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A97dY4L025798
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 01:51:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=AoxohQpx+2kjpAMgXUvG/LmI1bhipEkgPXMTovCGfq8=;
 b=hHEw5Qkg7zg/OrhTcSlM+661rDUZGvap8oVxh2ZZVPdWp6LzrlrmWS351ayh9QzpNK2D
 g06WVXLBFgxWEVcp0UGP0lUarUIGFjSxN5x3PUVhOBZEmxV5H5mZWtBy5d3QH4ICexlY
 ikHr5weZB3NgYyY3mK5RQd4vFtOHN8VqcDCDR4VdNIXW//cOpkZkfMdtdZri7Iuuj8fr
 lUDgLAiMHCnlHHaz9uAoNLcABEuRTy7HTvLoiHOCcBqmOqt075717P6qsfdz+EKLg23F
 EqxkPI1N8NTBestuJahvY0KNwwjjjRaFbiNEbvuDzdmgJOj3OPwrFCYZ8N/TWWg+VIRC +g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6xq7s6jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:51:50 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A99p2a8010666
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 01:51:49 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6xq7s6jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Nov 2021 01:51:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+xULTQeR+ML9gC6LqhKdVuheZLT4nHSBUq7G0d3zhbCA3/dcF9q2jUrAkhAk3MGhdHXnGWG/63rLydw20ps8oeVQ9UdJDDCyT+M81cv1PDD780e3iWosuG+99lomFw6dGzYvtbCeQejOflVDV5lgXCrE67lws2Ahfy55x9tlyHfJYBMikStxrZdolTSDJVxnUaFRlYeCleegzRw40dEbGC3j7nQA21H9YBKLd7gB+s+dv8rflILULL9fbcTvG4z/cWgTPewAaguQDMjDO1Hj7flgkquQkj/jMnoQuS7MwotlsHpp0jD1JQE68vLrve8cLimicOpCYXVMycSQlvP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoxohQpx+2kjpAMgXUvG/LmI1bhipEkgPXMTovCGfq8=;
 b=UGQH6OYpCSvJQEHwVFgSLyU3mLcaLIY3xvy4fHYKGmZRO97PpR6r+8y9bgzJX1yBwnjnvla1+JCVwHtl68NhuypG9NdS9lMR/3crQAEXmE5lf4pFaVbSZCSkVWlVbk8FcY291HOZw1M6OJH29tiosMrvjomG4MDVErqQG/L3PyZiC90Rco+7B1uMzCHax8PDiHdh23q7jERHPJKmEulzQhX4CbvkAq8fPEq0YULw0kHn3aRhTrffR4pNpOYfPg8XUbIKl9apCE6eNO2FT0cW0xXqCb5ugs9o2uG9TGjkaZH3PpDEnm7hS9RNFWCtKTCxCCqCO4oWHnyQ87cZB7nIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 09:51:48 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:51:48 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <dc06a051-c271-892f-ef5d-ce265ac45151@windriver.com>
Date: Tue, 9 Nov 2021 17:51:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by
 HK2PR03CA0048.apcprd03.prod.outlook.com (2603:1096:202:17::18) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Tue, 9 Nov 2021 09:51:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e69a6a2-cec7-4fd8-1c2f-08d9a3668c07
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB534166DB35465B2126B8E912FF929@DM4PR11MB5341.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zzSdQCoJSHmCfwSoVqANBS2OF0O9bJKgD0FWTbYaAqKcCrTrHd5MxU6vc/MFvi/CeXb2TL67A8UlEaXRjVl56IZc9EwmCV8D6TqQyj0pa5Gh3Bxr0yRzzIDxbrpp2VqfLQ9K2qUIz6vdhsm90oAeQ8dA2CWkhZSox/bLs269p+YNXmRYJFcUnEdwxa3PD28T1eg3i1fsM6RbCehQchLZgsfG+Y5m4u1hNM7lf5AoWSmGwaze2FSbvWagJwYyK7vwx6ynm1cuVjqO3bVvGbmFajjPu+x0my2BpPLjmEvJu0boZzQJuI3YhAakmSG8qyy2Q47UwmUe00JIp+NPEMZnBsUqDuCJrK1cnKjBilz6jq8fK0+BtrQpAJPN62wCY5SP33gAAS36yEjbLoojOtD+y2GTD52h7TtnuGdsg7rGFPxWhDM3AUOHhDLCmTifTrKb53JWo9eLlkeEwGQySO4cskCcBDMtqpxJbpCLZod37vp+LzS27HcZPJmFK6gMIeAe0F90bFi9CtLgWESV9k7Uem0MxETxZFQcD0TWDivapO3mpGgBQQEEAncFPDnLCRqdUDNCllDdZK1RPju2WR/qrkSX7jwvAv5wgr2Wbjv8mUEReUvKKcevsIbD6BHmMzDSKenscp0y1+zHFKhlWCxHllgBmHPE2yluYnTqXj3isy7vpmjja6e/XrNT7naEGhu3ZvcSPLXgeVJf6ReKRcaViN9r5g2DXvUBQnYCLJSuHbbRRiw8S/Z5VaiQuRbOo4i5eIwPtoX567tVT+Gsp4gRqgpULM9nwG76WbS2eqH19OBhlhHt61uvCBd70lBzjGsg+vnnv0dannY9Ah2ynS0PvMvMyi5NDJafJS2qeSi8npq+KIPxp2X+9HnaFE4bURgIlGFeGxW4HFo3gGo0dmLiOhoXQnR0M8PDxw8mCGtu+hM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(508600001)(2616005)(86362001)(2906002)(66556008)(4326008)(31686004)(6486002)(16576012)(316002)(956004)(54906003)(66476007)(6666004)(5660300002)(8936002)(66946007)(53546011)(6916009)(36756003)(38100700002)(966005)(6706004)(83380400001)(26005)(52116002)(186003)(38350700002)(8676002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1dMdEg1NzVnai85TkNRZ3R5dTdUZVZuY2ZpRDRxNm0wUHFZdDJ6TFluVito?=
 =?utf-8?B?a09zdDU5di9qRFhYRnlhbVFEQm1tOGc4YnRBTGFtcHZld0tlU1VjZGoxcTFI?=
 =?utf-8?B?WUNGTnRsdHlpUkxEVWszTTEwRlluWWtldzc2aExPeTQ5dFloOVBieXpBTVE2?=
 =?utf-8?B?d1dWUHI0eTFKMXU3Y3krUlcwN0YwaXgzSkRQWHYxNnpYQTYvR1RmZlpSUVRo?=
 =?utf-8?B?YVJoU3VGVE40VmlJR3k2ZmpqeVVkMG1ZbUFkN2pDUWI1enRtU0RNZmNvbEFK?=
 =?utf-8?B?RnVXbmJWOTF4VmlnWldiaW1iNFZyU2YyUER4VWcwcEpZdmtoa2hwbUw1ZGJY?=
 =?utf-8?B?UWV3emhpMFNlNVR2b1ZjV2U1Q3JDWG1jVVJsNmdCTGt3VGhxWDBCdFgwZzJX?=
 =?utf-8?B?YlAra2ZjZldmY3NMTlN3TzdnajFZTWladzRTRm9VZ3h4TEIxam1KV1dtRkRy?=
 =?utf-8?B?dWl2K0xadmRtYmlKbnl2S2ZtSzdFTEhXOGVhOURlWmRHaGRaY3BtdXdMdlJV?=
 =?utf-8?B?OGhsN0VLdkYzNVVQcm1aemkzdElZSnN0RjlyQXdML2k3ek1RTnRLV0xkdUNa?=
 =?utf-8?B?OXNDc0NuZU00VkkvNnU5VXJGRWkwOGpIZ2FmME1ONk1tQ1dGNjdTeW9VOGJI?=
 =?utf-8?B?cit3amd0YjRKK08rQzV0eDZTUVp3bGI1dGlaZDUwTENzZGN2SUt6UnlZRU5J?=
 =?utf-8?B?bTNCcXIvK2FjY2FqWmxpM3Vacmc2UUFpZ2hGQ2hpQUtiWkhZZXErQkh1N2cz?=
 =?utf-8?B?WnBwc0V1cDZhL2dKeUlDbzRnbXUzQmVMeFlIc2pOQTdRZmppS0p3RWpEbzND?=
 =?utf-8?B?eHVWZGFJUE1jS2tIR0dEWUxvQ2xlT0YxWFZ1RGlSeTVsd21BRTJmWjJ4WlJ2?=
 =?utf-8?B?YXd3Wk1mbjlSQ2NGVksrTTBzbTN5VmZFaGxoaWd0RnRKRVdhZE5iYUpEODhi?=
 =?utf-8?B?aUxaTzlhSlNNTVNkaFJ2N3dmTFZHZ2FiN2svR0YyeTAxZXFJenV5clVKdTc0?=
 =?utf-8?B?VUpjNlZwbnJlYUxxaTFFbVFEN202OTNsL1FGZVZJcE15UGVxVUlDR2xYbXRG?=
 =?utf-8?B?cVlxOVJQQ1FnVHFXK08xcVRwdFMyNkY1ZUpuTU5NcGlYcEhzSEs4RHJDYVJl?=
 =?utf-8?B?VmppbGl2cWdLcnJyUFo0Z1d1WkpGMU50ZjlnMkQzaG9tenZIZHpjeDFWTU5u?=
 =?utf-8?B?TTFqNGxBWCsvU0NML3Fvb3ovbFhKZk5kMzd1TDA5eVExQjdkZ093Y1ZKWXJW?=
 =?utf-8?B?dko3NUJkYkc2My9hNVp2andDL0FISTF6WENCcStxdW85ejBqQ1pZYXJpTkZw?=
 =?utf-8?B?K0NWbkVhaG8vY3YxU3VkN1g1a0hYR1V0L1E2WWpZVzc1MmU0V1B5Wm11RjQw?=
 =?utf-8?B?dWQzekZUMWk5cHhhRC9SSlIwcmh0WnFrd2txTDgyNlRQVnpNRk5VdmlnVlJX?=
 =?utf-8?B?VTRteU9aV0ZxY1FEOG5JcTBQT1RJaWc1d1hZV1JOaFNxZ0UzUDRaRHlQSjhZ?=
 =?utf-8?B?SzhLV0Jpd2pWdjJNOUpLeitXejB3Wm8walpQMWVqSEl1UVA2TkpUZVBPN0hK?=
 =?utf-8?B?WFp3VzNDTnlBK25vK2VlNXByNEVibDVkc1F4VkhqN254VXVDTk8xbXhDbEJH?=
 =?utf-8?B?UE5OV2t1WFFRZVFZMDQvWlNYYzI5K3NXVGtEN1pnYzFGd1NIM0xSaDhXam5s?=
 =?utf-8?B?eG5IazYzdkgyS21vL1pVTExrLytjLzZPMGtHUFhmeVZNK0hZSE9JVzlKa2p2?=
 =?utf-8?B?TFFxR3RBWTlnREt1UUdPYlJMMjhDSWdsT3kxenJXR0QzdFcwMWZTL01hWEZB?=
 =?utf-8?B?OFlhNklURy8rcWlTaUc2VzNabnlOcG9wbFhQTXROZlJ3bUFlMDlpTWtNUGxN?=
 =?utf-8?B?RC9ESnFsK2VkZGVSdnd5VHB4cmh4dmY3SVB3VWE1ZElwVE9ESVhtRDZJNThU?=
 =?utf-8?B?OWZmR2JtczBvZEg0dnorMVcyN1lZcG9FZGRzbjhrcWQrdXlqdVRCRUJsdTJ4?=
 =?utf-8?B?RlFDYUxyTkxtQ0hKWnBNRmQ0MFpjTEluM3VJci9GWkNiZmlyOXJQRy9ORVpX?=
 =?utf-8?B?UzB3WFFucEpwcmgwMzNOa2VMRFh4bTNlNmJHUktKUVhiVXFmZjFLQTN3SVEv?=
 =?utf-8?B?RW44NHVlMHRLSHR5ZXJaU3crOTU3Y3ZpejNvWjB4bGplTjBCdmZ1Q2lFd3RV?=
 =?utf-8?B?NWdRL01SRXo1WmtucDhBckl6RGVqVTRvMGZQcGRTNnN6WGJScjFJT1pLMmNn?=
 =?utf-8?B?SmQvTTI1blFZdzAwQTRXY1dPK01nPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e69a6a2-cec7-4fd8-1c2f-08d9a3668c07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:51:48.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6NMtlhXs5N2jvQxJvI/MZLR0EB+3ADSZqgW3gBSdrF2PvYsoRXvfy4JvJTfo8tXehz5WGmTCZv2q0K9McfXi+LrE4va+ngLaTVmuPsQShlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
X-Proofpoint-ORIG-GUID: 6wUuZMuh2rCUcDcgwlkpK_uX_6Wq2v3o
X-Proofpoint-GUID: vpSCFyiywauhUzXBMv36bQhnT-krUsts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A97dY4L025798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:51:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158007

Hi Alexander,

On 11/9/21 5:44 PM, Alexander Kanavin wrote:
> Maybe, but once we start doing tweaks like this, where do they stop? He=
y, I'd=20

I think that it's not only a performance tweak, but this should be consid=
ered as
a bug since it would be failed to build on powerful machine, which isn't =
good
for oe-core's user experience.

// Robert

> like to limit llvm and webkit threads too, they eat disproportionally l=
arge=20
> amounts of RAM compared to everything else! I'd rather err on the side =
of=20
> simple, striaghtforward, universal defaults, and having better document=
ation for=20
> tweaking system resource consumption. Each build system is different.
>=20
> Alex
>=20
> On Tue, 9 Nov 2021 at 10:40, Robert Yang <liezhi.yang@windriver.com=20
> <mailto:liezhi.yang@windriver.com>> wrote:
>=20
>=20
>=20
>     On 11/9/21 4:41 PM, Konrad Weihmann wrote:
>      >
>      >
>      > On 09.11.21 09:48, Robert Yang wrote:
>      >> The original value is very easy to cause do_packge error when c=
pu number is
>      >> larger, for example, 128 cores and 512G mem:
>      >>
>      >> error: create archive failed: cpio: write failed - Cannot alloc=
ate memory"
>      >>
>      >> Set the ZSTD_THREADS to half of the CPU number can avoid the er=
ror in my
>      >> testing.
>      >>
>      >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>      >> ---
>      >> =C2=A0 meta/conf/bitbake.conf | 2 +-
>      >> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>      >>
>      >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>      >> index 71c1e52ad6..46ebf5113f 100644
>      >> --- a/meta/conf/bitbake.conf
>      >> +++ b/meta/conf/bitbake.conf
>      >> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMI=
T}
>      >> --threads=3D${XZ_THREADS}"
>      >> =C2=A0 XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS=
"
>      >> =C2=A0 # Default parallelism for zstd
>      >> -ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
>      >> +ZSTD_THREADS ?=3D "${@int(oe.utils.cpu_count(at_least=3D4)/2)}=
"
>      >
>      > Then why not just limit it for the large setups you are referrin=
g to in the
>      > example, for instance like
>      >
>      > ZSTD_THREADS ?=3D "${@min(int(oe.utils.cpu_count(at_least=3D4)),=
 <insert a sane
>      > value of your choice>)}"
>=20
>     This sounds like a good choice.
>=20
>      >
>      > BTW this can be also done in your local.conf - as Alex already s=
aid,
>     there is
>=20
>     Set it in my local.conf can make it work, but it isn't good for oe-=
core's OOBE
>     since the issue still exists.
>=20
>      > simply no reason to make it slower for everyone, while also half=
 the
>     threads of
>=20
>     The whole build contains a lot of tasks, for lower cpu cores, the t=
otal
>     resources are fixed, so when zstd uses less mem, other tasks can us=
e more.
>=20
>     Limit zstd's thread doesn't make the build slower, but faster in my=
 testing,
>     it would be great if you can help test it. The simple testing comma=
nds are:
>=20
>     # Make everything ready:
>     $ bitbake linux-yocto
>=20
>     # Before the patch, set ZSTD_THREADS to 128 and run 6 times:
>     $ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_r=
pm -f >
>     before_$i.log; done
>=20
>     Note, the time will be printed on the screen, not the before.log, t=
he before.log
>     is for strip the logs and then we can read the time easier.
>=20
>     What I get is:
>     real=C2=A0 =C2=A0 2m12.079s
>     real=C2=A0 =C2=A0 2m0.177s
>     real=C2=A0 =C2=A0 1m52.426s
>     real=C2=A0 =C2=A0 2m3.396s
>     real=C2=A0 =C2=A0 2m16.018s
>     real=C2=A0 =C2=A0 1m58.595s
>=20
>     Drop the first build time since it *may* contain parsing time, and =
for the last
>     five builds:
>=20
>     Total: 609 seconds
>     Average: 609 / 5.0 =3D 121.8
>=20
>=20
>     # After the patch, set ZSTD_THREADS to 64, and run 6 times:
>     $ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_r=
pm -f >
>     after_$i.log; done
>=20
>     What I get is:
>     real=C2=A0 =C2=A0 1m50.017s
>     real=C2=A0 =C2=A0 1m50.400s
>     real=C2=A0 =C2=A0 1m53.174s
>     real=C2=A0 =C2=A0 2m4.817s
>     real=C2=A0 =C2=A0 1m53.476s
>     real=C2=A0 =C2=A0 1m56.794s
>=20
>     Drop the first build time since it *may* contain parsing time, and =
for the last
>     five builds:
>=20
>     Total: 576 seconds
>     Average: 576 / 5.0 =3D 115.2
>=20
>     So the smaller number is faster than the larger one.
>=20
>     // Robert
>=20
>      > a 128 core machine could be a trouble some setup.
>      >
>      > Last time I had this issue (with XZ back then) I used
>      > "${@min(int(oe.utils.cpu_count(at_least=3D4)), 20}"
>      >
>      >> =C2=A0 ZSTD_THREADS[vardepvalue] =3D "1"
>      >> =C2=A0 # Limit the number of threads that OpenMP libraries will=
 use.
>     Otherwise they
>      >>
>      >>
>      >>
>      >>
>      >>
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#158004):
>     https://lists.openembedded.org/g/openembedded-core/message/158004
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/158004__;!!AjveYdw8EvQ!Pp09fG5njytGigcrK1Pci9c4pmhLI=
2WooNDvgaDRdaq-cC5BmErvgdfHBe3ivNZBDAzT$>
>     Mute This Topic: https://lists.openembedded.org/mt/86926962/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8692=
6962/1686489__;!!AjveYdw8EvQ!Pp09fG5njytGigcrK1Pci9c4pmhLI2WooNDvgaDRdaq-=
cC5BmErvgdfHBe3ivG7_2fs8$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!Pp09fG5njytGigcrK1Pci9c4pmhLI2WooNDvga=
DRdaq-cC5BmErvgdfHBe3ivAnK9lkk$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

