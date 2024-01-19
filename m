Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2642C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:09:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24478.1705676979372211716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aIHwk5Bq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JCxRaU007999
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=tLe/Fh3IldcIiKhkti
	MhWzvgUMWF5t7FgVBKQCidzDs=; b=aIHwk5Bqc+SlDZg9CAkPRF0aroUcbErWRS
	rue/QGfk59vT6ylOh95tTCSIMp9OexpJYaKIF7W39hqKslM3C2Vxem7aYF5tb84I
	KrjtmF9BZiKoOXd3ih0d1pFOooRHUN6ZTiV8MSxpRFRcU5hM0rxO69xr6caxlMgo
	Uu/lKBJUyR3ArEASiQdtEiazRAvA+QwclDaV6dxI1RdsGED2Gc/F3arMFcW0CfDu
	LAKpusjuO5vZyccupDTeCgwxDGURj7ijZRGoE8cbAE3lHqV1Li0geT49bKAdpiBb
	Ccrhj5RT0DqJq1ZLDrsgnENtWX4ay3SXBMnCtABjDxEAQ/FNLgAQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46w0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GakbWoIegv+Q+v07aFIetUq1Fvk3bXS7gr1qlGU+/Wq69arxtVpEwSlE7X9nmW/T/ZWIOrbjX0QEatCT4vCTkbaXnXIYraOZi7gCzN6c2rYQac/biF5ouJEpzh7CGv9enmrMm7+P12pwLdPfIUmoZirGy6oJE1gahH8zwKdz4HpkyZ0VDplu4MxFKqksFV8IB1ZbmdMQvGY6C9Z0Oe5yQLEL9hHNx3dvqM7Hmbd3AuQTXGyEbEm6JD1OSBZNP8ULgCX6t3E4IGlaRl7JbWoO8/pD8GcUrmExwIHJhXiPnvRVPWOyEYLi4ekOyfaTMOGEvBuy/ITmSfC+0LLF9379Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLe/Fh3IldcIiKhktiMhWzvgUMWF5t7FgVBKQCidzDs=;
 b=h2X1pBRz4j85iiS1VOY2i2jQOOOTCZtiRgjyA1dfcB0tzOb0ar1Vc3d8KUraicHxsT4dqgmXQY+Kk8nBY0hTYxD+zde0SpFNaZp69MNVoy6DjaKTfhe/iPKTP79DehD3Ny4NmGTRtha6e+piApsh1iuzH0HSKXpVG9qV9cv1zTVz3ISRGMP6iaNUW4HQuxinVGl3zGpQKlmvMw043u4xLy2Jod2WVm7HV02NnMX+AdmCD0hw4fAcwVDMv7Kv04N4YknfBenC89D7fv0vU0uRo+SyHeXH6KarJ/Ew7M0kp2klCl4GAqoj3PmfqAxk3367Vd93wNvX94Flegu7gkdzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Fri, 19 Jan
 2024 15:09:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:09:35 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 1/5] rust: Fetch cargo from rust-snapshot dir.
Date: Fri, 19 Jan 2024 07:09:03 -0800
Message-ID: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: d15856b9-1ee5-45e2-43b0-08dc1900a61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	izjoscZUadoO9TQMbaQQHcz3kB8gjNn5Jm4/Ik/HneuGpGKYKMJ+0DpwJD3Ue++XQXgxLLJrKVFNTaJqPo6ctUVGPoh44ot44Ai7QjSYmmLMH6WawUUgrr1QCvISkohd37Jhthtr/tIkEeu9mE/6nB3ZWxkGuxfOENUcGC8hN3AgJZqZQx1A0pOp1FdssaYsPevVRQu2eW7vYJeKQjGeQ7BoSjgZb765JTqXhM1LCu+QTH6sEnYVMx9Dg6pikjz0B4N++pLYpzRWpLf+8QQ1T+mCQgsgf04wLmkuBxZ0J0FZY0LHqQTceuwHCuiu3zzhMDXTqlmWjgxtFWp7EK+/0xdEyeXUr2TovzZ56UDrfJkFQZrCQbTC9AyK3sC30ofaMotJT0KpUJkQ22FF3bnBBr265jX1ps3g+W2q+3RU1KPKsLapNuy6W0tInFlf7vw3OejnHz0kM6lQHUHPL9DXCpElFbb+SEGI68CmHGtg2uDpGIUhkVMd5FD/UVIjkLoux0h4WYoCV5cxh5siI3qbCwAaa5RqWQ5StldNfl0iQMmBDJB4qhySRY65WQpCdvg3Qu+YtSi1114OJAfHwQsuosfmvJ/05AIkp5hsLnpfxu9DlH9SF8HD61qUdHav+o2q0Xv5nQDs62IBZ0auH1jtig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39850400004)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(6506007)(52116002)(83380400001)(38100700002)(107886003)(26005)(6666004)(41300700001)(66476007)(38350700005)(2616005)(6512007)(1076003)(6486002)(66946007)(9686003)(966005)(66556008)(478600001)(6916009)(8936002)(4326008)(8676002)(86362001)(36756003)(316002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r+PK9BTxiq+ru7E4tig7v2nsnLfAmkLwjgDKPsoCJ72Be8VSTL8q1h5shs99?=
 =?us-ascii?Q?LydtGE8BQ/mgKXd8HK4tUgNCVmf9LSsPfEjD6mr/y1gnzR3vW13CTF0Sf1At?=
 =?us-ascii?Q?EXAKBK2Msjm4o8T6BBKBPMOjESPpxcf1wk55bp+0mKtIyJ/2IizArdSAqDiz?=
 =?us-ascii?Q?r3sks8NeQorKJFvODsbQ3hMO6oOxfbvLmaGyiiz5IxVo2aYjMIy/s2bqLhO2?=
 =?us-ascii?Q?Hpb6VH3S2lI8zWlTHQX02ZuzC4z0FmtTmRyKeW19AtM2dFmGeAyV9Rs27CT+?=
 =?us-ascii?Q?o+YipKUhI8dzE4JM+nm2CThmfyuQqA8vUtq+/V6bEg5t00klcEipjU/uFJ6e?=
 =?us-ascii?Q?iSJHbiXA+GBLpXtq5lvJk9cSU88QJrXIyXMhf3nnCShCShqa+zG9W0Kbu/YA?=
 =?us-ascii?Q?IK+Q20xiQDdY7c0CZePG39ACLLIdKAHwCNDAg23mWVDNXDpdRzTzDMC4vw+K?=
 =?us-ascii?Q?gWYF9+0VADQP/qnQyUj8PZ7UZigaq/3sa+a2owI6zWOyjAqlgNvCn65vjH89?=
 =?us-ascii?Q?a5xQzkPow/nd6f4NFy0Z6XoPIM13EdifcoaTuTxgbYOEGTj07X43Gr76z4Pq?=
 =?us-ascii?Q?iUw+YT995XjqAR1gYsZo7khFVRZ9NhhrDEnf0g5+LFMN9xUiatDMBO4RFgIj?=
 =?us-ascii?Q?lOk3rDueg2rXvLktWou+VI1XddfqKAUhmCOXl6jiHu9RQmyNl65nmZxLJTCf?=
 =?us-ascii?Q?0hS8gPjMA2p2qsmkC70FHBOtQ1BK//CtF6fAvXgn7cHZU/XNVdGBAx57BkKf?=
 =?us-ascii?Q?XOn6l6F+xdJZSzQxi/jeiQOEjXm6+7lSvgLVr4GmSNh1J0p+rOUqSGAx/R+i?=
 =?us-ascii?Q?BGZHcPgw0czsCbHzBnny1J4+JszaJnEFmoalXKXU+3RoW1iSeQjKNbUhWEu6?=
 =?us-ascii?Q?UC9KrUPAA+I2PeCdvjJY8TPal3fqcVKfSXWE64DUGwgTTvXuMuR7GI+Hcvg2?=
 =?us-ascii?Q?OMurmqc2V6xcpTC+dj/pgK+InIJm9CRO7G5Ro/ajo43HWDkBHFWqeokI0EqS?=
 =?us-ascii?Q?MqFvskSR47nFPxHqs/KZ+kgw0QFImhdoO3pNlbhRsHrDIB5r8sm9rMQvczMu?=
 =?us-ascii?Q?+pC5nWOJP775IhLJIldivhWbpPJJkII5/G4IEu1qUR6mMYA2HP3eYEs+URY4?=
 =?us-ascii?Q?pVVppBwqQQMedXdm24zljM0EFAeJVHRttT9Tj/nirBZWG67avs2+DbiF69mX?=
 =?us-ascii?Q?/Fu9h2KPwM84mfhDArLvFFbT1i38nABwypzrIkHMDLoIl9kEm5i2gfWA43ma?=
 =?us-ascii?Q?/d3ZKAvL3QfZxiUHp1NZjZ/E5AAY6lYXQKYIKHkPJlX0t0YpM6fhSQsB1yAJ?=
 =?us-ascii?Q?ZffGGws0vA0u4N0a7PHK9E0ghwog8LJZqV+VSSpLwNp8YdCG+nttkF6nj9Kx?=
 =?us-ascii?Q?niAOlzHJghWUhCS6jhA28wMrq2A3ntpI1vhD76y0Cyr8q9w1AsxJOn9euD0o?=
 =?us-ascii?Q?6BiIYNeOyEdXF//KGIxX5//N0ZPvozfEZgktrI2IaIvb7La15H03gh/v5WVr?=
 =?us-ascii?Q?BUFNWhb1UvLhGD6Necy8sRze42AMuEl6Fk4Ol3EeKJxB9iHcRpZwI8H9SWD9?=
 =?us-ascii?Q?2PC6OSuYyq26twf8eQ8KSzYpkShZfRBqkkDfgTtc8Sf+s6/n5PWTdvr+LKu1?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15856b9-1ee5-45e2-43b0-08dc1900a61e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:09:35.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fU6E+9qxpq4G2tzfw7+aPvNeDaafVK4xLn+Yl7IBx+ZGeLZXE8xiNkcMKI2AIagxHHRAdttdi0Q14cVvjhFPquBj61w+hfDyq7i00Grsqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-GUID: AZ0Z5ba1nCogGIcEjyaVp6k1rpoPjqhc
X-Proofpoint-ORIG-GUID: AZ0Z5ba1nCogGIcEjyaVp6k1rpoPjqhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=670 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194053

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
index 0000000000..547df353d2
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


