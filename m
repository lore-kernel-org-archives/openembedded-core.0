Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA44C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 03:52:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33830.1784951519041113272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 20:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nnsTaaKA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=166643924b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P3j2MI3491337
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CutJ9vtcJkpj9ofISBfS8w/EyGR12J4lz4/FaKJ3ouw=; b=nnsTaaKAbEKK
	8QHx+9I6qcg5Ofkyhq2OBdXay8fDAAx14mTfgnW/XETfQ6s5c4wh8RU35O/xOxcH
	el5c4+n8gqf+zlJT9QMcZ+3fBXEq+Qdw7k69ux0IRps8KylyMXKMXDs90LS+9bTK
	8TsMyOx3K2WBh6kKJD1zz91fLE4u9htAsL+/ITdxmSCoyf7Cj4eA39oFtZb6TL5P
	e0v2mutRdRY0qsFpt2AlOm+m431JxyG1P8r4JgVJwqbANcviuHiyE2AfzGwsCY78
	TDcqX+plicHxRQzhNF/DxZ7+CKiE/4ipCO3WP1ushlsUBJSsdCWbnNSjr27zACs2
	HoWrk1LRQQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmjnfr3k4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:51:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d16zkELmjP2rfpOYNM+20mhRQdILQbLSxJxPivERz/Zsn4us/rRrXwS7U2WnbT/iUGFBEjqmrFuGdMl319Mwk1A2Aj76qOPdyMq5OTxAv/ZFMNNxeG3OLEN7GSI7oYtEnmvw5BJwZRSo7ADssobE3f888FSOnCbNds8VlMP0EOMqYkkMbO3OU66Xbfa87sOGoBqwhTPBQNoTDMwQweCVouUllJuHdy6LvuaDC9973yI1S2b1BsdYlAx4y3mDcwbq+GacRF0nBfvO3ZtnPz8gddeCgp5pC+kQQFUuC+m6fRER1fmM/TAJmrXZe1XW8SH9bxucE942qn5+ZoC6kJuhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CutJ9vtcJkpj9ofISBfS8w/EyGR12J4lz4/FaKJ3ouw=;
 b=vNnJRLgSyXHkbtouduAQDAVns7F2mk2YCSFtTmol/0k6VHex6I3F3w70Q3gDViZFgGoBFPnakdjCFPljXUVd4SoXml7ErG/x2eipKaz7z6PuXI/X/m4vP4oXPE8tAPhq72jajzwecbtx/qsZdnVQJVI9O2aWgzqNyS1u0g4BZUJ6cy6SWMmWE/diewuQg3xXUhUoguSMgnXFBvpg54Pj7GHvVXlPJ+0VrGTbrThZLOteKelvO90feuebWcXAiqQxyH+K73aUUEbFQM0V8e74nj2SrT0CLrmfUspEHS0GIM2PJIhNmfJmjGmaw+XNxa8OqpI6DPsS7anO8VayjNCnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 03:51:56 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 03:51:56 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/3] rust: Move do_update_snapshot to rust-source
Date: Fri, 24 Jul 2026 20:51:34 -0700
Message-ID: <20260725035136.1260408-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
References: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::24) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: e14e5f0f-4630-4e70-aa1d-08deea001221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	nvCwa5s5g6pJa6pnZusZcZvfqTnEw1GN1yRkL8LN/QnVt8vkD48YIEQ7TwNPI6jsc8EGb7slK78d1JSDfGWVaRPN1scSFTajhNcNVwR6j6blNVEd8Cm5/V9v4TdHwSJ7Aj9m1MpT34T0aAQrNsMC7bRaozPvLk/zT93dYz/77ow5xYZLnXEJGqBkdVqwGZ/KhpFyT0JBkRJbQ6TroZkyvWhOYHby8YfInyuzv09sOlB4LJynmaBuAcSb/ZtueqyHQDyyIJeG+fHfl5Q9L71WKIvaa2KqhDf8tnt06aaItzrfXwF+KgyTTFgFKKXMQ2yE5FWHIYAiX6PIoIMGMQVeOmvVGk8yNmeAOzc3hpzVoDQa3mfpt12/eUujs7DCqzOsXWTpeugJsuBuxf+3oakS8wxe3wtdhs8ERjhSV3+QYSO01hCbNeKEU7UjFOOU+9zwzBL9y3cYQlRQn8BtG0pdF9DvA29XSUM/381GmWTlSM6a2vngEWTwzyTNYGeFNVxqN7A3Y7sUHNC2qJpiMBV3qSisxeNfSfnWL6Jeb2WFkwAEEngGi2tIvpiUyFH0LY/73/hqKHHjuCP8xQrE5oCiYNRJMX3w2G75VBtcP5lhrkZv8qBiDqnSmb3AyzkZrh9QdA3tJARBUM3Y+1KU0cDyDCkRqSVsyW/SlMAl78C5nNRnfnzhB/CTn2dF+KyYzc99EI7FwgOZ0tOeZEDrWqnKFupH0ONiwok8CjNiocMtzN0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2KDUW1mH6wzO96jL1Q1whHd05lcf1kNKy+0Ro3J6pTWWKpP1qQe0j9kgRb9/?=
 =?us-ascii?Q?NLk2jbC6UR/33I/BVptxmaMLIuS1EruNzGJn/WlZK6eN4fx9+JJ5I8x8W1q7?=
 =?us-ascii?Q?UkwS8oZ5JmWFpstecQqLlrKuGkowZydAb6n3shrn34tkZ+Ar8L6VCVH+KYEM?=
 =?us-ascii?Q?cIjWPDQCfgHwWk2axQWC1Twe28oxx+8QxbP+fQZLD1oI3Vn1OOQvqjRmRxa1?=
 =?us-ascii?Q?EdWtyDX5Xi6bzE4FUUUiKkJU5CyMQLsv7ZRtOFAbBGH1yeb8r3/xRQ6MRJnO?=
 =?us-ascii?Q?vmRp9Rx2PG3wIO4u4FxhczfuBTkuuxsjkrp2R958CN/7H3FLP16Xx3hHaD8N?=
 =?us-ascii?Q?9hzAxJ10N2QbCWIqCYmaT+TcM6Xj80mVw5wPWMZEUlfSg50FBkLr1wKkfCNf?=
 =?us-ascii?Q?5L2vFsLATBFY8KOmap8Of8EcR6W4syN74pau0HF4GvTdHRwfwDHXrW/7Qj2l?=
 =?us-ascii?Q?VnAu/Wh4PlS3mSRCXjKzmIcd0h9/9Q+tSPlMwPQMelFXdy951qyuuoiKV6fY?=
 =?us-ascii?Q?UzJ5UM8NQ9eNNDNmEOB8PwLiJFWGYXcWKZRmdHH5dKLk52ga2YO+3jXaYkB4?=
 =?us-ascii?Q?kKQLvcPScRCcY8o6KB/ZdEQq4cGIqgxdp/V/178Ys5DDDjE/PV0+BojW7k1a?=
 =?us-ascii?Q?Jc0xmTDkxafXEVo6rMQdfkKLEyL3Wdn/CO8cSmB7aJi6/XN9PIcBw13O9yhZ?=
 =?us-ascii?Q?F0bJd57uIz2+H+P4vnloQT1GWokEEX94Wa4OzOJB062VZtvCSlHj8OxIPjCc?=
 =?us-ascii?Q?rWd1W0vlBIK/QDsDYesmQO7b+qd7Ye77KWiKTrkKRV57TrmexZ/bhUZSYRuU?=
 =?us-ascii?Q?SknaPVy+8HPqbLafF6WiY71IoI+Pw6dXKkLCWof5AW17DJj/yzGP8JbZg0f9?=
 =?us-ascii?Q?l7qIN8AEZxhEaPoIA6jHGgAMxCQEfB6AAtjFOTwZS+2KxX3TI1HMdtz1QEGB?=
 =?us-ascii?Q?jWx4gsOTA6DBcNkOGJQmxg8hvT5+1/Qf+Y9rkgWfQCRhUC6tqa0Jlfx2Exav?=
 =?us-ascii?Q?YsC+VAhBs50u4gxtUTjEbUjlA6XDHC8ptfT7bSMOIBm0RFIgmNDH4GhyW9t7?=
 =?us-ascii?Q?Itm/QsG5U+18UejPbpUkdb/zEHDc0fuThFPROLZgM/hO/F8+UcW9xeoCsfe/?=
 =?us-ascii?Q?4S4wUl+xqcEIawHrAMFb/6Adh5EuJCydkJCVEAncNqrbK63DU6XPh5hGs3ea?=
 =?us-ascii?Q?d3+oKd7eGmilFaowVu3JxCzpGUB5XjzW+BDzoZ7VjFD9K1PRXO8UgpwPLj2j?=
 =?us-ascii?Q?gLWzLJ2OnqGq7SWCPjfeNrDhc9eO1xcEI0jBW1kqo2HlpQgPdxh/VgS9qQtm?=
 =?us-ascii?Q?d65w9Rqc9wp1Rci380+1p9ZBlMoLomJ/3Ir4DFzCE3SR+1IL3vhgJA+gE1U9?=
 =?us-ascii?Q?JluNYhEk6/5sbAHWAWGBZCoR8dVJzW/6wxI35o+PfL6/IJ+GNo8yXizUNv0T?=
 =?us-ascii?Q?NSf4T9O7VCJWTq4vs5GhypmI4nRrVphykDbH8GeST0XO+FDjfBOZWPCyc/tY?=
 =?us-ascii?Q?XwV/JCb0IME/PR89G/gLspy/D2pXekar/E72yGxxWilAi+8Xwiy7ltT6AjEf?=
 =?us-ascii?Q?D1tVC7GlUuStiW1d/VlI4Ky2eKw/HLxa3vU10L2c28dGmvn6TQrmoMVc2uF8?=
 =?us-ascii?Q?XOmI5tuHC1VSKU2O+olxiihEYHGJWWxTsSs8ICo/2hZp9xt/9lo/vrsEY+TW?=
 =?us-ascii?Q?hTLfe8FosR2fRlPA14sMlfqiIN9Ire5VknS23OITppPgNYFINu0t1aTLOTb9?=
 =?us-ascii?Q?oMOZwTuZ9K5fp36+xPboXxO/uf/rVIaovJn9oGTGD4K2E/1yigWA?=
X-Exchange-RoutingPolicyChecked: 
	n+7VEdnjYMYLinmQjmDnT8b4YNlJeca63iSooxYVl3/7Bl86AGFsEKDNP1cBwTorEHwcyprXUloQhoz53fFdFzPdGrdaV7Qf+rqdrBUt+X+40rFqqANxfku1a6mKZa3DZktLAorD7GN4CUD/AquwWQ1MDaE1i2GPVgxJ97DrxkFKgzzMRCbxr0ParRNPLkyniNEtMKiEvuLIDGcV2GjyjqQkdcgKMtGjpfYAECsJsnVhali72en16nPzrl5Tr8g/JqJRdAL1nldQvUekBZTr5aRQqXfma/jYksCbtv5WTLm/xqga1+G5com1PpxpVZgHLqo/y5XhPJMJUzK5ND1fxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14e5f0f-4630-4e70-aa1d-08deea001221
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 03:51:55.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfNypvnslfys1iK1D2XTOuJ2YTZNCTn4ishvacaKcdMtVKGLqSzZ4HVtXqXMiK4vDOSa5AV9zNsuQZHX66MJrQQlqPO6SdM57/r6djxHPMt8FeHUM6Ii8ui6UVropptp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAzMyBTYWx0ZWRfXx7ubQ1JcNhp2
 FyDUOY96ES+xu2uJIOBZKl08FRGrzQgRAYThhox32Je8NI1oVgwIl1SUZxGDrwZA2ac8RGJaCWZ
 Xyr1GR/kZNl0tYF/U7lOXU+ABwIwV/N3y4831XMZn3R2HBYhcKbv
X-Proofpoint-ORIG-GUID: cDTj36JidUIFxtctYmcuPBbCHN7Yrgj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAzMyBTYWx0ZWRfX7OpfMC8OA9K5
 pafRLhDOe7pCKUDgRihFrGcaW2oFKI7LOye34mVhECwDgcMvJbxNbenlLS7bJ5Vj0NXOmJhGsyK
 mnFVdigm1w2LttPn6e6ofV3YLP74oJR5JxDJ+V6tIe9RwdX9vx1gJ9FX7BzwsjftAmZmcoXknIh
 pNW4C/z74rtxcx2+85WI8xXiRXflskzsCfQTIdgyOYy9UrCpS/3T25CLQVcTDJL44RfWetgPQzO
 XvcwQagwGpowQVwc9+foHwzvVYrWLjhIox+gaL2Lm4k7xxVAeY7mGBcsiclf4of7wMyRN1+VuBc
 bJmxG4/AdGT7qWHgvtyE5I2aGS47ycRxX8Swk+h2Ne1oLlP5kgOVBJDaeTi2q9UV895tVOceSd0
 OKu2DeWNbKC94uEKn3KD976IWuOXyzFHAUEFxbmYSpfDJHPP+i6czhDC2tufIOXIH78gMXO9GdQ
 Zc6FKhVWWgHoByIeHRw==
X-Authority-Analysis: v=2.4 cv=MuRiLWae c=1 sm=1 tr=0 ts=6a6432dd cx=c_pps
 a=qMfGPIaByV4ZnHoTJsbowg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=M-5mPBX6iDpf5b3w-P8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cDTj36JidUIFxtctYmcuPBbCHN7Yrgj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241956

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Move do_update_snapshot from rust to rust-source, since
rust-source now owns do_fetch/do_unpack/do_patch tasks
after the shared source refactoring.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.bb | 72 ++++++++++++++++++++++
 meta/recipes-devtools/rust/rust_git.bb    | 73 -----------------------
 2 files changed, 72 insertions(+), 73 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.bb b/meta/recipes-devtools/rust/rust-source.bb
index 0afef845fc..4b3c3a6d52 100644
--- a/meta/recipes-devtools/rust/rust-source.bb
+++ b/meta/recipes-devtools/rust/rust-source.bb
@@ -54,3 +54,75 @@ B = "${WORKDIR}/build"
 RUST_BUILD_ARCH = "${@{'ppc': 'powerpc', 'ppc64': 'powerpc64', 'ppc64le': 'powerpc64le', 'riscv64': 'riscv64gc'}.get(d.getVar('BUILD_ARCH'), d.getVar('BUILD_ARCH'))}"
 
 EXCLUDE_FROM_WORLD = "1"
+
+addtask do_update_snapshot after do_patch
+do_update_snapshot[nostamp] = "1"
+
+# Run with `bitbake rust-source-${PV} -c update_snapshot` to update `rust-snapshot.inc`
+# with the checksums for the rust snapshot associated with this rustc-src tarball.
+python do_update_snapshot() {
+    import json
+    import re
+    import sys
+
+    from collections import defaultdict
+
+    key_value_pairs = {}
+    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
+        for line in f:
+            # Skip empty lines or comments
+            if not line.strip() or line.startswith("#"):
+                continue
+            # Split the line into key and value using '=' as separator
+            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
+            if match:
+                key = match.group(1)
+                value = match.group(2)
+                key_value_pairs[key] = value
+    # Extract the required values from key_value_pairs
+    config_dist_server = key_value_pairs.get('dist_server', '')
+    compiler_date = key_value_pairs.get('compiler_date', '')
+    compiler_version = key_value_pairs.get('compiler_version', '')
+
+    src_uri = defaultdict(list)
+    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
+    for k, v in key_value_pairs.items():
+        # Match the pattern for checksums
+        if "dist" in k and "tar.xz" in k:
+            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
+            if m:
+                component = m.group('component')
+                arch = m.group('arch')
+                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
+    # Create the snapshot string with the extracted values
+    snapshot = """\
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0
+## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
+## The exact (previous) version that has been used is specified in the source tarball.
+## The version is replicated here.
+
+SNAPSHOT_VERSION = "%s"
+
+""" % compiler_version
+    # Add the checksum components to the snapshot
+    for arch, components in src_uri.items():
+        snapshot += "\n".join(components) + "\n\n"
+    # Add the additional snapshot URIs
+    snapshot += """\
+SRC_URI += " \\
+    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+"
+
+RUST_DIST_SERVER = "%s"
+
+RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+""" % config_dist_server
+    # Write the updated snapshot information to the rust-snapshot.inc file
+    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
+        f.write(snapshot)
+}
diff --git a/meta/recipes-devtools/rust/rust_git.bb b/meta/recipes-devtools/rust/rust_git.bb
index 4bbe4ed0bd..f8f47b0414 100644
--- a/meta/recipes-devtools/rust/rust_git.bb
+++ b/meta/recipes-devtools/rust/rust_git.bb
@@ -354,79 +354,6 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
-addtask do_update_snapshot after do_patch
-do_update_snapshot[nostamp] = "1"
-
-# Run with `bitbake -c update_snapshot rust` to update `rust-snapshot.inc`
-# with the checksums for the rust snapshot associated with this rustc-src
-# tarball.
-python do_update_snapshot() {
-    import json
-    import re
-    import sys
-
-    from collections import defaultdict
-
-    key_value_pairs = {}
-    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
-        for line in f:
-            # Skip empty lines or comments
-            if not line.strip() or line.startswith("#"):
-                continue
-            # Split the line into key and value using '=' as separator
-            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
-            if match:
-                key = match.group(1)
-                value = match.group(2)
-                key_value_pairs[key] = value
-    # Extract the required values from key_value_pairs
-    config_dist_server = key_value_pairs.get('dist_server', '')
-    compiler_date = key_value_pairs.get('compiler_date', '')
-    compiler_version = key_value_pairs.get('compiler_version', '')
-
-    src_uri = defaultdict(list)
-    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
-    for k, v in key_value_pairs.items():
-        # Match the pattern for checksums
-        if "dist" in k and "tar.xz" in k:
-            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
-            if m:
-                component = m.group('component')
-                arch = m.group('arch')
-                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
-    # Create the snapshot string with the extracted values
-    snapshot = """\
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0
-## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
-## The exact (previous) version that has been used is specified in the source tarball.
-## The version is replicated here.
-
-SNAPSHOT_VERSION = "%s"
-
-""" % compiler_version
-    # Add the checksum components to the snapshot
-    for arch, components in src_uri.items():
-        snapshot += "\n".join(components) + "\n\n"
-    # Add the additional snapshot URIs
-    snapshot += """\
-SRC_URI += " \\
-    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-"
-
-RUST_DIST_SERVER = "%s"
-
-RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-""" % config_dist_server
-    # Write the updated snapshot information to the rust-snapshot.inc file
-    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
-        f.write(snapshot)
-}
-
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.49.0


