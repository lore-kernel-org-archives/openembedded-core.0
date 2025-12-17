Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD14D65526
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:44:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10689.1765964645268131137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sOFcJ8LP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH7e2mc2710796
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lWXUhW4KpOKVg0M8RWdq
	AEybz4/8KiRpfDGIaZxfxIs=; b=sOFcJ8LPZxMDhEiSZg2auz4stqyL6qHaCSU0
	vlY0aB9btxsKFxSPw/Bc803W935WMBSvrg+qr4kpVmV69v23QJOtmkRYLRqaZlpM
	lTK0KLFByumblO1cFPtYQ8dxNq/qOoit1Sk6kK805LnrYa85izurbITSI6lfmUHO
	XPwFmQmntulxfgs1Knp9x9uh3Kcy95LRT0uTRFpBzqjIlPCmrSxgDTXzep8Ug3Sb
	yvUZMwjdkFHl1LrZHs+2IEsZe8z15Ou2UbAoAnUye8t0Z+qWT+TIH0VLNTM5KUq+
	QqHqhYBwHAjPZvAnD5ZtDubo2+pmkJrMraHEebxFLL/W3OHb/w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brcrg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:44:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgalhj0LQMobLUb3vcTMgQ0QAn1xnkTt3u7jeaxT1HvfCO3h6jlwMoq1HvYuDH+SqwTgGsShh0zBTxEvBL15vYXSEAU+pcWL4gM+LQV0Qj+M17R+2DxBQRoHF9Kd1DryTl6+5cILl2MCKITByU5BiqutScJJW+K1aeIKKQlyNci2nDQOGZ2n2PFUpJFi2kcowYgVIMbRPW25mf6+25VjjrZcjFMd/RgL1meSphOzp6E0qIQXQF0qLAUTQe7V2V3Sq0c1tg5jUDo6oe3d6noz45DaB0pXER5+sJze7DljfxY7PilfNC/s7Npx+G4GcYt/JqBYvEC8FLyIjEJBNMWMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWXUhW4KpOKVg0M8RWdqAEybz4/8KiRpfDGIaZxfxIs=;
 b=N3QjNl/Wt0AFTIn2pJkyNg0Pwc1HuIblFNPliO0/T2M3MkXVhesvrHSWj16p9BQpq+JStatMTeRTT+QniNcGffp3XqxHvg6+aSLtops7joMztm3ZAwS2RBtvpi/UY1/jaIHhh+TWn5ozb5cqwLwCRlObIw3HHkFZfIR0viYkorunJgNDMXRuhQYp+nPrby3IHBpqWL+j4BcppptULVaiucPCCbU9o34gjDxG8C76mywPsrqE3z3GFLRTOkT3Vfi3paKjyqKb1ywjn+j/WzViqOYr7+oXNkMKqJom5LJffg6wbipZHE0BTjaQZ2BiJCKdwjgLyxu+fkE/xs90/Wqzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:44:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:44:02 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] insane.bbclass: avaid unnecessary rerun of do_patch
Date: Wed, 17 Dec 2025 17:43:43 +0800
Message-Id: <20251217094343.3149852-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a38861-f50d-4156-2ae3-08de3d50cf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZImzUC0Cm/a5g9T3RY0XNonTJ7GeeSKPp1CCco5vL8a4QUPTv8dS8XA6cQxx?=
 =?us-ascii?Q?FOfr5OOY0k0QFnuRFghrD0RnnoT3JuuyxBe0ZEsQlsZV6qilVaRUt824iY2z?=
 =?us-ascii?Q?/bMrOMc0eH+zAm5l1TdCyDyiunaRjzQeQRwwKbuzVOqBNUQneerhtHldbiE+?=
 =?us-ascii?Q?eb9lw9Fhch4Q5TXWcLF2SY1rbkPtRZcLn32XAr6YJta401R3l3eukAOkDRrX?=
 =?us-ascii?Q?zIvct7j1Mgq8NKeXRsQtHbZ839QrKLrJNxusd4A0jbwENELHjN6v3nhFU2Ht?=
 =?us-ascii?Q?iRRVUwB0yOZrAvyHEN2R0SPNDzrBfJMnJ4RawzlF95Nc7NlDbDAiKDvaX5XI?=
 =?us-ascii?Q?/EkZwvsf5VyTdLnOf+chmzE2IgbUYkCuan1+sf9T0NVvz224V9Xsh1oHNnNE?=
 =?us-ascii?Q?/OoO/DTIFqnZJh52+zZajt28Xw9jOfhI/kwig4uSstnGCWh8p8FmrLLF3f/m?=
 =?us-ascii?Q?F9PIF3Ldt+b5nRGMLu+9i16K6YWvfHBtYnxO9/cafffG6x3m9aIQgi2PH76X?=
 =?us-ascii?Q?NSpevEAPzOrThChKpF1JwaR0RoGrOyViq57sVTBxBeiwi5lbCNEHjhY3MNIr?=
 =?us-ascii?Q?/7orOU8b9DJ7zGauqDBa+8w65GxdxtsleTD3WODLjd9eemzMgcig7T1hfToa?=
 =?us-ascii?Q?SiRnF4Z0lBPMLnHx8nvKI3Xn/w81FHKpmN0yuny4FkIQVxrc4E4wsHcckzF6?=
 =?us-ascii?Q?KS5CrE2lQ/z2nBUJ7h6prZNA0Jj1kPLFo/40V7QE4hSfbtkSUrO2MXtufley?=
 =?us-ascii?Q?Vm8nyIAikVPGn6Yx+MICRywDociRZM/cacS5Bjvh86cOwPibhCqopVbCbsZg?=
 =?us-ascii?Q?byA7BEgRoZZTc3oRJCBWAmVdAXhb3Y1Bzr487zhGLPEVs8htx/aPCa/JGH5f?=
 =?us-ascii?Q?6BGgZ8UDJFJ/9ATNJeYJV5JEkH8OXfMCyYbgRDJF0dO4+nr4HCs+EkBtsvw6?=
 =?us-ascii?Q?keNdFw1NAOkKzmKLGwnU6yXOkhBGdlFdwaA1E6xTAWXErmLk6FOTexvzb1C5?=
 =?us-ascii?Q?Uwxs9ceUpXgTh5K1Xrqmn3H5BfeIkmPfs3MfR+e5ozEQ1FhA7McP1DVWC2Tt?=
 =?us-ascii?Q?q5JTGDR7PGfZ5hHpVkliFDNvtL/6In+Qkx9ATGvTbR41GeOmETUDF+Y3o7mj?=
 =?us-ascii?Q?8kpcTMqahxdIxp4wh7zWLLRGkYMztpLgdahejXJXYi583rzgfXamlj1UBq2t?=
 =?us-ascii?Q?dz4g2p21JAi6Xbg5b5QV9/yWf6MlRzHmTwaLdUdIarlAABoeIHAU6jAh9yKB?=
 =?us-ascii?Q?lnFb2JbbbghFpRJcjFtGw0X8EQy7wMpazHjB840kF+D2zrx89p6icAmenlZE?=
 =?us-ascii?Q?saI4BUI6KBzIfwfniP1HEN69WdMOlwx0zIb7KZaBA7YcFWy2AN9ZQbgz8R1H?=
 =?us-ascii?Q?94/hE/r7B+IrU10tKvvf4u9sDMpKLjcyvuQVW8WtXpvrsxTU0ndTcrzUR+em?=
 =?us-ascii?Q?RodLf2H6mOJJnSld/rbt69XKfbOhSRMUHEkMui36uE2ya0TxYDdDybAIQIxl?=
 =?us-ascii?Q?49B6IoeDBpewJDaWJXnYQ4cNfiOD35UHpatK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KjVQ4XHF/XDw7BdlHIxNfRzgVp+PSktOAsw49Q/wsA1oHv7oKD/Ya4idqAwT?=
 =?us-ascii?Q?HeLudROneLsw3xf25nM4YhDz8dyFKQDJbh+CwDwmqnCr+s1GU/Taj5vCM8ec?=
 =?us-ascii?Q?5PtCOx/3kj2jaHprCDmbRYZuE2tPMb5H/qLKRBcYyQ8+0+YxzzCJolS9WKKR?=
 =?us-ascii?Q?lPPOSuTba6wJs/v8UHlv3GcOAic6mCaDhDJaAo7Q4mvXkwxcsxK9AM0O5NLF?=
 =?us-ascii?Q?t5AWa6oZ6c9gSx+T+/M5Iq2+xf/qJAiSKk4gWrmkT10Ny/9+/geo1QSOxCJx?=
 =?us-ascii?Q?yD2vZ1poK7x9fh6TLOdtCVxhkLekxHz22/Cu8A6v9IloaKKFaU1UvnWQ6AIz?=
 =?us-ascii?Q?rECaxd6cQEXs6eW3H9Lqpmm6eAzXb7VYoqF6ki851Bu+AVv4e9UdjeEA/Yh4?=
 =?us-ascii?Q?+dv0Yws0pJInEiQpQhh7e9Z92gmyYAAacVfN6lvxDo/6BOXPApZR9p2A8rFQ?=
 =?us-ascii?Q?XEey2goZtbK/STbha53VCyb2Z9DFeNNBXp23fKaivlZYzCuy1vfAiyFAEXyf?=
 =?us-ascii?Q?PbSLAF0ojIlNXdPa90gwNXU6d/rD2yINqdDk595HWvV4bxGu45XOptdzRHK2?=
 =?us-ascii?Q?c7I5xRW2PrjOdQCeLdmf7UNn8/P/MGNCM4Wo/Fpn3obRegPQYTAj9qz5u13w?=
 =?us-ascii?Q?te6oHAresTgRJWIOqb1ODs2fPbJKmod60KUqZp9chEgG2pj0kaWo49THCqIM?=
 =?us-ascii?Q?m8BMSvBHGBkMmxeWdOsWEhjdyxVWNr3JkPf3V3Gp0dDUcTlpXT1tFrXRxTam?=
 =?us-ascii?Q?oFDk7+EU+QUtrwIPi2l2+NEZFg02gqBnyONDIJvyNPaErv7lo4h+oTL0VRPg?=
 =?us-ascii?Q?ihMEodBKExXnu5iGL/VGxKBjxVueqNTffYeU3e5OMfZW/rojNr+vRIdzetZU?=
 =?us-ascii?Q?urbmdDdjfrrE2BLDfAWGYCsjX6fJ/ZVUGyTrDIW7k9/HHHJ2W5YmBSnPDj9+?=
 =?us-ascii?Q?7vb5CZMgQrK4u0KTQg2DkTMVuwZbNaYAohUGm+/7Y8HJ0DUcsRzh2ArDfLWz?=
 =?us-ascii?Q?7eRkUMeH2bVr7U7rbqAOmFSQXlLmRBPvz98rMIE2iCDBhJRtIgs9GI1K+zmR?=
 =?us-ascii?Q?VW1DHelylzjihLf/S2gLN401ZtRf6dulzJO6Gcx0Wa2bTiq5pDJDlYXH4aFX?=
 =?us-ascii?Q?A3YA5dDzV98Pff/Chba2k8Oz2RH4032kNJRpjbW4LtHMH2ddykc2kxDecVTs?=
 =?us-ascii?Q?vd7YsPmAVD80Rc9qTQJnSPfzZzQ11nDcmUiAsRtL7XdTiDaDfJpCq5675Aej?=
 =?us-ascii?Q?hCuS045a7fUg61gwQjzxGJcskOJFNxPnnNQYT0pno8pZ/Dx/LmM9/1UMca2T?=
 =?us-ascii?Q?RRdJJUQpduHFuKTEMc3LzjqgoZ9smT5emcChSESONiqBKhfjLcBC2PlhpsFM?=
 =?us-ascii?Q?STeiVipS+AO4UInvPd1dvKZiFNKxHAXIt4po0gyjkHiRI+CMQhF4nqYk/678?=
 =?us-ascii?Q?ZO64avSTwj9RFSS87xXdDEQCsbnAiO8MCBB8SxiKpmRNusS3QcCz3ZHdsSIk?=
 =?us-ascii?Q?xA8CO2q/VrW4cuXe+vAhXlja6BavLjUDyBhm2urN+mGOoZTGJcGAPfXiMQwZ?=
 =?us-ascii?Q?6OkODI0rTFp7QNJ7XhiDdcO4DWEe2D0omAwj4um3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a38861-f50d-4156-2ae3-08de3d50cf53
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:44:02.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwy1HwQRLRZZvPngnb8MX2XOO3Utnef/LCTKG5OOoPl5bcfRMMFIi9nGdEqwNvvI+y+zwsrs1xnYYGgOjtAaTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NyBTYWx0ZWRfX5iNQhTakzPZK
 7pf8kLFNuxTaRy/X3QADA7D68L21gfqPLlp7i5Bt2iTEqX79SqZi8Qu6U5RNdqV0r9N5YiZHc18
 QRWkET9LHKPR/iZ3FTfQi+iChLfEsQjU+gccipEcYGuBiZ6Sb68X5ERbhkzP+74Or2c7viHvEoY
 ex+5rqspfCq6c6j5MUGIQ+YEyIgLNYGe4DSMrXiuMUM81rOy+F5sJNaO4t1MJtMGDt6j/DegwQd
 ZAw5FU1RpZ4X8CB84Jp10JF6+sN29CYNrvuybzfV9SqR9QNP0BM9Mwootuxe5Ri/ViLbnkfs2xk
 iPuIAXqcf7JH2Lk3tqCKh/Zv5CSnhnyaz0z7NtrZjSMvDDyFa+i0RhN8wWoviWwWhdtF8nCPLQR
 +Xv6VF902Wz9NDTHGOL9g4ysMHl6Yw==
X-Proofpoint-ORIG-GUID: wbpOSC6b-OflQLrjl9TP5Awd1Rf2ttpd
X-Proofpoint-GUID: wbpOSC6b-OflQLrjl9TP5Awd1Rf2ttpd
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69427b64 cx=c_pps
 a=h0MEFlbiS7SWjyAGc8mu+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bsVlAXb_Xh1ewsIMwOsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228017

From: Chen Qi <Qi.Chen@windriver.com>

When toggling ptest for DISTRO_FEATURES, the do_patch function
gets rerun.

The dependency chain is:
do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}

Such rerun is not necessary. And it's kind of annoying because everything
gets rebuilt, including cross toolchain and recipes not using ptest.

The ERROR_QA and WARN_QA should be enough to trigger the re-run
if unimplemented-ptest is added to one of them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e..3185209b7f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1345,6 +1345,7 @@ python do_qa_patch() {
 
     oe.qa.exit_if_errors(d)
 }
+do_qa_patch[vardepsexclude] = "DISTRO_FEATURES"
 
 python do_qa_configure() {
     import subprocess
-- 
2.34.1


