Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EB6C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:45:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3727.1785494618663576739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aVJLA+zH;
 spf=pass (domain: est.tech, ip: 52.101.69.59, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVbQmPwlAEl3HEhwiyMyzV/iuE2avBzvBitIesBq+o5V85W5voWhE0+F5mr1vVH8BKPFMYjEqUQHQ8vQPJuIx0IlcJRT9Pup5MHb5uoK5prTvuY7NrfjeRsGYguiqc39A/cQMR7I6vWW2uidgG34ykBJha3OY+cjKZAv4z/VWn7fuMIUrH5n1ijqryA9Qw3S8PTXXAq2ZWiQEsOS35jI4qLRfoQJwLlG8lUYQR8773KNRTyDTcQpun3axp/Y4ERgPI2Zzg+2/pyaTciy6rIOBkmQ8fi0kvhhg7JmQXKrUZz2emfHZy9R0CTukSm5MY2cDpG5MaDK+WQStOdzbIZ2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hkS5H4sGRR+fe6rLwq+gGckz7xrdis/Lg5sx2lhyFU=;
 b=vpRBTl3N80W446zdsdPoFwxaDLRYUI8j6pVlZ9RccVgc8O+LkpXgQl2pAB2QK7qKIf9S5QmRMopmj8nxwSzpGuGxWHl8vckRGxdGVQ0PUa+znI1pWsWNa7r+qL5tW+bzzsd1QAu/pcBdV10zbFdMP1T1LHpVUzUTCEFUEAjAEADGVOR5JbMXFynBSTd7nsS1nhfNzI6wjbHHh+GtsXVBvryZjDXZSx3fJNeSyh0C4msz+0HBjST8NYtal+B7p08SY7QWWa30DyKUUs74vJyxpiedtrp6EXRNxVZpidFsZ6OWS28sNOGhqK5gtqb16nr4b0VV+3ZWavbeyzLa6I+kOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hkS5H4sGRR+fe6rLwq+gGckz7xrdis/Lg5sx2lhyFU=;
 b=aVJLA+zHBSevkiDu86PuaR6Y+KXHENhEXXYuqpdbixgTjQ8auzPy2TYopZMdq/FfyXKgHavuswhTH4RpO80wOdEYSSuq3FekPN2F/10M1OWxM7TFNSYX+lSgdmu7nn/7FEHjrmlbg0kt49uy54cqkakJGamvB8YAZCtJQp6d+r4jELReBlIHyX4UcLL2P+z/+NXSc5JrIzdrjWG7Ku98aNqWQqXBzNG9aOKEo6jpUejvxFXsCmeh4UGzhZxVAK/wrtliqnNDdLzNPHGCgYBqqnR9m3Ip4zsq8aNCY5uUdqh88zfpNd5YiQaupqljbfy1kBbInHd2Cg1A9+Fo4ygxJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB2294.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:548::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 10:43:33 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.009; Fri, 31 Jul 2026
 10:43:33 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glibc: CVE-2026-5358 add CVE_STATUS
Date: Fri, 31 Jul 2026 12:43:25 +0200
Message-ID: <20260731104329.619426-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO2P123CA0108.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::23) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB2294:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d8c597-980c-4733-b1f4-08deeef0919c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9TBgboRKHCdqNmDpLSpZvZJn/qG0nH0r0brN+F9lFDwBa+DuNzc7zN91uj6KcylWlyCESLJLTUvVuur1UVAVzJHa9ar+umBhLKYjjbrZbBkVYqefMb3KvgB0NeayYUy494bnpzCn/RwA202zVK6P8eAdWcquwQmM4DnEwCJIuoXDpLtjN75FhHUF32/tkQ/LMP2EX9IyTUxhHs4M36N0O58bz38s8Zne4+Y9WHr5xnrUlMzbTO1pS6FGFYydAi3OmegVazUmVOqoIjDG97bHP7cg8JMrO8w8dbZkptsCYweZRHv8S6ekPn0rrHjpRiP+PLna2WsRGB95mc3zzNy42asQu5lGDc3lKZMWi4ZI65Mif3XywfoULKpnALis6cNvQsJyoctt+fkgZvvnFvOwA7TeJFe8ahVtuNPrH9MVDM2e6kvGDO+lZ+CSqjlG8tSS3QFctlHQ45xCdhIyYjMNMNMz0/rT1rGSq9MJte7PUT6D5OPTbMxLPZiU8zmCaSLf3y/DXQ5Pw+efARfa5Zeh1Kx3oyESugNWnUmHw53/O0+ZZAEhHoP2Tf0kkvIXtvkTn09JmtjvTrgbE95vmLjw5jetfv4PjK1VM5dLToeN7jEKWeROgh8cWrcir1IkwGqNdX4QyiwdJSSEYo3iznoHPPYeu8jrP1lExgHA1oiKaZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2/L3aANU2Bp1xfowo7YZFIASu6cBSTfLlZmR5dBPumbjEPpPCDohyQtUqZV7?=
 =?us-ascii?Q?iRPJP+pdVmXtKKoRDoRDn6++1BYOx8uCJV3xaEfuLzB07AXd0kQTC4Afx6Vd?=
 =?us-ascii?Q?xHl2PB03DluKySko6cQNo30p40nd8AX1bJi21J6tdVDOjQAI4rX8mar3ac42?=
 =?us-ascii?Q?JrBlMc6oVMCY/zNdtSoUnWZ4dfp8Iye0IoqWTynluMhtO0oJlysdiUYPRh8/?=
 =?us-ascii?Q?kIPPXTIstj/S3arwOy8UcGeNSvaEIlAVe8JEke9WatGNl6LM/JyWem9z7RO4?=
 =?us-ascii?Q?sUWQpT0L+I7qqueHv0196mDamqV0b4ImuG025sd4fUQzg9K2Zqi49QMOAt/x?=
 =?us-ascii?Q?R5yJOKiLl9l0NG4qn9gwF/g0KHBdpFj7XhHhqTfj/UbK6kpzBxQp7BRxz0ed?=
 =?us-ascii?Q?axxf01ThCCQWqu3jB/bDRlLL2saE3aCtSlXSD0VuBodr3Y83r/hGjUwUA2QK?=
 =?us-ascii?Q?dUq9qhUOrhrtGJ1W9DueJjwZDMc/c26buLzpAPUzIR/ojJKkab5apHJtcqOq?=
 =?us-ascii?Q?sW23kDQCZM0pc7zVBZLhcfddEYN+uie5mdkpIcwFNoHZLcehNO2yJ/RKVMEr?=
 =?us-ascii?Q?2OSrw7PHdDsDWpSu/jHdBX1sweQDkRo6x/e2FgTY8QUBAKFF8OhvL0OiNZd9?=
 =?us-ascii?Q?6VmgIxUhUmCcOzOC6PFkYfki/OJjUkG+fFBDwbuLLJGSz/VQm0ztTTDXFFIH?=
 =?us-ascii?Q?gmPSPZ1X18UUJlU2LN42BOa7xPxl8ug0/3EnfSDmqWGDnqmWHE7FipQMQ/Y9?=
 =?us-ascii?Q?09fmaOcnRUnwRBWGv1wNE2+pN3wZnE8WbKajurnXeBEGWpZCVlfs/Kc/lwdv?=
 =?us-ascii?Q?ZQlr8bC2bGokxRmlu990TtBcDsPfxxo5Jh++8Io+eMXPxQE9oBWoQ4ytDO+V?=
 =?us-ascii?Q?08oSBxWO4A5fqFrbdFm3+0VX8wlkISvaN407BW00fX1Hh/S3q1giZU8RZbcM?=
 =?us-ascii?Q?Hq/2kLO/4XSSjJwtiLJqK/vky/XkzFE7TtJjEoYGhnJYKnpYKx1P6P3vnPJG?=
 =?us-ascii?Q?HFhOYwgJRtI8o6yjfyMW1kSqLoKGV1KH3MKNIWtPHmL1lbB7kEDKrb70KzBU?=
 =?us-ascii?Q?1Lx84mwkPMiUHgdE+0p/zJ6EYkLQvSry5XO5vIUAIBpHv0aMWoYRcNvqOyRh?=
 =?us-ascii?Q?ZXaFToL9yEbHy7xnDAcT60WEk2Z/5sj5vfMo9LVAvx2A4FKJ6+wiALstoUSq?=
 =?us-ascii?Q?uZoA/UPzdBNKmO26u1GWJDBffViqmkFVdKhGBV0Qo4YMAluMxGW1hGE7Y21f?=
 =?us-ascii?Q?xko+64kpk5RNpRUI7ucTkfzGiOUO3wkk7Ykbdfuobz+tm/2IpSy5iyJUxJso?=
 =?us-ascii?Q?NC15e3Bkg5i3hMQP0VuqEQJS8Ad2VVRk+rMQMNQDe90JNnnSiK8b7+8FAyvX?=
 =?us-ascii?Q?6VoF+wD52XL2QGrTiLTQ3wwSbCwLHN3ZMSrDt0RZfTMkTBfXWkU8ock2px9o?=
 =?us-ascii?Q?BITK6MQc57pajEvZXUPski/l8h/ZCLS0LbO7Z/CRvBI5c1OEDZNlfkgkGKhk?=
 =?us-ascii?Q?GWU1gB7N7dGaGXRWRA9hcavfyCH7PsCi0I3BzMsaORD5Qmj0qkhtHgwigUN+?=
 =?us-ascii?Q?WI91XFEIVFhz61uNN7THBtxLvT1K+ubHw9JouX7wYQKtHnOihqrJ1bJ/ZMZz?=
 =?us-ascii?Q?oca6Ci5E5Q9vkWiA7dFVt5pOydMe0i6B/1GmmKQfl981wmFAgAlcYM2ZYt7O?=
 =?us-ascii?Q?G06uiLooT0DyOxIpGkz/4jv2hmDP9TyI5KSBHhYDSmf63089tKEYVRqIWOEh?=
 =?us-ascii?Q?s39isasZvD+eFNFlWMIFZLb3mlqW5rDKc28Vf17TDt9u/6B3KAlgfKBco/pN?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	gdQG/2rKHkB7kt88Grq7Ql2viU3Gj5YXmUNa8/l+WXqEvRYcbXc9dGk2
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d8c597-980c-4733-b1f4-08deeef0919c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:43:33.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLxNvf2AxtW4jMg74qKPwHz9VtIUGx6xs0Kd7/8D9mIU1I8tRw+HpQG0JrDfVs94Dwk95tcT1Vi5zQAH6W1hgvQQF2DS4TZifh4qgd7GPwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2294
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242424

CVE-2026-5358 has been marked rejected.
https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067#c6

https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-carlos@red=
hat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e

Add CVE-2026-5358 to CVE_STATUS_RECIPE group as the CVE is disputed
by upstream glibc maintainers.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/glibc/glibc_2.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index f6be1b5fc9..b2a8b36065 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -5,7 +5,7 @@ require glibc-version.inc
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
3
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
4
 CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
-CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024 =
CVE-2026-5358"
 CVE_STATUS_RECIPE[status] =3D "disputed: \
 Upstream glibc maintainers dispute there is any issue and have no plans to=
 address it further. \
 this is being treated as a non-security bug and no real threat."

