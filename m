Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B69DEFCE36
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24361.1772646262926866391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aYefHW/j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CaY0o2997411
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zevnLnsNvxE/9xsKNQqv9HE+2P20VZdZXG9kLJjMmu8=; b=
	aYefHW/j3PkA9SYmjGss9rywNmaV318xvoguFWxpi+khYj2T6OKslEcUIg1eXZB9
	orH1+Ol148yw/3Rc83AAP9bI7FU+kdzhMzN2TYTmUIIbLXe0TBoBTs/u+NyV9vz2
	edk844fHCpXRpeHbOQIVUPOfOzH/tfH0PYsMNRq6vXmZu3gsUsl0MquxjZAB2O8T
	pcnXE5KSq3ZW14G9hOmgbB4eADg4eBgXdcQAtvv/7FXDW+RJeJrvpDG9pNNRBa4Y
	ntuBPBgtoR1TWe559XSZWkacac0aJDtkjyLKQ8xS5YVihudFmvPz97HQZ5MAy6iN
	LL2Kxl9DN6vSyqiO8n0DAA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgmxvs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMJeOYvyKYtK8+CqZQ2YHN95qJmcz8nyujfr6EPHRliGZJTd4zoOyiaL2jdH+pPtqELTDtqwzatNomBdDN9AdsTFlzSlAbLH5pc7Zeg+0yiHVATK+wOwKmPDGjaWlbzpiZdka6e0fwASbLkRlITe1Hgm/g5Yl5kV2Y3xRFqppr4pYtNbEUXfu1mwOHAZ6aF+ummg9NMfN1MZZxq8k9w1h2sB+pBMOrb2eyMaYMuBSZd5LIcY0fH15Na+1ec5sEtF9kpYTc/WSWrZsvfn9pvP3AgvGmbt2PUfEcSe0Wt0QlYK/TD/8zplyjVx+Hdn3ZT9PgIeiq0twx4MduKR1CIUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zevnLnsNvxE/9xsKNQqv9HE+2P20VZdZXG9kLJjMmu8=;
 b=WHMPF3Q4OOlz2Dx2HKgwDWQC858S5XD9doTghFmahHC3h2CiV6gzGlxZ4rCZsn2P9SP21D12LDoUf4nIf005prrQUBX51f4rnNxRZ95GJRWtw0TGVnmIOlVKCsekNDR+a9sto6hMLR8H5sGMIEgUfk3k6Sa41V04yB7zlAeAP4qHdCvZpyo4tp35zvCNsHIDibchWunTacg573xw1Brf+3+0QIu4j3fVsoePMVy1SvQZ1bgwMa9p8ra5Py4I/F0YSu2QNmpeWL2BlYwLeCNxrdYbX9TqDn7bhfSzEgmt+0FT1QrHWmxQ7J09PKVz6eSM9ZsDJTb1wvf4lL5bgC1pkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 4 Mar
 2026 17:44:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:20 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 11/14] module-rust.bbclass: Prepare out-of-tree rust module compilation
Date: Wed,  4 Mar 2026 09:43:21 -0800
Message-ID: <20260304174324.1186644-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b66cfcd-b385-4757-b592-08de7a15aa31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lG89aD/K9JxlW72ZNVit4whlmGtVtQ17OgVnObUhWOYJX5SMDQljxOkPWGZ9eyadLV0zCMHELHW4v2dTzMuJCB/Zd9e9BhUfuumyKoD7UgvlZa00Um3Cmrmr6EwTshE/a9yWjY5M4o1QJj0cRSKZ4ecWIZYed/O26+Z3Jz0sUYxoIX2P7X8uEqxxA7HLUrX/7ycDsPfAQZJ/JCyEEhYvhDPSKv6D1Ft4DOAawLWIF+G29yv0mUhdJrjSRDEZWX0IKUMXT8FM2qvKtRYXPW9DzeVVzwtlLC1Josm+SIx+ITP3JWbrrxibxqqy/oNtriSXDLLNdl37486vezyJGCf64kEFtRVjYdLmICyOqpXCj5N4X3LlN4dPLJFwyOsCOUws706SdwNjKo/olZz5k/kuqH3R82idbYwdT0Wl8OSJX8SmhkIg4fgf49SKEno1QIZtprSsT8Peg+Zpbmzlskj1Bgiqs2df21A1yOoK0vAjCHeNHP8BWxAHf8LBVUQqZ7mky2Brtsw2caC9nAd5AKfqkOJq9p2I47xE3cokj+fYm7yYdiTTsbf6DDbtFq6lMI78ctd+EPttfcUbHMM38R4ehVQKgl7KO8Llf0K48MdqdklbOlP83FDTNq19pQ04oPxrFhuFGCVn7SGNWTJAzZ5viccTcID1hzj2SyyaIzAs/QRA6vt7gSW9Th9+2IIg4bngdEDyn6hll6Hbphn4WL5Uwh09cwsW3Xvr6pJX7IaiKU4pC1jhuWS3d1/rV09PJ8Dho1tdxH0Ppozt6UdJ2D2nNw+OT38KaT9hUoozTkkIV3A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/ITO9VS07ndoXHg5F4wBHGaetLjBLcp/0hoz6Hd/l3+hLa6yYhEduqZJ3d+8?=
 =?us-ascii?Q?sr/BZmTw1hrBqFbhHeUfOnn4fMiPMxKYbO8kyWZ36g+XrQkIO86z/IXqY24u?=
 =?us-ascii?Q?rD0F2CmQ1BFgXE6pMDkYSS1i80fVJMtDoR/tiVfrGrvatLeci/wVwvMAjI+/?=
 =?us-ascii?Q?vDWdYfeAO6gsCHVEWC6YiijsANow0nVueCHpMje3x2adNXDGBhgH0Hm4iEbA?=
 =?us-ascii?Q?kTrtzFHJr6LYfOS5Acd+lazWYKTEM+atl0T9oXfCy1sf6W5nBMWkNfXH2WlX?=
 =?us-ascii?Q?Yu0KHEljvb4PzSzaAfXHNCRG0h9iucB7LBo7+eMH5SYY+QaA7CjB43PaGuqn?=
 =?us-ascii?Q?o6GR/xAL+ECQMf4YlkLgSDCSu4MQ6eKKes5/j5C8wHnD0Gm7MmtKR8HySWn8?=
 =?us-ascii?Q?aWbD+uLbFkdb+8qPgRMeD8Sn2u4KgyuNgaqKm1koDWO6IPERI5oRAVcT5Zx6?=
 =?us-ascii?Q?MhRDCXKPtjEYwLHJk6XOrT2Nx7OhVsSlwDozVrFMj0iOlb2Ox/Pa6QmC8fs2?=
 =?us-ascii?Q?I0xsBqwkma1JkR/mz99cMkhK8BDjmRDlq/HEPwKdRPEkXABDyr+5ER8lk8q2?=
 =?us-ascii?Q?naF/ix9BAGB2r7xjImdiUMthK+LJPzWvVfk82fso+uubU1j4DrYnWnEPHjqi?=
 =?us-ascii?Q?M0nRfLuqtojjBbrA2/X5BbW3RWXq8rC9o9ZJNtAdkUWPp7okIZ/Vp7qnsm2C?=
 =?us-ascii?Q?APoGqpJgVWOTvzpx3B9Nz21yYW3/Wct6tHN1xhquJPagnRNBrbpgpMD5gIVJ?=
 =?us-ascii?Q?0lGbFO0p4SbQFpv1oRFmQt6egII6jx0PPRCyE4RTBoHX3ptUm/iAtGDi5iHa?=
 =?us-ascii?Q?zTLsoXi28F8amIfmIMRQqD8OIkdti4rVBlOSLuw4hl4azUnki4nCPqvD4TJC?=
 =?us-ascii?Q?k4tIj1mYBStj7euswBM7EinwDjkxw4YCTcZxndHA1U693CD0IjOOWhchriMW?=
 =?us-ascii?Q?UlpmItq638/cJRHu0r2c55kaJwZRyzweivZl26EBi/UOUulU5FPQC8K5Lulh?=
 =?us-ascii?Q?4Pnt17SE8KCgc/QV5yuv3s+JADd+GQmMcVh/ofXz+gJ1hkk1mcYpCBNIJwN5?=
 =?us-ascii?Q?3XVmXzOpmxBbVYuGXHyw7IWDtJeU4ujbCbvzjKP622r4wkO2rU9Bs5Rz6XBo?=
 =?us-ascii?Q?BWfswW3elLAzv9qwacjjKmt0jZ4TeIgeOZ1xcp9dSb57f8GXplpLzdGAbqvj?=
 =?us-ascii?Q?/h6MdRYUuZ7v01ggLByBrLTrGk6jihrObokfP2+eZm4xqiPAYX/2YO7URLjH?=
 =?us-ascii?Q?cJhfFfAa+G4aI/zQsAvwB4xy9biqBCOSCMbjjfd5on0usDZ1UlL5flYQdOHe?=
 =?us-ascii?Q?Lg8Yl9eAdoiFKaBRP9WEKH2F5MlruMjrp8yIWkQXxNufnC26fdOzZ6jL1KsP?=
 =?us-ascii?Q?8Jt3Dk96IBrAmrueaCPun1WLQ+Fqw+l/1mEv97QMSFxu8egwCcNEkOSNsbBR?=
 =?us-ascii?Q?T43GynR8e5evjQpQ7qT3E+ffY+wX6jtgEoURpg7+kzq0RI4EM8LXHNkbZeCa?=
 =?us-ascii?Q?Ck4MxtBR59jTFjxJHt09gFaJYozQjx8r1lGUQvKk4+vqBBrWROV6zJGVErTe?=
 =?us-ascii?Q?g/wKLhmAYKc+Tg3LPfKy1rws5tkvXpnrx8BiXEPaJBD/T/8HIbV4TH8UU9xi?=
 =?us-ascii?Q?H+kfLRDOMG32J2JYYzKc2+Dg0OMw2aZeHlMkzfAVZJiwdCg4x11ClRh32vjm?=
 =?us-ascii?Q?8kp7l/+pi3O/WEw9LVb/xj6v4hz7FdzR48FdZsue3BgxlvXmgrj5mbgZDuQC?=
 =?us-ascii?Q?ilJUw7OPKVcT4UIG/c2l3QDI88vB+K8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b66cfcd-b385-4757-b592-08de7a15aa31
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:20.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBM0Y7jAtgtRGF8g6dgrYVZDAIwPv4tE8cAesAufJS5iLQmJIZXpI4CtX3jo5+G+SmYBOxUb+g7tjFWwqilKP8mwJX3pjau8XNqmPYH+ofk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: S3Srbbekb8q7drP1ytZC15fDrXekLLee
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a86f76 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=7sZwceKTbfY-ewGMKEwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -_3q_VdsjsZxN1L2l8Wx-Z-jPSgp0zD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXyN4Ui+ceKJJz
 U9wUzzm4IABUxZE26NKlyZlruGn8yNDnCfb0/HCQQsQ5kfK4TxMxHKqEkkMS5rhA7sl8w5PpVHi
 4EIfBoaMfHoK8wtYkVQpXISYNeeCjqoPM9kI4Z85aJ6HDXnDzAy8CPR7HeN4ZRUoC9KvsNV4twN
 9g1mKZxZplrSszFDIIKJk5Ije4WgKsXcOp5bDZ0BRJlsoVS2PeYF3R5b3aKDFkOjy5t8EHWIRXL
 In6Nx0Pn5s47bxkCpg2qzgL3t61EZqXehHixgJ/60JIhVwAx0D15zubBM3KQa1hrLoMYh7tkOmM
 Cx46tsxPdxuJqEfFpEAF57Cmp0HPDMzUIy8hTNfNdRJtNM72w8UfZrsf6xsQP7aZSLetEVfl/Ui
 SYHxFgAteYXeo29hPZoK3159ibzmkMFbgimY6/JQJtswVql10SIljWDChkjdY/Pgt0fIyVT/g9R
 /0j62sfI0iPKJkr13MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232427

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for rust-out-of-tree module compilation:
- Add dependency to rust-native
- Remap ${S} in compiled output to avoid buildpath errors
- Added check to skip rust out-of-ree-module compilation,
  if rust kernel support is not enabled

Co-developed-by:Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module-rust.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/module-rust.bbclass

diff --git a/meta/classes-recipe/module-rust.bbclass b/meta/classes-recipe/module-rust.bbclass
new file mode 100644
index 0000000000..f9cee5e5bd
--- /dev/null
+++ b/meta/classes-recipe/module-rust.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit module
+
+DEPENDS += " rust-native"
+
+RUST_DEBUG_REMAP = "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR} "
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
+python __anonymous() {
+    features = (d.getVar('KERNEL_RUST_SUPPORT') or "").split()
+    if "True" not in features:
+        raise bb.parse.SkipRecipe(
+            "Skipping rust-out-of-tree-module: KERNEL_RUST_SUPPORT is not enabled"
+       )
+}
-- 
2.49.0


