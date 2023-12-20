Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F35C46CD8
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:41:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18839.1703068857257101389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 02:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RlnDF6H/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071883b36e=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BK6vNxC015949
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:40:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0NP0fFJ3hTAOosgsKq
	+04GIwALvgKaASexVssysXie4=; b=RlnDF6H/zl2ohfCUyu8Z/h8los17Txz2Z3
	y8pLsyPiGCYiF9Zy+P1SISV+D/bvXm1nPadbop6dIFIiM3Iu9+R73Yl64wJuy6kU
	pzWmMl/S8a3kS0bpcoGFFvE/4sg63dTxk/k7ul7xUNy7VkOhAuJhCDAH6Jf7FqBz
	97uHKqCg2nkv4370ndpdRsgBrgTXah4afza3csKdCLhKbj3MJ1VkVjDS24JGA9Bd
	3/ed6TY0QbIAF9AbqPsW+OdZmOeHlOzcdW6q3s+48I0Zot2l1bBWmMnJADyN69+u
	GdecRFef0gACArRrRtXAuZeMygj6uWMLwjQQpMmfuK2rKgW2V4YA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824m3dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRyDKXUM+QOqN1rXGZmW9aVz+y9TaRmKtaz8JwauX8gVgY76gjLjE1JzzGanyiEFCD8inIpHBphSiRzgsfZbOaiKm4dQrImWxtyoqRktFu/5ihqCPkSNVhdpGbKMHu/t+Vvne5bccLrLmCGsvCJ/2i75kGLIxloMexUUOV+pgr8SYOTV2NcG4d93xhvij/keVwnctIcHEto9EthJk9k9x3xTXMKjJ2pGK9ddusoy47ZKbOD3BMs2FE1aphfnxvNNUqB/lq1MvV+eUSH4XdBgAHY0S4ejQXuN2hlyhtkJiz8enFFPXozOAlfh/8olbXMoomwQIPQkrttfTAAwHyQ1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NP0fFJ3hTAOosgsKq+04GIwALvgKaASexVssysXie4=;
 b=ChiaAzKISM1VZQkAYqKTKCwsngkRIiYxSDVkh0n/UUa4tUyzuX9SUmU9dV2OM6tPCBNQ+2SNEr7rUhzT2F88Z6/5MjVldZKsQ6DoWMg0T2Xz9t5uCDn+Wrp1k1k2AVAoqMU+JRJ/5pt9TYOZsYzr4ulDpGL+nU1O6Ap8MV17T8/T4ZLbSmc+NmREGhbV06WxMGnC70Vwrp8CFZlUEX7lOB8hY7127OnITLLolL6RdWGBjF0l0rtaWKHPKCHuHV1gfXDLJG61ro8Pdk5Jh3Z7FIpyqJjLE7mWVt0SuHzMTDXwG11dNKpe45DnR/Y7tJ+8ZZvVGhBNp6eKJ162R57ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 10:40:52 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 10:40:51 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com
Subject: [PATCH] rust: rustdoc reproducibility issue fix
Date: Wed, 20 Dec 2023 02:40:20 -0800
Message-ID: <20231220104020.1837836-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::7) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ac2921-7ff4-4b3d-5a4a-08dc0148225b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nep/k3L9s8FfNUXVJe2L7kHUKtTMiNc7ClnwTCCcHh/XSBVMLJUrxS40q6S+82nLBEISRuQBMn5bpSV/HyER35kIWxeJOHyqLkiTQtlgeLkRxMKyxqQVLM28KAKdPDuFBfFzcdPcC0hvCu5cVs9hGLFaxJ9PudnXBr+nwjnGz+L8zKDGpmGIq6yvdn17l2iGQZbOgC7aQnJZ9Ifi5M/dbYAUj0J5KTZdkvYI+LR+bmzp9WLlsxwZ0f9kLk3/GS0RtJwZbfqxDcRo7DnAdEuFOpcPemBbVKET+F/uVjjnbCX45DGFNwaKZOXGIHxHR+4rtD5xJtvMpUYOleDzeMa13T+DzdIzzT75LC4ilr4zx2DBZIVjMUp/Idh+0f1MDL3D26XNXStG2WLNe7hNSjBe1FtkaO7qzmL2OcS0FGymFOTkWFCohJn/JWmnpS4yea6EOJsqNGSrPOmxoXhRSMUFX14FX9+wGTJ5TCwYUk4d4jx/yLmcEKOyBjtyj6GWuUITmwrveNDpxcEhIUu1YHDd944Q5YKmPjy7sYf3LSE7Xq8Hz/1exB2pLpNw9gDnA0Q61od2csVWtcureCZv0UYdRt+p/EbHqIHQyrZa5m0jklI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39850400004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(36756003)(38350700005)(66476007)(1076003)(66556008)(26005)(52116002)(2616005)(6506007)(478600001)(8936002)(316002)(4326008)(6512007)(9686003)(66946007)(6916009)(107886003)(6666004)(2906002)(5660300002)(6486002)(8676002)(41300700001)(966005)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?romqq0F8Cmc6GdssYBd6yteJNR8forUnaix572FxPAsOqQ+grMv1QGygKk4m?=
 =?us-ascii?Q?M+nmdxEgehYdqpwb9YEdlxC9qxhlHnx2w9L//Fxnpnffgvk1ot7kwOHP6qwH?=
 =?us-ascii?Q?LTboG4Ski4gnm1WUmVOMiwPr2rTW7VxWau4NkA8CUg852vy5M7OD4wMVyfsJ?=
 =?us-ascii?Q?H+AtxuxCntMkunvVmqoIYlmIkvQR6xaZMoDZPf2CcZF5QrLKqip3iNxN3ffu?=
 =?us-ascii?Q?BY8wuRySbwPaldFkvE6JPi5nx9YOLjwVxD0FKqv4Cfn3O3t55bMiytd+EvMi?=
 =?us-ascii?Q?3w+P1wM0wp0Cz+eBgl6/39TVEvYZAYAWEWWgsbso6ouk8GVO/mRJvJ1HH5gz?=
 =?us-ascii?Q?UkgOh/E5Kr8bByxyiq4+W/dMLH9GwL9NeQM46io8Af/K0maG5T4HKi2p3WGz?=
 =?us-ascii?Q?hW4KNT0JEHSG3/ZrgheAzwwbxG+eLUIsG/c06TpDo5keKY9nfziI5qcnOzkA?=
 =?us-ascii?Q?52feb+UD3uZ8nuNv+8CVV8dGQURBCf8yG6X8ep7mh8fV4QKQ6yNtfuYG8lMq?=
 =?us-ascii?Q?j+yQYHE91ZdoSMkSX2Po/Eg/mYAhfP7pOLhyjV4GfBkRq/DGYi4CiNMFjXMK?=
 =?us-ascii?Q?lyEwdbNnJA5kYHEQbK4GYdQ+0sp88iqDzZuNc3eAY0xCGy+0xBITeUt8Sbqz?=
 =?us-ascii?Q?y2oLC0Md9CeOmLGVgpo+bg3egrKdSi0r1v8j2nAtb95LohkQF5LfYa5L0ss7?=
 =?us-ascii?Q?YvK4+AGV/ve0WmvfZkdLhbZHOT/FogyYYIt7CBhS6vdyePlIy0jSzpg6LbEN?=
 =?us-ascii?Q?BtHXoRmc6+DpYrqvuYDnbGxs6J7/0SthTrxixh+vCp+SY+z5V8tOwg4nTWvg?=
 =?us-ascii?Q?lLeGrSoAdgqcB3tbzHXUYX73OQ5w0KwtGU17XilFhSfFg1qJpB3FkHoAIxGm?=
 =?us-ascii?Q?8fBDvX6VudemqpcoXSTPW47ijqt+nGnlOyoDgsalt55V8IOkG4X5ZQ2mWdX+?=
 =?us-ascii?Q?qOQBLWqGth6eUuMmAEejFQwX4sP+wkqazLNlzMBqER22AHyqvd+StN5C76Ez?=
 =?us-ascii?Q?aDNq56/JH1kAoFkkwujxTuMu+ac3dStKf5K6mun+pDwRr3eX6xziTWrXL/Pf?=
 =?us-ascii?Q?qeEWKa9NC2vgIEVqgvZfAIbjY+5FoapvBGW5yDi3w1FLf6D/9DKl9pszgILA?=
 =?us-ascii?Q?KcaxQ1RJtuOBgt5sAxMRYSGH59/DY7E9o+5O1g9uhNtCQfO58Znfdu9s/qmq?=
 =?us-ascii?Q?q4+HqyED7YZ8q9ni/3eFFZk7y+YWasStinB7kpVi897UZuwVifz17TLiF2Oe?=
 =?us-ascii?Q?hp4HXV4iUU2dVsxEqkXBZdznntIThH9GWCkAW/RP9Fk1SqISJpKSmeFbFo7q?=
 =?us-ascii?Q?CsUJmaMLzHihdBcZ4QVIrcqv8MuoE8w0Luk3zNww0CgIYkqbmxz4SeBoEoSF?=
 =?us-ascii?Q?Fprxmzs/v/PLqLJ1GF5r2o5w0Ol0QMuJoSXKiciwAFcVdRHXfwCvfgKgzZvJ?=
 =?us-ascii?Q?tq+bxkYA+FJ+iKdcKkmD6Ia/fSKXe0D7nWXSKzYBzvqbb4ER4nMZdmo33OK4?=
 =?us-ascii?Q?9Q9TvGrGIksOHJq4o4+HKacaURpU6WnnlczzLmt0mE78Ebjjd36RR684bTaW?=
 =?us-ascii?Q?WmW3RhPXKOOj17KpzelahZAqokn5342CzDtkwdl7mRBXqb4IXvuxBc1PkTPp?=
 =?us-ascii?Q?WcvMEzUaAqcm9VMJra8CQ/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ac2921-7ff4-4b3d-5a4a-08dc0148225b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 10:40:50.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeJLOHPFeoE7oBO/bEkVyaDBFbOd5uumlP69h/+FwbZjqigxj0ZiCyoi6WXzVll3kgZvBbPFMQf60twijIw95VEfFkvTsfV+jn5wInB6PZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-ORIG-GUID: FF9qmENPdy-rZdF36EwjgSdYNFRv0S4e
X-Proofpoint-GUID: FF9qmENPdy-rZdF36EwjgSdYNFRv0S4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192789

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The PGO (Profile-guided Optimization) collect data about the typical execution of a program and then use this data to inform optimizations such as inlining, machine-code layout, register allocation, etc.
This optimization is by default disabled in rust sources but enabled in Yocto and causing the issue in rustdoc binary. To fix the issue this optimization is set to it's default 'false'.
More about the optimization: https://doc.rust-lang.org/rustc/profile-guided-optimization.html

Reverted commit #3e50e45917 "rust: Split rustdoc into a separate package"

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
 meta/recipes-devtools/rust/rust_1.71.1.bb    | 7 +++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 14ccb0b24d..80e830136f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,8 +16,6 @@ import os
 import datetime
 
 exclude_packages = [
-	'rust-rustdoc',
-	'rust-dbg'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/rust_1.71.1.bb b/meta/recipes-devtools/rust/rust_1.71.1.bb
index 3d176e54c1..a0e9316cfd 100644
--- a/meta/recipes-devtools/rust/rust_1.71.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.71.1.bb
@@ -141,13 +141,14 @@ python do_configure() {
     config.add_section("build")
     config.set("build", "submodules", e(False))
     config.set("build", "docs", e(False))
+    config.set("build", "tools", ["rust-demangler",])
 
     rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
     config.set("build", "rustc", e(rustc))
 
     # Support for the profiler runtime to generate e.g. coverage report,
     # PGO etc.
-    config.set("build", "profiler", e(True))
+    config.set("build", "profiler", e(False))
 
     cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
     config.set("build", "cargo", e(cargo))
@@ -225,11 +226,9 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
-FILES:${PN}-rustdoc = "${bindir}/rustdoc"
+PACKAGES =+ "${PN}-tools-clippy ${PN}-tools-rustfmt"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
-RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
 RDEPENDS:${PN}-tools-rustfmt = "${PN}"
 
-- 
2.42.0


