Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C356A11258BE
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19262.1773417603008908859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SW6rrJcF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D0bDdO3761713
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:00:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CwAFBx226BsWKal8qhc33BsG31zz9k3ld/i1lcEMA3E=; b=
	SW6rrJcFINz25UpVOEoXAAdmgRvUluHbraEaW6Rwy6CbHXzWgztyQ8JbAAbe/RPR
	dJy8O/n4lWPaO/u4QIBTlsmsM9rUH+kuPr+WdxiJQ5PHey+Va3shC4rCbpf82/85
	qfGdY8SVDwP+xqE7uA4lQckYsjfN5LnC4zKPYPX9r1MIPI5KXycWGjI2ukGwc3RX
	RJYottmxyrTKwUUHoEpcBi3q+MKSUdxVdQohCvjfLQBKYxWSTb/qydIxjAZxGeSU
	cTz9eu+ydM/lbiTs5LI3NWoFfrCRIgYSovRXzKjJC8qb7JxWgqaDV9Gg3DmOUqqZ
	hliqh8LsDWKn/vulX9SQWQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taabn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhV0H/+4V9+8GCdSU86zZ0+ko59XaV5ii/h4cfV4Hb5wrQ9fUlnRe+d2cbGwAJlTBgJKO9oL/qq9qhlrTcUtnxfabGw/i1j0KzGmNT5V68UM9aogsM63AQxT62DkhwC9c03XxpE8okd5ZMG7XHa4ILW2AIxRXL5TITIcxHVH6YjjBjDpfbD3SapTXQv5xLcxMT9kZzlUiBQ+fSDI0JHcwHxZRQZ/RPJcTNTvYO5s3xX3jr4aOSEXMJt2nUbtRLxl0Bcc1YRKwKzI0VLRPe8ppXj+m5xZXvQ0uITwq4YCeALppdh22kr+cTAVoFvQLWu/KWJdshpGtqmL2E3AeIPI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwAFBx226BsWKal8qhc33BsG31zz9k3ld/i1lcEMA3E=;
 b=QO70ncaLSMyWcBTaXOVwBw3RNOBf6eg3bcOghJNqo+LJ/q23pRONiuS/eAZiAaDRzlt9/7zP58DjUwomEMedR51V1LBtu9f26MaUV9S+ryiX/eOgg46jJEmA2hoCqHodhgfbxd7mW6vfMd+0BL1WGnZ/SJSu1t4NYDKfqqwngheJ4fJjgnBW6CO2kSDw6icMQOG0hqJ1Ofob5mD/USQfxm4iCZDN3ySTmCl20dba5D1snIYfDFfWGtBs+G0fiFaNJkv0GOEmBz1W2c4nheWULpJxZLhNk9aQE12877MVTqM59Y9QnYwgozMYEpUFUEQT1Lhr28lhZH6RDiet0lI3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 08/14] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Fri, 13 Mar 2026 08:59:14 -0700
Message-ID: <20260313155920.2347101-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 111278f6-f376-4eb7-8688-08de811994c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8F4rgzQ7wYjupGQ7NCPKOsPv1Ht8FAzWlAe1XwMOQdoQ4GfE670/o+W2Li7lPZQGxEqWNEOi7Xc81y0rjGCmDEKzIeo+89XUqcuficVF+8PI0/s4jGAX5AazPFh3958tOXvXc93PsDSy0Asy14rUDoQsdF89qwANJPcl9CJS86AjRwFNZwuoTHfrK4mATVde0rCI7wk/SggOUCeDasHN10RC4HHSnp5k43Y9J/4nGUb67DNikxaMdsTjbbogaWc7giruvVBpxOZmbcqIw6Hqzy9PDVzaCzCnfcjHFVbL1776RLo0qGVsgAJAxoTcAag43uPNgwBZ9O1E+xjLEawxFhHBqr7mYDICbTWB2rjuI49ArU3V2hbt7osJgbke99TNyagcPPOq9T7Lgqt4FlLugoaQ8eI9MgiGF8TlkeaW9e9vjT/6ZlZAY/bj9aV1O+WoyIO+iiYHZDXqCC8lQAaVudZ2ZdMfdxTRIBOyXbnhhI0KYkC8Bod34yH7Y7XB5xlMeTFAPkd8E1T0yo7IhH+Af1iOb3J8ACwyP3LQYrFDYpUtJ/XNqqY0P87WoD4Zfd2j4Vul5EDbDSSY8hs+GpBIKXz92rWgRRA+SFIQZqsV8LxI/EJrIbPDgjO6RExecGx9xMuxGz/c8UM9uAmCj7o2bdlm7b1M3/WHVbFXnZgn2DEciG6kW5zgwWvUe/lFfv9IlDmxjWwpoy3HikuAekDmGptZEbXocxQaK+Nupp/iTK45nCnHo2/t/ANDQZFqHSgZoFUafgBYZBAd52TW7zbgz0h6u9bAKcOtKLNxNgEEMoo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8DyaYWfnr7jr1oLJsV2zxfu1HBg5ZDmd4aDQoTSOLOvCfYBMXjNsBUseb/81?=
 =?us-ascii?Q?lYw5GiB4lTFKLPyDUT0CpBkqo6awtvxCHgtsQGCWt8AfR1M8YJK9Yir7JiZX?=
 =?us-ascii?Q?IYHndfuMhzNwrXk5XSPBEPTh6/ADQbTGgY3q86BB4bgW8mnWJSVxHZaurKwQ?=
 =?us-ascii?Q?Fat++oAI4QMx4Q9k+c3ietxV0wlzkgLGuTkyVOz7PntIViKqfP+i1BbaYyuG?=
 =?us-ascii?Q?qN5hK0/EG00/ghrlBSMwe/neF3OPaM3qohNtqsI3VJaTwGO2BpW6WEXf8JuW?=
 =?us-ascii?Q?wFBA2uwH4qk8xE0hZURSuCcW4dftB3CPJhBJWN2x19p8MBeVHlmPLDZmTFaT?=
 =?us-ascii?Q?efDh40c2wUInT6MJ7Uem+l/3DYa3TPoND72jf/zizeIA3/pYj3HT54rb8/4T?=
 =?us-ascii?Q?+oc1rjqnJS1+MgwG0QylSV8t9zqA8T6bYrgSeT8BzBpdfBxe1iW22GEZke2H?=
 =?us-ascii?Q?wzX117LemsqgVXbFZlH9b4XE2l7RdqZRgN0MDlUhsQF08Uzb/QwQjG6iitZ5?=
 =?us-ascii?Q?5fonfeHlNqtgQvokbv4D56pSnLQth5ueo91pceQDPvY4vlR/YRG0+LySSVKs?=
 =?us-ascii?Q?Ka+JcdqLawm+H1czJyeGoQS/7+zS/A7XYh+a6w6/3BiWCyjOQKdxGwkigp2s?=
 =?us-ascii?Q?ISCOaQyi95IPXAOmcfNI3ITOK+Z9ym9DpcTy6vrkb/b/BnDz1PLTWEQnK4HD?=
 =?us-ascii?Q?divrGHqoczqT8kncvQCkEzMBvgt+1RMvwNP0OxStYtRZ0Bz6+iEKK6mBdGPs?=
 =?us-ascii?Q?BLXLZxtfSRuS8rt/Yx1njKblPmEjbGtRUNmH9pLz3QeIpoPKgArb3T9UxY+N?=
 =?us-ascii?Q?MR1VejjNAPPYXxYh22xYmrqHI0t6vFJHABKI9M2feE+BWmop1ml0Yhb4k1yU?=
 =?us-ascii?Q?XVIfCeLi2y3jbhXCixt9Zgln5Zr8s2RoNz9qJHREHF9qFXO4z2qp8HtaTe9d?=
 =?us-ascii?Q?vpsn9uZdp68hSMQSpqCTPgz+k2iakPXY60BktmMOzDIg8+cK/RIG50H3cs88?=
 =?us-ascii?Q?/aK4vAm7h/i4SQipcH89cJQV3lrslavKL5xmNZ+hq8wPOQfP7F/ilWoSQ6ql?=
 =?us-ascii?Q?p8cjiA9wLBVbT+xmq7dE6qYh+WbY2x5bt6t6tYJ6Hlx9K2hHkz0tf79wGfN0?=
 =?us-ascii?Q?ue5IFqithuIezn8KryNMRpYqrZfE9G/kV7OQAWoEI4Oyri4K2waU5lLXbkJW?=
 =?us-ascii?Q?//ZEE20fouS26EpXuUMtyKRbrtDlMSuodfh/dm7EW0Xs6XKe6q04kwWDsuLy?=
 =?us-ascii?Q?JF2cCrwzV0Gr9sussqGJWU1MqKccPutKUHvZoC1b1WeejR0Zv6B1BCnOPQ4L?=
 =?us-ascii?Q?2pHuIlqjWnTTsj6LN22I+Bc7hA8wMoYeFOKxPQ7JKXJkP0BfcunL/SIsxC/r?=
 =?us-ascii?Q?jaoFGEFHKRDHyPq89y5BbTfB8Q1OOVP1iUlhKmHp3nEUbYh21SgXSNH2KBla?=
 =?us-ascii?Q?ue7e1nCmfRlMQlvfl+Gn5oLA+ka0q7uWsP9H5nbvFXfLvIdcEIUySbi9Vz5r?=
 =?us-ascii?Q?LrZYo0u2K5Q7LJVBPi4WWb+v7/bBmWL/Knkji3/eVq2FVGnhqqNNeOXywjgQ?=
 =?us-ascii?Q?0ACDdNyBuXDwE+GBHkkg42QfPG7yA1+BwIF2LOd2h/aEOOP4T0X6Ma5PSl9W?=
 =?us-ascii?Q?0/CiiJEGpQpvcZ477Y7ri1dfpvfCTMu4vMfr+iKEsdSBjJXwEDQOOaFd9q8c?=
 =?us-ascii?Q?w9MgZPjeQFP69ebu4EtctmDxeAcwORasjcvpr9xFvH8duDAOUiYdJHpN5x5b?=
 =?us-ascii?Q?p+wixNF8ybbRjLd5uYRZua6OEu5xwWQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	YPLsw2Y6CF9g7Mm1dBQQEWS5V7EivnE7nW1QIi7p24r6ew2jM/lcRIIM5VVJhFnNDsbGvPx507mKNi3BiTAecciO5DpgFjlpo4j9MmovIgREXqIvNGSJDONuH5znYQ8dMjoFwsQhBIL9HuIherKfN89LdRygCp3tAlxrt+R1KklN5hjWRyqlggEMX5t6fHD7S7jYo0/Eo00q2iA7SH0ngFcgiXwpfrJnLPZtv1ZfDOHXnx7NoR2M249h22fopCdurJJHX6jSRaZa+0oP57rXIM9hEi5c6wdlMCec5mIKYUtFgA51glbrvUoZQUkknyXM03sKOOzJrtTx07feOVwm0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111278f6-f376-4eb7-8688-08de811994c1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:00.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58h8+4ZqNG9XNnKcxqmGjz4884dq5GcwtZh5atfE49yILc24jfF3No5V+ZEiw8ZtSP1v2SySYV36WFgVHMMXh9LwwkUHaxpX512Ud0zP2JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 6dLQy__YCF_N_Lb-juZtxDeb-Vol3dor
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b43482 cx=c_pps
 a=cGIxddJ9FFYnYBVvYRB3uQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=VuBSspvWkCZ0bjgt3uMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: G04pDVzEA373PpVYUmQvGZRpxha83LSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXzqBDQuIO0TxJ
 wZ1WMVuWpeTkxHnRvJyZEq63CsVWtP1tLSQWnD09EUJDOBJtyqsk9d3B2gjQiw8t8z1eSH9XvJC
 NIgzKcSpyUfQS5MIfgKc4iDeZXAbnYb3WI6kLuW/7gREv41sjbpVjNtwDag8HBK85tvT3owhIqK
 ejC+bK0NGXFpcUMyQWaQg48lFJ06XVlvO/iofqHfwir3vYHq2sz7pb4Rbu8Su3DyMZGN0xxaneY
 y6ztpMOgs1u6CmLg/kYQMLQmL0fbrsstIDjkDyOvVNK/S4HsQfml4GDK4KSVy8Ogd7Ox0upZucp
 JnW1AFkzJl86QPL3JqlRFRE8EgjzD9gOpq6Yets7Q5IdEwBVhIcTyxyIUzogXC3CJhhkTzkG79Q
 jsVu098Ymnvy1BFeUnSS1ughyB9Fqe7RK8/SWpNUloprrPJVHJVOXlDKgqd91Ub1mTbBSvOL2IU
 fbJo5HAjB/X6eSaezrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233054

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..62f5df7a01 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -140,6 +140,15 @@ do_install() {
 
         cp -a scripts $kerneldir/build
 
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('KERNEL_FEATURES', 'rust', "true", "false", d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
+
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-- 
2.49.0


