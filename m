Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20202C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 19:15:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2642.1637781326595142266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 11:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CUxO44Bm;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6962e1e0ea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AOJEJQ8028834
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 19:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+PXqIKv9ynHD87dD2w2mLvGOKk34EO+zLoCZCRC5orw=;
 b=CUxO44Bmoek12mM4QPFSx716yduOreYUM5sgmVNITBS49KptC+FxekOKUAKgdrrnv3Dp
 z5pRtRpYo18b6nWtnpKHadwM30LEQscgBmJ8qSunE8nsO7+nxhbUejbSY1NdeglXOYke
 MY6DVBIBvOH3+OfEvd9DVHFjxja2yZ/fNoyQ60ws5rCfemQynOv1kdt2W4/ku0IiwzQ+
 +E2oWmGZCsK3867jxDsFJRGONtn6Sz3xNdVrnAk7iBvGyIWq5zxTZj6LVdcHX9g6EMia
 /olBDK9FPbovQ2lDUuiZxpbgUj80UFO1HdvOpY0dsQg0jYt4FZiPjg9sdUyg/wSWeJzA gQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58pqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 19:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3OU/5e9jhGKZCMdznRzoJH2u/yMYCaa26fn1EpSnD5vFX5KKuDPGB104k6Q+abIwo7W1JEW5zeARUz4QpHXhI51DOuoWwy6TWpWPZ3ACh5ysH0fb2/olrrymt0rJynXtVPuLl+8FaSLgiVerZGiiXE6LqskuUtmMNEP70TefHBU7twX65iC5230swFdCL+V1adHx8KUqO64iEFl9d4bd/s5JesbgMrSK2NADCsiotb57evF/BqWMcqp5MaCdvnCB+Sf0WJCRxyRVspCpwylzWIgSme1pddM6lC+3+58lDWDJ2Wmu4g5OfdpbZQ26atEENUB7RdSyD0wyJv2KdoXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PXqIKv9ynHD87dD2w2mLvGOKk34EO+zLoCZCRC5orw=;
 b=nHN9C5Ts8VASYJpaP5iaXfxYhVqdE0HEiAlUqUv0/NNe0RVfGRDT2EKb1glqQsPFygnzD59aW6Guiyi9kUEie5kZFYZbiHDTb0iyemecF6sOh7vjgRjBW0CqxmoWtNbu9/ClGeGoqbuOWcSanXZnnnvwyElJlM5Hq4jt65o0Rsu9dzn8QMYlqsG3wOyeCGzh5tQqUbdg+QJm2uMLuEmRiysn1URT2uJuJOeeBRT+sO8RrpkY2o91S7dPrP2RgdiK8ApQj5m++w6xlm1c3O5pvS8ZMAGUUpemRss2tDyQ4A6Gk/DjvuCD8q6GRTg7DinEWU7oX2+Q/MJVtyy5mYWMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 24 Nov
 2021 19:15:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 19:15:22 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] go: fix CVE-2021-38297
Date: Wed, 24 Nov 2021 14:15:01 -0500
Message-Id: <20211124191501.23035-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-lpggp3.wrs.com (128.224.252.2) by
 BL1P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 19:15:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f65b5f-f21f-4811-2f03-08d9af7ec2cd
X-MS-TrafficTypeDiagnostic: BY5PR11MB4152:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB415244146581E6B66C4EA8019F619@BY5PR11MB4152.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5d91taDFDgNOWtN1q3CCJH7m0vt1pI7cdrMcoqEdG4xKUAZ0nLv7f36ilLeRxTPHHeFP2qq17JgFZ4qM9d59G4ouN2JbVWzuZEeL+mlpzJIYxay80PewG2crAwlKHuMDuHZJuZ96kHc9ltWUjVsUV9XxeUV8Fp3d+j4fTK4TMgZv0/nF6r9UvMUQOHag6BjgYuOOL/v1Xm4z9A2eV8q88bjSf2BFqyfWyTu6ct50ZCnMuK++gHCD548nl3FWIv50qw24ACix2A+fCYJW80nDvyrb4pm6W0Bmfr4ShyIeJP1TQ7akZdtLlRVSV4oLjBQCltxE8whQ1eT68fSSeqIZaMLYETKk7gb0ihEnmxMQ4vPKjGBIOHLtAgt9oKzBoDt6pgsuhDQ3x5ekcpSaWuB5Y4WUqWObDR6ZfYkqhhF3oJEyrl57cIrD2lF1F1b5NaFGUUL1WWi45sfcOmdNlbTTzNzY85+AU00O0T3f/i9BHRlz08Gl/YkoGpLCumm5c4CrKstK5JvWCigwKCWKxF5s9EJ/3RRFBUNHPYjPgzGhXk6clxzyU15p80/jHdYlZf7kzP0kYbqPMUSu8cdPAchNsJXbBdmPuKph8hPwPIzdkUq9PBJNid4WC6iFr2ipyOXKGdGLZgsziZv4bQoW3ey7KqpnwojsGIk0JcjQBUZGyN6TETAmxuK5xdo/Rb59pm0HCrNdCM4ohIZNQTsRxlKqjTtLoDeP0mTzJBZo0GEKc3RWe9b+KO5ZsEIlOJGAjaRfnid7qNoDpPiZtmoPPnnOr2uqeG3p0RskwfOkHz188JPgHX2VC46vs3g2WJP8z68gBBvbG2HzZVIng4OP59WWog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(86362001)(83380400001)(44832011)(2616005)(508600001)(956004)(36756003)(38100700002)(8676002)(26005)(2906002)(52116002)(6506007)(316002)(186003)(6486002)(1076003)(66946007)(6916009)(38350700002)(66556008)(5660300002)(8936002)(6512007)(66476007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+NTBcOalOxhh4iMowm1/EmxMawRlGRHSqBQ4l9X17gjyW7FtVMx7I0Zq5yM9?=
 =?us-ascii?Q?mgnuUtgOp84QRKKQxMlx23g75WAIYy7nJdS7kphZuG4rsjfgetsSdJRsJTe7?=
 =?us-ascii?Q?XacohiHumpN/9Gi5YTWv2DqSuRrSYQCLLoHEeofvABJ4T/8mO9wpZpCOh0h/?=
 =?us-ascii?Q?AMiFX8zCPxQW8O3h0lxbZrmIR1i3Jjjzxw1r/McDJaBzOlrE3bXJWoxwpaRZ?=
 =?us-ascii?Q?jMHWAFx4hWJcvxJ8Rn6Zt7fYUugdLYBJph2s4qhygdrMB1zmJFpLOAKA0Dgm?=
 =?us-ascii?Q?Vh35H/wiUQFnECPwvU6f4MgqnhUwwGWJJItEbxnUoJipsWKu00wvPzEyFRjH?=
 =?us-ascii?Q?UHfHFXe+xO8hrC2Ef5VRz5QpJYWt34XKVh1w//NOiFY1bl6f/B1kTbGt8HOU?=
 =?us-ascii?Q?WX0cbXABEwCwQU8Q8qbnl3Dqp97jOhV7zcKpBnOMPodqMNnE6lNfMjUYqTc5?=
 =?us-ascii?Q?NnGLSgOOOyfyr10d6TEwo75Z0ED08s/X7b+bgOsY6pu+1ru05ZtdTvYNqxjw?=
 =?us-ascii?Q?iAq6emk1hST+TeArEyW7ELWT2NS+f9qinb8keOUwTgm8fXZ9/OSaMXpCNYHT?=
 =?us-ascii?Q?YIcMgmfY4RNziEPN74y+93APM9dt4SfPh1kOnPJ4nIgY6XN6si99SbUk/VRR?=
 =?us-ascii?Q?/9mqdcQfPcEXSf6j9K53o/RKEv7g9l7NvgEjDVNZcM6bwCsDdUYSztuu8jtQ?=
 =?us-ascii?Q?4D+fqnbmYYm4vHl4AAeIoDiAaZRWbOMe0OmyDxFQeV3354jxVckuBqn/tGyV?=
 =?us-ascii?Q?155KY3I/BbQZ6Rk9yA4kza1zDT76st4rYUfRtN8bt92JykMDdg1m/MTETiwI?=
 =?us-ascii?Q?Aj3EWw50bNxYKludBx9/J7d8GyGV/chL3oPsP5UAt9wrLrVm1QWjxOguASpG?=
 =?us-ascii?Q?nDSgyKlLn/DfpBnSyxXa4zEz26BvXHaNce0EsRJP8juAVQPx42qVcdohiRAZ?=
 =?us-ascii?Q?eECLAO/+c3XBjenCvKmWAcTzXOAK3XzbhSDf3anW3VlOujhUbvI5QJ3lctpW?=
 =?us-ascii?Q?MdFfEj7Bh4AFnr1TsNUcunFxkDZvZQ0Wez0FKD9bBEP3Q20Ml5+581h1cqrd?=
 =?us-ascii?Q?y4x/uuU1CDJT9QlLeEAQpvt6VyyOzHZtLD05NhauffxVnFu8oKbS0fV2XP5X?=
 =?us-ascii?Q?qRcqoiry8fs+6UmoF3vDNTWnbXnro/+hRiYbDIHTB3GRg9NJlUqJzyfzTS6m?=
 =?us-ascii?Q?uhNr3YNEGN3gDbb4z4AZkNgkzpvu5ntwDemkJNVPIoBWU2xBBzhjO4iPohgG?=
 =?us-ascii?Q?mYXu6UF5j378jsg48zVWvMp7jfQn5HhpI7sk80OJh1CB/vj36TOn3lgV0IIj?=
 =?us-ascii?Q?t7OkkKuFTNv5H6b74lZQZg2X05pvoNXBFyx3kdt8p4YDP0DqK6hw7kKT/NWM?=
 =?us-ascii?Q?/4Th5+ILJxikX30AQ2LRtR4n4+MFaR7GE48h+ZvCfc8T0yrYvcHlI0oKZbI+?=
 =?us-ascii?Q?atH/ybYSG1vIUp6Ji9EbJu6Gic9Z3FC31eMq72hdJFrcPkO01p0noAVkvJXG?=
 =?us-ascii?Q?S44Zpkp9NdXbIdSO5WSpdkLRRwfGvPd/J/65S3lDvRATCPfX9sl7R/vEXE98?=
 =?us-ascii?Q?4fibqMcJbQS/0kwegi5ZQZKxT2mIV886vg4j9sWLQBLQhugZoLHNv7VtCynX?=
 =?us-ascii?Q?ajLjaWJa8qhSxIIdQBTw9HEKAcWMU4N7RRxX2+OJeirjRMhdWnQ8/g6WOIQG?=
 =?us-ascii?Q?anQKQQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27f65b5f-f21f-4811-2f03-08d9af7ec2cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 19:15:21.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 b7M7b7eVAY3uVvS8BfOWJUUDY/4W0h/XMxFZ2gax75cskpAIpq0ROPCfxTM+uF9UEc+XWtCo12eEDjc7km+/esFZSHXjo3AatVbHpv2ad0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4152
X-Proofpoint-GUID: 8-5nDnkDnzsmlW_ipDINW-K7A7kOgS2e
X-Proofpoint-ORIG-GUID: 8-5nDnkDnzsmlW_ipDINW-K7A7kOgS2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 19:15:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158737

Backport a fix from 1.16.10 to address CVE-2021-38297.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/go/go-1.16.8.inc        |  1 +
 ...nk-do-not-let-command-line-args-over.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.8.inc
index acc2300a286..31dc066845b 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.8.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
+    file://0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch \
 "
 SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
 
diff --git a/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
new file mode 100644
index 00000000000..21b82c0c9fe
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
@@ -0,0 +1,95 @@
+From 77f2750f4398990eed972186706f160631d7dae4 Mon Sep 17 00:00:00 2001
+From: Cherry Mui <cherryyz@google.com>
+Date: Thu, 2 Sep 2021 16:51:59 -0400
+Subject: [PATCH] misc/wasm, cmd/link: do not let command line args overwrite
+ global data
+
+On Wasm, wasm_exec.js puts command line arguments at the beginning
+of the linear memory (following the "zero page"). Currently there
+is no limit for this, and a very long command line can overwrite
+the program's data section. Prevent this by limiting the command
+line to 4096 bytes, and in the linker ensuring the data section
+starts at a high enough address (8192).
+
+(Arguably our address assignment on Wasm is a bit confusing. This
+is the minimum fix I can come up with.)
+
+Thanks to Ben Lubar for reporting this issue.
+
+Fixes #48797
+Fixes CVE-2021-38297
+
+Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/354571
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Reviewed-by: Heschi Kreinick <heschi@google.com>
+Trust: Michael Knyszek <mknyszek@google.com>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Go Bot <gobot@golang.org>
+
+Upstream-Status: Backport (https://github.com/golang/go/commit/77f2750f4398990eed972186706f160631d7dae4)
+
+CVE: CVE-2021-38297
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ misc/wasm/wasm_exec.js           |  7 +++++++
+ src/cmd/link/internal/ld/data.go | 11 ++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
+index 82041e6bb9..a0a264278b 100644
+--- a/misc/wasm/wasm_exec.js
++++ b/misc/wasm/wasm_exec.js
+@@ -564,6 +564,13 @@
+ 				offset += 8;
+ 			});
+ 
++			// The linker guarantees global data starts from at least wasmMinDataAddr.
++			// Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.
++			const wasmMinDataAddr = 4096 + 4096;
++			if (offset >= wasmMinDataAddr) {
++				throw new Error("command line too long");
++			}
++
+ 			this._inst.exports.run(argc, argv);
+ 			if (this.exited) {
+ 				this._resolveExitPromise();
+diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/data.go
+index 52035e9630..54a1d188cd 100644
+--- a/src/cmd/link/internal/ld/data.go
++++ b/src/cmd/link/internal/ld/data.go
+@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n int, s loader.Sym, va uint64
+ 	return sect, n, va
+ }
+ 
++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm_exec.js
++// to store command line args. Data sections starts from at least address 8192.
++// Keep in sync with wasm_exec.js.
++const wasmMinDataAddr = 4096 + 4096
++
+ // address assigns virtual addresses to all segments and sections and
+ // returns all segments in file order.
+ func (ctxt *Link) address() []*sym.Segment {
+@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
+ 	order = append(order, &Segtext)
+ 	Segtext.Rwx = 05
+ 	Segtext.Vaddr = va
+-	for _, s := range Segtext.Sections {
++	for i, s := range Segtext.Sections {
+ 		va = uint64(Rnd(int64(va), int64(s.Align)))
+ 		s.Vaddr = va
+ 		va += s.Length
++
++		if ctxt.IsWasm() && i == 0 && va < wasmMinDataAddr {
++			va = wasmMinDataAddr
++		}
+ 	}
+ 
+ 	Segtext.Length = va - uint64(*FlagTextAddr)
+-- 
+2.33.0
+
-- 
2.33.0


