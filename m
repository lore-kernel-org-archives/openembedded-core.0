Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D1DCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.893.1778649837694126482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PNmhs4h+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1bvYu009107
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:23:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=i6NF3Ey2fJdhV/fmYgPrJorw1q6xVmeYcxgd7I6Kh2U=; b=
	PNmhs4h+wG3Opa2aWRFYGUNGXfhAzTyufMVfAnTP+cOmmLuwtUzccWrNzDGRJBBk
	f+ULuugCzSiBiSQuOKPyaD1XR2S04BojqL5onDu2KjFqIVvancpfvdrMzVdawcnw
	SjcivNfmIbQRAEaERT+3Ij/TqJjTVyqPPuAOlo28XPQrx4q1Ek/C0/h8GH9rPMMG
	sjdakiXwQOnheLVW8pztMGlCCoL9OeHIW+2DU9jmr533vFJYzVkEHlgXfvt8Wkzd
	6YHI+bph4OnTQXaE2W8iZPsCE6pCRv5YkWOdyJtuc7pya8+qIycI3+AroeEHkrnT
	1a/A0xyfUkdXmoFJ0MB6Qg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb870b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRmbn8+yogKZynqYh53PkO9sVgd4ZU5IKhYMksMzSCZNONIniYxKflTgzNj24Ci3f3nk61bNmbMSW5FEDHk0sDxgd8NNoOt8OOosz1ySKtEmj1R361CAzTjq6XXf+5AHzrNHzi/NHw6AGcnEX6oCeDxtmbkF/gK1kaSmVGlx5KsdnEylZdeXvCJlCzgIg+YSDcjTQ8g99d36yQG4GDx4TunIE1ZvPZG62EtyPH3zivhJyLl2Ufl2K0/ygk/cX+nE1ACKpGZgDe0EZMau3KLgGqoCLFDk2R0f9TR3N5xbl003MOE3o1MCIHaqVjcDTKRObwEop07+tv9+PbhQ/qkvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6NF3Ey2fJdhV/fmYgPrJorw1q6xVmeYcxgd7I6Kh2U=;
 b=DjRDw/l6MPcqTHU3YM1iOwjs1ttX7P+CxVtGsEJVdI9Uw82ZVhOFSHhRyzg+/BKv/yYhpwbxq/s665Bue2UtxGyfpHJyLq7G40SqQ0xlPTDZ+hwxWsCPwxREgMiKuRQoJiwoOtUA+PSED2QHQXUx1sEq/Srx/n5kVoC6ruY5qDW69i75QX30u2D+45eaFB/R1kUYYtH9dWAszbUm/er338VmJ+LxRgqwxJ5qrGq00iWx2oetn5UolJHnHshVVN4ejbjzW1T82uA5WKXLGqvyLbxnxfOl8oLjdHue3op6lCqE7RXHlQq+WqYrx3P6dIeIFNVlgqA/3ZHa+qXJmQvyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:23:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:23:55 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 2/7] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Wed, 13 May 2026 13:23:29 +0800
Message-Id: <20260513052334.2271800-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 333ca9af-fbe0-4149-c033-08deb0afd355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	JBWnsnsgyj5dLWNnKfpALg/KU4n+vD9H/Sg7cvsmBhYBrVCni8Hc29NtRtTb86/qxs6sh8VlAbWRD5By6+So7B77myRd1Adf4A68T0U9rpKjOcDfM5BvGKvWAvn3z76pJKmATgEfOH1yoaLU6hP1goqRr+DPSk0bek0mmmShuT9d6VKOpqJM+0NYTT6IFGkmq9pQuzA1ddkiYuMHyVZK/UKrJs5D8nRtPjZhkMJN1EtFEzi8ujbPws1Lp4liGZXXXw5AG0JDIG4sGc5FGyEJEl+dDku6y3EmXWf4RCeumoTEFN71OezTTEpq9T8ZC0Z4DrsKZhTIDKLec/nkGa66Vw/rhWw2zpnRAYRIisnjVZXz12tIEKvJr1xNhZdqGk9YX2cf9QbQE2dPp1nRgu/kz5Ssx41apwU9Ggq6lzjl+Zk33+2OZntm5OGbAeYqY1EFJ8Yaf8w1/461/+dHSnP+srEi7GYDbWGu0sWCwwbhU38DGvCEQdbKvzMVsWe5gTDbftd8eCudVGhGO11NuMoVINdnlfaiwq9mfhl63dZxbPyrKQLuD3gh4HsjRdcoN1KfCWtMu6FrW4OMzWjNEcrFmprXm7BrgnRCdJwHh9PuC2352YaSNG9STKBHy4t/TSq5SvDVO3tjmowrxuite7nlpIJA0qN+9H0GvALWiqXiQRB1G4mDUoPNYJhY0yiJgSMzDysXF/7se2QsTizjV0uowwqcBIjPujE5fSN3KOnoNZzjMrHjh1/8ROfsJjyP9Vha
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zkBs9CsOWqvysenBe4hcZPvtp9EcS8zzunnKv31+fMdqLflyVJgdWNTY/tRC?=
 =?us-ascii?Q?/WcPUj19DAZCBje+0Lal8EhXuhQFH6eKWlaQKaS+QOormkOzaULyDmr+7Ie1?=
 =?us-ascii?Q?n7G5QjxDeEaCR5UBP8+/57rH+T1/94wISyKkKHLu1+2R3QKMSQUN8id1/pZ7?=
 =?us-ascii?Q?PQU1bYE4AtDU6imkxlFuI9/y0xzUdH2gW7WD3wSwSh08YSu3Gyu7e/nJL0v+?=
 =?us-ascii?Q?Dg/jsyaWc8XPMNmrReasfR3hmFKdS0opMqEtCU6BauiyeVW+C4iBlaxHkYzf?=
 =?us-ascii?Q?BYGRG6VJBGOsf/AMlz1G8gDfoNK//He/PJ8AAgxbR/YnUoLHaT8d16ngX+NQ?=
 =?us-ascii?Q?qkMoMkp8pTkZS/JBXowMrHH9eI+jVU7UU4Tm8KggdQ9m19U9jCN3Cy+0OmVf?=
 =?us-ascii?Q?bTSRlmhKHWqmJVFQIjwC62AvC315jehLxJCU0Ot7KV7TQG/1L3lyrzXGdE1z?=
 =?us-ascii?Q?2DsZnZoWlQJHpBk+ILS5C/b6TuvQyIqmgJ2zd17KXiWIos6MNdF+NrQzxnkY?=
 =?us-ascii?Q?B4EX2AvFzebu7ehngtVBj705g/OJZVoAWfPO8syrKghibr1q/1M/eCwHJK+8?=
 =?us-ascii?Q?n0irxO+Xms7eb2viLY2wD2d4JcOcmRn7PUDpohFULOuToZIpWeqbVKb0pzOu?=
 =?us-ascii?Q?LyyWh5N3lNFVoRUUM+TFFgCULHvy49dBrxOZvVqs502jt8XuJsQAZxP5EbR9?=
 =?us-ascii?Q?Vfx3yEGJcb9rCjkl7lKc3HFpMp/NoxDz+ToWtCsy83Ss4OfF6VO/W1uNS75N?=
 =?us-ascii?Q?LwJDMaobcVGT4OpEC9WEdAyoUEFuybV8qsrXvlHTHMorD03fxHBEtF/r2rwJ?=
 =?us-ascii?Q?WHwTyqKUpMZ81gePTw+4JKznQfJZrPgQnspVwCOMPeMM4gtzJRILX6pqvDXu?=
 =?us-ascii?Q?11Lx3AMOyo/JBiAuTvHCjt9tBK2Ub7SlKwqAvhdJrCSER2autD45g8xnKR52?=
 =?us-ascii?Q?xRY60xsxyfMEcKD6FxtzSkjhnSVPV070F6eXCVDBr3E3O760n6yDTln5R/tP?=
 =?us-ascii?Q?gjAosOVMPbZtkOkWsX8JQBK7GMiXnEmHXyepAF1IHYeqPFAEijtpi2Qnm/qm?=
 =?us-ascii?Q?L7ZEASO/VWAerS6xvGvUmWx+GdJeKrePQkTWsMwDfGcBYU9mfZOcRSUmQtOY?=
 =?us-ascii?Q?AG/Q9JK3rFp2GRLHqZI2VmH9bbC9Os9JnEljBWkDqHfy/fV6BnYPP68oeVFB?=
 =?us-ascii?Q?7+miCzZS0NGd6T2ALXjU2ck95zcDvFg+0GAdl8oFgnkP2zyQ2SilUBhO1hAK?=
 =?us-ascii?Q?DTmh1mzBdDOR2DcNSsrWWBgSN6ZI/CgY+omqLM93lis4jYN1lP89RPeMKN32?=
 =?us-ascii?Q?cdKvZfLpQSpTQCA7OZ6FJ+vgVNai42ClL0d5KRAch9gaw7qMbfye7zznD2uD?=
 =?us-ascii?Q?X+N+ln5gRfZM1G8TsR9rvCHtrgUzD39bIwusLZIWeFGRUvPq6NqRPyN2h5ZB?=
 =?us-ascii?Q?wkgzks1YVPfO5UamD8oO4DUAprBOKt9f7sN/aor7JWkb83HoaEcgCt6dbdoV?=
 =?us-ascii?Q?k8YbgrrXN8KB01JkA6OCwn+mWESsiS8sniHZz9wb7XH2D4n/eBCnuGxDzbyV?=
 =?us-ascii?Q?fcKP5OlrpXU27DZx7/ZcAYc06enwKEG0C53pzTZ8b+817cAPxXUnQQP0hx7o?=
 =?us-ascii?Q?+6y75rrQv1/PidwfoR2Q+4IRvkZeKvvR+pxgGUFfY0pQb9TO4+Cb5qmQKQAh?=
 =?us-ascii?Q?03cTxW4uCCyNLNDCmiFUH1bQb/fpNs3H5VUO1m8uy5yc2woVA2bzhqzyfiQ3?=
 =?us-ascii?Q?6ZQMy4cFdg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	mUO71LbHwnnpszwYtxzumriolIrkXAgj70y3/w2gEzygyTUpngNJ9vzjXuISVAJqw3GmBxuFGCuSkwQsfNPD8f8Tt0qmx+i56c73wADVTwVhwsu7jPKJASFb6KLQgq32po571U9/Nnq4jRy/Ao3qy2pdjKO94WeLqjyieuXnwR1XFMDzlZs/VWJwaDqZuof6YZ9+AHO0CKe7nxsWXT4ccfRXqMl2aUl6iDUi0ssURfcxeqDKYN+5X4OWt3PgHPWd2uVTAnApQ/eNBtx5c4h5ub3DGWCqotiTQWaNIOQKLPorPJ2ZZgdTkNX9lZF+Dv1lRkPRy6J+rAoKc6UUllc+Ng==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333ca9af-fbe0-4149-c033-08deb0afd355
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:23:55.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3qoKalHrKjt/YUmfWnyGCzZmr9GVopxnBv+NXbJxikWGQbB47R39zADf8CN2eNVaWT/Ahc1BTXC9l9RgBF0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfXxIWvJn+H2D6h
 mDEsHeUokRz6Rl6zCYCk+zxbmX4dGld2wJ6NnQ6uxhC1lGmm72LFNfi+oe1nC5JTJo4HGMlGsPS
 bFvrnfk2B7lhsqn40dPF0OWlCPV9gj/D7td0E/30RMsjmTRxzNqR83x75z4OGOXwZbMCaQYoYzQ
 GqN8rXHd1SDieEX7ntdg1l7McAIyO7XnA8WJOIxufiHwRxeFqqm55CViw80Bz3Co+Y28YreNVpL
 /ub7rVQmfEIZP1AV3DxFe2KTyIXNhLZO4yg4F4Pn0GcSJ232Vl9NOLwvC5k3/XXuMvJ0dwms57k
 d7aWiQUOpKdQHSEf0ULocco6eyrz2fXAA+1AoEMdtGPyBCwvq3K0dyyjXOEp/gKr07IFMsUF0/u
 fBmA1LLsrrLvFSX9BhIBZMte6JTrOeK6ACpGHobU6OXfLynSDjfi7qfTaFgqL92nuS2oKwaOsq+
 S+X74wuFr5OEL+bjHdg==
X-Proofpoint-GUID: p-hOAKbvCuqrVVU-e6CfY77waGmIZvRU
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a040aed cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=iqG7azt2_bYMrk6mVzAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6k4HFz4pvXthGVtvR3jRaet3D6WGv4cK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236920

From: Chen Qi <Qi.Chen@windriver.com>

If a recipe can do stable version upgrade and the stable parts of the version
is seperated by '.', then it can inherit this bbclass.

By default, the stable parts number is 2, which means the following upgrades
are stable version upgrades:
x.y.z -> x.y.z+1
x.y.z+1 -> x.y.z+1.zz
x.y.z+1.zz -> x.y.z+2

Recipes that have different stable version parts can also inherit this bbclass
and set STABLE_VERSION_PARTS. For example, systemd sets this variable to "1".

For recipes whose stable version part is not separated by '.', they should not
inherit this bbclass and intead set UPSTREAM_STABLE_RELEASE_REGEX themselves.
For example, openssh's stable part is separted by 'p' and should not inherit
this bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/meta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 0000000000..13040e541b
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and we know for sure
+# which parts of the version represent the stable part, then the
+# recipe could inherit this bbclass.
+#
+
+STABLE_VERSION_PARTS ?= "2"
+def get_majmin_version_regex(d):
+    pv = d.getVar('PV')
+    stable_parts = pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
+    return '\.'.join(stable_parts)
+
+STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.\d+)*$"
-- 
2.34.1


