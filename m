Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8642FCD6E48
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19600.1779885875675472798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PNMquVop;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ki4W2757722
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=m/AU0VWUtvMgc3rauzOyX/qP24ZAY0diJ5rRJqALl/8=; b=
	PNMquVop9Zqtd9uUwAaInhS22fqx04r9hOSX/r1Yd8pIbaPpf8WfpZ+hHwn6ZWiP
	LmRGLf4sj3+L9eYr6NDfjEp6UcyQBwb7/HwuUPs5dnR3b9QiR4siFnBnHKIzBtkZ
	H3R7Jqjo3jEm7WgDYWrJ99lnDQN3rbfyTbxHsYmZdJvDlCHI4bBoc1oWbpZe/TBV
	Tm/ZwTPzns9l7cR2bsjMonk9J7qtWej51BtgerTmJVRp4oFx0uX68tRacDYOTO0R
	0P9TJccb0swEziVP/wqOJNcRxDEI0PNKa9MqKsn/1OZJtcEfWqvviCHeCmIYmmoB
	ZRdqlOKIfLdCNlcwI6gz2g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrenk0q-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVqfTz7ijfyz1AW6GbQ552wCn/7BFBTDKtqy9LngJw+xpp/iPxQynFJJ9dzbmlZHIxHlgZGapVU0MyLbwvlbXFHN5IhOycx42mecTkqPJv9MMMM94+6wdIZZBWOU1EFTNRxe34cgPiCmvyoEVqclm6QUo2kitE22RJELz1G7Vaxas/aJky5QSqS1CNSbutz9B/UH06gbsyBe0qsyfQf+Q06xQgnHxu2PH4fOneIajnVGJp1RN1PKJRi98SaFMPfTj8dVeuYzIqkP3/4nn1Tp0aVCRa4ACi6LX7nUKBFieAYPYJTncpaovaJFnVr5FP2vMlCE1ExalOxGmJR2Wzvung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/AU0VWUtvMgc3rauzOyX/qP24ZAY0diJ5rRJqALl/8=;
 b=jLYOJJtst9/u8IB6XUgJmLRWw/6ZAal8DfEGqkT1XL7LniQXQ82+DmivpRrNi2Zu38RrG7nayNGT7mKS+idwfEJq0t4M/nmUg8BaydvWBvkiGuvcww8XhDA8eVBg/vywSZ4S4+dKDQVlp5wp7Xro8GOzC9AImcJJ+uM2GMgNTXroMRroG9Pt8k/mGKfa9i6PY4THe8p4+ycYLjleqeaUuzuxFooOBPFlYjlMm4oyO+6cnhnrVKcv8oPj3f6ROJ5crFCiMRxxdJQtRqDjaVpdi4R6MDpk7pwoRk+VP7tmv5lBwS3TpYw0A/s1vi77WdoohuB1PzhFmS65RZCLQ2vK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ5PPF75B6D7B42.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::835) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 12:44:30 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:30 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 6/7] glibc: disable automatic libatomic linking
Date: Wed, 27 May 2026 05:44:13 -0700
Message-ID: <20260527124414.1728434-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: 335f512e-fa21-445f-140f-08debbedb21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|22082099003|18002099003|38350700014|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	dIThwtatjNn0BLraaz6UVni/dM0yn1Rz4iRSjaWuXpPrPBfEzaeDYUNUxtN+IT3Ci8WWDIQ0tkJpb2IXM1GVtebfJL1kLKFrt41fZXCEaIFFEfExxSNQP9xpZu5meoCYzplzEFRH0YvBftAVt120Byjc5yGCghAhNEY6i4nm+Sz586wqQrWg3H15NvZ9AgNTvmi7gGaN2bN4ZkOnLgfN+NfalqIxtOt9++4Iuo9tBsAGIZvbmQU3B66AtzH9fh+1xnzg83HFX8koRZHCXbHsIXSn0CkRVIWuZnF1GiRqjJgYPryCNyOYAi/8HXh6MixLq4FMN6y8uTyXVD9GI4TFxMZy/0J5ZhU2JybrIKYaMgupgHXdpzv6D14toGS2DmQwLDBGB4nC/HSiFEdLqugbPADpzBfwnKfDcTWHNDBUDEcPy1zQKCJGq0DqwkQODSAB8iR5MkPclWYnzNcNK2nG2ZvccczY0VaqKVZVVND2I/fJDP9PsrGEPMK5dEXleoDc+am+Z2shrnONwhbWfa1pmCqovSvLU1WUxagWn97SetkshXOorAkp5TC8bmF0/9BUYBv/5gMie3d+X7kHpNLS9gy5TYbG6HELq68El6MQHoWhEp+/AflnhUuLHKICKQukK0EDsUomeKiVmPExTIfpry7Ay1910SuLatBfNf6zqu2XVkiT6AgPa3Zxr5HJdaNJ9e+KvmHnwYf6g5PKDj5n80X96W9JkukMKnLgL14YZpJjKsohc8dgsijZRoWov7vd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hE8bigfBAPZCJ9PuR2ZPOczicPpuzbXcT8IhDBBOBY3v5f1tjeBV7hZXZh6k?=
 =?us-ascii?Q?cPYorWImeEpKquZKFomXCLKcUJmD3T68+zLlxD2rYH45G66LK4tK6KfSZ1bW?=
 =?us-ascii?Q?A/yXoHHUnsEGKRCqCQaEjk0CuPcOnf0j6liTFzlOf3e/dRnriF94WcZkgsVX?=
 =?us-ascii?Q?9VA2WO45bu3yLPwVfFNAPgGsNL/vRLqfXJZaoTPd09fh8Lt/2St1Y/BtI1f7?=
 =?us-ascii?Q?deFqbnKttRe4kcffXcUcra/i+PEYHbK3TPbusRvngsmrx5lO+CHq2uPQmJPy?=
 =?us-ascii?Q?yQOA2psVB6VzvRQ4VRmb5DVIrivPyd9yyR/uYmECv7+OI0q5JaWmuR4dj/Fz?=
 =?us-ascii?Q?A42PeWVYUCOZxMtbiOLIrnCzElQ2MvvGtzSMRRtODq0nRqhSYBt01/UDJGOy?=
 =?us-ascii?Q?N0vpxU5CwlO594YfK528yp++ZCGI8QOwg244v3lOwJUNC2VAFiKunArmIovQ?=
 =?us-ascii?Q?vRrv6c9M1yZrs689mP5/kYF6TIQ9ztdcQFhGpROwEM+H3Dng0X5/4hS98a/7?=
 =?us-ascii?Q?M1fOmbNkp8FpDv96d1e/qDnoz9KigDR1qH53j3U/J2ZtYYU2f8IftGkEG+Fp?=
 =?us-ascii?Q?lT6sYCHS6dctem6jv33yijHOv3ZvM84LPbcVNx51xLcXfTr3DLu9K+XMKxE6?=
 =?us-ascii?Q?2HxIGjglrGYA+Vhn5YIE9dN0lnjwVNyMLdFZVYFzvzlZ3Y2OnXGbByZxROl1?=
 =?us-ascii?Q?bhQAt+qXlFFLa13IfoHWAEgxX7vIG4QlJRpwr2d1BWbwhRLdGUYnqsrUqhEe?=
 =?us-ascii?Q?+piiP7FIDw5hMEs/yQhh1vCc56CuduvVcdhz8ELmAfgOjo6fGhJdCX15cjg9?=
 =?us-ascii?Q?n1T1kUIgow9XSa5sKOM5VgmLCOiHL59Mjh2cZsU1FF8Bvd1EEYM3T4/pknu3?=
 =?us-ascii?Q?W4cjoiuWqgSUJVeFqdDTBXAGdDeFkAxIUohN9eW5i83PdZsOCDL46KeNOHfQ?=
 =?us-ascii?Q?wocjh91FijRtb3atY5w1CxjI7BgeKA/UXUj4TojyZ56GayvG81CIZMQC/Pi/?=
 =?us-ascii?Q?hu9YMR7lMmrTC+M46klu4VxT+Pcz3Ita3RAFSU7YTMfJmRQbO7BT+aXquSfa?=
 =?us-ascii?Q?FI1RblG531g38ZdrcXH/DuEY8cmh9lPzTPmAYEzhadSXgUVzXqKz32x05WBc?=
 =?us-ascii?Q?4fG9iu7/0S0mmWIiaZB3VthfO0cma+DUHKcyFKp2IQpkOwYdSAt6KlHJ2J06?=
 =?us-ascii?Q?AuolgVq4ULg77Iy/LfG/3TL0RJcQfkD1HKpICtQm61OgESD4vS0XSrbjnqHn?=
 =?us-ascii?Q?4ZX+OKbiGFbuzL/cF6Bnq225ie9Ry0O9DTaA5snkTW3vXbQc2LN1mJsqfcRG?=
 =?us-ascii?Q?iyizI2r9lG2fykmA0d8aHqn5IoTW9wST01aziZSnqKH3EL2s52Uxt4H/Jvz6?=
 =?us-ascii?Q?+FVtie8y9+WNgMEx6/gbTLHYbVuBO2u+Fjwrcop+ZVchTqT2v4q1zOy5JTGg?=
 =?us-ascii?Q?FsFpUE/nNK7YdFtFUbJFLqUB+uytMvjRdybNU3F3gnT/i4BQwB/T3Fci3wiy?=
 =?us-ascii?Q?hWUijjBvfymYKhgbr6kBO4qskMGApoxep9QCr7Hq/6/q4XsZYaPMedbTUITe?=
 =?us-ascii?Q?t1FBvlQoi5VJ0HodDtbA6qts5C/cA1gEH+j799ryClnvyh2Zst62xBtZ5VA2?=
 =?us-ascii?Q?4T98/50Janpc1PFBuBo3flmrBtyszNi7Je+CeUU+oHvPYf4719WLRnmrOTgR?=
 =?us-ascii?Q?+zLX8NqboiqCZZ72wCLRpWkjle2gpHcpA90ry6fEQqxjw7IHLJC0CR1gQSrX?=
 =?us-ascii?Q?Lv/fBXjLIOCYH83Xp1wuXrKeB7Fz/PM=3D?=
X-Exchange-RoutingPolicyChecked: 
	jKJgr/+zOHP1VYfp16bj4PwS1bZN+LM+dSaHyCWTP/AyPu9X0WFkDWBggGqzGLG/59v3zUxYF9uGUVqUCHuh9OubZtVGLArCCc6AimhCtG5Ex4Df7F359Ay51+dMc/xVVbCs7xg3MKuxHlMZIozQrdXBiWju8n0mFVw6915NmL2MpgFULgZ+drlCxShnbfrc7D/MUEA3LFqrqt0xK3ahVbOeMwFHP6oS7O33yPwIQqQx2rdNi7vV/PvqYPd7lGY7hKht8YjAF0NMTCaqbcKgMisKedYAvXLqtehLKz4ibOEVqLM3XB1Pz9HYIzfs3Gn2MCMpbm2ahIysWC0zVf/GZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335f512e-fa21-445f-140f-08debbedb21f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:30.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i49Zg0oc2ICkEXTAbq3tnNQmNV48z3dZAtHEntAb8SfzeR8cj+R1n3zdbv37jTNCrxLX54ZPZDOlluaPZQ8E8djth+4HFnzOALO5fLJMQ5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
X-Proofpoint-GUID: yi8j3E5ICRRxCi-wPNpfKN1302Dwpzgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyNCBTYWx0ZWRfX5MIKuksfjbFz
 RWkIgikOgSGpGU0SgWhEGZyq9AswZnoQTh4x4j0SJve19Z/cuff7GeYVRcO1hEYtRI2gzOszmaD
 XQLlNdrw7uv2VpzhpFbpEYFmuT++8hGQQIwoyz7K+er7BUmHjFT1kfot40RXJWiJNI4OsCx25RN
 0Lx2rjx4bRBLfHvHF8zRcZJApshH7k99Hg1CCHWiD1OpBEhMzLrriFTzp//2gbwx+PpHzLMrgWU
 jADUKGOguSGgeDHHjIuarVrcMksIYt/v3ovftfGSitoLncTSNrkMnScwSOiYm9gUOz979lurXlT
 PnooQRsLGmoKTN6Fn7R6lZMLvUVFC49QUBKnQYke03EicCE3m3MYs7eimJwD4plPWRUGaWAjcP7
 o5lC2ffEb1oje1igwmwWUxJmVk8hdKw85NL3jJjwr9NSAD/tIOxwUWEaEMc9FcPXMVJzGawXTb9
 dvmKdPsJAdN4mLdrr8A==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a16e733 cx=c_pps
 a=VB8Rg5rwfRosJW56o453OA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=qNKf9nYgbAztHspnWj4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yi8j3E5ICRRxCi-wPNpfKN1302Dwpzgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237654

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
When glibc is built with a GCC 16 cross-compiler, the compiler
would attempt to link against libatomic which does not exist yet
at this stage.(libatomic is built later as part of gcc-runtime)

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index dae087d53f..91fabe14a8 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -46,6 +46,9 @@ EXTRA_OEMAKE += "SHELL=/bin/bash"
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE += "KSHELL=/bin/sh"
 
+TARGET_CC_ARCH:toolchain-gcc += "-fno-link-libatomic"
+SDK_CC_ARCH:toolchain-gcc += "-fno-link-libatomic"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-- 
2.49.0


