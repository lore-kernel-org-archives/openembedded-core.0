Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17F8C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:54:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38922.1738842839630350318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41326f0d9a=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166YtcP003865
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:53:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:53:58 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516Bkl7s005132
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:53:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:53:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjnZBUQDcUgev+j4zlhbMSOsb8SxqPg0Evw20BwPdLx9mwGf3WMvmTbi7PdW7IBEBiXnibHdfuPEjXFrqd1wMZPLXWaaeSy5H3xNjG7xGhFrh2QUtCQv62yuiJFdEY3BC9T1hr9BbDmz109IwtvjpNyTAJNEheM2xAdvl8zW+5hX7zJe9B2kj7kewn02ouqUxJN1NqUXbr0c6G7yqvp4KzxEgC6Oh5Ino5rzmXBSat0kW/6oLbwa1YSMQ+cpZOEORgNBMl8os7xp7Yut2wK9kEnAZv0xk086PGhD5jSyRLs4evpu7yfP+M7v7KkPoJzRtebXTkCS47JQUeNs6w+dYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTD1oZdkzIw7KtSCqCfWtnUtRarHKW4JasgcJYfsUpc=;
 b=ewUfVhFYBQwRIOURz0yQ+IhzviWAZr1oo5Cx/LH736rys9ZrJpsRIpE5e7v9qDGWxpsm8UY2i/knUA7CzPYjRdYp+t5FIISCkrl/vP1H+nSKwUGXDyC5aXRNov9Xv4InTaRqvux+pgbTjUrO9Bu7hdk9gw24vS1pn2EK8yUIsvh2ORFqsaBzrHRT6LRp3JhrDa0/0THGnIUIaiAdMeWtU9daiHIilVURc3y2ikG66zB3cCj5wmkX2aEulfl2lvf2nF8l0TpTGeo/eZTybsGkdXTjona8VQhWDph0CW2ZjRmlmlwmjPw2QMbk1/9lsUPuMd0IeDjFO27fwj+PeDrKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 11:53:53 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:53:53 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [scarthgap][PATCH 1/3] rust: fix for rust multilib sdk configuration
Date: Thu,  6 Feb 2025 03:53:17 -0800
Message-ID: <20250206115319.2604977-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: d79b11b6-2341-4217-3386-08dd46a4ed6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gGQT1ge7zUGCyWbObej05oxFm91TnrpqClGPe1o3er7cSObaFOEN3QoYj+qL?=
 =?us-ascii?Q?Dcm+8UMHIcPzxrakMTTR0w6aylimeR4BNsM4+jO+cXSrLsvffAdK/oS4BmZv?=
 =?us-ascii?Q?nvOBzUTKh67NzKfdbkcVq4HMRs7mLfHlXKu07GzgcPOKP8/XPOuqQNG0CP5R?=
 =?us-ascii?Q?/pTjwY1lJNJ1SuoCvISGTVqis4Mi7J6tD6AIKwKQq6SpdSnLMWqtdPuAZole?=
 =?us-ascii?Q?OvqfPlB++RHBVUof00dZ3bsYIUdDu3bxSi04PXN1WbSWSs/lTI9vigqIJ5wy?=
 =?us-ascii?Q?thxrb/Ng+u5CeeZAji/Rzr0rYhk9aF53BBN50fQaqomCfq0s3gSt0sy1PeS8?=
 =?us-ascii?Q?i1Z+Uvhia7YODefwo7t/3VQEHmcJ2j5oTxRKkFJdAb8ISCQ6uN7kjpCwYjIY?=
 =?us-ascii?Q?2wD++H0D5i3UUigWYFSP03PP6VMU3G4sFrwjgMmK/6smmmS5MYenLywSrVg0?=
 =?us-ascii?Q?BKglsOBRmBZ9tmVuF/MJGrZF7FlRv/PHjulqyzAWC9QwQsMIIXbDikqr+ArX?=
 =?us-ascii?Q?1hLs/Q0+CkmKCWET5KHEqbJ6PuK8WQeon9lPTbV2eiArfef55MGyZBgNQafK?=
 =?us-ascii?Q?ET/WkybvBxZrR63LTot4axvFMIai94YnPDNm597lwLPGh/AOialYMWMAcwkC?=
 =?us-ascii?Q?RGLQjMJmlU3W2xHurW47hnRntwhJ6alNf4K3eK5e+iVkTmZPepMUBazI/+qk?=
 =?us-ascii?Q?usya0JdwRxV6PzQHplwIZbHnWxSr4sWxYFJnU5lQmpxYe9GkcjdvEsD8IfQ/?=
 =?us-ascii?Q?k4KBtMRFTR0qb6SuT1lV9fUx2hfMSbMvIIRRd/J6PDjOIs8Pkj+8zeXx7SUm?=
 =?us-ascii?Q?sDdlB79nSaePKWmfQV+h2D6t/a549W7/1MVWdKeq7a7OeCcCIFuZFvPcMvsZ?=
 =?us-ascii?Q?3GcOscdbP/r16ulyRFXg12zD77le2YrC9S6b55/wMeSTpbP774LniFx5Q6+I?=
 =?us-ascii?Q?0hGR0NoqVgnVkjl/0jJp7pbWN/5dfRIhEYQX4DU0EV8dXZd5jFo76AamUeTC?=
 =?us-ascii?Q?xWB2AHVfoK4nPEOTha5RtyshKi3O31w3/NOoiETZja8DHX97DEdTFLBi1nP7?=
 =?us-ascii?Q?cFD4bIF11/scUfjPHHtaHAA1G0F+xU1U5kjEMRlXde6BetfCfovty4Fm/UBo?=
 =?us-ascii?Q?JlVKfiWlksQLQk6J94mpIDtvdKKodccJEcFAjVKFHpT7jleWUd7yEfCsgDV5?=
 =?us-ascii?Q?qklQFu0qPin/suYvHJb50taGSA8u3LmFVb3rrY7QP2Jwe0hssma0do1M8ygP?=
 =?us-ascii?Q?EhPSjGhzIhBUhhQzD5bmWIkAunaTlFlplHeN8QtwsTpUIuCfGAfpAe4WgLm1?=
 =?us-ascii?Q?957uc41jlDPGML8yaLB2MqLV/iL5DaDcfCP5W4Ur6kxJq6liySaltXuaMut+?=
 =?us-ascii?Q?a6ZTjdFHX/FJTOSYu0uqEEMWDWeHipr+10L8F826N7qr7HkSaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DW3koJOQZaOWqvrXDNkySgqMwBh8FWRlUCd+J+43m5tIjZD4bYT1/CAuZfwu?=
 =?us-ascii?Q?mOPni+F24aYsgKMWM1t0QA8L56TW4yGqDQ+Iy8JgKAbJ1InGuZMxCXkYDczv?=
 =?us-ascii?Q?QoHULNHRxIK4tOFiF6EBHNRlCZMJ7z7j3ohFtsoXVIMhLPWqbV2F90Kzifyq?=
 =?us-ascii?Q?19fUMybwhOaZHdZYItee6sE2QJJhvv5mtJWxUXSRG6jvTq11XX7zgpaHI3PP?=
 =?us-ascii?Q?ycPhpwfRe/jwK2OjuxG/ZE+6X4LXQFkiAryq5YAnwKj+xx3QtlyiBXWuFiX0?=
 =?us-ascii?Q?BjeXvsBfHE7Zht5xXZvnU81eF+Ig+ZMRwv9DmvBnkOTy4wKdjC5/Nz8EYkOq?=
 =?us-ascii?Q?msqe4a1JotY5Afjr3gtbFGUsm3+xtLCgNQg5aMbrrFa0ozmlO/BHQ+4JG7go?=
 =?us-ascii?Q?y1ot/qt61j+fgsLg8K1pnmeYhRiSkaBhzFVKubxVpk+JmCy1f3DhpLnMvV6u?=
 =?us-ascii?Q?vijlJXrlAqJvgW6GV6ZBuEa5AYpPiLF54cDhVSJNASXVk8F++BgB3jPbzxiz?=
 =?us-ascii?Q?xWF2VmhZDSdCdy596phNmm7S31If+IgaPsxaDmpjPaa3gJhCWYZg4ey3vUrN?=
 =?us-ascii?Q?u5kejDuvmYYXw6flegq9uQj9OqtY57ankIZfSOpWXUzL/KVpp1ZBDhWNhNzp?=
 =?us-ascii?Q?wbDi2/v9igQd+UWx7/6bxWE0Le36tOJ39pbXOWiDBIlNOjpB5JQXO176uY6P?=
 =?us-ascii?Q?Pz3v+odVI60PywRtOwPKbZjVYtc+F/lmrLBjKfiDBLwGH/diIL5aeQlFmKxG?=
 =?us-ascii?Q?a76SP0dEq2NFj76y4pykgfowXogR3Sd43C81WL8V09kRgDoSn0u3Hb628wa9?=
 =?us-ascii?Q?uexrZXofLimnhVZIhSvYLtkExygiBlyP9PEIMLYWPVLbtaCDm+kpslqEOxah?=
 =?us-ascii?Q?DTWeAFX7WUnAVDjArxnZESH4mQ+kC4+OTIHUm7SjX8Q7plrw7ybTJteyKGnN?=
 =?us-ascii?Q?jZfxzU8MzkjxcWyOa9W+AQAmxa6k3vF5a8ukOhcXWb9IhiNQ6zdek24fBRtl?=
 =?us-ascii?Q?3lMRiucLcAYqmtSC7vKfxDN4686b6hW/hkzyYraQq0WOf2fhQQwhHmE4yeRL?=
 =?us-ascii?Q?SA1xdfg+xZghRwiiee/lZsjgzhNAeeK2L7vYMR/k3ilspmS8VyWUX/X/jjAI?=
 =?us-ascii?Q?e8MOGcQDPcwMUHrpo7zvTeljf+LrtFcCTvGp1ly4X/o3WpaMi82IyzcEkNOR?=
 =?us-ascii?Q?7gFiFZxIjyLoGAlhULRWZM0gb8CclKPylKWahQG8qcM21YjziJ9a7wMlSwXD?=
 =?us-ascii?Q?J82FOqQJd6URNmJ9PkE2krP60s3ErUaBb6+c7xibZiy+EsaYFLP3XgZHJ8+n?=
 =?us-ascii?Q?L+6obJ8OTkqgMI+px8u6UCmDGf+1n8en+w6ZEQl6RT71BWMn82g8bPAS21BX?=
 =?us-ascii?Q?EBYanYIRYUS4v3k4dEh6nIhEV4QMsnQBH+saCM3GPJ5k+wQRlhOL9yZva7Y2?=
 =?us-ascii?Q?V2U/hqAjDzAAPvwaqUeFzRpR6a+Dvp4TRjOhJ5CXCPolOlCiLPuxyJBzTrhJ?=
 =?us-ascii?Q?B78KhILoPdTCAkntl3OsRsoD8jFtMSy+ZoNOWGctXIgxDew8QIDRP8rYjpnW?=
 =?us-ascii?Q?71Xc2MzmWPiC0ZclmmZmQb9rFE0XZeSC3k8WkqbZh9jX15r9UFS+0fotM6Pd?=
 =?us-ascii?Q?QpxohvwhVnUEH3s2BBFNy3M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79b11b6-2341-4217-3386-08dd46a4ed6a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:53:52.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7sT/gS3U/eIQ3xqt7/oYtLfuulfsg3gkmmbWZEtAcrU6EPJibeQ2qdpxBfKnoBSrboD7t2LDFZ3jZ4uWIDK0OUq92JauaNWjDiIChOMXa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a4a2d6 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=odh8dF34rSFhGQUbVcYA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2O5h7pXO-6R-8Gp2neIDxJzlYZ-KPkUF
X-Proofpoint-GUID: _W9ZEtJQ6XtcNQcN9amWLqnUyF4RZa-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502060098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210925

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location.
This causes below error while installing the lib32 & lib64 binaries:

Error: Transaction test error:
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
 rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk)
failed with exit code '1'

The change includes:
- Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
- Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust',
instead of being managed by the cross-canadian recipe.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=40eb4bfe2f100ba5301046ca25110fcc55a640bb

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.75.0.bb         | 13 +++++++++++++
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 +---------
 meta/recipes-devtools/rust/rust_1.75.0.bb          | 12 ++++++++++++
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index 50b7e7c7b4..a6d3f1754b 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -50,8 +50,21 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+	
+	ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+	mkdir "${ENV_SETUP_DIR}"
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+	
+	cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+	
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8a51a02293..4e2e051f1d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -53,15 +53,12 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
@@ -80,11 +77,6 @@ do_install () {
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
 		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
 }
 
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b041a5f8e4..b9348bf050 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -270,8 +270,20 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


