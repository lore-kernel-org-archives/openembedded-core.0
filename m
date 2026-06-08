Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFB6CD8C8E
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 08:12:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49562.1780906367437539639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 01:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=agyT8ZD9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06190e3088=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586U1fD3490519
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jun 2026 08:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4ziURzzHG
	TDBrgCX8S3TNFLDldCMFiCWS3zjXt7FIuE=; b=agyT8ZD90zAEsd7agvnyNaPaw
	C9oWBA3D2BISOVImoE3BLDVE25QCPlekdPl1IRnpc3AWVPnzp5W9v1pVQGuP+Al0
	bY+xlwVX4R99EQsU4IabUwQBsMyJzHojZ06o1UQIMJEppNqN2bajrAfK8UiN4F/V
	ha55+0lkJf7lmy5ROpnQcrLXVLPCrXyy7LRTVW5sV6vRm5rGZo03MZGBZR5wAyNu
	lBpxoZw8fAMVllkjb/IOdtNabWw8pM+ZHCfRqmk3xUGeVWLo+Uj7RIKVb6MZHTfj
	3LamApIu+BsNneZSN5HmcXruBlO2PZDiEt4Ns7Rq0Dfh5XtndRnG6CYpK57Fg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7ack6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 08:12:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeS7nGRXntwDgpRkMlt0AWUf3uRYkHnHvgwnQi4Go3MtiRyLQAAWfMOpHXo0klulgBOPF1Ep0y6pMumBIubotOgcFrTfYUf0r7NwdylScT4qi22quYr4daXTkydkMHp4gJIwoLPgRIef0fr3OxV4M40mPogv+9xWW/CtiHzyVQEXgiTiBxZQ/aeWJXxwpIzcIiKy8tmlT/5UMCkITqWEDkGqSqqq5qqi6FnBvM7l9KJiTlrV8xS+vYInC+KgZWFciBkOcofa1m1yU4rGXIhRx2HT8sxsGFcAG7lPJE/spk4p10YqzLHrBTkQEcar7dP+t3huNko41BWMDNam0FKufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ziURzzHGTDBrgCX8S3TNFLDldCMFiCWS3zjXt7FIuE=;
 b=hXuZpV4AIrmw16b26NpFQBw03Al65hZHCeilqh27qSBrVqBkUkPXyivn2PUkL8GTRovKh0acuEndS8aqovr9zOJK71r3ZhtnJGnVQkovnA4Z3Iy3nFXkY6sWuH6iO6fc84aApKT2TVYLtAE0nNElhWOz/RYso0LNu2ZlECqlGR2zu8ZcH/JFf00EbpAYAJRVKxIN28ezVRbJW6oz3I9xSZFL26Ep6FTY6kD1KMaAk/V3DboJT+iBX/erqu8+9+eeZrjRC6Q/olNgG5/tYQga87aZSv90QIYd0s3tRtZyrWmTb1ffq+lvhemZLimVEm+d3kvL5zGtO/Hd4hM0jQXXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:12:44 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:12:43 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiaozhan.li.cn@windriver.com
Subject: [PATCH] texinfo: add missing perl module runtime dependencies
Date: Mon,  8 Jun 2026 16:12:30 +0800
Message-ID: <20260608081230.1144463-1-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0145.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::13) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|CY8PR11MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b88e3ab-05d4-4230-d5fc-08dec535b75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|6133799003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5QaLCfTb8spUld5wwiU5jzkqa4nflPx7pOUQsj6pwpu6zxjFA9g6y7aAGnYoM3lCYryN+1EKo4adXb1m6j+GptRXiMQckO+W/m12CapHGp9FbfR6R1HjyjMDLzsIuYOqkXffp5lcc2CNP63u/iQXp9ONZerADUOAP6q66c0YLydTawfF6oXSiXk8xFxvH6EpFvufnWkvF1MZK0ekMrE8x0xcD9wJnZA7YZMBVBMKAkueytV8MhOiW8JciDMXhRP29WL+HA6Z1YH+1LddTwzopaS9SpS87cGx7RDahAXvfbDosty31J/Yc6vthxRczBe17Bqo7v57dgZDPR4H5zJbIbn2NPqgeg8d6txXG+uPLyv9AmfI5ObaIIbzztY2nvrO6/Z/GejG0q1aiYTKB210DuIAWJTHwIAwHusGgmOYQ9fGyfEyvW9q5uWsGcQZokdqBsMMeM6DqdxWX4jVKYF3NDExWl3wcm9SN1+b7gDDkRPCT5cEjE4TQ9ZEV7RvW1yUeJAtVSjL+2DjKJYzzGka1If2VkH6tOXl7TIGP0IOz2TfVkxE9aPwAaJ8ZLZdlzMPMd/qq/k8ogVeKYj7AkxAdynNsFxsVUuuZJ7wrKW6qjAlkbFZ8OXraFAGUiqVuzNY+QJ1P538PROWA/LFqs9OHuK4qOp4NpC1oHYhjj6Ur3LjcvlnidXzbkz11uY22KAiiA60Pa9UGiwe3lmGrSqksXUbH6huIrlizKFMx5PKF4cbNi2gWtLtlXviMhJOrMse
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9sAzEWDP/TRkSXmc463RuAOvnUzHlabXTz39v/QygQpR1ItG00fVmViDTaBc?=
 =?us-ascii?Q?VI3Zi+bRkpqthKM1U6R10U/sPLp4aCDM8uHchj/pjGTksIYbOwABeMQX2env?=
 =?us-ascii?Q?XvX4LCUIlEZlcVTrHv6cTDWmNgAyzfumZ0dqoSr99DbyDFAgYobvmEP/BLum?=
 =?us-ascii?Q?oarc8iv5WM1owk8bd5QXPD4XoskPzRyrgyV81iwmdPkJnhmfdmEPK8iQabrC?=
 =?us-ascii?Q?z/9NsoPOamOvmNi4lddv97ZXBUkMJtFjI0NctpOdAundoBqN1jtCKJIrw3SS?=
 =?us-ascii?Q?KmYAAwm6zdTPhl2b7+RPMfU6WgNUJfMPQLPugCbrpI3NOWE/0LlqGHEbDZ6H?=
 =?us-ascii?Q?cEADpYpLv9laeYoq74C4EGrJCAYFqC4F3iM3H9ssYQVxi6ycAVTkPK2uZRcb?=
 =?us-ascii?Q?iVtt+mVg2DewciBl5VG8SnzN/9Ly3UfZ4wu32GPaQwv5/VbVpeDXC8D6mRVM?=
 =?us-ascii?Q?FB7DCZdcx2XICW1tvtBmYwLxev/0enoE7MV+mQ6lNDVlc/DsEGse9EURENFw?=
 =?us-ascii?Q?Vixm471v52Tvkf3BwYK5hsoCVpomozhO8foFLkRZZ6jFk7ndoKSSTUBrhWwX?=
 =?us-ascii?Q?E9Fl8onYcPb1oWsJ7qrc4o60pSiyIuE8RQXMxsqQ6AiS5hx8dc2LS6xwlrtQ?=
 =?us-ascii?Q?PtMjAWcP5LlD/UzhZkHDm85kMPZzZG7IjIBPa/Xg0V5IAUemi4DFRgMCwL9U?=
 =?us-ascii?Q?XvxQVsOUuL8fwfBLFgBOE38lf564HZzQYxCD/zXzC6FqhC50I1j8DWEAaGpO?=
 =?us-ascii?Q?hu5PYf3ostlPnMIRMv0FtUu4hHR4jPpIHR2qRSE7RNo8RwgjFxqhdhjVAVHt?=
 =?us-ascii?Q?OGM6cTjb1nCyDgUWC1/Tj/Ao4j8nEMiIAHzE6ucUOxnPrGE9TE81JddH+vft?=
 =?us-ascii?Q?RcLPb+/6S5G3PuPke7+yyi6cx+HYJosLUgaXN2agFrqDO8oc14l6lxejJXP2?=
 =?us-ascii?Q?BrzlViCiltNcvVUGA9Ir5MMUsQRoCPA7s6eXBaEHzoXvz8pIUMf07UuMeCuL?=
 =?us-ascii?Q?MPtG6urmaVHqTwNyTt6K5l870TG9FoChtHmE0Qs78xfCJVg1qUzHBR9/cD6M?=
 =?us-ascii?Q?kex2b6u76ZCqSDjUkxiDB6YdiCIPyphYPdxV6sXXH1VQ5WhySo9ae9ZMxOpt?=
 =?us-ascii?Q?giev8QnVJx70/r9aEcPIC2Nenza4gs4KloiNZiZEntkfwZ8AOAauZyFU8FOk?=
 =?us-ascii?Q?MPJzUmngOcwK8d7vuYokYt9XQUQix/T5HV0M4Ff0NTFSxj7uA54xwWchB9Ev?=
 =?us-ascii?Q?kXfIHZZ8DCCwilVNme8CafxN4K6SndQQg412PSaaKjwB4slBZwsxQOVS68LB?=
 =?us-ascii?Q?PYU5CmJO9iQ0D+IHnfIvzgCQnpnqbuCI6EL+g1vHWohmM4NhZsIKaJaF3tva?=
 =?us-ascii?Q?XfsriYBq3wrPDZTTC/Aog1ezuMc6eIAnTWVc391+8NETtV7pB97eSP2FTqWa?=
 =?us-ascii?Q?Y/fdgx00Sei+qfadIowGkYg2P9ht/EPkNgb2nrv6YICM/nQXOfiVu7crYXp8?=
 =?us-ascii?Q?Q2t0pMQObU4AInNzqaks/K9uMvUBh05kGGupVTIfoyeZpzgwvBE0aGgWphD6?=
 =?us-ascii?Q?yJFf3XQDzS/YYq50HerxcMntmAVrdOKvf6OhB977q5PaUbY02fhLvDLc9Zcy?=
 =?us-ascii?Q?2TmwTcpBddPxoW2K+7kBo1GTfkEeeL2O1KjULCBjMcV7jeNbU7j3CbbpJ50d?=
 =?us-ascii?Q?M8uCbwp3lMALWh3W4aHhx2heJ6F5U+fDGXTGK/o1gBlqEqJ9SDDZaqM6bpqn?=
 =?us-ascii?Q?lUI1NEQYSoVc7RIIYjgf0uATEaTbu9g=3D?=
X-Exchange-RoutingPolicyChecked: 
	iYQX6d4AeuA+BukYtahr4C9d8b6ziDX5FHe1BNqcEd/Erfyd+KCnET9pX+dNYL8Vn3JMsD5Sq+npRfjtDn3THogNTeFTrR7uDoZCGIHMtZDDz0S1oO69iZ6syY6qlm+MkBTIpByTfFfg7ROhQqhdVAHNumXsNJ+GDGfZnm+hp6zf/iy0NM+1C2w7bpUOU9zc9DPvHgqmSteH7ND7Xfu4gVveIzGh+Y/cu0RuYhL4p40Bu2IggiWCAtFFTe89hTsjltR3YTuxnaEK/kQP/MQN5CoLhNfXAFBQb3NWuEvEeY9SxuwPxwYJJe/4CKIIri5AERbZDcCxzntAzYfuR6ZbcA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b88e3ab-05d4-4230-d5fc-08dec535b75f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:12:43.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOKeLTAMaUXU+Qw08NI3TieZsgn5CdhKtEvYukqC/arpfRvV7boKM3wjhLLAPHvseg9m+8a3i9CHFUEYsPNwV89HA+qCacuPIIa7VOieBNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NSBTYWx0ZWRfX90HEbdMAndjH
 Fe+EYwSh/KNAc/ohGLCyl6Ga+GguSToiN4VuEZgpIaB8nrg1GqIX/ByUkMkGwg85JpT+6/3jlQj
 ZQC2j2iOPyDNZNEXFuyy9likzwkEtcfODdE7MQR0wrcyTZ3P4u5bnOC9CBb7k0VgMDr4qhzxTtV
 0/maquIQ+XMwBOuIdoVGadm3KjqMt+JMQwSL+LVMNvXQLM3WNjpeKhy0YDLmiPbYO9lYhfPeUgH
 ehohnVhaQPaZQwP3bgArv8IVtmv+oaahoOvuURLwYDokqxX/WvMofRHsj0Zuu98iSUJf3XoVv1H
 HQd/mCJeg6Q7I4AsWIH3VpJsAhnH8ZfpjIBYw5ibmWA/2ajbZNZA3Ca+2NfjTxniONrqJlCbEYw
 LBEilALT+MKyi+RwbbOnaBm5v6YwhZZ3YFVhiEkLvmEiZB8JxYCrXmxA0iWOgMGIrCguFH2LDYl
 iEa10TAOA2MIlPilFsg==
X-Proofpoint-GUID: o5JH1g3zfofBHgLXJnkK7QxxDDHEDh_h
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a26797e cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=8i6-b8GgAAAA:8 a=ImN4BQKbXv9m-Rmv9GkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAGLwFu5sp1jj7jejlXE:22
X-Proofpoint-ORIG-GUID: o5JH1g3zfofBHgLXJnkK7QxxDDHEDh_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 08:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238229

Some makeinfo commands like makeinfo --version, makeinfo --html fail on target
with errors like:Can't locate xxx.pm in @INC
This is because texinfo's texi2any requires several core Perl modules
that are split into separate packages in OE. Add the missing modules
to RDEPENDS so they are pulled into the image automatically.

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_7.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.3.bb b/meta/recipes-extended/texinfo/texinfo_7.3.bb
index fae4e510b4..5d942464d4 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.3.bb
@@ -77,6 +77,10 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
 
 FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo ${datadir}/texi2any"
 RDEPENDS:${PN} = "perl"
+RDEPENDS:${PN} += "perl-module-if perl-module-utf8 perl-module-encode perl-module-encode-encoding perl-module-locale perl-module-integer \
+                   perl-module-file-spec perl-module-cwd perl-module-file-basename perl-module-getopt-long perl-module-posix perl-module-data-dumper \
+                   perl-module-storable perl-module-feature perl-module-unicode-normalize perl-module-charnames perl-module-unicore perl-module-file-copy \
+                   perl-module-file-glob"
 FILES:${PN}-doc = "${infodir}/texi* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
-- 
2.43.0


