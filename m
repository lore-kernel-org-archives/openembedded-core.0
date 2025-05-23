Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AADC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 01:36:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38888.1747964164942808838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 18:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723806c938=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MMhiKD008621
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:36:04 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrbakd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K39Wgo7gzRrCuFEXFQgtrG9UkGNzaqVfOiIU+sYCblDMlIYAqiU/0d5gXNWvEWQJLncQmaKcU1MzTm/LcfCNdgRwBHSc8oUDfHrWnQPODKBx53eYmTxNBRDU0O2ctzuOM1DmsSCxTYPIIoae8ii0dosPCObsXVQvN72/tHVNT4JVdkGHu4g7LMjeMnVNayqHbaD/goI6wgLDT8R+zoiGvB8YJcCwFsmXLEFHz87aCu2pEpkYppPP7wbisDBezR4yzGdf0qZrj/F+u+EIu8IYDryh5yyksjdg6ByT7LKvg+c/dUkrPY97fG7ofSFO4VBE4RttRDIWM+xEJP25jEdpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82hnGOWLrKwB3CWkORwsvq/TpM1aWuLHoYuyHLmuGO4=;
 b=VpTm1afslcmmv7ikAFuSNosNDjb1ey2hfnorXSPJPjlxD4+L6m2GwPHg9LDFjOk5jcgwWXQ8fY9pUmmiQPV0rowPelRx5vpSjfoPHniXVvbvAYSOU7pNMpeHrdxfAxLRIbYoq0PCHD2VAjfU8kdeDR5KedH9ER12uDZfS1tlKJT0hUJpK63DNaQ/GY/v1eox3XtYN0VULvSUPgqVUKUEDvm7ZElS84mKxrDG9JHW+06s2ru6LPDVcnfiXQnWwPCDaPgoPDOqwmYyNz7WL+RDpvWa2QdSCroE4FArVSHoTygsfDhUEwoR/R//iPYUU50IJ+Fbpyby8f1IiEgcbj7X9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 01:35:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 01:35:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH 1/2] python3-pygobject: RDEPENDS on gobject-introspection
Date: Fri, 23 May 2025 09:35:44 +0800
Message-Id: <20250523013545.3748765-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9978fc66-a2e9-40f8-aca8-08dd999a2af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9zDSaXvj6CoZ2ZZqJLeeCZxZfDz98BATqkm4uSN6ipO3cGOwxzj3Vv8DTIJP?=
 =?us-ascii?Q?qIMfiQlJK+cDn3eQOtu+cRalmWgduDa3C6LyFXCeJJ2hxWCY26s3l+j5nsiV?=
 =?us-ascii?Q?KXeCXndO/ZUCYHdaACDVpFalpzu9ZIgSlSfRL4dkTnsJYgMU6KJ/ZQ0IESMc?=
 =?us-ascii?Q?TrG3JlNDYLAWsUDHU/XX26OS8OlEuAzEhWwWWeeyfC9KIfAGDBFpZrbhdNIF?=
 =?us-ascii?Q?HYhta1GHPgFM6WA8ZjRzBdGOZYXRB6TleHvkM0rkzmmPUJQlwXW79mdF1lDr?=
 =?us-ascii?Q?yi3OIZDDUjeZklKPyQb/1WR9tzXMhwhFlbnZcWOyKBULRQyhDX71BYjh9a18?=
 =?us-ascii?Q?UN5Nad7uNHJxJdo3zpZ7fOOa/Clto97pblsvcZsbymwmCCHjMTiq3ZRYUd5h?=
 =?us-ascii?Q?V1E6tGmzZvZ2KCQzTVH2QKtROe5AfK1m8ScZpKFm98BS3/mKGLBcZUnFM6Rc?=
 =?us-ascii?Q?hdMyLrUHL9+kg+L7wIxca/ERsFpRk9nXsMkTU48Zze4KIln+jqiXk3Rdhmcl?=
 =?us-ascii?Q?0rkueIRwZ2GmU1jc710JnyN1s/jQPV0QpKZoz9I50EVdh+KdqPYNDf3veE3p?=
 =?us-ascii?Q?A3WXpoKNNw8vbbbWDyfUPL0wyvoJWBDmoCxAMQHiafgnbZgnCmD9nc4NJbss?=
 =?us-ascii?Q?kZm6RHBjN6WhVzzOEVm7ACuhRuoWCJ8ffQNTDPzeVdjLq5+uhCzntH8NL6Nn?=
 =?us-ascii?Q?ODAK2H8mcJUwGIHhhg9vkRG/Gsqx/uRvJg66qhkhkz+hQCDUBZxd/R3DTsos?=
 =?us-ascii?Q?qfK5TUZwLHfBBoEdz4XDS3QWxucMEHXb0BQAz3y0al194gTOi+crVk604mkS?=
 =?us-ascii?Q?ZwMwe3MSTfcGUr+gBrV1mjm00IRjV3TV8DJmvTioI8NzTGgQsL50Wq4Y7bgL?=
 =?us-ascii?Q?deSCaCCkCO8soPqcn3sRg+zWF4lua6Gdu3hWboKqUC/9kKUEl0NJ7rgqpSkU?=
 =?us-ascii?Q?Wf5vbB3nAMI1Lsx2l5cExQSWsfcotqq/Nwob3MCLY8dkorMuNOqGRPpBEHZV?=
 =?us-ascii?Q?W0+fUCbS/5qRfxbXxYeTEhqylxvtoeEVkvySRkJan+dWj5IEuu2Ei1MiEKUf?=
 =?us-ascii?Q?DyUvVQ1Z8dxuVcy25DfAtSRrB5XUo3wVTNWyV3ka80MscCtwe29W8+12eTzp?=
 =?us-ascii?Q?oR9RuhJYMacYJAwbIdVyOJWyuecHLri1UyMwfNKkBG6W4FiMn7woE/k+yv0g?=
 =?us-ascii?Q?2ZAQaWyOYkGLp0TdkYAm1AN0mAzRL06arHTDzwJKDcxUz0ImX+2nk96gydd6?=
 =?us-ascii?Q?McY8QqDAelgTd1iuTConkH3OCxkmgpMILjSMlK6c5PgzQq8MQiTnaKU25vnM?=
 =?us-ascii?Q?GtINBkEYKZVnr8QrpXudD+fD2lFs1fSRgiPrDXzfcOmq8WrusrA8mk/LWRxB?=
 =?us-ascii?Q?v2WhbzTFIjE7n1Im+m5ugv6l10vuN3ia9r1twWgGGwdqGytLDmkvcHsOpxWI?=
 =?us-ascii?Q?Nu9IyySXXrI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5zY2732HLZDcCHz7yP61bXmSph7BHebU7n2Z9thCE38GP6TkX7/lvuGDCvsb?=
 =?us-ascii?Q?RS34NAfHtDcqLAaHIep1gI7X6HHs+FhzC6fqeow4jbjXZOSmH/qzLDHXQyxw?=
 =?us-ascii?Q?llQdsiiDaspN36MGL0OrWrVhjBPQCG3YrP9GmM9pjiCyjqaNd1/vVrtBLyzI?=
 =?us-ascii?Q?OF5Tmd1N3hewx38LQzRqjS2SA24g0LI84GKgX5UoqEtWRSJJJlIfb4D+K+ae?=
 =?us-ascii?Q?Rkrr3puO0rSZzwKAe5LZ8kresM+z/eQaotTvsYiTk56O3NYFu7NFaUIxMAoJ?=
 =?us-ascii?Q?xgzFf6nPv4UD1aD+XmVbW6CWDZ2s3ssl569e4//tliFyaQvj7mjNjjYlMMjZ?=
 =?us-ascii?Q?1AfePVa9fWfaZZFbdhuuOAXD7JqFYp3eSHKabRgCskND1oymwp4hGjvKwzBj?=
 =?us-ascii?Q?IrODvS3YrGIIkpBGDOn7kjc1TyMaAPdHL3PVNldhXhYj4lNWasRlmtlJcq3K?=
 =?us-ascii?Q?vu9kChUXnZleqSYcoxUsvKney9pZngTRPYKA0y+c8ANo+h/zWZBnVcSQ25+n?=
 =?us-ascii?Q?q+IqPRBtkuAWu0ui+YmEb87oc7nW7dbFHTXvA1mUC2+G36VtNGyxFXBaGE1V?=
 =?us-ascii?Q?yz5vAstTmNi7OhZFpfQV6h8nAw+e6vFnooQmv0nIF4GTfalri+JHBZ0lWj6p?=
 =?us-ascii?Q?2jVDUdw6v+WVeR8KxQU24Oew4ddWT43I3f0A+HCealnvmHBsf07yasDC9c0s?=
 =?us-ascii?Q?fUrPFQstbiDxPKtcqhZa2iLCH1Mzd39EXgsEfg9/RqmFTjv2SHlUj1S27JZm?=
 =?us-ascii?Q?e0s9pMbQasgNGps8DDi1WZ7Wjww3iKVqbo3LycBzFeGKQWJdB0KhurRcp2Cf?=
 =?us-ascii?Q?cUMuoQHLTgp652GyjA02mZAJaPLxf//YEZdFJQHucpKktYKW0aXdPPVcFKjE?=
 =?us-ascii?Q?B9dzKPkWN69W1VtLJprUKyHcXRgee3tjEIOBuGjyk0yeUfz+SYxDHOfG7aZm?=
 =?us-ascii?Q?q+ysBS2kkTgMmwp5MzRRs9oL4UbcSwbAPdrkPDEyW3UrucagdEaIdOzNJdE8?=
 =?us-ascii?Q?Am5QlWqRoxH/X8etW3PDJoFjR0ukRhAAHN12Pu/wE3n17n2fGY4y50fLZ576?=
 =?us-ascii?Q?FTbBaTsDe90RWYsYTckZ7r+MjodtPYbZ65znXmAxb5kY85Hh4UaJ0FJOixfG?=
 =?us-ascii?Q?durOyii7Vt8s14oEZrAs5Fb1+1ulq2gJl+TxSAt+RtKHyjODlLUHi1UYNQ5H?=
 =?us-ascii?Q?SaOatHupjIOK3N60iV8jCffeIiZGecL6m/deXw83D1xlbYDjPnCSnC6SaWnw?=
 =?us-ascii?Q?3s9JJdEMEP2Mvl1GIo0sbHTjb/qndpdBfRhPsW/DoN6xCRJ7uNPIjr5bsPVZ?=
 =?us-ascii?Q?F+TzO/qq5173IO0EhtV8N1B8X1voajqNAItfPqUCVMJT6OYVgL5mGJzJUtl9?=
 =?us-ascii?Q?Qp4F0vrcXW7ft5z4kmB/5OQzHYnsSZx9h+YaCtwBTQDt5vnM/CTDvrZ+mEOD?=
 =?us-ascii?Q?PuLRxy96KnwYwNbZJ5TXMknNnw1nKi+/TxvwCx97JkTilmc0ZfijMMOKFnxS?=
 =?us-ascii?Q?CdjjVvNxA1sTU9gQhXrzLAx7UYFkouj78e11pSZu6Oxu5OztfPHS2NmwXbPU?=
 =?us-ascii?Q?RpdzmoZVyxnuOeC1yUkqJ/PaKt3XEbaHfVkLAgor?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9978fc66-a2e9-40f8-aca8-08dd999a2af2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 01:35:58.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ItPIIL9CzDnCCCeO8+BDyIU5TeS4FtUoiZNHBiOrIyM8zuguplA5zJ+7LElvUczUvn8m31OrBRQ8ThhLrwBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDAxMyBTYWx0ZWRfX6QwX98WGlL39 CjJZ0lGe44WCbsIyQ7Q9MC2yTm3HJxVDV6CU1Njbcb8RbpFVSoSp82/Q27WIoaVS7pcSjaVjq0p ZFu2bQbtfWcdYp0z54cyF0Qzc1Vn/ZcSlncJdsf4FFLTmbvAE8WG6mEZxonvE5McMHX+nInHXss
 BKHOKEG7s4rO4+Pz7KermBBQaeg2QQz2t0twohZDou/SjOj1Mg4AmCcEvPwkJqkze5nRMUNYAZa KXv4aG4VkNuKUYQRrv02vJGI+uIPKe4b21nlt52DDcao/duL0KhblaB57kbzF8GnYhvT88kKzeI lLv2bW37eV0hHfdSTltoaOClvhQxe4TtaZzLBNgHW7Srrksx3MIKHf2PsFhCys5d/n4L8UCCNQ6
 vc6+rZkbCglj9VSAhcfRN8UqsXc5pbBmlrvrSzeXtpxdxnoHn4P0VhfxR1WY0OxT/vnxPHrw
X-Proofpoint-ORIG-GUID: UzpHG4JECAeuD1eBRyIHOn3GLmIWlTbq
X-Proofpoint-GUID: UzpHG4JECAeuD1eBRyIHOn3GLmIWlTbq
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682fd104 cx=c_pps a=gu6RomWtnwV9OjqK3d0IpQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=Soj_o3jokgfLLE3Yt4MA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_01,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=837
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 01:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217158

Since 3.51.0, python3-pygobject depends on libgirepository 2.0 provided
by glib-2.0 instead of libgirepository 1.0 provided by
gobject-introspection[1]. It still needs the typelib files from
libgirepository-1.0 package. Add gobject-introspection as a runtime
dependency.

Fixes:
$ python3
Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gi
>>> from gi.repository import Gtk
Traceback (most recent call last):
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 139, in create_module
    introspection_module = get_introspection_module(namespace)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 243, in get_introspection_module
    module = IntrospectionModule(namespace, version)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 111, in __init__
    repository.require(namespace, version)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
gi.RepositoryError: Typelib file for namespace 'xlib', version '2.0' not found

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<python-input-1>", line 1, in <module>
    from gi.repository import Gtk
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 141, in create_module
    raise ImportError(e) from e
ImportError: Typelib file for namespace 'xlib', version '2.0' not found

[1] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/320

(From OE-Core rev: 6f9e02292c9305e795f2651c3bb6ef5b671e1c74)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.52.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
index 08f7dc67b0..cf1dd07639 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-io \
     python3-pkgutil \
+    gobject-introspection \
 "
 
 # python3-pycairo is checked on configuration -> DEPENDS
-- 
2.34.1


