Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0478EC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 07:59:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7289.1753171143230672716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 00:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9298434120=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M5INRq3476556
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:03 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv0frg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyoj//duU6iVKzxAjhKgE3wXKM25gNLA9VmxofmHEHTQn+ghV5Ecxd6H0UV1NiruYhqf0CNldonqoqsPYbHbisgVwXNPYLUzKp9p5kVZOR2wbnB6B5cs8wrtd4TIoo/pLkNKuqvjmPAhC2QexIRYDJoKqAyXqnsK6l4yJO2X9hcbucZGV7pBZszqNWmh+suuFnRy/7/2WiJChdjgk9ZpXOXtlBo0gvUH/vZJpHca3F911I3ind8iFzyFXQdnhWUlo6SGynC0yAsnGTZ6dTGWE/xXX4f+OJpfTUZ8y4PQd9vrGWMD4qUsEp/SubMq+rPFOAr5FeXy7cWCYyW7AR36QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIUkL0k0V2zFEBXYqvnSLbijmqorl2OpiunLqllwtLg=;
 b=bhMHYiMfN3uHBVSEgXcSiDZh2diTHNgtgCSApjHStWtjaQU4jdE00Bk2svL4Qs1CLFcZL1f5RuCg1rnJr9S0oGWseGlrcJlGUJcox6h3XuFISXRLMQfMkgm10IfIE6MSLjCAtLAZrdQJgBiVcDDB4UtjSvNBY3OknXquV8m9h+r74MUQOO7WCEozxrPPMNi990QrbeZ9Loa3SjWWW1RLlntKzXvfw9rD/q0/luMzzI1K2owKaLIPhO8VPDSob6OnXO8zL2ZuGcGM6DUfnC/FtfG0g7IXFe46hH/frVC4CcQEWOF7rsmMiY1a+6xExXFFPBXO1IaiPoN953rkUVk3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFD56C4208E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::858) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 07:59:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:58:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/3] Revert "rust: remove redundant cargo config file"
Date: Tue, 22 Jul 2025 00:58:37 -0700
Message-ID: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFD56C4208E:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a0a148-8d5b-41ca-2f00-08ddc8f59a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tcKytQ+fjmJJvlABSXck6YJJC5b9x3utHmiWl8y7o1hzlpeNif5GXVHwnQqH?=
 =?us-ascii?Q?6T2oGm83LVB6zjd2xTquz2GFTHRkl4bHpyDPcCuplXUyGwFDp8frfe17ltLq?=
 =?us-ascii?Q?x5PCiv9NKWhycsrw0LQREwvtadCU0bfybYso06IWYtSz/+OAo/1hCtY+pfQT?=
 =?us-ascii?Q?81llD/pqgtmqz+5x4vAliRqGaMDi5p8QZ+2vMfupYODReMvMxNIMWnGixj1z?=
 =?us-ascii?Q?k2OXb0VebeOajuY85lUnhH94WlBuucZwqeqnx3xWjSbjpauDegUImXaAwSh0?=
 =?us-ascii?Q?3cP2v3cvpBSY9bGSQ3wYPnRMuQV0jcc9vi1XO9DDYNqxLkCN+Uw3cs5prME6?=
 =?us-ascii?Q?Xneuni/yVv4RsniQrN4FzBabsLSY9jyI3WYIe5zQVNcJPFpVKwk7QJOFRczp?=
 =?us-ascii?Q?U92ZbB2ZuE2CH87KXXHi4N/pZnesxQ5myuEf6jy1hNcuwjvuhOaUM2NN44UJ?=
 =?us-ascii?Q?g4RFPrTqtlUIkAbarsBQFpyC6GShDjD3GDIFR+zTvNJcVSEJ8iZTFeIr0fNm?=
 =?us-ascii?Q?rjdkJ+R6Q+naCQnPMT5F2FB6CnAh+ChkAuI50JJhbtv3lDwDFLOExphQE2+r?=
 =?us-ascii?Q?8TF76UnTUSmUtlT53y7BtG5LNJr3CjzerFOKlUNZj1EETgSePjPt/Joe//pj?=
 =?us-ascii?Q?ZlmGlnibyHyovqqYRnJCKKGiu+2csUN2A0N8S6EvIvJ9CSr43+RSSZo3MaH9?=
 =?us-ascii?Q?ede5T57KbqZ4aRAdv4eDePAU7leJpSMcIGWcdT7qdwS3Qw5VXDxX0X8youKv?=
 =?us-ascii?Q?310ogVDsEef/rlJVE3g1uS+xOmTt4dsuz/ene1NVC75tnZ0Edawj02AZslmq?=
 =?us-ascii?Q?LC+LckxQH8A4ChKzeJ/o2MWZeOcHulXzwHW+aMKxvggvpUKno4GPdm6IQsqz?=
 =?us-ascii?Q?W9wcLoJLYXoYeh+J+ojTXqLrjVuyBxrUvJxZk5YJ+ZqWhsFNSeeoAhA/K5lB?=
 =?us-ascii?Q?LCSx6kYQ4a7AXz+/nyfDio9oprEIl/2/w2ZXFzE1jymc8TgQ0DBhw6+8X/X9?=
 =?us-ascii?Q?OmfDzQS1A8r5x4kJRfp1LmEYWVRB5kOnF1bjuOwtnauWUVxmuR1Eut4GXoeV?=
 =?us-ascii?Q?sv1tYfWA2A9nT5tNzibtc43BBR2qgCzOlq+WAkbvLqJ2lqMdGZ+3us8R/1lE?=
 =?us-ascii?Q?G8yYuN90AtYUEE+/Lg8YvD2FehQclHUdGvzSHxooV11X3kIgnYnNrj46Wn8t?=
 =?us-ascii?Q?gqmcD0FTZVq2g5OxJUz8D0n+89RnEA9TIuhV+h0/TbK9d1myuA+6u5ewiX7Z?=
 =?us-ascii?Q?X5/qC3vMA3wJJ2yIUNT27pE0+CQNmsqrFj4EVXpa53vOck1Ue4Gyhs+teHGZ?=
 =?us-ascii?Q?2AV4uGXQP8YlHlMZ8JOBTvhpHdpSsLoVy1YlQeLPbDvy1HC43zCnBTfwDdO7?=
 =?us-ascii?Q?QEdGC213TSngZoUUnnpSv9SUD/pGl8R/VaTfQltCle5QSUKfIlz5tkAyZ01g?=
 =?us-ascii?Q?QYNr6Icjb+QWbJwoKgPbrL7TRUqqKsBzIRdwYc5aVoedIA4MgWJ28Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V56cM+iaTpctjR+01UONAhXPhqML/MIGd4SBRa0riNCgjclq93mwkbagRYkN?=
 =?us-ascii?Q?wBBcyL6/7nJJGYmWnvRKg6qpAR5LTBPklB+EdT0phmcC+2No3wuvI1h6B/Fh?=
 =?us-ascii?Q?bC/1nMOhG5rma9C5QCYIcOxMuDfMw5ehgzWTJ7+LrUvs8roSZNEE7QTxUFv+?=
 =?us-ascii?Q?8gAjXkhP0mfyxcq89T61B5rjSCHOTbG3RXutRdcg3VWdgRqEwk+7latW+dbS?=
 =?us-ascii?Q?+hX/OwGCXx2nekZWywXJx1ousIX3tpIaz/9gT9vx+5tAD0varjdhc3BFMxbE?=
 =?us-ascii?Q?jwV+5YaCxjRkL4gkalNlrPauYtkSBK5rfAw4BEBtcWO3vvaRneqcv0oT6FiA?=
 =?us-ascii?Q?OYjaskR5UwHNht6mhCBzxnt4XhHO/98vI5V8cW3byE03jNidTVPhQyvAkBje?=
 =?us-ascii?Q?ALbMXXWje9Ry3s77GxO7UJk8PHRHTyesjOILx2O+xgS1tcix9sciZ/PEEBlO?=
 =?us-ascii?Q?MxxC4xXnmdt3aNplZKiPSHCYJzFpo4D2Nk9YuA9qcIe9uVQyKwyjgKYvINdl?=
 =?us-ascii?Q?YDIEfsXvNhTPvZf40fdelIFNMC1pZk90Hr4eoWp6mUz6t6q40xl4xdFG/vGA?=
 =?us-ascii?Q?pOYBSerZMCfu+EI63tolS+19ImAEGJT9eM4Z52nyiOkrPkTX0aO3cvaTnSJd?=
 =?us-ascii?Q?7YTsKqQPKfeM4YwiHe/B2vFzsEpS2ehd9hw8vC/fqDErRZPCQH15GCH6PMFj?=
 =?us-ascii?Q?d6y/C9XwFIpX+UDxedFLyhdwTdtebsgkQ1lzz3bfItaHGb1FonwFtbRHoIg1?=
 =?us-ascii?Q?oylnNLa7gta+mofl+Zce2Wu1Mi724lKIsZT/Nb8rbGnSVHepWIk/N5fhvDBI?=
 =?us-ascii?Q?8lux2+T81HPPlDWSLPbUB8Reu0uFcww5dKtOnnGxXaWa5w6H3r9GJalLnqsk?=
 =?us-ascii?Q?rny0S49nh5qv2v9R1+hCIXdEPhA26aXsrmJe/eKiw7QLakwfv+0eEkbV8lig?=
 =?us-ascii?Q?otjPL+8o3HXyh7+CqjQgT5kXnS8YDbGJUqxJ4tYERNDD94QPYWtzv8dELvWG?=
 =?us-ascii?Q?o+R0ewIRBOCu8WQX3KtzbRqevxiZFCYd8oBM1CF8Ift83cfZvx2fafbpWATN?=
 =?us-ascii?Q?TjjeSBCnb1zV8wRpRzaIet0CCaG0joCEBiPLBRS8PivPb9p3lysJ8aVpSqUr?=
 =?us-ascii?Q?QmKUb6JffbKvecno14yH0EFcILJRW5d4FP0mdCmkFdlJeHrKQTnoOiqgBOa/?=
 =?us-ascii?Q?79EuJEU/MqxgzOolErJyZQz6x5ZU+vmARBRwIj3C+Vvbh3L0OsXE8uaLaeBc?=
 =?us-ascii?Q?B8FWJ9F4nDS7iXf3falYqPaDWkGZ104c51yNPIowSVZwJrljTPjkzYPWSWsd?=
 =?us-ascii?Q?CA60WTlfd/zpOLgtVuvhG2pNmYHOtAHfVZ/pniC2XoORzQgwqIEOCcdaUbPP?=
 =?us-ascii?Q?Zj+oALxXRXPn8cTtwUYcLnkgxl4UQ7i5eGfYD9DyQiSX7tvy4SU2OOpxz3a/?=
 =?us-ascii?Q?KlrXNUtixTs6ubysPjtLNYdN07m1F3wiTlE1ZKAqpRq07OMaPc7xOWoehqfJ?=
 =?us-ascii?Q?fWk+tycmfDQ5SqaetFP4mQE3gwXV0c3nlmFb++0bWqBnzrnT0fu4m3WVCej+?=
 =?us-ascii?Q?zcsPhLZeZnnbg5qIia4+Vl+ee1vIU2KpkTt5FsCsSg6hOf2lTnhWxkk5TcL0?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a0a148-8d5b-41ca-2f00-08ddc8f59a68
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:58:54.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExNfRHtlM46LaSDV/2IlcmZH7Q5BTaDH7/nC8IoLNZLykFUMY0zROb6goCzDQf2P+XfXRwc0UMaVimPonuX/Bn9prw32XqX/vhk8QHkqVsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56C4208E
X-Proofpoint-ORIG-GUID: zzRp5iBfKhIfHs2q8Fu-pavKuiuCVJ1L
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=687f44c6 cx=c_pps
 a=QIZECQNxG9OrthprMUZrHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=nZTMiEG4cM8ErhhU3NkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zzRp5iBfKhIfHs2q8Fu-pavKuiuCVJ1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NCBTYWx0ZWRfX8MhLfhRdgBhb
 qQUrpjMYGYHCAah3iLH81VF2NpZ7RJ51pAu23RrUO7VAlLZFGHuWuPrGVQeHhqpFhgaVA8QCFtc
 Boes6vZ6qUgJvYhj1T2HpWBCWrssykPqFrHMVm2mQHNG6DdPb5pxel2wM8/ISKapMhKIfVkLRLW
 67zFFjUG1HAVSsm7J8XKZa6U4R+/mxmDUsmTzF8AvxsIgzSyd59AGDSbj5V7vIcvjkOn3fK7ypb
 1iBnB7/BwWFiXRlisXQAHoUVpdsSYYYbmi47XD6n6RgtHZeaxwIyGBWI1alvC4lA/qJvPh7xkoY
 1Zk+IYTesARIqa2oKCyEBW6RBH7mSy+eVZ1zbpPKViabeSUSmF4f6o19edoLBS5KumJh+cH6fnL
 dQ/dpWrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 07:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220722

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The 'cargo build' is supposed to build binary for the target but it is
building for Host.
Reverting below commit to make 'cargo build' to built for target as
default in sdk
commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index df8b78d326..fcfd178f34 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -64,6 +64,20 @@ do_install () {
 
     chown -R root.root ${D}
 
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+        # Init the default target once, it might be otherwise user modified.
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


