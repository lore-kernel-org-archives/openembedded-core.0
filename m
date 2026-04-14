Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C4F531FA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12885.1776148697334341030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=du0Ff/+b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4OeI13645336
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YofkZiRO16yPYn+GHnzr8Zzm820KEQ+SnhJz1tOnWQQ=; b=
	du0Ff/+b180dl1hjnI/1Vfv+r8P5bBlRb2Y2MB021UATFteq9QzpQnkxdkKhQBnI
	I3g6r1yOP/CS1adQtfltE+NUpKkEl09giCo+NkQ+X+qJhDtRlpxNeld9jaILyuWg
	oZXmmVudvCRcfgwdi5Oi+PgLKD3U5KUiijZSNtXcrzedSQjxTYsHr6g7F5BZ1mb0
	7Rby6RfdrhLZ9W8Sp8HK5SBhblMSV4ihf0mn5HkTCg89gd59jBZIlXT6ltjWsJrW
	2TXgkZPnd1WZQ9tXGSH5cevXVH32rMSVh419U2ob+Lgnfp2zcELJaVXVOU+JJ4S8
	gnPf9RodqWKLKnbfQprZqQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8cen-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcPRYm5f6m5yLiGu5hziv+b8SdVwzH8bb/JrjDlI6/MUYnkKU+jeHvCnKTBrIszzrIVEZ4d66yWaOe4G/bc2UZuiQ+zeDTfmQ1oXdO6hNNp3Pu0y9y30xgjA7DlUrZNU3POdmao7TIHLND5OKu9oTv76eT5YTU0zcBdhPmKJDPxQK8Pe2TUcjPKHH1QItT20ldD6fTxrD0LCcRbODd7ihK9jTJco5c8OC+lZ3LgCPUw7bDWg3HdH1qV4Y2stsIwG+TH3XFxDglBMHvDvuG4Nz92n0+YSYZUwMlEJ7zKYqYhc99f0cITGnrAIyjDusVtakaZrw5O+gJ6TPMA81VSwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YofkZiRO16yPYn+GHnzr8Zzm820KEQ+SnhJz1tOnWQQ=;
 b=KCB+GzHHo1qEDrWx5L9OLQ0bfsQy0gDQtlf+imlYBiJ7j9xQJ0mUqD2jDZuGRVI7zp64ZtfLvTDa+P/SH4zhBWe8wzGmQxPd4sNHaZviG/ltE1W+tDyzPh6hg6YcSUGbCob35veqG9/g2VK4qs7GR3PcQmZJ3spV9zf5X00SIX+rvni13Rh7iwoOSN/eC1n4gUp6HfJaocdQ7wLwtVCwNxz2+OLBdufMDbvUP0Z2Y978dr2QA9GEzRhyb2mZZAt/224SuKgYJrcV6NOaEssg0xJLh43atiI2B+ZbIkPH/PHaHFE/chTqHnEF8mY8iqu2kk8AhwES6TPf1ODYsonJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:14 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:14 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/5 v4] clang: Set CLANG_ENABLE_TESTSUITE = "1"
Date: Mon, 13 Apr 2026 23:37:48 -0700
Message-ID: <20260414063750.2315189-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
References: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: e3787fa2-d14a-446b-23e2-08de99f0676c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nV5/jvRPmpO/9GpJRHGGNCa0832cLR0ewRkYT3UDShX6a/zUR1/OgeYh/PyXYLj98IyTbd19rUpovfhIHDh3VtM/stpkBI9iIWFxVI4vtzyQwQi9z2j0QVehUDgUYNjILRd/CRs36hZ9rpBCqIrACmlSL7EZDyfGdT2bHN5BlS52vQGXZG5eRVMqpafaY3pEbffC2oQulkaVd+xi4J/mLp2MTEqNoA76lI+hIHoVyc9a6H1SEJTb60qXBM8leb90zPAKiVKGTBLrVJyP5mDDBfqKgP+eX5v/2efHkUkPT7VZiQgxT7SFeHKIu9IhzENu+TrpVZujXWDI+YYjDWtumOOgC4kAZ4aiK5hQjGNFLHHc6qHjTSGShN9Y9pGbPo0ac4Kcsa0bWYqbgWdmeQYYnAJUBIBKcfAA5y679xFEAweyrMHbDsRs0aBfNXkEbRrKn8zA4NJ5xLsJimI0X8dwTp/ifByvK4XGIW9FJ/HxDiMC9t1ldw6g26MQBMcN8wRMLjB8J1XEL25EuKdWVv/c28KL+0HhHItJkTMMwfxKIPS1CNsIGTh41mmUfx1ibo6hbd6vQrHdKbN2ot4rjKll9527TF/LS95WNRYOSnazqZY10UGHZO/QVxRA08csA0Wj+yZPkSN8E+guuFemUpW922S3euyVZaOnVpNFysSPzLZpljAM6XDvrfK5dztT9g/orylvnQV4+02dYl7/5H1TnHpvLbuC2x37T+RVQVwB96UPA+BtZW6fQ+FL1EuX51pEu0H9CBK4kJFhCQfjmmbYGlsmu8okyJHWtp37IS9MQ6g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xVh6xee+Ze6Z9Tipc1R37yy14AmVhZlk3WGkB/5bcv0gf+pT5V0+RmaMzsWr?=
 =?us-ascii?Q?ErpEFfDHI9pMiDi4bui8BVlpnwN6DRaJJHGrX2fpvwtKmBx+6ZvKFDS0i8Va?=
 =?us-ascii?Q?jE59lhL3KhKEL+RLNjbiycObOib/AztIu11kWa+TCvqqsdyp/DYhuNt9Hn2k?=
 =?us-ascii?Q?i11ho9A/d3AvcwSHfrLz/h1r34UUxCPf9+YXQSGIch69plHgeN4Kz3npsWBx?=
 =?us-ascii?Q?IxvdS3nP3d/3oV3KgamyuNMAuqsksq6DfJ2QQdU5MyEdvBsQJM/LbVvHbRyl?=
 =?us-ascii?Q?8ETzVzmhgGX/5IgUV7uzPlWOgu3ruhDD1Z32BNuRuNETDwlDknMfaXRzSFB9?=
 =?us-ascii?Q?zGgSoSwHV7ivnbgA/4MWtEVKlA1xO3xmhXS6tJguWIDeB/wrPI59JyTwxUWh?=
 =?us-ascii?Q?sSVOxv+4hScc61pxmI2Zu+95ATCxnOOvFMI/DQu3wV0y0m9BekgfOLpW7I0h?=
 =?us-ascii?Q?oRTSJi75G3XLZFGGOrRvHVaMlVDzMk+a9R5N9KxTVQuAPhzGqPCgHwizjD3h?=
 =?us-ascii?Q?8SeGl9DRrD0HFX8s9WGfpHLxmLzBjn6Pn7HFvUDULcZYnJsT4rM9KrOsJAAr?=
 =?us-ascii?Q?e9nXK8BNTobcr7mnLAZUg0POBPQghLmo4tqEle/FW6EFmX+CO1inpIfzyARQ?=
 =?us-ascii?Q?DRL7eAKixr807OoIfvZ0UowdtIotcybx8+zUrOTnv81Oq6PSTOTXG2Ag0MiA?=
 =?us-ascii?Q?qd9RYG/VTqhxJgfSQEGf2eQ2iugAVfdfKyUDBb0HwlYk+wkUUcvg7zaNoy71?=
 =?us-ascii?Q?6H5wLHmEUO2xDXuqbZ+/U8h4x7GllOo2AHlQHCzcTiw2fj0QOhs9FOoEmmTN?=
 =?us-ascii?Q?295NownG4kLjc6PF2vmBnoc1ciTO46izgd6xJLoLy5UGXO2RCVmT0EsJ0Ntb?=
 =?us-ascii?Q?kBpbNvwrsprNHEJHVwdTrRs/OO78grUo2rEojgX+IwxdOyXE48JE3ECchy2+?=
 =?us-ascii?Q?1mgveiSDynYkZwihoEdmFvbdOjYhNnmflZU1ZbcPMyDm9o8nC2QwI/sDFw5z?=
 =?us-ascii?Q?SX3YxTuood2llShtT0DjpXsuV56qIlfS9wWXB0fLcT/vM+WNDPiiTayx/3bR?=
 =?us-ascii?Q?3rL59GQVvpnL1y2+UAwO+BhlwijqDE2Ihfg0oyENQADAAwQ42RsuDdoGEFxA?=
 =?us-ascii?Q?6NB90NZbR3dV8l6JSXbdpsHv8m0fKm792wuA5KykapI9fd42TZCUU9jV4lb9?=
 =?us-ascii?Q?IZOaqxk5HIJIIhTB+xnV5oG5bocwdUOYJLZblQQFwwkippDRzRgF5OBz1NkB?=
 =?us-ascii?Q?nknQ98L6r9YxVD6CJtYbnhYusn2U9iYUNgYRleX6YW6KATRbBdydK41FK8qR?=
 =?us-ascii?Q?Oe/Y+dU6p79XBxQfPfhW1TbWZGk+qB/72hRNpWlhUnO3xWqvhXS8GOjR2zq9?=
 =?us-ascii?Q?G4A5jwoPF87AxGyiwUKAs07XWPYlx1Q5CMrea1lXVEgSQ8ZxMlsRvoC04mdd?=
 =?us-ascii?Q?s4oQfBuQJGUYlzxFHnlc3GerWq3GVCRuJjTmP8erejTi+B4EgDotIHNRkTuS?=
 =?us-ascii?Q?bFV/PzJc2egum2x0eK3ZGB5foUkmVaDXLPosAKe1QVk52UA6zUzM/+wEXRLG?=
 =?us-ascii?Q?Kj2nVpF2byGmsWUKPqSQUkk8pFZm+/XNUzsU49iaHuvRyzDsLipSnqBqVMwH?=
 =?us-ascii?Q?vb/BZPNtbULq88jw6QAAQO/m9P85Yt1ixOGYMtgTvlFr6Dbq+EKvXfLsm6U8?=
 =?us-ascii?Q?IPiOowrCi3I0v3yCwBDPZhCMbcisny1jpHAdYpcy8F+aJ8jUGf8RL6uHnRll?=
 =?us-ascii?Q?AFOu81CoAgnPh6joblBCOJ8f7kD/SI/n52C9lDc0cSfFZBD92yA9?=
X-Exchange-RoutingPolicyChecked: 
	IXqCRYrE7a0vuSCBZFctURSwwcwSQhSbirBtxHhrT4mlfJbz06LpvZm4F1Q6oy3aSCwMzDNStjlofeMJLQDwjTsM4wjF9LM4XLxqgMuMVe9oRkiONc5P+3NckQnkWWS3clqgFogyiV1uXZEzvQvBxecmrfr6/4/CnhNryB8XU9z94zKkQEeHwUDlajV3Ct5vq3q2XHdG9+ZVmM1ZfKcjoU5c1gaCEaEIy+lBFbRwqtnzuiXEVafAGZN7/5BCw3WhQvS729oSGFhqCzK4bOxg36llxzX+7lb2KP+jE23KPv2XQdlQTTxapCuqu0WZBeRKs8ObGJvXAPEBANR/gvqaeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3787fa2-d14a-446b-23e2-08de99f0676c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:14.0135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlatLYHIBqqad8fhloQd02mtCqbTbsV09k6no12uelb31gDKynuaenCPbfW9irq7vvr5pI70aLRq/sR2KPOEhoLpTu4lL8k5VNCr3R4GpfEZkltVAZEmzidrUMlhQwYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Proofpoint-GUID: 6yJRC3ImbpFvVbyUC4aXV78GVr7e71xH
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69dde0d8 cx=c_pps
 a=QLNV3L4FYR5wOtQiEb8zVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=4jQ6Kb6HCuUS0eZ473AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6yJRC3ImbpFvVbyUC4aXV78GVr7e71xH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfX883b8pBEcMaS
 qhnaDDtUMnj08VmiGgPyVTJi+1upvYUtexhuaWvSMXCGoi0iDnZtEvvsGQFs8iF6KxEQRm0zL4u
 18mksWFCWhYYIpbHczZbEVo7L96FCdC/E/8DFlDGRVuB2m4OPaICGhZLSij07b8lHTzmBdowK9S
 9L6ARPK1BdXXm8PiduvgIjgE69yQXEDqNIWUwhwk+w/qxhrkpn4jjSH0WgUGpHSPsE8AfIzElXg
 Ihwm67qHWnrdL8hjSu1QVJwlMXbV5j7ug9+rg5Q5a21zo/J09fAiM8mDe4Pa8ERmZaryKboRlBS
 hJYRszLEM+WjmEzFXE66MGJXCT9RCWh3KbjGbmPkf80ede8/E8k1cWh/YI/0TK7DZNRcade21SG
 HHnyrP5Ew1j4QCAFUykTvvIO7ZqM8y/srvsGvt2Vugba74TaCtN85YNh9F+0O5ZQLIOoU+p6N/E
 uHSJP5mxuseubyeETcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235139

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

While running testsuite set CLANG_ENABLE_TESTSUITE = "1"

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
 meta-selftest/recipes-devtools/clang/lld_%.bbappend   | 2 ++
 meta-selftest/recipes-devtools/clang/llvm_%.bbappend  | 2 ++
 3 files changed, 6 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbappend

diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
-- 
2.49.0


