Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB46FC5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:51:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.206823.1724060841648631571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8961a927c4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J5sKCX010636
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 02:47:21 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q541f4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 02:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIkXgGD3lYbwOgClWTxz+OYWRl87mWDvrbrP4OcrV1vk+fDGFuSwfxJj61j7mvsuLkGOrMdAil8X6PNgx/DuaJZxC7mneuUuqI8uWtanp+gGtyNPYhgceeaFh7MEeelfEh5+RdWNSO6zY/XCnG4fSP0SAs29lj8jOC+SgjENNokCUPhLY/gUUuFmXYEhyn54p8EGaURt7IDU4QB/ZdmpE21ybiK7iV2dt1s3DSu6Ul2+4b/jyHuP5YDBJJof98WZjpnmPHe4gfgn5QgiCuaBNzrL+Ow3PZ1LY7bRwM4bdr0qI54lnGVVgmoqzvvOcFNUCdAfmXcwRCT/yl/QaObabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3cERt940K4AREvJiuT+kNCwp+wdSATFtXF5x0XLVD0=;
 b=YIj7Ml6MvFv8hc88okphSVwlqmgcc9xpGL/4lyy7O2anYKf0OX77/6BB6pES2rGTT/Q6NtfDMqOz0xK0YZb5U5Et0AQtCAffntnPfVGOCFQyj0r6z0lhs86LFxA7O5ymNA0ofn3I6N92TAYPqtICLsFsW4bqrtZ4nmEd3HNHl6CjzmCTpRTCP/WMC2m2uOOHdjwCJkSFRmc/7+X8wFwbyni5yLRBiHehpzsbhq9B5kxsejaWES4M29IL1Hm5iEZqn2+VV/upfe46CLKIO/JK5O/ygW76e1et59pdTdRlIuOTwR0C925Lomicb9fsf8ZJ8jJKEElhvIBHfoQ8Dgb6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Mon, 19 Aug
 2024 09:47:17 +0000
Received: from IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c]) by IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:47:17 +0000
From: deepesh.varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
Date: Mon, 19 Aug 2024 02:47:01 -0700
Message-ID: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To IA1PR11MB7320.namprd11.prod.outlook.com
 (2603:10b6:208:424::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7320:EE_|MN0PR11MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 462fdea1-f68a-413a-c9fc-08dcc033e971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IxS0iDk2DxnUD4/L9j1a2PlZwYlRXvsgIyI59ctnggntkoms78wg8OxXfHpV?=
 =?us-ascii?Q?dJV/wYTkjSsPptFfTbx8gMTCa44+mx35GH4MBCjIlL7ukd3zsR3U5uXyLSU0?=
 =?us-ascii?Q?DXAf9cxyR/69Cv38cLYkTA2nKH5CgpO8Utt6ZmRuTEF42JVPLIRJGmpCnRGR?=
 =?us-ascii?Q?W/pLedkeSqce2rYhUrN3WDM83d5wA9YfI42NMXQE3YdNsrj7zQ6dajvfL95+?=
 =?us-ascii?Q?8zWntsAAyoV1X+mJDHTACKP/JwYVYgb5nNciPPtZ+cMDMuUIrvizrvAU/6hA?=
 =?us-ascii?Q?pGZ3UW68eW6RdExkzeusPYFHPptRbgNJj9TIaE8wmCFQ0GBXWD0Z2tH0sIJC?=
 =?us-ascii?Q?l4CtMZswirwbnMnD5EwmzYIDDKDHBgIkxpSGdPem5kaGuaBcp5X7VACPfi3V?=
 =?us-ascii?Q?Lmi2QrZwFanbBen1Eeu80naYjXv2toR57odmQk9isGL+wYK6EwqW1Ssoof8g?=
 =?us-ascii?Q?majLgv1iz3QRSVP836vaDvYsmWa1DmXbvECo0rusQMdROk30pp0yMZeQC9CA?=
 =?us-ascii?Q?azAoiue0daS1cYUCVGkJZqnvBFGtm8BSuyzGq1j7qGXksJ1gglGYKOKpRAMn?=
 =?us-ascii?Q?fZR5mRQa3RcBTEG5fE0nVEWw/XHWBynCWWc9fzy92wt69mWQDLUfl6qdvIqs?=
 =?us-ascii?Q?SC2jVlrmYrqGCfJnDBefWEuknNoO942oF/8CrTi1lJiNNOlnz/XFqwKrwkn5?=
 =?us-ascii?Q?wS4HM9jppnCquylNimNJXtT37F2kHHoeu/XLfswfmy+ZN1Dg9s0m1ZBFRlUL?=
 =?us-ascii?Q?qKochThAaS3obGUKyVMrr17OfXHQ1SzmGLTlTOhhXUPG+sP2AnDlLAwM75nv?=
 =?us-ascii?Q?4Oq6qbLPcLIsIR1/jOhMJCfxr6rVevlpkqhiP4Cy4Jnn4ayW6UMU7dON3QJy?=
 =?us-ascii?Q?WiCmbk5HOp9hJqZ15P0thbc4UGZAxemMH6OuppXVuPVulV4qNqNI8wZzw4K9?=
 =?us-ascii?Q?JXbZWnpYEHQvSSBpXnXLgkXFMhiPZfkfgfz5HQ1gV0jwxBJFCqcS5P1X3JYX?=
 =?us-ascii?Q?T2Lqbz1he67tE5E+TzMxMsw54Cn8mqwW1hj6exqF+ndEs06ExaFkk+8J2OjV?=
 =?us-ascii?Q?ufgG2mEfN4x77rZfNuBBMjWFN/3wCsZYFPA+gSYPXsTXK9sh77TFK/mSvuoS?=
 =?us-ascii?Q?gu2EAE9mAxMmnFk3UV9DkMSC/erprMqOYQcY4OFfhEyJX9YfTZq8u4n8KgTb?=
 =?us-ascii?Q?b4ivz6Vw5RaybgALPLv3n/TlamQDdTtMV23E7h1rVmkUPYiB29dvnkXjKl+H?=
 =?us-ascii?Q?a8QbPLnI9tT9A+zUzI/VOBlDhq2tO20ZOzcvKVH7+St8ThRTUADrHUH5C1bn?=
 =?us-ascii?Q?Nnq4RnuhwbfmjdPzb6vCZzro9tHKjqcltonHq1PfMeHaXApGqynMqBtjxDlt?=
 =?us-ascii?Q?aBfp2Aw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?msjcnNcFHoUGva0c6pU4Cl48K0vIWFeOQmc2LIKIxSuuHRRLFhnriqSWGeW+?=
 =?us-ascii?Q?9Eu4dTp7wBxHI21o2vcoLWJcw0xJq9G/PQLAk+56H6LvUVLE7gFGnMNMO19I?=
 =?us-ascii?Q?/6+XAg0hB0+VpXaf+DfFEehcNlFXNemaOPdiKf75b/1MCh5R7wpQKlvUthTX?=
 =?us-ascii?Q?abitJhnQ9xZy2cE+zXjwyHBHZxRs4mb9YjIolQTStih2l9wq2M/wQzANrFDS?=
 =?us-ascii?Q?UDGIHf/hpi++PjHwz5nlxvl5KbNjrgPQ42+4EjTe9E/mpTE6sOTwvRo6umai?=
 =?us-ascii?Q?kPecyqEfZLNY9blOKXATQUhpc1OrwqQUzz2UiOxO+5d4PGlNnPeYzuO15FDm?=
 =?us-ascii?Q?2HfcXWFObEDfsqMaIbt/qzn0wiHcY/EH6gKNKs80HAjQ3kUXS+pbGKu1r45u?=
 =?us-ascii?Q?HlaJGiyK9z1WMzyW1erks/2YKsenJspIl39gZcP/SCfrIoZQw5xebmv2F86O?=
 =?us-ascii?Q?zAoMwNGilRQppdxbBS7dyJDy/aoHj31dvlTV9Kx/9IB9KOLU/lV/9yu5MiuI?=
 =?us-ascii?Q?Xu6UVlGZ7P6gZvrYYRP2mQZrtWeN91BaJp7gfpMTZ18XKtZxFxf1hkjHwDZQ?=
 =?us-ascii?Q?RJjZylUaymttGuubtlCo0mJ3so2/0h/QF6kQG+doWzjXaptaernCjiJNeXp9?=
 =?us-ascii?Q?b8mdO4YeFUuTTXHqo1ep86QE1IV6F1xkY3wl9KixHlBQHEAgqRxXhmCwF2nz?=
 =?us-ascii?Q?2KN77g+IdhAguWTeeA2PX7A45MUtapOgsPFhOdciO4udlWAmgCyD/zOeLqd8?=
 =?us-ascii?Q?AW3Znapml20vVWG3E3lpPNFqQRU9urg3Gqns3WpFg3u81XOKBDu26YP3UCIz?=
 =?us-ascii?Q?d+byndUxW6G64H8oOpj5Hir9ZCmyU6/L2djoDoELfVllR9T57MSwM9UgJmAJ?=
 =?us-ascii?Q?lfhEB/9dEBDncQp3uyfNfcImGzWJueEIwnC4pMqhpTbmww8pUZ2OD99epaAd?=
 =?us-ascii?Q?EpKIhenjEvQGj576wZMEmV5edB03iGgcTlWyOEsk2/xiK8QJ6k+y5tuC8CoK?=
 =?us-ascii?Q?6/e4cEodxB00G+TCEAsCa1kOQxPiIoKU9O45xPE95LhiE+wZR5OB7QoExGgX?=
 =?us-ascii?Q?g/dQnNB154jiA0WXBJfMsnhDiGiDbXNWKrlAgqMbMgKAf2sR9KCLdmMKWL5S?=
 =?us-ascii?Q?BLUrcqWMHCyAJQduEyyxh/BuNFihrqo2P4u1q6zbWfsX1NT5ll9int3K0AYV?=
 =?us-ascii?Q?h+QA3rsKga6nRQV112f85AR+MWCwHV5g7oXTfs+4Kksgev7mZeuEqYFCLTMo?=
 =?us-ascii?Q?DX6YedRPeY5VrTXv9FNoBiB9cCuzTjf204wsWYyxZ63RCMa8J2wrDe32+qbd?=
 =?us-ascii?Q?AkUXHnSp06Ho7x9+wxvqS46REcq+vyyFyU8CDELBZQbT9RzofYdfB5XXiDfq?=
 =?us-ascii?Q?q8I2pWfM0egb8NG+0gDwik9ivIia3HcW9bLVk6u7bYuL5bikOTH9oRKW6hg/?=
 =?us-ascii?Q?wOXGeXh66amYO5YZsOm9ncnjnmoeB7sLo3katgE5+ls80ACBcnp9PSe9dY9c?=
 =?us-ascii?Q?EKJpy6lY1tw0GJV3lTzjdrOo/C552zGu+dOy0vF1j92idZ0i+Pel2XzIfJL1?=
 =?us-ascii?Q?cC+tYH2TInlDSRr9h2LbEGq+qOh74Bd/mMCLAJuiYSxHUfOlSOK0tmERy9/J?=
 =?us-ascii?Q?z3Z0aKHwE/Pr5OXW8Kma3UU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462fdea1-f68a-413a-c9fc-08dcc033e971
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:47:17.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoL1Ky8D/276bMdjRPbMb4GmxbGMPFQcVYh1lfviD1tMo65fntbCxWPXJ0SNNJOYuaLIWmzxQTDuZp/0RpCO60YjvMx4bu8jcPmwBmLj9WFCMuVUS9Hj9py/qt+CWZa6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
X-Proofpoint-GUID: BHSd2_HRKdUQjGpSLztR_BE5SvMh2sKf
X-Proofpoint-ORIG-GUID: BHSd2_HRKdUQjGpSLztR_BE5SvMh2sKf
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c314a9 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8 a=X30zvtXajfbtiY8q2AoA:9
 a=m5Prkr60LOIA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_08,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=855 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190065
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203501

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The 'codegen-units' option split the crate into multiple compilation units for parallel compilation.
Currently, this split is causing the rustdoc to generate differnt binary between the builds.
To fix this the codegen-units & the lto options are disabled.

More info about options:
https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
https://doc.rust-lang.org/rustc/codegen-options/index.html#lto

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ue-fix-cargo-config-for-codegenunits.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch

diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
new file mode 100644
index 0000000000..fdb2a4a498
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
@@ -0,0 +1,29 @@
+commit e2e7017350d0b5324811fef3b841f98b00273887
+Author: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+Date:   Fri Jul 26 06:35:59 2024 -0700
+
+    rust: rustdoc reproducibility issue fix
+
+    The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. 
+    Currently, this split is causing the rustdoc to generate differnt binary between the builds.
+    To fix this the codegen-units & the lto options are disabled.
+
+    More info about options:
+    https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
+    https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
+---
+--- a/.cargo/config.toml
++++ b/.cargo/config.toml
+@@ -3,3 +3,7 @@
+
+ [source.vendored-sources]
+ directory = "vendor"
++
++[profile.release]
++codegen-units = 1
++
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b14221b6cb..4ffc9faf18 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://target-build-value.patch;patchdir=${RUSTSRC} \
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
+	    file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index c33f31d261..7cd34a61c3 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -132,6 +132,7 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
+    config.set("rust", "lto", "\"off\"")
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.43.0


