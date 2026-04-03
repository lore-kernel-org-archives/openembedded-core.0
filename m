Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADB1D730A8
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 06:21:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5993.1775197277199368564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 23:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qyo/J0On;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855370a557=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6334Oner2215822
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 23:21:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WyRo7zES8
	76VzH1QRJuZs+xz4J5fdaxZve6GnTEbPlc=; b=qyo/J0OnBvdOwoUlBHdwJKx1O
	3pEImPWMQrU1kmoExyDWZQsPBhLZixhRI/pscFIuNNdvRVKGlLsXc7z1MfYj2TWz
	OLMStjZDBRittl4jiFWeH/hGaOT09YBIr6/l4FO6moXl0z+FXOLY28VSkCBIhjXo
	XfE0I0JHHC1JrjeJ1WuHwpxcZb5sxrF0tIpFuQYMVSUCjE/GcXzztyY3el1hjLY+
	XMceNL9vMJYg/BYYLBA+g1TgUFy6TjWJ8/yzf6zqq9mwN+6DGbBpuyUuwWWjVyyO
	Se3ej41n98Dgp6K6aj/S0vXTXxKPFEV3BsvZHPGDODbf5zlO9VvNQA5IenknQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egc0p68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 23:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls0qbrgF1VyP02jlNJWxw7jMhOOFxY/ZzLP2h38dAjK4OUkAD0wm33Rx+KtKXIWjjRNnonswMTJofo68YzB/DLdE+FxjXZfm8d0phwvsY92reMV6GRLsiO9HcuiU18Dl4e9yAIIubdvKyN5pkhocKh9L6XkpmnCwWeBMiQjuZmSWfN630Y5RDOLORNGOPA/y2nA+2MB4cau4RrxsjregtmHV4gLdSrD58n8JblHVblnECLTBBY0HvQTK+m+rw9qVwYjhE2O6+605lqODL7lb/LdvAQUB78T5lGFBKRnFrpxhDU2y2QkW97aeS+3qQTgxoWxu2PfqCWh8EMp1TThWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyRo7zES876VzH1QRJuZs+xz4J5fdaxZve6GnTEbPlc=;
 b=ceUh3YFOSKZEYgft25BPEpzJ136x9NMm7I4/d5IsIulUyX2axRomXh00rlGAsnzePO+72tUqaJpkubaLv/6aEuHW4hkmp+ogcxR6glcPuFE/3EwawjEngxTBgPFbMrbH7hISUG6UF/8eIV8Ado2QhDt8RJp8idUMhwu8PehD36nUVBgtXh3I/vxc0e9cFGyWLyOtvl7D/POizoRIY0vK74qxKqhrI0C0o9gk+IIMJ0wncF7v0sBy8NwKFqP+wq8IbI2YV2QGjZ1OhXMYG8xx26p47iFi6G/Lt7T3kV743krGFbxr7nABUJnyIV64s9WlTXfTybrekjpK/QavJ9gPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Fri, 3 Apr 2026 06:21:14 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 06:21:14 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiao.zhang@windriver.com
Subject: [oe-core][PATCH v2] iptables: Use update alternatives for "ebtables"
Date: Fri,  3 Apr 2026 06:21:07 +0000
Message-ID: <20260403062107.2913612-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abd144c-3cac-46f7-e0e7-08de9149350c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2QkRkbjyeXAog/P8SRxY3H7fMKLpfhWoCZBNSuU8dejIsDJJGwRuwuKn4mju9t3UtOgWwO/3zyKdXan4l/NtJiqynK97mlLpmeSHNivoMfyE59gKLwu6014+94BzzL8iwa5l0rkF6VlYT5emGvs3nyy3Kvq9udsXgcW6VjVVYeN5tudFnMDc8EsmMIHjP19s2rgFCxni0WfRpMFBsqjEH1+mHtzfRN1Flsx8vscEElQjqL0nC0GWq+7Ln/JH93+Bb4TbkD9s1Bc6rFlfJHkLNJi0KwdSE1nvFSR+B/bAt9RvDJT0K7v+RoFmC9jfrPmTZ+GTpBchKwSs1fC7fehqh2TspInlRLMgWb5SP0f4rsr/qmuV8Dy7GlSAlin8WhhIHJxWcDrvyWdlZDT7PbznY6xHCJHZt0mWpYgXk0GiGNIZzeU9nq/9iRfuomEeY+aN4VZEg334DsZEBFsA1ipJ56cf87CoupGCLtqfIpisqwXVmF8XSxgbFbNheT+uEUXvrPMszK8TcFb4n6LQQAwKjho/nE+OBDJP9tXxH6pq7SxyjxQuWPk/DEvCWZbDJHM3me6LbnClVYAFh5D9xxKnBPUyR2JEd0tMkzbBPO5epf7ShxTPhiPv9ZGTfdiZVO2MLqapBoYSHDTnAZZ3Sqa1QmGOMt4ajZffDKEayn/IT4nSHKzPpdN/RChNhmUJbV2ClBW7oDhOkwB2lcQVkgW9P+nkL/0ghTFeaIkXreCQpFBuF8cydkUKC6t6BMqUafWzuKE/kDJcYcCfpCBlfVRtHC+pW0KN8r7IrhxVNHz7MGI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?htU3T91wESqq2MqpDp8yueH3d4WLjIev5TZSavUWiRFrzTBM3D0Y7TkRR5Vi?=
 =?us-ascii?Q?kKjCWdTjnUiUA5tnUQ7cXDbxbOipeAoxbYCNgP8YSfAWlRDWmxSd8ap+KNQF?=
 =?us-ascii?Q?njw8tEywoFGPSyoc6wxlZGUZ7FXbhmvKcyyYajU9cqQs5QvtG1Cx9aQj5n89?=
 =?us-ascii?Q?PoFafvPp39fyAipaDoqDV4l7epYKY25RIaIl0qzINHCDzyUjpPUj7MFiH/ae?=
 =?us-ascii?Q?lMcUiozC9OeqXzG3G456Slm4ipHCN6l1aGTrid5MK9CKPl3pOofo2xN97S/K?=
 =?us-ascii?Q?N3s4dNQlYO5dvytm9ca5EO4/6JJHHIRCQGU7cuiECf3aWmIlalaabt6QD8r6?=
 =?us-ascii?Q?2NNqExQL7/5KxxU/hWcGAahMPBi9TVbQzJHJoPpcrFhnQNQcCF4KJsxgBOs+?=
 =?us-ascii?Q?EBFLB7CScD/wMLh7DAwkknpv3DkTN8Gfv35k/P82eFPluOJdhoDO8WOsfI2e?=
 =?us-ascii?Q?c+4SRThLT01pygDtItOT4fVn39k9sYbuOgG320zMOxCiXlk15zz0ajXBMFpO?=
 =?us-ascii?Q?ygv8nzNpQWZ7n59pJwBVvR/OluEWCw/vcNv+EKMrf7dK4JCILvYHqLHsrZEJ?=
 =?us-ascii?Q?bwzX8gYuCcqbt4cdOg8TNEDJlv/RV+hOAMT2l5qGpxaDQmItccXTDl0rFHyu?=
 =?us-ascii?Q?BtrjW+KMHAaXmywgg+vAtATRXTUcfy8ECQXL57c9uHrZbshRjDoK2zh3APcx?=
 =?us-ascii?Q?jFqnhqxJSBl4qwcOF9JR2bsi246N8Zx93tqSM4zpoLSyFowqUFVb7CWPj6LA?=
 =?us-ascii?Q?eeOh6llPUzC0PsB783SJaiffU8qq3al1BuUzgZ17QX9bqb385toC+ka15DhK?=
 =?us-ascii?Q?7qeH6WTxObqcaYuRyM6PZA40AvEXEkKJQTpglYT4T5BZJfIWwPCsw1tP7XxL?=
 =?us-ascii?Q?KH23Kf0JVqYHtM23Ow6+3E6/AhvtGpuTJirrUdic/xAkristH4YUjY1U7qgJ?=
 =?us-ascii?Q?3qtzTgG9U7bptH+3ecuDesECEE4a63fA6O2cDWUwINT4feJyyeSu0OVjY+Vl?=
 =?us-ascii?Q?RHrmJE8pwL6Pfawnddiizxc2bwq9Yt1tPpD58ddeEKAdXWDjJ4Vz9ooDYkvO?=
 =?us-ascii?Q?HKNJHhkYHoJnVyjENVUgAoujK0mHjekiKEAIFyXFL53Oa2Q+0twWOaCUHDSu?=
 =?us-ascii?Q?gYAg8xYmlwKxeMPL49S2cxsyLjoZy3JSVKPD6dfH3WqfNecUk4eOpiLM+QHh?=
 =?us-ascii?Q?bq3Tsydu2DaZdg5sJ3qUONBZ+Tj+gjnbWEE1pkB11E0ev2V9NxupvrbxwSIc?=
 =?us-ascii?Q?HkOnn5X9GsyewWLR+OnHow/dpWYRKLmoTx3mkD81BN1juoulj1bEUmBh49ZP?=
 =?us-ascii?Q?ggHj4TCeT6ofn+ueQ4dAfJDwqiYq/g1wpgsuCMbIgxNDW5/SzeXPDiIiTOvA?=
 =?us-ascii?Q?a24kFjFMt151MNxZpYC4TDWsilv2O7UZzfTqMIHsvEWcl0MiQbWmNgE2as3z?=
 =?us-ascii?Q?HMZRqirbg62Uq8uOH0FQCpDC4S1CnDYyyHzFy0orUtbrFoYt9+XP9j0CNVaY?=
 =?us-ascii?Q?R17pcn8AlHt7AG3ekb4itppqLB4YOkFL4txD4hZ2IeyedPcTMS4bC3IMTsfz?=
 =?us-ascii?Q?+Us5+apxernDIIoIfb1YU6A+4u0OXz1xzTqlnLp1W+O448w5SZuOg9wsCwsY?=
 =?us-ascii?Q?44CIXx3nzd9k9e8oBOiOSoCMzgnIn5ftUMXcqZrjS7TAcYep4xgoRAc6i5+f?=
 =?us-ascii?Q?kTfH9bau5vhIHTh6t4GHDox6UThb+yeMVKZwtmfETKV0CYGGvVeq38XPQDQ+?=
 =?us-ascii?Q?F4EsIdw3854fs2RkoObZD+enLVk/Tas=3D?=
X-Exchange-RoutingPolicyChecked: 
	LSlUp4LxOWHsrn1U7YTjC9minEFKUITu/DFN0x26idNFgZN5Nc6AeKCAAb0qQ1rb+b7nwvhEfOMsraTfcwHoX8XFcDtYkjLi8UfYSzyOByO5vTj6fJhWrvkSV+uOT+L1F7MJpBoZ8WpYYCw30vb5/ClLLjiNl5FY/XSO9V2Dqc2nzHv03zxYMBrUZmqEZXqLP56WkfIRPKhQTfnHIZbwR0iHbVGnco/q/B1r5FM4TptX22h6bQJ6JGTMTpk5grhoTs5pbTP16gD6tkMzVLnYlNCG51ukENs1ZzqmSTXWkqSqo+2IcinYcjStYEZTI8aSvBf7Bhp8mR4bRy28N2yCdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abd144c-3cac-46f7-e0e7-08de9149350c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 06:21:14.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eP2ndFTU77hqyygw0WvRD7TtsmvO+rHA94Vb2O0V3e3/8RWOQRmvOdJ4jMJ32uXYTQoUl9hkSWbeernDt4F85qGvuYLlf4KKijalTGmcYEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1NSBTYWx0ZWRfXwWfcbmADgR6F
 DZaWMLueBzkMF4xWjq4Iq1XN5vy2GzURCWd6BDy/HFTloRAYDt5IzNnU74HJe4fgqdyC7Qc7Znu
 qB0cM4OdaSpFjYID+dNb0qY0lsofFGYaWKqOHhqBEkq5i3zywgqN3pM3sm0EAn0hBr+75mzE2GY
 SoJJvzHmm6yUPCOtovKTSCN7HC2hpX+/HQxbqkVHkAR+YzrFzZDaf/hIiMlpuCO4s3PrirfEBiX
 +trxyqYCFP3w1CONgUliLCXlgUyvbZxM9RI+v3SZrjm4yeFBT/OaZ1wCKxhw6v5nbOymC4BAj2M
 sLx8wCVOTYb8+0LziaTjvx6P8OvK1ZEQVycteS+MM0hdq1XDPRNcTHaruZjBioEU+0agkZOHTnG
 Km7VQshrTL/6SAqQImskY2joCcX6xDx8XHqn5bvfP+0zHPrsJUMnTrFBaBzfSuR8TxBOuTnCOdS
 HJMz1CAw0PlL7/F6tyw==
X-Proofpoint-ORIG-GUID: VHa5wW_jqy3ttbRMg1W1Bf9XFy6Fw_qo
X-Proofpoint-GUID: VHa5wW_jqy3ttbRMg1W1Bf9XFy6Fw_qo
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69cf5c5c cx=c_pps
 a=Sj0aQRr/q75bZ+qk1Z6sNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NbQ8Lc32ByzW4zsrGy8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 06:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234556

The ebtables utility can be provided by both ebtables and iptables
packages. Set higher priority for the version provided by iptables
to prefer it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/iptables/iptables_1.8.13.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..52173b338e 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -21,7 +21,7 @@ SYSTEMD_SERVICE:${PN} = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'ip6tables.service', '', d)} \
 "
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd update-alternatives
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
@@ -122,3 +122,8 @@ ALLOW_EMPTY:${PN}-modules = "1"
 INSANE_SKIP:${PN}-module-xt-conntrack = "dev-so"
 INSANE_SKIP:${PN}-module-xt-ct = "dev-so"
 INSANE_SKIP:${PN}-module-xt-nat = "dev-so"
+
+ALTERNATIVE:${PN} = ""
+ALTERNATIVE:${PN}:append = "${@bb.utils.contains('PACKAGECONFIG', 'libnftnl', ' ebtables', '', d)}"
+ALTERNATIVE_LINK_NAME[ebtables] = "${sbindir}/ebtables"
+ALTERNATIVE_PRIORITY[ebtables] = "100"
-- 
2.53.0


