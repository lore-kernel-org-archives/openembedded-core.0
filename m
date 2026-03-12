Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3A9106ACC9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25677.1773331895176474868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VNplEPyB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9XEm8008800
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tjgn2YCk5jLzsfQ6fgjIT5W1Z6GownvfdJCs1EcWpDM=; b=
	VNplEPyBNqgFCom1rdZ1vwY3PTkwQP3KhKwaJi9jGsXZXbqfurL+6B63oPu5tr+0
	FTvSJ861ISYSASf+9Y6tDueKOKKErdX8A65b3Y1/X32T1usdgazGTJLwbZmjQkxA
	JGiGaY/6Q8JB5ndtdE9d+PCysiKGKp6IBOXsv5n+whZOw094oBJEZfX9jVMtZD5Y
	FNuweE4YjZfTa+aizurepgdY1SdKPdzU5beShKbTQ3SOsGVDmEb6vXUK2jfvZA/U
	Y2L5sx9SQ35bH+5eggeutUKOnmbr/KHL5ml3UdTfpZ//K3cxViA89IBH1KU5HYrb
	M5Mwh1/rmIg40ni95Z+Oug==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqrewn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFfkSssGy3iXdIkVJoHeXJvw3GT5D0to3FFXkHoCVnkStndG7mtNKcyHOy2T+zsY7M7EpEV0z5ueO+mag36wAQ8QQnX0BhNuIeq+a3+Rd0nQohjTfH8reFVTRH4djHTKwnpuKMRT4D4dVZsfKlMYibrGjvnW6zjF7WBqp+mu55ZVygPT8mefE8RItHGS7w2LKWXKcYwDN76yp62fjLqiDLWCxE2E19Kn4+Tul7bNX31FafgOOY/t3SGYADFFVY3QDYRdQIRz82mOJ3o82P4LMGRq0F879czeylTfl846GlRFI23CgizkfPWOjVQFjPwx/SKKAt6tWZ6P/bHb0oJ35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjgn2YCk5jLzsfQ6fgjIT5W1Z6GownvfdJCs1EcWpDM=;
 b=SQC+fL9dJ9xjJ8B677Uw45HbLwA4mHk+cM0rswkhOMChEThQQzao1UOjKTFCTb15IUmmSSX4RcY2lIFUCt1uG+yfdH73xH4k0MiTfBBL5k26Q1D0iy2UOuGr1805MN4D9sneNxHVEA3ypxpzScvdC6LupalEeCz9L6q6fILIGs+Z+HUrcitchsU1mftXBTduV10/7T48V1JmI2J6jMaws44WOzUwNlhFicoAvlXCggyZxU0ECefHtLs9dEYPNvFJtpuR2JGSl43ElQaKhoELnRUxL4aAs/lPzxyiycXFYF6UL641jfHVfYCip6KEbo7FsQCC38eOC+ctTgMqX1Jc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:32 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:31 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 6/8] ltp: workaround openat2 build failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:21 -0700
Message-ID: <20260312161038.2578649-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 809318ae-7c69-4afb-445b-08de805202c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lkLm5TGtJq695xnN4RyHaXrKeuQWAKnEA2hGgOBsNWfBjgwqf2YX6XSoa8+X8oJVQ3K1Kxul6cApP7Zx5rgm4jt0nN6p5WeBK+4xnpgFfnLvzotcTusVzqLfT96QksHrw4+F4Bl2LMMgHD5KP63AAmwR6SVV3CmpoBnyGoiMqwrRTGu+ulLGfkHRjHImw3ewLoP3ZNU6EotHmSNdh95ItVHTf25UdxPt6Fc9Y+EF3tr6HTIxdojM0uDDfPNMx7Jeo5XDh2I+oxG9wJGgp2GczGw0VPwesHwpnZBU9SJfGNXmUb7A+vghlC0YAyj1G8mLiX0pfujB9hYC6CEdQRtj8z/YdP2IiiAz90x2aeXkcva9KBemBdu0bHYHkcx4CaHhD1sWlnPds34zn/Gvm8Ivjktauud703yvmkOr9p/AimS0ch9XK96fV8+RxKN/ztaOY/tQZXFjloMU5lZeQKQ0MPOtzIifbm2In5E6nDsQ10FH7dt3H+vjBFPhixuf95JpKddkuOnIGxSEAXbGUOhEI5OANEoot3+tPWXMDV9qg/PBd17QUdQZSZ8TS8kTk0YIK20oRuXnrmmYjrWk2CxRvXtTU+bc7NywXN33/OMTQ2IFfuhwh3KDUnr9tFHFHvrtxTlnIGyOYO3ghuUfKBX6Nmi+GrZaDCpW8K2bvWarzHzr9G3jDU4A8urzPEitLvepefSxzrWIfHlxNyYf53fJNivbm5IbMfPyNNCkxEQBorSofo2hKkSrFES+SUODaW5BEwVFaFgxhwoml07ahrOsg5VeDYeZkbnUIdU+RaR0OLw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dx7BcCPLsB4R3vlJnnm7Bi3r35ah5OMPk2W/VYoESSZ07CwoV6MX2pqV0AmF?=
 =?us-ascii?Q?T+v9+Fxa9p3PrwTyJjlsRwX5XzGw/yBGfcP3bvm+GJ9bWBjUQZFEWESUvQty?=
 =?us-ascii?Q?IjOUyPzn22a3xUvH7Lzo5wYsGgjyyJhCHb9QY56lr3gaBWtSo5A0BdMKA0G8?=
 =?us-ascii?Q?zAX36YQ3wqnnVc1PiZl/P1vRh9rb4fZCDa7uaMWo5YIP4y7rue6hUrKg2iqp?=
 =?us-ascii?Q?pnrrHtmXIaXSxFlMv4u0576R8wkKj7vnOJGMRLRI49baNPAok78ui5lBhZlu?=
 =?us-ascii?Q?I5HATmQ/zMIOt2YjtPCfUk7qK9U+2zqs2NDJZmtTZ8yhMfAkx0vJs+DCN7Y6?=
 =?us-ascii?Q?/ta6QR8G5pC/r48YiJ+f2SErqzmrspjuzTlQVv/hVfqQ4l10c6hkqI9cxdwR?=
 =?us-ascii?Q?0tSOOhSb5Gi6UtRd6VYi8irqJL7JivYQxElHxuyT9N+IrCq3xZSLKhlZHEif?=
 =?us-ascii?Q?Dapf+m2o6yNNzVCc0MDpl6S4v7YmaqL8qsyE8nQk2YoL7NTzS1l7Jad9gC9p?=
 =?us-ascii?Q?VeUhvgsQQ+7dGhYkVRQbFSmkPh2hnSAuE2QZGegGuGk556m0ixAgT8ktX+7A?=
 =?us-ascii?Q?53HA+bOKjPfaN1s/gXv6jqRgNlqC7w6bz+GwgKiDf7qOtZTPzS8AxE+O9Blc?=
 =?us-ascii?Q?sJpjjN/0xAiak7nnuaNZ35vxerr4I7AAbep9fMg0SSHivzreqEXUOvD84wTt?=
 =?us-ascii?Q?+y20vmmZErbBlzG5fSkZ1YBTKIdqRgOHtmwoant90POQGEbjP2MjOs2XdhG5?=
 =?us-ascii?Q?x2GD1jSPF1vfJmJsAXoPcWWHl+UlYVj1+UYPlhoV64BMhV22RptIac1o+7Cy?=
 =?us-ascii?Q?593trMMG66yz1Kx+s4m4qmpBszhOhaybgX/edB7JRgPbfFcRFl4t+cvaRkUK?=
 =?us-ascii?Q?HE2IVZjcM3y6MIAJQWkZ82alyvVB8S0dKLu6Vo7QkbUICRpd0+yJOqNIbzgD?=
 =?us-ascii?Q?JFi5O9+U97Jk/SEq74RVb/gotylajuKSJG6eUAdkbeAgYw9xG01I4h2AYD3R?=
 =?us-ascii?Q?bVymhfnq/Wp+mYoNuEZaC+cc72rZn5kQrvkdAM9Y5ExYVoOSQDsi4YJdvHHY?=
 =?us-ascii?Q?blnOBMdzXTgPQvWDHV14mp4kDtxF8X2m30fOKxjEdjThTHduCnJGTNG6FD9U?=
 =?us-ascii?Q?f9SDyo38cOEtwphFSZQkCg1/1VAoREry/RgkyDF3uacrgA79xOVYLSB2ZHHD?=
 =?us-ascii?Q?vh/IJTUQ+1xglhh9oFWVTLhzAS8lNegnRaKSVV4gM9J+394haQioazQKTNq5?=
 =?us-ascii?Q?uqF0D2hzO+k8akfZiikT7zBKg8m76+PPgS8upa9qoKaLgw46grBxVDjvyMK8?=
 =?us-ascii?Q?aicas19AADRmp2PXEUjUF+IqhIuDzjG9hW6swv3aI4W9tnY7CF/E0vW9r2A8?=
 =?us-ascii?Q?y3gnjyg51ClolCSvffpoKsOISisjnap5oEbiFAdRgWe93fqXiu9PbPw49CyR?=
 =?us-ascii?Q?HjCGNIIhuwCCtn6Z+Nw2a+xgJcEa/rg/TeMxVWdPAx2sO914jnHnRg1cUlu1?=
 =?us-ascii?Q?l9zzLakCOqIZVFCET38Wqutat8PupP9ur0qAIYaUuydf/Pzf9yrFaQbzqFqi?=
 =?us-ascii?Q?q5WkgNxM0zeaOt2PPC0u2RWaPkxGJ9GQvzUSvPLvEFab/ZZMMDDqr0/pUrXN?=
 =?us-ascii?Q?jJEp2lNVrf05mczcl5qMib75YurgvbA8CsDQCou9qXaPnX9RILWcxP1GfDQZ?=
 =?us-ascii?Q?D2erNPZNqYpew4RQomEhjVg2tHTkWAYZSeDPaxgSxf/ex4FwTicUpoVURHRr?=
 =?us-ascii?Q?NVe47oqaqrL50GbkHMaAEsA+X0UUivE=3D?=
X-Exchange-RoutingPolicyChecked: 
	pkb6CCjQD1UU5vUg+y3Q6uwR8LH7fXf32x3YH+H/FjP5otbOzqjlQ+OFc19z9zQ9UHSwsOjoKyHa9z1sZn0uUkxFQtJN00Sn8AStl0pYG+QmAq38M2Xzul1Ed+pvUigkOmfmXg/6VpbQ6W9gGNg0swPI2TAR6INS1DkONoG/LA0kBgqOoaTAMdOATnVe1doi0ZvVKHbaKrFXwLnS1/X0oSn3C0vd5avJKGC8GZoUz6VDx6bGdJ1/xqR0yx5IWbkMq7hnshMlrTMT9M3mEOj/G8qfKQgx4PlxvzG41bTeeGOohcuKypzhgf9W0XQUlOREliJjl2l3S0v+qIBY9XnbxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809318ae-7c69-4afb-445b-08de805202c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:25.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNyvcaj09lsyK9CahZEk87z8DwFZDCwqPiemlZJ2X2n2RU3t/7rVa3eOFWfiE8ThLE5sE64bXUKd9miFijLtg5ZdIK1CcYzKo8aHtPLaeiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-ORIG-GUID: 4P4RFxTmSOl-X08FYQPLhFHsPXtxpG78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfXxediO3lroTB0
 fR9N49T/fGXyNZ6dQbfi9SWt4e+PWBuR/Eu8zE4BMVv+lF2lipzw8iHbosymtV0Arym0tH2oiYd
 Wimli5OX5Fz78sGwcri3SAqn4eHDN0hf7SGM6BpK0I1nZh3ZNxCYh9x0sVpkv7kzjyS8PXVqXMG
 ZjaiksDcYjjQOoZcZgBd4wkzNLxnieo8yqZSVaHNoNsD9ofYOocNVq2Q8na03YNyFRLXXoKFww4
 3W0XNT9HF3imI+XrkE/MqbFymr9Mt2wF5ulnOjQ5qcH+vpYrAuep9FWm22NFeR8XU4KDLe+iubX
 KWLcmdccCEDkC5ffI3KW7lw6r3iSbtjUCbZ0prAiuvugZF7bolS2KVYknIuwSDs4xybxxuK63Gp
 kP8WsXzSCj48U9hpArspcZxDnMhTuP8UX5kQ9dXOdmoLcr1JhoylSLoukAjsGucHmJ8DmBf31Zt
 +KZB1GXN2qzD0NiKQaA==
X-Proofpoint-GUID: 4P4RFxTmSOl-X08FYQPLhFHsPXtxpG78
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2e5b6 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=owd1M3BGKQoo4v_bdmgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232992

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

glibc 2.43 added native openat2() support, causing LTP's configure to
set HAVE_OPENAT2=1 and skip its own internal definitions, resulting in
a build failure. Add a patch to undef HAVE_OPENAT2 in lapi/openat2.h
as a workaround until a proper fix is found.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...tp-fix-build-failure-with-glibc-2.43.patch | 33 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20260130.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..7c78660e3e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
@@ -0,0 +1,33 @@
+ltp: fix build failure with glibc 2.43
+
+glibc 2.43 added native openat2() support for the first time. This
+caused compatibility issues with LTP's internal openat2 definitions
+in lapi/openat2.h. LTP's configure detects glibc's openat2() and
+sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
+definitions of struct open_how, RESOLVE_* constants and the openat2()
+wrapper, resulting in a build failure.
+
+Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
+own internal definitions.this is a workaround until the fix is found.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
+index 03327bdb7..bd44573c9 100644
+--- a/include/lapi/openat2.h
++++ b/include/lapi/openat2.h
+@@ -14,6 +14,11 @@
+
+ #include "config.h"
+
++/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
++#ifdef HAVE_OPENAT2
++#undef HAVE_OPENAT2
++#endif
++
+ #ifndef HAVE_OPENAT2
+ /*
+  * Arguments for how openat2(2) should open the target path. If only @flags and
+
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260130.bb
index bb3b7e9ca3..75c5b8b7bd 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
+           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.49.0


