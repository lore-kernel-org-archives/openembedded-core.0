Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2704BC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:18:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41983.1784701099448478727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HlaQse9o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1663723a73=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M502Q8154658
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:18:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lEnmHvUemps7tSKcW61ZLn1izUf5ixxwaKma6WXB4yc=; b=
	HlaQse9oQJz+jedW7ZFlMny5Q6q+23p3D9MgPgYTlcecXquI3PkZf5jPGNYN2AZj
	VNV9yRw6oB8I6kw3A6P7cr9Vd7TQDnfZbQk9aQzrAXgfhmoynmZ7z0F1pWGJRZ5V
	zpv7UG5wVduihjKc6LX+4hUmqo2luY2Bp6nGOxqAcBsV9wrhyGnqidM8S6iC3KP7
	+iExuGKDJlwfkC01cf93DkonL5zjoqRDM4stE46IBNBZLwTs1tX/z7NLY06bE/ZB
	BhvvmA6KcMAv7ZCyUa9Jh/U1uPHkuRXeUqOzSpTAowAWzYnuzWL61SXS4S8BWDTy
	QROlcoE+KFmRU/KFpwJzhw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg4ryqdv7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9boAuF3+awF1ChiDMDMeRrmcM2Dew5jPNpblIdb7Nncc/N//dKdqtWRZnK8VLCEZ4jyFkW67JQXmeRGM2GhPgyrWQDJNBtywd1gRZf76oZaHBJQPoo3iI0Z9aAITOlKmMu5imf3aQ73DbJt7QvaBuddGgzPbldTP+4tpYAJhry43Zb6y3uadfBnL2PBpcwZYN+dIqRnYFeAu9czKXKzrumdY4ysPEsMiitTRTWLHxRxTelRz6o0t4UoCWvhzxek/zq3hgasxwqnpU0Jqt80VChFSdnudMt7lzVeYM12IJ78nsMti2Uej2fuvdWDBxQkZroTSURMnQLG/N8Wi04lCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEnmHvUemps7tSKcW61ZLn1izUf5ixxwaKma6WXB4yc=;
 b=e67tReL1OecFVAXpEaGoZZNQEJ+hkFe5PXq57giHS+uvj94aFEB/BDo+dqRCooEUlbg56bN/C1SlufT7sknC1yIgr+nzPd9B7PYqoV57sGODLbc5xLh8qgyswLGD00od1yQb35QZG9DK8/hBuppyhRimTk2Q9Nz34Mw6jRRKfCb12gQ+8FHeNXaXk7KXrjiscAYohJVq+4patzBBfzeoSkRC+jvtRrJHCWW49416IDeQ/3X18MQXRtn3NMmvNum3Htieyni2NMX2e8Jbnhxku7/CijghIphPm5wavJ57ofwBOaIxgE98YTcXFSt5xxkD7IcSey2DOtoeXN56Zwcqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:18:17 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 06:18:16 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [PATCH v2 3/3] rust: Move do_update_snapshot to rust-source
Date: Tue, 21 Jul 2026 23:17:55 -0700
Message-ID: <20260722061757.109411-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
References: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 888c3689-2fd4-43c0-279f-08dee7b904b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|18002099003|22082099003|56012099006|10067099003|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	9oSlMYDUnnT6k/Zp/85ZKeYF8Y/icXu9dG15Bott4y5HhJWMRk7xVzfXG8qCrAyXR1aqeZ1EIrmkh1RNuvAExUpZyEnCmQbHn4XwtzMINivFnjqqKYhOE8CuICvB7wkGv4+mtWKFhmh/8wWoXtbrcFQpQZQ1IEYZ1b2aL4zs7J5771rsY18aEp3zE5ESyajTd1MD1YwpeuN6YrJWC9zAKwt8jsM+qG1AVXNWM9NRXHsTlmy7ExXMhlEeyGQNTr6uf4cJuKI+SvlC5kqUJwgsMQtw4AQLVH2Bht1Zu2xV1NeOy/BgCYbAQxV+vA/bOjpzVfK6skq3OcwWLfZH1Sm6KdxDBJbfVI+NMiu0My0Wiov6FcIcRiLyj3yYgxKzHlD/zInbYKMy4ifOtJQhNoGWMl+/HzqipeUnxJLVbem0YvHt78Yx/kUvoQzpByr+fYPIewC+P4jG7rXN2M/bfRK3Z2bk3LBTAJ4fdCyoWEINrf7caqOBpgShs8ourUELCSm6kAmRIJEYeJEz4vU31imiWHJBfG2tfXgcYwNSYAU/8JsURuqc2DZDNzTUvQBzRtMDRnvJ4E0vXw58hibdzhWzjsfjfHELPWV+tIDw2NOwnwxn2IHm35AmnS0zA6ct+ub3AvUoqLKZNW7l8MKFpQ+wyOI90BIrYKO6xUsVmCD5vIEGOw0FqFgNc07ylb84ExGOn6mA+G3+KohXOSJgzBSdiIT2ky3O29zo4Id3cRGlmeo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s+g474ZTbRdiDFWPUPimTOCsrr4cF4T5JBJAW8CLi6OMGcF29m3Nkuse5RP0?=
 =?us-ascii?Q?idl4bNtstFGIHZwVk0rd8v3cSBLEhnC4pHWssD3ukylxsk2Zuko17r1gitid?=
 =?us-ascii?Q?kAFXY87+gnRFZuU6+u5GR/LhqvGC+VTqm8pkBiSOH+kCPy1dvuuAxbXEmZ0z?=
 =?us-ascii?Q?EKep5jcqDcH2Gu78vIm9Lhu9KGVu2OVjowpvpvgkV+yC8k9QeX2xYIc055+x?=
 =?us-ascii?Q?dNgWoe0Qf1ReTIZclA8ZNsofQVIWRGJY6vVoxHlN88UjPhmXTIHrZXPPFLhn?=
 =?us-ascii?Q?Iwh2CJrIRgb49A33MLhN4/q0UPL7of38l3DmKq/7ku4mdfbvEwFgH7JzBA1C?=
 =?us-ascii?Q?yAPDtyqN/T8w/8YpXQowpv0/1JQOQnvZeIg7QoXsWBDSEYmVUcsj6sej8MxJ?=
 =?us-ascii?Q?GFcRp3FdJJa/WLLr5CaxKwoUe10FSwBdYfhPiZ3z2ueAZWhxFmysghS7TQAl?=
 =?us-ascii?Q?rjqc6v6k5gjjJJiHKjbedvRHoGIJ4Nt3bFiuiogtmq/HdtNm9VAenD/7wntY?=
 =?us-ascii?Q?w7at9gMrFkTln+Z+EP2z8B7u3Ht0RX4OskmKD+WMhyrpBiLD10KDzKbCpwW6?=
 =?us-ascii?Q?hNj8qbcu3e6swvWdUXgw3YqhT/VTuNwVkWFX0pRG7P+pXcgVlAKy59EcxlgT?=
 =?us-ascii?Q?ZGWTGVIUMY0e0SoGQFuFozb7CcOoBi8oVvL9Xx3dNU/O+rUVYiPtBY2qTRWg?=
 =?us-ascii?Q?GpfE9ORuCI2AANwkkxIiXgxHBX1SV/jDktdLzmluXdNu2hT2l/8OoLN/q0id?=
 =?us-ascii?Q?GipDhkI4cVrmZOA73z0WcFpcU+Jq4RYXOdrlrRF8Nyx2rQ2HtUjZt0N9skNY?=
 =?us-ascii?Q?DPcPqIhsnt8PdAiOTVOln50+4y6k4AHffJ8dQZNTSdYhm5sThdR5zXGC9ix7?=
 =?us-ascii?Q?kMvr5j/DLlZX3VVBxZO5dYCV2khoPtjNteY48+LvR7MdHZuw1DhGQcxgfgec?=
 =?us-ascii?Q?5K5N3RxO0mrW8vTKhYGZHHfS+yEmei6TlU04nU4OOw/0GXWyU4zQmzjWHP2w?=
 =?us-ascii?Q?fBPnmlB4JR5JzSf9o75gBg1TeqbekECFSIdIsZ0tNjuSsyBBDXfrvtcLps5y?=
 =?us-ascii?Q?CXcgjymXODICPpHRrnpwSGOGVd8UCq1HcbL/gI2z59LzLhqDVqgL1ul/td7S?=
 =?us-ascii?Q?MPS5WImNht7z6VrlrTy0oblF7z6k0t/jN3TBt4GL0fJSpNm9m3xPmg9xq+mx?=
 =?us-ascii?Q?GVSWXTMj9ZxT070MivyIU51e4/FBImd90OwRErhRzoD9KFX2At4kPXt3128x?=
 =?us-ascii?Q?dzHRMoi6KJjlP+e3VIYCPSLv/RFMkutUaM8S9xvvlEyjeeZopjOg3lilhBzr?=
 =?us-ascii?Q?U0oRomztlMj3xBAXohF8gfb5YN2qIid5/pR8dfCxJ0z2d1TV2lh4af9yt/6b?=
 =?us-ascii?Q?UxiMQ0GbmD+vtTUMaXWsxZcyRFuq8budJHJzDS67W5h8yizIJ4n3fEPUSdcj?=
 =?us-ascii?Q?JAzqN5zfzmI21WjT7jGIw9CUY3cOulpTVUT4hdEOVaKekZ0F6c9yQPgykpIy?=
 =?us-ascii?Q?uKnSXnjXEmR8KHHY1vYZ/qbEp6W/sd26A6K1UHaIZYJMdM3RPFMjSP5uOXB7?=
 =?us-ascii?Q?Nts6nX/JUGjuywzcOTktliYknIHZy6AFEojYTKj8MyGdvNsabRYMoHbq/y5D?=
 =?us-ascii?Q?P1tmCenErZIgN2e0tzOw1GPQKvc0BSU8nW1dhHxaELCjz0k5BHVSsZXRWktg?=
 =?us-ascii?Q?GCpf5bPKDSR1o3xbPEjgJ2r51CSnWBAFAuUjzOJIP/XO4WdO/psVrTieLlCu?=
 =?us-ascii?Q?KlIj+OkyxE4po/z/LSKKDWzVA4zBirPAm60FqYhLHNXqQ0cQgG8B?=
X-Exchange-RoutingPolicyChecked: 
	T1HdJtgpUAWRHSvICK9urAbF4ZUnM6kZHeUOf1K5OHYcRI1M0mhona99WgWJELwbmw6g5PB9Q0/rujSijvLMRHfg1lQMaZh5c1HDEGKk+uxn1jvjxcQ5uFFCs825/kOrcVUx4WuuyzCx0xnljuQZ4kSbYxa1H0eVNqpJMha4BpQNYhcPrOnXVkO9wP1U2fk4K3qdxKPMfwrZ8oUSDiLrToEgsSH1nrr6CBC2hxcQO3Lmf2iV9rFjs/Dzqe+wncSDdKP/3ty0eu3iYNqXPZG3b4cs93JHZEzjRb1FeLr6yNlLtv9L+LdqvLBaGbIspI0+UvhKS9L3ZxA3HjHorrz3mQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888c3689-2fd4-43c0-279f-08dee7b904b6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:18:16.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrVx/rP0+SJG3cYh8wUhSo9+KZ8HJ4BnB/tuO18WO0+eIs0wajvWZIzKrKG1T7wkoo6Hd0kFkqeZ2U6XGaGzvmFNEypu4INjNoBx/l1i1Ho82QFD/QBFnDe+tAqdZYLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-Proofpoint-GUID: dJu_FncVeO4n0n0WSnCjY3_tYfhDVKVj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NiBTYWx0ZWRfX264YOJtJdy+F
 kmW7kHLx787tvRc1vv5x8CB80OelAQrWQdJn6+oeczMi67mTqq9TKLMfjCGLB3PfmJvrluoimwy
 do38LiSrFHCiSClAimcQFJdbtLmml4awpyJzMXuAugOCX5kTFscf
X-Proofpoint-ORIG-GUID: dJu_FncVeO4n0n0WSnCjY3_tYfhDVKVj
X-Authority-Analysis: v=2.4 cv=CfQ4Irrl c=1 sm=1 tr=0 ts=6a6060aa cx=c_pps
 a=COQGWIG0gBNyFO/LkKr7KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=M-5mPBX6iDpf5b3w-P8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NiBTYWx0ZWRfXwc7/OJHO2YIX
 EsZ8+yQX5OyGszJrPvGwWhunrQ9l2R//JgqFOeIYQLxq3PBnXbcE75HOVE0jG3VRMgf+R1mVv8a
 CaK14KLZwq1829VEKoJ0zSw2/3EtS+ZLG2dQfba3mO8yRxxQjKZN49eqbwaEi9Zv0kK7xhKnmga
 dAAW/Hl4U+t8x0XnrEQRNybYeEj57zXXiLW17/NjPCS29kjO3vTEBoGLfjt6BUm/jDyVRDdyK3A
 wpG5AcRu8q4oR2dWAyYrJj9mxFJCkw4yOwGW2Z1mA1BcgWKoJPStUHj8OMFmHroJqTm8kAQx4aL
 5ZUj0HTcJDd3z5q07hakEAYijehscfI9E8N1HDgLeQ4cMsw/Pl0q704PlIngINVn9KksXQOuJ18
 T1ggsYtcXCbIcN2lQW9M+wQ+3zW7tHPeuVBS+AxIPxJ0vnErHeSwlLcAu/2koqGTKa3JGtzSojG
 IQmiAn0ddfFPUT9VlnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241600

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
index ba696984b3..4c29b8e3c7 100644
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
index da042ffaae..e75c5980f0 100644
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


