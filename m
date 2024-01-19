Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCCBC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:44:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22326.1705671878585065592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HwtDvrg2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J6vjxJ024637
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=; b=
	HwtDvrg2HgwHvI/n6qYokU0r3wsV5eyI2TpX+I4RTgWUH5BBdn8si+atKDMcpnZj
	IWYYzyVBJJVYJyKOq2zLtaWNwlKMD03jcanwMJChGTBHH0hugpAWOXQGPP7Nz6MD
	wt9rA1QKqhoivdDPY/N5odleUkoCblpf2iK3RcDdLDUoT0hBlL+Wn+xTP6wUrntr
	+P+ldNn+nCt34IldgXXcutJZeqU+HzZv2Il/gKXDGY826h5E6W0GwW9Pg1Hu/rWs
	jxlcLEbt8HZ4yhc4D8akoKIZ9iO5tmZQtaZPzeaQfDgoM5mKjhelQiT4Jej34ce1
	1cPkBrXOsv4pg3NONcpFSA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkhg671h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMjbbrZUCleIhTjDqeme2dWtYSXlbjDY6NjhT/HmGKbSXxgMxH2+vA9UlikIqlb7uNOFkhtEYeoW5W8OVHQJ7X9a2IOdzykr4ey8NeKzr5ZQe3qiLtSWj7zfQHAI/1cvL+rGvsygtfQR1TbKvUnG1A/ZJKGxorJ7E/30gWiMNtT7KMrRY9QnrCT4aWFxb5jHLTZR6Lj1B8hiWMfiZ4jvEOeDWQrMtzTZAg1uaG/gKiTst7oemv9Cpqg1BBunBrS5PDWkIJoxretNEaTaUzeTHOIiinX4Yo1EvbG7jKkPtApk/hCulyhEv2r9hOcg4SFbapMKRxJOw+s9NyMVB+Kl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=;
 b=KR+BIvob0WwQbFRbOgC2nzahREz+HZ5XqZ6DLfPYiTevb50SoJdZje91cxg1rd8j+EwdrYJipIkkxej9RPGnlggxooVQ+O8SJKwI/NOprJmmLVMkJwnUqV1VQiQ3TWK6h9eOco6faB1fWsX5pSQ1ElBZBeVesjeaI7MsXQuRXcSmw4Dgig/x2/fuZ+XMhgbfjEt5YLSJ0XhXvXlywKs4tc4vT/4Z8L7fT+dXhhOnDyQ/eYJG7uCYJF8YnUlzwQEbi72t0eCQzY8nB9EXdO/sHN//ZaLfCeDVNiWQE2kIiT4PGrtWsRZH1bdyYBtLq61wC4bgoQuVWcKQQCE+7Zo4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 13:44:32 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:44:32 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 3/5] rust: Enable RUSTC_BOOTSTRAP to use nightly features during rust oe-selftest.
Date: Fri, 19 Jan 2024 05:43:50 -0800
Message-ID: <20240119134352.3163178-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
References: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:930:8f::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: c4670555-6558-4c41-47f9-08dc18f4c3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y+jXUGZQeKIPUEvEslw797MgkBKd3EfSrjp8xdUIGp6DfS8aEzqxRzGom55h51cCh2KLHiH6htYz9UC0BhfG6EnstYYG35tycytopaY8craDsNOJ+eyi89/3p1oTJdhOGLOemtmCKtaMfI1wxtolzZnIjzIuQnKdAreR51svu3Y9QL9wQABbdzrvHFngNIgmrzgs5a+tyAqq4B/JC7H1Yg6mBBS9DbgVfTpf84pxqsb9+LhfvNwydndOojled2910ZjOs1DAfMq5pxh1eex8esIU3QQcpEbttWM84+ZWx3fPuKQFdE85pHUccfv1iJye1RjkwJTUc9ErLKy8ZQQur8TsOTh65X2DQUYjIh2lU8wUtpY7UQICaSngEmZI6i/rBQjrLR9TLoN2EUoe59GRbJQzUQiq1asI7xIwh4ZWjTKsFBR84pemqZPTrqAVaKNXZAniODsUNMZ1Jfkfv54HYW4mO5z5Ftr0gwcC8iv3jms2Agk4yO4h/usDxhu0dFk2N1eInoI0qAnzF4k29fY8B7MXT0Pn+TPqrAEwrpHN2LTyhuUKJb5umiMb25awjk3fBHxiVO5ZJtZzc2utobumS4jX0XQ+x1Srgf2//w5rEak=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(376002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(66476007)(66946007)(66556008)(6506007)(6486002)(316002)(6916009)(1076003)(2906002)(478600001)(26005)(8936002)(4326008)(86362001)(52116002)(6512007)(5660300002)(9686003)(107886003)(8676002)(2616005)(6666004)(41300700001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c1Esx79XUhEkkYCZpiy8XkeeXbLrfbXldMvWjGn7sMqr2244nBR6J0r+uo3J?=
 =?us-ascii?Q?skPcBNyz4c95smqua4sd6MNl2SbjCZPQvEw4udjjvtz7Q7IYmBT3lO0sGPWm?=
 =?us-ascii?Q?UzmQBx0JqMU8KWcajAyQDnCIvYFs7TVggjwgLSo6bV+scCHK/pAI6y/67BUz?=
 =?us-ascii?Q?kdWyffgXEk7n2zYEyOxYx1HcfLb1oaLa42lrJl5ZNoGidIGTtPPL70eGPJV5?=
 =?us-ascii?Q?N5OKRN3zslOGBELKoTgcjxibcdv4pvAYvI0w2MoAHwnhxPEodYyaaXDfL+yR?=
 =?us-ascii?Q?+qMIjCmkrA6HEyj02kDp706Fdh3ZauyBCpgaYaRgwJqFXulSr18pBySdhe+m?=
 =?us-ascii?Q?U2YjudbAVpBYsWYr3La044JmTilWEGW0JTWuMW64bCcCufa8W2TpG3dpD1d+?=
 =?us-ascii?Q?Z9jHJ+t4BN/obv58HKA0pcU2GK5vOC9Ty3DYd23mA3L4hS5RrXUg6FRnPXHn?=
 =?us-ascii?Q?I2UtIQXVQ08dPHauKvTO1ASmqb1/BgGgYJuvepEBbUCsTr0KBgbzCD8JwQgn?=
 =?us-ascii?Q?qZcdM4VoiI2qOBcmnu55BFqN/d1sCOXai/eZTvDx5djd/B/U5GMyZekFJ2Qz?=
 =?us-ascii?Q?x22TnLhXUlFVzpgGdXijl8nZzNhc7bdDb850Swu09bDiSWz1SaCT/gpajBRP?=
 =?us-ascii?Q?foHP2DosyJ/BMzZZfNt3QT3teAngqm58q4O8odxphp8vYYeEVPiP4/THWrqa?=
 =?us-ascii?Q?JGQI59QbGi4O9CoM1ZZ2wRWjgdJgJ3bF9pKabF81hcHahLRyCTXPCaaIqaJH?=
 =?us-ascii?Q?GBzuQg42Tj7Ag66Pz9JSQqL1qs9VQXfyrHTsyMA9g/1prF/C9SqwmLTzI7HI?=
 =?us-ascii?Q?rp/l3APAzUx4jKTqnz7JxgREjOgy3+lxbBV0bspDBZeKnhNdhSiwFHJTUlQ3?=
 =?us-ascii?Q?2iW7icd0y5jhjsF5E5kcnb2PkD/OROBtT7ghprUrvA9XKOxa6vRD8yv5tDpD?=
 =?us-ascii?Q?Rtq6hMDQikyeqtmx3AqfheyF0TKJSTYS3TOLITvhiwuiJ5Dj4oANGpwh7Blr?=
 =?us-ascii?Q?mPdWyYc4jxxRAYFVUXjs6odPdtLeAjd1kBkayCxlHw+Kei4v0NbRj3C/esH9?=
 =?us-ascii?Q?JKG9KJf4VQxqzFdiETiH2RjgSSGFmpfmb8b0gwgQbjKrM1CkTy0UNJByIB/C?=
 =?us-ascii?Q?qspG7xKFavSa1lLz9/Hj+quZf+PkD5Fyj0kwWJzyrH70v8GyGtXm3EvJ5DdB?=
 =?us-ascii?Q?3dyPpWaOnNIFb1kQcU9Ix1Gq8cJP62tAxe1LM+JeMjfEDDCs4MBWJoG08DV7?=
 =?us-ascii?Q?J+AS/3bVXmJJLLedU/Cyctyv3iFLBq4YILD6ete9A6Vnmc6erUXj1PpRPk7c?=
 =?us-ascii?Q?Q/QhQSdJLsG0nEDp5zu2IcAARxzauARpaLpzHRBgUyky/jSgiFZH2QDF7kF4?=
 =?us-ascii?Q?cn2wWcq2cgDqBXGHWgc/MoG9IducHaX9EdUdob+x80a0tc14R36pDHdrdJKG?=
 =?us-ascii?Q?lJmccpOptFEUwlLLhdxPZF5SfLwo1bn3/LGz8QulrPkHOe7uF26gj9ZBwdDb?=
 =?us-ascii?Q?keappqvg4XO22PPCBkubikNM0vF3AjwbfSMWA9v2abTOazlHA9ArZbBYAra8?=
 =?us-ascii?Q?U5lKH1C5TzYL4WUR6NQRvhunmZoMwIeJeehPFX0DuYyEomJRu6Cn9JnLdekz?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4670555-6558-4c41-47f9-08dc18f4c3f1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:44:31.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tk/ZAIGWFpSgmGeT9Pt6QRVk8m331Sn+ugMR8aCEbp7qh897+tiwJ55YMhBLyMqCBJYqboUkXBX10yjiCHgVvWE4SvNC1cgpYycKjsNJCs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
X-Proofpoint-ORIG-GUID: bAuT-tuxpJ410RTDacLtwrohIj7DpCWn
X-Proofpoint-GUID: bAuT-tuxpJ410RTDacLtwrohIj7DpCWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194047

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: error: the option `Z` is only accepted on the nightly compiler

When rust.channel is set to either beta or stable, we can't use
nightly features on bootstrap without RUSTC_BOOTSTRAP.
Set RUSTC_BOOTSTRAP=1 to use nightly features on stable or beta.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/rustc-bootstrap.patch          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rustc-bootstrap.patch

diff --git a/meta/recipes-devtools/rust/files/rustc-bootstrap.patch b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
new file mode 100644
index 0000000000..406fc610bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
@@ -0,0 +1,21 @@
+When rust.channel is set to either beta or stable, we can't use
+nightly features on bootstrap without RUSTC_BOOTSTRAP. Set RUSTC_BOOTSTRAP=1
+to use nightly features on stable or beta.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/8aa7dd06f6e50621dc10f9f9490681be8a45876f]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synthetic_targets.rs
+index d2c65b740da..45baf56f46b 100644
+--- a/src/bootstrap/synthetic_targets.rs
++++ b/src/bootstrap/synthetic_targets.rs
+@@ -59,6 +59,7 @@ fn create_synthetic_target(
+     let mut cmd = Command::new(builder.rustc(compiler));
+     cmd.arg("--target").arg(base.rustc_target_arg());
+     cmd.args(["-Zunstable-options", "--print", "target-spec-json"]);
++    cmd.env("RUSTC_BOOTSTRAP", "1");
+     cmd.stdout(Stdio::piped());
+
+     let output = cmd.spawn().unwrap().wait_with_output().unwrap();
-- 
2.43.0


