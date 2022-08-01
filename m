Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8137FC19F29
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:51:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22326.1659343914544381562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qSA7IEeP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=521249b48d=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2716cacm001950
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Aug 2022 08:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=w/Q1sI97Z/7UnKVCyRHRcFaOLfxsj+qbaa2GWUKtXuk=;
 b=qSA7IEePAfixsBQhvc4nosIGkvs1yf/gOWDziZxbciVYz1k6hpmq3oL6akDAf66tfKUZ
 bzZ0IU7X2aDCy9s50E2QLxfo+p/+W8f4trxpzDIBx+a2HwZoGT+oxWjFOcCPe2XCwhCq
 y9GQiXIxhJ6O+XlV35xICG353QnPeqmESP9f9qnrxr93atNSWj/1+b9NjVccyJf0eKvP
 H63bTZQFgRFBh19nSKJHFDPhyOWfBwnGOZ/J6yvAZRqdDPtiZ+dS22A4NsO6K8HdmhU+
 swinD255i1ZV6jtT7D7cmYKOOclp+a2JER1vP66PzyD1m2ByYgfpUDbb0ojPg0Qgxw9M gQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv21d06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 08:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLL5oqmANOEzv63SNgZ1NNh9nt8xczBz6me21r4Ecn2u9dueSyMU9vN2zSxVGyOOYqdhhSP4EmM6GhVfatuC9gQnlaKjC9L13yvGAH6hkfJIuQ1AcRr3ciltf53t9Svey8n6qDCTluExNKYSpM5e+nAtjNJsxto0nPNzdwQxred6oJsprPXy2qD79lmPlbMoTqrgnSHP+g6NGiFl1oUvyOpC6v/S16cNEM4mYG2E46ybbss79AKHn94qnnvH9m7qp62npEAz+Iz79g3z0rNW+KGaXlZ5kiAYjyryVItycwu0kPmYoKqkS4t3pjv0n74brL0qGCDLA5u2BUq49LBtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/Q1sI97Z/7UnKVCyRHRcFaOLfxsj+qbaa2GWUKtXuk=;
 b=V2c8wm06rLGaSjpLVFzMS/v8g/d9ltOLeukAayUdNyv6HBCbi0ohFDmf28NGpxzDd7Mec6rvUdDExOfWA8DYnv8CJInT+LLDWcULLzcyAgi3OOjS0uRjhM7N/tHutGzrGYBPrIjsqzG8oULNIS2Y2ojDhwFQsFhfvsflknoKGLDsYrL7TvcVVEIs5HxjwGj11KVuYhXqmA+N5DEmnZCZzI/fjXqSO3oUgdyj40andsxrgPTmCMm2bT1/LZHx4FelGbd+YE1N7pcdfz4IKn7AjROq5k7wAcht2GYfdfxfcLSAAiNc6BcWgbHiqPW7WY4urKqFF+ajDIFXZdeKbDIvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB4347.namprd11.prod.outlook.com (2603:10b6:5:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.13; Mon, 1 Aug
 2022 08:51:51 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56%11]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 08:51:50 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-modules: Fix build failure for kernel v5.15.58
Date: Mon,  1 Aug 2022 16:51:36 +0800
Message-Id: <20220801085136.38110-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 961336bd-faab-4c1d-601f-08da739b1338
X-MS-TrafficTypeDiagnostic: DM6PR11MB4347:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4bLn9PrC6a5X9lMokNLDJPVAkeeA/dqLhOfT8iicKFiJVbTU6uB/+X464TnT/+QWkdVme72fgRSqMFgTJhdCPkTdr/JWjnFoOTnJIND4/vyU4As8C98kO52ayTtZGIvx3ZVkI48tjO24crKH/j0RcAr6qeXfmbcv4kI5QJeFnzUxqT8O2Qd2I6tT2SQLp7G7RN3u6kvPsAO7NTdyV0DTMc48SnO/Q5gDMBIaDi3GzWCDyVUzgiQERLmJQ1IHvanFwysKgEH/CzmZR3pCRzsT1k740ThZ1juYaKZIFTipQ309yV5ZayeESy3o66HUZkKdtKQaCla4eiWgkFHgDJDRAKNO7/7tlqvTMSiZTyaTT95WgZYprqbdT+XKBr37b+LoGeVTERZMfR9BLBG7Ac2mZw7kLq9hYAbPQBB7wpKAjamEEzDUJlYvBQ3CuXKxQdKnJf9KBtEJ6S5JX4pzLZ9amyghjHW/P0d8avSo87g8l7/Jz2H5AAKwhGfUwZXPp6KPPaIvzBqdTIZpxChZ496Uw7ESADf1dNiU+BPDVfwgygXSVpvOkU9MdcLIXx+3eS0wESI6515SV2rg3574JKYs/6ru96XC4Kn6zRJAuhGvcpt46wiJeFO9vBJmCUCFoHZuEbCQnbWxdjHywbr9ViZQKVaGTv2e1CXlZrbDj6+Nkn/PZxChIepadiokcojKAHz1DV7+mCUgcJxBkek6YQZMZh0xm6gacmcK3VcdZIGcoSxitYVTUZjuNEo05gZz8DBaafJyqD9XXUSy37+/o/KZGoYGljLAyKSGrlU9AFHSJ3eHuvVmisxibepPbCqInVz3tbWk8DP6kvN54lCoNHuwLfFwS24pU1OK8KdMjRD6Vwk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(376002)(396003)(346002)(366004)(136003)(6506007)(6666004)(52116002)(2906002)(41300700001)(316002)(83380400001)(6512007)(38100700002)(38350700002)(6916009)(36756003)(8936002)(6486002)(478600001)(5660300002)(8676002)(1076003)(186003)(2616005)(86362001)(66556008)(66476007)(66946007)(26005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7kLEXV/a0UDlZ6YCCiL6F13easazf7Ibg/Et6gNVsWYRrUPkLYHnoHrtn+6f?=
 =?us-ascii?Q?I1c6ApKM67zrxKjeLnQGubmS/95sUygAK5wMc6/U11lTkwdSvmdknnD6sdyo?=
 =?us-ascii?Q?FssHTkV0z+WXyd+W7ShsDRy2DH8yZ00RbmbjDAP1kufyhcARn23ty85j1Vyi?=
 =?us-ascii?Q?rcGqUHzAe0G5Bo8brrIHyTQN1qsLaptTmU7IcuB491QkVjW1h8nTp0TU576z?=
 =?us-ascii?Q?wBEJlX0dpTTaLQRenU8W8jf4w1DUy9GRKdWIDqS4XJLJGQy6/3fG/DiRQICd?=
 =?us-ascii?Q?wlniaH09rNB/JiVTitVLlcAjOtZUGf+f2yu2hQEX6K2htK+QBaLKEwVxuNOR?=
 =?us-ascii?Q?pqMi3ZjjWNA37wy1gwqu21u21p6TPOzmqFr9TmRmbQE+71n0z0QO1ymY0NMm?=
 =?us-ascii?Q?OoA0ydeGopTX1u+xsfH9zWIp4LZyYvyKP22bWbuBEnb3lPqYPdBuJC61MvQ8?=
 =?us-ascii?Q?ZeIdeoIaKvhdWqSUsTd7K4MPzkP6jj7RtHmoeAWXp6+AhcU47cZNUXqVExia?=
 =?us-ascii?Q?loCmopjhAizdPcH5kt2g6d/mmvoFTgtbSvOHqYPGDxAKs/PPQxxZq57Dr6Eb?=
 =?us-ascii?Q?NBXt63UOARBa/woVajpQKtyM1YWrmdttM+p/r1+sVgmY84cdPJrvWCHz2oHJ?=
 =?us-ascii?Q?9iGwf88LXV756NHFqg8idLXbILtNd+mglG/UM4D2M4LbHPUm9/FuzKt51HVq?=
 =?us-ascii?Q?6mcbBRNjlIQMUA9B98PmlbX9ShwdC+IBfvkXbYVEGgsoz2m8uRSKcQEodOn2?=
 =?us-ascii?Q?f8JECvb7SW5Y7ksUt4bsBUy1+tpebvuRmTBupLdtt0dVvvHSQrtJkhhjnY7N?=
 =?us-ascii?Q?fZpOXGwgZ5uMm1+SDArN7N28Q8ogEpY4wfw3y+UNRg3NEcy/8VaR6a8OLqWk?=
 =?us-ascii?Q?KCqdfifPsU2iWHgVipnqXvQqYvGBFtQj+NjMsUNbzyoWcooMNpCM6O4Ra4f1?=
 =?us-ascii?Q?aMIK/Mq0sMjVshmTm7of9FqmDDpRUsapP/7cWH6bWiLXaPrW5703lH7Deuj7?=
 =?us-ascii?Q?EJzoNg06aZJvxS+JvcQQcArMtAmnnWXT16L9XY9Fj/6nj0PB9dLn+qYZyogs?=
 =?us-ascii?Q?99Nua3+SU5VLb7q0G709edA1ztdoV/hvbTckcJvkT91tuAJPszcHqxE2+v9V?=
 =?us-ascii?Q?tlGDfPTWay7ElkklO3fo/hpQFQnbyRncHs+HqMPdlLrEVtmtWdcmv9aHt7IB?=
 =?us-ascii?Q?6EpoA3TuGJpcSkjVl1/mr4b1rHg9SDptlttdP1j8+mbdrjlA3moZzEZPuIPU?=
 =?us-ascii?Q?V5H+HAoTPNIBmYHalN0xN2K9VJEvTSASxcLifWbuBGOtsegYYCOzvu/fv2RF?=
 =?us-ascii?Q?38rJcS41HBckMC+ShIiS6cFW0/DVLjeY3Chn41Pa8SOkJ5D50T6xuC+xHbh3?=
 =?us-ascii?Q?/c94/0lHppbCjSldOjEOdNBIi1A7nbnPddqZd+W1ANPpApzt3AuELnzrmsBT?=
 =?us-ascii?Q?pe2KYEYRsBS4ZLzoQMH9MmVwYoKuOWv3SQ9NKv31mI6ZTOj8LOrUhBPvi/eP?=
 =?us-ascii?Q?BAiooFJ1nSoH5F6mg89WmXIaKrJP4OXzdJ/S3P3dNBNLDuAuK8T9jDQvu88G?=
 =?us-ascii?Q?fFoW+Vv/MoM2HzMhgeC8FbcLEW75+tlhGaWOSqxT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 961336bd-faab-4c1d-601f-08da739b1338
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 08:51:50.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GToVibv0TfBLYZkXluYbLapF1vqQXsTijolSLDudtLVwgEQKsBC5ou7gGkH6soni/S7l6LA/yGUnQS3A2zairw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4347
X-Proofpoint-GUID: 7gnU87fDiZuHWW1LYAp4NUeh-jKYKWUJ
X-Proofpoint-ORIG-GUID: 7gnU87fDiZuHWW1LYAp4NUeh-jKYKWUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_04,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=813 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168743

Backport from upstream d8254360c7f2ff9b3f945e9668d89c0b56b9bd91
("fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)")

tmp-glibc/work/qemuarm-wrs-linux-gnueabi/lttng-modules/2.13.3-r0/
lttng-modules-2.13.3/src/probes/../../include/lttng/
tracepoint-event-impl.h:133:6:
error: conflicting types for 'trace_kfree_skb'; have 'void(struct sk_buff *, void *)'
  133 | void trace_##_name(_proto);
      |      ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
new file mode 100644
index 0000000000..0140c4b989
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
@@ -0,0 +1,51 @@
+From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Fri, 29 Jul 2022 15:37:43 -0400
+Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
+
+See upstream commit :
+
+  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
+  Author: Menglong Dong <imagedong@tencent.com>
+  Date:   Sun Jan 9 14:36:26 2022 +0800
+
+    net: skb: introduce kfree_skb_reason()
+
+    Introduce the interface kfree_skb_reason(), which is able to pass
+    the reason why the skb is dropped to 'kfree_skb' tracepoint.
+
+    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
+    more detail information about abnormal skb with 'drop_monitor' or
+    eBPF.
+
+    All drop reasons are defined in the enum 'skb_drop_reason', and
+    they will be print as string in 'kfree_skb' tracepoint in format
+    of 'reason: XXX'.
+
+    ( Maybe the reasons should be defined in a uapi header file, so that
+    user space can use them? )
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ib3c039207739dad10f097cf76474e0822e351273
+---
+ include/instrumentation/events/skb.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
+index 237e54ad..186732ea 100644
+--- a/include/instrumentation/events/skb.h
++++ b/include/instrumentation/events/skb.h
+@@ -13,7 +13,9 @@
+ /*
+  * Tracepoint for free an sk_buff:
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
++	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0))
++
+ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
+ 	TP_ENUM_VALUES(
+ 		ctf_enum_value("NOT_SPECIFIED",	SKB_DROP_REASON_NOT_SPECIFIED)
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index ea2ec3c380..fea0e383c9 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
            file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
            file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
+           file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.17.1


