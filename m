Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0613AC2D0CD
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 01:34:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3208.1747359257598191567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 18:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723171ed67=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G1K3P3029104
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 18:34:17 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca3mu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 18:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7V3VHLrwcuA0LnrfjspdXMnOnPCzhoQBaMzgHomVOg8wB9/QOrtuIT2JUr6EmsZG3GQ2nWWvCOXiMZgnjMrzH/rV6upZk6T3xVOenOGAS3VFuX+85Ynp3MwdfiyTYsSEjn8JDMFLMfdMf+CLKhsZVcRZpjOujqnp6Fk12H8UI2G464VBHPszKIKGWpshtsEiwUNX4FXR8rjmKA0e7uO6ZaoObB/NlkFxWtK9MNUyVvoJoCsQxMyB9yXwQZvBAFUpClMMPiZN7CJsxl/Y/SYKMlo7QZNVouufLUdQYbM6YZasbhVO5zkv865gnXD5dqBNgqx46GoCcO3VutHeTNySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4MAhn/H3e6vZIKeFJAJ7CnGfKm3lNqGuUxGY+zhLpI=;
 b=iVCwzawSnnTzaEEZvPuigiwDxCyEvZZ3YWLuqwBYJPOkV60AGN3DBQAMCWb1+g9Bugbu9nHhwNmfR1VjqyL9lk7F0l0kXAs6kuF9s+ltOhBcuoEH30dQeGm9xydiz0MBacY3C7ZaBUsjBHKIN+f74Cf9ezDMDfuzvKd1JPvjteRjR2hKMrV+lt3+ODM12XxoUvuJRbT8e4m6Dn+pu3dw+l0mFUtyURcgqobax42IMgxzIU3ItzxMvTChiyE+DsSjOFuUNwTJkTbEvUeet255EJMvq9PBd4Uk227+FZL5FN3tqDiue/xZM6z3nuPujgIf43uY806THjykheGA5zuCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Fri, 16 May 2025 01:34:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 01:34:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] iputils: Security fix for CVE-2025-47268
Date: Fri, 16 May 2025 09:33:57 +0800
Message-Id: <20250516013357.2077720-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdffe15-c06e-4cb4-9d33-08dd9419c438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zml8bXIrAiOsW6ok9n/r5ACFEPeW/xpvm/kaUl5whoZBPSkQPj1yB0EFf5za?=
 =?us-ascii?Q?Wg3yCOr4bvzWwL3iK+DNcf5lq/sAWwcp0WJfQUjROW0w9ksGIw9bqzyXoRx2?=
 =?us-ascii?Q?jrBu3ds0ktjORy9xwjinGSgLvjMJUoC0ZXCMxvA4+JNvTxBODLQI8h8PPyh1?=
 =?us-ascii?Q?f/jbf0P9JS8P/6NdMeNY6iwiEFOtUSQ5vaehVG6z84P3W1h+8hQE6xP/TOyI?=
 =?us-ascii?Q?KuCldTGe3XgXLWPFSi4I1yXfTKuwuge9kXQSwatQ9j/A3VQqHDghcqB2wxKC?=
 =?us-ascii?Q?KxfrpWuQUxeM/xleEJGoFXFbJP8QI2eTX0WB9OlgVxfzZKXOM/0N/6XTagf3?=
 =?us-ascii?Q?KobFZT4j9xBKBH10x+CT6hjUcw8gconkYvwmRAvYUV1HVA5LkXMNOTlzDrkS?=
 =?us-ascii?Q?cFNR++DNxdzKnjGoAk2BpgnLT0IvMcfJXZOpGb159PTXwUw3uoZgSqvPzL2i?=
 =?us-ascii?Q?3liQKI/8D5+zt8BmtJ8B2dR5nusJT0OdYShG1lA3D2vZWUeF2iIAabqmCXdI?=
 =?us-ascii?Q?5P131fk3rWnsHOZ82RdOWugV8NBg2mmGsBwiRkHP3b3yo6H0zAnzTqhEbUNl?=
 =?us-ascii?Q?DfM8pv5O+Vaa6zode2DORGzmzrtwUYDcGVRthDNu3NmkbYKkTLOxC7J20+Bj?=
 =?us-ascii?Q?xhAroo3ebO7+Vwjsy/mfMKeSsq+qTaQ19jc5DnLU3Zo/QbloXC3+rX7l7MjY?=
 =?us-ascii?Q?RO83eLcFGiw0uIFnVfLOtAjZNUHC7N3SFRhPiIOBiK/o11EumrFwKm/kS/w5?=
 =?us-ascii?Q?7IEr1P7UkLTmsUh4enmKZ8I6xxpUPFxyHmQGczUMgr0ASYgf1rbae3OxPg00?=
 =?us-ascii?Q?ZnflVbvdc/I7Td9TCWmxTxW3UBJILu1xWXWRw8v7ucPAl2RWKpxS/SMgihCe?=
 =?us-ascii?Q?EgkmIgIc/79yYDDkPWvFTLzAiH5vdMsrfORGyjWdD4W4Ma47rhzy7BObFwg7?=
 =?us-ascii?Q?WKEa6TNEKREnPv/c+524VDzr/1H8GvK8wLBJmv4lRs3va4XGnBcYWimFnfcb?=
 =?us-ascii?Q?Jx2BjWWtF8dNxFKt5QNtCvktlCELvVDkEm1if2+rDKfNu7E3SMEGOZ9GeBfk?=
 =?us-ascii?Q?CsY+wNcuiKMXsMwySZuOMr9PPGaSdhpcm2NmfhLTQwwsaSEtBdv5nTAcMBMe?=
 =?us-ascii?Q?4DYjjk77p8wS/WlbBxveocs+k9/jGx2tO90tDB/XIMj9CfIK5O0hWuw8Jlsh?=
 =?us-ascii?Q?obHwVeNLRwA1F7L6DFd45xQi/vUpkuVIjeGgFrNbtgrF/q9TUz4q6lM2NqUa?=
 =?us-ascii?Q?jywpQMc6xcgzJXGeuGH6IWt+xMQd+79MbRbpPQDUqzaeV9PG11Ife/oJgMxk?=
 =?us-ascii?Q?4IM46eEbkrTNsbYZhr6zhvfkPA+3tKYp3/Da979ijD+YBSZAk1YF0ZpVtmVH?=
 =?us-ascii?Q?LxeXNJQwCmy3sx3w20XNcV1o69FMUctVfkI51f2gr8YFTzARYiRtvfVDD5W9?=
 =?us-ascii?Q?nCaOZnBlxqc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jRggBD6KDzfsjFnR3rHnaK9VHDRh6WdzRzXRyPBV6W3vTvm3BYkUpfyZrtdZ?=
 =?us-ascii?Q?V91tbsgQTpb7Hi3GRn8wTPrz7gK/BVlupUo661ivLHGXWRWWx5spIwJaAsBh?=
 =?us-ascii?Q?ZDF3MMSWMIEHayauOYG7crx6A2plLwBjba/11lYFvqUUcq4RmWTnTGN7YSA2?=
 =?us-ascii?Q?3CDvtxknXZGHozM3LfFlAjLxTsOEoJoxA4Vj/pBIcGI4CNqU9C4Mq56CtcyY?=
 =?us-ascii?Q?L/R0MdiLj8hmtLOAcu16hm0X7CVwVB6FRPibYEdZDt8OohVHnP+sNB/uvOfi?=
 =?us-ascii?Q?t6OR+cu5E0kybRZvG8vH54alV16QSXkonglvuXhFtn3vCB5cToRCnIecKtnj?=
 =?us-ascii?Q?UwuGD4IoCQnfjc77LGd9/m0jgWVSfDeFc3lQE0cFlAsZXo2FOciQ7Xoi+2Gq?=
 =?us-ascii?Q?kUc2ei0qhVKmZSvllZ7cWqulapPoj3NctbO/8A03doKhz/10hsHV/cRRKnHZ?=
 =?us-ascii?Q?jKn0PULb9OdeJ6ijkNXeHxop2m4q4b8uBDXLfd+bbuB1KRmUHWZqynxuFtY7?=
 =?us-ascii?Q?jELxcEFjuJMiyxZ24/PVlzIXaXnZcCtj+sAjP5bNllrIs9u2mh5JyHZ4IfBd?=
 =?us-ascii?Q?hEJn6o3KHxK5tp8D9s+2KWNcEksE0RmILorovQzvBjs6+edAcrXFdVocsfb0?=
 =?us-ascii?Q?vn8huOYgoU9WZys1oBmmPLpRVrY/jf8sSih0t7ur/Ru2WDwgMCNWzizsoKzJ?=
 =?us-ascii?Q?X2uMkWlo+U8dw4OX5bKUajoXVuO+jo1vxUjjHKWOukuVDC0Wk0Ey6P/nzk4J?=
 =?us-ascii?Q?LoRbd8rvufEfIkZ2nbyPW/464U/HZYXh4ebmls6OSt4xnMAn+tteVmO1RyQV?=
 =?us-ascii?Q?DfhGI4qSt4mKYzpmt8QBIperoQFg3frKzAon5LjmwX6IHYWLnSbgni+lJEce?=
 =?us-ascii?Q?o9BzxlfT1Knpzap5Qx8Chp2xKmCnxSNAZLShjEimZ0LRxftF80f+wnTnpW02?=
 =?us-ascii?Q?hUzRs2oO0ePw5i/E7FE95h3GojTlZSEs6Vt39luUOINDB+54DDHOzSuHKCsh?=
 =?us-ascii?Q?3oz0O2PUyRa628GO7EFsUT4Nk7NJyiuIisbe18n/G00cC4gOL3ksx+bneiUo?=
 =?us-ascii?Q?CUPsV1YxSipHizJFVmdcTCAzq0/SE8WbaMH5S1/aM1oTGygfc03zbOa5GQEk?=
 =?us-ascii?Q?TjVKAX015VNU7DP8+r5vSXNf2SxhGfvtQAzYfEhJe6GRG7MRIizJoUact8YM?=
 =?us-ascii?Q?fIQpLwHArT9jP3ACggs/76qTMjOBwybf/JZ1rIkaJDKFD84AKokXEooTwMB2?=
 =?us-ascii?Q?vVTkK6w/44XpGXr+qWi9hPfpjsBRwXV4Fm/3OUXpqmK/QTw41hA6uzlZ4PO9?=
 =?us-ascii?Q?B7yxk8LoO0/nh7G+402gbMld2ZCwzunY2q8mLrzkFijcmgRv706a/u/kxR8+?=
 =?us-ascii?Q?quDmZJBDT3K/qCtv7PXoPJk/QyBr4i2oebTv1ZjkWn3IX/7w40F2VBNa0nO2?=
 =?us-ascii?Q?3nIO0z0pTLFAnrOAanat6h4cF0YQYB1fGg2HubNrHvzM64vzZYFg3N8V3E1G?=
 =?us-ascii?Q?9V85spj+Cy8kMKFhioTIJio+0suMuNrC3goFjElsvEPP55RBYWstoBur8E1t?=
 =?us-ascii?Q?NEdjXWGk2dkaHMGbByA10LMZW+gN6Cc4Okhu0658?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdffe15-c06e-4cb4-9d33-08dd9419c438
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 01:34:14.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPly2VAT7INxiWbHN//g0+1Dvio0bdGgKsQIs4LublhJQL0SxNGEb8r256/VCD2JreOKbcDykugChgXry4mB7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-Proofpoint-ORIG-GUID: fSYsNlG8XG1bSNngyO1iMgFMoQZZTKx0
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=68269618 cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=5PjkQvkCQFl6gfXuX20A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fSYsNlG8XG1bSNngyO1iMgFMoQZZTKx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAxMiBTYWx0ZWRfXyd9VsXME72oC 3Smv8w7p5PsKvvWRZRFZPrdYIjs6OUYK7RRy6Ceo9FkN8hwr6+vytcI4NkHX+3AQf2BEDSVmlq9 LD/7VEnW8ps2i3nbbYKwMWvANGN25wtSmrZHX/Hb8Zi2XExT1k5W6zyyUe90r8oImoDuv/3oGPm
 IJGssLXw59v8KBNtLrJDW3TJrceVJa+u+nK7AEmyV4qNPdW6wJU0xGN/lwLDhfTrgSWxqJlbiXj C5LKLrQwuxjXL7blKnx7rX4hrlJxa0oBHnC+2DAqpYcBAN++isImFCJLqjG0ILeECBlPjD+89/z hxVbNC3Si0GLro5t2nEccdEbS+vfHTcQWwfRXoIbw4Rkx8yA55OQaij4zIZrbqx22TJ/gNMYDYp
 TXlwOERKL1JPWKTz362/r8383JXtlomgk/1tORMUYQNbHrTr1J0orF0+A19KOrLIHPQf//r3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=806 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 01:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216716

CVE-2025-47268
ping in iputils through 20240905 allows a denial of service (application
error or incorrect data collection) via a crafted ICMP Echo Reply
packet, because of a signed 64-bit integer overflow in timestamp
multiplication.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47268

Patch from:
https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../iputils/iputils/CVE-2025-47268.patch      | 143 ++++++++++++++++++
 .../iputils/iputils_20240905.bb               |   4 +-
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
new file mode 100644
index 0000000000..dd31b79031
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
@@ -0,0 +1,143 @@
+From 070cfacd7348386173231fb16fad4983d4e6ae40 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 5 May 2025 23:55:57 +0200
+Subject: [PATCH] ping: Fix signed 64-bit integer overflow in RTT calculation
+
+Crafted ICMP Echo Reply packet can cause signed integer overflow in
+
+1) triptime calculation:
+triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+
+2) tsum2 increment which uses triptime
+rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+
+3) final tmvar:
+tmvar = (rts->tsum2 / total) - (tmavg * tmavg)
+
+    $ export CFLAGS="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ export LDFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ meson setup .. -Db_sanitize=address,undefined
+    $ ninja
+    $ ./ping/ping -c2 127.0.0.1
+
+    PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.061 ms
+    ../ping/ping_common.c:757:25: runtime error: signed integer overflow: -2513732689199106 * 1000000 cannot be represented in type 'long int'
+    ../ping/ping_common.c:757:12: runtime error: signed integer overflow: -4975495174606980224 + -6510615555425289427 cannot be represented in type 'long int'
+    ../ping/ping_common.c:769:47: runtime error: signed integer overflow: 6960633343677281965 * 6960633343677281965 cannot be represented in type 'long int'
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: time of day goes back (-7256972569576721377us), taking countermeasures
+    ./ping/ping: Warning: time of day goes back (-7256972569576721232us), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ../ping/ping_common.c:265:16: runtime error: signed integer overflow: 6960633343677281965 * 2 cannot be represented in type 'long int'
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.565 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 1002ms
+    ../ping/ping_common.c:940:42: runtime error: signed integer overflow: 1740158335919320832 * 1740158335919320832 cannot be represented in type 'long int'
+    rtt min/avg/max/mdev = 0.000/1740158335919320.832/6960633343677281.965/-1623514645242292.-224 ms
+
+To fix the overflow check allowed ranges of struct timeval members:
+* tv_sec <0, LONG_MAX/1000000>
+* tv_usec <0, 999999>
+
+Fix includes 2 new error messages (needs translation).
+Also existing message "time of day goes back ..." needed to be modified
+as it now prints tv->tv_sec which is a second (needs translation update).
+
+After fix:
+
+    $ ./ping/ping -c2 127.0.0.1
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.057 ms
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928611 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928461 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: invalid tv_usec -6510615555425884541 us
+    ./ping/ping: Warning: time of day goes back (-4243165695442945 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.111 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 101ms
+    rtt min/avg/max/mdev = 0.000/0.042/0.111/0.046 ms
+
+Fixes: https://github.com/iputils/iputils/issues/584
+Fixes: CVE-2025-472
+Link: https://github.com/Zephkek/ping-rtt-overflow/
+Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
+Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Noah Meyerhans <noahm@debian.org>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+
+CVE: CVE-2025-47268
+
+Upstream-Status: Backport
+[https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ iputils_common.h   |  3 +++
+ ping/ping_common.c | 22 +++++++++++++++++++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/iputils_common.h b/iputils_common.h
+index 49e790d..829a749 100644
+--- a/iputils_common.h
++++ b/iputils_common.h
+@@ -10,6 +10,9 @@
+ 	  !!__builtin_types_compatible_p(__typeof__(arr), \
+ 					 __typeof__(&arr[0]))])) * 0)
+ 
++/* 1000001 = 1000000 tv_sec + 1 tv_usec */
++#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
++
+ #ifdef __GNUC__
+ # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
+ #else
+diff --git a/ping/ping_common.c b/ping/ping_common.c
+index dadd2a4..4e99d89 100644
+--- a/ping/ping_common.c
++++ b/ping/ping_common.c
+@@ -754,16 +754,32 @@ int gather_statistics(struct ping_rts *rts, uint8_t *icmph, int icmplen,
+ 
+ restamp:
+ 		tvsub(tv, &tmp_tv);
+-		triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+-		if (triptime < 0) {
+-			error(0, 0, _("Warning: time of day goes back (%ldus), taking countermeasures"), triptime);
++
++		if (tv->tv_usec >= 1000000) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 999999;
++		}
++
++		if (tv->tv_usec < 0) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 0;
++		}
++
++		if (tv->tv_sec > TV_SEC_MAX_VAL) {
++			error(0, 0, _("Warning: invalid tv_sec %ld s"), tv->tv_sec);
++			triptime = 0;
++		} else if (tv->tv_sec < 0) {
++			error(0, 0, _("Warning: time of day goes back (%ld s), taking countermeasures"), tv->tv_sec);
+ 			triptime = 0;
+ 			if (!rts->opt_latency) {
+ 				gettimeofday(tv, NULL);
+ 				rts->opt_latency = 1;
+ 				goto restamp;
+ 			}
++		} else {
++			triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+ 		}
++
+ 		if (!csfailed) {
+ 			rts->tsum += triptime;
+ 			rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/iputils/iputils_20240905.bb b/meta/recipes-extended/iputils/iputils_20240905.bb
index ca8ddc530d..64d58a91c2 100644
--- a/meta/recipes-extended/iputils/iputils_20240905.bb
+++ b/meta/recipes-extended/iputils/iputils_20240905.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
+           file://CVE-2025-47268.patch \
+          "
 SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


