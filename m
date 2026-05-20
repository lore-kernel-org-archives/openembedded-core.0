Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE5CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 17:35:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18185.1779298506741945929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 10:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gZjojpoW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96001520eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFC5bP2799967
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:35:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=zbbDRV+l5
	Ciz+mSXkOSz93h2hn1FTjZkFJvBiK97bbM=; b=gZjojpoWjaK/cbzXpKzdsORLM
	5VgLKEpnyJN2VAJ8RBTa8Kqcin1hFcHl1AXa2wDhpbh4cLOjxCLDHGqji2unLNLF
	0OW1fpkgTeJrZYWH4oj1giCaiYt4TurLfKJxvN8Uz5ZYREPFleXtQO67eWVMYskB
	hashNStq7B4gj+c1UW6Ne54OzsHotUJtD5i1Lz4TrDPdVRA+GnBS1GRV3QmGqCZy
	bmFmK9gt54Pl8U4hAk+Zjr0gpxbsQUL4hsWUUfgCgpCJxeJs/xevEJsIJ878sSJ6
	Lv+WEz0kx+sfehoIcNjAOES5F2mR+j+gF80mZXck0J5AylcR+swxiJzEIJi6Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gdng8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 10:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTMvQ7N0aLh+Fsyl5KE9I0MLyfu1i1CjyrsU+W+RvD5G9qc2KQmb2PcBiO6ivA+neFEB1OR/uxuxKVd/kqxA4BURdbrkA2vVgOQGQpIcCw1Wc64djqh4aSUsqVMS1rU6W82qXDkcNr1SYyUHOkhJr/agDVhMjS5gtjkt+tJR7MPkZ3jV3OrkKea8MlqhyjJw22HqdD5KqOwZir47rnWGvPjHCrE4jCTnW1UbLBXuzNuBz7T3tQ0gnenKiRGCrJftnWSmtXIC1GS5PUdCSjez6sKAPAQ+5ak6zh0kzVXJ7Rg9I/RHz5RBJTjWqQ+d4pY5oF9DTelOmK6h4e+Jie2sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbbDRV+l5Ciz+mSXkOSz93h2hn1FTjZkFJvBiK97bbM=;
 b=aRhi0N2/r6dt64jjl3K8Ho+p0TwVZSfwahRZG7jyvzFC/0DcBtM6f/ITy8XNkXOWSqP+mREOCU2Tv+XAgen8+1SXB8CLCFtp+7oNysZqoimET3l0mIfJuj/cV9QO2w4ZWEGk+BhhgmLcnEcpU6m5ClvR0biorfzhJZHT9GBcCwIDiGix1Erm1gvolE9B/Gugj7idslLiWV0Z51kDaBCoXJvSIoeomdyLrq1IPeqYE38ddjPXjYyrUKRVm1KR7jRoinsj36wsgMSftP7YXLTMB5LfEdfqb7O/JX3cwlKLfd17VvKwgf8ZnCKdDeoSCYzBmR7+3znoXAddREH6kdTbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 17:35:03 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:35:03 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH v2] clang/llvm: Upgrade to 22.1.5 release
Date: Wed, 20 May 2026 10:34:50 -0700
Message-ID: <20260520173450.933044-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e2f003-074d-41a2-96f1-08deb6962029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	C/XPS94z/ZtDxcQwjFmXjVfrSSPJyUxxEfV99q4lCC2Ocna+JE86d1DbpmFMz+8uHKTexVTerOOIA2062O75lkINLKmVztbDtko0jsIGDlxPqGIMfUPAearg4HxJbsc9dZL84aQEj72hLiO4UWxqN+8Ac91PRYa/eVqByQAehxuCTfz1FTtZ4ZaFMY/1N3VGRMtGbTFMTUoWaR07c7UIMwc12DY0JAv39JOWws+LCG+hk5nkp8yb8POmbVaWIRXVchWhImHHD7yqvQX2BPxHajoJDWqyr5Hw62toJtwY7gcLgzeB8XcqUP96EIuvX22McQD+fNxqR8bw4PF9sAwQLxRertr6ujF6ZfpnjHzJKh0z0U+2UiVX0WUa6x034LBtAjZqbCCQnZxmOSBtRA4Ubiwwkwgpg4Vcsb5F8zM7DGWDD54+qBIBgnKuFypyr+ZlNHZ/ZP7cXJmOPi5IzFfpxmkNuTUQOFYzW2OP+FtnAU+mccIbl81VF3Pezy4O6PSy3rkWD2ytvaonQz4+q+/VbfdNQpDfS+5VABbfpQxzxwJyFhbdeBpGI6v/ftjFA+a7Xdko8DoifP5u+otnYREQzItRmNk76NqNFiWh6oelRusiqq2V6HQcjPNaSkLKHnoHSCgie82I9S1HKyUFGvNEPArQN0vx8BUBT6c00i5k/fI5qsLPrHx3cv22kQcIg3Y7ffQDBvJ+GjUtTnDR2bb5seoi63jlvO0aoe8Bn1sgbdbEgRpkkLM+l2Bu1N5EXbod
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MOdCSBG26/XJqtKb6Z6LNg+rKCnSoGrY8FE91FHgMLNOE25kbF/ZkmQh8hSl?=
 =?us-ascii?Q?Ur+HO08Hbfk2r0hcug1DMn8NzeJ/YqfX5bWScHsW0S09Tt9nQCPNudJWRbd2?=
 =?us-ascii?Q?s9E2TOKc7QQvskoWYjiIdqhG03Jk8Wd9XXIeX1WD0loEbKcnhiUHX0VnyBZz?=
 =?us-ascii?Q?xGrbot3NVBI/qsNG/byDIjjZmJ9YugMjwMvz0w9RdYE/slp03+O58iVSlDRN?=
 =?us-ascii?Q?ZAv8lcEPQjZjDX/HzgaLpQOdFJyj6qAm1O88fs5J3QVEyRXz+X/jfnwoMPrm?=
 =?us-ascii?Q?AifZR/9jqQrZ+jhEu4nfvI/hqDt8fmSYelIwbW/FJMQdFiSdigl5wvlnSRoI?=
 =?us-ascii?Q?3HsqThnAyiCsxT8YgEyuw/ePprsEgemq6YOuug5rlTfxjDNTgP3evVpKi3th?=
 =?us-ascii?Q?0akE8E5+FDYiZ2zUKJ2VrXzzic5ahcj6nxw3eNUYcwAqf7L2T502HRE3KQth?=
 =?us-ascii?Q?AYg/lUOSnrNjdADqohPV7VkWz+C+C8uk/2l1IkeITBTLyuPSmghOVdYlwTDH?=
 =?us-ascii?Q?wWGAikLYXmAoo6l0hWekyEq8L2IU7KtOX9mowdydZtKo0ZuDIgI+9JhlJSFn?=
 =?us-ascii?Q?9V8AsIbjdJdbYUDbMMlarvzt2UeBlIRl4c27IvxKO1ga1hIROAdnf/GJ4bCh?=
 =?us-ascii?Q?Ytu/kFXWthEznvG5YeCA5ta3oB+ij9JCNS5zczKNdGs8qK0OEUDt2AjpWs/3?=
 =?us-ascii?Q?Qqx454qNohDH2BC+FIdfvevbLIB0CvYFvr4xhG9THZke7C0+Ki2Kgo6Nrzt2?=
 =?us-ascii?Q?z8bD76u78/rno6SgD/eyqPwsm9vVwWE+XeP3J46vjbV04KxZdEGAbhcQeSrE?=
 =?us-ascii?Q?4kk7Xv+f9idyyOgBCJhDkzCSD+y4NqWuTFAae6kMHjecMPYAacJ7dsDN/gEq?=
 =?us-ascii?Q?Ulgwq+8JdIyHa2WPHJ0jAMNZcrjf89UBs2YQ2/IqaHr/VAP0FM9W5hdjWT4G?=
 =?us-ascii?Q?+PRtYPVSz3hGOQ8Nb77Y0I1eUSY7QPkubCz4XSqGyGCqx2Bt6OzlA/tIX3A/?=
 =?us-ascii?Q?f3LK1EWhBXfyZqxr+EI36bQWAyyes+MtC2Lk1tHeX704Wrad1mS/nnwMPW3z?=
 =?us-ascii?Q?aPF0zuui80bnnUh+zgRQWgRvU83sMEAD8kdIB0M5kAY+voFin5IwmI407fb4?=
 =?us-ascii?Q?mVijTMoEL8JvMRbviG4hj0EntRfctD4cxYU2dSRQ5J82wWp6nWUfeqyX18i3?=
 =?us-ascii?Q?Nct5Z82gUzgFRlO7EewWMwbHiJD8ck6oMIq8DqhhQjfuScLFrweT5g2fBc4n?=
 =?us-ascii?Q?YMLmcPOeDblMCWhy7vZJzQlnuNB8/Pm8L/m8MmOjY/St+z63Q8rDt1kHULYL?=
 =?us-ascii?Q?IG1429c/du6DwqvIUod5IZaqLeYtiktqZ4kx2p6HyHTBW/k0hvGAYLL/23WY?=
 =?us-ascii?Q?esPzRoxNEUgz4RIjVi+/Yi1dAt6xVIvQOgc6lbDbcim6R3QXk++lXp8PGgdY?=
 =?us-ascii?Q?AovO7GlmRR262m6VakH2EIFogrXIzHwpUdTv16LrM56ieiW+VANdg5Em6Y0E?=
 =?us-ascii?Q?BCBTSheddcgHyRjJyHGDhFVooZtRwFM+5/7p6oOJZZ5FGjf78Ws/Bi/2RF4M?=
 =?us-ascii?Q?SHGIitn++PlmGjKaTd2EiDC+Q1dIq/I+uOuTj4BLlefviwgIXvHvYV57CnlE?=
 =?us-ascii?Q?Mdw7L+rsPO/WxyH1YcUmTUEzxnZncL4x4ycAfKlRv1R225Bg60TsqDJUQKky?=
 =?us-ascii?Q?mxJ4yg8YU1RhD/n8cfFO+TAbvdWQXv1NyLh6otZQSXAem2hJ1T2dgPzmwZQ/?=
 =?us-ascii?Q?hZvgiZjbvrAYZl392zjYVyvlFzLg8PI=3D?=
X-Exchange-RoutingPolicyChecked: 
	QtiSP3xKC6p8jLgGSZ9eWWOpu1Dau3Y8pBIw9J8wZfV7l8yoGuzy5m/UDTwlgunsuT0Dke9ZFXr2GirAeg5kfg1Itsz72NjwCluxFPUiqCk/vAHeZrWQMCJGFl+c0otA7q5zq3IpzJRg71tmbdFExBQN1pzu4qVy9GlPAzFGfe1kuy/qTy7kYICCajtfNFQQh9eEkKIFSAaDnEPJ+Ut6XLXi6H7of5cCTandPFE0EGwhfPdHUkYakyxdH+eyFmXdKs8u+SjXOtRAZy57zxHyiHDBsu8K6qj4zp7UVT56u8YiUNtzK/tyCJfi3kcLsaZ2bDQEYKrElqq79TrRXfmkxw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e2f003-074d-41a2-96f1-08deb6962029
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:35:03.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPKwWbj5nj11fviMawx81yY+kiFBZx6D8neVZ0aqAdoF+j/3Bgzv4m7bjxJeMkJlSAD9o7kI9/zO62TOVgD+1Cb00RIu2Nj7Qs/GyfvHJm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: zRATzz0JQ0BDBIDYWYYLU0Cu0jXKnvW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3MSBTYWx0ZWRfX0aXP+vNhB6xq
 2qbi5pneiE9sM57Gg6vbI4puPrH1swG21Oj46UVh8VIIQ2w1yXCtyLiVAfhckD9+kQph20aLVIW
 wQUHq7e4td43s6t1pb1wWuTFibhUTRu0B0/6vdd7L/mwTQX7hQOamytJuVlGkUtLG3nPuO47mLT
 3n16yt+n/tCx6ZSipkEhe2t6rx8NgFoSiudQsebQUf0AArDkAUvsl/IrpqjCjiyrJDhgPZp6KYH
 v7pXUS17YxULZl6K//7mRo7uRZu42aGnhdFXdTSdAoBcj6ql/1wr3c1RmIEOg6La5qGNJ0MM93R
 0uTRTR/DqpUS7qWAJLzq3Ufs23syutNcYqO0PMwrT/jEOwBJiTnC6h55r8eT/P1v5m0PgqYBoOI
 gPOTUn6tlzk33whkIAPUa0U1+qG5kYSL4OpBjtzEFncvmia9YVEr/tzE49MzZfhmsvMtR8AwQrD
 evs67bbkyaj/dr1uybw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0df0ca cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=f4FRIwN8j0KLBVNNJjwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 2WBX_t8zHdCoLWZ90gBpqOkexvc0_lEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237462

From: Sunil Dora <sunilkumar.dora@windriver.com>

Brings following fixes:

  * 5ea218a153f4 [CMake] Add multi-target cross to ARM/AArch64 Linux toolchain CMake cache file. (#179598)
  * 7237429c2edc [AArch64] Fix `shufflevector` miscompilation on `aarch64_be` (#193076)
  * 5e29d8aa0481 Prevent undefined behavior caused by combination of branch and load delay slots on MIPS1 (#185427)
  * c61be37fe844 [clang][CodeView] Prevent the input name from appearing in LF_BUILDINFO (#194140)
  * a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#194310)
  * 57370e18b8a9 [Coverage] Fix quadratic propagation in RawCoverageMappingReader (#194996)
  * 932756ad6c64 [X86][FastISel] Restore support for struct returns (#194586)
  * 19f65f31105c [LLD][ELF] Fix performance regression when using linker scripts (#194668)
  * 5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculation in fixCallUnwindMismatches (#194184)
  * f3ce7a7db0dc [clang] fix crash with c-style casts involving dependent member-pointer types (#194696)
  * 692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module
  * ca0698598261 [SystemZ] Enable -fpatchable-function-entry=M,N (#178191)
  * 0d37e79da8db [X86] lowerV4F32Shuffle - don't use INSERTPS if SHUFPS will suffice (#186468)
  * 9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)
  * 7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap instead of stack (#176488)
  * 98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownership kind (#189903)
  * a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as fixed (#190490)
  * f131d162201b [clang] fix error: cannot compile this l-value expression yet (#187755)
  * 20fd94cf9314 [SLP] Fix a very long loads offset, being stored in DenseMap
  * 267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)
  * c4b74e87ca35 Bump version to 22.1.5
  * 35990504507d [Hexagon] Add missing MIRParser link dependency (#191010)
  * 22ad4d688a72 [Hexagon][MIR] Serialize HexagonMachineFunctionInfo::StackAlignBaseReg to MIR (#190003)
  * a1a9924414aa [Hexagon] Add AP register to liveins when used for frame index access (#188942)
  * 7eb182991920 [Hexagon] Fix use-before-def of AP register in prologue CSR spills (#188504)
  * 74049f6e3a70 [VectorCombine] Fix transitive Uses in foldShuffleToIdentity (#188989)
  * a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)
  * 9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaTemp path for musttail calls (#190540)
  * d46116b2e464 Suppress octal literal diagnostics from system macros (#192481)
  * a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from #191429 (#192069)
  * 3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any directive (#191429)
  * d1c9116f8442 [clang-format] Correctly annotate binary stars in braced init lists (#186732)
  * 99031a474bb1 release/22.x: [Clang] Track constraint's SubstIndex only if it contains outer parameter packs
  * 5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing it directly (#188883)
  * c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers (#191760)
  * 07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation above 512G (#191039)
  * fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes
  * 10be0a255205 [clang] Allow -Wno-error=X to downgrade -pedantic-errors diagnostics to warnings (#184756)
  * c2aea991dba1 [Hexagon]  Fix O(N^2) compile-time regression in HexagonOptAddrMode (#189531)
  * f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions without +sme (#190141)
  * 5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead register operands (#186055)
  * def143a6c624 [clang] fix getReplacedTemplateParameter for function template specializations (#189559)
  * 5b4dd04594bd [pdb] Fix public symbol hashing in GSIHashStreamBuilder::finalizeBuckets (#190133)
  * f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after fixCatchUnwindMismatches (#187484)
  * e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors (#190701)
  * 53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using vbpermq (#181233)
  * ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with -export-all-symbols (#190492)
  * f0593ab291c7 Bump version to 22.1.4

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c5a9d712..86e8716171 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1b8909eeb5..d6ad546c59 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "5"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c68..9c700eb5fb 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
+SRC_URI[sha256sum] = "7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


