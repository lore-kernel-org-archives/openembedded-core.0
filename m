Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300B7D6ACC9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 12:41:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.71035.1732711274346433422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 04:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=106132e37a=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR5XQ6M014607
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:41:14 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq44e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnDZIry9BM2AxwIV3Ufz2N9O/MzLC/PJ2h/bYdW6ucQHWBb/51A5fdmyC2bbLU1NNvb8N3Tmv64a+2m87fNYoLlKbHysrgc+ca8NzMf5zGDin+dWqzfEwTRCqG11gj9s2d0OPXdkEv8z1UFXj/nKvukXtvMljHS/JraoC/e5PeJiY9yTdlXZs3ZuG9U9CM4jBPl95aCLVIeywCjg7edOJ0NcoiWf2S5Vc60yNxgsegu7FoY7VnPMyzNkV2dvPJxyhLADYJgaCtwWCZkVP8K5o1O1k051AUE1HluAVstQMl7jKwKKPEFswUy4G7or1I4i3gK5ZrIVoJuqpH1+XTbO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6/GzBKxMnDX1fAIX1EpXv8EYU7GZkHrS2mvGKnFdnQ=;
 b=fjlNt7gKmXmC5+Bp9yjNpdASqSug3Hh+XTo2Sw/vM1R+569LTp+ve5FaPwZ8pqEw6tc4WI3Bupk9XIFXSwB0dQYPW+Q4/d1H439HHkAnhkum5MoWPRUmntsb58t4M8oTroVMmqDDpMPginGEiZIBiPfH3SRJBoPQf/px3dREZLspckw7wXkYVfaSYGEW6F8UNgBqnLq2yxyFdp/B9IKa2qTHCKn8seLQ3FkhjWeQIliHkCFi5ZSkDwZxAejx2q9BvIOVjn5QCOLNsBN4OPpjkvanGjfFn/04HfU/ajZhvkzg3CcR4eGdS2cBq3qQnst0pVNUv3N/zgwKFHX/nvv4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 12:41:09 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 12:41:08 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/2] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Wed, 27 Nov 2024 04:40:51 -0800
Message-ID: <20241127124052.968438-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ce5929-2252-40b9-5341-08dd0ee0c417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?olISWDjJcJPXjRIjzUyDpNt1A9NcN3aG9m9PMUORlljmOp1BuvFBBDfv0DnW?=
 =?us-ascii?Q?wfqTvi/uo4DJcTkpYyxdWsV33yKu1Puw6YbxYVWlfjCFFEGANWx2BPjuqchJ?=
 =?us-ascii?Q?xSCx9dJ9qATidwytt1Ternt11qRyGogNsyJH66y0A61ZnZKkaS0I0d2+qtOb?=
 =?us-ascii?Q?AKsuURt5dLFX/PTLhsZ8WtNTgFkY1jBW6jDS7Xck1hesQ3FysDfIfuxnZgvs?=
 =?us-ascii?Q?QpSjqRelMivQ5/OhghFEtnHx03orH+e8aQoQ8DQNf7+AVK7z7178ahPunDVV?=
 =?us-ascii?Q?uktIqdnUg5R14lzxFLU3uppDD0azVPjebZo2SHrZu5gFknD9NVYPj5pEZMsT?=
 =?us-ascii?Q?LQQs2Ch9JodKiJhC3kOXujI0wcY58iVwEsgOvEJTDmoEOib7OqsSEYJLOfgX?=
 =?us-ascii?Q?Pwd+Ju0Ad5gtIdth1ZeC9AddW5/GePW5WAjP2xlaRs8iWnjApX5zjSiPtlAr?=
 =?us-ascii?Q?mO1RWfhuIwJMJdVbKxaTnfEBKbRuMZGosOBaEaG/2K+rzcKquC/rMZ/d6Fih?=
 =?us-ascii?Q?BaEo97NVy5UXTFFtLaWL5G46GL6iIM2oJjRf1LKUJtLLqg1d/kWoFrJDSpLH?=
 =?us-ascii?Q?CBSQlFt09rAqsfxfVko1tUqwHa7sd0+UppQr9dXbCGvbI1JF6NvCikdp3sVu?=
 =?us-ascii?Q?aAG/ce5NmMHZTS0vg/qicgIMy9/CwD2QwoodUGs3/IVIJp/KF4WQa7se3t2T?=
 =?us-ascii?Q?FVTg3QPxXry3hxbPqwXSgzpanOEXAzXFE9Gh1kxF1/5kIOnjOKlpNAv3K/OD?=
 =?us-ascii?Q?g4gQupx409urLV7XHvSRyL2GKDp2/vgeBISOq2zhfOthyyHn6bI+PpTk94vu?=
 =?us-ascii?Q?/tZS0qi1d4RxgIMVmmIa9DOhNC+OFwLwyBApsua3os1CT+GShGw3uYshy31m?=
 =?us-ascii?Q?6hPKNbA7LTlWZ7LAnJ6VHsRWwe/BdcDYkVAex4ymH+GnRiaeUr5W9gK+VJ77?=
 =?us-ascii?Q?CbHDbnW0cd8J8cObW1TlwknsJ3lTdihi50YlsL53zVrngz8EbiDQPUiTn/k9?=
 =?us-ascii?Q?I4L1ZlK12KB+JPwmIrEdiz2AjybCHc9vnpPuUKfBzwYcIts4ZNhlSR7nj7Oq?=
 =?us-ascii?Q?HHWw7qN9CWuq9juEPDBUWuPCbn9EBIJNH00iw51of/zc8QqB6T9laeN1aWnR?=
 =?us-ascii?Q?43yLDOvHkgKlMzC3zjN9D82nNPFVUFiHrFKwxoZyB8gwLIcilKrhk8kGCCor?=
 =?us-ascii?Q?yRMKQzU5RD7sDSfuJW6Ytz5nnhtB+TFcvRauHwhqm3IFn2ualtwSQBMnIgyJ?=
 =?us-ascii?Q?dF++mPHQRegIBMhUC0iq6/LCbFRCgCyyIkxBxLQs3UaFD5FPCFJOdcmmAjGN?=
 =?us-ascii?Q?cPssXfleRk1gECLPD9ns5ZFqc7PVK8H0mXUpvBtPj70KSLaq9TSfRwQ98WUn?=
 =?us-ascii?Q?+9ctnb8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dPBrj9nVyE8OE5OWuXVzu6EAmjh3D1sTAnGzv0pL/Djjs8yxV9zzf+JaNurP?=
 =?us-ascii?Q?wVUFtVGO28p0bwxxV4xDtjiupV0ZrBGf4cCL+I8nFI5AeUh8qEPQPQvsp2kU?=
 =?us-ascii?Q?depT9f25LlzAmZvAf6UhhiTmGBNZzz1I74wDZlNAO08Gp5FtBUgJYBGzfQF+?=
 =?us-ascii?Q?jwvMe9JxypnOy97blZwFQtjlIvLOvq0jP3gczB3994h30b98fxPkOZDl694k?=
 =?us-ascii?Q?YLypRtP2AUqkBx3hiNvv2aCLyK3B1qECKdpv/nuRlgMZKfER0XilxHm1dUcb?=
 =?us-ascii?Q?7rPzSA0eyatZAhc+gsyd7GxuIP6ZRmi8wDjVdLmZbQDmLNBYpOVSImI8F+gz?=
 =?us-ascii?Q?Gkxsc54FVSE0/8JyXtYGpX8ojIWPX/5JG6uN2HCJ39q4rHtI+iByg6814hSq?=
 =?us-ascii?Q?MPoPX333Xn6KjRy1gtRwNlQLFvkQ1JZUCz72qRqZp64fBjOUulc4q7QmdG6l?=
 =?us-ascii?Q?LTPcoj2eDG3BJkbuy2EU4lMpyKQPU+gc5er5Yh+RSgKPNW9J29pH64CF8wFL?=
 =?us-ascii?Q?YholCNQ/PQHmxeF6Vr3kJWfYfAR8dllHPjgGGHeKhRxSWNwz8UA39KvBoGp5?=
 =?us-ascii?Q?h7HYG7qRmACNzgTELLN48roLr/SqCTpTKZUPzvq9W7iBxXAXg06eP919Gdck?=
 =?us-ascii?Q?QsTNEWau3Ulg02AbelmPD0lHRSttlqr8NNlBj8HR2oru3UUIlPax8g3YFxlI?=
 =?us-ascii?Q?ASo1ViH5vFOTb3670rHIxKyPYnyyBOIJEYGshZ4F1/VlTZlxT+ztYFlS/FMt?=
 =?us-ascii?Q?yrINods0B9SSE5JGnh+KVVWiZzpyVijJGZh6OrkkOmxgwE43FFdjqJTrpHFs?=
 =?us-ascii?Q?DcVXuY72cfN4kxKtciPCgX4YJ9EnC1C/bEgZLBnlCn7srzjgeWssRBgWE5v9?=
 =?us-ascii?Q?mslfH/G8UgNaCREUPdsXj7UaHnLgCV1bMFLOiOxmc/07/OqiCUjNuKJO13wd?=
 =?us-ascii?Q?wvH5K26B0ZASCaQOnuAPKYgqkL3T6bQI3dv1zSu3oZqwDvARoQKvAKJMKMlW?=
 =?us-ascii?Q?sT6jcL988se6gkUgcx/6pOPuILNmybpZorWZTAuirU2CnGEjgOcOtCqCwSPK?=
 =?us-ascii?Q?zVTFTj/GUhGcamRZtUcrS17DHdjxmSiepCQfzUgzsQwZWtJSoh/31BuCIQHZ?=
 =?us-ascii?Q?61sW5F3MREcm0GY7kYv1WrmR56KKfVlDTa0H9u2s85xA0aqqk+nurcVyxDo0?=
 =?us-ascii?Q?S/4wHIr+YBlWEwkulOfcOjW6kCQbMOkwgTOFthRuRmhSfz7D7vNmfUPWRfLY?=
 =?us-ascii?Q?CigsYk/09spJf60Gb3yuPIHNOI7IDtGhUSocHMusaqPeyoB+jBnv88l0IEdJ?=
 =?us-ascii?Q?+o0B5EfAiIK2hk5CLpJm7JealXTNiIgjrg7EeLhSFFMcpbX+TJOnD7M6MRil?=
 =?us-ascii?Q?u3Qz7jZ4aMD9KuXYem56cVlDrpmNtedK2m3jBMKEmD+WN+ARnJWVE/MXp8fV?=
 =?us-ascii?Q?1irDJ03dYvnYHM4Zxs/6n7twyJdfFazssVQOVAxqnPLQDdr2PiL+ULRDmiKa?=
 =?us-ascii?Q?oPK8tQQLUa93bLxjzFuqbuFr8KoWcQ6eM7H9JauU7K3DF2GpYols7Tsk4wpe?=
 =?us-ascii?Q?YaPSTpFEC/0iCCEKogV9j7L7H6T1ijZSU1X9oJ6cp4B5faHAhAyvgc9JEWWI?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ce5929-2252-40b9-5341-08dd0ee0c417
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:41:08.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niEZo25svQK7dGmf9t6KI24fNG5RYg6ezhd8h8ztEg1FLJ0wzXMDHwfkwRkXkBZ0couqZGuXmEeM85RzdoFdUhETqxbaANu3yrL9GwgqRgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=67471369 cx=c_pps a=ZeveGGZnxkNpWlA7A6AaFA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=wnQMr7rs1oaJLksxR58A:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Bfx1raWvWAoFCjoTKzFMWC_XtrHYmU7U
X-Proofpoint-GUID: Bfx1raWvWAoFCjoTKzFMWC_XtrHYmU7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411270102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207926

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
The target independent variables like CARGO_HTTP_MULTIPLEXING and
CARGO_HTTP_CAINFO should be handled by the nativesdk-cargo recipe,
rather than being managed within rust-cross-canadian.

The build section of the Cargo configuration file is also
target-independent and hence moved to nativesdk-cargo.

The nativesdk-cargo recipe can then gather these entries from the individual
target-specific files to generate the final cargo_home/config file.
Target-specific configurations are specific to the rust-cross-canadian
variant and should remain there.
---
 meta/recipes-devtools/rust/cargo_1.80.1.bb    | 24 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 17 ++-----------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.1.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
index 123032cdf7..c98fa4a005 100644
--- a/meta/recipes-devtools/rust/cargo_1.80.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.80.1.bb
@@ -50,8 +50,32 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+	if ! grep -q '^\[build\]' "\$CARGO_HOME/config"; then
+		touch "\$CARGO_HOME/config"	
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+
+	# Keep the below off as long as HTTP/2 is disabled.     
+	export CARGO_HTTP_MULTIPLEXING=false
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
+
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d15..5de22ad2b0 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -57,36 +57,23 @@ do_install () {
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
-	EOF
-
-    chown -R root.root ${D}
-
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
         # Init the default target once, it might be otherwise user modified.
 	if [ ! -f "\$CARGO_HOME/config" ]; then
 		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
+
+    chown -R root.root ${D}
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.43.0


