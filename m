Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760EBC3065C
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15759.1719826021697517052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4615CoW7025585
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619QxN9024387
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+w4h20Mi09mCSmo2zMZ+wo7yKH//KuaT/kSwUvLuisSbaeZLThs+kF4DQLMLNVhknFpFO6pQX71UMHjALhl3CGAWM550DP968Ror/BtCIe3bYcPJrgAaWWOvfl3kFTMOeZG2UKyqdKuCquK3d+nv6MMarCqw0vaTS5TEgM1HIS9ZSfO0wmyG10YwlduZWWRKkNWJ+R5JxGL+Rwt7yQ8/1z1M7PykjWAzqiJ9imEHBHQUJvjJftJfYWS2HToT+fMgmtiqCMhdgV/FCb8g9e2hY8YBs9WJJAraF0FC0q0ufezf+LzrAnvDM/0+c+LKgH6Ot+fgqxRJm0FO0TCTS3lyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jB9UU4bFBZEwhxcJkAtC5HDSNnwNvKUeWDMk7O/VGi4=;
 b=f93WYbtTxWuhSsoJ010G6sbYNDNnhJkiXLcmcLiW9P2VKSaQziPOKJ2N/iu64LiEg4Z1crg9s+tMI2CwHlCclxkuRCMK5p96WThhApVEPkQmDzv8g3HXbTZP+MMhGAqYA0CztfVdaGf/MiDDNYBh/cr8/j1rYM1SHZhTDwdN2rZ/l+zsUQEyAbDicxJCsGwXdRtopqaAfZIb6uJLLbBqnwQAigb2o7IGxvAHpM13fSqb2m5fvlUMB6sGsyk4XiHPeC7+K1X/9Tio0RjUQyRxXXnCuWT6iwCb/Yf6TZQZPVmKEfABic8eFNJD2OE9nQe/cbXzjci95XC0n1JMLWq6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:57 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 6/9] rust: Upgrade 1.77.0->1.77.1
Date: Mon,  1 Jul 2024 02:26:33 -0700
Message-ID: <20240701092639.1498856-6-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d0e041-ec91-454e-70ff-08dc99aff200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1BG7DWXPzUC4PlYdBF/05z4O01LuZhCB+ZGFBM22XAZuGPP6B/vv8NscARov?=
 =?us-ascii?Q?jI6mBG+wH2uBF1dwIJ8uIqu9IyaxkGyIqUZLlIKcGW4jjJ3g2VDk/VbXeZqp?=
 =?us-ascii?Q?vkRx6K1ySH+3wR3gy+Uql9ve6/8BCJoE03tdZ8zYF8MPfnuLpSLOBn6VdQSm?=
 =?us-ascii?Q?e2FJId1WmARAMCwESgZmiq4V+hYjnZ2nq6nsCaXQFbSn8Ms6stWdpsf4Qpxg?=
 =?us-ascii?Q?VJXp7Sfbcu32axQ4u7IAuzcgcnxeZIpz9QZdrKJdEeYyv8DAc32gYrQ8AYvd?=
 =?us-ascii?Q?4z3HEOec6Ji4WpoiKjJQAz43efkkrLuWXxn+bcsL+Z8MP+vFnof4KZJiWZmL?=
 =?us-ascii?Q?bUmWBQ2SshroFO2BDqi88mm6+SN49An4R2HgN3C0MEsCumh896VYKbZWi7Vn?=
 =?us-ascii?Q?Q0JLnwGLBk9iXhpmWFcxWAlO2BaZDK7HGimd36azes5ooFz2XjYrfOs5+nsB?=
 =?us-ascii?Q?zhAgJh6YJ5hw83mwtpgNcjL/kyG9yroXz7F359JMJz5laR3ZkT/Vs8Whc5xb?=
 =?us-ascii?Q?TndumKfWUeptQEDa0FHdjUUMBkDbiia+fXQDnlmsp8TkIT2NSBfM02p0s5uz?=
 =?us-ascii?Q?PN2Pnmr631xlFZmaB7i+Z7hF8kN/nfzltPGd+ChkqIKB+WWoSJM0F8AL0QhZ?=
 =?us-ascii?Q?QNK6hm/KUSQXBfH6SZ0hAqAzu7HyhJNZzQF4qZcBt2kxwHNcvilbH1CQ/i5C?=
 =?us-ascii?Q?a6NVnz2CxgpOAXzdK3LR6rITbybb2Lm3UMCdSHnCaays4pjSNbNIH2DJHXlH?=
 =?us-ascii?Q?ldr2C8iUmd99cQK+SkzMPbOQtsuR1N0T9oRC566KsJHJfkb1RQBvu297Z7my?=
 =?us-ascii?Q?rtNPgrH3KzMT7toPVVbIb1KBcHtQRa2ziRDZ1jI7TZSsvgcDau4dJK9PyegF?=
 =?us-ascii?Q?9ML3+fSURSi8n/p+dlxu3z5SaArGmHUS7HYCNI10IdBihw92yKwcJcVh8N0+?=
 =?us-ascii?Q?a6l6Q629wG/JkFTTVtLh/ZGZL645XLGeZF1CghBRfgied+ppUBkyBJqw0S8G?=
 =?us-ascii?Q?tBlpxGuRj+CWxBH/MPLcf4r8DfPC2TRRpmKGnbBBx0XDlB3bvAvmpoSu5rC0?=
 =?us-ascii?Q?7RKRHtRkabilDlFVCaoJDZrMyhHxTbEa2X+m2hUds2F6IYvoeZyxUE84Saco?=
 =?us-ascii?Q?x5BPfBvElHtzwr6xLEoJgfwI/OPkh5plUmXeD/lmukAEPKEIiWX659zsrvG2?=
 =?us-ascii?Q?tJXv6KE/GdGL69FCRw+8Jfp6ROp7iLtEEbxj+hF0k85PJs+zscx/RxW3gunl?=
 =?us-ascii?Q?xtV43y521FRE8/2xnZhvYOF5JV/m0jXD5sC4oSAHjudfvkdhrN7gfssfZQKv?=
 =?us-ascii?Q?furV/N+b4x8PsqHSLPTrSiDUoctocSYB5h4408NE3ZfdG7PGy7vlL6r4QTmq?=
 =?us-ascii?Q?yKYq5s8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fMMykr76+cDSykx7CjY6ub5wPydPS4os8GrUnA+5OQ01Ts/HFg46mH2Yp3cO?=
 =?us-ascii?Q?7xak/VV3K6VM9oZaeIhJ5yvWcYI5wxY+YFb5DVNNWN27hHbCeSDhi4MDoD0o?=
 =?us-ascii?Q?Ue6uF+TwFVNnkp7GnXPtXnEv5uby5y+UHnx1+uz5mM8NYEpqyUhnwJGnAcQR?=
 =?us-ascii?Q?pSKc5FuL6rvdA8sWG1WVdgflcFe9ZYaQerQMuxl1JytcsmQrENYeeXWknsKR?=
 =?us-ascii?Q?ruPtkgz32dB+5vKZAwET0KdOLjJWHqDvg613hpOJfRIQMOwcsCH59YBEMKRv?=
 =?us-ascii?Q?on+IQH/rET5TM26VKw+ROMV3VFbYiI9M+Q8tUpbuYt5p6tUG+CdmpeJalVxG?=
 =?us-ascii?Q?tTFHnp9orb2Ahjv3iH53KG3vviHNmKsuouOA3zZCvS+BZk/JbUsVrdeUOA/O?=
 =?us-ascii?Q?iYPMcQ/KjE8NRdCcK7QvpxQ2N5xZg2CMgz5aQgMQPjGiSZYUPsXk8jgQmq4t?=
 =?us-ascii?Q?Q4j6441nMLL0+GND58OTTO6EV7n7hM029fHVnAGsruoHI1zjHlnKY+Ntexq+?=
 =?us-ascii?Q?QAOFe/WmukMc2LPpPQQk4iWRU1v9sucxOXu7rvLDVwDN7cfxJQ3UeKsE5zZu?=
 =?us-ascii?Q?vFxGReYYr76IwAULhZ8by0MkuodA+g4BFQbt+bhIbZyDhWJVQr4Nt0Ih2foN?=
 =?us-ascii?Q?OJh0u14V+zjfmQTvXptWpcANvZ4p0cBZZMyH/pEd7sb2lGYXevtbvNmixDsJ?=
 =?us-ascii?Q?xpQeBPdzcBPbCnbmamQA7LRuTRA4tq2iV+vCvqcYS91h4LXs7HukszIV7G5L?=
 =?us-ascii?Q?8Xeh+hkbL2LIhCCFzBb/sWbMoid03EapLZJukrCdyYPmz+i1oR0o7sQWPY6S?=
 =?us-ascii?Q?HLL0EPe7qA3gHrN+X3o8AProzpuWMCmi1D5C8NyHerKxvJVwgVfjvyodYeag?=
 =?us-ascii?Q?bDl091A0wuH9fu24/aJrGWgdjMqRsUmQNycoRBHOP+VDYFna9kwpjpTiSzmz?=
 =?us-ascii?Q?zh/XoV11cqZKu67XgR8CeXX1Oz5CsSK+WZYypmidp3GArCViG2KIcBfkdZYK?=
 =?us-ascii?Q?LBRz3nxrnT8U9MZOYPckBz6MpDDH5WkuCA4/XMACEQzTFKAepzXzDN7vsEkq?=
 =?us-ascii?Q?vTJ7xOXIdht1xtcha+dGsr602N7AIDVB2/1hBVUYWCrotFAYTxUN5SEbc71T?=
 =?us-ascii?Q?xj5JyJ/Om86/aXaDUO6T7wTynyzGKNJdiJ219YzDxP5FHCe6k3k5YG6vFtVQ?=
 =?us-ascii?Q?GGwkpLiI/T9sYAtmSDM/8/j/MTFDJWJV++EqrzaQZ4vAn7RY0lV1Ut7wtc3f?=
 =?us-ascii?Q?y5IVauLHZdI0wFQwV1ZJYrFDQ9rx2r75KqL+681BfUgghW91DLoPxKLJY7hj?=
 =?us-ascii?Q?eMWBP0TG0QzT+Wgyxdje9/cIYV7L3KzyI0cgSJifEv0BjEmLmxaLWRXg6bsO?=
 =?us-ascii?Q?vPXrSvZqRsL+jYqls0ZyMCud3Nb3WSY3JTbJkoDu09+Ios4xpdEUhDO0iA8i?=
 =?us-ascii?Q?3EgL4R9P+8XPhRI4YoUmKzQmox3QsHltIwvECV2AXiUaZSGdcizubyptPl9h?=
 =?us-ascii?Q?eqvGUJeTx+J+ZUG24OOOkXtuTexb4n2oKErsos2aSDrC/pVnZ+6T8Y93+HVf?=
 =?us-ascii?Q?kc4l5YsDBADCICRDaN2C8YFMr26v34qCghgsnx9m9LFs5GDwDxb3tFyIrowK?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d0e041-ec91-454e-70ff-08dc99aff200
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:53.9133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1r+Zsj7Xp83tt0NXExF8985qREQmefpsksNLppmp303/08Wva+GnjgiQn9SUpHl9KDs1PIzNkrJZdoxcuGqZUpC/c/keczoRHhk/8dzXXm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: grrc9A9zcJsXxgnutUawWLBzd6KQTV-k
X-Proofpoint-ORIG-GUID: lMtXc6qTPzYm4NhQct64UaurdHAcn7I-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=824 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201289

From: Yash Shinde <Yash.Shinde@windriver.com>

https://blog.rust-lang.org/2024/03/28/Rust-1.77.1.html

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.77.0.bb => cargo_1.77.1.bb} | 0
 .../rust/{libstd-rs_1.77.0.bb => libstd-rs_1.77.1.bb}           | 0
 ...t-cross-canadian_1.77.0.bb => rust-cross-canadian_1.77.1.bb} | 0
 .../rust/{rust-llvm_1.77.0.bb => rust-llvm_1.77.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.77.0.bb => rust_1.77.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.77.0.bb => cargo_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.77.0.bb => libstd-rs_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.77.0.bb => rust-cross-canadian_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.77.0.bb => rust-llvm_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.77.0.bb => rust_1.77.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.77.0.bb b/meta/recipes-devtools/rust/cargo_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.77.0.bb
rename to meta/recipes-devtools/rust/cargo_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.77.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.77.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.77.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.77.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.77.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.77.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index f4a4ad2448..d42c2c10ca 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "66126989782cbf77fa3aff121bbb108429f2d46fe19328c3de231553de711b90"
+SRC_URI[rust.sha256sum] = "2ddc6f5e01df1bd6c7ff94d9931574181795a231b199ca6948d433fa5e795873"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.77.0.bb b/meta/recipes-devtools/rust/rust_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.77.0.bb
rename to meta/recipes-devtools/rust/rust_1.77.1.bb
-- 
2.43.0


