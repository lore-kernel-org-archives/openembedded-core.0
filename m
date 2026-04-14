Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B89F531F6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12883.1776148695469660823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DywH9I6P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E5GUW93736322
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1rHP8mlALrVHXSOZ5v6CyXEe5/h5wkOz+OVllKkL5XM=; b=
	DywH9I6P86oeC2kgvNG2ohA/PzE8zADeE8C/NS/FtYLNxr8X09vq4Pv4RXtBE14g
	E7hoXUsypkih+bYA6NOpqQiYL6QcO4IOVR+8sJOB++fs7Tgk1nK5+HlqsQ7RLJrK
	C8STN5ToVAIW8NE2IK/AekhDe6S0irmyMrZnM7u7xzJHuiWgWv30jPbQnuWvEPl1
	wd2OZqAmIURF/m+OkYqTtRp5LMJjHvmsd5cuPng/hOVrNNGKEZtWQdbnGfwGun8r
	BAe+KWq9MXdZW7lBsEzKm8NdceTD28NzakcGSnc6lwcPKv/MHhATJJr8J4J7w5Ew
	FJvDdLWG8bXb0LrbP58Edg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8cek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djDtwfhYWe6c+zF6HzYRJ5/vkCx2AId/rvjhQqu7aWY8dMh3ZikMPluPJdA2JSvUwFwDPinmbXHtfYuAFfH1AyWLePMQqoHkHBhpB1SKsKMLNsiWvCLW6g0P6vS9/+c4pru1CRpkapDkurrHHtL4fOb+HP8LxY/oRG8ujWJTwyTfhEBHrc2JHbFyIWVI7vxFjefy7GOr+UbhNCwtgjNEEDoNLaVhTaLJnu/bNkPCEsUwSsejn5ZpO/1bBYxIBZFHb2mHov00REXdto5WWEdYO0AtEeBVhQcnnG788EFPUXmDaIt2JeHjofNhmbf4AXvOIX1JQAdVx8gMBbnOYNOuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rHP8mlALrVHXSOZ5v6CyXEe5/h5wkOz+OVllKkL5XM=;
 b=Mt9TeuFsU/CHGRZb64U1+saBGDwzsH7pnEpzv2Cd2EidOtkPaPKGB3plFP9p+nx7ZMbC1xUsCKEBaR0Ybzq4MT3Rx9vrRmFmi5PMgEYA5RGIV3HOmra/8VhQWqZ+gVYfYBql/1I9mZw11+HeLCWp1ODCWpCzRqFRx8SjwnAAVQncop+19jtIBy32jo0M0GGCQ5PzvXr1UgMI+H9QIIvVv9AYKaZdvoz39X1pm0iVXCXRSr933Q3PtuVAjOAXhKEaGrOM3jKQ8jbmh4wLNSYzSVk1NHPwi9zQiDQmfj98SIvHGmFm4U+BGZOULxrdvSa3Vh4cNzt4/OM63eMBDUdURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:12 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:12 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/5 v4] clang: Enable cmake flags for llvm, clang, lld tests
Date: Mon, 13 Apr 2026 23:37:47 -0700
Message-ID: <20260414063750.2315189-3-Deepesh.Varatharajan@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 176024d8-fca5-40d3-4dc0-08de99f0666b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0rjeIX4I8XiRexk36BWt+hErP0uKQfDKfAKJK6py3VqBrmsY7MoMn4v9dMM/RdvZ9MFyKOssmue2loBZwA92jtHslXqA59a1UNKzfJnobjZcbpTGOn8bZN2mAPTG/xCSZ8qjoEz0eBr5mwBx4A71/CFZPpOaK+G3MVxXfNrxeW4kfx/ekMdyD+4lxDC48TmxauALtW/So/R1PsTPistcS6gcIQvJDSkLvsLxgR3ofLAUTDskAM0j5CQ9Iw85BiDXH1M7BsehctJOJpSM7KCyu+IKut3h+sI+IhXBRbgLSu/lk6qdbJrDjReZMAIJnUF99TU10XKgbCxMCiOPezro4bmiXsyyaDpEIG8qzvp8KvqeN5HmjkKJlXCQnIcOeOq64bvuCAqLxCSc2eO3dV5uPPtW/gbHZbei19f5fDK6f0vcv3ew0v4r4DxJ9YXul1lyl+avMj4rNDU0EX5p8ZbomIwFUN7wv2GM6ysLwRvvC2lQKRp+LSpRD9k9eFvGXcTZW9laV0Lrm5kBCwW7EQbnuZTqvNbJ3Y+1Y7DXF8vNQig/spE0HTiBs12Fw11Mz1Gu9TzzEhuDdswvzq4le/UpC++QdbqciwkjTR3f4CUg5zTT2A1XpUmUvSKqyH4xY8VWx6nzkuXBcpHmCo8jeBKq90+abv6OHUOpxir+8khVPBgICnVsgjIjjDnR4P2p+HWJTEsc7nN0AdEA1Yyymn69CbD/Z83Bps1HZ8FZDpsDkIP+3lKqjc1uaBowlHihjKr7FIvHrkq8KRNyn0BenZB6Q+ohZjFtgIIscoRyk7AvDQY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F3lE4urHFb5/S/Q0j6HZdLCmObWHsuKDbVRsjchSrV4r6gtb9JnPfChBkXzX?=
 =?us-ascii?Q?1WL3oY6uSKeUHpdcLrMtk1lUQBQNVbhQYrnycSQEEWuqY5hidk2qR6PTTNNs?=
 =?us-ascii?Q?hgxqBsnEAKcP9792Tnu63jOncN50UoYAgpef3MjoHJRjZnqcuFIsT4984OID?=
 =?us-ascii?Q?IurdO/VZfyQj64iMa8o5YviBpf4+HOs0VizojWFx0kj3CvTmtXhTLpHolSMO?=
 =?us-ascii?Q?02utZMkVM8Y0v5aN0nQaSj9fHnQQvg+x2fX3FvtkDXuAihWhds/9qpRAO46t?=
 =?us-ascii?Q?LKE2WuZLEbguAvH7uLgkHjsfgk2oIwjD9a30OUp08/rfTeXNJThdU8pyabIq?=
 =?us-ascii?Q?LWq5pzZzfcL/mz2udES33osCZ7alhj0Zdd+v7oS/XPia2zP/GQTz3DyEpQ6t?=
 =?us-ascii?Q?zhG70K2B2wfTh4SGTUB5zS8pcpwMGhuaHlB/HqvIL2I+ocOGp4WPCaGt8BfQ?=
 =?us-ascii?Q?P7wqK75QLhZMCxsSlIngR/yrbQVEedRVknTGpSfDUnmynTPfFmLoPF4FaxvX?=
 =?us-ascii?Q?PV1E+HIHbE2QXjIJlUj9pJDsqpYf6NdvVSnPFFXqIIRbozhymcBCXNZ907An?=
 =?us-ascii?Q?a/IL89xJDAFWJp9Hdq7dvmf5YlDLq7gFBJm+G9tFBNBJMu1/jNazI98QtCol?=
 =?us-ascii?Q?NCT7dxXS7Qqd4dlcxwocG+rmiDFawAS/WS8khKcuFwU2BkFtncUQCCprBGB/?=
 =?us-ascii?Q?/9C4J++6pPoL6l8me+JY043yJR3AC/JSe90pwVIIZqX8MP7tdfpnWZ2mEpPn?=
 =?us-ascii?Q?VvIkUpgpC0fDq5nofzKIrQOMfmUvZe/Be8zE2ijMFZ78sVmzM4shCXCOLpw8?=
 =?us-ascii?Q?hfq5VvosKzRCQgs34IPTslu9+ZlFnIZKbNO3Ei7hipRZ+6ClG9bkuN3EDSNk?=
 =?us-ascii?Q?5bTWz33jD0Bcd7wJurvXuAftn2SCwjgejFAttR6jXnWaH73KIutd3AKSSh1J?=
 =?us-ascii?Q?BvBOyypZucIacnsXFR5Rke5dgf57S1J85yM1EbvYd8vgH0rDzdlFgcjEgxV2?=
 =?us-ascii?Q?OsfseSGJVK+p9UAsd95ARFgpq9brA1Ash0GgkLs2fEgHQNOidEfkQhOa1DrU?=
 =?us-ascii?Q?1aZRvWR0UjX9hQJ4/0ksnIvDBefeq/fBa7X9jZnAuskFfmIwkLfT7ghLWbTU?=
 =?us-ascii?Q?1AJVO0UdE3lIPJN65qY8ygSn32r0D54gp5frqGl4wH2ggYwFgzHOlDRnmwTF?=
 =?us-ascii?Q?gHHtyNG5x9DRsbJZmLtaoop02NiFKPcwDE1mPL3l0g7Cnw4/iXgta7MAVQT9?=
 =?us-ascii?Q?v1KMn65MOoJpowz85CyhD9xz8pJEM3aPWOWD+4760C0uyqWJqxIUSASdrd51?=
 =?us-ascii?Q?QFwx98ucHOr7EQDwLNRFrUVKy5tTwOp8lDvDxMJ2x9ueyVMA1/eufI3ANvhZ?=
 =?us-ascii?Q?OPI4KK+bXbDosHxwuc7T0QHoPp8FYBoHUqn753ZE+62awR9Obl5a3HVyIjd3?=
 =?us-ascii?Q?GXoJlZNHsyBB6ytzDaJ1luokXghuOni2kMALwzzqKkV8IYMhh9toUpPvY+3f?=
 =?us-ascii?Q?+3ccP38QXsE3yqK5kzH+8UMo87q3DTVhmTJVq/nEEsGPnTJknzfNtBna4Tt9?=
 =?us-ascii?Q?Kp4Lak6FUF+AqoHnIkVi60gV7eKptM69RVxoyFp+izimTtvDj4OQJ4b5zauJ?=
 =?us-ascii?Q?N2fczsiwkGUfiXIWcppngj7ScLSkfE3DLa+uG2beruoiPD5HavOw+PNUkhgk?=
 =?us-ascii?Q?vN4Hcx55ThhFBlqTRa2dd0Asf7LtLhcf+Gzzcpav58gwH4waC+OdqO4xmqfi?=
 =?us-ascii?Q?T1f+6/s5JzbnQtiCNcr8wEI5Ervpcd9XPlZVCRvdK5fmY8JrnPRr?=
X-Exchange-RoutingPolicyChecked: 
	OHNQj0GZQ9/dQwBm7OEueXb74cJYXzZK/l5XjU1doayyI125wUglfIG8A8vq2F1Es8owsYYKi8ir5T1Fa80R9H10ZxgBNjli1ayAGEIBCV4qhUmi57GHsZUTuO82typzThqGGSxdHOy1dRRPkIixCDzEJoEqtmML0mXsOG32r9ee50zQKQZKkJfzreUIRPlTeWZKc94MlYypv8II1oYfWhJQOAhEsoWT8ZBDDbZU/zNIRA7uD0zanIUVagyoxqf4XzmHOLLIUxXnZlLX9dhQyiKaeoTebEP0b6jUr+2hzFDVAX6fFvTR0HUZhvTsYoUo4CLJI2XfhU9EMWolcRxJiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176024d8-fca5-40d3-4dc0-08de99f0666b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:12.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Uf6fx47231Grixjee8BJrU+6rVJtXVrXtEKEhaoKWgj6cSXLR62qClpEFMxZ4zwRiVRLoxWgGp2EkPtJThysNT/OZaUcbg0TF1m6Oah3iC8857z80+QtbZMfJ40QTse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Proofpoint-GUID: lJlAzXhFpkCLvYHva8S9lUlOTJSqjylA
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69dde0d6 cx=c_pps
 a=f9CidALejpjOQAc0YZSnvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=Q7J_BWS0j0Z7kq5DsWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lJlAzXhFpkCLvYHva8S9lUlOTJSqjylA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfX8NnRUBEyVrbj
 WgvDGXzQ2RqZV7opUUIQ+PYHfOodErPamRzf/B0g165SZrEisKmTl0KkTkMxBKvoTtU0vjvphic
 qLfFEB/zct+vAuVAdH1MEpgCfV4PkxIn7CSOscA1eziDE5GRPOaUMWb36A0TbFleV1AAvG2dDGN
 VCT5D9YQd1XIjcFo6+jaPzompOpcVDxDj+PQz0VJXYJ+ZuspWTnOUJiIWaEJdONhSQ2gq/TzzOx
 JZya1ggXmntL8Y57f8j4AF9FOVsOVt/a3PrR0BPp9MSfYtvDkz6VPTO8JvF9hO8fxzHe4fq0w6u
 ZTjzBvV+sh26YJogdWJmXui6PH03SlQrPcRF2yCwZj0BdxijOHxBoYLTKn8d1tgAVtFNbxuydFC
 +6rkDRf5W2G6+Oa1U7znxz1Zuxz6mB/Y0/V8ywDq4b6rmK/icjlpRTfz7qs8vLbgHVnyVbioMHa
 ACN51zJxoEXbUc77BBA==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235138

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the necessary CMake flags to build and run tests
for LLVM, Clang and LLD. Install the LLVM target tools
needed to run tests via llvm-lit inside QEMU only when
CLANG_ENABLE_TESTSUITE = "1".

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 662cda1b2e..080feed63a 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -77,6 +77,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e7823154b9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -118,7 +130,7 @@ do_install:append:class-native() {
     rm ${D}${bindir}/*-tblgen
 }
 
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
@@ -126,6 +138,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


