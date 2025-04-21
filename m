Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D590C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:06:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11558.1745226392967192877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620622d584=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8krtT016382
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8smda-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y33vRWRVC6jm11Ds97PFc/ONCyURrjtnJmwwwFbvmzwesvaEkHDbCSk0KgoFFdgLp772h7dfZ+auAoRtnTJ9iSN7Qum4J03ie35AYvIr4hcp5+gg07ecHP9ahPl/VQDG5HgcB26NQC9EsiosefSDo8kYzdRtJm/Jb9TA84/6HFASdNODHIoHIRqQtxZfIas7NAyJm6O9R5q+J5ANDlwphCcZS8Poadf52BGHo6ZlinG69i2DOBh215jkycK4rpzGkgJg/o8/2ErxyCNhDRdDtMHU1BB2JVsxkth+Cn2edQaYWXJ9Ejl+ib9M9q37pQNwX8sZ/9QqU4th/hQNqelnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLCz+T4+Cwx17RCGbkY9ULR1BssEew4j2btR/QSByo0=;
 b=tLeqyAg3j5a0/jU6WkQFiy3ZkxOS9G0Ylz2J9oM8o3XWMk8GMKig5W/6TeQblgBRS86csFfS5A9IiAyoeCOyq0no/lJzbc+7Bxbm9DyeSUfJBcNQXwMs5Qt041ofjc89/dcFkxAn/P/snNtmbY7GKyOhgcFpj428zcRdxnMYf8TG8VCJlpb8PJuxuJtWQaQVScOe/EHdsZ/XVngzBa6pwMtPzbcB2qUiYpPSAVzj0AIClsQTYPVA5fOVTc6irRNZ9rek6AARvTcYYRsNXsgwo3UBQH3h8kEzuRmpnHPYFHriM8yfiexn7nC4jbOsR994eUWyoOYo+NtVQcg20bIVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7881.namprd11.prod.outlook.com (2603:10b6:208:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:06:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:06:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libsass: fix runtime version
Date: Mon, 21 Apr 2025 17:06:10 +0800
Message-Id: <20250421090611.3862686-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 61985715-8bf1-415f-0820-08dd80b3cb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J/P/jrxl3F55iKqwsw/n9w8J+JGRQP9ZLkEQoGu36RMD0lvlwqvRyc2ff3S2?=
 =?us-ascii?Q?Xt4jSJ4BBVUsbI154ZKJhA4LbEuqTkTacckOfpSwJTJ1J6BV2ILhMdxLKlvQ?=
 =?us-ascii?Q?f9E7fjh8ijPr3APEF3t1aH8bQJQ7MV0ytgTPdDGhs8FR67XCSQBcNZqBOIhz?=
 =?us-ascii?Q?Rv2sLkxlC1XXBSkbz6icI8sW7DF3y05sbQ9pSwtX88a5KX0jMGVnVG3SDoWY?=
 =?us-ascii?Q?SdXKa/OrVqhvOawv8VY1Hu4fkYxd5PFLvGgbqZQR9YvU67CU0uhNkmISLUO1?=
 =?us-ascii?Q?1mHIgu2Wj3PRYE31kEPImPd2lpyUlQwTXviicA+1opK35GqQpuWUNhzk2MQN?=
 =?us-ascii?Q?EZWPlXBV9jA34UR1DDFsPfPr/BsWbzppGPDOmVcsLTCpA6sfCmDTwvoHqmSf?=
 =?us-ascii?Q?VHM3exT+O94sF9zIcze4BnzP3Rtl36oLJvQm/wl9Y1i+7GMQMTxUfmr6p+go?=
 =?us-ascii?Q?gGdjbP23b49f5QaVkwpxmhWD74HJyfFVVY9gHCuyL7Ab1EM3uoK0MWKcI3Qa?=
 =?us-ascii?Q?pTOYX4r4QBB0hXbzjOjE5VkfVGBFVcpyIG+rZEDl4HL0ljfdCgutZuKXdTrY?=
 =?us-ascii?Q?hXQUE/9fGYl27oh4bz4ZICibzNiTGek9pDPKj+oyXDBo42aRhwQnJhQds9BJ?=
 =?us-ascii?Q?q/r9PSLTkMXdnleLvbFkhJ/DcwG/xpVj0znGndUKWlbjP8SSHgOzBEzdLGzN?=
 =?us-ascii?Q?90oZQypxUlaGff97q6lw5z1gLUiEBokb0cNlJz+uh7m22ff3dwz+HWPoUgby?=
 =?us-ascii?Q?GLuGFM5Iy226fkalBmCG4NkJmKhe52YK5BuG4fuf0Qfo1rOQ2dq+orm0T8tU?=
 =?us-ascii?Q?oou/ECadid6q0be3j+jFmwkuKxzwB5uDGfXLbZtZ2wgdmgt3Q61yOM3eMxDM?=
 =?us-ascii?Q?OGRH9J+3cSsBY8k2QPWT8lJRYzLwkI+G0xt7Nzt6kKE6uHVZPmKsXTpqWMT9?=
 =?us-ascii?Q?t07VLiK5LvpIaqcBjd4M1tp/OPXAjTTKorYi6XYwWyYxmIcSeTrb1q4a8/uH?=
 =?us-ascii?Q?zzL2+h2lEZwQX+1kGg3PlvsycAbsLLfupZ2gqhzzTd/zjbihOCTsmezz6J8L?=
 =?us-ascii?Q?ajerx4Yc5Z4FWvV0z91YXwJEkVnrYmxXDkZ3obe75FSNTDT1BeGnPV0Prt+F?=
 =?us-ascii?Q?2JRRADNShdjd3/I1xrYGTbmXsS2V8t8xJZIEoefvwRAhSDPJPjivq2jdamCs?=
 =?us-ascii?Q?ERTiRhUgK/qh6tcNYj3lU2JW48HhHloezv/2qUoNdUx+Mu97IWY4dt+jrZGk?=
 =?us-ascii?Q?K8ZL8Z+uiuLaIaFkSXDC8LXu9GwyAScu1EM84WWDH2SMiPaMTrd6fgbDUj2V?=
 =?us-ascii?Q?lXMC3py7hzoJzZ6FI0wq9a9CZBYiGin3S8RHbPJV5Ej4sJw5fZ0L+yn87s2O?=
 =?us-ascii?Q?AHL+5bIMmL4UIpAQNhFkdZlAEsqppQw5j2wWpG7dudh4+rGDnvmFIOrRnRPP?=
 =?us-ascii?Q?b0o4CNgax6vFglvEno4jU1kJn2jtE6ysc/oV5ldkIdCAXtdlQHsWqw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nlU44gHR24TpvcbTKHEZq3wD04fOLXwKYovRydjIRl4haDIsx8CYGp2Sdrda?=
 =?us-ascii?Q?tW2IzlNKwTX/72CGCA6zZUf8DtTzWUm0BH+wf+kCko7MKmc/FrtOXxHMIdSH?=
 =?us-ascii?Q?qMM5Cl1sZ34aB6xFAs0aAMZwNN04eVTTKylKoT8edbQlyG+vuqdTBtxCDZxd?=
 =?us-ascii?Q?CLIjd3lLHAYvBHaXxYCeZyrYzKl1mcsq9Kic0NVSm4FWTJ+OTY8kmP9R8pcu?=
 =?us-ascii?Q?+CTPv85Oax73ZHtCFwHZ55lWZgaQ0k6SK70ybhoyWplQSe7EUojNZYnIf6rd?=
 =?us-ascii?Q?9QDFQbNOCY2JYODeFtv+TioIR9W7aR+u8tIRfIjcatgN4SxRZ3YTU8/thKK+?=
 =?us-ascii?Q?EVBPZ3K4SYtIEGpID2nozMKRGZBh3aLpypW0zzjFAaAa2XLwW6Unse21b+sa?=
 =?us-ascii?Q?qFpeoNZOZC+ZSgt9NdgOFFwcLRIem2NQ+zt+zHEjdBJlXZ60nVTGFBTaq/8i?=
 =?us-ascii?Q?R66UjZR2s91mqzC2wP0l1bCiZ9e3GwiCAKvwydDTbkSZNZbsYcnqPeaHbzkx?=
 =?us-ascii?Q?NqnKBUnge6CfabNR6/VmcgZlPa+EGL/W4k8v6bc1JCvmewKsYbSb1oBwAtFf?=
 =?us-ascii?Q?b9fbgcvCb6WHRyGlGyjlS7fADAeu0lDHrFZIuOLz+If3Y9wKqKxBApqSlYV2?=
 =?us-ascii?Q?uod3kaCRCFTHDgJ5YLVTDCg3fTqNocAiyKEnH1UjxnlLwqRt+lGI0h4OwMnc?=
 =?us-ascii?Q?lUO/wloqF1B+0HbC9Es7vs0j5tK5GZE03lyiWt+GVFpyQZaDh/l7dfS4qfNc?=
 =?us-ascii?Q?m4FLowgMjj69Exb9Kt99TW7P5WK4Gd0du8Br3jcUc1sYFhX3CuzrxzByd+Bg?=
 =?us-ascii?Q?xvSpHwSaeFqZ3fCsLwQpifTOjSNmgCZC6FPVryd+ZwRFJfefu65lqC5rA6T6?=
 =?us-ascii?Q?XmlcadNyVVaNaq2Ejbu2Eypj2yfsJgnEvn3fwA5smhGG+i6iHlEzytfz8E1x?=
 =?us-ascii?Q?SkYSENX5LMhEtgCOouYVDmOLPXZreyPOXFEsOSiT7tnSnehKUG1y3NuXoV5D?=
 =?us-ascii?Q?Ipqj5hcMIkZ0KwL2Uc0lbVDJKJG42+c1U80Lyq3RfC8pcyBnpMUjxcd+2xzp?=
 =?us-ascii?Q?Zse2TWxvUiR/JYOg2Oed23/2PYU/ttTW5Vdl+E62q8N4ubHhjQwDhBkPCuDE?=
 =?us-ascii?Q?TgRDWp2d/0D8FxXLjsTgqTNS3HpdiJ6d3g/6IEMnOFui0wz8guGQXMc+/HLB?=
 =?us-ascii?Q?IJL7dR/ouCv5wUj0J6xJt3w9Mj7K9taTfMe/z7pgKLdDRvgx9wvvE7R6hrxy?=
 =?us-ascii?Q?qXInmRpIE0Ywo8JO+eEMjDmpCh3epMqEFtMi/Suc21t1jmf9zO9KixYgRlxw?=
 =?us-ascii?Q?35Ld8BQAqqJYiBHkD8JzK5SwvgfRYd9cjq55vJBtlVk7Bq7tDY+SeCppJqLK?=
 =?us-ascii?Q?ZeD4YpB4IKRLGFkfOsPLNfjDTkx1M2I2tL4xRMdsFgm3A+/qxfKeKFyBFWgP?=
 =?us-ascii?Q?zqcsAGEoZd+0yRojWXAmOF0DE8luGp3iSMwYIY18soVEN9MA0OIk/2aJDFgf?=
 =?us-ascii?Q?q4Lc2AHfTa2+IN370CqTIGuZHmF4FR51K3G8kcjroKssHOeXhYzv1kTST6uK?=
 =?us-ascii?Q?gazXo1EzzFSCs3Stlrq+1TyX7hAZxrnIIG5FrTog?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61985715-8bf1-415f-0820-08dd80b3cb1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:06:25.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEWds9q5aqySRwhQQQFmYI3SVTNEYtXYn3UKjRH+T5hVe80oKeqEY5B9oxWmhZZSxcB1WsBtminbfh6HftPKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7881
X-Proofpoint-ORIG-GUID: zzbjSXAh9KAYnX4XPVoa3gwHMfe0PTC3
X-Proofpoint-GUID: zzbjSXAh9KAYnX4XPVoa3gwHMfe0PTC3
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=68060a98 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=k2YzBYrwgnxFe701ErAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=798
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215172

Fix libsass runtime version shown in 'sassc --version'.

Before the fix:
$ sassc --version
sassc: [NA]
libsass: [NA]
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc  --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/sass/libsass_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-support/sass/libsass_git.bb
index f0824944b9..52ee5e47f9 100644
--- a/meta/recipes-support/sass/libsass_git.bb
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -11,4 +11,8 @@ PV = "3.6.6"
 
 S = "${WORKDIR}/git"
 
+do_configure:append() {
+    sed -i -e 's/\[NA\]/${PV}/g' ${S}/include/sass/version.h
+}
+
 BBCLASSEXTEND = "native"
-- 
2.34.1


