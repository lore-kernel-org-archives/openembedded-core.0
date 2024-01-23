Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D7DC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:18:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11912.1706015917094839734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qp2U0LZV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NBQwfm012774
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=RzmZm0Cv6gxpjSt7Bv
	84DevqB+Y+kbOXrNF1Z0ewQjw=; b=qp2U0LZVdGu5u66OSgBl7DJDpmpLYUkguY
	Ewqa49lijjkt4Nag33hrnKjMWqkssMyI+BHmpKiLnyve6Z20sxjVI9px0tVBr3Lq
	mEMzPvr9JhYDVPGc4RcYHsW4DhaVDFuN77TgiGSPFiLn+vygzbkPHtkp5YjUKrmg
	+sEH6iJROgkQTnDL7pbw0njrz5oEpCW1o5z2Dh8qygOtEoe5DbdVCD5B0XB4vrgY
	WG8wAwy64rURKoTrDte1breLJ15lAabbD3BziFh45el7g/MgIXOkAu5RFxidtAPj
	Bb2HKRPhc7q0OgNDy9bGIqEojI0jG+la8CZasv7GWt+n7WQPf2UQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5573cm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkNhyCndhdDkpMdU4todGBsec/DfYm4KwBUWKJzxdz/RpXJKI7v/gPCltZUCry1tRM/uIkcV47iuGyokE3U3RyKwSCzrvQXA+hZmzG5Gq96DhjKZf420epOc0NKbEzCxvixP1Go8EZ1HzZMm8RxTDNuejlxq8jB2yzqJiQUiImbmMaWpRmOhVQ0uOj96NQs15PyXl1iddHWbToPZstxKlPK0+kWWatO0hrn2VKACB3gOa/a/3QImfgYu5WM8EUKLf8tIWBNUcq3AmKJatGbABZ0uwelDrRJWc2/6ai86CjjKVYgv7oPxlNCycU4ZglKiO7Gaf8cjysw2TieljBmjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzmZm0Cv6gxpjSt7Bv84DevqB+Y+kbOXrNF1Z0ewQjw=;
 b=cAFsgbXO6wJYoDJmlJJaxyBCRVl1bG+2G6rqbGWE/O6UqTf7+fJiygTaY8/SqMHxKHadSbfsD/yF/OvImRYCPZA5zYOnzAg1tIHDo+IAfDwt/YgaOLMzyGHm1la674vEZMLQWodYAPClk3gmo6WDGDh5lcRaNDDJv+txJQ/WzKxp6xr/IYNEIlPbavia342A//K2I8eODsCIhlStHkLjSQcXGbXeiJmriHd38c8tjTFJVbDWejQ2K64+OS7AkM3Q9nzJc/WlUlMWtVsVTIB4gs9rzVm9OZtm5z0q8Cj/opbXKuvJZYj4Na4Hlx3rM2oPGfvtWx53RxYz0f1eqCwegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:32 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:31 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 1/7] rust: Fetch cargo from rust-snapshot dir.
Date: Tue, 23 Jan 2024 05:16:27 -0800
Message-ID: <20240123131633.641012-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 8799c746-6816-421a-bb53-08dc1c15cb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pa4BhFZxEL108Uf8XVJrpHPcT2v2iITIOgWMba/y26TWjd/UOSYp3AwSOjauKT1nD7FN0drdhobIQRxrAl0SoxWjh3crThxLtY/Yxms2LNir7xmSy7BTjM6qAvDb/E0JLqliR+ixCJxzzJBEzBQWyg2NDCuroj9dOVaQbtD6FXavUr2D5sYP4mqtxnnUJjYrTt24SENDFApYOZpbh1MHOWFIVS3Payk4nT8R/sCebAZySvV9SVYlnGnzN1ON95hhkJZKsn2MYXNL3M4avmqeYi01ciNU39oZfNP5fOiEBLh1aHc8aR/5AFY8IeOBzcH2BK1Nayi7fIR2Abz8rdWg4t5oFcUJV9ndUfk7+RxdqKadTRnS8PwjEWPEHEeRRn9EvP7O/uxSB1lRgDH8bjuhMLd/fR+qxtj9ARJmSoVjLwLNEfg1r3+8Tp04p8SJbCDDnsnGbgp/M5wZJNxovIrwl+4QezRvSpjxZNGBppuGUNbE2P3oXp6SZHCcDi4fW1N3WZV9+9iKxPG5ChXzC6m8KvVp1vuRz4C9TA9VgMo0XCP0I4Z6HGq0lrUvI8Rb3YnmdtifwsK83JwdNu8zVH9G5n6AaJgRfwJR2Es2IyEuuCEiY9u7+ofHe5owETiisPWO3LTkWkq2GvNv/jJt/6B8GA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(966005)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qZa5BpSEePWMXf9ECXZI+HqQ38cvk3oFCbH2CZbEQPTy4s/2Snq2AZgyJgXg?=
 =?us-ascii?Q?5zFZf01lwUjg4c6XFjnnVvtg01jG91rZ4iYsqbacNWyhyWBwmuWriDVXi1+8?=
 =?us-ascii?Q?Y1s1l7bS2/03SdDdiKxB8uHapRECkfjWVgRDfrIE1nFXhpqmjSu4UvgK2T8Y?=
 =?us-ascii?Q?nynY2Gvacib520dnshaVzCtWmC/R/dsrTsKC2BuXyBAVeB2QJ4Z1v9/KMI5J?=
 =?us-ascii?Q?TOjBMu5yHI09/DTspLjLR88+2hxM93CusP74Xu1DKNYy2M0kRtGd8/8rv4Z+?=
 =?us-ascii?Q?5By5cRu7kgU3kMue9EyDDa3gRrc2g1Nd55FfvR8iw7kpcnWAlEBRJPiLV5gY?=
 =?us-ascii?Q?MQOsu2pCm7Mh9qjmcPrub1/I6IH1dkK/H1eyF0wT5EM5vrzSrUa4FO3EJAA+?=
 =?us-ascii?Q?iGDKlUxp+QY1piZ0lol7Fk7pnYTEKP3D2XckBkTd2OW349V6/2DN/EnTEZe8?=
 =?us-ascii?Q?4Pjk+21cyBmneNJuXN+93JnK3gedvLn3XabiD9PZ6rdTObEC9a5rgxztA5vK?=
 =?us-ascii?Q?XUtYmu7FcyoGz1RbLfniiPPazEx+OUi2ypkGEZD2abHD2K9g+dHeVfOQHl1o?=
 =?us-ascii?Q?HLAjV0C2FJz0PIqJ/d5foj+w2rcGed4giMDAaH2nEHbZvM7Rh9EdnJAM0lIX?=
 =?us-ascii?Q?L++6zaZMRAP0VsD9nTi8qAJ8V3OC7hSPHuXrml1ak6pI0zxCeAAvM7UHsnEG?=
 =?us-ascii?Q?MV7VbaA+Bjz9ohcUh/fxDY+JEcJPDyWmfClW4fi/8GaBXw+UpbVKL4AbXIlw?=
 =?us-ascii?Q?oZqSAfCkaiNtnvtOtAs4ofyctzIZVcgwrVZCee9BPoL9u8GC+A/UOlqq75SU?=
 =?us-ascii?Q?eiuIm4mqUv2UYPgukqYZyxBb6a8ruNKPO9dSc7PTvwwDoVpJOh5mY797D0ep?=
 =?us-ascii?Q?+5ZQZpNeHL1x6vgSBS+lE7cmFeEdK8hx8QZzaJQ+A6HjdOJCNLExCaOsolZZ?=
 =?us-ascii?Q?RLWaED1rr3RyoicrfqyG/YSbsGGDlAZCEWjrh1p/UBjQqFYVnmM2he73xyZR?=
 =?us-ascii?Q?MZmBOdf/y6pfIcValN9A6o4vxYBsz6a4l1aq9ZrUj7Hp/F68WJPtKvprEjuA?=
 =?us-ascii?Q?KRCj7MoB8QnoBgwMXQJQ7ZdoRs8QbFYAIcSG+oBCAU7HLkiEN3s30TNJeprU?=
 =?us-ascii?Q?NBuyMvkyoV8lpyaPuydEsJIhMdi7ghmfvAHSvsmMdvuTmydDc6BN4pfMW6k8?=
 =?us-ascii?Q?LfqNEbgkOLV7JuSHe5QQKUU7y6ly4uLz59nxJDC6T5CFsanx7ssZZ2BQ383I?=
 =?us-ascii?Q?7c5Qnh4HImtbq6CNxhfGi+1WFrVEtPZ8+axveYpXFKV45XvGIptFq06aQ/E8?=
 =?us-ascii?Q?tjs6tmUPijKX5C8/gf47O5vWNz1GwXL1JVjGDoalkRYi7PJt5lE5vA0QB2Ih?=
 =?us-ascii?Q?AeCH1r6BCKVnc5eyLdQ1XIPt4CCK/dRjwoP8TXIiBkx6f51tvE+KX8OltAOi?=
 =?us-ascii?Q?+o/Ayrf7NtJDKVnR7/UCi10x5MHmfdf1tFg200wTbtw8ukSJnODCvfNmrWhw?=
 =?us-ascii?Q?aV4y//PhdoFEoJDx6YTji4QgHw+1/B0Tzv68JAAo/HOZu6/TkQwYuhR3ueCL?=
 =?us-ascii?Q?wq3oOSo0VgioAtxKje3DZuQCXavUdyj0g5Wm44HnDoVIDBKrRCTKwdu1phym?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8799c746-6816-421a-bb53-08dc1c15cb8e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:31.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWnjLoNQ7LDAYtCSB9FrtdnTNsSbsVUjfTodJLO+sEdoMYtCFV46pxpyciKlTKnOMy5VTkcf74klpm3fQdyAIvPrqudum49+UWmrJTtcN4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-GUID: HpmHT8DCtLHU888y_GI8v3K7ko7d0CkL
X-Proofpoint-ORIG-GUID: HpmHT8DCtLHU888y_GI8v3K7ko7d0CkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=668 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194228

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


