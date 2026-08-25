Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBB3C61DC6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12517.1787621621543433854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P7QlGqUr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONb09Q158523
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Sx6BTDfcjeWeuuaGJCOtC8K59Z/lsdZ6zmvYIuQE6iI=; b=
	P7QlGqUr4odDpcvN6aVY9cIaT+X7AVZn0G2eGyrPC5ZCMcDLRvsCK/DZzwtHOO47
	RqsTAp44xCHOt/I4jFRJ9ZuvI+WVzK7kS5LiXLQEbX3X3V8i2eVItPwFzMutu7Pq
	yEPrDLYSjdQ7vZpP2UEKWP6nyo+KdVUBq4gfIYkOYuRypRwWrS68p5WSkfPJYpoJ
	oD3CYhzU+icBO03GRYBN8iAsDR5487HdqYpwyOCC3LMVZs0tS1V1SVN2v6gsb1Re
	bZIZzSU8Se5wjqPpDVbLWFI0yWLNC0NqEAVFZIs8mIzbnJJsN1ddSg80Zzyb56YR
	2SKfpRaZ+axZqRggKu8q+g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022107.outbound.protection.outlook.com [40.107.209.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkg16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob7WBIPQ2qnwQX7SQUS3Fm6OOeoJYKvDx8WSmWFpV1KyxSJIGsRulbg+49OkEhFJxDM3ZdVW6gB28sZCMuoDjzHYeu62c16xhKNzYIlrD29eoOPDY/uW7dQa9fECq4RIjDx0bMOEr0Iw5bCFrLHjWVjvY5ilU6ppwFaibFdzCekOKiCzE98pS5x7Wv2OIU397YfKWoj31C7NckrUnWb9ZhV5mR60timsgzIHMX2uaMt8ftHOpqkoveNW/VVgf3cxqIkYzZterljR3v+lTmnsHful5eMFGDJ+IbCdckPjHopjxuPcO+botLMWF0PMprNoOgS0YtNAGYnjqPSw8S4sVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx6BTDfcjeWeuuaGJCOtC8K59Z/lsdZ6zmvYIuQE6iI=;
 b=d8c7QfJpRu1FlbgzLil00dY8/8Ikfmu1nocurSxSbr18MIS1PRY6ZoOqdIakRNMSHfnVMWt7m4VhsUX49bJe4rxOwefZ7YLtf1n4xmUzOH0Qo6rsEqTT31v+X9fSWRYna+BMl69mqvh/98XlJ9fhJFVq9MvtLMjye+X4aDqR3Slp2Rgen8tDpV1jbgDzkw/mAamoP/MStyIBcfraOJpVByc1t1bNraX+v6iKKy8OQkn9Eu1GajgYO7yyA9OHYdwcUevdpgXaUiLhCVtQzk/k9mi4iZ5AD2e0G2iY/COEe8lC5O29sGrqDhmY5rd1Tn+cHvQlUCXtzrdooMdTeO/snA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:38 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:38 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 14/14] lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on %post failure
Date: Mon, 24 Aug 2026 18:33:12 -0700
Message-ID: <20260825013312.2695028-15-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: c889c092-fb92-4ea5-ed72-08df0248e35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|23010399003|366016|5023799004|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	anJxLfiIg4XxDSit2NjMZdYue+r96j4mKG4ry1LhpPjK17e5b3MNd9Gcg6yF2q1KiEMWm23P8a6Iwrzc9RmIHiUbYoZCXV/w2bYua9maXDPJWF4Z/Pc/DHDZLG5bN9W3K4/1G5d4MjHSUcDxtFRwSC1p318PDfcHUQtZPpcukY9nM2V8BzTEkHWh32DHXT5b2cATFanc3s4zGlj/v6lMRsXI0ZoaU0H/HVGMnSfI/cV6dLWXK3G+CUJwVaehAf75Lf+zAFB4V1fF4kPsZhkTLU342kFPJRPUgmUKl6Ngd0nzwhZ2g5etpB/vn0h3tUHrtvVl2dtfQLEIFcwz/TRn9EzQsiOlHROtaA48D+s9ZLrYgn9ver3jtj6/qZduC/cPauvQJCnJIJbmJI1MEvjvQOGyhKf0U4bCw4IS1EWMTctrIAzN7cBUvK+gaK/ANWnyku/U3R/nGJFJIFZgl8bXiq03vShcYXBU+AGUnrps5R7Ej2Wgwal7pahY8fsf1ZSCwIIZ8BdUAnMGVmFx6JQpOuCwpTH1u2AQm884ue1ZMbgq9b6XFIUP9kAksoFUx8YjI5qpHa/V7sGQ/YG8DpPAOPdI1oHvvcPun7j81zrSVYeaYdfHZUJ+lZ60WnvFHTqJnlcPTXoUdZOP/pCrW6m7CJw3wfgsdcSYTfs1zu0++/BLzNVTu1txS5Ls89R0EQquQLF4DE2hz9FrJc3jUQCD5MANVxtYlvYr5aTnkg4O9cs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(23010399003)(366016)(5023799004)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S5L/+SqYw5+qd1zxh4jux+e0QsH/2oCgp0uznIxv7av2g9Fxf44oAkNKWF5k?=
 =?us-ascii?Q?tk35BGtmWIDcAel4a7wY44SRFqx4n7Ins46LVodq586KqOoXd2oCT1l3N/ng?=
 =?us-ascii?Q?mL3cv3BKFH4/JCSwix6S8haLrmzo9hy+bGWD4YPCVPFewHEUGm1kaNE003Ju?=
 =?us-ascii?Q?S4PzOQ/tudktGxATmtUPHVz1uKq5i0AEKi8FaQFvznIvcb8/jstZw3848Pgo?=
 =?us-ascii?Q?JKL4ZAqRfT3cR/hOy1GXYG+QdFOGpb8r1upmkZVlASYnTWvhuFoIKV21xCzm?=
 =?us-ascii?Q?CBL6CaKCQv0gN60WP+qonyuo7ciCIHpQgi3OyroXj7rSrdRFtoxXvm5W3zcH?=
 =?us-ascii?Q?4yeBj7bpq3AP4/yyT7WdjITBullYYR15nQ6+n02O89XlDv++XizXuAi5L+MA?=
 =?us-ascii?Q?USmZWYS21q2RZViR87r+SVkqaBpUs8iqe9+Pq7qbOrGUQdRHJisoxBFTeD8R?=
 =?us-ascii?Q?VOTZ7RZMnbriOnGMhtVi7ZEsrF7UlacGW6U13ipFoL3LMQoFaGCmrvrQnrY1?=
 =?us-ascii?Q?PlRbBlG6huFOKQqMZindMHocbb15TysO3esu4yCTzSm0s7x8bTaDREc32+/u?=
 =?us-ascii?Q?BpUMi0OjcH6VwBHvVK1B5IrO0k/eZCPzQhNBo3pjH/7KVvO5IwXLeeDBdbkM?=
 =?us-ascii?Q?SQ8UpURVgSVeEKrp+dtwFc1ektj9m1BLdDLIlM3tqpsqZB1hJf/bzwSPU/nY?=
 =?us-ascii?Q?QpM2Ajizc304kwdoQtkvW3NozZRMuFOHwBpVVKmiQco3NXfmbea/sAHygx4Y?=
 =?us-ascii?Q?35T4QS2ppkLhTcsH23wqVnqOIMH5VBQZo4oOFps+BP8F0z9bm6BfAeGAkODI?=
 =?us-ascii?Q?fZuEDp1wW71l/erfP+b20/6c/T70+sWWBZ+eWcwyyU492xfC5WfgVKz0zuVQ?=
 =?us-ascii?Q?L7/UD30WoJd8U1OKzXdZfCG8zN8gjjBfAqCLsVpFvOzywzJlaEW7NRkd5WdV?=
 =?us-ascii?Q?1w5EjTOfu7tEieMtk5fZmEVjBxXMT/O2g9+L2bQKx5jihKox0MMo4gDPtNBV?=
 =?us-ascii?Q?tMH5hV/AomEh4dxYrqgU0lEPqy3MJvZVq/UaMddUq9yOZJT2McmxW6hmfhgg?=
 =?us-ascii?Q?lfT2M8ptHs8cq+OUc+cZ8Ert1567cDHTvZG3MPeCmN7dxWuVLnQCXWD0+em4?=
 =?us-ascii?Q?AEm+FjUdSyGu4mn3brWAHSaE8hN9nNA2qMzsiuZoRKaLozwZ5WZHnP6ah55R?=
 =?us-ascii?Q?fUEKIWzui23DKfy2enGeKWlTcGVWeJWzwZmVM1hDMJyM/wGp6/F66BzSqii8?=
 =?us-ascii?Q?GD6k/8fMnK1ja8SgOB0vzfPEr2xQOmEsvmX8nXSnMBYZZWF37Qteh59GDYSd?=
 =?us-ascii?Q?NLuwsgqckcewhHtJkUiN4XZfOhmpbKVOhgY7fFrAYDOemRI5449EGaudOwhq?=
 =?us-ascii?Q?klq5Ve2S18qe0xY0EIXSFgbgpLzj8H8peK8RLe8R824HnVm+6jzgXQ/CpGps?=
 =?us-ascii?Q?oS2OTmfsC6FvKmdfUOvadWz2Lus8C10YmrAE9AC65T6k+DOLfgg14RmbuvgJ?=
 =?us-ascii?Q?ijpt+ZTKQI8Ap49x6b1qjsjF3jpNSBcScVhd26Ot+rRO7n8ftByaxo86q59d?=
 =?us-ascii?Q?bhX1lHpTDa8NwYy8osSGrQFYlOEq+9FXI4J5xx7UN257uS93/NDY1YwxeJq9?=
 =?us-ascii?Q?FrwOoHhagt6ChqZDlzD3sYy4qxHzOog2PirIdQVsTFwD42xaDqMtc+Iopahu?=
 =?us-ascii?Q?z8sfDVIdnid01KZ8fzn+mdNQmKSqBX6myVtUvyKR9ZRuMtNgaIRBfheubTfz?=
 =?us-ascii?Q?OM8tV2vZFum7ndw1fOl/LHE6Pqt/Y9M=3D?=
X-Exchange-RoutingPolicyChecked: 
	g8jB9nF6eRwzQMB2GvQdcnyZgeHMT8blygkIHZ13SFIUR2eAI/sFIKI4jRAKTQ7di40jjAmYN7+d+vtSSB3eJVxzWgNIob6s864EWKtHYISC0QFTuqCW2Oa8KMyrIA3C39NENu53/XtgC0I68wzdIWJZWQxxvRNKFhNIouXseo9wCOqQTXVFUme0E8Qiqr/v7wtndU5ZWvzNESiBiklQMMD3p4FEfqGgLTgIQaQXqSll+S3OeDl5e43bOOIyivDDLaEg9bNPcB6MK32MJaBn2/lv1cmXqe5l0y+N6PrQ0w0/34SsSm5KvBJMmTPOfYBt/8RWiYL70puOPa6txMZsXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c889c092-fb92-4ea5-ed72-08df0248e35f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:38.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnx9GpJRkh94KXV9jnTA+YRdxzSr/kG9hZvAPbM7JLffytDNI55MWpd/3QNv1keBriX9VZf3sHwOhlIwgiuF/90fN8hmquAn1GLGhagALk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: UYCAUwd_RXVH-Js6gxBqhr7HGSUiHMpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXwDyyRtpVoG+A
 Gyak5sxfikjDEwpo+l620oADZhPfsqSpIjd12Fw6jaIp18EJgm6kwapzkyFpIzHfaWQamdwKdJt
 vRsMtaY2V2V41aU71IdVEWHdbxybj8lJF1nvMylouoXiy7dVTMJJ10kHKDtZDyn/VYgBPGtDoFq
 CyOBa1Gt2BOwQD8Ucd6b8/qRK8ncyB60bxmMZsyc52pJGAFVLCM0dJ8R9yBroXt72sDvzy3T+YZ
 6lBls0slnxy+nKLsgws5Tmr1UlqI7KA89OhIya4Jn7WRl+C2RVmVZ5x1Avxj+4cb8YzTHABEDHf
 2clzfOK1jDK1yB3QfUwRhAa5OBzAiwxX9JlFoitafmlces9n6S+PQUyIT9EkXwE/KbOWNOEi74G
 REPYytsQsp30wG9HMt0FvkMiiaplXJmYL/sUOvDYpEjAJGAG1UVVWiZC4DRxBpbez8zXweNVQcl
 s0lcK+oQtJOkbDlNXJQ==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0f4 cx=c_pps
 a=eTkUf83celiOrjwTarmvrA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=xrz2xm_XJy7u4lCe5tcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: m7k3IDfQ3HteGt192mSYi9pieUA3n1sV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX8aLUH7zcaM2L
 Kh7mHnOhhoHYFdWC/bctCzvHl9/m+D+ViFehKipxPEHnQp9SqJj49cstNikmMe8fmG2F7XRmphG
 3dG9rXxaZGYfkbHDS1TUhLp2V7bX9f0U/UY0ENbcvl6aRFFlhEZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244186

RPM 6.0 intentionally changed rpmtsRun() to return -1 whenever any
scriptlet fails, even non-critical ones like %post where warn_only=True
(upstream RPM PR#3819, lib/transaction.cc).

Root cause - two changes in RPM 6 lib/transaction.cc vs RPM 4:

  1. New field set before warn_only resets rc (transaction.cc:1754):
       ts->scriptError = 1;

  2. Final exit now ORs in the new flag (transaction.cc:1910):
       RPM 4: rc = nfailed ? -1 : 0;
       RPM 6: rc = (nfailed || ts->scriptError) ? -1 : 0;

Call chain for a failing %post in RPM 4 (exits 0):
  runScript()        warn_only=1 -> rc reset to RPMRC_OK
  psm.c:896          if (rc) break -> NOT taken, install continues
  rpmte.c:823        if (failed) -> NOT taken, rpmteMarkFailed() skipped
  transaction.c:1652 if (failed) -> NOT taken, nfailed stays 0
  transaction.c:1896 rc = nfailed ? -1 : 0 -> rc=0
  Python ts.run()    returns None -> DNF exits 0

Call chain for a failing %post in RPM 6 (exits 1):
  runScript()         ts->scriptError=1, then rc reset to RPMRC_OK
  psm.c:896           if (rc) break -> NOT taken (rc still 0)
  rpmte.c:823         if (failed) -> NOT taken (same as RPM 4)
  transaction.cc:1652 if (failed) -> NOT taken, nfailed stays 0
  transaction.cc:1910 rc = (nfailed || ts->scriptError) ? -1 : 0 -> rc=-1
  Python ts.run()     returns [] -> DNF raises "Could not run
transaction."
                      -> DNF exits 1

In both RPM versions, RPMCALLBACK_SCRIPT_ERROR fires and DNF's
_scriptError() (dnf/yum/rpmtrans.py:407-418) prints:
  "Error in POSTIN scriptlet in rpm package <name>"

OE's install_pkgs() already scans for this line and calls
failed_postinsts_abort() (package_manager/rpm/__init__.py:210-219).
With RPM 4 this path is always reached because DNF exits 0. With RPM 6
the CalledProcessError raised by DNF's non-zero exit intercepts
execution
in _invoke_dnf() before the scan runs.

DNF 4 (lib/dnf/base.py:1146-1158) was never updated for this RPM 6
behaviour. When ts.run() returns [] with no failed elements it
unconditionally raises "Could not run transaction." - the comment at
base.py:1147 still describes RPM 4 semantics where this case meant a
global error such as a transaction lock failure. There is an open DNF5
issue (#2507) but no fix in DNF 4.

Fix: detect "Error in POSTIN scriptlet in rpm package" in the DNF output
inside _invoke_dnf()'s CalledProcessError handler and return the output
instead of calling bb.fatal(), allowing install_pkgs()'s existing
scriptlet scan to run as it did with RPM 4.

Tested with oe-selftest runtime_test.Postinst.test_failing_postinst:
  rpm 4.20.x: PASSED - DNF exits 0, scan path exercised as expected
  rpm 6.0.x without fix: FAILED - CalledProcessError before scan reached
  rpm 6.0.x with fix: PASSED - scan path restored, bb.fatal() fires

References:
https://github.com/rpm-software-management/rpm/pull/3819

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index cd6efe3d3b..ccb4316bd0 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -333,6 +333,13 @@ class RpmPM(PackageManager):
         except subprocess.CalledProcessError as e:
             if print_output:
                 e_output = e.output.decode("utf-8")
+                # RPM 6 fails the entire transaction when a %post scriptlet
+                # fails, causing dnf to exit non-zero. Let install_pkgs handle
+                # scriptlet failures via its existing "Error in POSTIN scriptlet"
+                # scanning rather than treating this as a fatal dnf invocation error.
+                if "Error in POSTIN scriptlet in rpm package" in e_output:
+                    bb.note(e_output)
+                    return e_output
                 extra_info = ""
                 if "install" in dnf_args:
                     if "Error: Unable to find a match:" in e_output:

