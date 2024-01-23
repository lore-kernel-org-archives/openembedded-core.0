Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D88C47DDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7150.1705997438400422044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C/FEUmfj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MCfXe4020788
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=RzmZm0Cv6gxpjSt7Bv
	84DevqB+Y+kbOXrNF1Z0ewQjw=; b=C/FEUmfjxF3qlmYDLlo9lUeUXr2v4eSYlR
	uhOA22tcSIWAGi1p0kxG5nRb2eF/dqzxF1GFEtA14hzYHvah3rd5A4OViegevSX2
	Tc7b6j8jlqhzipBdV70jig7fLzlf2PaFXwl5wImJB/X64nbcJGKvrFzA/MT09sBt
	IjO/p/nbwDPMbxXOIHvVtPbZchfpk1ulxKN30On0BhFxL/0MeoHYtINxri9HwpmI
	4hsYJi0r7VP1k9MAs33fneYpi9v2N1IONFu/KdTGdO1ZpFOKiS8gqlbVpFSV3Tfa
	+CJthggQecJJgG4HvSe874kJmr89cbbnuG4oRaOo7xSKDYriSZhA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk5sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4hxXskCxDpGF703XzQ5Xhop+eee83eEMbcqnJNopUBUHnQYQYzcSzKiJdqAJOJYbFZP8yefk0CSfoezGYiQVWcQ/AdzcUwnPkHItifiXW7YDhVcu7D0rDDmDmK7TWAv49nY0uQ176bBTy5O/5JefBwKZCbaKMrcEMy5woxpfLi+Q1PTlfCtrvkTX7wAoPxkeUZXNER6ofAOcf8bInladXWwFho9WTceqh+tlQoPFsGhz4m3ceOaH27zkKheEP9JLHWHi11jtyeqFdlLFXRgJs6CIzt39jK8ghT8Kr8dCippH7LDLCGkCEye5seINAoAWvX3BtAk+sUqjFFbC2Uzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzmZm0Cv6gxpjSt7Bv84DevqB+Y+kbOXrNF1Z0ewQjw=;
 b=IbLLqpmOQqSlfRbpTLsrtyEyk5dW0SlHC2KtBL+3HACgIRdz00AAL3r+w7Af+yhEw+hc6xJHokwsHPeJohcJL7y4pay3hD+dmifZbiEVbnP1nUwPw/NK6Me67Bi8+aBICJogiIjFdg2XXJ+D8RPHiJet1Pyh/GVF0DZa1L91mAMUO7WMyFTZ9tMY4mZksrLgkJ3PfNVvUDOh5xZKE8SOl+YSwyVez+AMWhRKkM0icc5OE/MchTzqFxJXqZGCffuIS5QgKrta0LTnPRcXnRJ6F2baJX+04AUwHmN+wsWoybCMyr3tCS0tSDIeWCspfOL3mPnXX2DY5vOyFvOHnosOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:33 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:33 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 1/7] rust: Fetch cargo from rust-snapshot dir.
Date: Tue, 23 Jan 2024 00:10:00 -0800
Message-ID: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: b7413d61-4f78-48e4-5768-08dc1beac562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r+J2HEcZFLtv9LOuVPg6wHMI0BtI8JlOe8yed+j/vV9znrW4tggIZJ95F/EcJ1BKE0v3qUr2GE3XOC9Lyn+0WRj4CCP/BB7nR02d+7JEuUTxrdECyWWGdz8xyi1f+ptoU7Dme2kck34WJNrUH+qTt3W1RaopW3+2DiNjNyJCrrXMxfpsFBhaM3Ob9dMxLVBxrJnPUrY3Zr6LFRm9t2AybhF3v+ZgtKXcHF4DsRnLQoA2DivBk1t367zPL2H4d+EoUV0kAbK4/oJwYCq1BETcfz8f6Fa7JeP+d6bXJ7cOZl5T2+yalRAtGdZJNMm9Ciy2LKmTfdVpp7HTIijkLaSL9vw0q2m/0BuwR9eA6Em7Oqx/vpTp6MfPdsUrVYPTalYwESyoUjfyX/1gfBIpUlN1nS+HL3arLt/Z4WTrpO+7bE3Rfdrvpv69mLhl9wbmxv9V7uPsRmNEAGI1z5T5aCTiolIfuDi3hfCkM4kDyAqCCTMS9/FhzW4/SZU2HzmeujMVMDfSscr3mrh0jz+aecLpyVOk+jymLmWDmzimoJI2JP6r9fljhf94E8y9gpVYiZrxfj9jUV5GgpKUIdmiVY6LPHtoUD95SgQw2TnV6PDwgaCMAaOtSzpaOuoT+OGN+rc+OfWWu0PppoFzrHAATQIoJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(966005)(6512007)(6666004)(6506007)(5660300002)(83380400001)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LcVCcXgp3GDzNfHKVFIRLREL5mPCsiGL6x4Ck0ux7oDI6I+s9cFgmOX6aGpt?=
 =?us-ascii?Q?CHLK1HQRBclTVPakjfkGrcNSn89UnvVRzOQD94U44wq2DiMiN+stHO1rO/Fr?=
 =?us-ascii?Q?BhjuYg46gWndXxAlW6sEudFGpoyANjDz/yPL3cIGyLtT7xduduMMF5qStfzK?=
 =?us-ascii?Q?qC0AyUxZP+V7Y2LVZYa9F/CP9cN5iw6uSZiQiYxTlYl164uvU8YP1j06+2ok?=
 =?us-ascii?Q?Zubt8aOfJkdlXxkXY5sK0HUfTeGT3vFrMSyxyllheQiI1LX6K/1tSRfxDGIq?=
 =?us-ascii?Q?j0Td9PhHgNBysuyKFTLdSZEd73GvycArYF7kaUq0+q5U25yJZ6PwD4uR+mxB?=
 =?us-ascii?Q?0MA1d6wv8F8Wf/aebWPeYUGKZ1HKI4Oha8CNeojDUByNXxCjCKy/VXXvAxCr?=
 =?us-ascii?Q?RGNn87/a3IUqlEi7U5L42mrWCz62k6a8fDi0gVf39FD1ULdY3Ty5cF/Fbi+S?=
 =?us-ascii?Q?vv1k5A3Vil3ttG09lm2UH8v3oPfxYNNyUyDdcW7g6AnHfwktbmhyIIyi9B8g?=
 =?us-ascii?Q?GX6pat23JgVgwESUKmjbidl8a/Xz+F0wVDgf4ADz/i0k5X31pRaHslR9A+wI?=
 =?us-ascii?Q?YBmpdXcWA4rbnL9eKe9oyLT6zuCqKSJMgBv/paW1eH3tyFxWFVpQfOLbZazn?=
 =?us-ascii?Q?mMwtmLFzUzdBJksYJxTJ9zSDtIrfTrmMX15lHoElG7Sd4MHS17R3Hre2Ryyd?=
 =?us-ascii?Q?YK6wUbXMmzIWqNYIMwNwuNVoXqCZtXkKFBvZedWJyX8jrF06I8P7ElmplGz2?=
 =?us-ascii?Q?Dgx2uGpWpP8cfnW0LObusErOu0hmBaNrOPhZuNAlFnQ46TsPwwmaTrRTq6d6?=
 =?us-ascii?Q?QDoUiaTA7cIhjydmYULZwdDcoHcmixQQkMUlkR1P4sFH+a4W5myFbT2AXGPf?=
 =?us-ascii?Q?Jb1T438ObFzfwgyUm3va3l/niBsfoX4lSXPFPvCxlI4BkJOTm1EJN2Rb6AvI?=
 =?us-ascii?Q?OcizBobiDnE5Ip/goMgggFaylbmj46s/JgbOvip0WXPAPGuRrj64lKK9qnqB?=
 =?us-ascii?Q?G4VlMPYCAs/We13Riz8LfdvCsLwLWSeQdg9aDnX+FVkABNGUgwU4Kg/1Bos2?=
 =?us-ascii?Q?iHT0PkNPeBf0v8sFJDiS4mcCiXXbnNTORraAeeMNmV2bQHo1+cz9rQAPfYgy?=
 =?us-ascii?Q?vz6b61TII/ARSfAT/M4MU7sGGMNpHb2WU2yo3wyRov/7kIx+FEuF0cD7Q/or?=
 =?us-ascii?Q?piM0iSpoIwdkw3GGTlpKh6yRqbwIobkwQ6RZ7slZuDDMp6/FAiKesOR6H2Fu?=
 =?us-ascii?Q?KhvhXIzvw8Xj729gxPgIy79h+tHb0cx+Nj58Yk1AaZrAipb55Dp/Ld+Tdijp?=
 =?us-ascii?Q?li+RdL/drCjzsoIFoFhSFAEIckAtNefrIG+U3SDlDuxl4Socs1C9VRNa+3OB?=
 =?us-ascii?Q?hbsDwETE7/QoYDeTtvzXJq4756ZY/4REF3dSCaexAJI4fNoSb4FUzB1p8xYp?=
 =?us-ascii?Q?Q4ifE7xF6FHAPduEXqo9t85r1CaZcOL0iCPytgIm0fGFSmbYmP0usZlwCFAh?=
 =?us-ascii?Q?q0JGugpO29PFHzhsQ3NV+5DB07+3/0m6qkK590/MV/8yLy1W8+zPZENGeb1K?=
 =?us-ascii?Q?PZ7D5JYkJ9Tg2gsnkMqVeoLVb/zi4iukddiwqZY62YHrDbPFrClqniDfsEs0?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7413d61-4f78-48e4-5768-08dc1beac562
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:32.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAYh8aGwvMOkawhkL56hLGy/cbR8fdkGp+AMzeIsn6xYOqsNO6AGJUIxpY8tt+8b4icobP5iTCAe6adzhLcFJbAMympOM5rXwV8UmQWtgpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: zxo0274Rs4l6dh9ArJc_m61d-4P5uQvo
X-Proofpoint-ORIG-GUID: zxo0274Rs4l6dh9ArJc_m61d-4P5uQvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=668 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194206

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


