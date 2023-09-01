Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71992CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 11:50:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4212.1693569004807175596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 04:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mnDYN6OC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7608b660db=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 381BNV69032607
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 04:50:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=MIp+L
	NMRjuafOMitgDzrZIxtrRFLqGnWyXnw/ntUGOM=; b=mnDYN6OCJRS1wt/dK2sDn
	koEFLA78Ow/jf9f7W4alc9Pu2yhn+EtDmXUYLkozXJFMno3LIH+0WCri3TYxwz8t
	YMnVJajl2Iu5ulw4KJk34A0HWB9GEylJdidc4AVTUN/c5xFESQOv6zLGjEJClcVp
	L9xKBjcc7ZnxIIXM1recMqSbjthKf0ompGCMh9Sl6/szs+RIvbWtJjUtZoyg88wV
	5bTPPvR8z3lgdVjhL1LjllCjfhBoiKSrQ9Vs2itF/q61gKx6t1FePfZKs2Ry3EQs
	Ug7kbG8suOc9K8pYXkehEBAaLAX/nw5ZVAPHHJb0jy6juvWbF/pDHBiKGSDl1Kzh
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1dq2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:50:04 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 04:50:01 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] busybox: fix CVE-2022-48174
Date: Fri, 1 Sep 2023 11:49:40 +0000
Message-ID: <20230901114940.2615756-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: D4CPMYy7O6Ly-PSPRYh4Lfm4qeLxB3Vh
X-Proofpoint-GUID: D4CPMYy7O6Ly-PSPRYh4Lfm4qeLxB3Vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_09,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=681 phishscore=0 clxscore=1011
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309010109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 11:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187003

There is a stack overflow vulnerability in ash.c:6030 in busybox
vbefore 1.35. In the environment of Internet of Vehicles, this
vulnerability can be executed from command to arbitrary code execution.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..dd0ea19f02
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,80 @@
+From cf5d0889262e1b04ec2aa4caff2f5da2d602c665 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 12 Jun 2023 17:48:47 +0200
+Subject: [PATCH] busybox: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+function old new delta evaluate_string 1011 1053 +42
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d417193cf37ca1005830d7e16f5fa7e1d8a44209]
+CVE: CVE-2022-48174
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index 76d22c9..727c294 100644
+--- a/shell/math.c
++++ b/shell/math.c
+@@ -577,6 +577,28 @@ static arith_t strto_arith_t(const char *nptr, char **endptr)
+ # endif
+ #endif
+
++//TODO: much better estimation than expr_len/2? Such as:
++//static unsigned estimate_nums_and_names(const char *expr)
++//{
++//	unsigned count = 0;
++//	while (*(expr = skip_whitespace(expr)) != '\0') {
++//		const char *p;
++//		if (isdigit(*expr)) {
++//			while (isdigit(*++expr))
++//				continue;
++//			count++;
++//			continue;
++//		}
++//		p = endofname(expr);
++//		if (p != expr) {
++//			expr = p;
++//			count++;
++//			continue;
++//		}
++//	}
++//	return count;
++//}
++
+ static arith_t
+ evaluate_string(arith_state_t *math_state, const char *expr)
+ {
+@@ -584,10 +606,12 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+	const char *errmsg;
+	const char *start_expr = expr = skip_whitespace(expr);
+	unsigned expr_len = strlen(expr) + 2;
+-	/* Stack of integers */
+-	/* The proof that there can be no more than strlen(startbuf)/2+1
+-	 * integers in any given correct or incorrect expression
+-	 * is left as an exercise to the reader. */
++	/* Stack of integers/names */
++	/* There can be no more than strlen(startbuf)/2+1
++	 * integers/names in any given correct or incorrect expression.
++	 * (modulo "09v09v09v09v09v" case,
++	 * but we have code to detect that early)
++	 */
+	var_or_num_t *const numstack = alloca((expr_len / 2) * sizeof(numstack[0]));
+	var_or_num_t *numstackptr = numstack;
+	/* Stack of operator tokens */
+@@ -652,6 +676,13 @@ evaluate_string(arith_state_t *math_state, const char *expr)
+			numstackptr->var = NULL;
+			errno = 0;
+			numstackptr->val = strto_arith_t(expr, (char**) &expr);
++			/* A number can't be followed by another number, or a variable name.
++			 * We'd catch this later anyway, but this would require numstack[]
++			 * to be twice as deep to handle strings where _every_ char is
++			 * a new number or name. Example: 09v09v09v09v09v09v09v09v09v
++			 */
++			if (isalnum(*expr) || *expr == '_')
++				goto err;
+ //bb_error_msg("val:%lld", numstackptr->val);
+			if (errno)
+				numstackptr->val = 0; /* bash compat */
+--
+2.40.0
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index e9ca6fdb1a..07a5137d2a 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
+	   file://CVE-2022-48174.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.40.0


