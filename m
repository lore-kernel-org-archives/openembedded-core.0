Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75966C00144
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 02:03:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1473.1659405779123825106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 19:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ThohsH5i;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5213cf310d=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2720nXI8024613
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Aug 2022 02:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=xRaW7usOhZHILbUGE7PGwezS9DGNVBHzvM0RG5yVG8I=;
 b=ThohsH5i1+Q6WRw6XY0yr02bGD7yOiQhA86l24BEHNKoCozpG02Aaachp9a9pT1Keyrt
 XRVzH1PL4ZsLkXKIVRiQv1WujAS9jbECTpkngJuCO2Y6gg69l6I6sw+9mqriZEWndvYf
 SF01MC4f9B5RYzfRlBN/QU0avGEBG83Qg6JclW9MW5KqdYZRyNaIC8x9o+ns+ZPKnh4x
 6/cLqlBi6nbvDEvwQu1r643CxQaGYInPbM9yOaI5P8p2W1OPVjwDvm8Um1YW1dav6hwV
 /HRhtyW5aR+Q/C0t1eiGR8BXJHAYFNEXIF5ac0IV5bCJHTqj5vuRigDpsJQSE0OItSRV hw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv22136-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bjzlnm4MtEYSzcQ2hLhpg8fqldIITiSJz3YNPjRqtTEtozDjoEhRJqdDpYD0NrIw3kyVB3rXqQhkfHnbQDphVyQLV0zNJ0KlQ6WtyR94O1W4DVOOqUwt62GglGPb5iYTvjRA7cIE1lHa0/3NaQKtverA6oytkf+e7s2rKT2dhLtmHYijeyuU5qLyHX6K8Etc0eb+v9nr1sYU8JTjvnLx99JG+a9iTewvSQz88DEYL4NatW4cAjdvF5dg2dt2dh/vGh/0cWAEOptTCVSQ07VLRGTaAAkGecB0M4KFMXR5TuXqP/SBgAMcZ88bQB1lm+TA/boeG2Oovf8sW5EtYaOjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRaW7usOhZHILbUGE7PGwezS9DGNVBHzvM0RG5yVG8I=;
 b=fgsTwh/SVwAs7XekEvu3vUANTmKlfBxbcvp3/BYLQCT35NUCLh/hWoHlysMWziqu8sMxo4GWdLlVANPnUlXAQkVUELYBgeFjIpGzOKOpS+E49E2rcZOryrk731UQsVkuEb7hjI7NmCZSJoZPY9QrDlE9leehzUXbCKSQSo2pgObBkQgvVSNd4w9UkLU1CahbRQU4K5m4ldqmzZ0y9Ya+C8H6G4dn/IFG+pnKUiVNCO3XGNs+BCeyejb04frDiB6pNLZGcG5VybrTeIJcTGzCPyNujsI5v3HBoRq0645wIkn6ZNSxWmAT0/k27sRh3+s3IciMb9gl0jB/6dCG0NtmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by CY4PR11MB1592.namprd11.prod.outlook.com (2603:10b6:910:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Tue, 2 Aug
 2022 02:02:55 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56%11]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 02:02:55 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-modules: Fix build failure for kernel v5.15.58
Date: Tue,  2 Aug 2022 10:01:43 +0800
Message-Id: <20220802020143.32199-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:3:17::28) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a74566-c341-4ea0-15df-08da742b1da5
X-MS-TrafficTypeDiagnostic: CY4PR11MB1592:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iZM2l1bldEHidW5hW/hC2gFxqGDcp/bNoVbT5MUv7teKYT6ShJYyTUWDE0oMKVTxkOYqyPTskKmmapvp5FpUcfw3Ptk7G+h9zDbo9gjStP1KNNhe8O3Z0KyyYG+jrWdHy81pVXLDq/jghAXU5AJ7Lzxt6ngMBlVeckM5dn0aVKdyoVZh52dZpDaIO9o+vo63W08d3LnwqGJBt8Tgv6w1h8yFsxyX1m/FcJE22UiRjq0NXhTGQdpFd4NFHK9wKQLUAUdvNDjSScFUXxy7Jrn98vHI80WuvYuzo03N4gPos3DH/QT53jBSoEjq4DzKxUg/uo02g7E7b45bJRaIwpNtdjEwRnnYJSfMQHxL0FXA2eTNDb2Vj2BpIV8eecz1RFq6N+AcaZT+pB++dEm0olDq/HgKjGw7FNg74Gp+ErNRV4KCyVb0gQaQqQurIz9A4kIJ6Tl1l4KvtZaPuel3oDjoUWZForIY7ivIGqHl/T+Py8w7b0hmMeCczWJJ9fsjGpUs5nVLPH6E4LZDvh8XgzxBfipgOw3ofT0BSakStTNDmVJ1VXDa3q2wlhqr8vbiS+xI5zpYC8y2JRj4MppKlAOjgImk/8H/dW6riRR/KnqMkX0LBUFAZgJ1MmwAtAXgb8uAzBZ5KQvLISKjVJE/SRVUiRgqj9U6snFwjXm/IrgaVvEXu50F/084o6B1zLc2mQt+xwlLW5Z0bBFF/soypNOdMxLg6a9iq9bYPAD/oLwbt1DxGBdLkXyJAPRS+FHvKmpfybfng3cAGByk6zcY6I72qVOmvx/qPnG1GUS2b0Dp+Ur59+W1BNVsYJi3QGQ+uy4wAQdv/NBl7IrHJEy38T/YESJ1h3T5kGSZRX1gOpF2WhU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(6666004)(41300700001)(478600001)(5660300002)(2906002)(6916009)(6486002)(316002)(8936002)(38350700002)(38100700002)(2616005)(66946007)(66556008)(66476007)(86362001)(52116002)(1076003)(186003)(36756003)(8676002)(26005)(6512007)(6506007)(83380400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FsZte/lsTmTDqQVM3btJtmiQ7IE93CVBsS7z7pMfBNc4ZYw2LLxzPaQx7AXy?=
 =?us-ascii?Q?yy5AMyYMRrpDt6yaXeq6U9J6Eki7EvM0r58YeGm9OJ/NKUi/BV8BNzfFvpEd?=
 =?us-ascii?Q?pQ71asHxsZ7M8Z8kE9aJ/65Kf5/xForrEZuefsU5jD2pWtFtzgRfprxTutO7?=
 =?us-ascii?Q?Hx6ro5XQ3/Hq9bLjoUebdfhXTDHcs4T89KiiQ/jXQYpijc7o9T5rFQEMUqM7?=
 =?us-ascii?Q?hED9YHruMot2MhAL4MUsiqsUpoCbpzXXuRRznU3Qr4UfTaLUgjmBOrH5OlgX?=
 =?us-ascii?Q?xn6ebhLZv+6s+1RU5A2XyEulLHCZAlz9ufwzTeMufF0bEReqfTKCSAgK/CpF?=
 =?us-ascii?Q?WQvTTgtjdfHi+ICcnfJj76ZQi5JoIIeA0KUK2bB2cAg1AB1E96kZy5WTYoZZ?=
 =?us-ascii?Q?VMuzomvmxHDgxfraSLdW/XrflR8Zih6IQ+gIkcg7b0+ELY9OS0RxTB+IUP8B?=
 =?us-ascii?Q?QYkEDzng4AqstEqT8JINOyQQgp/sPmDrq2N2V91cQU766jJUABsb1lfHLHsI?=
 =?us-ascii?Q?robvurFvTwRf1Mw6cyyrlflkqQ0Fk4J+XsFlCjgL1VCPcVFtsm01ygIXfILe?=
 =?us-ascii?Q?eJ1nVqQ3uaOoWrW4kpo4k5iVxxRVRYb18R++/WvRvPbUXr+QIAH8invubG1q?=
 =?us-ascii?Q?aFCC+IgunqiGzISh3/BRHLaIvfjIcuUunQ/tL/nB5k1CYGddG1I2fbNR3Utg?=
 =?us-ascii?Q?vgdOc+F1Yr1Nk0JjS+dq00pbPRxoQWXpawB1Hh/n82+107RJ6I2AFKYsIKyE?=
 =?us-ascii?Q?YpybtghkiBHH0fwINJQs0hvDDBlAE1BG9v4H87a+USne6yQ8RdzlE7L3bgot?=
 =?us-ascii?Q?IKhvi1FBnRmdlDLMKjJlhhTRBAPNl9+fqNiFVlG6vLLpJhx4h8c6jRl0jKJY?=
 =?us-ascii?Q?JjqakRimzV5sB5Pq2ZFl/dZS6qmcbVi0vBXiSmXcNdqOhA2vA32Ze/Y0m9YM?=
 =?us-ascii?Q?4tiSQWbsECzIy8WF/425jK1yuvlmNDt1CQKmbNZO97uArQ1Vn+DYiVmZZx/R?=
 =?us-ascii?Q?k5Dod7xkIs92xCdvsuAi90DmoSnWwJwXBbZXD6lPTHPN+qnFpxfzKYYnuQOx?=
 =?us-ascii?Q?bHInFbUVzDzH675vw6vfVAYN/7N2deFjxyXsSifbBGefp9utj6kvVcP9t1Vx?=
 =?us-ascii?Q?lbmaQIn9n7PYVF6ijM4o62/6Ek/99eH5i/asnl/6poX1f/vqTpVCneRepjub?=
 =?us-ascii?Q?NnjnsLJJS5jy7V3epQntPhEuFQPsPDgsr28Q96UCvIPUbLKDevAe79Py/LvZ?=
 =?us-ascii?Q?3Jb9TCVHRCcNxhN0Xc9xbTSC/NGogny/JZiukM+j5FRwyDvnteT1gE19vv/G?=
 =?us-ascii?Q?BXwkESc5lKhTZ0BoKGS1bHbZRl21m2CKvV+mIeLwvYhPJtHUsd5LcpJK2zSF?=
 =?us-ascii?Q?BmXwgegWobcxPZqQr/BuWbmXoAYqc7jrOkdSE6zDTWe7APfXnZFa3yk+Jn0c?=
 =?us-ascii?Q?eCdNqrKjaZTws3ftrqAeYlX8kvfHjuXtZsROswYAD7Wn6Pm0bMqplpZGF3vY?=
 =?us-ascii?Q?vRu+wxpTQUruGsFrexKEfoh6osI5MN3LuWk289wn/Ds4k6xWtsQnKXi+Xgpi?=
 =?us-ascii?Q?Sue2Ju//5/HqnYUlSrBJcDcAG5M53R/gkFCZzJ7d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10a74566-c341-4ea0-15df-08da742b1da5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 02:02:55.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jOCDIMKVbJwx/wP/rFjfx1wlF9+y9UsuUZk3Q6B4vTjp2b4vDFTM/gdN7LXg3VF9rHDN2gWXw5WaOiu5c5cTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1592
X-Proofpoint-GUID: a3y0MCkoUeDnMVHq3tU9jLYDrY5jTSkY
X-Proofpoint-ORIG-GUID: a3y0MCkoUeDnMVHq3tU9jLYDrY5jTSkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_12,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=823 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 02:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168764

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
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch | 53 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
new file mode 100644
index 0000000000..ca6abea9c0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
@@ -0,0 +1,53 @@
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
+Upstream-Status: Backport
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


