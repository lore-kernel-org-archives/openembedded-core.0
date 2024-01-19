Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6280C47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:09:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24504.1705676989053163966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eFmoUbFP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JAU8Xc025621
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=bLFUQGg0HZ4ptAyzqEcWSrR2yXDsaUkUtlPQ+KhZ95U=; b=
	eFmoUbFPgz0iqip+lt77NeCfOysIABoTjIGcDx8xfkyD4QLvzUkRta2skK23WU+5
	wxJPdb7aMtonXz1DFbi5U7KLW+/kk9N/Pn3Ss335P3jc5R3VT1hOBbQN+r98IFmT
	F0FvxC95O0bLonwgydwFHp8QbjuTYuY+dy8DaihccND6H+0cW1iaXvlfxlTfXYTU
	PpF1soCPUDFEeByxUwhib+KO38iAhs0MPMEV/X18cVS3Mm0OlxtaNoO1jxw6ipxg
	fOStv2PDxzF5UWu6oBZAbzpEz1/Tvh0cYfElychYMfDtxm0l+Us4T09I9Tu6YEh8
	Mo0MMRCZkiWDXPytxZ0C3Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46w0q-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3VCGBWUl28NjuPE8qdjuUOKphyGeOxLPg2ASXNDQ/gsFSHUfuZ6eO0jeQZBLPpUdOIlRg/DuzCE6ByS0W48wB0ifqW6IkQ49E2/Ilv5IlETJSNPkz8+ykXNkX8IQIAgErLO/JLN4WQsnFgI2UA6AP0zb9aiwzF9F+UOEXp0TwYnNRb8LAtOwf6cX7WOxddw+U1R048vIpNSGuNVIl97FQhvfQ+QZPmM9Rm34EqWbxn3R+HLxUqAo55jqDnlJPwHdqZ83HBwC0FSe2c/YjzxWy4nHtRUcihp7UrfVuvoXt8QHdak9kdFEZo5BEq+TtHBg2yk+dWeGq0G+SBir/krEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLFUQGg0HZ4ptAyzqEcWSrR2yXDsaUkUtlPQ+KhZ95U=;
 b=MDC25EKMZRNJ+42NXpx3h9yfde9aBVjdMttm2j7cBcIHCjT3Yua6CPdPB3h/e7iuAooNaspT1u6u3b3gty1KN02wkrHIzTL8NICWE9aWhQkwiuhd8QL4crupsHfyGxjPMOuOrvh5saR8X8aXefMPd/w2CJvJCdmGn40NKU8JRIIKX5w5MSt+Y3S+qsus/2KWRcUZ1M8AO45HTwViBv8NzrVTWURx3eh+Uz6sYZH5CqNmKHCJtsPIlIAlC24IrN/FbhpNDaXV8TnRPdaCQofXGPys4XZCNGU3xdDyVbKwdJUYUFITyfhRhitV4Fj8dcpaycfG+8r3MmwZ6BzDEngfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 15:09:45 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:09:45 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 4/5] rust: Fix assertion failure error on oe-selftest
Date: Fri, 19 Jan 2024 07:09:06 -0800
Message-ID: <20240119150907.3840110-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: e9931df9-7cfe-4382-d3e1-08dc1900ab58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P6swJks+lZ4vF/z+1gDxkoxrmDoalI2q9ilkiwBsSg2Bfft/Y8ky5XVaavf+R8fJzeZUiGyO55/n+AWMutjBCjAiVkru6NA/scm0kOiOMsuytspSor6xeQC6ibtRb7tH6Ea/PuydsO3C4lJyyBxsiNNxhvrEORQtsdTgEJPe8Cw8P4MMWFqlFag2J+ERr8tKvvhIT1KMxlAImT6hMD6jNlvC7nqa7QTY5gPVSxZFgtKgzSo9AGk9v7RBsryDDP8ojJ3LHJyrh0ZJrp4fcV4XEUXMtzSFKbg4s90lWXtSz1RrKCKRVHHuGre6F50fgGQv/ZkQr7FDDiU3ex6qUWE+8dpLXx1aTleufQI3q0nUvvvMUItIwQPS5tReMaBiQT94xiN3DzNP5srJE9L/Gp5Bxh1rODVj+CSfeFd7E+bBc5GLQvwkWKaXWXnegmC4KbgnYRLTmdD8l6aivRSJzjgOZtpBanZoCmoGCl5wTnOu6fEvAmRnVftOk805u5o/wcCA2RzgDb+0hG5HDVFUTbgPlNH39FLYKU5v+mO1EKwJZqgjWYd3T+F1NVoRilus326zBb/1DEdOgg65QmBO09ntIu8LaJaiWxZ6s1dTUbUDoUk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(1076003)(107886003)(478600001)(2616005)(38100700002)(41300700001)(8936002)(8676002)(66476007)(6916009)(316002)(5660300002)(2906002)(66946007)(66556008)(4326008)(6666004)(6506007)(9686003)(52116002)(6512007)(6486002)(36756003)(38350700005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W6QAWVZTf+fMBzaaTTbV00OqtmNIizNO2PifQIwxDxZRSGarePiDrCWg4iZw?=
 =?us-ascii?Q?DNkje5P279SA5nJEl7u9OpvIZAKqIbk9D0EXYDHQnY5IKmk3bY6cqm1dQsVg?=
 =?us-ascii?Q?IeelBCcEA2IiEeTq51HAuB16FLPkJHlc2Npydq6diIpi1+w5eDVkpC/AUAee?=
 =?us-ascii?Q?i9ByiBEP3gtc1I+TxXpXeaIeFVle0UqXz/4/81Iz1PKKbnmPELh2Biqvxmrr?=
 =?us-ascii?Q?Z3nFKYRnqy8Q6Voi4dOvmyTp/NW7BRMo5xmK/drOuyg2/G5LTev8PHYv1j7t?=
 =?us-ascii?Q?Dy8Ppk78MwwEa6YJQowiVggoH7Q3n0+R0unZp1lQ7srlYlKlMWfmT1+BUbyg?=
 =?us-ascii?Q?WMf2+dakCS9BaY/xZyfvFHtL4KFfpyIOuMLnKJBWlsblZMwtuU5UBnbgbyGF?=
 =?us-ascii?Q?5c+gmaQ1YwFBgEQWB6a8HIs6alPAd/V/CJj8Cu1ECoFeSXfLTe4m1bHNPXOD?=
 =?us-ascii?Q?omz9mlyHHh/++QzMZeAmOlPeMDpxcC2cxQK0NT2XK24AmpRMBo0QgJ92UdKu?=
 =?us-ascii?Q?OZgHRXCr/67h8KoeecldlHB3sQ0L+aDrWiPZ6IcF67OVTCeZ/303FrsEcmRg?=
 =?us-ascii?Q?8SRt1asTIg3wKcCKwD494HxsY7C9tlcgpRBjL4RzzwU1a6fNF5915sdpoMuI?=
 =?us-ascii?Q?jTbYPvtaBuMB+m1SjIBuauyNjmd+FPnH0k98gdTZNug7EB+UPji2m4kjq575?=
 =?us-ascii?Q?OITnOTmCseKI2OGe3GPiTWvkRdjGK3wMbI6M8mIK5RZDnJGJfJeUwRaw32e2?=
 =?us-ascii?Q?+DmWVgyT2+wxuXIax45FberdonBm1CKBhpT3ImVXJa4p527tZTCQas5UNj/T?=
 =?us-ascii?Q?csAGltOY79edPCo5dqDG3fWLFvKtY98xUPFQQ9wzJxFd7zkEiHcyGvXsoEky?=
 =?us-ascii?Q?I5Fbo0Jzj143WiqkUxaj6aw8tPvfm3NjEeyCjAwVynbG18jArCTfwYw5vD2t?=
 =?us-ascii?Q?DpRTpoQpwFUY9mDIOYpraGdjsHTlfn3GEg9QvsAjY4GYaPwWixCr0QJjLy7Q?=
 =?us-ascii?Q?OpymOceofFFeEwcrS8ucHh7dpvPkprIwyV4CWVuiPcycQnGbwUVE3Z4eMV0P?=
 =?us-ascii?Q?dOl9I0iK6d8zs/WMZbrtTlnP29q1dggKP8apaz4gkK1w/kw5gF1RnVQytOns?=
 =?us-ascii?Q?b8a5Sy7ajtSm7a4ajQZyTfwrdN1n5USjc/M4uww/7TbZaCweTVRrqAvO8mAl?=
 =?us-ascii?Q?BYR6bUF1FkYsxwkqO4EFleEWId3yVlAtLpr7xml9bNKVFZJ0JUn9GF2/v+42?=
 =?us-ascii?Q?+ad2QAz3ai3jUPw5hQ5BS9OXoyhTAO/ePMnG5l0DjOiwxRvoyz4/21ggiyBN?=
 =?us-ascii?Q?osnERNYalYUvLQM97mOarqE4U2DEu2+hkrAP7fZOO+coDlMIDfsfCt9B+0UY?=
 =?us-ascii?Q?PvLLRzIJvrrZGp6aHQcTqiVFrQWdf4Rsr1CsY02le8FEPsJ0o0+387JEpKIX?=
 =?us-ascii?Q?xt91akCgFoDM0c7UBgWSDPGlpmrfaTFVVbrUMIZeaAxyBIfKSZa7UakfY2w8?=
 =?us-ascii?Q?4QmBDFjs7wPESJh/PeOh36yVvmnAChyGyhJ2LZ7UM/HGOpjOd5jdDA2dEVIv?=
 =?us-ascii?Q?m/NQfioRwS/pp8T3TFBXU8aMKmkiLEeaRm7P0jmOiaBJ8PtNVSC+qzTPFIE6?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9931df9-7cfe-4382-d3e1-08dc1900ab58
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:09:44.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCwOt7Lxczgea+PAYoOcl1M5Pj3WHRiTcTeH4p7lhd2k+xpOyTEZIzY2QdsSMv0C5f7ASTt+MqYvja6ETbZnXYh4hEE11P8Vz7+sESGJG3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-Proofpoint-GUID: Du2GnvXKBdV-E12PqBbIulvdi4Ue5vaN
X-Proofpoint-ORIG-GUID: Du2GnvXKBdV-E12PqBbIulvdi4Ue5vaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=820 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194056

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: thread 'main' panicked at 'assertion failed: `(left == right)`
left: `x86_64-unknown-linux-gnu`,
right: `x86_64-poky-linux-gnu`: Cannot obtain compiler for non-native build triple at stage 0', compile.rs:1474:13

Add correct target value for cross-compiled targets on stage1 during rust oe-selfest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/target-build-value.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target-build-value.patch

diff --git a/meta/recipes-devtools/rust/files/target-build-value.patch b/meta/recipes-devtools/rust/files/target-build-value.patch
new file mode 100644
index 0000000000..23e8c76801
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-build-value.patch
@@ -0,0 +1,26 @@
+Add correct build value for cross-compiled targets on stage1 when
+bootstapping rustc.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/b888e2f82b9dbe81875f50d13adbc0271a9401ff]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
-- 
2.43.0


