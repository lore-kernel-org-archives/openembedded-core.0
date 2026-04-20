Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA93EA71B5
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 01:20:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10877.1776648049012640895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 18:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qIVBTE4l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85706c790d=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K1ER8g2176400
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 18:20:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=DNbjPKtZ4
	iNXRc3gmBAFVlytDuNNbJKLuP7EB/EPxKY=; b=qIVBTE4l5O3O9oNjaQS3R9rEw
	eTf3GE7LZkU/bDx738vE2PmHNfk5dy/nsjfQ2cI0RGrOmvinpwe5oeNRkhYWsJOR
	/JgNDBPw7di0/+EvX7N7pC4yTrtN5jkN7d3zXCJameEwYiq9VJGlszitG0D5syAX
	uKcoNlGv3UgyXHP9T1P48yH/zf7lHkOF4R0LPir0s3B4mqJSOz0Mj+NDctLjobi0
	tyxK8OYc9rxVlwCwtONHXUp0NZHrYYD7Ovh5EWEL+TJbB90KFiVY97Sav9u9awuK
	LG/TG/Z6Llr2WqFMyhbKRuV357LpUXSMMVRyxaiz/lBZosbDFXzm6/ULDA6Ug==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm9fcs2a8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 18:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is0XK8v7di7ihOfR0bv4qWh8TlFDZYuJgR9y2cBJAuG/c2HwR/7Vs/nTudkw5/N6YLkAxhfIxTb/dOqayUEaVf/UbE6pfF6VwYBu55HwTkk2LTB3tm4Lg5SxKXXG0nn3aq/syeY9nfGhAClxuD+ScunrdAe+CtSgIlNhudEEp77k+S6JMRU8vvhgMzhAB0z1rVRgyli45zuUCn83jaTDkc0neBrneDNlnhySMrKPpnpsiT9+21PpDdWQwjrTMh/srPchmxTOvu/qgMfFvNiOfsqU2mqxf+pbTNz6PuwmwNGg5wPvuNLT1J4FSKXpmm/r+IydWHCKtIfsOM+dfvBZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNbjPKtZ4iNXRc3gmBAFVlytDuNNbJKLuP7EB/EPxKY=;
 b=n1Y1qlgZ7268eSl2R2YTgws4zODTGX6baqqp3s9dDYnnR/OOGj2mY+sRh7WSC74r6biL9s6JhHyhlZ/zmWCsg3bOidiKDDYxzVrsDLo5iPE5PTqjBTXz3lsn0VrImMjteBk87IVAJcmL2dqp8ETXBP+8omCn5T5h6FSumDs3M/TBgbdzG8HL6SfQNQ3tyNI2VIdNij8xLth4MsqBd8QuVqeDP5sXU64rqr4szERgefoAGJ3ZbqFIr40XRcUq/KThirfkU+/zgfy6gHr+F4iLQ5U/lUlfMv9vnNyNZ8IGNpy6pqubQK6fBIadZKCPZvbs870Jg3wLpJFyp6TVu39YJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 01:20:45 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 01:20:45 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiao.zhang@windriver.com
Subject: [OE-core][PATCH] oe-selftest: Add static postgres user/group for reproducible build test
Date: Mon, 20 Apr 2026 01:20:39 +0000
Message-ID: <20260420012039.4024325-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba3172e-fb94-4bbc-e9f2-08de9e7b0bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YX0ENIza6n8gIQ63WSeEgBbBmFZLKcnHjoaoYgTr0wB0wj7v/C822VCL+e4Ytp9ggSb9Nr/29U9mXcIeeFi4H1jBzOP8FHLqoKeii9g6D7ZVZKZZ1Wd9cWPxH3m05hxy+nN6bjRjGKd6/PL4TcfacB5OAWbdRpoHqK3nCKId7MqczwH0w9n1gf2s6mv0ZHCUF5Lvw/cQRc6DdfKejAClLc+RZHSVMX8wJyjt2I2Kbg3peOtj3i/mSad1ccGWLDaSUnPxNY5nQ4IwTmsjMygn7PEFKkK+kNTNUyakpDqWPpx6nVhFJjI1OdwDMowA21LcXlms6kK58/zIxiScFFpUkdsm06zuZNx4q3Bxq4ubUWu5WNXxJjILk4fiYwj0eJUfDSW1j2obmplSExjE5hDdcvSBCpIMr11HU9/yfw9pdyvYOo7Sy6qC+nlrsJMZV4RspRXzKRhrd76aH/VEHj7QtuOluMwWwI96evS/D0G11qHldiVHZkFfDbV9WpFp62Z98pr4SexlMOR6HmO+/QfLUbis9wg98+Jwj9LAkjj8loHEHMm5LGXmGf+DD/DDYCDx5/anBhXzmt4C98CgI0jgoSyrKnvAd+dPU2d8hsQb/1dcrxdxLHzcA++8qJpm2xBu7FOBeioPAaVSeS9rYEc3nXCQmdoIdno/DDGgVT9AjhBLknMFtcdiZ43yuT8KAlEtr/lWvDGVrN2JUNiBWNcCa3vkMrAZ6Bvl7FsGvNDK2Mc662b/9HwE2R67G+W0GRGc+06McJbYRocNwJDX6KuUrPy8iOL99fjAmWjkj71Xpy4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QfUatczEkEwlAgsyPIKHMNpPsgqsB4ydJgK8+PFjEbaDY6s1EWCJKgZqbjOE?=
 =?us-ascii?Q?5VVf6i5P4WjDM2U7qd5KdkrkTJnZanJF9f0slNoRiJxglsrZF3yyPT9sZvfU?=
 =?us-ascii?Q?WnhCVk2N0/rXXHGcljt25XXc598X15wbqwI85rtbrI5iiUu86M/jmUBtkKxp?=
 =?us-ascii?Q?wGIhF/7uk5pC6ucDbM+dLqo2yA92t9nD8gNbYCrgftielY9mf7os/SgMjC3u?=
 =?us-ascii?Q?KvA/sCNTZP2ldX6ExOXvF4p/LHlQvagqmesOYlQyo0lo43Qx8uDfgf1fJPIU?=
 =?us-ascii?Q?SW14Ch+nv1HsHu2bLAGjikX39l1ndxpe/6k4Yc/nnvyFZlm+0jFZZlFFk/rE?=
 =?us-ascii?Q?IR6h9a7xfZFm+vRv1o3gFTnWexHinSO+G1fz411wkIbqzvtvxAaxwWB+H1v8?=
 =?us-ascii?Q?t586jiImTFcAbdw7sPi+qz9zxr0PBtOO5vAS/9GH+XyHGR3FYzCO6iPcnIvp?=
 =?us-ascii?Q?PiATYBCHsZcmq0uJJRHIiEJM9wy1jNYM9xJMDyUSPICRx03PHH/K+ePz5kkf?=
 =?us-ascii?Q?qpOLBXWUKzwXeHGujwVeCdUz0Mgihrg2UiPzEaDJOBKeH9oFLjDwm00iN5D7?=
 =?us-ascii?Q?hsHdRNEGJW9LyiY12RLDff2PB8BhhpzzGTKojZXniEi7XCeDq/PyHUYvvRuq?=
 =?us-ascii?Q?XOFUoAvVHUtsMU0emIHpvo/ud3s9rSTVpiSCynRtcshgIFIQs6a1QJqhVc5w?=
 =?us-ascii?Q?yktQOY9mixB/EykbN+zsrq27enmvTRL1jQh9GvTnMmf1Glsw97oY7tEP93ED?=
 =?us-ascii?Q?/aFUj8qXi+UVCDOeEYaB2TY1pETLaJXkzp+EqWR/lrIAlSoexZXXApUSXe8t?=
 =?us-ascii?Q?uIcTcjyQBq9iNDF0b5mylsBr0WUgNYdlN/22lX1YQ3zRQ9Eo8JOgXhSyXrkh?=
 =?us-ascii?Q?TCzPsrEUZxkJZPhawn+EiBy7XdDrBEd+zceuZxwLPa2BDv5G8Kdx6ac+tuDu?=
 =?us-ascii?Q?S6w0QmAB7MAUiulZ13yZSNF9sZfhDtLo6/+Z8M7zRb1myzjwjX2cipF/JyqQ?=
 =?us-ascii?Q?hJY9s4hfmtbMkrQPOBveK3n06LVQ677KL5LmJqV3jmURQGefBKDI63kCk4QR?=
 =?us-ascii?Q?XAbXI2UJxg0QH0elObBW5p0WAoKhQ65wVTiIMC96oBFHjfNqccIPlQRG8Sup?=
 =?us-ascii?Q?9iZ8utQQxu/QMYacYFDPEu2WkyD/BXB+/9FZP3i6ZrvFzm6AXd/TFSsnXUHz?=
 =?us-ascii?Q?oi4AkmKAjaYlWn45T/PhdMHAT9R02GkOb9Ou8KxKOYVKl31KPfgRnC1NxVbD?=
 =?us-ascii?Q?9EShI7taIFJsTYiEnsd+xPipXCbUb92WsbzTwte8IMWPp2tInzld8Ibxe7Zx?=
 =?us-ascii?Q?VzbVEjyx8ZdiBGm0/yUcR/JAPZ/pPoTb1IwBO3lcd5IQRsr2cJYkikL4pHQT?=
 =?us-ascii?Q?GNvsEBtyfIUt5++Yzu1H8FRFvimer8BQU0wFqNSKMz5nAoYoMnHYPYRk1a6+?=
 =?us-ascii?Q?uKMgrPDRxuYRlq0rfRICWGvS4ohr7E64YndFezrLCbPSMtqeSOnMBwvg5m5i?=
 =?us-ascii?Q?rPHAFmgkooFhVUWUNwejmEywpQig7Q7/wUF4m67iNnnsOtfG0sBKtLX4vkor?=
 =?us-ascii?Q?YoIeCzbilQ3REhg+SEzRqBzeCgCcj2/XdjLA2DVq36dh+7AE1FpWqSBO7fpJ?=
 =?us-ascii?Q?X7KopALEa0Q3iIGIHr6Jmk19QBHO3t6Pp4I9BQrkF7hxs1kJRieSQ61zBee3?=
 =?us-ascii?Q?RKLSlvnAT+D3K0w/vpfhjb0WtzPRMdllTFviIUK+68OhI14ubiPA3adGwhXM?=
 =?us-ascii?Q?O4LHKorl8ijQizRNx8tG0n9uQgwn+OU=3D?=
X-Exchange-RoutingPolicyChecked: 
	gL25PCqMeaEfiJG+Fp9NRGCAqr2piNCinipf+9J4BvM6/v0Vr7z89U54FdUnqbcxef/6uxmJJTbPWsgkuCK8LncYKO2JWlwEk4T7nimrXxAFUN3WfUYsfbeDs1zSf6veBNldNKCmnr5RmkNzveXHI3D5pTZ8BRibZLk/SeQWEoObPDz3CLh9hO3/D1r+R3lgWtCv31r8t0zjVoAmulVCawMLfGyjAlmtN5sUTKebyA7jR6Fsn0rBa/9tlaYOpPmde3MMX9YvP3tFraGBtQ6L3+iefoUQDu2ELhXqy4NvrUxPQOafZZ8TxTtUrK1JEAE61cxI1uE8pD0spOnwtPIODg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba3172e-fb94-4bbc-e9f2-08de9e7b0bff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 01:20:45.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT7sMZyK1wnPBT8S6jQzBF3z3/ii9nMJj655ypcnCOuYkLxgCuX8D5350AiN6Hmm57/WKM06WxwpkeDd2i+QWCUnh6brj9QH0kVCMJge11w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
X-Proofpoint-ORIG-GUID: iymZe2YXG0JKSuXdL3_fWQayIeQy-NeS
X-Proofpoint-GUID: iymZe2YXG0JKSuXdL3_fWQayIeQy-NeS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAxMCBTYWx0ZWRfXzjPSWNb61JGn
 CZHausZlbB08doOtucpUzaxRwUmhfN2UNhO+fbkjw/dtBbieTslLqjdtOj6MNENToKKBYOkPNmD
 3nssgvyWMWVHhmZJpahVaugzyJpMND9d4oS+YuxXtGA1cXe1vgvCPgrUg/OfY66Mk81h0re6ehj
 2BIqlFq+iCvNZg+zz+ngFukyS5Vu3rhcCr/pEAuyLMcszxxeSn9j7lEacHDaBscNkzw/KnGkIyV
 LVcnMEIrchATS6ZG+LnOAyFi56TkFjovg7eFS7opZ2acH3yLQYjKLnEwIfEXBLqvArMBx79La8d
 fVgrBIDQRdAvFZ/FQGbDfK+6r9rjDfaAS84H9Q2tEg+hAtBftEkqYMJakUb/0vviv/ZooPF3rq3
 kEs8lpX8cYV7v7BdGQUMIqETmLr/VRAbX/r65mzWSlsO81NoJGO9MmZHgIKaSqzRCxMoW8W72zm
 0WH51Pmj6MOkQi52lhg==
X-Authority-Analysis: v=2.4 cv=WKZPmHsR c=1 sm=1 tr=0 ts=69e57f70 cx=c_pps
 a=ueqEiCdEPg/1B0HMGLd3rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=VPtDWs6Jnm3IWv-4U1cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 01:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235528

This adds the static postgres UID/GID entries to static-passwd and
static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
running reproducible test.

The selftest environment requires static system user IDs to ensure
build reproducibility, which was missing for the postgres user/group
before this change.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 4cc37ddea2..3be8daa016 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -29,4 +29,5 @@ xuser:x:530:
 seat:x:531:
 audio:x:532:
 empower:x:533:
+postgres:x:534:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index cc6c5acd5c..0771890cbf 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -19,3 +19,4 @@ _apt:x:523:523::/:/bin/nologin
 weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
+postgres:x:534:534::/:/bin/nologin
-- 
2.53.0


