Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B248C3ABDD
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:31:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9360.1747387906455771282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723171ed67=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G2GZSQ014858
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:31:46 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46netchg16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8wMmQyFn1Fk3LzN3ARxI4iX98Tv5pdTcuSBNgk6ujRSqN47VknDh19G2613jx76Khfet7bjiTrSWtLbKWFxoZCEbJeq8k3CMxBwv3pxGefcVH04bTZYEkPlNEUnKsiiAQDrPhbSCURA2bOd/2ji2yMz3LO+4fwKHh9je43nbTSy0j3oEMEnlXSadBhqskdQUAe9dgyhOny1BGfqOiYPh3BgtX9El6YKhR2g191Oi5Fl4Y0TJwUVNR1Liu8cvrENOAMte4jG6EQZ7jDmNRmaTv63t/nVIZBJ5ly7FI3ds946vS0AVmMtQwIwOpopAvO/0o8xhKXHu08+ZxoDLApq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MLB6ZEI8mF96I7QCqR4Dwn+inEJEN6THQVMQGdZ1p8=;
 b=oKbFU8TIm8Pi/QORgyR6bDACwqYJ8kFRF0ZNsueEB6gJYpoEi0tu7WNTRmIw097OeD0taQ+kiuxS+lWbtVoRiSIv9SRJw9/1bGvMQYNxmeB1KwUW+NnGsTkQDZmVn1OSpsbhnb66737H0rzNteb3xqpCvuzJ0OSCDsvkRsCi/pMDcFN+2joUlHAI3L4yPGA9jdUuz8p6IuXXx4wueqFpRFx3QX0gZTolgvWX2dLESveHDiWY4B6LYqMNV48m57w/vsTGsGZcu019rVhB1onFgXgzHz4PbWcnZ9V+DGb/4JdSLmMEFUeHJe3XS8QowTpxhxChPLXLDBR6gGdo/MHX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 09:31:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 09:31:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] procps: fix runtime version when using git shallow tarball
Date: Fri, 16 May 2025 17:31:26 +0800
Message-Id: <20250516093127.506158-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: e27d0840-0afe-4a02-18a9-08dd945c784e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?axvRM8+KXTZ0xV4DFkKfW0ISUecfPRkLsZdW2Wm2Vbvai8776Y7g/2Nfv9UH?=
 =?us-ascii?Q?CdHxkcUIogPOVXkZ7cxqY7jNfSuWw/NlZv9t1NGV39UQLKOGotgqOczNfg6X?=
 =?us-ascii?Q?/RWnSKaNXP8NRJUAENhzjYeszYEVEZCzCa5zFrXBhNLxP/CNFCizJiZmr96N?=
 =?us-ascii?Q?lWOpyE+RMR5KHl2oxe2JVGel7QyX0l7zvpqf4JFa0CrmNQkGnGwwkHVGnbyS?=
 =?us-ascii?Q?opObS2JCh2xrHqg5Z2Y2p1NDFqHPYXjxCfBuT/+k0FB7zXArenUwFsGKGfpl?=
 =?us-ascii?Q?o3MG94UX46gpGj06bZZ1xtOZcRT6avMSWSwTBN4uQJDHj41s2mhvGR6SdI8r?=
 =?us-ascii?Q?f1km497r4BJj8vSy/fTkDsX2jo7LsV4ncbOIzSnONN6eGA+5pZxEN7oHckpp?=
 =?us-ascii?Q?Z3aXAEZQ1fshQIFLuRpU1G1lEVaj8pmzRKEBVbrcdcSIMW8Jk24+KG8YLWwX?=
 =?us-ascii?Q?UCN7N7TY0cjz68wn3aPx8mHShseR7LzsdWf2ahTzvhc3lQmSp3N81SvzXcMK?=
 =?us-ascii?Q?ffFDTh2uqE1NOm5oVnqIOjFSIyisYK7n/86lUMRWbQJf8IbM8NIKgdLPn6ZF?=
 =?us-ascii?Q?3qJs3SlhuUA6E0f7VPxMHii3oORua7RoswWPYUt4sXir+86yjJKf+sdDFe9P?=
 =?us-ascii?Q?JidY5E0LB/3i3xzS1FqZEQgXL/WLq3KBBWWLY9QSzwvQMzXZhIhgh4Qic5Om?=
 =?us-ascii?Q?hBoVW/zLjSulIB2yAH/DYOjehZiZkTMxIJV3KuzTFUv6iYOsitLtiWFNfiFZ?=
 =?us-ascii?Q?r6L24LrzGrQnPJFzQuSuxugU1fHkcGtZQSvNz2uzPCPFGTg/WtefqC8VXbJj?=
 =?us-ascii?Q?7GGfajYu5AxC70+x9gjhVw2VL0cCU3iBl830/oZNr6QL7qhy2dekqPPNougc?=
 =?us-ascii?Q?wWp/dWNGuz+waRTmK+qPIe4Dg7OzAL0bWUlGFClIuUNMBwo9r17X6q5nSj7S?=
 =?us-ascii?Q?sH2XczSiCswdtYOVys9YeXoMZwiDZwEpjMTOb7nwuaVGf3aQeZzOqnZsEzw2?=
 =?us-ascii?Q?g6I3U24+UNZRjNINLDiUpj8WdejWSI3ouXDfiPxlB9n+5nwM/AG36W7vz54w?=
 =?us-ascii?Q?65mcKDfkin6hYZtViwYrDtNoLb8PYogYru9kiZNRE+PturMGdCT4u+58d/Hs?=
 =?us-ascii?Q?gd2VaWhhI8Uce+5YFcM9ATTYtZK7P39dlr7HuOYULpXgR2REnUw8lwn/0iju?=
 =?us-ascii?Q?RzLcpWH0no1RqlSKDLz3gUj7iTlQZ1+N3PwwMYEM8X9dKEz1RbCHyeNjsric?=
 =?us-ascii?Q?2HegDtnZzA394k28v5vI5wJYTcXnCeWY/iQ9h+F4PfPOYTsQEJTjUpqqMgUW?=
 =?us-ascii?Q?uWBdatpQVyKgiE0agd0STUHkQWtXJpkn5ihG/BhQrPV2VxBPbS7dtg7k9+KS?=
 =?us-ascii?Q?OAFTvk9UfAp18QueQNN9puVC1jVpwgka2BUyGikwvp4sOtyK1P7BzDykWEtC?=
 =?us-ascii?Q?SXScZ9KIWKHjPrGsqzV569jN9XH4ur7aXq5ANL3MiDycE3nDDJU9WQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ul14sXkcwURqAJcTB9Nfs+uhJTt40jNArZsyf2ciSFyuAn8XteMEcoXaW8rF?=
 =?us-ascii?Q?cAY61FITdJizN1FEWexdNMjW9XuyXzQKt2TPDV0jHLM9uNAFQZp3+RVb+gZy?=
 =?us-ascii?Q?bpB1Gjdkd8UAMn4SBup0A02KBS1SKgH9yXg+aag2qaZI/9V8WIm4mGae/fqB?=
 =?us-ascii?Q?QefuFvYblfycklhYLxjOgKVGKRSxAdnSh4MbSipm3cu15N26XvrScdOTkLIv?=
 =?us-ascii?Q?WOQtHFtsmmpHLat+0Pe6jCpaaewI/eUeohwEBQxotlqvrCaqGhhD74k0Ly/C?=
 =?us-ascii?Q?Lr0/affiUJgjN8jfL5ganiW9cXU3wbFLXOpskHU2n80H0wjsi3Ku1GXYwpS0?=
 =?us-ascii?Q?VZm2IGJ9Vz5tG/Fb3P5D/L+N+GwDWUfzCZ4QGXQ7ZM7jWCDVJi7AvRXIbG1C?=
 =?us-ascii?Q?G7pToH0Ca6ybNBvs8XwWbX0MBafECkzHEjmEYdM8B25XrUuu87z00TFw/4Hy?=
 =?us-ascii?Q?Ywp0hi846YG+yEYWteV1liDFJAI28d8owPHUTZpMHLcxX9pb+7ERE/9WJPOR?=
 =?us-ascii?Q?rV5K3oA0rVa4hgiQH8SSqQ5Z/pUA1Ivf844iVDuvuVOu2q5WzctY4CIhW0DN?=
 =?us-ascii?Q?1auEKnPOZymsNo1Xqwa9vT8s5sKx9vbHMfPEY8F3PPoJP/JLOyr5As83hFJa?=
 =?us-ascii?Q?g6LLhMUQdxc910NUny7xMpa8802wwqhHmkYjQqg1a1fx5mqBXhmVHALsQyDi?=
 =?us-ascii?Q?ELl2UbutdRrCiBzoSuekoR9zYv8G2NoEVOIr63ILhHF2bSqdnWhmuJVzw4CB?=
 =?us-ascii?Q?g5dt+QfrpTLQQ5TFilEY5JdtPObyv1AoHMOFRNbBR8/UYZeWcLwK3kGG5ooT?=
 =?us-ascii?Q?b5CywXZLZuzWTLlPCBIXS/7DqDy7f4NwrJd2OitfcKCY0jO2pieu2Gl1NeTP?=
 =?us-ascii?Q?oB/wrGM0dpK1xAWJW0P2psAKsCqkfcBhkLRjbUuog1c30WLV+A0kkqhCrKWO?=
 =?us-ascii?Q?w+CPBiWozIOd+CL1HddJ2rOQLcUgrG6dY6jN3aSeZxcKV6Plk6zrcNq4NHmv?=
 =?us-ascii?Q?Rpo7cMURo6DXO2ZNVXGzgACjztls/7m1zYykSVWBAdLi2/KbY37VVaQIoxfL?=
 =?us-ascii?Q?PXbRpFlTOWdXIqN5uN0BvEfZKneKaZEt5uEt4d+6qjhKPQl3+2uk1UhblLUB?=
 =?us-ascii?Q?CcnMxGq+dDTvkVAADZa2k7uP+6cdt9kmyAxNZEfcC+XvNdzKVG0yHAe0l4nw?=
 =?us-ascii?Q?cp8GmLi6o0+U4/83ZtcFwLawoy7AFIwyM6lW26mhFQ42ChZ8wiJ/G8HNIyrL?=
 =?us-ascii?Q?kMeuFfkY8Avk654ZCOfkXrtND0ELiHcK1fksPGRl1pNb0pI3pnUpWM78N7cp?=
 =?us-ascii?Q?RdFE1t1twmfx1WZnIQcjAf4CfaD1jbFwKg8O9SOD1MfCjw7Klw/nBd53iNZJ?=
 =?us-ascii?Q?eUyYKsBi1wCfCLXwdfBjn+rM26H/HBx+me6IcAEKMYDCWR2ItcmrGrm6UMq8?=
 =?us-ascii?Q?4wity29a+7JjnIYj8GtEVToGZa2q5JV8wZ7gHwbtrCyL4mZGS31NhAgll/Zj?=
 =?us-ascii?Q?jr/3gU9knClwi3X7hFKo3C+n2+1hpK7BQiWHLA/wkTyCjyVAt/3Dr+oEf1Ng?=
 =?us-ascii?Q?TJhQHDPgY/yEdPEiplt7jsYpyx+Ena02wqdhEp0B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27d0840-0afe-4a02-18a9-08dd945c784e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 09:31:43.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlkHmHzl2lsZEBEMDyG4yUiN0bWfxFZzZOIBUcpfglBuQZOfu48680miUK7nMHJ1K/ZDQjWjq8fzlt6VznELiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-Proofpoint-GUID: dlEMR4hEZuFipyTnupAnsANeIBdD5JC0
X-Proofpoint-ORIG-GUID: dlEMR4hEZuFipyTnupAnsANeIBdD5JC0
X-Authority-Analysis: v=2.4 cv=U7WSDfru c=1 sm=1 tr=0 ts=68270602 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=YBbYe9Zt53ihzEGwkDYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5MCBTYWx0ZWRfX3vm8J06LoPtA M3ptVgjQAH8F+C7HpcCo+9NvDGeVzTuPS6JN7vqEhp9hrigi8gcKtFXmGuHcRty5NMAUopzFBhg la2CqAL7uwBfW+pj95kIaMrqNGFUhLTVrbWBqNW/EN+zEETG6Cl89HjwRa4b1RfzBbLTjOmZa6r
 kK7OBdu4XsKu6P+BR3aU1PNrLSuX9tGIZ1MkHI1tYnvFvk0f6y0BR3wSQZ6CbhMSEpFWG1CGzml zLr4HazWFfAZbUw8AmBvpoTZvjJqfU77AtctscmYMyx0aUHf0gsdHwvWagkkEcFE+i2z/R6vE6e U1B9DQ/6hvDiLWEpqQuTppFZ+P7oD6qn0WTn2sRCLQwJfdSkLWYrzi879ov8vPYJz4VD/BNWjjT
 jTMtlD27OB/B443u3nf4yf8qMAEzelfwz6w32HiHgyNkD8bisb2MdBpSeLxRMo8lVNvU1UcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216731

The runtime version of procps is generated by 'git describe' command in
local/git-version-gen. But when using git shallow tarball,
git-version-gen can not get the correct version due to missing git
tag/commit messages. This actually breaks reproducibility, since the
generated binaries should be consistent regardless of the source code
packaging format.

Add a .tarball-version file in source directory. Then get-version-gen
can determine the version through this file instead of 'git describe'
command.

Before the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng UNKNOWN
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng UNKNOWN

After the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng 4.0.5
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng 4.0.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/procps/procps_4.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 3be40c38a4..e3f5bf6b65 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -31,6 +31,10 @@ EXTRA_OECONF = "--enable-skill --disable-modern-top"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 
+do_configure:prepend () {
+	[ ! -e ${S}/.tarball-version ] && echo ${PV} > ${S}/.tarball-version
+}
+
 do_install:append () {
 	install -d ${D}${base_bindir}
 	[ "${bindir}" != "${base_bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
-- 
2.34.1


