Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A896FCA164
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20814.1773078281404191436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B7EXjFJE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Br3SM531417
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0dAADcTZdhgLEvTT5eAix+4SiVveymXHxkAfPEWg3LI=; b=
	B7EXjFJEqRCQFj9uiqK/HNdihiWzZA4znLYo4tUP1pyxs88LGCgmBT5LsNI6MTSb
	HiQ4K4573LsqzdesfGdfnlR3yPPayKzp9MZm2++xWC1NFuPnAQ/5ZfUshsbSGvRQ
	n1j17lY/4fGmx9MceElTgcwCrwRApfkHivzp6gXAx9WPHDzpwUaMyZ6rL0PKDtYt
	CftNEZF17DU8MWu7VT85poZUvMZo3sDs2QKG45ynswdLrdCgiV0wHyM/28G/BS4Z
	jkMwd76mzjUgpMP7+tfCzzfA6/eo3cwiyYNH/z3AnbbUMQ4xDRit3JFBxr8L53BU
	xL51R/IZF2v+Lwl8S8aU8g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278r-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYHbddKc//1H0f0UstL39XPHUU4aaXmHLlLyiuA8+m5cVyUQsb75LWm/y+pHPavtopCH7eoHUQlGkqIXOr2Ha/TVqMSFj8v3IqJwsz+u/BswFCbMmudOhTJLr5dJRC+3ljpswgFUBi1hIU4JYgYbNGfKsEa/VouNsuzZMZhppPmOM4cLSPgu7laEHGoreU2Mafm5Dm791rF44+l3yAF4oJX3Bs4ah0GR5M8wAb2nL/Jva0dOl5fhoR0iYbT3AeRm+THVCNaMLgvuz4YZeBS0KVH6NZ5fe15u1OEPPtyqsvDZnwGFB2ANaoGAOwqW3AATBiAyuDAig1vlhY/6Tdzrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dAADcTZdhgLEvTT5eAix+4SiVveymXHxkAfPEWg3LI=;
 b=FR2fNksQYIbHD3T5P9Y8TURBmYAQksmUsJc1zgIKOX4S+I4jGmX9/+7Y/TOmDgvVPdseOTDomT0zznM5scv4ZsLsUUIX8+03t8FkXXIjfaXqyU/rae9X7+ttDnoBP2i4y64VmMn2Utmg206WcldH456aH8hMZ3jxNoa9LxqoCZhh3IdlGpg0Qm+FLZdNW93m3cjwFa6/7t1igWF6Hr154L+TCoClb6NRWKRc3LnvjNu0zvUDuw7gP+JlVRQ9aU15wub9aMeG380EkmUcHy5tyoxAr1Om9ShGxDrcFFEWI8FIuFJ15BADWggZq6FAxzvcvqvOkGZJrCPH7AVlnra68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:31 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 13/14] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Mon,  9 Mar 2026 10:43:45 -0700
Message-ID: <20260309174346.3384212-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 1831274b-308b-4642-06cd-08de7e0384bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ocelPDmvUs4R1HEoPumYXI+lb1AB8Gq78Eaw3wypcfYKosJRVcNnE5jSkRstSkuv19TTKpodDSHr9c5VUIM/0gm8lnjdBfgGWaivQ4IZ4mALxNJ8Yi4QKn06wWMqRljQIXvVOmOSc1gSqPWIY7Z7AeElpxDSUM+Ys+dMXR3qjV6jrh5hYO+aMDi1MPC3UGx2WzAZ8ZSE8ncjk1B0hlq/bZ0pxjDOKpLQHVJ/TAfKvBdroPKHdz3aaBtyhjoRL9FKJLy0qOyPZH81J7Hs8uufW4PaRiqSVzfguENk8BPOQpauKO2wPh5xmer8f6f0BQqEj+jZrTXDGnXFjvjWoyXtpiLLD6xJMEf0u+51nNqmuhJzY54pwicHLX/y3UMJ/o4CQjZLucRHkdDJ6Ij6K7Pd6ponKN+DuxNfazRUufbea4NO5Bhs3AbwbjnZTcnDuN4Foa84iHIglOfFmZ6XPwYdgyCd91p7x6Z+49qdIsQ79HPWypBtdcJJG3PCpYIE0Y4J1U9QspbF1FweZQyZD9kk5FJGh9egIL0fqKMALnm8keRxVyhBE08Fz26zgOZi69HuUP0Xx6wNGenahQwXojcqHU1bbj7Ic8331s+Mz3dqOAGI98hzVeiSAx6ctlRq/5d06+khA6WLmHf8WXwZ8RB9QtMqPjk7aShKw077jcwCk1NRaDbJ2EBLd2+M8zKNW/tRCMCJR9ds2QMokxYn5Km2Ir3liQQjC56t17dR74Bo/Fh0iOjWHOQHbUnTj6X56/io8u/1WS8RI10cezFnE4YGbTefxbXYqWgkGHP6qF6AgVM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/RS8SGfHv76r874t+PPWIRG+0vvp/QX0pfwSGiOX3L7NxWyPsBwvHzpjTZKd?=
 =?us-ascii?Q?v5UXynzC+2RwZW/9qe7MkcJaRRfG9D3e5lX7yOaVZ62yGN3sk2Ty6i+6oaJl?=
 =?us-ascii?Q?fQFFMbQG63zwgi+dWHlY6n5gMEqJgcy1Qpn1GgUkcytelRZ68/rK54JjAO1y?=
 =?us-ascii?Q?2G9ujyaFWsiFz7G5v+r1Y266Nlx5cUhQ0Z/47wjfpWN9xgFEf8aR3mZgYnyb?=
 =?us-ascii?Q?J96dEK7FiUXb9AsqlwhyzW7AcJjKV9BfSCLrd8vh8iuJutVmuQgWRqNlpQD8?=
 =?us-ascii?Q?E8pjkanmKivL9lKDy+cDU9DAWf5DlKr4grrVUyzfHeS8BePQ4R3xzEtzAYd9?=
 =?us-ascii?Q?uRg7lqlhb66RRu+jOcXAc+bDP6FDJIxz+mtrXj0ez5z6L/AdRFGPnSvkdHFl?=
 =?us-ascii?Q?9w6mhnfEsMObkVK3Ylo+nsmVr6an4s0KKyF9k6TOmcPki3+4LcE9PAT7P2Ws?=
 =?us-ascii?Q?I2vwyNs5QlqMothRsC25xvSvk5HglS9+cy6fl535FxhDKJo7mVJD27a9AWTS?=
 =?us-ascii?Q?ooYf6ZhiNa08sJ51txOlCF5K/ldhaNTP7vsPoMd30gOnAX99fsQRG7/w+Y9s?=
 =?us-ascii?Q?Q3UTecIMnWao/sHgGaYT1KgUCW+sDiczBhHKSfMDc+FTTzeyKivgRIVnKLpU?=
 =?us-ascii?Q?NjXhcDfl8JRWHAxs/qEVNXGqv6m+ca9cLqIHJiX6QEqJYjwpRbmT95CaJ84m?=
 =?us-ascii?Q?jWbKgNxebEJIEstIBRMTy4fN2OkxEK2IFkyMGqwY4XR6+Edy+gxQ+f5fyrwp?=
 =?us-ascii?Q?fYtfrD0rymsqRxDRRSRHaNu0MtjCj/lhelvVM4Sg0PSxEabJ0qPnvi2SIqTy?=
 =?us-ascii?Q?zor1VBJqNHvytKMF20qrKmwu0IFMPPtrKfjDauhDlS7igARHt3Erfx1qPYPT?=
 =?us-ascii?Q?cKFM2QwuskYg0frhM0vnIH45hAsr/o+K+wAqjxzeyShrm/CfRnEdHt1VFjOb?=
 =?us-ascii?Q?YJPbChKfozIAVCc5CKJDKuHowMheedqJTJjbkCEM/GRxZ5NND+qKM6w0rTgE?=
 =?us-ascii?Q?ZSKy62NwfYiCv69jA21Am+ReT6w07vxppM9UTGqo1IT+CXyBQK9Pg7RHE9v9?=
 =?us-ascii?Q?H/zb0FCKtSUJjbdoz6X+Q6eSRqovYsccj20JyRlHD6f+wxx0xpZ2NIiv/3k3?=
 =?us-ascii?Q?3KCw55b2XDdF1SBtT2RQjuFMFSIRU9gdmYyQ13wzOHDB25wz57+S5evgHNrF?=
 =?us-ascii?Q?wnnV3pWWC6SuzBcJwv0bxpmEaeIB9OPIVkbHb+063KLottexcDfi7iYOv2nZ?=
 =?us-ascii?Q?6USDnHURB0fg20B3xyI24C2kM46KwLpOU4XsgNw4G5A9v6hzYRC7DoAULLxE?=
 =?us-ascii?Q?IFhZGp2DZb118dqdJFq1HERv6LXN9ERRwC/vWRzp6CFr8/UZL1daBFdmzjMS?=
 =?us-ascii?Q?P1glCLC2EY9namgMnrP6gBE5A60GLcbNoLqB+W++FxS+sKL1Op8mfTypwBwR?=
 =?us-ascii?Q?+2MnXSBqZLbYAaz93f5jK1TUxqBwfvy+jyDLetOfbSuqY5VkQY4u0sE+mBPh?=
 =?us-ascii?Q?E+1kwTFk3Wd92h3Ko2Q2XHHz7RIK3mYbmdqzaMvrbDdRKkbhWuqv82PuuJj5?=
 =?us-ascii?Q?DxJBuLsxU9lB59dDOaFaSLUDMbrj8+exUo8qmhoKQPTCLMYjvyteE+bsL655?=
 =?us-ascii?Q?p1qkirGdCE44qb9klSQQHVOF5a5mVtGUSYsWz5ojX8Iii2vM/JYZ3DJdBPP+?=
 =?us-ascii?Q?g0qM9QGrkfv8aGeVygbGRtEhgiqRs1LMn4f8lLa4+wm1JGIGg95UpAzYak4e?=
 =?us-ascii?Q?DCN/37rusV5fXsSYAqDhePCRTUjcIu8=3D?=
X-Exchange-RoutingPolicyChecked: 
	awb/7sgTpw88HJ2WKLWtWOs4nEnNRQOLeJcrp63t4LKVIAMziYxRl3K9WMcEwGwMZAgvHYEx7j/VSPcGj4RP6vpHAem/Nw+JSQW2VJfeg68f4L1uaz/dYP5sXnQzNPg/okF+qup6ChADoVL6zQf3J/+Q55dCgvM9wsztIOiIZ7zyEgnGTuF0TgRRmkylUY2jeIIdVXp+wMhiYdxWyVS/bMMyP1AGFS3BAo5jvIdDRdqxE3mmjQADuPB6mb1CEI18oLre0llR+G25KitNHH3KpYmjnRRPQrkA1lysCzvJfUIGGoTdNVs2nM6QjOV1OCV5tQWi3L0iVaDSVw00VneCIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1831274b-308b-4642-06cd-08de7e0384bd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:31.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWAAzTu/6aLTy+ZE+96JjPEL7Y9X5/bxIepMTiZk55CsaRt8FBPFFSYBl4Jb/AtzFcdqIZ6v2y2BrptGBOkLfZ2rac47E+H50WXewkXM76Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 45UlG96pYrO21flCMouCpT5o43y2TCGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX5KGlrRvbDcew
 97WPBlZuR0V3DvvcJC1PA+JjUfqQVPw/GYmXvMT9SY70Qa8JXzO5gQkvlGUxHFvmPJyCrwA2ysl
 RTqj1acCLheiAZW6BUuc9YaycmYMxyL1CYxu+7K/fyBq8EZuZaqcY+cR1N8NfTiLbAwCDPvD1uG
 9lTrJWxXh6aRz2WVCTPWRgW80xk/u3klOBlbgl213lYkJq0YUQoPrLdLcp6qqgQstJl+kOXijRm
 rB1T9QrOUDa0ANVuuWMKoV9YxKvQTJlm80lA1WlcQDXHNyhnHo1yFu6SUj6IR0PQpThNwps7q3q
 R8tIi9Xa/slh/fl5iTOsVMXZmeugtIaGWjsjpp2Vl4Pu7CSv1MjyFV1hSElvzxAEWpvcMAhp1ff
 /D+zE7UjBkVKUla0gA/IdrSFq+ill6izSc8gSJJyRhM1r1sWjE7poPLkdeYG/HOCNO79YTBifss
 orUaShzU2msuBw8PkrA==
X-Proofpoint-ORIG-GUID: M1nrYqqWLvFmJqFSMrd87pZyO7kJvzqP
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0708 cx=c_pps
 a=gS8+cbQEeirDoRw2OPG9zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UhGsRKG8cyjctxJ2D5cA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232750

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 7caace5619..6b4de9aed9 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -43,3 +43,10 @@ do_configure() {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this
 CCACHE_DISABLE ?= "${@'1' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else '0'}"
+
+#Fixes buildpath issues when compiling rust-out-of-tree module
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = ' KRUSTFLAGS="${KRUSTFLAGS}"'
-- 
2.49.0


