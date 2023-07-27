Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74510C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 10:53:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4474.1690455231523405520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 03:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=A00mBIV/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6572c8459e=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R9xRZW027091
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 03:53:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=Y+y4e
	Rx87M2OO94a/O2IZIcTDIYvfHqQyVoI+qM85yE=; b=A00mBIV/YZRxUwiHDvRbV
	qWIvu/M3ql6cYDLUp0UYrTbsFkZz6vThVEZLZ1DyYT8SwFnuFPgmnZG45WWbblpN
	pu8UV87JgZnH4WF2wS5NPvDE6XTRL34Pnv4YRgy1YDy4KtWl0UJkgeyEJst+vqL/
	L4y7sDyK4nEqAaG3zE1sei21ysF3LNCEee7mCG1TFWPF2ap2vjadjJRtL4lZGFTN
	CtMOgouStLrKPSK3USXvIvQZHYOEW4rcyj1R608QbA4W1yVjZLanu6PVYuvT/8b2
	DmQvZVJvHssG5UEYkYYUbnScTsP7XDrh668+5ToZqoK605YFEj9kZNg/nQ2TlP2z
	Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad04age-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 03:53:50 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36RAroP2009620
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 03:53:50 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad04agc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 03:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8sTGGVZANQ0uYu1/Q4C7P+jSk3ggko/bpzImYNvaiaInvxSLeRG3t4PHSRJuynDrOP+milIae/G64gMrVyVpeU0JviQ1niSOovhwgK2Djye/gteblM1abWYXqdbYVRynw8Xlby0sFTr+HpnZG53vpIElyNac4Il+/m28eAJymQjwWJNmuBblRndqgCo3lIaT+zyJMCt0FEi4+WqU5ZFcz3bdRAW/4zP2Ew5hV21GlIP1TUUsKe8Bc8pSjd1siW7OkFQ51EIx02QzeviB7R2y+LbDKgihzcJubKfrMxrKmn54hUyKi1qTc91WlUGWZZ+YByfPySAmKMteuB2DU3e9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+y4eRx87M2OO94a/O2IZIcTDIYvfHqQyVoI+qM85yE=;
 b=f47vVW0KxGvYOc5aKTjSsoyUrsUlkks3kWAkfnEmJ1DNIivi6kDbCvSpo0IxhYZW0/f5UPkNjp6t55OefhYcR3mZHJCVKPTl0rzbJgdLCXas4s0exp9t2PzUkKETMky6LX/H1zfmQ/E2Xa5/ajtNmYms2JsJh9r5tzuYErGyK9QeTbn1COeFD7E3SncuiCz1cx/SrX9yzrv1gWyrKYEUzNWQiJE7t9RKkLBt1tNx3y+qK31M0bDQ0ytFynMxspsNPKwRqSr7eV/lrDluX4HPULn85kluA6xxp+gqx9Mxe35z/xKXg0sGYh+T5ol/wB280S3FdnFW6DSrkg9Kyf0oDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 10:53:46 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::2279:5c96:668d:f829]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::2279:5c96:668d:f829%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:53:45 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kalappa0@gmail.com
Subject: [kirkstone][PATCH] gcc : upgrade to v11.4
Date: Thu, 27 Jul 2023 03:53:15 -0700
Message-Id: <20230727105315.97551-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|SA2PR11MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b1f534-df72-4847-52f3-08db8e8fbfb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kHxFfn1EiMvjSM/Jkw6fV1/UG0tbXjnPB4e1rMGcwS0MmJqF139JHc4wdIkvsUkRrM3YPRonxndh0Pzl+QNEouMKsxMXb0uBHosuFlZ4W7uLoBNXuNfUnTVDZgVATR3vikBWv7c/W0Yk61YWZpLEAEPQaRr1FWyOFjB8Nw+BIk+eXQA8hyuKWhA8DTdC3fJpdY2+wjVq79ndEH1zG+QWDKDiJrDk2jE8VqpIeQhORNUZnxSI4RZMCUJ3BO6+2RwDkRoRW9WDFKvKfc9WEQvpd9fE9fClRUeHp0OwOeOOuyxh6JHdqOGk3IGBphDb2GawMiBe2gvTRoAbYMxAN6ja43lYFiE19bu6esI4KxQs+r8Ut6LUXNx4DLm4PrppV7bhWDjGUo9A1lK0yd9XpzJxn+bgBCSchbNRQNxROmPp1SwAVB2+QhnY+YvKtWxsdK8KVVzdqw7meUsdnKqFFwnm+nT/L1pWWCVOipIpDK9AxCgwzpUCkLSHnbmHOAp6O2QsagUz9uViy/moimSkS1EiNd4NuLqdHzV3R7h8lxh5VNQKigpViZbqGfqvrVrTDh4tY3aWU/a/8Eth+6Dgywg71u/e+qaq9N/HJwxzd8wZ8dQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(451199021)(30864003)(83380400001)(2906002)(66946007)(66556008)(66476007)(6512007)(2616005)(36756003)(86362001)(38350700002)(38100700002)(52116002)(19627235002)(478600001)(6506007)(1076003)(6666004)(6486002)(26005)(186003)(966005)(41300700001)(5660300002)(6916009)(4326008)(316002)(84970400001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXdOVWlOY0xZYUVhQ0dxMkhhVHlzMWlEWnpNbVpESVZXanhwU29obG5EbGFU?=
 =?utf-8?B?c2xaLzZhSlU1MWduMHp3c0VhbW5FUFNCakRtYXlJZjAyWVVGVHh0WVNRRVM3?=
 =?utf-8?B?MTBDRS8zZzkzSC9iOXJRS0daaGlWRHV5MmE4OTBvK2FFMlZlTmZ3MzJvUUov?=
 =?utf-8?B?OEx0ZzFaUlluczM5YlRwSVpFMXRMV2RwTVYzSHF2VEVNdnExK3RzYUE0Szlq?=
 =?utf-8?B?L3hDRkk4WWZYaXNEdCtzTXJkQ0JWMUluNjdNcU5xdi9hR0w3Tjk2UGxLRXow?=
 =?utf-8?B?QTAwRjdnMkVXTTdpNmhKRkRRY0E3ZHQyalpYWGVhUEFtdVFsZ3Q1RkNFR1Nk?=
 =?utf-8?B?NmNHMXN6bWlQdjlmMUFHYmx0OXcxM3N0Qm1zUG9FdEpsWEJvR1pZUlovRGty?=
 =?utf-8?B?ZTRWaHZGS25TYzFHS1Bzd1ZrakZOYjd4eWxuOGcyZ0R1V2JBMWxTZW9kWkQr?=
 =?utf-8?B?NGZuejZtQzBzMHpRbFM1M24vanhNeXBCQnRndElJZ2NSVlZ1dFJqeVNueUo5?=
 =?utf-8?B?S1J5SjdMaCtiMmlRYVBIejNzTWNQb3Z6T3BHa281K091V1F6WmI3Q0hQNHdV?=
 =?utf-8?B?UU1iRXBXUDVsc0drMjZ2TFRGWTM1QXFtUkV5UzA0TE5BdmZ2dlhrUHZFNkNG?=
 =?utf-8?B?OWlTUVdKOWFNMEJEY0pwZjgvMlpVUG43OEZsU2xZUUV5czlHSXlCVW9nd2Vo?=
 =?utf-8?B?eTFXejRFY2hybm94d05nZ04vbER1YTBRbFNVMEdWMENLYjUvcEpMMllYaXVk?=
 =?utf-8?B?T24rakU2MGR0elVpV1FEbjBDZ3U1bi9lazg5ZE83c2lwRUFMN0l5ZlNnT09o?=
 =?utf-8?B?QzdnRzJwcVFQYm1lLzlMTW1TSFR2L0luRU16THI3dmJ5OWdIYlpZZ00wUW05?=
 =?utf-8?B?c1BnTGJtMk96ZDdZUEVCN0xVU1NrM3UzZy9NY2FOTWxTeTFHSUpmaU5nR1J0?=
 =?utf-8?B?NTllUTZRNXM1bWNqWkpJdmkwbG5aWEdXZXE1Sm1iSzcyR2pnM0IwbmJBTzRZ?=
 =?utf-8?B?UEtHdmtrdWR3MVBYNlJUMW5DckhGY1IwOFFVaVdTWVRXL2Y1aTQ4Y0ZPWEdr?=
 =?utf-8?B?OUs1VHBKZlQxWlVlWGVHZ2ZuNitMQ0JVeTVrS0g3R3hOcDVrYVcwZGdEMHJ0?=
 =?utf-8?B?cTlqcEJWaUNBV1lPb1RqK0ttd0ZMeW95THNwOEdtTUNWMXNrRFRhYkl5SzNq?=
 =?utf-8?B?ei9Ic3FiYnpyRjExcExZcENneExvalJWb01DdHVpUWlqOUk1NHFpODhBV3Bw?=
 =?utf-8?B?U0drVVBtLzlLQnZvSy9GU2NoQXBxREZwOExCYXUzRFJ5YlBuZzhOUjI2RTJt?=
 =?utf-8?B?M24vV0FqL2RtaVhkdXErSlZvZGZ5YTJ2ZmpFQ1kwWC9IMUNoTGt3VmpqM1Q2?=
 =?utf-8?B?UnkvSUV3aUxPMGgraEk3NVBjcU5uSHpLdld2V0Jyck5yQWJoZlJnTWRpVlJD?=
 =?utf-8?B?UmFiTFFucm9pU0p0a2d4dFVzYW0vRGJJcmVjZXRSTnZRdExXQzhvQnR4SStX?=
 =?utf-8?B?UTRRRjFpemVrRDNKSW1MelJLazdEeWxURGxINDF4cjYya21ySlJNb1B2a25R?=
 =?utf-8?B?NXhGNlhyZXRVT3h4b3Bld1RNbXFvT0hvZENaUjcvZFRmZDNqekQzcXZ1MUxO?=
 =?utf-8?B?RFdoSXV2Z3BocGxldDgwbExROXdsUTJVV3pwKzlHSTFaekZPNW1hTnpYM2hX?=
 =?utf-8?B?eVRtSG9CS1VHTllhU1RhTCtjU2J5YWI1WHU2YnlqdHF0bnVSZWRzakZJZTJV?=
 =?utf-8?B?aDU3c2ZaeGJ4cXNDQjJ4eXAxRXlxUjRWeldNRkRBS25lNmlHbFY2UGhVajYx?=
 =?utf-8?B?Y1dxQnZ1ZjZ1cTVlTkZ2OFhOTktuY0Q4cHdSV0pCS1JId28zWWhTeHlCSU54?=
 =?utf-8?B?dFhQaGhseHFBd1RVbFhWRzlYSWxCSUI2T2RwbVZWOUtTdk1RanViY0RlZlRG?=
 =?utf-8?B?SzdwbHhFK1JOOWxJMWU1YTR2bE9rOTR4QkluSDRmTmtXWklETTA4T3Q4T1Ux?=
 =?utf-8?B?emRtQlBlMUZhQmpzaVBZaE55STN0WWVudnRzVDFGWDFwWk9xS1FkZkcybFR5?=
 =?utf-8?B?UlM3ZWNpaWg4REpGdGdIL0pGMVI5ZkxhM2R6b1Vpek1ZZytEREl1V2hxcXdY?=
 =?utf-8?B?U0VOMmlsUHRGZS82SllZL2oyVlV3OUdvRVJaK25XUnZlTVdRSVUrMXBLdEEw?=
 =?utf-8?Q?yFBtkIJOWlVW7xK6BD7EW/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b1f534-df72-4847-52f3-08db8e8fbfb8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 10:53:45.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBAjEsxM72tvFhhgtB89ZGWRDln1ybU11Gh8JHAjb1hp0wrNxvpQa8/qPF0JrzOPnU1D9dofR8G4hKEgRbYqMTGNAoho9uo7N8OunZY1Cfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5035
X-Proofpoint-ORIG-GUID: z_Qlp0Sl97G1jXFngHbtfA1IphPj3urp
X-Proofpoint-GUID: 3ltUYkZosW8thXQXsiu6z1guty7KOI5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307270097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36R9xRZW027091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 10:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184927

gcc stable version upgraded from v11.3 to v11.4

For changes in v11.4 see - https://gcc.gnu.org/gcc-11/changes.html

Below is the bug fix list for v11.4
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&order=3Dsh=
ort_desc%2Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&query_format=3Dad=
vanced&resolution=3DFIXED&target_milestone=3D11.4

There are a total 115 bugs are fixed in this release, below is the list o=
f bugs fixed excluding the regression fixes.

ID	Product	Comp	    Resolution	Summary=E2=96=B2
108199	gcc	tree-opt	FIXE	Bitfields, unions and SRA and storage_order_attr=
ibute
107801	gcc	libstdc+	FIXE	Building cross compiler for H8 family fails in l=
ibstdc++ (c++17/memory_resource.cc)
108265	gcc	libstdc+	FIXE	chrono::hh_mm_ss can't be constructed from unsig=
ned durations
104443	gcc	libstdc+	FIXE	common_iterator<I, S>::operator-> is not correct=
ly implemented
98056	gcc	c++		FIXE	coroutines: ICE tree check: expected record_type or u=
nion_type or qual_union_type, have array_type since r11-2183-g0f66b8486ce=
a8668
107061	gcc	target		FIXE	ENCODEKEY128 clobbers xmm4-xmm6
105433	gcc	testsuit	FIXE	FAIL: gcc.target/i386/iamcu/test_3_element_struc=
t_and_unions.c
105095	gcc	testsuit	FIXE	gcc.dg/vect/complex/fast-math-complex-* tests ar=
e not executed
100474	gcc	c++		FIXE	ICE: in diagnose_trait_expr, at cp/constraint.cc:370=
6
105854	gcc	target		FIXE	ICE: in extract_constrain_insn, at recog.cc:2692 =
(insn does not satisfy its constraints: sse2_lshrv1ti3)
104462	gcc	target		FIXE	ICE: in extract_constrain_insn_cached, at recog.c=
c:2682 with -mavx512fp16 -mno-xsave
106045	gcc	libgomp		FIXE	Incorrect testcase in libgomp.c/target-31.c at -=
O0
56189	gcc	c++		FIXE	Infinite recursion with noexcept when instantiating f=
unction template
100295	gcc	c++		FIXE	Internal compiler error from generic lambda capturin=
g parameter pack and expanding it in if constexpr
100613	gcc	jit		FIXE	libgccjit should produce dylib on macOS
104875	gcc	libstdc+	FIXE	libstdc++-v3/src/c++11/codecvt.cc:312:24: warnin=
g: left shift count >=3D width of type
107471	gcc	libstdc+	FIXE	mismatching constraints in common_iterator
105284	gcc	libstdc+	FIXE	missing syncstream and spanstream forward decl. =
in <iosfwd>
98821	gcc	c++		FIXE	modules : c++tools configures with CC but code fragme=
nts assume CXX.
109846	gcc	fortran		FIXE	Pointer-valued function reference rejected as ac=
tual argument
101324	gcc	target		FIXE	powerpc64le: hashst appears before mflr at -O1 or=
 higher
102479	gcc	c++		FIXE	segfault when deducing class template arguments for =
tuple with libc++-14
105128	gcc	libstdc+	FIXE	source_location compile error for latest clang 1=
5
106183	gcc	libstdc+	FIXE	std::atomic::wait might fail to be unblocked by =
notify_one/all on platforms without platform_wait()
102994	gcc	libstdc+	FIXE	std::atomic<ptr>::wait is not marked const
105324	gcc	libstdc+	FIXE	std::from_chars() assertion at floating_from_cha=
rs.cc:78 when parsing 1.11111111....
105375	gcc	libstdc+	FIXE	std::packaged_task has no deduction guide.
104602	gcc	libstdc+	FIXE	std::source_location::current uses cast from voi=
d*
106808	gcc	libstdc+	FIXE	std::string_view range concept requirement cause=
s compile error with Boost.Filesystem
105725	gcc	c++		FIXE	[ICE] segfault with `-Wmismatched-tags`
105920	gcc	target		FIXE	__builtin_cpu_supports ("f16c") should check AVX

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 .../gcc/{gcc-11.3.inc =3D> gcc-11.4.inc}        |   6 +-
 ...ian_11.3.bb =3D> gcc-cross-canadian_11.4.bb} |   0
 .../{gcc-cross_11.3.bb =3D> gcc-cross_11.4.bb}  |   0
 ...-crosssdk_11.3.bb =3D> gcc-crosssdk_11.4.bb} |   0
 ...cc-runtime_11.3.bb =3D> gcc-runtime_11.4.bb} |   0
 ...itizers_11.3.bb =3D> gcc-sanitizers_11.4.bb} |   0
 ...{gcc-source_11.3.bb =3D> gcc-source_11.4.bb} |   0
 ...rch64-Update-Neoverse-N2-core-defini.patch |  20 ++--
 ...rm-add-armv9-a-architecture-to-march.patch |  54 +++++-----
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 102 +++++++++---------
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 .../gcc/{gcc_11.3.bb =3D> gcc_11.4.bb}          |   0
 ...initial_11.3.bb =3D> libgcc-initial_11.4.bb} |   0
 .../gcc/{libgcc_11.3.bb =3D> libgcc_11.4.bb}    |   0
 ...ibgfortran_11.3.bb =3D> libgfortran_11.4.bb} |   0
 15 files changed, 92 insertions(+), 96 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.3.inc =3D> gcc-11.4.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb =3D> gcc-cr=
oss-canadian_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb =3D> gcc-cross_11.4.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb =3D> gcc-crosssdk=
_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb =3D> gcc-runtime_1=
1.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb =3D> gcc-saniti=
zers_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb =3D> gcc-source_11.=
4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_11.3.bb =3D> gcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb =3D> libgcc-ini=
tial_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.3.bb =3D> libgcc_11.4.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb =3D> libgfortran_1=
1.4.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.4.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-11.3.inc
rename to meta/recipes-devtools/gcc/gcc-11.4.inc
index ab2ece3cce..a907661df4 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.4.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "11.3.0"
+PV =3D "11.4.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "11.3.0"
+BINV =3D "11.4.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -70,7 +70,7 @@ SRC_URI =3D "\
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
 "
=20
-SRC_URI[sha256sum] =3D "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a=
5e1c89e338a3ac39"
+SRC_URI[sha256sum] =3D "3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055ee7=
2c1402cea73a8dd9"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
=20
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.3.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.3.bb b/meta/recipes-=
devtools/gcc/gcc-source_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N=
2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-N=
eoverse-N2-core-defini.patch
index 8429242348..a0c9db72e1 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-=
defini.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-=
defini.patch
@@ -19,24 +19,20 @@ diff --git a/gcc/config/aarch64/aarch64-cores.def b/g=
cc/config/aarch64/aarch64-c
 index 4643e0e27..3478e567a 100644
 --- a/gcc/config/aarch64/aarch64-cores.def
 +++ b/gcc/config/aarch64/aarch64-cores.def
-@@ -145,9 +145,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cort=
exa57, 8_4A,  AARCH64_FL_FOR
- /* Qualcomm ('Q') cores. */
- AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01,=
 -1)
-=20
--/* Armv8.5-A Architecture Processors.  */
+@@ -147,7 +147,6 @@
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
+
+ /* Armv8.5-A Architecture Processors.  */
 -AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_F=
L_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARC=
H64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
--
+ AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_F=
L_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARC=
H64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
+
  /* ARMv8-A big.LITTLE implementations.  */
-=20
- AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8=
A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_L=
ITTLE (0xd07, 0xd03), -1)
-@@ -163,4 +160,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cort=
exa55, cortexa53, 8_2A,  AAR
+@@ -165,4 +164,7 @@
  /* Armv8-R Architecture Processors.  */
  AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARC=
H8_R, cortexa53, 0x41, 0xd15, -1)
-=20
+
 +/* Armv9-A Architecture Processors. */
 +AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_A=
RCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARC=
H64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0x=
d49, -1)
 +
  #undef AARCH64_CORE
---=20
-2.32.0
=20
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architect=
ure-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-a=
rchitecture-to-march.patch
index 864c8b3017..b9b0988d5a 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-=
march.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-=
march.patch
@@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.c=
om>
  gcc/testsuite/lib/target-supports.exp     |  3 ++-
  9 files changed, 79 insertions(+), 8 deletions(-)
=20
-Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
+Index: gcc/gcc/config/arm/arm-cpus.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/arm-cpus.in
-+++ gcc-11.3.0/gcc/config/arm/arm-cpus.in
+--- a/gcc/config/arm/arm-cpus.in
++++ b/gcc/config/arm/arm-cpus.in
 @@ -132,6 +132,9 @@ define feature cmse
  # Architecture rel 8.1-M.
  define feature armv8_1m_main
@@ -87,10 +87,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
  begin arch iwmmxt
   tune for iwmmxt
   tune flags LDSCHED STRONG XSCALE
-Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
+Index: gcc/gcc/config/arm/arm-tables.opt
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt
-+++ gcc-11.3.0/gcc/config/arm/arm-tables.opt
+--- a/gcc/config/arm/arm-tables.opt
++++ b/gcc/config/arm/arm-tables.opt
 @@ -380,10 +380,13 @@ EnumValue
  Enum(arm_arch) String(armv8.1-m.main) Value(30)
 =20
@@ -107,10 +107,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
 =20
  Enum
  Name(arm_fpu) Type(enum fpu_type)
-Index: gcc-11.3.0/gcc/config/arm/arm.h
+Index: gcc/gcc/config/arm/arm.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/arm.h
-+++ gcc-11.3.0/gcc/config/arm/arm.h
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
 @@ -456,7 +456,8 @@ enum base_architecture
    BASE_ARCH_8A =3D 8,
    BASE_ARCH_8M_BASE =3D 8,
@@ -121,10 +121,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm.h
  };
 =20
  /* The major revision number of the ARM Architecture implemented by the=
 target.  */
-Index: gcc-11.3.0/gcc/config/arm/t-aprofile
+Index: gcc/gcc/config/arm/t-aprofile
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/t-aprofile
-+++ gcc-11.3.0/gcc/config/arm/t-aprofile
+--- a/gcc/config/arm/t-aprofile
++++ b/gcc/config/arm/t-aprofile
 @@ -26,8 +26,8 @@
 =20
  # Arch and FPU variants to build libraries with
@@ -180,10 +180,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-aprofile
 -			     $(foreach ARCH, armv7-a armv8-a, \
 +			     $(foreach ARCH, armv7-a armv8-a armv9-a, \
  			       mthumb/march.$(ARCH)/mfloat-abi.soft=3Dm$(MODE)/march.$(ARCH)=
/mfloat-abi.softfp))
-Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
+Index: gcc/gcc/config/arm/t-arm-elf
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf
-+++ gcc-11.3.0/gcc/config/arm/t-arm-elf
+--- a/gcc/config/arm/t-arm-elf
++++ b/gcc/config/arm/t-arm-elf
 @@ -38,6 +38,8 @@ v7ve_fps	:=3D vfpv3-d16 vfpv3 vfpv3-d16-fp
  # it seems to work ok.
  v8_fps		:=3D simd fp16 crypto fp16+crypto dotprod fp16fml
@@ -214,10 +214,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
  MULTILIB_MATCHES     +=3D $(foreach ARCH, armv7e-m armv8-m.mainline, \
  			  march?armv7+fp=3Dmarch?$(ARCH)+fp.dp)
 =20
-Index: gcc-11.3.0/gcc/config/arm/t-multilib
+Index: gcc/gcc/config/arm/t-multilib
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/t-multilib
-+++ gcc-11.3.0/gcc/config/arm/t-multilib
+--- a/gcc/config/arm/t-multilib
++++ b/gcc/config/arm/t-multilib
 @@ -78,6 +78,8 @@ v8_4_a_simd_variants	:=3D $(call all_feat_
  v8_5_a_simd_variants	:=3D $(call all_feat_combs, simd fp16 crypto i8mm =
bf16)
  v8_6_a_simd_variants	:=3D $(call all_feat_combs, simd fp16 crypto i8mm =
bf16)
@@ -244,10 +244,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-multilib
  endif		# Not APROFILE.
 =20
  # Use Thumb libraries for everything.
-Index: gcc-11.3.0/gcc/doc/invoke.texi
+Index: gcc/gcc/doc/invoke.texi
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/doc/invoke.texi
-+++ gcc-11.3.0/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
 @@ -19701,6 +19701,7 @@ Permissible names are:
  @samp{armv7-m}, @samp{armv7e-m},
  @samp{armv8-m.base}, @samp{armv8-m.main},
@@ -256,10 +256,10 @@ Index: gcc-11.3.0/gcc/doc/invoke.texi
  @samp{iwmmxt} and @samp{iwmmxt2}.
 =20
  Additionally, the following architectures, which lack support for the
-Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
+Index: gcc/gcc/testsuite/gcc.target/arm/multilib.exp
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp
-+++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
+--- a/gcc/testsuite/gcc.target/arm/multilib.exp
++++ b/gcc/testsuite/gcc.target/arm/multilib.exp
 @@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
  	{-march=3Darmv8.6-a+simd+fp16 -mfloat-abi=3Dsoftfp} "thumb/v8-a+simd/s=
oftfp"
  	{-march=3Darmv8.6-a+simd+fp16+nofp -mfloat-abi=3Dsoftfp} "thumb/v8-a/n=
ofp"
@@ -275,10 +275,10 @@ Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/mult=
ilib.exp
  	{-mcpu=3Dcortex-a53+crypto -mfloat-abi=3Dhard} "thumb/v8-a+simd/hard"
  	{-mcpu=3Dcortex-a53+nofp -mfloat-abi=3Dsoftfp} "thumb/v8-a/nofp"
  	{-march=3Darmv8-a+crc -mfloat-abi=3Dhard -mfpu=3Dvfp} "thumb/v8-a+simd=
/hard"
-Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
+Index: gcc/gcc/testsuite/lib/target-supports.exp
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp
-+++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
 @@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
  	v8m_base "-march=3Darmv8-m.base -mthumb -mfloat-abi=3Dsoft"
  		__ARM_ARCH_8M_BASE__
diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index b3515c9734..ece5873258 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
@@ -39,10 +39,10 @@ Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
  gcc/config/sparc/linux64.h         |  4 ++--
  17 files changed, 53 insertions(+), 58 deletions(-)
=20
-Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
+Index: gcc/gcc/config/aarch64/aarch64-linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h
-+++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
  #ifndef GCC_AARCH64_LINUX_H
  #define GCC_AARCH64_LINUX_H
@@ -56,10 +56,10 @@ Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
 =20
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
-Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
+Index: gcc/gcc/config/alpha/linux-elf.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h
-+++ gcc-11.3.0/gcc/config/alpha/linux-elf.h
+--- a/gcc/config/alpha/linux-elf.h
++++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
@@ -71,10 +71,10 @@ Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
  #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
-Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+Index: gcc/gcc/config/arm/linux-eabi.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
-+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
 =20
@@ -95,10 +95,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
 =20
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
-Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
+Index: gcc/gcc/config/arm/linux-elf.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h
-+++ gcc-11.3.0/gcc/config/arm/linux-elf.h
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
 =20
  #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
@@ -108,10 +108,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
 =20
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-Index: gcc-11.3.0/gcc/config/i386/linux.h
+Index: gcc/gcc/config/i386/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/i386/linux.h
-+++ gcc-11.3.0/gcc/config/i386/linux.h
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
 =20
@@ -122,10 +122,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux.h
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
-Index: gcc-11.3.0/gcc/config/i386/linux64.h
+Index: gcc/gcc/config/i386/linux64.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/i386/linux64.h
-+++ gcc-11.3.0/gcc/config/i386/linux64.h
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
 @@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
@@ -146,10 +146,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux64.h
  #undef MUSL_DYNAMIC_LINKERX32
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
-Index: gcc-11.3.0/gcc/config/linux.h
+Index: gcc/gcc/config/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/linux.h
-+++ gcc-11.3.0/gcc/config/linux.h
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
@@ -165,10 +165,10 @@ Index: gcc-11.3.0/gcc/config/linux.h
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-Index: gcc-11.3.0/gcc/config/microblaze/linux.h
+Index: gcc/gcc/config/microblaze/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/microblaze/linux.h
-+++ gcc-11.3.0/gcc/config/microblaze/linux.h
+--- a/gcc/config/microblaze/linux.h
++++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
  #undef TLS_NEEDS_GOT
  #define TLS_NEEDS_GOT 1
@@ -187,10 +187,10 @@ Index: gcc-11.3.0/gcc/config/microblaze/linux.h
 =20
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
-Index: gcc-11.3.0/gcc/config/mips/linux.h
+Index: gcc/gcc/config/mips/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/mips/linux.h
-+++ gcc-11.3.0/gcc/config/mips/linux.h
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
 @@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
 =20
@@ -230,10 +230,10 @@ Index: gcc-11.3.0/gcc/config/mips/linux.h
 =20
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
-Index: gcc-11.3.0/gcc/config/nios2/linux.h
+Index: gcc/gcc/config/nios2/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/nios2/linux.h
-+++ gcc-11.3.0/gcc/config/nios2/linux.h
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
 @@ -29,7 +29,7 @@
  #undef CPP_SPEC
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
@@ -243,10 +243,10 @@ Index: gcc-11.3.0/gcc/config/nios2/linux.h
 =20
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
-Index: gcc-11.3.0/gcc/config/riscv/linux.h
+Index: gcc/gcc/config/riscv/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/riscv/linux.h
-+++ gcc-11.3.0/gcc/config/riscv/linux.h
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
      GNU_USER_TARGET_OS_CPP_BUILTINS();				\
    } while (0)
@@ -265,10 +265,10 @@ Index: gcc-11.3.0/gcc/config/riscv/linux.h
 =20
  /* Because RISC-V only has word-sized atomics, it requries libatomic wh=
ere
     others do not.  So link libatomic by default, as needed.  */
-Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
+Index: gcc/gcc/config/rs6000/linux64.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h
-+++ gcc-11.3.0/gcc/config/rs6000/linux64.h
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
 @@ -336,24 +336,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
@@ -299,10 +299,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
 =20
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
+Index: gcc/gcc/config/rs6000/sysv4.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h
-+++ gcc-11.3.0/gcc/config/rs6000/sysv4.h
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
 @@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC
 =20
  #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
@@ -316,10 +316,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
 =20
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-Index: gcc-11.3.0/gcc/config/s390/linux.h
+Index: gcc/gcc/config/s390/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/s390/linux.h
-+++ gcc-11.3.0/gcc/config/s390/linux.h
+--- a/gcc/config/s390/linux.h
++++ b/gcc/config/s390/linux.h
 @@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
  #define MULTILIB_DEFAULTS { "m31" }
  #endif
@@ -338,10 +338,10 @@ Index: gcc-11.3.0/gcc/config/s390/linux.h
 =20
  #undef  LINK_SPEC
  #define LINK_SPEC \
-Index: gcc-11.3.0/gcc/config/sh/linux.h
+Index: gcc/gcc/config/sh/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/sh/linux.h
-+++ gcc-11.3.0/gcc/config/sh/linux.h
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
 @@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
 =20
  #undef MUSL_DYNAMIC_LINKER
@@ -355,10 +355,10 @@ Index: gcc-11.3.0/gcc/config/sh/linux.h
 =20
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-Index: gcc-11.3.0/gcc/config/sparc/linux.h
+Index: gcc/gcc/config/sparc/linux.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/sparc/linux.h
-+++ gcc-11.3.0/gcc/config/sparc/linux.h
+--- a/gcc/config/sparc/linux.h
++++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
     When the -shared link option is used a final link is not being
     done.  */
@@ -368,10 +368,10 @@ Index: gcc-11.3.0/gcc/config/sparc/linux.h
 =20
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-Index: gcc-11.3.0/gcc/config/sparc/linux64.h
+Index: gcc/gcc/config/sparc/linux64.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/sparc/linux64.h
-+++ gcc-11.3.0/gcc/config/sparc/linux64.h
+--- a/gcc/config/sparc/linux64.h
++++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
     When the -shared link option is used a final link is not being
     done.  */
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-t=
o-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 0f94936140..1ec942e977 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
@@ -18,10 +18,10 @@ Upstream-Status: Pending
  gcc/config/arm/linux-eabi.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
=20
-Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+Index: gcc/gcc/config/arm/linux-eabi.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
-+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
    SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}%{mfdpic:-fdpic}.so.1"
diff --git a/meta/recipes-devtools/gcc/gcc_11.3.bb b/meta/recipes-devtool=
s/gcc/gcc_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.3.bb
rename to meta/recipes-devtools/gcc/gcc_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.3.bb b/meta/recipes-devt=
ools/gcc/libgcc_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.3.bb b/meta/recipes=
-devtools/gcc/libgfortran_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.4.bb
--=20
2.39.0


