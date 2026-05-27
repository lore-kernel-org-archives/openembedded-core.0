Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE76CD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19601.1779885876098462301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dbkVAciX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ki4X2757722
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=foi4a79sRi47jTDa7PymYyCCSCoCuj5NCRysM39K5VI=; b=
	dbkVAciXaByK0U5jWPyMyjydeolgqHLVNixeh1LfHur0SYSWTIIRtuHsBmoMKMPS
	ZI+iKpMC28jFZMqKh9SFHTeZ79wc5AtUmZSJTM+X3DHD1+/kg2VmvU35VqZWagGT
	tGtRrvYhb1ucJ6mq2R86Qfodn0lz8XkWvPmYWa4vTle5tn3l6MorNUkB/38Z8rSD
	yfk6pIXjtCquVgLTz/NISXxnW+tMfNBgiHV2DcBLdEstjnZkRHZ2LID5L0juT6gq
	W0eC3VLCc9UxfSoQnDwwqjMi5Aa0tJz9Cysgvc1gEfCphp6ApBxTrGGGLza0YNGs
	ZLnY+JLXopL4d+9CebvZng==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrenk0q-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAes+3WBw9pe5apW69UhoFH9ENU0hAfAelYMm8No0nYR6EGV//Z7k5KwFfWJ4ORoVkteqxbBVOC2/OBqhrWuPyZqZ+ey1EJXLRqf8e79u5KSsXy8/Mucm7KUc4f79eljpnNQ+5hHhovAsOh4zaqm5S5+vFzU+e0EOfSPUy5NGQyPssP80+rqR9qUKJPNy+/VsdTeUF1etPiaL/A4Eh/UUIaIDxg2kgzxNB51xythe591Ev1xYfwuXjOH1kYILOLRIKhmTvMJ+H9WTnbb3aDIBfg4CdPkpcAURU8k01oWpBdajn6cCnO5mVKaifwCwevdinHCUwdj4iznwSJ+XegabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foi4a79sRi47jTDa7PymYyCCSCoCuj5NCRysM39K5VI=;
 b=NJ2tU6OjgY10p3m2sZ+Mudlawxd0uDDpd7wTLPQoxkxS2zHuugigMKThBYZ6UTL7/wJTH+pt3qTpcf8plFHQjIbit28t2hmjoelQoxSXJ6meJNHsO6gkDNbbYaMyEAd7VWonGfgZ2K82P6MHCgu+Q6DY4rn7YOS9D8iap71bAUtFj0M26BwmDzCwdYrhDVtWbjiW5T8NSVQJxxmqpivOw4f/sd20wu25qT8bl5XaTEJiX/AU0TQTFnY4mGJgSElxpPAIkID9tUKvB0nfrX642OJA7T+YbqoZ3iTJ3hndsOfwde26gpVo5HRJEGbQ0PC87es6PD/qoCZOhdcm8MDmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ5PPF75B6D7B42.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::835) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 12:44:31 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:31 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 7/7] libc-test: limit libatomic-staticdev ptest dependency to GCC
Date: Wed, 27 May 2026 05:44:14 -0700
Message-ID: <20260527124414.1728434-8-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: 112c031a-3848-4b52-144a-08debbedb26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|22082099003|18002099003|38350700014|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	b0oxRiag6B/qGoHiZOcFBy041kwTCJQgfxPNOqp9UGRX9CuUKJ/2BNlKBb6Yfe0UXNtd0qUaf9AN3OVAuAroASIqfDB30b0v1foHJsbrQdBhzpBsOjsXEsfgiTXqD00EGSxm68s1iiMB7iNu5NBIjoNpBxvuDIP840e3H2G4/3C5XfvMKk/krIXoKOGZJwtVf2Tmmh8eXkIe374fSy70kJi3Hd//iBk78MzVI7JhSD1grqZ9PQLT2V5g9OzDnXYgbMWf8K+6AYjgDXFnDxpxXFwpas94Pll6m7uBSjmeDEvj7ZeJG4UoLABqJCI0iy/2HWeZtlYwR9XAvsAOGjjsPZwgOX6XVMGxpZvaGPT/yVgf+m/s40yvSgGzYC2ejzudq0EVaf23QFErqOl4dp+dcSHcNPgttSAF9pvfl2xKZlbC+P+eEtYVoQbw/JcGk9Xedcu9cB3Mqh5+gxU1oXNm8pJzIYdY/c7ixyJ7iJK5VJffCgb/i/K+tsMQCzMfGQsbkcSv4Z1zqMFSULhS/Rw7qmBfcGecBEq7b7r5jncOYp/hPH+x5SOFRrH0HW3CWoYx992fWs+xmCcalwWCTzN5AOjEwPI39ebs5WdRK5aeS/GN61LzyGnz5hMjJEC7o7DXbR1Gi3K1HFZ9lCzB5Oj/Ent+hiQxGb6OkMiWjFh5UDO9VRSBdCTR/N58lqaaxJssVhy4q/53kvl0dSQdWkhMjpKKiU3dlHxckUMcT6Xo+TFvi4mEVw5aqCBXQ89yq7CH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cXYWO03hsFNVACtgZ5AUpXtMuZP/rHY6WJ0oD1ZBvBudOj5yxW6Uth91ZlnU?=
 =?us-ascii?Q?g00BTdjju4AXb9vC8vJpqUp7sS1RKZ2cN4fkhiQ0fw7ofJY/A83g3Tb8IqdT?=
 =?us-ascii?Q?xahZd1zw148WCn3mgTfKe+VaCTx0p+60qVrXXScjLdeD6/I5fgwrOGgQEAN0?=
 =?us-ascii?Q?3W+Zs1Z1s8xdRQLDbJrs+5syelMYAlEjHBNSYCJlSbDcIF7K44Vm8PyQzWJK?=
 =?us-ascii?Q?2rjQaRPETUbEnwI6SqHcJI5P66JF4La1T8qOFYKI4ywSD47eFCnCWcsuX/Jl?=
 =?us-ascii?Q?2UmBMCd21KTQwHCwq7089YtVUtVr62TjN+mqiYpEwoUA6M2nlgxMHMxNo6MD?=
 =?us-ascii?Q?o3wztL5ALSKAgLAA3ecYF4lgl4GAzEE1NDn8F/1qa3IjhzAAaCC1LZD5uLN4?=
 =?us-ascii?Q?bt6rXWJiCt45FG7GU1bHcOlrB46AdxRut0ebFAVZUNozwS+XEGpOcdIxkCsF?=
 =?us-ascii?Q?WmTYeRFMrXqD56BgSDfS6BjjX06Mo0a5hCl+IOA98FhhtX2I/2C5F63BxYrI?=
 =?us-ascii?Q?PdiNuDNEwZfunsOx+GJXABIfvtO5/y96VZrvp6PG54fuhDhvjjd7UbxAQebx?=
 =?us-ascii?Q?hs8oAezuatX1KAtymvMU+6WAGqH66QR6OAlY7yIGifMh0sqOXKV0Z5KVnfYX?=
 =?us-ascii?Q?RI8aX0GsnsCoiMi0hRZOXoRj1kY6OUnP1Shx3Dz5mgp4ZGVYbCrOriB0aAJJ?=
 =?us-ascii?Q?Xumx4QsdKLNI5w2Hg4VvFksumIdjwn4lMxE4LMQ2Cnk6wW50rx0SIPW6qQfr?=
 =?us-ascii?Q?/XdrYDmQ+zecTpAEnpVXwcNkIC8ljve7cy1OLEICvPrynwrLug34Vi4D6onY?=
 =?us-ascii?Q?sQD4oHeWYkCfTkR8fZV6CFbhAdHaNLFSHny8HpW7nREanJDrFGEqsRErjKYa?=
 =?us-ascii?Q?EH4cDHCFwT7qMoQvT/6RrPbczd0/1sh4EJ6vMbxEciq0Sq0XZWhYoJuzN/47?=
 =?us-ascii?Q?Hh5jQDgIO+dUvMLUDHjvwDeNkQ1J87Bgz5+T2xFoKco915zHz1gEp0MLJFDZ?=
 =?us-ascii?Q?/Z7Y9AwTwuhyqJAQjubqWi4ROat8CKFRabWSn/luOKiMcROn/GkFx1jSuy4V?=
 =?us-ascii?Q?jUNBiAnnDimkqG8zPC2YOfsSsdu84evMJM3jBng8z3Yq11ekrhlSID4Syyud?=
 =?us-ascii?Q?7bBq6Vcuau27v7eG+SBvy60gmIXoKPdCwdFEvN1ZspOaCNDVexgtSjRfGg0N?=
 =?us-ascii?Q?GehS/MqUdK/mc0bAR/D6icbNbss77Jjd/t7A24B7lKhexdeprkC5Z8DDGVk9?=
 =?us-ascii?Q?CdepWtSb3kYUcl57qrKOdKRdjc80Kg7I8XCYqgK4No5T61tGB47fKfeAaO2i?=
 =?us-ascii?Q?QTEyIGRFZreesBetQevNoSulNHxHOr14KFZUZm/AgPv6VuK4c8tDHfiUTnro?=
 =?us-ascii?Q?rfFrY3/TyKJeegwmWH/0wN1edOEQ/D61MSiN8k/aaz9sYd/RcgFWNRSKGk2m?=
 =?us-ascii?Q?FYuHpveogRX8rz6mURC3kljGsesbCN0V1EylQBWxYfV40nHQLlkEl1giTn9s?=
 =?us-ascii?Q?RnXXKRDFsocuIzBQPaWPgIHBTwZEhI6U0B1vj5L5lopnpPC/sx2uWf7RxvYb?=
 =?us-ascii?Q?rd05dJyWQsHylthlbCjwdpdv4RhEG40wzlI1NTxezZT7IDDEKfmev+ZNrdSb?=
 =?us-ascii?Q?kXWmdyUefsTXx/8XZMh1ofF+YclJ/rjJ7UUvo8KjKrOjDBuyKvS2pldRTCwX?=
 =?us-ascii?Q?neQoI+kctFkONOfpr4q+nVAK15l1bvyryPwzySoI4H9MhPm5QpEyL4zM4ZfW?=
 =?us-ascii?Q?bpwrgLw6PT91+Qj91fMKRzMEACHn2nQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	pJVMNeuugVno1YqMljX31bDyf9QhAGaM4ocXYGtibrOf7sm/cSuor6X9mLbe+KeFGYwdMg21U64dTHuAwnOdQgSZtIkRbaC2dcsSkMHWvSPmpaeEJzAs5H1Og7wBLtD52CZaTi46ONyQBuOmXykS1ek1s9etddP2vsmRU7lGPiHnT48fCbEzzU7mj2X5cYBK/dxRWnsVi6nakQfwyl4M/Cw6t854QVt/VD8jHyVWDvMEAqdDoaSMRLt6CqtfJ6McmMH0LNl0+ykfMhKrYOFuYV97aldq8RHAvP5LtTQHlbSiX366WNlHfVplHgbY14b23VJT9jFM6b45+NG+QDP3Rg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c031a-3848-4b52-144a-08debbedb26e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:31.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrirDSxWRfzV8sT3VqRIPOyv5qsjG1UVU6PaAgI84gLGsjn9PKkeyb8YB8MHhr4Z8Kaz799/MFfOWTuDfLhWIqG55NFZFy80VeVTQEibmDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
X-Proofpoint-GUID: WBTFvE9Ra6i8R5Hsk9HCYOBwi5Bly_0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyNCBTYWx0ZWRfX1dIhaoVsoMKh
 HpB5zln3d382E6dg5vT8cjOiw/4tvb+O5mVt3q0qGNHOi9X1K6zASFOSBNo/OQzu5RTEQojNtdr
 Rp663YS1q71OFvTifi9tW0WjMgrDOFRFZpbOjgQt900o/cT2berbuWoRCsgBMsTzqvWeyJ8c5lx
 Epaxbn8aguG6CGtK7ro0zPZ1PqO7RVM9Urcpcdznh4twWT8vmaOILUztCqk3rU4RYXF8hjLFKuB
 XdJ3iMM0X6Qe55L67yxC6zL1g7uRe6Kfh7ndJmgPqvDke59W/eghSGUwwz59ZJyzf4Q89ttHNhW
 jRapOW2FgsfyTK7atMsQ9lald6bcai/29bEFmfnXQk99ldTJWcguxZEPpGWKemV1E7ryvapd9R7
 zrprWtIpQBK8vEowRVQPOa2czf5qPrzbbSvV+OHu4NK6Trj6osaNsiECWMnG8XCkF8z3OvtsdnV
 k9+rF56DQFPjwDKxqEQ==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a16e733 cx=c_pps
 a=VB8Rg5rwfRosJW56o453OA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=lPJRS1RxyxnzQ7hN9tMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WBTFvE9Ra6i8R5Hsk9HCYOBwi5Bly_0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237655

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

clang does not require libatomic-staticdev for the libc-test
static tests. Restrict the dependency addition to GCC toolchain
using the toolchain-gcc override.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index d9999ec377..15a2ce42f7 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -36,13 +36,14 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
-     libatomic-staticdev \
      locale-base-en-us \
      musl-staticdev \
      sed \
      tzdata \
 "
 
+RDEPENDS:${PN}-ptest:append:toolchain-gcc = " libatomic-staticdev"
+
 install_path = "/opt/${PN}"
 FILES:${PN} += "${install_path}/*"
 
-- 
2.49.0


