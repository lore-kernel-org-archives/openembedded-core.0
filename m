Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649F8C369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43344.1744608915545516922
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5K7tZ015814
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hkvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQVfHcbPSk8JMDVvLwTZ9ndDvmkFVYny1p2PO0isXvUUpOzw2xkAJwYiiBU3/mHhV6iwodYj2AjTPlx//dg7XireTvyraWNYbhOFUKCbXDuum/7Gbisl98IA2exQvMvoqPmgEDjF6sZE0ZRmayz5QprVl1QxDNUxfVVFRwf5Uqvq9aBiKmutESiBwsdQ+Y68ymvaRfYPjVe8qTb+V4CuQpnf/RveuWJCK/CqVm71c17KgX6YNKD3c7KbRMz+fsqFyb3Db7oe6Rv1kUZZXjAy8eMMS1HKobYnL2pHRlIFJYdJ8tDFLpWEKYjZLs2TjjMwPi6FF6IdZQc44oDv2R1eWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNwLMol7uxb4k7e2JTCjlfog65C8AeWQeBQB9YHpbFw=;
 b=pMGxO7LsKzERtBOIpUJ8/mb/Q0EG5d0Bv/BAtOqZOSgsNoSOzFa7zRtuni1CdUqdm0AJqvY1cE64ZkIbbPxddHKIJCGchiYKvnAVzSnYXbzQhFC1nFYjmBl1Ab66Jte2cy8x0oNCm36o4feLU1naeiWqqZ8Gu11chZHvHJqz7VlkqRiywtWDLIhVjob3M3TSCiavu/evUbet6RWhhC7IciJVJSjAfz7qUMbDz3Xm2nDLa2ELYu/jWmmdt72W4M03APaR9XrCX031tWL3XXLB9+W3pLMELg8U3cbnSUi0L752Lnc/McsVExCsmOUSJnXwdpkoDXBwZslWCZgCpl3Aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 05:35:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 05:35:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 3/5] nativesdk.bbclass: handle PACKAGE_WRITE_DEPS
Date: Sun, 13 Apr 2025 22:35:01 -0700
Message-ID: <20250414053503.1180029-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414053503.1180029-1-Qi.Chen@windriver.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF066A3CD44:EE_
X-MS-Office365-Filtering-Correlation-Id: ff089ded-6d87-4b7e-04cf-08dd7b161f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rc2xx+fobEmG8i/3YUvR4zXrT39aYID2rx3CgH3ZOCWCF1Lx2zMBSZEyPk8L?=
 =?us-ascii?Q?GZ/rfIZphiLXvP5cXS63rd+LC/9jU4NchkdLw0PZZkZ/r6enQ0hepkvDO4UA?=
 =?us-ascii?Q?mnix8QU2UMi5t2NMj5v9rlwUXpp+1U/dsMlw5a7EIuJk48ZclWp2jbTr6cz7?=
 =?us-ascii?Q?saGmgTlp2yh1eeIfyHGag6vFSCOq52C/uFm0J9UhJS+ToOn2cOcx7kZFrL9G?=
 =?us-ascii?Q?v7hWQ4IxvVbh+UaP9BZq8CQxDbjP42w8uSnmONcf0wE+XFc9jAQwIIx3J+IC?=
 =?us-ascii?Q?P7PnJ4HnQt/uaOvrwRO+sfoOvHvA2NNGBBjNqvtwHbbZW1eQH/mx9fvdaVoB?=
 =?us-ascii?Q?piz00VavYJPdDmLDNAv4tl0WV8PMrEU7yumbo9NPHRJl3CPqr2wU9juoV/l7?=
 =?us-ascii?Q?78A+R8f8XlFvkQjL64CrVuiqRdWa4r7VamaJpPwTYUmSDQRKfNh3Wxb1IjVc?=
 =?us-ascii?Q?F6wxW7Xo4Of4YDo3nMoPJbg6+E4VDeYKrK0bwlXqRvelMaVeCyqnRhtitFOL?=
 =?us-ascii?Q?d2eOr4UnHjPDIegtXunMgqTksSq3Kb9a2mdruN1kWDcR7pIcaKOiHJEDehwJ?=
 =?us-ascii?Q?t8pdBGwApUd3ov68CMlknpw4VIRxWjFQUZPHCOrAIbuoqai3EvDOWng/CuHZ?=
 =?us-ascii?Q?UODie4LqCoPFDSSAOhoWl7CNVzcmoLkau2nf4mTQ20nUAiivBZsUERHDQbB0?=
 =?us-ascii?Q?Lw6332Je7LJbtd5xISUK5UDdzMvKT3n5EQYfKWshmXA0SGE40T8BbJAlGQ0I?=
 =?us-ascii?Q?aCc44Q/Q9hpOat9bGjROPNCBdVoAhHtjXu7ylIdUWUA1DNG6eNAUIoZLkutL?=
 =?us-ascii?Q?0T8r59kbuL/wKEDUSckIzufrN+B+Znrnz9nVqFlBINs03D7KCpz6hsaVypyq?=
 =?us-ascii?Q?6V8296uvwQlFEvOaVY2wGRN4grYuwq6RAhwXJpCViFCrVAxSFnyIJ90O4M2Y?=
 =?us-ascii?Q?ft6kaEOwZbXEpSIGzZlGKJ0EDbaJMLPH3D7K5r21ie3Ydq8HfMTH8a73Hn2w?=
 =?us-ascii?Q?F8c96wMJJ1CSZ1xe2quRC9QriJE5KepjhFj7uP3ehcL68Wknna4uYgXfGUt7?=
 =?us-ascii?Q?ON2KV5IgiPCfC8EYts51rZKkyBvfpC47TBHbfpvxfUcdAp7HR3mJv23hLw8C?=
 =?us-ascii?Q?Vj/TplgpQBlEMfGoafjb/C3xl8QALTudg2ZizqTiyuJSmMEZKqEaDL7PZjfG?=
 =?us-ascii?Q?S5RtZTajBoOUrtipLaTLPYTMje1DkJCRO5rxZ8+NcJKQfP7c+3HfvEcY0sMr?=
 =?us-ascii?Q?0hObTHux72n9Bri8je5kCssr6PfITD1zCReF3hes3cyEz5KkeppclvSG/Fla?=
 =?us-ascii?Q?k8hiwU8Ar4oef8718LrKQtzb34I/e0DyeCaMp7C50csELvk2JSGKxb7VxFWs?=
 =?us-ascii?Q?SKYh9/Br1bym7uXJNYxa0f9en5jERfK2zzmwEWtjG6wrscnAjPsfZU+5SWjX?=
 =?us-ascii?Q?0/zz9cg0UdX4Nsx+sIU/096uja+8rrCl+csGYtG1YLJhuzNSY+/ndg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2zwn+g/yry3ZDmlV3caG3x4y9sj6QTPQcwgCOpZt+6OwU+q5UH8twv+yi4nW?=
 =?us-ascii?Q?FkrHWQ0dXoYx9SLIQny2/Z5Tv7p3XUb3+ZdIAmTIqb2qEdViRE+PpYCvkGZB?=
 =?us-ascii?Q?qLmqNJALEwC2xwfZdLORiNClBRzy2Vyo0+95mN+2xWROQTDlOL3byLILabaO?=
 =?us-ascii?Q?D5znm6sdsqrfrdNZJoOAwWapPYQam4JPQz8MdqsmLZ1gnrLKsPkLFOx61LO7?=
 =?us-ascii?Q?ykocW6aHGrF642PXEHwjF/CeYVYsMqqvZMKAxi5l0qy6C5j271KIcSl+a6et?=
 =?us-ascii?Q?18J1loNIHQJa+xIQjqgkCERA8o4gW24X2H9+d0XdKx+5xfVLifkzL5CmW3AC?=
 =?us-ascii?Q?9lX66iV0oQc1fp2p9A9JN+94+kF11RtcdmjAZWpPWL1ZNfKd0jp31ItdDV1Q?=
 =?us-ascii?Q?Pnm+pLhFLlZnnU4l1hhPb/VKLDx8qhJ+HBkvnQc1j7WgBqIfV4BkncI/Ooln?=
 =?us-ascii?Q?3btsbTjz2prGMo4l7kILo87VfJesPX8ForBrp3hMrwu+oNc6VpU96TPea3q/?=
 =?us-ascii?Q?zuPWhaXFqKHxB6/sA4kiuHWDmCSdwtvgpJ6YBf5ax4q76ph6xKgE3+FZ/jXt?=
 =?us-ascii?Q?UYVgj2iQfsSgMY5ksZY8/5xA+wmmYihHWsVdtHvA3JCLn53LW+su3FJW2qlB?=
 =?us-ascii?Q?b1cJFC9YlthreZhQYDhAMrr77p7wQpWKFNW3lK+FtinB/3f4lPKXg0jOQ/wX?=
 =?us-ascii?Q?sWjaNJReDCr1sGRYh1hWG1c4pzekw1V+jFm3TDETNPrhJks1f4VTD+f6yffJ?=
 =?us-ascii?Q?62ooMH6H16moAABKhzc9KK++FA1aJN6zkOasYsKttALHFtNBeA9+KTllDcsy?=
 =?us-ascii?Q?5TvFh053oSjRbiGcfjRqgW+19Rmny2XL593q64vFu1LKYrmCzznfKZYijOJb?=
 =?us-ascii?Q?js78UfnboBePgrYZqRA1MjDxzqAM4eheCe/6hJ/LQm1UfsF7ASIqHc/k1ZsY?=
 =?us-ascii?Q?nKF/rPtNtTWcLGMbTF1IbcLmNp/ij3Sr5z5xQIKxhmBBIYSk9bPPI0liJ4w9?=
 =?us-ascii?Q?hPkDtoco1uE8/O3figVeDMapwH/Ip+JpTdSNooQM/IhRki6Qv5Ziu/WWcNmB?=
 =?us-ascii?Q?TJrwxa0OzOa5NWMyb8gUOy1MpBdUrFjGZ07Ox1eLTFF9lBcXEVA5gErPMJ7o?=
 =?us-ascii?Q?e6Lc8J9+y30jb0YPYhVBVpyCcV5Yq6GsRG8FU/Dxkg2Iahks5MOMVWxnX0kL?=
 =?us-ascii?Q?qic19zk/XQT4xitWf6ZSxLDlLMlabfBIvX23gHH7bbaWi1EeaIf6dGHUSlB9?=
 =?us-ascii?Q?SV0GYnzBoxWZTmyJgVC0dYWmPL3AAzXyCnwDcoEP2LOy7GT3NnUdITjtZFfK?=
 =?us-ascii?Q?GiYWkQOXOPwojVvtBjZl9MkRyDAPiFWQ1mLIZxltzGVpkSmTtdx1Vf5QaycD?=
 =?us-ascii?Q?KfjuHMOYymqo6u0y3jLikBItN7rotYzGTJY/BTaHPXaRiW9AfXsLZHHVFVhZ?=
 =?us-ascii?Q?znW+nixWDkFGWlkzJ+NrdB6o1YLQ6DVtV6pyikjLx9msk6PJHd2OjKjA4vEm?=
 =?us-ascii?Q?j+6WA5vI1f8K1TLCpph4HzAI1dKelsE3YopCFz5/nQp0bfqVIBuY6C/Ts1Ki?=
 =?us-ascii?Q?WW/QdQlOc9zufbop/gjiR9JLoi8FCNqKsZPCwxa6U7eZiWkecDtR0O4muJ13?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff089ded-6d87-4b7e-04cf-08dd7b161f9a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 05:35:10.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaKEUv0ze68ukOjRgRWhq91upQWBwYP1FCCBqjQ6rFIBSniuBHQKGfEjFx3hB6JjMfgcwaHfE68+XTSkbbY2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc9e92 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=i6GXUCRvfqvi2kUFSWoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tNNjhHzmxSAJAcZ7M4wRPYv8kILC3N7C
X-Proofpoint-ORIG-GUID: tNNjhHzmxSAJAcZ7M4wRPYv8kILC3N7C
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214792

From: Chen Qi <Qi.Chen@windriver.com>

We want nativesdk packages to depend on correct recipes introduced
by PACKAGE_WRITE_DEPS, so do the same mapping just as we do for DEPENDS.

Before this change:
  nativesdk-glib-2.0 -> qemuwrapper-cross

After this change:
  nativesdk-glib-2.0 -> nativesdk-qemuwrapper-cross

This can fix do_populate_sdk failure complaining missing of
nativesdk-qemuwrapper. Error message is like below:

  NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
  NOTE: Exit code 127. Output:
  /xxx/lib32-core-image-sato/1.0/intercept_scripts-xxxx/
  update_gio_module_cache-nativesdk: 13: nativesdk-qemuwrapper: not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 4e57349aa0..7ecb4c12c1 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -104,6 +104,7 @@ python () {
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
-- 
2.49.0


