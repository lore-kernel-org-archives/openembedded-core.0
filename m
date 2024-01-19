Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750DBC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 09:47:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18540.1705657620016235361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 01:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lHCXFF5x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174878822a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J6i7ug021870
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 01:46:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=y9F6w4fuNpFscROcbiZ
	g+IM86O4+qeGseeZar7GVxBI=; b=lHCXFF5x72aVqAnTLl0crWCzVHpXKQrxzro
	97y9PnnnQ2yfpc6MiN7o+Mc3nlxLEA5++8Du0uv3lpRDRdcGnSHWUOH7dcFpesG7
	4HJjJryQbCcZKKi/4PjqqIpbLqHZvTB+sZDZ+fw6AW2XbFtWZMRH9DtJtGHUOuKP
	1qfwfUbyQEeKgyzyWR4UNuo3EIlbvCdW2LBqcDtDRehvvdryS9pi7yUJ/u0ZSIq2
	QIS1BoSNDYJbDyvvB09dRfBFva2iTp7uw6Ol+QWcnoPBILUdf3XGzDxCgkTNyBwQ
	x+FdNsMuokEvzg+duxwQJ78Gn0xwMXmjmDgdCbajjlU420C+nrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkpfjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 01:46:58 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40J9kwfh013475;
	Fri, 19 Jan 2024 01:46:58 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkpfju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 01:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alhQ2Cj1H6q6jnTNHdegN7KHu9Bjh2hDMyUO9wnf2SgBM1Kg4E+qqX+QD8O8SvjUgwVpGA9jmm5hHxcJVe7L0skWkqIq00Ma84uZjlJQRoGiX/MNkc0JHKry3atf06SRgBjmfWdyCL0htCvif/S9g8wIM11/xt+Z7ZI0slaEjDqEqA968WHBN1XbT4gUT2o4EmUPh9u7EqpEjLgvkD1G4SkKB+MxTEYx6rfb3i6ZztwjqCfoJrcT1LEpG37E2+qMjvYGeKQ06ESGC1jFJopH+uPW+MHyjSHUKfE7meUtY9Jq4z9BkUIuD1TPyi84HkIFtMmPA4iQ1/qry76UB8IoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9F6w4fuNpFscROcbiZg+IM86O4+qeGseeZar7GVxBI=;
 b=Y3JprQRrSLePokbKjaFhj9TuSHUXpuqm9OxIlFH0dceu4eLj4MUyPRLlqNVEukyMw93n3a9K0oZs4OwByvlLkcTxRaMMaUNaJUzBRAsJPZRJNl3D9jWmwptBMPDQzTntoN0iAYSydX4xUanDPuGFj9yMSSOEWIa7V2L/UleNEy5P9FgS02OuKEr+yCSh671S5ZOLL2N4bN425+LnJEofWrzotDUj8t3sadYhEw0MpJyhSQeWge05NFqO9UyV/DGC4IMkItPwPcEjnpmlKTONRMZa+gy0gbutPSv0s78pJjc5BRohB35D7a8Luaxt9mHi79NjDMEd85iMCGy527EC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 09:46:54 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::1ebc:2ac8:1853:fc06]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::1ebc:2ac8:1853:fc06%4]) with mapi id 15.20.7181.020; Fri, 19 Jan 2024
 09:46:53 +0000
Content-Type: multipart/alternative;
 boundary="------------8pnG05QjIUkesW5CJGwhqqct"
Message-ID: <612e18ed-e1c1-4c8e-8d09-b8f49dea8795@windriver.com>
Date: Fri, 19 Jan 2024 15:15:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][kirkstone][PATCH 1/1] tiff: fix
 CVE-2023-6228
To: Steve Sakoman <steve@sakoman.com>,
        Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <0101018d1c3d1efe-c3d3daa9-36b9-4ac0-bd6c-2d04c8750cda-000000@us-west-2.amazonses.com>
 <46f26c82-6ff5-4b62-a4b0-c190ad8f34a2@windriver.com>
 <CAOSpxdaY1Cu0esFRFvF5Y9z53MbXGy33Hgp77ZrR+uWzU_34pQ@mail.gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <CAOSpxdaY1Cu0esFRFvF5Y9z53MbXGy33Hgp77ZrR+uWzU_34pQ@mail.gmail.com>
X-ClientProxiedBy: VI1PR06CA0225.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::46) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|IA1PR11MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: ced83a90-58ef-45e0-fca0-08dc18d3914b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hNx4MCooDdObAOTWXyNhogDuFX3GKfm+SjcovKjPp4JPfzOJaur1mJc7L44Gxo3tg2hXE33yZTC4dWmAxg6QS1EqWCJSGvq4HUlBm0QcMUHJVvfirnmPU1wH/AgTvgWvuWGeHTARUcrHc74oFnQWADleX+NFMl2zCbUi19ErxQVhcVD5e/+myhWtpRDZ27k/nZzMinwo3hTvkuMBxZhES5oOiky+dUiBSACJaLOSA+nXR8pg1YVbvlk17OwXh9g047GFdEObKEPi3myIGGjgcgTeIVD5xNHy/3/WnkRFMUC1xtP59ZffvXIrep/UFzUk826RHpjVSkz5hJCUjPoQBMOsa4Yk/T7W1VgaRYitrvRi63XUqi37sODkYrJ3hj/goQkTUxZcao/fkSQbhWTq2SvOKcwZa0Bo/cuVCW5AXM9Mrq+8QstCxNE+1yGxkr4fy+Z3XLb1U1j+fCOhInZW5KtF6RmtdQLR2zIY4RQAAGK1n4qbDjxxD68/Lz/vTFlZDEGsX6aGXfcdXCxDMV5ERyXxztIkcwD8qfHKAl+Ns1V6Biu8OP1JVVxBzhmzmZ0zGX6SgvDYF79Ciop6HPaLdYD0ZvSVY7wvyjQTY7Y/i4M58N2js+kML/N+c/i2ms8l+s1sRZTp607y0nBNnwEMg2WzxSxoRglWVN0W7+zZKW21Iccb3pMKBKlu2l3mMDU2nncky9n54f6TWI78eECJ7YJxCzKC6ysRzBEbZ6zXU98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39850400004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2616005)(6666004)(33964004)(6506007)(53546011)(83380400001)(6636002)(316002)(86362001)(8936002)(26005)(4326008)(66946007)(8676002)(31696002)(110136005)(966005)(6486002)(66476007)(478600001)(6512007)(166002)(38100700002)(66556008)(31686004)(41300700001)(2906002)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUpXektIWmYrRU80cXc4VXJkczVmTTE4T281c0FTQTIyY1F0bTZ6WHJjcE8x?=
 =?utf-8?B?c2srZDJ6cFhSK0Roa1Qzem1JZ3BuYnBJaEU2NHBoamdJQUR3THVBVll2KzVk?=
 =?utf-8?B?dUVGaWtFRlZGbDFHQUF5WDlmRGpTTGswK3ZidGkvVGcwclg0bUM2Y0xxbmtp?=
 =?utf-8?B?cmFMRUNKWS9mSzlMaGpFeG5mTnlPS1pKOWljemlxcVVRZ0doTmptZHJ3dUs1?=
 =?utf-8?B?MHJOMEFpbk5yRmpVYWk1Z2ltMmFGKytuRGcwWUFvR2RJaHA0Q0xjaUJRa0Fo?=
 =?utf-8?B?WmtleWRmTHpibzZLL216WE00bmxvRGZjbHVoVkFPMnVtK1BCbCttYWg4MUkx?=
 =?utf-8?B?ZE0xNjZvMkxmdmdtQmVHLzZpVGJnSU1NTXJzY21HcmJJcnhwRW9GSWQyc2xW?=
 =?utf-8?B?SkFPV0w0bFFMR3g2TjRWT3BIZmI3Mjk4VXBTSmlLUW1aQmxOUk9GVEVNNXZ0?=
 =?utf-8?B?MFhkSG4yQzRCY293T0F3ZFJLcGRVVy9yMUFGMS9oWjlnWGI3YWQyZzdGa29B?=
 =?utf-8?B?by9paWdxUzhCM2d4b2Ewb09ud29kOExkMkZhNFRoU3RFWU9DbDEwMkZKZTRZ?=
 =?utf-8?B?djRlMWh2ZklERUpISmtuOUlVOVg5cTM2am1Cd3k0WVlUdjIwYXJZNld4UDJQ?=
 =?utf-8?B?Tk5QTThUbGRhWDQrSUovUUNJNjFZNTJtUHRjeDREcXB4RHZTWk1VT1NSUHR2?=
 =?utf-8?B?emJ1cnkyUDg0R0tOQU9SN2psWkx0elJBNXQ5c0NZeDQzU3Q1V0pPb1kyN29w?=
 =?utf-8?B?V2lNRUN2U2N4b0F5WXpub2VJZWR4cWRKVkEwcmFvMEp2QlRra2duTVkvMmRG?=
 =?utf-8?B?bTNCVlpXN0oyMFBSMVFoQmJvYjJGQUI2Z2x5THR2OEdjQUZRSVR1RThCVE10?=
 =?utf-8?B?cHdlRnczZUlBR3A4SFlkQ0R3Zklnd1JlVmhFT29wYXlrYTJPTHNzOTdsTGhI?=
 =?utf-8?B?U2ZJR0FBU2FHSmU5dkFycldQS0hDOEdMS3dtenp3S3BDZ0liQk5uaGYzd0Nh?=
 =?utf-8?B?U0tHclBGOTFCNU90aHgyNXpFWnZzVjQvZ0pJRG5DU0I3QVE2T0NCM2pqMCsv?=
 =?utf-8?B?bEZBcGZlNmZtaTlDTVhQYWRBcjBsVHRZOXBLSGZHdlRnZGNoL1QvQ1pPYW9Q?=
 =?utf-8?B?SCtkWlRUaXhScUlzLzdiNWpWMFpxZTRHQTBySUx1VFBHNENwL1hzNEpIWW9K?=
 =?utf-8?B?dklIOENwUzlIb1lVelhjTU9PYmg3OGRQVUc2MUNSMWVSSUU0L1BqLzlEdXFK?=
 =?utf-8?B?V0sxNk5sZkVwaGJDdCtrdHFqVDNQK010U3kwVmU1VWxZWjRBaHBLMms0NHFR?=
 =?utf-8?B?WHN4QlY5d1Z1Ti9XU3JpZ3E0NnBaMmVrTnVvT0tTUXJqWXk1ZTNoV21UYVVD?=
 =?utf-8?B?YjZuM0JKYnRnb1p4YUJtT3JTOXdBK0ZqNXJ5RkU2RFJiL09CS2FFKzZaL3N6?=
 =?utf-8?B?UEoxcTZHUkFjZVRmOGxRVW9MdkEwUzVrU3VPRVZDcjdNMnRJTkFiWmoyU0Rk?=
 =?utf-8?B?WlJTMXM0eDBNdStITS9OM05SWElpMDZMQU1hVWo5UDRKcmJhZWRLRno0eU5s?=
 =?utf-8?B?NHk3VTROWFcrUG40VkdaV2R0WkE2dDZyeHBnRTdmUXE1QzRwaXBuSWtuVnQw?=
 =?utf-8?B?bzVpQ3NOZEpWT1UzK3pNTU12YythMGsrcUlaWWdwNEtNOEhHUzN6OEhDQ0lM?=
 =?utf-8?B?eXBRbDZjcEREQWIzV1RFVUk3QkFXZ25lT1lPUmV6NXdjOE9VTXI3SkhMUmUz?=
 =?utf-8?B?OEdYNUFJNjcyU1BXZ1IrSHRzbWdGL24zSVp5am5GL0pmeXprWkVnMlJnUEVQ?=
 =?utf-8?B?WDRyaVpONlliUGtNRzRuV2JTcjVJSStOa3pCVERVNEdxR0lVYWt1TzFDUk96?=
 =?utf-8?B?T2tCZkt5emtBTXlsbFdOMmM3bCtVNzZRUGVBeHltb3A0dm5lcGlJMlJ3M2Nu?=
 =?utf-8?B?OGZLR09KKytNMnV0WGthUnlJM3JYSmF1SHUzS2JhU2VaV2NUT0FlWlVFdUt2?=
 =?utf-8?B?UkVWcDluVzBmaEhXLzdlTWxnejJyQUlodDhhYXJpbXRZT2JWdEY3Z280OENp?=
 =?utf-8?B?WmRXQmRrLy9IN3pBVUxpdkxvaWpwU2N3UkQxTS9rUE14UGVSOG5iYVBJYXZE?=
 =?utf-8?B?WTZSYnBwRDUwblhydjBQRW1MRGRPV1FYN2t5R3N5ckFWN0JZeHFrbCszYzlR?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced83a90-58ef-45e0-fca0-08dc18d3914b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 09:46:53.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERCknl+nKmKNpIBVk2KXKz9tOuPpMZt5jB4GkzbtiTudiOLza7FhiiZPy3PFdznfEPBi71b57LObShFQYcFkwR1Ah6jvsimyd4i4EaOsyFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
X-Proofpoint-ORIG-GUID: OglJBFfkdlOLO0HQllSsXLEzifluUIm_
X-Proofpoint-GUID: lMMzDODPpBEWpEEL5vgdXmw4Xkgu1FYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 09:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194022

--------------8pnG05QjIUkesW5CJGwhqqct
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40J6i7ug021870

Hi Steve,

I will send v2.

../Yogita

On 19-01-2024 03:56, Steve Sakoman wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Thu, Jan 18, 2024 at 12:21=E2=80=AFPM Randy MacLeod=20
> <randy.macleod@windriver.com> wrote:
>
>     Yogita,
>
>     Pleae tell people if you will send a v2 or if you plan to fix the
>     warning in a follow-up commit.
>
>     I don't see your commit in Steve's kirkstone-nut repo so I think
>     he's expecting a v2.
>
>     https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsta=
ble/kirkstone-nut
>     <https://urldefense.com/v3/__https://git.openembedded.org/openembed=
ded-core-contrib/log/?h=3Dstable*kirkstone-nut__;Lw!!AjveYdw8EvQ!YU0jUlES=
ROyvIHz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKXqaSdFMkZrr5_0JCJCKv7BOX6c=
9s$>\
>
>
> I was expecting a response as to which approach would be taken.=C2=A0 W=
hen=20
> there was no response I removed the patch under the theory that it is=20
> better not to merge a half right CVE fix.
>
> Steve
>
>
>     -------- Forwarded Message --------
>     Subject: 	Patchtest results for [OE-core][kirkstone][PATCH 1/1]
>     tiff: fix CVE-2023-6228
>     Date: 	Thu, 18 Jan 2024 11:03:04 +0000
>     From: 	Patchtest via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!YU0jUlESROyvIHz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKXqaSdFMkZr=
r5_0JCJCKv7tnqDBQM$>
>     <patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org>
>     <mailto:patchtest=3Dautomation.yoctoproject.org@lists.openembedded.=
org>
>     Reply-To: 	patchtest@automation.yoctoproject.org
>     To: 	yurade <yogita.urade@windriver.com>
>     <mailto:yogita.urade@windriver.com>
>     CC: 	openembedded-core@lists.openembedded.org
>
>
>
>     Thank you for your submission. Patchtest identified one
>     or more issues with the patch. Please see the log below for
>     more information:
>
>     ---
>     Testing patch
>     /home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE-2023-6228.p=
atch
>
>     FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and
>     should be replaced by CVE_STATUS
>     (test_metadata.TestMetadata.test_cve_check_ignore)
>
>     PASS: pretest src uri left files
>     (test_metadata.TestMetadata.pretest_src_uri_left_files)
>     PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format=
)
>     PASS: test Signed-off-by presence
>     (test_mbox.TestMbox.test_signed_off_by_presence)
>     PASS: test Signed-off-by presence
>     (test_patch.TestPatch.test_signed_off_by_presence)
>     PASS: test Upstream-Status presence
>     (test_patch.TestPatch.test_upstream_status_presence_format)
>     PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>     PASS: test commit message presence
>     (test_mbox.TestMbox.test_commit_message_presence)
>     PASS: test lic files chksum modified not mentioned
>     (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_ment=
ioned)
>     PASS: test max line length
>     (test_metadata.TestMetadata.test_max_line_length)
>     PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>     PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade=
)
>     PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format=
)
>     PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length=
)
>     PASS: test src uri left files
>     (test_metadata.TestMetadata.test_src_uri_left_files)
>
>     SKIP: pretest pylint: No python related patches, skipping test
>     (test_python_pylint.PyLint.pretest_pylint)
>     SKIP: test bugzilla entry format: No bug ID found
>     (test_mbox.TestMbox.test_bugzilla_entry_format)
>     SKIP: test lic files chksum presence: No added recipes, skipping
>     test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>     SKIP: test license presence: No added recipes, skipping test
>     (test_metadata.TestMetadata.test_license_presence)
>     SKIP: test pylint: No python related patches, skipping test
>     (test_python_pylint.PyLint.test_pylint)
>     SKIP: test series merge on head: Merge test is disabled for now
>     (test_mbox.TestMbox.test_series_merge_on_head)
>     SKIP: test summary presence: No added recipes, skipping test
>     (test_metadata.TestMetadata.test_summary_presence)
>     SKIP: test target mailing list: Series merged, no reason to check
>     other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
>     ---
>
>     Please address the issues identified and
>     submit a new revision of the patch, or alternatively, reply to this
>     email with an explanation of why the patch should be accepted. If y=
ou
>     believe these results are due to an error in patchtest, please
>     submit a
>     bug at https://bugzilla.yoctoproject.org/
>     <https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/__;!=
!AjveYdw8EvQ!YU0jUlESROyvIHz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKXqaSd=
FMkZrr5_0JCJCKv7cTLpTjc$>
>     (use the 'Patchtest' category
>     under 'Yocto Project Subprojects'). For more information on specifi=
c
>     failures, see: https://wiki.yoctoproject.org/wiki/Patchtest
>     <https://urldefense.com/v3/__https://wiki.yoctoproject.org/wiki/Pat=
chtest__;!!AjveYdw8EvQ!YU0jUlESROyvIHz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqg=
kBVcKXqaSdFMkZrr5_0JCJCKv7xETUYNk$>.
>     Thank
>     you!
>
--------------8pnG05QjIUkesW5CJGwhqqct
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40J6i7ug021870

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Steve,<br>
      <br>
      I will send v2.<br>
      <br>
      ../Yogita<br>
    </p>
    <div class=3D"moz-cite-prefix">On 19-01-2024 03:56, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaY1Cu0esFRFvF5Y9z53MbXGy=
33Hgp77ZrR+uWzU_34pQ@mail.gmail.com">
      <strong>
      </strong>
      <div><strong><span>CAUTION: This email comes from a non Wind River
            email account!</span></strong><br>
        <span>Do not click links or open attachments unless you
          recognize the sender and know the content is safe.</span><br>
      </div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 18, 2024 at
              12:21=E2=80=AFPM Randy MacLeod &lt;<a href=3D"mailto:randy.=
macleod@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">randy.macleod@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote">
              <div>
                <p>Yogita,<br>
                </p>
                <div>Pleae tell people if you will send a v2 or if you
                  plan to fix the warning in a follow-up commit.</div>
                <div><br>
                </div>
                <div>I don't see your commit in Steve's kirkstone-nut
                  repo so I think he's expecting a v2.</div>
                <div><br>
                </div>
                <div><a href=3D"https://urldefense.com/v3/__https://git.o=
penembedded.org/openembedded-core-contrib/log/?h=3Dstable*kirkstone-nut__=
;Lw!!AjveYdw8EvQ!YU0jUlESROyvIHz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKX=
qaSdFMkZrr5_0JCJCKv7BOX6c9s$" target=3D"_blank" moz-do-not-send=3D"true">=
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut</a>\</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I was expecting a response as to which approach would
              be taken.&nbsp; When there was no response I removed the pa=
tch
              under the theory that it is better not to merge a half
              right CVE fix.</div>
            <div><br>
            </div>
            <div>Steve</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote">
              <div>
                <div>-------- Forwarded Message --------
                  <table>
                    <tbody>
                      <tr>
                        <th nowrap=3D"nowrap">Subject: </th>
                        <td>Patchtest results for
                          [OE-core][kirkstone][PATCH 1/1] tiff: fix
                          CVE-2023-6228</td>
                      </tr>
                      <tr>
                        <th nowrap=3D"nowrap">Date: </th>
                        <td>Thu, 18 Jan 2024 11:03:04 +0000</td>
                      </tr>
                      <tr>
                        <th nowrap=3D"nowrap">From: </th>
                        <td>Patchtest via <a href=3D"https://urldefense.c=
om/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!YU0jUlESROyvIHz4FVZ=
rOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKXqaSdFMkZrr5_0JCJCKv7tnqDBQM$" target=
=3D"_blank" moz-do-not-send=3D"true">
                            lists.openembedded.org</a> <a href=3D"mailto:=
patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org" target=3D=
"_blank" moz-do-not-send=3D"true">
&lt;patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org&gt;</a=
></td>
                      </tr>
                      <tr>
                        <th nowrap=3D"nowrap">Reply-To: </th>
                        <td><a href=3D"mailto:patchtest@automation.yoctop=
roject.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">patchtest@automation.yoctoproject.org</a></td>
                      </tr>
                      <tr>
                        <th nowrap=3D"nowrap">To: </th>
                        <td>yurade <a href=3D"mailto:yogita.urade@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true">&lt;yogita.urade@windr=
iver.com&gt;</a></td>
                      </tr>
                      <tr>
                        <th nowrap=3D"nowrap">CC: </th>
                        <td><a href=3D"mailto:openembedded-core@lists.ope=
nembedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">openembedded-core@lists.openembedded.org</a></td>
                      </tr>
                    </tbody>
                  </table>
                  <br>
                  <br>
                  Thank you for your submission. Patchtest identified
                  one<br>
                  or more issues with the patch. Please see the log
                  below for<br>
                  more information:<br>
                  <br>
                  ---<br>
                  Testing patch
                  /home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE=
-2023-6228.patch<br>
                  <br>
                  FAIL: test CVE check ignore: CVE_CHECK_IGNORE is
                  deprecated and should be replaced by CVE_STATUS
                  (test_metadata.TestMetadata.test_cve_check_ignore)<br>
                  <br>
                  PASS: pretest src uri left files
                  (test_metadata.TestMetadata.pretest_src_uri_left_files)=
<br>
                  PASS: test CVE tag format
                  (test_patch.TestPatch.test_cve_tag_format)<br>
                  PASS: test Signed-off-by presence
                  (test_mbox.TestMbox.test_signed_off_by_presence)<br>
                  PASS: test Signed-off-by presence
                  (test_patch.TestPatch.test_signed_off_by_presence)<br>
                  PASS: test Upstream-Status presence
                  (test_patch.TestPatch.test_upstream_status_presence_for=
mat)<br>
                  PASS: test author valid
                  (test_mbox.TestMbox.test_author_valid)<br>
                  PASS: test commit message presence
                  (test_mbox.TestMbox.test_commit_message_presence)<br>
                  PASS: test lic files chksum modified not mentioned
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)=
<br>
                  PASS: test max line length
                  (test_metadata.TestMetadata.test_max_line_length)<br>
                  PASS: test mbox format
                  (test_mbox.TestMbox.test_mbox_format)<br>
                  PASS: test non-AUH upgrade
                  (test_mbox.TestMbox.test_non_auh_upgrade)<br>
                  PASS: test shortlog format
                  (test_mbox.TestMbox.test_shortlog_format)<br>
                  PASS: test shortlog length
                  (test_mbox.TestMbox.test_shortlog_length)<br>
                  PASS: test src uri left files
                  (test_metadata.TestMetadata.test_src_uri_left_files)<br=
>
                  <br>
                  SKIP: pretest pylint: No python related patches,
                  skipping test
                  (test_python_pylint.PyLint.pretest_pylint)<br>
                  SKIP: test bugzilla entry format: No bug ID found
                  (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
                  SKIP: test lic files chksum presence: No added
                  recipes, skipping test
                  (test_metadata.TestMetadata.test_lic_files_chksum_prese=
nce)<br>
                  SKIP: test license presence: No added recipes,
                  skipping test
                  (test_metadata.TestMetadata.test_license_presence)<br>
                  SKIP: test pylint: No python related patches, skipping
                  test (test_python_pylint.PyLint.test_pylint)<br>
                  SKIP: test series merge on head: Merge test is
                  disabled for now
                  (test_mbox.TestMbox.test_series_merge_on_head)<br>
                  SKIP: test summary presence: No added recipes,
                  skipping test
                  (test_metadata.TestMetadata.test_summary_presence)<br>
                  SKIP: test target mailing list: Series merged, no
                  reason to check other mailing lists
                  (test_mbox.TestMbox.test_target_mailing_list)<br>
                  <br>
                  ---<br>
                  <br>
                  Please address the issues identified and<br>
                  submit a new revision of the patch, or alternatively,
                  reply to this<br>
                  email with an explanation of why the patch should be
                  accepted. If you<br>
                  believe these results are due to an error in
                  patchtest, please submit a<br>
                  bug at <a href=3D"https://urldefense.com/v3/__https://b=
ugzilla.yoctoproject.org/__;!!AjveYdw8EvQ!YU0jUlESROyvIHz4FVZrOrilRo-Y5kO=
1NUfhHnoIBHX50tcIqgkBVcKXqaSdFMkZrr5_0JCJCKv7cTLpTjc$" target=3D"_blank" =
moz-do-not-send=3D"true">
                    https://bugzilla.yoctoproject.org/</a> (use the
                  'Patchtest' category<br>
                  under 'Yocto Project Subprojects'). For more
                  information on specific<br>
                  failures, see: <a href=3D"https://urldefense.com/v3/__h=
ttps://wiki.yoctoproject.org/wiki/Patchtest__;!!AjveYdw8EvQ!YU0jUlESROyvI=
Hz4FVZrOrilRo-Y5kO1NUfhHnoIBHX50tcIqgkBVcKXqaSdFMkZrr5_0JCJCKv7xETUYNk$" =
target=3D"_blank" moz-do-not-send=3D"true">
                    https://wiki.yoctoproject.org/wiki/Patchtest</a>.
                  Thank<br>
                  you!<br>
                  <br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------8pnG05QjIUkesW5CJGwhqqct--

