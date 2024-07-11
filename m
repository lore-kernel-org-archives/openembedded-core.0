Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC6EC3DA47
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 07:57:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6955.1720684620043314005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 00:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7922740ab3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B5DVwf020873
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x4pvv-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m92DEH7seyl0fd1lL1iEWSwXs2/tnuk4E3gpmEu55PMsITo3tk05NY6rBtpR751BFykYRhKiSyFhcFWSSKuL4O8+ZQbFG71rcxe+OvyClEBo89rNJefXVHdGFY0qfQU89h7XX5UIgwMMEig2PCRdGyXxm9Cl2r9QOTdDFPX+bjucrb5scCE/ExdSgqhlUp3BsS/58o/qHE2BG9siS/yTDdn1vF3K++fsHBQPvtYnMNBmJNCrt17Edk/pnWXhumHAxB+jJB8x2I3y9cx8VQZCyxCAJhd7Zp8/LmLM0pHo1lGDoF7qqGyh5V7Al3FIe/5QlrSJhhUiLg+AGFWXGQrdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQY+poplXZ8tSvkkGwafG1nQS8QrlphsPNFWfSVpk5Y=;
 b=lDdsWd8Topa+ix4eD4jkFusyORgMLLnH3ELSgLJuL1OLDMNpz5eQXHXcKVKeyPS6sY8pMxmx4WXw2m8upO+gvwTNWeFpcaWT15xEwLpni0KfVloSwDGpUZdwN+yyxdvN/gnVBthdMPm7lEedhb3O3t7GSjNOskywnm+rOo9iFrvbKYzXWV4TROPZc4ebjdsA20oAJ2IjlhxMB/7DFwBx0NI7oIb3pGGlQ78e8pEGSMhSZCs2DDT5fsuiqxr5eiFt5Pw2hiwZUHIIkIzV7uw4Im6tGBcRrLxqIjcm731ANLufQXrWjx/IvSIPmLccOd77yUA57AR7H3cOjlw7ikVvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:56:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 07:56:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 3/5] util-linux/util-linux-libuuid: upgrade from 2.39.3 to 2.40.1
Date: Thu, 11 Jul 2024 00:56:35 -0700
Message-Id: <20240711075637.3023203-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711075637.3023203-1-Qi.Chen@windriver.com>
References: <20240711075637.3023203-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 592bb55a-ae54-4d55-83c1-08dca17f05af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RJa0lcfqnQooEDzeUZg0iFKXn+VkcVk4p6LH2g+cQE+ZN4CbGTUhuMik3zi/?=
 =?us-ascii?Q?0/PvhuYFytnHEan9UB3G/M+ym+yoeKcwh3rwuEUf3CbY0DUJZkPPaYPmfSUs?=
 =?us-ascii?Q?ZM9TeK6A1R2QqYQUpoPfmqMIU3kN+nUeq1R1VPJz1g8KA1fi886vAi1DGBCg?=
 =?us-ascii?Q?/xQP6W0kCEsGuqMn4tIBhnQW1q6Yh8xw+ei5H9DUBL+5ODDi3FFquJS9HNwP?=
 =?us-ascii?Q?dWjH1FmNysY0rU2Dq/mUjgoCvWsvCLuuavDQhg7lyha4MwCx17OiTkPyR3vw?=
 =?us-ascii?Q?7wfKWNg7+2IKBrk5s8cPxtuveOVKoqBCYmajZN8wORE78bB/TmUdVoRYu9b5?=
 =?us-ascii?Q?OGvFMmNTZpb2ugAr+9dYrQLNve3PHXyxa+wQG61ZosOKCg+qAwT3dHA4b6LF?=
 =?us-ascii?Q?XvN56wpAKMM9bvnhq3zynwBc3O2xy+oypUjKgUpUM/djONbSiKTRZRExYkI8?=
 =?us-ascii?Q?XJI1ANCLA27pTsOAvffkK1U/G+4COqHKQE5XIUTMvwnwBw5Pm1a1A+96ZfVM?=
 =?us-ascii?Q?1mnpSlM82yqW11w05p2S7t84I2/kYJtwLElTnF4B19ziR9P192V+gfo3OKFK?=
 =?us-ascii?Q?i34gysQfLSrZhktQC9KH2rij+s62luJtsWT0hZjlUh0Q0SESr2756M7Aq2Ii?=
 =?us-ascii?Q?GZiiR49ES2B93tBL/O1b+J7CqDmUm7OgUP70fvOelOpAArHTWtCWFAcRPfdp?=
 =?us-ascii?Q?7nCNvoHrshagRLnuDRC2pEK7LypuHi7YyQv9FbjLtDw23bStB9MexWN93ri/?=
 =?us-ascii?Q?64thACv+yJCNI1Dugs1qwaHCaJIJY48l2AHzcTxvBlZW3NvyCyD2jod3TCGM?=
 =?us-ascii?Q?/EisYU7ZtVba9LnOybltq6EgBUyCt8OOR3r+68z3FwueFFRz9WK7m/Rx7xcb?=
 =?us-ascii?Q?f5/qjxaA/JBa3xn6U/CHB4ODc7WeJ1zqBZipwY3gt9r3NNdFpsiiSmSDvv3q?=
 =?us-ascii?Q?58EnyGnZ98Rw+ThCwgj+saPb7PdwAO7kbYUuKM/W6PJIE5jFnk4gxcdxiR1S?=
 =?us-ascii?Q?ysoPTJyoG6lSGGydj5ywhNAe7y5p8nfgSBIbbqh8MGfQ6m6xJDMn1/nSIR/o?=
 =?us-ascii?Q?c9CxnieMU7+Dmo8E/hyBZxGXNHVd7CU37PzXNOuxDtKp5yp8/etKh/cZQOSw?=
 =?us-ascii?Q?kFCGaX0hoto9VXit1duYJYLciviO2meHGj8TZv6GBR2o0+df9kCzp3G3qkWb?=
 =?us-ascii?Q?ZYMN5oJhfKwiuQBkgnBiHDWdkkUzZKVUZAtI8xO6Ixj91NMLlX4rGSO8icyU?=
 =?us-ascii?Q?fn24KmRgLXm1Cd6nK/YQGdBntyRUcbVyfmZPZnhd5YlnhmmprebTbngbA1ql?=
 =?us-ascii?Q?3abM74oEYWNIUckaWoyzVyO54YHeXVV3fzAO1ng/EQwUZyMhKBLO/mzt3dHA?=
 =?us-ascii?Q?trg2+cQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6eSFeS+eEi06gfET3eMngB0u+jDrvYsi4GK8n4HB9LLxwLDhVoaLxOFQyT4s?=
 =?us-ascii?Q?R1m06bh+tImzaXVVyQH0sAmAX0fNQ7oi9db/SEzZvsdVnJRvURYZhDcaeofw?=
 =?us-ascii?Q?X9aHh16Vk0tVjqkaTPr9dyes6DuyBwM2ICwU47fZLqP6MRkJ+H6cNKAloZue?=
 =?us-ascii?Q?ffLd1Ce46lNPsyId+HrghjgMSJOpBm4EaJkVElpdmYx7jv+ur9oFz9kXEpVu?=
 =?us-ascii?Q?2JdfUoV3wp+GJUC8RxyHjJbXFoRvy0kr3YHeRbu2qhVLErGNhC+SAWC9hBPw?=
 =?us-ascii?Q?a5JLwcms1zW8pQh1R+FaJlngU/7JGRJwmMVLTO7JrotX/ytSWWQ6P22bmBqw?=
 =?us-ascii?Q?jH08Q+8ns88u/wZP8KW6QP6jylPgcNAFS1jqcUVqVxRjst0J9K7LgyDHNY6p?=
 =?us-ascii?Q?OOpQ/h2/LEWnfbUwinMSdXXvRoSk7m6A5yzMqvwleZR1sICObTA/b/p9nwyN?=
 =?us-ascii?Q?qDF+A/D2BaTwcYgt9fRTo5yhzcADjOtgwDoiLrwY5/gg2uo6hpbnTeLKIbqW?=
 =?us-ascii?Q?EHwQtNQqjr7ASZ0a9hyYpLbrZ68/LJanclIpdcdgOcSjG5JJQ1oQDepKMk9S?=
 =?us-ascii?Q?k3UyUXsJkA1r60CdYVdMiUrwwzVw5ShIjMoY4DypRBSS9yDQMeTcEupaPk99?=
 =?us-ascii?Q?5RrORuzNfCtfTApEOG+tQ34Fz96NHk5j/Fy9WdGz7D9AsQk9oBOCeK/C7Yj/?=
 =?us-ascii?Q?gxIFes44PygO1QPmsovEu7vwrX2fsD+6nFta7CbrePnuHRg8obHmI/F7LB1Q?=
 =?us-ascii?Q?ab4pwhPtEObNehJaMFK1vx44Buy4ZinfonVm0T/qLZgbZ26Tz4DD+VlSgkPK?=
 =?us-ascii?Q?2EAb90baX5yMmn3tAYu4l/NaXSeG5tVrcNeMFAKGCb0X+mULqO+oiz2hAsFQ?=
 =?us-ascii?Q?JQvRMvAo9kPHW0ngxZkHy7uyxxITBbPnEZqXGDxjbbDWMTQX3P813SLX2TTX?=
 =?us-ascii?Q?7fgcjTmiR6DyL5+Ip8PlA3SZ3d5luIweCsZgbE95YpSRoy+yMgPd2BMc4C7H?=
 =?us-ascii?Q?dv1nfBu4lePfMoGSL6OZP2stihHWv9nKwiSlZb6NlqwMZcLm56D5wCKTDjd8?=
 =?us-ascii?Q?KAk3eQ+mFmeQrTXvMLidHL5uF97TY6RdOGDZ66gYDBRhG4Df5FP4iKI+tmfZ?=
 =?us-ascii?Q?k5+AJ/i2NA6FO3UVDi9drBI3EGevnvX2pB7mwhlP0tHpiBf4nW8/2NCE7LIp?=
 =?us-ascii?Q?s+iAS8GwF4IuaNPsok3w/SsDVnmgHsCQVui+vqod5Fo0wqdU1mvxvslDcR9z?=
 =?us-ascii?Q?HrDwwXBOKjRUutQVB95wwkpqSinToHTJHswOKMRn0RF5QUIWufxgjhZZ6mwK?=
 =?us-ascii?Q?4UnHy2Qrmz4oQNyA0uFCzMNo9JMTUJZlu/dR/J6zJv8RK4QgTLSPWrmH5xQs?=
 =?us-ascii?Q?b7i7Q5yG49gH297X2yJNwpyu6mnWBuRNJ/dhUS77xPaRr0LPuDKIuURJtajb?=
 =?us-ascii?Q?hNpNmvtD0rhP3A6YvyldEesnBAIy1uz5y1C2YadlifsLUiBR8VJS/QmbXomx?=
 =?us-ascii?Q?u0wq9ns6RW6QRWxJrmmuFDJLEE55/TchSPD6QxmkV/iAAFNq3TbNCC8TblWM?=
 =?us-ascii?Q?W0Sco3cpg6xHz9SqiM3vfns1fzK07zT4Iwjg0Lz8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592bb55a-ae54-4d55-83c1-08dca17f05af
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:56:50.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RYyFOiRCDgskbAPCKcz36ggn2pA9rJq9n3DzdYqGido4FNNyWYubQmTvaF2Ep5OlMGYEFjdvvHVk6wy3w0zDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-Proofpoint-ORIG-GUID: xfDxabTCsTNTTRPIKbZ6qwf6y78dHoZH
X-Proofpoint-GUID: xfDxabTCsTNTTRPIKbZ6qwf6y78dHoZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201766

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
GPL-2.0 is changed to GPL-2.0-only in README.licensing.

The following two patches are removed as they've been there in new release:

  0001-login-utils-include-libgen.h-for-basename-API.patch
  mit-license.patch

Other existing patches are refreshed to avoid patch-fuzz error.

A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
safe lastlog pam module. This is a new functionality added in 2.40.

This 2.40.1 version has the problem of unnecessary remake, causing
intermmittent errors at parallel make. The do_compile:prepend is a
workaround for this. Upstream issue and PR are:
https://github.com/util-linux/util-linux/issues/3061
https://github.com/util-linux/util-linux/pull/3064

do_install is changed to do_install:append, the legacy codes are
removed. They've been there since the born of oe-core. I tested
with ccache, there's no error.

A new dependency, diffutils, is added to ptest. Because the mkswap-offset
test case needs 'cmp' from diffutils.

The tests/ts/misc/enosys test case is deleted for musl. This is because
the test case is comparing error description output and that's libc
specific. Results below can demonstrate the case.
'''
root@qemux86-64:/usr/lib/util-linux/ptest# cat /usr/lib/util-linux/ptest/tests/expected/misc/enosys-ioctl
test_enosys: ioctl r=0 errno=Success
test_enosys: ioctl r=-1 errno=Function not implemented
test_enosys: ioctl r=-1 errno=Inappropriate ioctl for device
test_enosys: ioctl r=-1 errno=Inappropriate ioctl for device
test_enosys: ioctl r=-1 errno=Function not implemented
root@qemux86-64:/usr/lib/util-linux/ptest# cat /usr/lib/util-linux/ptest/tests/output/misc/enosys-ioctl
test_enosys: ioctl r=0 errno=No error information
test_enosys: ioctl r=-1 errno=Function not implemented
test_enosys: ioctl r=-1 errno=Not a tty
test_enosys: ioctl r=-1 errno=Not a tty
test_enosys: ioctl r=-1 errno=Function not implemented
'''

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  8 +--
 ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  5 +-
 .../util-linux/configure-sbindir.patch        |  7 +--
 .../display_testname_for_subtest.patch        |  7 +--
 .../util-linux/util-linux/mit-license.patch   | 45 --------------
 .../util-linux/util-linux/ptest.patch         | 11 ++--
 ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} | 24 +++++---
 9 files changed, 31 insertions(+), 136 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (94%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..0f5f838e84 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
@@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
-           file://mit-license.patch \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
@@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
+SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 6258710e1e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:59:46 -0800
-Subject: [PATCH] login-utils: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-  847 |                 shell_basename = basename(shell);
-      |                                  ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- login-utils/su-common.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/login-utils/su-common.c b/login-utils/su-common.c
-index b674920..3297c78 100644
---- a/login-utils/su-common.c
-+++ b/login-utils/su-common.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <libgen.h>
- #include <security/pam_appl.h>
- #ifdef HAVE_SECURITY_PAM_MISC_H
- # include <security/pam_misc.h>
-@@ -840,17 +841,20 @@ static void run_shell(
- 				su->simulate_login ? " login" : "",
- 				su->fast_startup ? " fast-start" : ""));
- 
-+  char* tmp = xstrdup(shell);
- 	if (su->simulate_login) {
- 		char *arg0;
- 		char *shell_basename;
- 
--		shell_basename = basename(shell);
-+		shell_basename = basename(tmp);
- 		arg0 = xmalloc(strlen(shell_basename) + 2);
- 		arg0[0] = '-';
- 		strcpy(arg0 + 1, shell_basename);
- 		args[0] = arg0;
--	} else
--		args[0] = basename(shell);
-+	} else {
-+    args[0] = basename(tmp);
-+  }
-+  free(tmp);
- 
- 	if (su->fast_startup)
- 		args[argno++] = "-f";
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 85ad7a5575..8ea00dbb95 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
+From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 890212f..870e817 100644
+index 651ef2b..2a8012e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 75adeca188..74abdc2038 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
+From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
-
 ---
  configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 36c24b4..890212f 100644
+index 23594ff..651ef2b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
+@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 815ae9c915..871b0b2d30 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,20 +1,19 @@
-From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
+From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  tests/functions.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5a562a3..098145e 100644
+index 5fe5ba0..a6c703e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -437,7 +437,7 @@ function ts_init_subtest {
+@@ -450,7 +450,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
deleted file mode 100644
index afbec98f18..0000000000
--- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 28 Mar 2024 12:16:57 +0000
-Subject: [PATCH] README.licensing/flock: Add MIT license mention
-
-Looking at the license text, flock.c is under the MIT license (see
-https://spdx.org/licenses/MIT).
-
-Add an SPDX license identifier header and add to the list of licenses the
-source so everything is correctly listed/identified.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
-
----
- README.licensing  | 2 ++
- sys-utils/flock.c | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/README.licensing b/README.licensing
-index 4454f8392a..535ad34813 100644
---- a/README.licensing
-+++ b/README.licensing
-@@ -12,6 +12,8 @@ There is code under:
- 
-    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
- 
-+   * MIT                - MIT License
-+
-    * BSD-2-Clause       - Simplified BSD License
- 
-    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
-diff --git a/sys-utils/flock.c b/sys-utils/flock.c
-index fed29d7270..7d878ff810 100644
---- a/sys-utils/flock.c
-+++ b/sys-utils/flock.c
-@@ -1,4 +1,6 @@
--/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-+/*   SPDX-License-Identifier: MIT
-+ *
-+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-  *
-  *   Permission is hereby granted, free of charge, to any person
-  *   obtaining a copy of this software and associated documentation
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 6221de7182..7345926b88 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,24 +1,23 @@
-From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
+From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index effbb02..7d2bd1e 100644
+index 50ab8d0..7e2340d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
+@@ -64,6 +64,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
- PATHFILES =
- ADOCFILES_COMMON =
+ BUILT_SOURCES =
+ 
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
similarity index 94%
rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
index 2cd7750afc..b70d97a934 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
@@ -117,6 +118,7 @@ FILES:${PN}-mount = "${sysconfdir}/default/mountall"
 FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so"
 FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
@@ -136,7 +138,7 @@ RDEPENDS:${PN}-dev += " util-linux-libuuid-dev"
 RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz"
+RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz diffutils"
 RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
@@ -147,18 +149,21 @@ SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
 SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
+do_compile:prepend () {
+	# this is a workaround for the unnecessary remake problem. Issue and PR are as below:
+	# https://github.com/util-linux/util-linux/issues/3061
+	# https://github.com/util-linux/util-linux/pull/3064
+	# When newly release tarball contains the above fix, the following workaround could be dropped.
+	[ -e ${S}/libsmartcols/src/filter-scanner.c ] && touch ${S}/libsmartcols/src/filter-scanner.c
+	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/src/filter-parser.c
+}
+
 do_compile:append () {
 	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
 	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
 }
 
-do_install () {
-	# with ccache the timestamps on compiled files may
-	# end up earlier than on their inputs, this allows
-	# for the resultant compilation in the install step.
-	oe_runmake 'CC=${CC}' 'LD=${LD}' \
-		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-
+do_install:append () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
@@ -342,6 +347,7 @@ do_install_ptest() {
 do_install_ptest:append:libc-musl() {
     for t in tests/ts/col/multibyte \
             tests/ts/lib/timeutils \
+            tests/ts/misc/enosys \
             tests/ts/dmesg/limit; do
         rm -rf ${D}${PTEST_PATH}/$t
     done
-- 
2.25.1


