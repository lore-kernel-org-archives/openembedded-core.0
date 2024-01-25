Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12D7C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17242.1706188617668439142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ouDtCdGx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PBxDKH008911
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:16:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=HVIr4N4QRpj7gvSSgC
	4wFOmc2OxqGxOJFQyLggsPjJU=; b=ouDtCdGxSGFKUjAknzDAS3RArm8y4apzif
	adUvDEP6UKuHnbSkQJlJsekziAZm8Cc4NfJv3VQDqiqkKWt7z0lw18w5O+ufBt+f
	is3bZjl1XWO6FEWjEFL868TipPF88nNbeJVZJMZBqxu/ksUJgyQjWymzn6L2M2ok
	7TrC0I2zn+yP2eXyLCcH8NgfkMdfgI0QlFQWBcJlmTMAk+pa2jCtWL8YdJ/OuT1t
	sh+fbanpGhvQz3P1txciyJX4DYghFow2qyduMTSXsKWoxLT1X9qGGxnZ95EF14q+
	zJLt20gbKbGdh2ZXWFaDSgc+scs6h0z7KF4XAFauNDcEzuPTaznw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5rgua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjtdBXugo9RI8gDrpZ1ni2jnn78rQijov5GVL+rfqLkH/qZTnWINC7j8vj0q2ONGjdEGBrYjBJtAkKOJpTbqB2Xk5KE6JBZ/kD0LHCJHUlKOV91Q3utOCEiDqUo6pMR+uZuZIRzYGrpHgiCHT84qsuUFMPJKLBvLIlEkENpcQfZTkugODKDlFjIZ6uvDKXazMT/xehO1CnlYAEfpIBZcDW6km4TM4hvfGd9tpr2BiLrK4BlxiAEbKlfsC3E5vRpDnWI7jpbdq9TQskzaHZTVKd7fD5HvEF4IsoFUDneuifzOM561mlo/l9UCRx+5MqIC3FEDWmfmsijQLxf3fgopLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVIr4N4QRpj7gvSSgC4wFOmc2OxqGxOJFQyLggsPjJU=;
 b=J0lTvvjwNQ9f1iElNuenets8SJi6W3p20dgL7dnRw73qHTPdRcNtdLU7CtNVWG/QTQA8Vg9scz+Ob+tzuMD1qRDDf2F88CDX4PM6MOt5PSuBVmlmU6kd4lgw+EVT2n8kPxxKwK1VwBxEn7THf6Q/e7LqJmP3WUzB88BLTkavFbLaXstrWaUarYmisfidPNqD0Hkuc4HhzmE+haFEapL6+dZjG8NT3KRvIYaBVaTyUKNVIBAH5M49ou7NtMRsP29YD6JB39ETSRRnw+pPclGjjEkcY7oAflXQjj32Q91qpAbWDEsSyAceO6XMAi5Ylfhm421EAaZtPdUdAbb5bN+5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 13:16:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:16:52 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 1/7] rust: Fetch cargo from rust-snapshot dir.
Date: Thu, 25 Jan 2024 05:15:57 -0800
Message-ID: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 398d7303-f9ec-4866-2704-08dc1da7e554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	08JNXZNFWwNp3u56dfg0oRW0860aNg1zd6nmSwZEgT1KriAM7+fZv3myaDpDCI6xOq8qQro9D6llv3qKZVwIJ1idPxOERv02PhFhDgjRzCQclRcl4BZ4Y+3CIID8DYic4+A8krYH4aJvTjvh5KOLwOIP9qiBHiwdIosFp58z0cHDWxWlhaQv9EQgqlSFbicqv78BwdX9iJj8SD5rHu74X4pDpc+jSYcJd7aZtwqMAXM7gpiK1ROd6m88yHSs+KnwTP6rrajxu1cxDZlZW1tWpQ2XaB4LdowlbbXrFVKRNtofELCt85X1oo6TaTp4C4+09ehEB5AmfXYyjuIdTJBeZ7yERwMi0KYMJYQN0sezujzofULFSKmWJvYhjsC3hkWIN5RAN34J72xn0VCkfeHbP/9R2BGpQZUJ4Ui5306oQ6inL1Hm9VxTcgmusAPIi6yDUYIEO3lWJ7C5czyE0qwrTqfAxm32uvHkJ3/7C4Ct2kEQHJwm/I9E3Gbp/qtFcdpDZRxjRHcaWIs5bfHBvyFvQ3As+R4MhCXeIVx8oNnRhUbkgSyaCCqWNHtoSm1hskGK4TmJAUsT9ji6T/vudhyJzG31MM96vznLddTEP4aR0585p/Sd5Hn0DLAEhpmkfpX4ChW1SGHTNVh927wHa75yAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(346002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(41300700001)(9686003)(6512007)(26005)(2616005)(1076003)(107886003)(38100700002)(8676002)(8936002)(4326008)(5660300002)(478600001)(52116002)(6486002)(966005)(6506007)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(86362001)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LCiQAZU+0dbNlGVflIcjze2Qa4LyR7WuvjfRqd5tYeDmbj97J8+lvzKbDrJH?=
 =?us-ascii?Q?vkzD5Vq/ZGmd0e65rOe/07xjuuaaFxBWY9gqVee+ecedmMui2C8zTcsHTj02?=
 =?us-ascii?Q?nya5BNurJLEc1kyN20AjLW5pBzhUlp+8KT4pOcK1Oxv4FRkHYbhr7DDH3wXY?=
 =?us-ascii?Q?Cu0yLc7HsEO8PNYpnd1NnAsZWe5TwyLVm4lxjM0HeWHTlwOZa0zfcZ4sJb6r?=
 =?us-ascii?Q?bmJ6nSPWWC/cFDeu6gvXzl4QYNr+0pi84J58OY9nXIuqYbX3y/sRJl44fvJN?=
 =?us-ascii?Q?UGuVg1RaJx5zt1Cb0SWYuFPlBrKKYGDVJYusC5vBbkSG2akiOI4yTIlS1guo?=
 =?us-ascii?Q?uovS0MAgaAhEgRA1PybZFSZIzMzTaTvIHjarF8Gh9HkAhr/MyiZCCE5IpXxY?=
 =?us-ascii?Q?0lGFrVhDCR1winrDH0shC3FOCUSLIQrTOFgV9hJkTfU+jnALrfupGdSbr0Ud?=
 =?us-ascii?Q?l5y4hZDYEvr0MXSFo8gnMoOO8Ax24jd4ZI/vcDRYCY4Lv+mZ2E710cRF0XnN?=
 =?us-ascii?Q?7WlbtsoG0wghdtl3NMN3oeEV3Mq/81mWaDMTIwCEpFow6jtJp3BezbjzKubk?=
 =?us-ascii?Q?EnzfvbU6tiO66esnxdTTNIUBGJFSb8P99aYgCZD65nWkfeoAgM8/81aDQuh3?=
 =?us-ascii?Q?HStmLlVe3CcTDmZ3MQLGbsz2I39wsgt5Jxm1n09dyB/4hAxCh/Ie7tuudxng?=
 =?us-ascii?Q?ggvJM8G2v2hTijlu2xT16lBXCbTGRxs1DxUBLxCSFPlL72qpcx0d72i6/3a7?=
 =?us-ascii?Q?/E7ZKy3lMOiGmLaboMkzrvbdI79cDp+dBfR16AOlMnQrg25ekd2/zAsSuwW2?=
 =?us-ascii?Q?fAaaJfFSYqC47lgy2fjAJxqVib+VsPTkSFEV35NxI20TO+3IbV5kq2jvPMh/?=
 =?us-ascii?Q?wBG3LUDdUP8TZ3oK88v7LQ+R+cIY2p6EsI44MOv1sU+xeQ20ZZOvHtg6L4Jc?=
 =?us-ascii?Q?pDutKR0J3Pka1NzcJWJ+ciaB3SY34XU0e3LNE8w2DXRwqwBqx/CcRSokfQcv?=
 =?us-ascii?Q?T96+/K6yoGPmZyJPI0lAebnjqh+r+7Bjx7SAk1WRsHbujNGlr6F/iMAVNS/y?=
 =?us-ascii?Q?c6WfuvbY50MlOXElDuBbJ51W5Y2JorYs8OfrY3MrGETGqrs0F1GC+QjIZ7DJ?=
 =?us-ascii?Q?A3fSxYuhxdOz9rIBqORdxSC3s+bcOVCW4nmyU8+oPaMog3Eq41zASEEwzeQr?=
 =?us-ascii?Q?z5c/hcdzcE/cqR1vwKRXMX+LeU90EC5MCMAZhWtHGwlzmy5bkHdZJZQ/IaR0?=
 =?us-ascii?Q?O4CcShjatiLH9t3yY1B+NYzNpyyVRyxFpocgpQULPYE7hOYI/xCsMtyO9Qlt?=
 =?us-ascii?Q?A76XYZx0MSgaR1JoNTBRJt7iLB6UOVAHhazyASSl0atYWq+0RbA9QcWL5Idw?=
 =?us-ascii?Q?GotgPMlN3PFCJeh40wKhVykuC0g0q53MsLJRFV6TCh7tczHaBvfYp6l+jDFH?=
 =?us-ascii?Q?gdsIypNHgbeA3RIDfHSYd2WGnpvsTnxicZHfWfu4+z2jypRB18wn2JL80WjV?=
 =?us-ascii?Q?Syc++cPxv08c59q/wX9fQwrABcA++K2rTNq+YVCC94WE2f0UkSpZmDd+q8gy?=
 =?us-ascii?Q?ihabNqspOGEWXdD7vh3W0o8Rn5H3jI7H8ooPPIltNN3grTIsWj4X32iR0KiK?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398d7303-f9ec-4866-2704-08dc1da7e554
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:16:52.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j321wtV+Twgmt9VN0G/WS2anUihdLrOCQHCupsokCpcMMdRex9Pz8Ahqggr9+n5R7u/986HgixD/PH6eXKcNKm+I/OyKTevG/MHw7jo8nw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Proofpoint-ORIG-GUID: SjQsvcT_nowpfxpgPrUYsZxsxf203nzN
X-Proofpoint-GUID: SjQsvcT_nowpfxpgPrUYsZxsxf203nzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=669 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194320

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: Exception: no cargo executable found at
       `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`

Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.

Patch sent to upstream- https://github.com/rust-lang/rust/pull/120125

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch

diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
new file mode 100644
index 0000000000..84bd580aa7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/cargo-path.patch
@@ -0,0 +1,37 @@
+Fix the cargo binary path error and ensure that it is fetched
+during rustc bootstrap in rust oe-selftest.
+
+======================================================================
+ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
+    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
+    return build.build_bootstrap_cmd(env), env
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
+    raise Exception("no cargo executable found at `{}`".format(
+Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -954,9 +954,11 @@
+         if deny_warnings:
+             env["RUSTFLAGS"] += " -Dwarnings"
+
+-        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
+-            os.pathsep + env["PATH"]
+-        if not os.path.isfile(self.cargo()):
++        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
++        if not os.path.isfile(cargo_bin_path):
++            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
++            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
++        else:
+             raise Exception("no cargo executable found at `{}`".format(
+                 self.cargo()))
+         args = [self.cargo(), "build", "--manifest-path",
-- 
2.43.0


