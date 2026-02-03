Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED8AE87832
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17157.1770127437480518490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=el26BLLL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6494b3a7c5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613B0NP53324489
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 14:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jK8tLJhBb
	rU1XvvUfem+8BFADxC73lH+fBLRd0zNEDw=; b=el26BLLLJjnSgrCLbI+sC/tn+
	6SOttqspv/yhpA0LGZxNgoC3zOrfIYTUfJ27XpcAzD4EptO7Q2Gn8E2ESnmfwlgj
	6DoP57eLLGjXf23p1fWFdsIFemqx6dTi86gpKZPjVPL+AjSqmHbl1P7KDlLFmf4L
	QVQJRe2FV6RZ5Z0IfMFsLAfVvFcVjw8RlsOOfaB3pVZa+IFvyxvWfUQooeuXmkvX
	6yauZUjEcJH2OYvuruw0CL+Vobu9Rp51bbdmdbM/hTh/bHaBj3o27UYxmUfqFm8Q
	dbajnuXseTYD8YW6aMVGzeWyFxOnnAaxOYx54pOvuHC+QHwexIx8HlfUIW2Sg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c18q3ua67-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:03:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1l1EFbR3sRuv8Cwbd28LUCFplpdUC9oHX97E/+UNC0QvsYDzI86A5UN3id8tQlKUzSDe91qtcPH9DY3ixtKSRMeUfz9rvE6ztzq2cWWLp5uOrfi0ImY94DooCJ2Bk79nAY5MWwhaAgzV16HzL+EDTg4OZ/Q+WNn3V4tXl1PIFkVn+qsyGKSKOrYl7vkJKu7LWK9tEm0dR+FPSyPfhQyJJ0XrU7qa/lsHCpM2iv75g1H+jBUbRUO94DOyxoNWBIUggALsnl6K5mS7TDTIX8Bi2R3+WGGuwR9W6EnAjWx+0AVeDaWlf61Plny8COlpzca+ZlI7JJ7CwMrSGe9A4NAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK8tLJhBbrU1XvvUfem+8BFADxC73lH+fBLRd0zNEDw=;
 b=Ad91zZDWFIjNi1DW2NmxncDFZcb2/EvcQuS0Dnjxb5HbQdWlI1HqS+wSbnl86F3mmsoT2E0FM3HOHErsNZMD/LRpFbQlVOa8UHWmidb2b3FbB2DcNyT+hAoePlqP1VSpoj9LE1BtDU7nA1T/dNBvNgan4FAOJK8d+cMY9juQAsrTJ9HOKZL2PT+lz1HBfefX1aLg2nzciSOhqFhfyBsAgqDY1CEr2GsP5YarTPNuD8nLAdmd8f2zwZzEJbBB8emRF9W8SJ/vREySX67+VuHxva6fLNqOMNHo5xgoBe4fJx4Ehe0sKsFxV7s2J7VkYm/nNtrNdW1Hj66myDWt7IBPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:03:54 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 14:03:54 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [RFC 0/4] Oe-selftest for Clang, LLVM, LLD
Date: Tue,  3 Feb 2026 06:03:24 -0800
Message-ID: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b323bb6-3234-4579-1064-08de632d10b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VOTa45W7wl/+5u2+APad7Tn6w/7G60d7HrlnEFticItgL8GtNopf86HseU22?=
 =?us-ascii?Q?QgVf2pJ3hbqxewC1iMLvZjFWjxs3seFp0NxS+nDfmgFV1EqyoilKSVg8Ej5j?=
 =?us-ascii?Q?Vvl3r/Q2F2siN2OCDFZcWrBySlluhnIyGnmOcPvVO+AR0JbWrA2+JozXhE7o?=
 =?us-ascii?Q?pav88Rk6GApGV2sobzc0pJCCN2hlgm2KOVYoR1OFD+Iz/+vzKQ812Coj/UDr?=
 =?us-ascii?Q?BSMjwHK2iBNLvdL5NsTpulPUllcLrSVfqgVLQMuN/YjUlsDLCIKokt3H6p/n?=
 =?us-ascii?Q?yYXfJ/uir+6/LKer2nZ01JNW9TFzy4FVP6Fa3qfng/0MmI21Gk1JBhxm0oGo?=
 =?us-ascii?Q?I4TB7Pe4fdmvYFMtUP5RSRuoNND19B0Sd+OLXlTFHO4UAVn9YaaGfJEYJ/iW?=
 =?us-ascii?Q?/w9rLo5pMqeykdNFrVEYz2WGq8Mvd6Di1mB05siEMd1TNW2jCstmnCz7HHJx?=
 =?us-ascii?Q?Nrq7pIDdTx2uUopU3p1sdyUNIif1Qy9KRy5V33RJD1+aZiFStfKxVsJFQOWj?=
 =?us-ascii?Q?5gsGVR3GB4a6cpWAIEZ2rVrn/XfYVOGyHfl4DiSsOz9VMNJLteq650UxD6CI?=
 =?us-ascii?Q?Fs2XoBP5Pb37oNzun7QWK+ps1GLcYbHS0VyltwZvQleSei3xY0maV7cjTXE0?=
 =?us-ascii?Q?KxeHDzSRDo4E2H3/ByqKkNbi6zUWA4sSVLWeyRiItxL6Dj62nTkLTRMvF7AM?=
 =?us-ascii?Q?4xoiwEm+V/V0SJ29r2wl4eMgEQRc8EQ1clpfkKha8SPngG60o68nS5vTAWYN?=
 =?us-ascii?Q?sna7VaBg5SpiSdUpg+vY/8r2NbkFxmKWExwbVS9cOTDw7KynbUu+kTwjYUhb?=
 =?us-ascii?Q?OgDWpmLGRi3BnqoM5RtrPjYYVAM34GnArRhIVZzqyZjSQNYgW7r8owWbk+4v?=
 =?us-ascii?Q?dpBlQ4ATNNDYTMoEKbY3fPKUeA3iy7Nz8Q4so5Y7xoulTNi0vMGaMZCQAGGE?=
 =?us-ascii?Q?tRabT4za62i9KZQE2qa1XNXwJnw1KW7L0oJdB4w7XRyUNoG3qPcOyomUOt8U?=
 =?us-ascii?Q?am9dlkqS2m/78E8cKbd8cq58ObEz1l7G6mhSgNmz+43hYe7U+yCOfYU2UNtc?=
 =?us-ascii?Q?WSA5fiikxM44PbpCww4gfHRCck74LkrkaUjM+JOmiV20v0o6DXHdb/C0712G?=
 =?us-ascii?Q?g6HPnEW0F6yzuW6d6AslXS8mp0DWD8l5LYhc/vgJeFGKCIt/7eDgPRpe0omT?=
 =?us-ascii?Q?Ksq2E8CJK3853cgJlo/8gqE7MecWLOTj9xcYtDT6QzCVAqPdQR/e3U5Zzrpr?=
 =?us-ascii?Q?oEjtVXPy3xxfuBY7ksAdH/VKeN8L+rH0VsGffK2+2PUQjb6acoFPUVABo0Y2?=
 =?us-ascii?Q?o9hIlAA28hmnxL1f8l+mB/NZ24f8OPEV6VTwCDhs4IqQAXQUSixV0GpTidlo?=
 =?us-ascii?Q?sFFRTwrAzIDkn4PO3tsjJguLiLeVKLNWc9GNcKY+ASb1dwdApeXl7HRi3hvV?=
 =?us-ascii?Q?3E9tCicJv23u/N1+dkcBiLKFM2sLqFs2Y0eRn7lT5GSIGdDqdI+7YPvCY1vc?=
 =?us-ascii?Q?C+fHwKP1tLiDymVXvjUibTCpGzfhK+DWg8B15OylArZfqeHVjRHe5qllO/GY?=
 =?us-ascii?Q?UEX1/vUMs+VcJFwjraSbZwdceomG00wk67HU4zuDzEJONjBBEnrPSXO9bFGX?=
 =?us-ascii?Q?ednTHUy93SLJpq3Nj5fltdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4KSFjDkDx88bg1BJYALiVdY85mC6dni5+cn82owbJL5TNJEkFP/NBHWQ1cb0?=
 =?us-ascii?Q?eS0+vig/7nMdnYml2K5A4maje2+xpJdRjqIPYMgUrMCI5vitYBJ+IT4vpvvR?=
 =?us-ascii?Q?mpJTFWMIuKfUveECm5FuZk8SpTgefT998otzYAQxs/47e48qH6D7mu8fO9te?=
 =?us-ascii?Q?EkjzdAWUlZNYYEEMX3ACCBQzHZAqfOOz4ir05c3NAPw8R6BKafSTof8b+cp1?=
 =?us-ascii?Q?vYTog/IC9NMZTi4zCrar71mzlvqhFHgWVcyTrAHkR2sxRmMjrpO0NljuRNzc?=
 =?us-ascii?Q?J8TyZFo/KFACkPGCejja5g80muZH/SCeVtOcTPM8HlHxlQcyE26AaMLKVS9k?=
 =?us-ascii?Q?ULIBs7JR7+TuHSy7Euxr92M5E3FiQEbaSGbl6jqSVG116a1eOBdk+jgONV6A?=
 =?us-ascii?Q?E0XWb3ciTDbvARyA7+AbZ8GSvECFy9SeT95/WBALZhSbdTM8GstuViVSLiao?=
 =?us-ascii?Q?QsWztMvt1QhtE0nhvKL35nsOlzzcF5OP8LkgmWXpYBufI8I9KjpMR2PSw7Ct?=
 =?us-ascii?Q?+4raheVXawGFNsL1bEiACCPFj8GA6KW4pVX37vF76jWZrU2z9kZrkZaUg2HO?=
 =?us-ascii?Q?WR/UFaTUfTLCpWO/e/JDLbhsDUkOiZgAHG0InbLV30UqOdO0s8IDbh7FgKaT?=
 =?us-ascii?Q?b/uiS0dnGVc4rRJqyBtAMr5iPSKxoZa28GVyrWJcuVQ3ov1WA1FJU6MpNlSG?=
 =?us-ascii?Q?ixRdiBq2VviC3irgAjuROhus20TJK52hU29Gs2fMgxf5TUqiPUQ0QczOxGHb?=
 =?us-ascii?Q?xT9QAIMYKXzqK23Kkgz8QgG8e8Wo5tf7VBjMm9Ku4BWfb0+bikbPg6767eH+?=
 =?us-ascii?Q?JdhoEhrEiCM4lrcG56A0PtIFt6YiTKj7Bszq6s28+AFXJcFiXGzxTp7DEv7z?=
 =?us-ascii?Q?ff0UBlIEUpEN8Ow7Z6PH3KZrdY4dfpb9jOLa5pGjPfeWjVKq2rUh5FtXTiDf?=
 =?us-ascii?Q?5YCrSQZUnBQgtMcj661eBd5LioiCVTaqqsgq6gO3j5P1Ye3mRn25bmxXpGfO?=
 =?us-ascii?Q?kQoJTtZ3+xCohftsOsCG/qE2pdKuDbYcTiFwhs7MRKDKr2MKOqosRiZl6FZM?=
 =?us-ascii?Q?YqIChkGmoMaqWOylZANP9jjdQi6cnI9phK5XPfZ+D9HgZd9vdXI4/rbqK8vr?=
 =?us-ascii?Q?HVL7RBLBV8RDKP7MOlzQD5HkOdEoHLvTLXqI6FRkpeAOBVI2obtg+YedMngs?=
 =?us-ascii?Q?EOyuJNiAGuw6C03R/NK3Q9m6RZWFq/X6nf2MKn1mj94asDMwKQCniZeh0NY0?=
 =?us-ascii?Q?0ONXcAoRUnw92e3d7HfBkQIEGYR19p1WLUI//fMRqMunJsy0GHVs+nBpc+j8?=
 =?us-ascii?Q?mtdRXqXrit4w3vYStWaXmu+57MkmMCEUlRzRl1zpkxs9bKfV7zmL4DjuZvCY?=
 =?us-ascii?Q?ybYqcIURn5EJwT93PTFemU+GFwmW2sEy+yqt6Rr2TKVzA+PBtAkl8fMTi7tI?=
 =?us-ascii?Q?+/HjoWRY3dlYcb5PaxYvqaJzMH0Ne7xTWzQjsjmlgdeDp/3K6xYk797GRpbQ?=
 =?us-ascii?Q?cY4rCx1ScH+y98IH6XdqEq8D3A2ipgixDFEZ8tu2t+mfebg5LoBgZpDruK4w?=
 =?us-ascii?Q?YqkL5mOvW1cG6uQNbB3/Qcct7o5FK+8aQghjx3xncnAtjwU4AOc2fIFepSH7?=
 =?us-ascii?Q?ANcDHGBFO4XNsyteFH5RhcxqaGi+5/MoiEyYtzGWbWureGrY5igiGPIGnPbN?=
 =?us-ascii?Q?McoiZ0WJkzscVF1gLLyUo3OayqaomgRdBQm13yzEBtiyIr9mjoj/AfR7LfYp?=
 =?us-ascii?Q?PrQnDypfjRDCgn3w01XyHmJmPREbCUvQeqBm+/zS6LGLHpKi4zq2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b323bb6-3234-4579-1064-08de632d10b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:03:53.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZKmb4HIxxKvqZDT8PhIuJsScXqJxB9WXTsnUqkGWutpY+Y7SqYvBUND0jysI3PXEtezNx2SrbsAm+yuR5BkwYSaKcEpEQggL1DwN6gtXTo1IzCeMgeKWe9UmgkSfhsT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-GUID: EFZ3f_XpugxioKXTCTAdquSe_l1wR8QG
X-Authority-Analysis: v=2.4 cv=Au7jHe9P c=1 sm=1 tr=0 ts=6982004c cx=c_pps
 a=St7v3kIWLLX4ycmTPR678g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=XdqJpbcbA6YMCTfswXoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExMiBTYWx0ZWRfX7kytUDbdMySf
 8bYqq81/eX0hpfIqnzV0u6KG+7cnabHPhplAR8RCIMQ7NtpKEmbJ5Du+G7lFeo0eE+F1wt9Fvgq
 rQI+EiLe+1qZDhEp195D/rwLRq03D2d4LIUZuefBJXng64uVad68/K7BZ+DGw0XbaJxx0L6cyyS
 EutnPsrc+CyCQGQeEtwUe+RyEYD6ysZzO0W4vYgdGQj58/nnLPCBeB5dd+d/uE4922IJ88X/4zk
 Cro60Sjt49CFqpYc9uSczrXXmGKSdxRGESiv2HAPwE48kCiREOeYrT4T6mqyi19946YSJlPkXtj
 chEOhDrgtBMFWKwYEFBQ244tCJ74qmdCaPXwSycib4xIUfh0yuf6qFpJoknXpeXJod4aZQdoEOZ
 w4ZrdhCbZzoUs+JcY4dccUODhlD7zAJoP4Bbv7Ph53xFEt0yszilGqwWvTFEivVKpFzviBKMM7p
 /YnYpcVdo1Cj8P7W45Q==
X-Proofpoint-ORIG-GUID: EFZ3f_XpugxioKXTCTAdquSe_l1wR8QG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230453

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for both
native and target builds of Clang, LLVM, and LLD.

Summary of changes: 
-Patch 1: Disable clang-tools-extra tests because Clang's CMake cannot 
          see the llvm-bcanalyzer target.
-Patch 2: Enabled the required CMake flags for clang, llvm & lld tests
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 4: Fix rust build failure by replacing target llvm-config with native

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv64,
and arm32 for all three components.
2. Clang, LLVM & LLD all together ~80K tests are there and we currently 
~200 tests to exclude list which are failing (0.25%).

WIP:
LLVM target tests are currently failing on x86. This is under investigation
and will be addressed

Deepesh Varatharajan (4):
  clang-tools-extra: disable tests
  clang: Enable tests for llvm, clang, lld
  oeqa/selftest/clang: Add selftest for Clang/LLVM/LLD
  rust: Fix rust build failure

 meta/lib/oeqa/selftest/cases/clang.py         | 301 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 meta/recipes-devtools/clang/clang_git.bb      |   3 +-
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   2 +-
 meta/recipes-devtools/clang/llvm_git.bb       |  11 +-
 meta/recipes-devtools/rust/rust_1.92.0.bb     |   5 +-
 7 files changed, 389 insertions(+), 8 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


