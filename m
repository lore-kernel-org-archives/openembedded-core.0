Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE6C5AC80
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38971.1786095099102649223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mEYW5RxM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26790c084f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776A2sK2269406
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 02:31:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4XIqlJnroWPEeKsVYeTwMKP+ThBA4ueQIY+MTRmTmgQ=; b=
	mEYW5RxMW+nGB8yst7tZKyOJMCmE33Oy7blUxMjvqJ9QoOP4/KKbOlwIMhn9WCH9
	/uF9PGruJKGMgpK31RTmczKNRaCDTwiFm/H0qoMYDAzt/xw+hLZ4445aGOR58zyP
	0vKGm612neaOo0NU25EXOmzr5Px4yZuSTg/ybIjqndGQH7nSEeE0qnimHJ49w1QK
	IdF8y/Nf5QAvHs4inGYzlZSSoPowq16I/5RwLKLOCD6DNzGBrpNyTIEbzQNN23jR
	1aKTipIfz71DcDOfWDoRA5Xmfnk9kjbB8ALrUmTqdQJe9Zj6KWV73d1gBkxl2A8U
	5qrOB8IuIhp56xQnKEtakw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgahavwr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 02:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFQeDY61t8tTAEAK9QNCv4Ll1W56yq2RgxfnxkNO9DUGmElH7vZaPJdeG+f++ePqcXVyJGebY5TVLoATWoS2AYNDgeVUTa4FNLFydjxtw8IVVAMlKU9g7WeptCvAzbSIv5usDqtFEURwMtSi7BWeLZIqGC7rR+InphFTREZOe6b49rvQtw7Eh6JQB7TLbNG3MqhVGgseDsyYOUTQBsIJK34RuCrL2nFwvQ0tNDV/VeV/kiHN34Xb62FbhpsZee79jnrYi0o2bz9dyLY6OMrinPFOav9eUEspV0QZ2aMVgtJAmZyZ1EetUHQseHTNf2Okwx8OKucQSMGQlmjw2FA49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XIqlJnroWPEeKsVYeTwMKP+ThBA4ueQIY+MTRmTmgQ=;
 b=LED0q+Y9HCysOUjLodTzYmneQPkmlXCsebyofJP3WGxtImtILh7uquSEzQb0BHvocvkNHEv/j1g2K4X0L6MI+jAi8suzXA2FpKOdZHhAwzzhVfrJ7hQzCr72nT1sfaEpq0CllNdEH+IDwy70xHffk4vhz4pSDMtURyHSTZHfnUXSedis2GLU+h3XYX6YMZ8c0zzWKauEq68rfgcyg4aAwIZ8Ked4ZDFI3DmLSWaUyxbC3bz1B9nwDbvRRh0qQgTWcEx+0sij5lkifG0nQlVL8VBDQY/+feHB33pdFqtHR2l8q+80dQC+rPzmEvZbtBLRJqjTajEmLM2khsOsOjwNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 09:31:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 09:31:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/3] toolchain-scripts: source target-specific environment setup scripts
Date: Fri,  7 Aug 2026 02:31:15 -0700
Message-ID: <20260807093116.3680514-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:408:143::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7cb242-9eaa-49f2-2f72-08def466ada4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HAd6wSPDTlEBf+hx5qIt4KXj/7nYybdyZHxL9IkzPXxwqHhcwcGf8oBNc2AuV9jGdqC29B6RffTyKlnZythTsRNcWEeVzfstdeNAAHt8NIyRj5h/a3ZUguoD/V7Zpd7Rdv+XZRAKCuOYUcawt0gGTi9iJ/gl3VnT8qKq3aU2dFe741x3t3SaYfNf/F2/StUhGAvRlH1bgbg8BHCHMbTVpSHDVl7uxaPWfEHoAaO6MtjhVL4YfdRe3cWVqsE3GP/ns67Vc2WKiF7NTZ5kHadfc3QbgU7qLqTCzSDXPzIBXL71WCa+YN1abOH8iagfoq+kKDZWnnN3x5udfcGiwE1OqlQ72FisD/fUx+dVAKzCB/zZu4VldjwZxLz05ZsUISwEv6hpC9JvhLlenAOVW/wMFdC5V5CoRNncXd1/Zkr2awuQqGqhiNJBJusnn9GoDJnQiGiX90WFhmi7/1N6PFcy7YOxeGzSKRXELOowuLm/FsSZ5+F4xqDmtMJa1BTi8ojKpccX3+bPx4DAgIR+rKrkbpwJPVVUbS3nDK9ZY8UB82Y5MLVnZ6tp+c4M0enSFZFmz4T+FtPeRRJfPBCp1vyLzFOJC7tyxxoMf3g/WnA5dL+XhVuIAvQy2uQopjMMiFe05mjiGpicWVa/TDw70w5PBKsYUAwLcRhiPh26OaVXAkhFgyeMZnyWQlbgftuGGT1VXAQjTrJt3iZWekVhMgD/Q7yqFXZ5TgMqIBy07YoolkI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Z7m0b+dUcRT8IoZae6Fh2F2PcTDxpdQbv5k3v1jUIFQrmKP8bCcRgFcmJRx?=
 =?us-ascii?Q?SScubNkfs8EUvncLpJPIO2Q4B+QJY0jTQsHCttb7BKlqEOxFZEFWBO6GI/Ic?=
 =?us-ascii?Q?qKGtYZAXpFghW2M+DscvRu5y2iB69EYklNH68K9+EshWVOqIvxk3VCg1A1Ij?=
 =?us-ascii?Q?eKcptqsw4bNjmzF31q+LsgKanR4/wmG3nkPVx2atbNRbpT4JcGPefiQoJk3/?=
 =?us-ascii?Q?qp+zQr0H8mGnRq6ZDYsTz/MjFMQxDGyC0/VJK0ZqmDtCGV17niYi1WwUG8Af?=
 =?us-ascii?Q?boojeDvrTYYSGL3urexCACyqx/FPfiR/26iLV10BN5o0ATm63VK+nhL6i8YG?=
 =?us-ascii?Q?vVSAoMDXY2dRFdZZVfMOdXvjDJa1ywz4xW9IoczPotP/qBgk4b/fmpXHcS2Z?=
 =?us-ascii?Q?J0O7kV76/nBbUgGV+A296BKRgBusYaBx81SMQv2UXxG+jOxsFnolHO8CDgxS?=
 =?us-ascii?Q?lKAzsBwKqoMjXGxyJW9Ckka2+2uylDM1pg8y3WwotRHiIw1RcPvj3dXWA3Ep?=
 =?us-ascii?Q?0ghcYDVrWuooxh9F6BSC8+dh8YAqFbOBnNOoFNR1PBxkSkFskljT/T0XkJCR?=
 =?us-ascii?Q?HVAwxHpeN126t1sXIZbmDVymXRY+5oVplWsvHktH4YbzG6Q5PqAC6HzaBK2e?=
 =?us-ascii?Q?Creiq2gyEqerKFYC4ArDqZOVbnCM8LQkHrhhFvn8RxNRa3wPdvmMYKcJ+WWV?=
 =?us-ascii?Q?kJkn3TFMO+gONUtI1RMnwhd8C6Q/oeOVgtGAHUe6Mj8F8iCypaSoQtmUwoIL?=
 =?us-ascii?Q?sQ9E8ZcuLPxjrDk+AL7l0fqPyEycnLDzlvWG5Vy9F2LiR7AbXRbmmcKLHzS2?=
 =?us-ascii?Q?DG78CYhsSuoe+swb0kuuSEGTcx3/Qiva2tVeCpW1ygo+unXyMbq9ickBiZyL?=
 =?us-ascii?Q?g/0nqVIm+g30xmhEPhEBzW6ivR8XE44/kiwWQ5YYVM4vBKZ/BokRqi/hHuo1?=
 =?us-ascii?Q?HJJfzZ3YnRtNIp80ARZNnzZ70kkadQ0kYUaCl9yz7cnV65ssS6leITnxkgRr?=
 =?us-ascii?Q?wVfIM9pFjTvoemGKt6zfUj9EZ7ZpfLXxtU+r2HjI9F2O3VMKAJ3cFW9jVrE4?=
 =?us-ascii?Q?NsBT6i/OfWduLmfH7ZfNsaVUM/7UxOYNjshccQhNMkeboQhzVN2htUM8tZEd?=
 =?us-ascii?Q?CspGxTPfswEDDsrQznwwC9RV1n/DqEcCuEbnbnMfhWTMZN/BGWHYMJbP0NGw?=
 =?us-ascii?Q?JEifcMllX2xR3NIPSjNPInpDU18zr/uKpM3epQqbgqt+9YWmsHn+Hwt/ZknY?=
 =?us-ascii?Q?crfovM+/migZFGoD+XKZpjEbT74AZERPaBp2cM+Y5zEA3GgLvP+Os5g9p6qP?=
 =?us-ascii?Q?73E5E5rJkqanHhd0JiN77eonUNT+MPBEJalER/pn2/1R9GUJW1Nen+YmAvDj?=
 =?us-ascii?Q?jRJqbEqX3XN7TzNksnG6vg/1GhrNieVkAZJGWnusdSDPxjrzNH/UlXRqdnm+?=
 =?us-ascii?Q?kl2SGp5zHHkDnVdHJyayV9g1pGi/kLnrifD9KxykIVc5jrVA1ZWMI3cOJL7c?=
 =?us-ascii?Q?umcerlvN2mW2H/TeDL5k2ZL+3iFlBIaNaE29d+b58LVPAdkT4PrwHCuPt9M9?=
 =?us-ascii?Q?WDQB2k/Fp3bXqM5r97cG15aOztMI6O/lWxg05Ub/b2REGXCFg0pAiN5N9pyB?=
 =?us-ascii?Q?IfaQjZYV2A2boW45s/zXHTf3Fxu9TDvTfpdeLsLepQe3zOpYzVzAirwsDswS?=
 =?us-ascii?Q?ziuRfWJZMeBxdtFXmJZqltA6Z7XQSA56+6PGkG4bnpAYPLb8OiT+acXxh1JL?=
 =?us-ascii?Q?IoRBKU5wsX7JaTsThUbD6zTq7PoPay8=3D?=
X-Exchange-RoutingPolicyChecked: 
	caMDAKkZC+6UOAwA5isBSJ6yVMiadH5brrORSjQ2HBS2LuRGM7zuO08cXppoypY7XAoQDBCRahkM/jxN6G4EVa2cWRueSoegJsvKgOTbMf6trPGF0IPR60H4wYe4qE5pK1cybiPpbyjE4FxKVPQKPSFRsqZFsMYWMUdssDtR2wvSVOW2YYELSicubQ77Jb0ezLJhBO2gwZ5Fm62wexpUXkZI0kpuhfofvTQyEc7ChS8v/E/JQeP1uuduI2lDdQKkcMhi9604Y+rag+6hSw+QU2xc1I0Tm/OOun+pVpkJleOsaz/qc1aoGXljknhiwG/tIOlfcBrhAgggZQHu0OoEdg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7cb242-9eaa-49f2-2f72-08def466ada4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:31:37.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NolEvkgGu1WokvNR4fX/3y5L8hxIAips8/GPhOjTItY4kpGeuBlEzsMHKR/3+0FU41EaZneDWc1fWVOe+7E8weHoJVxIRV7EGoDSrS1WT+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a75a5fa cx=c_pps
 a=L+VognwtS2MEOC44XfDnJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=KS2_OJWHKhWuo-98OvgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX71KZteK94QOp
 WtKXptHF3wOigAa8r2c15S9bMy0MCFct/A/BMIUW7ufbh0KPQSKYRl7kfTp0L0mj9ID0dbraiDs
 R0tABLAzcyKqodW6fIUWQQ4pC6kyMTobzsZfwb+rLdysRy9WcgjhSlSbx7cuT7NAJ0Rh828RDR/
 HV9zXfVg5DbRUNktD8AJ3OKKTt7m7zRMuwstFSrPSccIUahDwExVOZ0vQm37uPYz7jEtJqVbCGN
 mYKo7plXos3MPpMs3ZGVGu4bfY+Uv8CKB0j/WvjGUXLigigQwvoVoODBPvjtaaNH8R0OmJ/9Dmk
 D5xdJiPMuMJ3zf5YQN2Gnj2JhFfvEiiWgPpo9yLp1rvoTEAnvMCe6LYjZEeMN/6oTTPkztnEe4v
 9NeRI0R58DaezSGxiLDREEmXLE4Tg+sJibtPGEeF8BeF5ZRCR9m9EZeRA7p62LHE4u5aKWt9YUl
 OMaKSc4Szt7F5EsUE5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX78c55s2yUewf
 IzMOCCCtMIyljCNuc1XoITerO/CpEidpYpCD0Wb+YNMOGPuGq/dtq51VDLYzWgXGc59piidaWwf
 C2mlFRHh+ai7nUex4kEq4PUNhF6iryT+Yve0gcw301HSuDjepbjx
X-Proofpoint-ORIG-GUID: 7_r-o_9P3Uk2SISnGBhN4uPjJ89INUjQ
X-Proofpoint-GUID: 7_r-o_9P3Uk2SISnGBhN4uPjJ89INUjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242993

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]

Export `OECORE_TARGET_SYS` in the generated SDK and tree environment
setup scripts, and source any `*.sh` files from
`environment-setup.d/${TARGET_SYS}` in addition to the existing
`environment-setup.d` directory.

This complements the rust-cross-canadian changes, where Rust
environment setup scripts are installed under a target-specific
directory. By sourcing only the scripts that match the active target,
the SDK avoids loading environment settings for other target variants,
such as mixing 32-bit and 64-bit configurations in multilib SDKs.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index d94dcdee39..f0f599959d 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -76,6 +76,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
 	echo 'export OECORE_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script
+	echo 'export OECORE_TARGET_SYS="${TARGET_SYS}"' >> $script
 
 	echo 'unset command_not_found_handle' >> $script
 
@@ -110,6 +111,7 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
 	echo 'export OECORE_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script
+        echo 'export OECORE_TARGET_SYS="${TARGET_SYS}"' >> $script
 
 	toolchain_shared_env_script
 
@@ -172,6 +174,12 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_SYS" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_SYS/*.sh; do
+            . \$envfile
+    done
+fi
+
 EOF
 }
 
-- 
2.51.0


