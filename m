Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B3CC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:47:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.794.1787204860613227068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bolcAzFj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2692434c95=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K4Cb19917979
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vaccxr9ws
	Owoyco/kgBpfegHF7T26vT1RBHqam6dDKo=; b=bolcAzFjshPat5MANT24KkUwg
	Gv4igl1mUeSxzcvxJRD38VCF0T2KsynjR1CnjsiRRh0UBiLJh/Pvo7MFfLdn+cp4
	vhmytAQ6QeZQ9JWIlLyZBujkJ1ltpToWv+kvK4+5An1M8xFPo2fC6NFGOPMcJe8b
	wZvc7xk0cfH2cjGoB9EItbHxYFpAIVj1KuiBOzLw+Sxx9X+P3/R7Mf86XYUeY2EZ
	IUHO3FuRloB9Ewed1MD4HuxbVk76/68LFIM7/QylzZjuZl0uEXEd6xEoe7Wqq/t8
	IYyoEy6q13bQAOVMsgROoKkBSKbPNPAzWnsMxL64IuI3pABts/8yajTx9b0gA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020109.outbound.protection.outlook.com [52.101.201.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4yd9jha1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:47:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiEj0tTm4a6V5fTo70qvvlqWeIT++7b2e8Ek7uQ2MTPrxQka6y10Gfr6NKH0g2qMAALPV1efVi3v3Bx+D+ybm2k0SwY2HXbD6k87tgdvhod1faD7wQq/8tRluMhRdZg7907htjKS2e+Fp80d1fS1a3dQGXgizl6HDE+prwZp2P6omKDb7aN+noEUGB3BuP9HQZ8lprKlt6t6iu3WEyXPW7r2JXrLrhHEoQ+icMV2Ii9JLBp6UvXp/hEseC6VEHH7ASBkOEVvsk5XImSk/YsBTsC3CdpCRPZ+puUuQUbYja2HIbKPojXqWzE9y485sI8+cM7fDQlchQt1IwnLpjuXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaccxr9wsOwoyco/kgBpfegHF7T26vT1RBHqam6dDKo=;
 b=qEeh1UvoirpxxnqlG0J14gaBVwazdAFwfYl4OGZ1Hdjkua8NizieRHbl9udAiTYMblI1JXvCkpjqwPDwUeQLWi9oOAQPRhCvjnMUGJy6cdhxfzpQ1RH+sDtYuG8wt6FUEhXZVvAfNgBfVwW1Xhf3UfWKyTh4wa2rDuViFKeig2r3llKGjJZQkil5l5qtWAJ/Z3eYoQGl6mZOSCSFKmT6uRedxgYL3eH7tBoJ/a/pnkG3cOzPQgwLt0q9HB5blWCKezVCMxXQTPgnIftk5ivUuaQPYUMHnzTs/2Gs+vaEAMUD9QzJiCGDV+CtB4LxLierrZXPJSPPyssysUNfJxrmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.9; Thu, 20 Aug 2026 05:47:34 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 05:47:34 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] glibc: stable 2.44 branch updates
Date: Wed, 19 Aug 2026 22:47:15 -0700
Message-ID: <20260820054715.1620624-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fe5f81-9333-47d0-e5d9-08defe7e883c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|52116014|1800799024|366016|38350700014|6133799003|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	E5Z27S7F/k2rCvV1C1S+tG1UygZEmNJcjzrU8Qw97NdxE1LMW/mv39bYeuVscDGxN4vRZnl9AowP6Xr2A5OEQs2Tosde1NJy6qasyzjZGje5aoZbCp8ya1BMQKfYxYI0zrh4DR5I6YH9lFTbsbXYkXTt9d+nWvHHFawpDoWTgdB5pt7+3LVVe4y4CvMcUBpjEb6IS18QZ41RyMjwUCfT3C/AZi+m1aiIlfC1uDdhiot41iA4vDi6Xmsr/yJnwbArYI0ylhiPRBG0DsQ3O+fxz8EtwCkaNfFXgJQ3usRZmj2o8SmVtDrK3BvkbxiuCA+yAiAt7OpxZW+itCWwGox82DxtDhD2abTRRrhYEV+QjTJWTJDtIslBnt/Xs5CKShbIjoskUDzYfnsqgBHmMcizQYMNu6RqASCSzr9tn8wHtbz8vL/V1/2IpqHZTz/YppIFpUyFO/V6o9XXKpsO4Wg+QqcdV9DujntgivSIvImxveeKO7/dIR7/uxCgwlB8sxkvhUgQB27hyoPQnzzwA7Jmi6qRIpoxjjhdsCBtSe6XUtCkL6qzhWhlkCsc7y2hT48ZwpU1xYcvNfT3TWtZrXCRUTpz4LQ+3vVrEtkIIYiH3LM0HZBuNZtpJyv6OyN07V5yzVInVCBCqC853YeexszXl64mJQxutjZycPvaUmhq62o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(1800799024)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vgop9WKnAFSriL6hHJAvX0wNZWeDoYc4OqrjGFJO/oirrvv+OEM3OZX1LMW6?=
 =?us-ascii?Q?+3A2fjgwEtRzs3HBB10oDyjgBg0l2hzOB5bkkbdey/2b2ufPwcXK6SLZaGxS?=
 =?us-ascii?Q?8s6J2bh3NX46GdnhKIUWs3bXnH8OnFQ4+ExHPrdmFbBzVn1nbTQuevR1SZK2?=
 =?us-ascii?Q?WA5v1hBKMSPbfx9wTRJofmQmg5tt6/HVPDtD/+JSrD+kO08hbawhg/C59ybk?=
 =?us-ascii?Q?NEZLUCdEURx7bbJ2Py4iFLm1qw+LTkVMaEuPAmV1LO/cv/wcOauVqVUOYWjl?=
 =?us-ascii?Q?zO1QCmC6h9HTay8Ps6TV3ncAK0Jxt2IZJ3ZEiHe4qKgy6BvLt78mz/L0iR+l?=
 =?us-ascii?Q?u25zqKyvl5NmSRXLa0lBcBgG2KxsOlo6OzwzeL7KkzgtNoWAi0aWntWivxij?=
 =?us-ascii?Q?Hfre7CkMNipMR+HM3+OPdr3d+XvhPlK2967Yn/7jbV83lOWKYSZwdXtTMT+s?=
 =?us-ascii?Q?4Ws/GKUFZgVTqNaf3lnDql/9pr/cpGHVzDiRC/8W4/XW7GYVfYr0VwANsi43?=
 =?us-ascii?Q?scfuAEzfe230slQhjAcRejT/uZLnK2Tg+/9veCWwvyeUadRE0MmGfvhe/jxW?=
 =?us-ascii?Q?M/n/kxQqUjO2tjRF9djd5gdvJ/6Jgv3c2lw8TEQHIC+f/K09se7o7cwnEIEb?=
 =?us-ascii?Q?8qlph973mT9LW1MnaFp3/1VM2EYSJorTOd5huOJO3S1/LgHy/QWhO6q2JJ8k?=
 =?us-ascii?Q?GNSTAw9sOwwMuP6fMofxCbWvWMQuB3Zb8kn3g54loGUFsRxc6USVSjBZSGLZ?=
 =?us-ascii?Q?6rBaMlae/1HEzsxsVekWasAt4V7OCSdFKC96EcPmRBsM0t82dSVwikEBNQzm?=
 =?us-ascii?Q?fT2NpTxfGl9pFTuikRAA3ozwGrgN1MVuL4d9kzaUlDKFnAE01EntBFg3vE9v?=
 =?us-ascii?Q?xu12C0fJ+tBZA+CQdRYuyPl8p1t/amk/tTPpXqJ7PdEvZ6C2Z980lOM5Wp8N?=
 =?us-ascii?Q?KasgEl7QC+zwr/DGf3lxg0px0G3w3MBlTnAKm9b8nVWstuP8zJoV2E8W0Lh+?=
 =?us-ascii?Q?tfSb+HxyeBbGcCmTCq75l+gbzgtrHgc+XqzJ0/WgYgJ6tl83bms6+jyG+PNA?=
 =?us-ascii?Q?kQaovtXLejF1S+1eAfIIdEHCStUTi7krnhQY2MHWuBc88UDbceMCy7fsz41E?=
 =?us-ascii?Q?Sjh82vy3Cj5dD8AnbkihGRq1gZ4Mp0loC+gsuVmFGexCEiplZQICZm7zkU2v?=
 =?us-ascii?Q?BSze8yKxGc1tEVLBa63iT6YDXTBFJfFUdNMPqX9fHnWV9LIkx9EDC/bFB0S8?=
 =?us-ascii?Q?axBYdztv2RNBbZhQQukgwB1L/kRUhdvcNp3VhJva/T9aS2dgNFqvwFNxzFof?=
 =?us-ascii?Q?L3Vmmw4SS23WmOUEsiGOy9tIxHbykR6Y9N8SiBli2jEAB+glwHWa6RPMoAXD?=
 =?us-ascii?Q?rrCv3TxMGMycJ0EXTiut+01jXP6/xR2ssKGwPVEk6ipqSwt4UslF5QWmWk6i?=
 =?us-ascii?Q?DyMzwmdUVuXEaromc+QVZB/cTl7YtN+JMV7wFG9gWd/jdwqtxq9kUWrdPZTz?=
 =?us-ascii?Q?wLlgUzEKrLQ3xHlbHMhIrlJNfPUsXXwSx4mrAS0hN0saBS/20tKAWeT7Q96K?=
 =?us-ascii?Q?pazSW207ObvB+kTvmXAMkjwKFg6WSyiLSmcWYZHbJ+de3hRxbCuTXqtZkBfj?=
 =?us-ascii?Q?hvty4r0ahn8CFuPC+FVfusvuth4jEBTmH4d1PWiV7ISB7VROWx0xo96z8wua?=
 =?us-ascii?Q?svqD3LFdOg7vnAOj3kv7543vsiv8mfydaZ8EH9hc/8bohKGqNbU1Pfl/3S+e?=
 =?us-ascii?Q?1FDnpC3w9jUXlsTDwWX+j1FC4CChpCw=3D?=
X-Exchange-RoutingPolicyChecked: 
	sSq8aoEvn44CsL6NAdt1lqxY5kvVZ0ASXV+vV2jmnJEN1Bt6dVdUWikO5dTyKruZZFlx88M+f6KdnpkArBtWm657BFvqauneLtGer2KBdzbF5P4LwkH6QtmD6E6NxrYfEGSGySQpxk3VMuuZDgdbGweJmLDDIaXPajEkoWeNixDVnV/8NIH1Ge1aF1SAUmgzABLHDL28oMtPN+sYJ1adpOsdfRLaUwMlj9u2/3SLPrzCCbFOUZ3G51N0edaeOcdaR+gcUobJD0OFLGWBVWE17bwXg/D2hOCDcNe8eKYpwxbuYq/ECNDMvBB8JjSx7QpLbNKQHUPN552ZkjatXNMUUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fe5f81-9333-47d0-e5d9-08defe7e883c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 05:47:33.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRdfMh2E3QtmBtP9EPhejtdZgaEeGzx1NL5cWMxo2ScjPlkB+nBBkvm0fkWZR3o04JOvGHYJfPuNldSrLZdsWLSJYDcJyDelwYg7/bypdOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-Authority-Analysis: v=2.4 cv=MbJcfZ/f c=1 sm=1 tr=0 ts=6a8694fb cx=c_pps
 a=9zeqhqFsX+GWigQuve45qQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=KKAkSRfTAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=cmWlzMUdAAAA:8
 a=kj0N639peJFD04wTRzwA:9 a=fyDdYCctzKlsTcMO:21 a=ul9cdbp4aOFLsgKbc677:22
 a=cvBusfyB2V15izCimMoJ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=93ApFmx_MQ_BoSUK457J:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXx/WlqeDeeKeg
 syl9awbplWUPOOb/1UhgLueODtwYBPUX7Q7HkdL3vrj4TZFM5O9VQuch/X0GYyrwgaeNeXMiOFN
 W01tcfbfJEySilyEDHHkesXQAMDCONR+UYGiao6l9FhLJj/Ixe35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX34mzGPLLcE+U
 t4PmLnB36dxde2sCyvlR9HbAD1veKqnYSImnIoBWKpoBGo5aXrVKXWIJZx7T6hyG7Jv+te/9iOW
 q8hmpTOrjDsidmtqnDQCGk/Ltsu/E9NVXvq1RDZKGkNI22xiPFHPY1EDAmurhRYOFsXPpfvx0B0
 xV5tnhyG7PEzEP2wQLZNT+0SgX6ETIgPQBFyW19h4kAVAmcnyIGSy9YqMnNIoGOBkKebdlr2+3+
 9MHPuBr3yz5hFnOwl5IN6/Xh57fQ9VCDEclukrmKXesRvJcYBzLXUDY0ho1I2rh+alx81REfSCa
 fyEUCxP4l2Ptso9qDaFrr67mRakIybFA8oG78fbMcPBaWaNs8GZm74V0nawO6xqQ02fV6lMAiCe
 kueUiDbXDbBtQhQd9KnrBDi1TV7xwVCiFwU2EtNxz/cVqQ1B+mqA6tWngLOHCx/Fr96JEbd28K4
 jF+cZquf14Gt1oX9aVw==
X-Proofpoint-ORIG-GUID: qQXYrYvk1GVTk4yW51iomcGWM2XFe2T0
X-Proofpoint-GUID: qQXYrYvk1GVTk4yW51iomcGWM2XFe2T0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243803

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 7cba77790f3279bec3ac20e9c7632b021cd53f95..afd131806b25715a7617ab757db43f0bb610acbf

afd131806b m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
16be151849 elf: Honour skip_ifunc for cross-object IFUNC relocations [BZ #34428]
11ac3d78fc string: Speed up strcasecmp test data initialization
65d35639a9 string: Speed up strcmp test data initialization
7cc7a3a4fb stdio-common: avoid repeated regexp matches in tst-printf-format.awk
89da37bb6e stdio-common: run AWK in the C locale in the printf format tests
eacd9cced9 powerpc: Fix -mlong-double-128 IBM format configure test for Clang
9e1b1ef77c ldbl-opt: Fix -mlong-double-128 configure test for Clang
4662c4675d elf: test: handle different rootsbindir in tst-ldconfig-cache
26b9cc42a0 benchtests: Create objdir in the bench-%.c generation rule
10e3ce8a57 arm: Order the rtld link after libgcc-stubs.a
f34027b27f Makefile: Order the top-level stamp files before the subdirectory fan-out
fc36411946 Makerules: Make the .dt to .d conversion safe against concurrent sub-makes
f7beb24f3a Makefile: Only print the test summary in the second pass of 'make check'
45b8a13c48 Makerules: Only install the ABI lib-names header from the top level (BZ 34439)
5d1e923ed7 Fix gen-as-const-headers races with the parallel subdir recursion (BZ 34438)
fec2a9c676 linux: Inline syscall cancellation to keep wrapper frames observable (BZ 34338)
58da792d8a hurd: Fix build after the ftw kernel_stat.h inclusion
9bcb85688e io: fix ftw ABI on MIPS n64
0b58f5d80d math: Fix x86_64 tanh _FloatN aliases binding to the FMA variant [BZ 34465]

Drop dependencies.patch as it is now merged upstream

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6763   | 6765   | +2   |
| XFAIL        | 16     | 16     | 0    |
| FAIL         | 27     | 27     | 0    |
| UNSUPPORTED  | 583    | 583    | 0    |
+--------------+--------+--------+------+

Changes in testcases:
+----------------------------------------+--------+-------+
| Testcase                               | Before | After |
+----------------------------------------+--------+-------+
| elf/tst-ifunc-fault-dep-bindnow        | N/A    | PASS  |
| elf/tst-ifunc-fault-dep-lazy           | N/A    | PASS  |
+----------------------------------------+--------+-------+

Justification:

commit - 16be151849 elf: Honour skip_ifunc for cross-object IFUNC relocations [BZ #34428]
Adds two new regression tests exercising cross-object IFUNC relocation fault
handling under both bind-now and lazy binding. Both pass at the new SRCREV.
Passing new testcases:
+PASS: elf/tst-ifunc-fault-dep-bindnow
+PASS: elf/tst-ifunc-fault-dep-lazy

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/dependencies.patch            | 420 ------------------
 meta/recipes-core/glibc/glibc_2.44.bb         |   1 -
 3 files changed, 1 insertion(+), 422 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/dependencies.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ea13d8d558..9573f5daef 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.44/master"
 PV = "2.44+git"
-SRCREV_glibc ?= "7cba77790f3279bec3ac20e9c7632b021cd53f95"
+SRCREV_glibc ?= "afd131806b25715a7617ab757db43f0bb610acbf"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/dependencies.patch b/meta/recipes-core/glibc/glibc/dependencies.patch
deleted file mode 100644
index ff77408b03..0000000000
--- a/meta/recipes-core/glibc/glibc/dependencies.patch
+++ /dev/null
@@ -1,420 +0,0 @@
-From 43a9fe3338d41eac0607f82802a17928ac3d6a6d Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 6 Aug 2026 14:07:55 -0300
-Subject: [PATCH 1/6] Fix gen-as-const-headers races with the parallel subdir
- recursion (BZ 34438)
-
-The parallel subdirectory recursion (commit 7cac99621e96) only orders
-csu (and mach/hurd on Hurd) before the parallel fan-out plus the edges
-the Depend files request.  A header generated from gen-as-const-headers
-is only ordered before the compilations of the subdirectory that
-adds the .sym (through before-compile), so a header consumed by a
-different subdirectory may not exist yet when its consumer is
-compiled.
-
-That is the case for <sigaltstack-offsets.h>: it is generated when
-building misc, while its only consumer, ____longjmp_chk.S (x86_64 and
-sh), is built in debug.  The serial recursion always ran misc before
-debug in the sorted order, hiding the missing dependency.
-
-Move the generate the header to 'debug' instead.
-
-The same class of problem exists on Hurd: jmp_buf-ssp.h that is used
-by ____longjmp_chk.S in debug, and signal-defines.h that is sued
-by debug and setjmp.
-
-Deterministically reproduced with 'make debug/subdir_lib' from a clean
-build tree (which orders only csu before debug), and verified with
-builds for x86_64-linux-gnu, sh4-linux-gnu, i686-gnu, and x86_64-gnu.
-
-Upstream-Status: Submitted [https://inbox.sourceware.org/libc-alpha/20260806170830.126994-1-adhemerval.zanella@linaro.org/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Makerules                               | 12 +++++++++++-
- sysdeps/mach/hurd/x86/Makefile          |  6 +-----
- sysdeps/unix/sysv/linux/sh/Makefile     |  4 +++-
- sysdeps/unix/sysv/linux/x86_64/Makefile |  4 +++-
- sysdeps/x86/Makefile                    | 10 ++++++++--
- 5 files changed, 26 insertions(+), 10 deletions(-)
-
-diff --git a/Makerules b/Makerules
-index 6bef57ece9..cef30974f1 100644
---- a/Makerules
-+++ b/Makerules
-@@ -259,7 +259,17 @@ endif  # gen-py-const-headers
- ifdef gen-as-const-headers
- # Generating headers for assembly constants.
- # We need this defined early to get into before-compile before
--# it's used in sysd-rules, below.
-+# it's used in sysd-rules, below.  The gen-as-const-headers is evaluated
-+# per subdirectory, so the before-compile dependency below only orders
-+# the generated header before the compiles of the subdirectory whose
-+# Makefile adds the .sym directive.
-+# The parallel subdirectory recursion does not order sibling subdirectories,
-+# so a .sym must be added in the subdirectory that compiles its consumers,
-+# or in csu (which runs before the parallel) when it has consumers in
-+# several subdirectories.
-+# It must not add the same .sym in several subdirectories though: their
-+# concurrent sub-makes would race generating the header through the fixed
-+# temporary files below.
- # Define GEN_AS_CONST_HEADERS to avoid circular dependency [BZ #22792].
- # NB: <tcb-offsets.h> is generated from tcb-offsets.sym to define
- # offsets and sizes of types in <tls.h> and maybe <pthread.h> which
-diff --git a/sysdeps/mach/hurd/x86/Makefile b/sysdeps/mach/hurd/x86/Makefile
-index 97e3287c87..1d94f3a1c1 100644
---- a/sysdeps/mach/hurd/x86/Makefile
-+++ b/sysdeps/mach/hurd/x86/Makefile
-@@ -3,11 +3,7 @@ sysdep_routines += ioperm
- sysdep_headers += sys/io.h
- endif
- 
--ifeq ($(subdir),debug)
--gen-as-const-headers += signal-defines.sym
--endif
--
--ifeq ($(subdir),setjmp)
-+ifeq ($(subdir),csu)
- gen-as-const-headers += signal-defines.sym
- endif
- 
-diff --git a/sysdeps/unix/sysv/linux/sh/Makefile b/sysdeps/unix/sysv/linux/sh/Makefile
-index dd3b382ac1..8c4cb73824 100644
---- a/sysdeps/unix/sysv/linux/sh/Makefile
-+++ b/sysdeps/unix/sysv/linux/sh/Makefile
-@@ -6,7 +6,9 @@ ifeq ($(subdir),stdlib)
- gen-as-const-headers += ucontext_i.sym
- endif
- 
--ifeq ($(subdir),misc)
-+# <sigaltstack-offsets.h> is only used by ____longjmp_chk.S, which is
-+# built in the debug subdirectory.
-+ifeq ($(subdir),debug)
- gen-as-const-headers += sigaltstack-offsets.sym
- endif
- 
-diff --git a/sysdeps/unix/sysv/linux/x86_64/Makefile b/sysdeps/unix/sysv/linux/x86_64/Makefile
-index 6938382801..528fd951b2 100644
---- a/sysdeps/unix/sysv/linux/x86_64/Makefile
-+++ b/sysdeps/unix/sysv/linux/x86_64/Makefile
-@@ -10,7 +10,9 @@ ifeq ($(subdir),csu)
- gen-as-const-headers += ucontext_i.sym
- endif
- 
--ifeq ($(subdir),misc)
-+# <sigaltstack-offsets.h> is only used by ____longjmp_chk.S, which is
-+# built in the debug subdirectory.
-+ifeq ($(subdir),debug)
- gen-as-const-headers += sigaltstack-offsets.sym
- endif
- 
-diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
-index 232e388d32..b4434deb0c 100644
---- a/sysdeps/x86/Makefile
-+++ b/sysdeps/x86/Makefile
-@@ -1,5 +1,12 @@
- ifeq ($(subdir),csu)
--gen-as-const-headers += cpu-features-offsets.sym features-offsets.sym
-+# <jmp_buf-ssp.h> is used by the setjmp/longjmp implementations in the
-+# setjmp subdirectory and also by ____longjmp_chk.S in the debug
-+# subdirectory.
-+gen-as-const-headers += \
-+  cpu-features-offsets.sym \
-+  features-offsets.sym \
-+  jmp_buf-ssp.sym \
-+  # gen-as-const-headers
- endif
- 
- ifeq ($(subdir),elf)
-@@ -171,7 +178,6 @@ tests += \
- endif # $(subdir) == math
- 
- ifeq ($(subdir),setjmp)
--gen-as-const-headers += jmp_buf-ssp.sym
- sysdep_routines += __longjmp_cancel
- endif
- 
--- 
-2.43.0
-
-
-From f88dc9ea5403ed103aad1aa7ca613af058ba99f9 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 6 Aug 2026 14:07:56 -0300
-Subject: [PATCH 2/6] Makerules: Only install the ABI lib-names header from the
- top level (BZ 34439)
-
-The $(inst_includedir)/%.h install rules exist only where $(headers) is
-non-empty, so in a subdir without headers (e.g. csu) the prerequisite
-added on install-others-nosubdir has no rule.
-
-It only worked because .NOTPARALLEL made the top level install the header
-first, which the parallel subdir recursion no longer guarantees.
----
- Makerules | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makerules b/Makerules
-index cef30974f1..dfe66b7fa6 100644
---- a/Makerules
-+++ b/Makerules
-@@ -312,7 +312,12 @@ lib-names-h-abi = gnu/lib-names-$(default-abi).h
- lib-names-stmp-abi = gnu/lib-names-$(default-abi).stmp
- before-compile += $(common-objpfx)$(lib-names-h-abi)
- common-generated += gnu/lib-names.h
-+# The $(inst_includedir)/%.h install rules are defined only where $(headers)
-+# is non-empty, and with parallel subdir recursion a subdir without headers
-+# (e.g. csu) may run before the top level has installed the header.
-+ifndef subdir
- install-others-nosubdir: $(inst_includedir)/$(lib-names-h-abi)
-+endif
- $(common-objpfx)gnu/lib-names.h:
- 	$(make-target-directory)
- 	{ \
--- 
-2.43.0
-
-
-From abd98b39bc4a16a2c8afa43919b86d2a48de8155 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 6 Aug 2026 14:07:57 -0300
-Subject: [PATCH 3/6] Makefile: Only print the test summary in the second pass
- of 'make check'
-
-The build-only first pass of the two-pass 'make check' still runs the
-static checks (abi, conformtest, installed headers, etc.), and the
-top-level tests recipe merged and summarized their results.
-
-An unexpected FAIL there (e.g. check-abi) aborted 'check' before the
-second pass ran any built test, and even a clean run printed a misleading
-partial summary.
-
-Pass tests-summary=no in the first pass to skip the merge and summary;
-the .test-result files persist, so the second pass folds those results
-into the one complete summary at the end, restoring the single-pass
-reporting behavior.
----
- Makefile  |  7 +++++++
- Makerules | 11 +++++++++--
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a6aabca691..b9fac6f47c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -869,7 +869,11 @@ endif
- 	touch $(objpfx)testroot.pristine/install.stamp
- 
- tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
-+# The build-only first pass of the two-pass 'make check' (see Makerules)
-+# passes tests-summary=no: the merge and summary are left to the second
-+# pass, which folds in this pass's $(tests-special) results.
- tests: $(tests-special)
-+ifneq ($(tests-summary),no)
- 	$(..)scripts/merge-test-results.sh -s $(objpfx) "" \
- 	  $(sort $(tests-special-notdir:.out=)) \
- 	  > $(objpfx)subdir-tests.sum
-@@ -877,11 +881,14 @@ tests: $(tests-special)
- 	  $(sort $(subdirs) .) \
- 	  > $(objpfx)tests.sum
- 	$(call summarize-tests,tests.sum)
-+endif
- xtests:
-+ifneq ($(tests-summary),no)
- 	$(..)scripts/merge-test-results.sh -t $(objpfx) subdir-xtests.sum \
- 	  $(sort $(subdirs)) \
- 	  > $(objpfx)xtests.sum
- 	$(call summarize-tests,xtests.sum, for extra tests)
-+endif
- 
- # The realclean target is just like distclean for the parent, but we want
- # the subdirs to know the difference in case they care.
-diff --git a/Makerules b/Makerules
-index dfe66b7fa6..5f65f3ab9e 100644
---- a/Makerules
-+++ b/Makerules
-@@ -1211,6 +1211,13 @@ ALL_BUILD_CFLAGS = $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) -D_GNU_SOURCE \
- # therefore builds the test programs (run-built-tests=no, recursion fully
- # parallel) and then runs them (run-built-tests=yes).  'make tests' and a
- # subdirectory's own 'check' stay single-pass.
-+# The first pass still runs the static checks ($(tests-special): abi,
-+# conformtest, installed headers, ...), so tests-summary=no makes it skip
-+# the results merge and summary: an unexpected FAIL there would otherwise
-+# abort 'check' before the second pass runs any built test, and even a
-+# clean run would print a misleading partial summary.  The .test-result
-+# files persist, so the second pass folds those results into the one
-+# complete summary at the end.
- check-twopass :=
- ifndef subdir
- ifeq (yes,$(run-built-tests))
-@@ -1219,10 +1226,10 @@ endif
- endif
- ifeq (yes,$(check-twopass))
- check:
--	$(MAKE) run-built-tests=no  tests
-+	$(MAKE) run-built-tests=no  tests-summary=no tests
- 	$(MAKE) run-built-tests=yes tests
- xcheck:
--	$(MAKE) run-built-tests=no  xtests
-+	$(MAKE) run-built-tests=no  tests-summary=no xtests
- 	$(MAKE) run-built-tests=yes xtests
- else
- check: tests
--- 
-2.43.0
-
-
-From 8d04483c7dc5366cc1f2d7d444f1eee65ee45071 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 6 Aug 2026 14:07:58 -0300
-Subject: [PATCH 4/6] Makerules: Make the .dt to .d conversion safe against
- concurrent sub-makes
-
-The %.d: %.dt rule seds its input into a fixed temporary name, renames
-it into place and removes the input.  Two makes converting the same
-file trip over each other:
-
-  mv: cannot stat '.../test-double-libmvec-sincos-avx512f.o.T': No such file or directory
-  sed: can't read .../test-float-libmvec-acosf-avx512f.o.dt: No such file or directory
-
-That happens because the elf rtld-Rules recursion runs a sub-make over
-every $(rtld-subdirs) directory, which converts that directory's .dt
-files, and the parallel subdirectory recursion (commit 7cac99621e96)
-runs it concurrently with those subdirectories' own sub-makes.
-
-Add the PID of the shell to the temporary name and claim the input with
-a rename: only the run that wins converts and installs the target.
----
- Makerules | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/Makerules b/Makerules
-index 5f65f3ab9e..be51154bae 100644
---- a/Makerules
-+++ b/Makerules
-@@ -758,10 +758,20 @@ all-dt-files := $(foreach o,$(object-suffixes-for-libc),$(+depfiles:.d=$o.dt))
- 	     $(wildcard $(all-dt-files:.dt=.d))
- 
- # This is a funny rule in that it removes its input file.
-+#
-+# More than one make can convert the .dt files of a single object
-+# directory: the elf rtld-Rules recursion runs a sub-make over every
-+# $(rtld-subdirs) directory, concurrently with that directory's own
-+# sub-make under the parallel subdir recursion.  Add the PID of the
-+# shell to the temporary name and claim the input with a rename: only
-+# the run that wins converts and installs the target.
- %.d: %.dt
--	@sed $(sed-remove-objpfx) $< > $(@:.d=.T) && \
--	 mv -f $(@:.d=.T) $@ && \
--	 rm -f $<
-+	@dt=$(@:.d=.T)$$$$; \
-+	 if mv -f $< $$dt 2>/dev/null; then \
-+	   sed $(sed-remove-objpfx) $$dt > $$dt.new && \
-+	   mv -f $$dt.new $@ && \
-+	   rm -f $$dt; \
-+	 fi
- 
- # Avoid the .h.d files for any .sym files whose .h files don't exist yet.
- # They will be generated when they're needed, and trying too early won't work.
-@@ -1433,7 +1443,7 @@ endef
- # Also remove the dependencies and generated source files.
- common-clean: common-mostlyclean
- 	-rm -f $(addprefix $(objpfx),$(generated))
--	-rm -f $(objpfx)*.d $(objpfx)*.dt
-+	-rm -f $(objpfx)*.d $(objpfx)*.dt $(objpfx)*.T[0-9]*
- 	-rm -fr $(addprefix $(objpfx),$(generated-dirs))
- 	-rm -f $(addprefix $(common-objpfx),$(common-generated))
- 	-rm -f $(gen-as-const-headers:%.sym=$(common-objpfx)%.h)
--- 
-2.43.0
-
-
-From fc18d62479fc57fdcf1d1bf14685ec4be4041bd0 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 6 Aug 2026 14:07:59 -0300
-Subject: [PATCH 5/6] Makefile: Order the top-level stamp files before the
- subdirectory fan-out
-
-The archive rules in Makerules list every stamp file as a prerequisite,
-including the top level's own, and the elf sub-make evaluates them to
-build libc_pic.a for the librtld.map link.  A sub-make can only create
-the stamp files of its own directory, so when the top-level ones do not
-exist yet it fails with:
-
-  make[2]: *** No rule to make target '.../stamp.os', needed by
-  '.../libc_pic.a'.  Stop.
-
-The serial recursion created them before the subdirectories through the
-prerequisite order of subdir_lib; the parallel recursion (commit
-7cac99621e96) does not.  Add them as prerequisites of the object-building
-per-subdirectory targets.
----
- Makefile | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index b9fac6f47c..d559c42873 100644
---- a/Makefile
-+++ b/Makefile
-@@ -575,6 +575,14 @@ $(foreach t,$(+elf_last_subdir_targets),$(eval \
-   elf/$(t): $(addsuffix /$(t),$(filter-out elf,$(subdirs)))))
- endif
- 
-+# The archive rules in Makerules list every stamp file as a
-+# prerequisite of libc_pic.a, which the elf sub-make evaluates for the
-+# librtld.map link, but a sub-make can only create its own directory's
-+# stamps.  Create the top-level ones before the fan-out.
-+$(foreach t,$(+elf_last_subdir_targets),$(eval \
-+  $(addsuffix /$(t),$(subdirs)): \
-+    $(foreach o,$(object-suffixes-for-libc),$(common-objpfx)stamp$(o))))
-+
- # Pass barriers: a subdirectory 'others' build links programs against
- # the libraries, so the 'lib' pass (including the top-level libc.so
- # link) must have completed.
--- 
-2.43.0
-
-
-From a310022b8d6d40f38100800edacce08afd6e309a Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Thu, 6 Aug 2026 14:08:00 -0300
-Subject: [PATCH 6/6] arm: Order the rtld link after libgcc-stubs.a
-
-The librtld.map and librtld.os link recipes use $(gnulib), which on arm
-contains libgcc-stubs.a through gnulib-arch.  But the archive is only a
-prerequisite of lib-noranlib so the rtld link can run before the archive
-exists:
-
-  ld.bfd: cannot find .../elf/libgcc-stubs.a: No such file or directory
-
-The race seems to predates the parallel subdirectory recursion, which
-only made it observable.
-
-Add the order-only dependency in sysdeps/arm/Makefile rather than in
-elf/Makefile.  Theprerequisite lists expand when the rule is parsed,
-and gnulib-arch is only defined once Makerules includes the sysdeps
-makefiles.
-
-Verified with a build for arm-linux-gnueabihf.
----
- sysdeps/arm/Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/sysdeps/arm/Makefile b/sysdeps/arm/Makefile
-index 0bb1b6e05b..9042315492 100644
---- a/sysdeps/arm/Makefile
-+++ b/sysdeps/arm/Makefile
-@@ -10,6 +10,11 @@ shared-only-routines += aeabi_unwind_cpp_pr1
- $(objpfx)libgcc-stubs.a: $(objpfx)aeabi_unwind_cpp_pr1.os
- 	$(build-extra-lib)
- 
-+# The rtld link recipes in elf/Makefile use $(gnulib), which here
-+# includes libgcc-stubs.a, but they cannot name it as a prerequisite:
-+# gnulib-arch is only defined once this file is included from Makerules.
-+$(objpfx)librtld.map $(objpfx)librtld.os: | $(objpfx)libgcc-stubs.a
-+
- lib-noranlib: $(objpfx)libgcc-stubs.a
- 
- ifeq ($(build-shared),yes)
--- 
-2.43.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index 5aa67b027d..b4a5fbf8c3 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -57,7 +57,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
-           file://dependencies.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.49.0


