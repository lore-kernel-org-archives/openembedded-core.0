Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3579CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18523.1760453084873491981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qI7+B2jY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EAhUfv3483883
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KBcVIIMxZFND81YAXPnH5Sw26cLsW12NVFKkENcfT0E=; b=
	qI7+B2jYBY2eCoTjlaQ70I8+Y4VmYiOKAnXdnJGDNY3ftyTueg2RgMDvNdtccvX6
	nOrjGsfAVD6lxcjUla5LlR0p/rgowNPynbRXa6gRuH5exkcGsV6P0ruH06luQOHH
	mDr7mxN6ZS+UGFNbawYtsl34ygFpkiavglxWRgnWZVn2deEoRm+xvtScAruJFfxh
	PM+M1b+0Qc+lhS7IDQum3GR+TOgUIywsuNNB+KW1vlE99Zj0SNKhV6Le6qbLsVjL
	SURKCoikKKzdxTpH7/lKRLBuLaHXE0C8Eyrm2pRnqN3OAGY4qpIuG5cXXxY975tT
	OXvgcHN9SwXCPvyP3Q5AQg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k3wa-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuSR9hK2tz4VdhdaD1s4nBhk29PR6es3x5ylZkJrksWW6lpQcIQqNAqS4C2kQG74FlRY/dRGwihS5kWHkX7o/3JrrF8yqXRFARp4iaS04tTsm2CtV5YA2pKh01a+tkwCGPM+94NxImnaSb4WuJ9nq3j/s2lKp0wYY8jXWorauXNjz5+pJi3XS/xNkDPDwAx/jgVpHMzBxuiWaKRmv5RBpOoWr1deTC4px0sMFrhDiN5tsulPcyHMNfXkK0SoeS2yYuDrYyMWb1zzyPgkhCOlZAnbbVW5lp0wgfih8JOo6yf9U3wA+Hec0f4DtK+OvxUJSHWfDvHTyJumnENSl/XHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBcVIIMxZFND81YAXPnH5Sw26cLsW12NVFKkENcfT0E=;
 b=s5y341GcKpsBezb52MOFtEteWT8Ez1qHyOrn3hfEag4GxHlCGnU9MqHyvVoq1NpQXZK46MGcPjVIpiVWe0NCpQzqbB6q+iRYLueJDQhOj4cELcroqnIxPf3NiGjGzClZjaZ6Fll46OINjHcvZnc2bMzwm592rV37WUQ1c5OaNj10XSW4E7jT/10wnTQoy4C3bxwwe0c/7+M+MSpn/GwKWc47A1/KJ+MFM0oMkyIb/1mXZcKM3ntRUNQumDdHGsKuJ57/jMc6hvI1lBy311rVWl1gqDTLCcJgt0fDQomh4Luxq8tOHJinPQkXLBSQHlXOOU/IyB8mhox5S2g0Y+WmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:38 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:38 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 07/11] glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested loop
Date: Tue, 14 Oct 2025 07:43:43 -0700
Message-ID: <20251014144347.536537-8-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb9f2d9-16cd-412d-f0d9-08de0b303365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?necfITas9HYY4/nUgGjB6e7R3+Zark/euU43D9BNikZcV/36s0ILFOykm/in?=
 =?us-ascii?Q?9sLYHP02TGze+awzsI89dh7unwPnw+i/h6VZGnvv7mYLof88aX9qTPq0po0p?=
 =?us-ascii?Q?7s8m+meL30fnAQw+y+TZAqc3Jb1gfkMd5++KtEausiwNNwfUD4FElZGU/bQ5?=
 =?us-ascii?Q?R+psPqr0sZB7vpeQc/FvTHxMmKz9rpQz74Va1pFc62HajYy2W9YTX7mbgcGF?=
 =?us-ascii?Q?/KjFR9D6wySahIDlVtJv9ndeOp4zQ/qliE7PTU5RuwmgPfjDL69z7nk/whLN?=
 =?us-ascii?Q?0FQItEEE/riEPjdO1kNYkjJuIOeEUYlYdG8XGWRp5MtA3dLQkpoyJuefDkZM?=
 =?us-ascii?Q?KF+QHOMJ/I460CGvbV4RkP12ZPIQnk6L/t6S3mJxgDxZqE8XRI3MMfaV+qXl?=
 =?us-ascii?Q?CZ4Uo4YpzcWpjFQjV2P6ZvMedsdYK/dG0ZE3DQM4hpcw/Sc7c+G8A+6a6mrI?=
 =?us-ascii?Q?PMprp2XzvoOUk9TGwX1Xm7V0b2H/G0aoS6jLrlqR4UqidHvMVUUWUwwJtxGH?=
 =?us-ascii?Q?YZhjxlOcHdPPF4oFxRWnikvQRsakc3t2/nJIwIeGu7hhCqM+X7LFKWW+MNG5?=
 =?us-ascii?Q?nJv6nButXioj2yawTkYpdwOwRKj2CBiuyT9QF7TIwMV6S08D9HkR4tl/dUSz?=
 =?us-ascii?Q?EcoGes5mMrsHo33R5TYl/P0cy6GsqPmqzBgvZr4suQMddDEKhdQc30AsqbST?=
 =?us-ascii?Q?uzB3LV0BFrBDEQ1Fpcn6R7DsU9KMhkRvXJD9RCuvqq9T/G+Z630xgOXEFfcL?=
 =?us-ascii?Q?fu5ddIVDTUZ0dSpCvyK2i1GPgUuy24fx+sEK5cfAZxNo+xTkBPsWg/F1cXEj?=
 =?us-ascii?Q?qsHY8e8vJkO+EMrZ+lQAM7JrTnEeq39uouEIrphXiEVtnPId3QRXOv1adUUS?=
 =?us-ascii?Q?UABE6wYFxVfZtx9mSnWSGM0WXcscwCmP9sv8VeBT8itxCJnZVfNLR7e71fxj?=
 =?us-ascii?Q?v1CONOTP1bQSZ9ZiZD4sFp/xiyNYsHuimd5ylYAYFbqE3dH6DSKQCHYfsUfw?=
 =?us-ascii?Q?cIRqJ/YeZKXnAIxaURaf0tjIvx9M4tC/xjm6QihlajI9B2bjN9RwJv4yJJQZ?=
 =?us-ascii?Q?vfQlFRnwg+/KPShMJyvYaNYPyrpzbSaU491RamLyXKAT1qm4umlf/JePST0x?=
 =?us-ascii?Q?M7WK2Oqt45G0GNnP1qiBmA73FK3+DzGhG7hbgCd5W/y2+rXDTELQRGhKP8uO?=
 =?us-ascii?Q?pDEXNLDWhzPhjtPAGCeTE1lUUOV2zQLHVw2SO2//OtCtbCIOHptL5m99ZMaL?=
 =?us-ascii?Q?Z7S5zLeyDnYJgA3MPcvmJLxbeKKfgToeT+QXBseI7/4YUp/jhBuzKUj+P9Vt?=
 =?us-ascii?Q?ziIK2xwRILWKAe6C+6TpMTbMNUNswBGKYFOqErOvT/1vA0pbzTO5OMtyCiY8?=
 =?us-ascii?Q?fFOeW5RXvEKv+/ecpD3mo6FmQ4o/wu6JWX7NXwAgXaigLFDVAMGnzfd8WzI0?=
 =?us-ascii?Q?zfepvKAngSJgntQmR70oX6wdkXI8l7clxTmL7+HbTnFbwhOJJCMvJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uXR7bmraqrNMzqnQBUxdNhLOJ4mYrSKqdiNaw1bpstfQTH/e05+h1ItVW3YW?=
 =?us-ascii?Q?cDX6b+ikalNmwGuhRdXIos1Xly5+FTk9YSyxI96zzBYKmkh6cxHlSeshYmCp?=
 =?us-ascii?Q?6cSt/UifVJivBgpIDtoK13OilC0V3g1MdGtc481/tWJYtUn+dBGTn/2TKetN?=
 =?us-ascii?Q?ZGM5/de9ru5mS17MNksNDeETvsSBPOPHPP/JX8m+bQcqzBdw4/muaFOnfMCX?=
 =?us-ascii?Q?tbSujwPayU+7Z61BexWiKjNkwln2/+b/rtC14q2ogSdSkRLAcDsuIRDDFbXL?=
 =?us-ascii?Q?1Y25tpvSXBkDLrPLTOhbqPOWi3+zrEm5HXz+9uifFEpMqvM94xfhjNN6gobO?=
 =?us-ascii?Q?lVlzs5hzfn5hDFXV9YPBEpratmLeTt46rguCH9/B0R7nTRRLMvh/o2KdORmp?=
 =?us-ascii?Q?VHGPvOeM+1o1BAumAhfKlCJGhwyT+T4T6R5yILyDxl7MjSK8YJHmkdygRjcY?=
 =?us-ascii?Q?R6hXY5EKmM9iZgc2OwYgrZnfE+IhWsUPEkMj+Nb0va+FA7yOyhhLGGQC75PX?=
 =?us-ascii?Q?JvXTcjOM7USjcAVzH4A4pQ3W1/sozCnXnf81CjvGpUdJzGsQnOpIWUaPBIM5?=
 =?us-ascii?Q?2Ep/GH3qnfKAaKXbde/Mav0L54anq4dJxMNxYsg9rptTj5TsGis1gwtewthl?=
 =?us-ascii?Q?I91kCLH4GT8NXkgzaipO0xyR65MfuIrK3DKp0x8VrQ4a1llwLUASSGtxGtWy?=
 =?us-ascii?Q?xsrqwtCfBJHMErDH9PVDo/RZUxY3Oe4o6RGmX0nakG+pOmwyjSlrf/CGeP6F?=
 =?us-ascii?Q?bCVT84Z4mfe79yl+8YOtqIRddYkkbIB6N3Y0TNuyOAx7ay6bKEAnAoFJGlyf?=
 =?us-ascii?Q?CXSp9tuueeE3LIdVHrrCsT8ceCLNSUIBosH0rVBa4fhZh0jX6K4+FBl32JQi?=
 =?us-ascii?Q?XGXWxe1er8SlMwf96x3ZJ1Nei3aqnOu7XxOlRKNyGY/mIEIr5QkshbC26aNI?=
 =?us-ascii?Q?GbB8hmkEoDHjKFEnDPIp0qFUDUlauvZhUNkPcavr28BQtxcVpsm0S8d8HZO2?=
 =?us-ascii?Q?dFk3an0Vg3Ue/E0ret4tIj73hbu1rZDAUER0td2alcGawCx+gO1ip+szewvm?=
 =?us-ascii?Q?Ucyo3TahPnaCTKykb+c1bKG8x+XjGr5m2aU4MrrfTYnOo8MaCZoVhcjoZRRE?=
 =?us-ascii?Q?ZwBIiVmyw65Y9y/OkvulfB9sedxbZxcjM0SmXYUbUqqAxJtX9HQ8iOwtlu51?=
 =?us-ascii?Q?tbdMUlLQbhSHSgX9jcxhI6+73UB9tgqV5GY0nPIBVdTNIBtD0E3CmPQywAX1?=
 =?us-ascii?Q?Pt/6RAmt3FUunfv6UOkpD9DH8eOGFwtOfuwBvTut8weRE2ijQZuNrrQ4qTtf?=
 =?us-ascii?Q?LgboI6HKY5J8lFu+4zbcKz9LUPhRCpaMNr+wqJv9l/ruEyWO8adjAyQlOCQj?=
 =?us-ascii?Q?HlKRLTqXU9o0CZZw7nCNJtl/YE7CHr/wGwmi7NBORj0k/hIvqc/VsMR7Sw+O?=
 =?us-ascii?Q?sUcGkTcrMBAmLxF19XzJzgD6RF23pSMD5474Vx4pDnFCk36oHWgyRXxu2Vmz?=
 =?us-ascii?Q?uGOiMHuQDPQp71IXV2ZaWT4X8Fd7OFGrWjXia+fdrkkdGKpPNLpgf9Hgmxow?=
 =?us-ascii?Q?D2bT1IYNSrmb8JbT+LIuAJygZgbQZ5GYCysDMSN7wo6stitSfleJ5lMZMEDC?=
 =?us-ascii?Q?h6kW+kVlbvGyxvPRDSaCvbE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb9f2d9-16cd-412d-f0d9-08de0b303365
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:38.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LUlF27Yn5+vvtBYFT26BeFEcWbEUCQwAHc+7FfH37Sr9T0mpcibdsecZpCPBXoX1wzrONDbkDGk/h/t7bpj7DBZujmD5W+zOmpfIRTvb8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfXwbd8v5U6My4E
 tqQYQHG3arRtYLM7UO5h9AjHZGoOun2Nq4wWnlhF8VjqOvbPeMtVjrEG4X0nQhlINXzoZfsr0d3
 RIqQ/vqqlIUYwm7ijSdGI5EiQ1o34ZU+8RGH4NnsJD18/qZq/eRQc82griZloXV55XtUVPRljtX
 QaRXL9DtB/w5Q8RQO9lyE2uUd7VvJLTFZ7O56uQ4lpgFBBpz4C1JlRfo1Q4DbCfzGTWEgobPTGj
 WQLU+uh959kSCGL0cztSOkZY6h2HQYdH1DRzOYsdr6AFaWLkG5cZYxJtGmxGR0K5hlIwz9DUPo3
 2+H6SnwzBUPTQiw0qonnTLO/CmJHawu9qFEjcHiKwwBY3tuzs3kEs0phEb3kaA2X5Pi2pPFgx8K
 qf9S8D/QI0U/cEDSmrVJZYsH0YTlLg==
X-Proofpoint-GUID: GiiwToSOKKNtQFBvExp5lb42H6emdqLQ
X-Proofpoint-ORIG-GUID: GiiwToSOKKNtQFBvExp5lb42H6emdqLQ
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee61dc cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=C2QAroOMQ5yFKVvllzUA:9 a=iT_T7jMFN14A:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224827

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002279.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-6.patch          | 103 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
new file mode 100644
index 0000000000..7d5c4fda5f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
@@ -0,0 +1,103 @@
+From bbd7c84a1a14bf93bf1e5976d8a1540aabbf901b Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:19:02 -0700
+Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed of a
+ nested loop
+
+The loop was a little more complicated than necessary. There was only one
+break statement out of the inner loop, and the outer loop was nearly empty.
+So just remove the outer loop, moving its code to the one break statement in
+the inner loop. This allows us to replace all gotos with break statements.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 929a4764ac90382616b6a21f099192b2475da674
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002279.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 8a9219e0..c8c99bbf 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -382,17 +382,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-  /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe (signals == lowseq) after group
+-     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-     store and will see the prior update of __g1_start done while switching
+-     groups too.  */
+-  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-
+-  do
+-    {
++
+       while (1)
+ 	{
++	  /* Now wait until a signal is available in our group or it is closed.
++	     Acquire MO so that if we observe (signals == lowseq) after group
++	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++	     store and will see the prior update of __g1_start done while switching
++	     groups too.  */
++	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+@@ -401,7 +399,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+-	       goto done;
++	       break;
+ 	    }
+ 
+ 	  /* If there is an available signal, don't block.
+@@ -410,7 +408,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+ 	  if ((int)(signals - lowseq) >= 2)
+-	    break;
++           {
++             /* Try to grab a signal.  See above for MO.  (if we do another loop
++                iteration we need to see the correct value of g1_start)  */
++                     if (atomic_compare_exchange_weak_acquire (
++                               cond->__data.__g_signals + g,
++                       &signals, signals - 2))
++                       break;
++                     else
++                       continue;
++           }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -431,19 +438,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If we timed out, we effectively cancel waiting.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+-	      goto done;
++	      break;
+ 	    }
+-
+-	  /* Reload signals.  See above for MO.  */
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-    }
+-  /* Try to grab a signal.  See above for MO.  (if we do another loop
+-     iteration we need to see the correct value of g1_start)  */
+-  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+-						&signals, signals - 2));
+-
+- done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index e744260e87..3034461e9e 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
+           file://0026-PR25847-6.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


