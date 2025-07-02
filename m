Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FF7C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18039.1751441357125004852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625QxPD028073
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:17 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDJVgmGUWmtnwGmjyqnQho/EWpIbhJDhzVRzlnMFA2Pnh+Rin8zbzKYGWNK3QKaZaLY7AZpuHSXxyVdYJNzMwCilXdqLb/IwdiOghrfKxJmewkRVEcRzq9ZIhLfL4XQEID3a6Mwwc5yFGfOfYYNMKK4cvczNwNkMVkZDhyklSMdSd+Zxw2BUux+NYUN1LoXcByDzPO6r0hYdBAZqA+U1T8ePLkFGYNvNVPduC+p2r4T9PKUtB6Arjb+4yY6uNH7AD9BEFr0plzck34ML4iqUiqe+KOupdI24yIt7G0vB8/ML88pD+uSNKsGh1eu+HaFnALaPR99OfbluGb2ErXH8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLPIJISJhUiuD2eWKRjL+Qzx2SJUqXVDyHHpGuMfofg=;
 b=ocVVsN/b83SESlL+JBh4zx2+pgUOzn65OIyaK0fhmedeJ4ubkl7Mzt/MDfUFKvgz4sfOYeeMq0+E4B6FY9bbWNfdDFqFcn+ssm6aeW4FPXaQ5BXW/gwf2FQJLUxgeD7KwcO6nLtiKJ6Ln+whur+7on7cgtmE6nfrfOnt8a1YsJSXYG41ChJf2wWZQrYyUe1+d6CLkOX7Bqyrfm1Owl32Q2W5qlabMaqrs0rSCe02Y2Nk2uQwSIv+XEAivIYH1ySjK357vfYvI/Tye12TXAvK8XAHluyvyZR5eTRLb5Hw4OqJ19f5MmxCklRZjoorkOa/ZLzTPyFB3ib0is+aksHIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] gnupg: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:52 +0800
Message-Id: <20250702072857.1267224-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8e6d42-3cf5-4dce-b73a-08ddb93a24f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QkHvImwnkux4/FY1PwkEBaRya/JfGf+nf1Pyb0fuchIKSRcbnxlf+JQ+uaze?=
 =?us-ascii?Q?U2Hi5Fy0q5fzjsOFJi2/mDT8SCXWnVrl9dyuN2wR0dE6bkQQiH1acxxeifES?=
 =?us-ascii?Q?N+DBXzWAeC+rmT52KuabBDwmAc6+7hPDozhX40TrIf/wnxqwQBC5ELb6alT9?=
 =?us-ascii?Q?KZrKqmuIFdfaAhrJYp4gY6YzDG1rpOH1OSueY5TseKs7A6VXH5HIoxUnJZKo?=
 =?us-ascii?Q?8a1fV7nW4IDDFZkKgCAUE8KZUZxLEO2xEPDKtcBounr5/qDJbb+gBpxcLNR1?=
 =?us-ascii?Q?c0pRmNHA9kWF41XJSVbhqB4XjLdRDxAuhpw/UnfYJ0yXmBJbJaw+N8kZ311e?=
 =?us-ascii?Q?jCjdyndwosgYARCPxDpq/m+l3UEiu4dkPYWqrmHYWUTTgLu2WCeW/oxkXZ3q?=
 =?us-ascii?Q?L5d7KYHmszzWeahiDaKrV5HxMAmJtkhUKZm5AdrHkpwHk+PJaojWfzO5W/oX?=
 =?us-ascii?Q?74kHwa4td49IOjEoHfalS2uPL4ukpdZK8LtojNq9UsBSuHnL3082oXZOZFF0?=
 =?us-ascii?Q?3CxpsZHcanOwS0Bm+HdC9azSnjpnodoKmyHrp1ZUEv4POh5UT/1xfXNPjrsw?=
 =?us-ascii?Q?ztNvmbG7gmxT0e0HXg9kZH0PufTdjiZnfLJzi374HHdE9j4QasYNnGS0R9Ww?=
 =?us-ascii?Q?UyXWU34Wlg88G85RfW0246teMWAQrFGh83UQah8mdb+x2mJOYMpILfVmuCVs?=
 =?us-ascii?Q?u6PwNgsLe3Ks8Q5D5VUAEO06GgdYtkv8XKwFBi15SBDKJn62h+QSRcnNXyck?=
 =?us-ascii?Q?WENzskjcGhPVN+U7xILBUF6UHSbVs2FK0v5YYKDTbAEps0UGAXGCoRNcv+xp?=
 =?us-ascii?Q?x91KZPKuEYmyGyMrAQurrnYXMXSGSt68iRrMRWjm7nJNVU5PFic1YsBGARrP?=
 =?us-ascii?Q?aUROcMtz9nDfAZQFrUuXczzKlaXmTk+9HgFDcaGizV5Go7BSV8ASdKggt6TP?=
 =?us-ascii?Q?nb6wbaTW2k2TuRJZleCCSLKGZATcsDzG4ABSOl1B52AlbzqqQaRGKYETGQGK?=
 =?us-ascii?Q?TRZvbBf8NXsuMXaTcCoqAK5Q3MQOfoleXF+lc2L4klaXvMlvdtnb8OZBWYni?=
 =?us-ascii?Q?QCaup4cQrd66wU/uNkeO/GV9jaRAcd7JaR2+S7DPuqPXhPp+hvTcI9Nafvwz?=
 =?us-ascii?Q?S7TxlbGayd+4UVCEvcLaJYQl9MMvZecTb9sRCt3eZGSbYQpZhYsnGCOSFcIZ?=
 =?us-ascii?Q?c3Inc13L4WThntN3lS75IHMIBO4PZ0ng5qKMywlk1f9TXWjbDQZsC3rtq4gZ?=
 =?us-ascii?Q?3HkTjk5iMVDrbmQX21YyRfI5xBd2IQnriLWzjuV5YyqrJVNVo9e1m7vATkrl?=
 =?us-ascii?Q?I2aPCqNfjPyWfSJWdU7hY2VSLkSch74rm7/MPQ1UP5lCkDMbCoTHbngDWF2H?=
 =?us-ascii?Q?l1EaJsxj1ATP01vD2TkYGFFvf8//R76m7tjLJ9agXPjesFTmV4M37Jvx8EDt?=
 =?us-ascii?Q?jL3jL+9qAN9gpW6WN4WFYce3hhhVMgE+GyfH9jwRNuKGxnY5gHcfEArWyw80?=
 =?us-ascii?Q?l8JamGyXsiuIBHI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yu/ysnzD1FOCCVBbcNd3rQt8QXd6u4LmD+OPXq3vjEcpWX7j98dCWc4RQR9a?=
 =?us-ascii?Q?FFAl5UGdFnjqM0giHf5FDVUFEb+Xv0QbugY6hhbttqsGWumf8KQCVak0wQ/Z?=
 =?us-ascii?Q?5zwLifRIL9gYtwldlAof2Z4CT9MBAYdM0EGMMkLqUvT6hAHWCRoAe0OUIPQ6?=
 =?us-ascii?Q?Yq4h3TyBODontg2BcD99bwIv6Hq/7DzKrkrogMJs0RnB1MQu5AF9JAZikB+z?=
 =?us-ascii?Q?Jx4q6EBRCZ/B3Vu9xJ0S8ZsJ3qSncrcS7gqOu6qKdxcAh2wEu3o04UvjTCka?=
 =?us-ascii?Q?GZoCTGnU2aT4YIX7K0/GWakX0VdeVDosdkhb8KzJSx30v8gamDlLWM9SjQWo?=
 =?us-ascii?Q?d37OkUFgXoIb+EIIUVEj6QdENeAGA8hxkQBBs39LqTH9yqozwmyhLxiB5wBc?=
 =?us-ascii?Q?z0YKMf83mEFAw97tc0nLfsC33WgkGT8oN6MUwNFACIEbxYnp658Yzg1d7dFY?=
 =?us-ascii?Q?pmc8lHUV98R6QN1S4SWmgCwHBZMxKFcvt5p0+B3B2IoetfBVbFPXcrLSIXUE?=
 =?us-ascii?Q?dDpe+Jf8QeSUc1qItJlrOPdrAOwUb0uLVq5d6dRcWvHqAdn5nTZOscXWXICQ?=
 =?us-ascii?Q?UxY457M68kN38yCGcwEbNhCI2y74ZvKB9G7Fpn7ILZcLDiJnwz+1D0pdqw2k?=
 =?us-ascii?Q?8KczEjw8kw7cbgjOTHiNhMGeg6rQpbPAZmzEpxo39Xkg2BHT10BnQrbii6LN?=
 =?us-ascii?Q?o1zv/lVaTnI+DSdV0rB9y+BbW+OqzdPzB3aCC17mtMF63JyinzwCaztMZszw?=
 =?us-ascii?Q?35yOkd0ROm6M7a/mGo0Ikkb94oFdinX5jjri5aMBvZnXVXjopJz0/J04x2rA?=
 =?us-ascii?Q?0pdGGj4ubjmrRvYiPzKLWxAwB9lESgnbWVXw/Rgf/lrozEm1AGdevVvNLqTU?=
 =?us-ascii?Q?EPlluLl6LCQ9YTw81Yhuw0eiNGqsM6DhZRwMuIrmeRlzklZbv2ZR3zu+jvRc?=
 =?us-ascii?Q?NVtaDNiZANdLBn1w32GsDs4mIXrmM/xo/vfh570jMpe08QkRG6rQMzCycW3Y?=
 =?us-ascii?Q?oShl3i+YpG+OzdaRycXSJc/uxf2CFi56NCO3w5k2YW4JMTID5E+5wyF141xX?=
 =?us-ascii?Q?bzUqs0qfvU8JHiOC2gUisv85E+oQfZh3RzETyoLTcqqbIjKeQbtQGdUSdmGF?=
 =?us-ascii?Q?KvtYlq5znWrIupVPIy8fjQLAjjmSvek3ksB7dGDDlWf+u+317OIWr4kxChJ5?=
 =?us-ascii?Q?qazFAWO/R6QfyBtKPjU3YI+LvhldxeHd9nNlWHidQNbebU1DHRqixqLkS6u9?=
 =?us-ascii?Q?diUMYYNmDAxPg7BeZVckosifbdhbSkpsld+79878xjQgBI6vw5uiXSmcK9bq?=
 =?us-ascii?Q?IXjlSYxmHmkStO6bzj2+V1UYseBJGlSng6BNA/x92Om1puWRcJa5Amf+Vxtu?=
 =?us-ascii?Q?xNy1dDuXbFgF2FbemDvu9znPjSUUrkt/azznBn1IzUW9oOMSqtA/Qn+jYUDm?=
 =?us-ascii?Q?/k0xfLX9hz0H4lTTbhnm8T5xjYonygdtwgiYd80m+GgpNqgNTfXs1imfviQj?=
 =?us-ascii?Q?NJblJU/0565P0EhQRPF2paDNcF5MCz0lsaDmaNufXPIpnNIQhBKrNh+qeebw?=
 =?us-ascii?Q?ZpCkhVOOHyULEgsbG1RPI7SldZ6HeShM12rEhoBE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8e6d42-3cf5-4dce-b73a-08ddb93a24f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:13.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBPXjZ1aXuk1cXtGHTNpaXUzuXyanmyLxkwLMY/rk4N2RZNfcaAIbjDfO9zxo27pKT3wf4t1sGFqmpBMZZcYJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfcc cx=c_pps a=bXIISpLe4O+zW6xWAQB2QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=O_dlUN0sHNI4tsaAqQMA:9 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -3Kj2pboLP5DEYHjRqRM0FsWDqR_Ixaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfXwg6fMMyVJZo5 dLkdN6iC5cLrGN0LA/lD86cGFQQcg86lhOaSdRrmzfy1XKX+osU3zy5HucPr1J3YspdmoWJWaXA pDaio0OewAYFsRa0QGFKrX9WH8RyOOVj+kfk0IrIfTGu3hZYBXiV4Pn8gZe1Wzpw8NSfxXGbjfX
 EdLh+u3IlY1vKqtQhv2oHWVFWEpwS6p9yG7WGaDxICrK4SFNMdnjuKMT7RRR890pLEnt1H0iAmP RKa5Q+RCrnQDD+FGQH22JJCWDNjcJszot5QS164n7tBJ1czWCLQHOcHzCn+DADdFZ2qxc7vh7ff 4GAkDiEqdYVTcC3SCKWRMNkM7VCdApMhw1kpOaraQdNObmOL2nCDk7/HuWQNEtz5eQqDQ6Y+bMl
 GBqnlZ2rn0gp6evEkHTi6tZCorbAu0M5Y9xCEjgIUuwUgYaYMboDjv4b8lpK/WhoY+z8Pgh3
X-Proofpoint-ORIG-GUID: -3Kj2pboLP5DEYHjRqRM0FsWDqR_Ixaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219794

For gnupg and related packages, if autogen.sh is run outside of a git
repo, the find-version function always assumes that the package is a
beta version and adds the suffix '-unknown' to the version number.

Add drop-unknow-suffix.inc file that can be included by gnupg and other
recipes. This file is used to modify autogen.sh:
1. Replace beta=yes with beta=no.
2. Replace tmp="-unknown" with tmp=""

Also remove 0004-autogen.sh-fix-find-version-for-beta-checking.patch as
it is no longer needed.

Befor the fix:
$ gpg --version
gpg (GnuPG) 2.5.5-unknown

After the fix:
$ gpg --version
gpg (GnuPG) 2.5.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gnupg/drop-unknown-suffix.inc             | 29 +++++++++++++++++
 ...h-fix-find-version-for-beta-checking.patch | 31 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.5.bb     |  3 +-
 3 files changed, 31 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/drop-unknown-suffix.inc
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch

diff --git a/meta/recipes-support/gnupg/drop-unknown-suffix.inc b/meta/recipes-support/gnupg/drop-unknown-suffix.inc
new file mode 100644
index 0000000000..dc8f31869c
--- /dev/null
+++ b/meta/recipes-support/gnupg/drop-unknown-suffix.inc
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This .inc file is used to remove unknown suffix in runtime version
+# for gnupg and its related packages.
+#
+# In these packages, if autogen.sh is run outside of a git repo,
+# the find-version function always assumes that the package is a
+# beta version and adds the suffix '-unknown' to the version number.
+#
+# This .inc file modifies autogen.sh to:
+# 1. Replace beta=yes with beta=no
+# 2. Replace tmp="-unknown" with tmp=""
+#
+
+do_configure:prepend() {
+    if [ -f ${S}/autogen.sh ]; then
+        sed -i \
+            -e 's/^\([[:space:]]*\)beta=yes$/\1beta=no/' \
+            -e 's/^\([[:space:]]*\)tmp="-unknown"$/\1tmp=""/' \
+            ${S}/autogen.sh
+    else
+        bbwarn "autogen.sh not found in ${S}."
+    fi
+}
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
deleted file mode 100644
index fc7d964ec4..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4d8cc1982273d571b4e80fe981878d0fa5884236 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Wed, 16 Aug 2017 11:23:22 +0800
-Subject: [PATCH] autogen.sh: fix find-version for beta checking
-
-find-version always assumes that gnupg is beta if autogen.sh is run
-out of git-repo. This doesn't work for users whom just take release
-tarball and re-run autoconf in their local build dir.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Rebase to 2.1.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- autogen.sh | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 9f91297..116fb7f 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -270,7 +270,6 @@ if [ "$myhost" = "find-version" ]; then
-       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
-     else
-       ingit=no
--      beta=yes
-       tmp="-unknown"
-       cid="0000000"
-       rev="0000000"
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.5.bb b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
index a30dbac62e..cbf0988953 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
@@ -13,10 +13,11 @@ DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
 inherit autotools gettext texinfo pkgconfig upstream-version-is-even
 
+require drop-unknown-suffix.inc
+
 UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
-           file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
-- 
2.34.1


