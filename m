Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D84C54E41
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 08:57:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8494.1709024263475557744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 00:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=278765d1f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R5Buvk028836
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 00:57:43 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42phc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 00:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRAH7YEN6K4OtP15icD0e0lVOfaZV9N3L66q4BR6sQ4HvydhXeHdOmUkLAL7fG7b3eGYm5MlUGVpy6TYGH68vcbztTtxkPWSePyrQ1pC2HWWJL9x39UI8vZ0g1D0WEiYbLPnrWFivx/QxGdKCIw9QVFa3UfSwsxmx/xmtRBxjDi+UULJ2iLeJzeYTPDuU82EoRyp+yn6vt3Z1hqSNINK8N+f0jagv2IjDrbdi751Xk2taWeo0h5kJkGl08Qu/MiawPNelkOoA6AzV3s71auyenXK58XYIDtFV1qe0RVrRa/qWdcTYzSldUEhD/W4FlsNWd7QFdxIDmn/ZiUsNDBUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFK0xjjeRb3Dmjf1fAIHuje45iY0snAWzRZC9UZ5ABQ=;
 b=aJytCQO7vsQPhIXLIuDfWfPyYMhcBuD5YeEQ2l76YUgXGyZu/eMSDzj2yyjYXySjqzoFn5hdL+f6ejBKve6meXaqMpM2sq6CNfqY9f425JcxyVOuyvnjbncLzBKzetb6Kz3Iashf6ZdfRyWoaMPYtvX6lkxDN+937kKHX5a+LgTTIyheaRoCVnZZwIyygyX+GpgMrwQpwhGcBZmCutgfrLHQln7MwYfHDPChyXOmGjazTsKnZzu3MVjzdcwb5iiUfJb0r60YIgtWWCywsz+vkigeSH2rAmHs/IizxN2iMbH80lb3zn1Zj4kJBhjCb1TxwbKww4D1XPds8+CuPxJA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 08:57:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Tue, 27 Feb 2024
 08:57:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] bash: fix test case array.tests failure
Date: Tue, 27 Feb 2024 16:57:22 +0800
Message-Id: <20240227085722.2025994-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 542ed612-349d-4027-e1d7-08dc377227dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6KmOEaaZCReTWRonkgkCUTxd1IswooSQ8Sc5L2aOVG6QB7o1GbiTOMYFiaDaBfIuwDOod70A7+Uz4i1e95Iji6J8J+sEoM/9pij2TARNPmBit+hFtYb+qGTXtvpF6hHzdgK2z03XCwfBnV0POCku+RTA1dMS9/cBv6BPOHWaVYh2p229qrHD8Kkc/YETJo6XnPfT4Q9+SKjePIYDutDWcreTenioSu66PCI7YPDH4KjnGjM6q1J7hGqVdl/PWz/oYoJjHFZuhODsjoXWeYhL2S0nJRtgD0nx8cyT2w8dce3lpEeXx05z7Ym9v0PZVLVmVZ+F+3fM6uY56q7Ja1KXbJF9rdABD8DMqr6i2wn7Ai+X2P4elVC6L3WFgzOC+cRpdoAQMZQOjRp9PpsuD083leEeFgbq3yzGl60azi1v+IvbyGUqOYlPVXtiwlfVqgAt5qCARdnO6foq2nQR3wHIka++xtQyavaRfschzvm4ItG6m10AyYCmgh/PTXHmQAu1AimIKZy8GROKv7ViPtfal0WIoxSAynAExlltfA0Mugr1WEDYeBA8SCXmnjMcLrL9VUhi8oWTK1sRzB0+j1+EoWAucBSUuhk1ekY4q4iVuRCfJa6m6b6WChO66dNcrnTRWqnbqpgLUHKREpVjspGiPh6BhHM7seSJo+e8FXiU0XSgExElYxVlWyRt1ee4QSmDPbJF1SJn4trmxPrb/YqxvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MqUUBesTs2mZdvFNFqLfQ2E+8F6o8Xg8y6M7usg8G78eDj4M3Oo4dHBeLqec?=
 =?us-ascii?Q?dWfRyk56zMxCoT4oqqXusIyncXweaVNhpPmBnZYWJL4b8qzQku7AND4zMfM/?=
 =?us-ascii?Q?aUfTbBwJOf6TdbWPXoX+3DY95R71LrPn39G7H7Euucibr7Ov+fJX55v7v63R?=
 =?us-ascii?Q?kPr/Dki51AiaTJKJpxsKOkz0+9ItK9DC9wzX+7VtOP9f+5PE18n5v4BIL0I6?=
 =?us-ascii?Q?NQuxi9OEiPoBh9PkfgzyHaOvYhf9zdNoUzQtmMB2zbKxaJcK+QNI2iucoUee?=
 =?us-ascii?Q?nhjJNeRb+axDqe8baXPit624qnaoxbySt7+onutDhM9lrxBpc6RGBhDLn8MP?=
 =?us-ascii?Q?4aTFevCPqgQmba6XB2pNzspxmdoxr/mPKMFhSSblVoQeOg5xuZ1lL64p6/0j?=
 =?us-ascii?Q?mxMzgSXiDmw41/OYJZ/JL0OEkcEn7Sep4YaiWGHujVcoT5BXRtFdok+s4rtE?=
 =?us-ascii?Q?cl5Mjax5NmaXUYHi94MX+YJ5ap8Qj8Uv9Zx6eiiyiYGaZjUU/+vwYeseovsb?=
 =?us-ascii?Q?/Clx5WwE4U0XXbCAC2LX4I8HhFxOZ89X9SSccjWUvrEOltcbGYcagUbk0I9+?=
 =?us-ascii?Q?X7EPTVECCoUuUABlTvM2QPY2JhB/yAj//BJzn9+yfKFWITlb7vNGW1zN6kis?=
 =?us-ascii?Q?kGJdRwg4166dsd5wae6VLDWFOpVZ0JelfcE5Vg0syMFDIwUacR3bpRR0u3mv?=
 =?us-ascii?Q?5gUd6SOaJp6eoMkOq1BO3u61w1h0M6EfoqsrwXIDE/p9j7H+Fx3HC3z1DSbW?=
 =?us-ascii?Q?M0cUVKd7GNGsSJT1P8wwk9uGyCqKPQ8aicrxd9ShfxWMMtHJ/kqIBHP+n0XF?=
 =?us-ascii?Q?zDrWUTyUdg6oX1xTmIL27udmYvAiAQaLQAxTPOAYrqra2NUFpCJbAjqha1OU?=
 =?us-ascii?Q?ZNzhFV55nTppDECsqvIucoW5Szs0jgIjkjdPPN+9khJ58wvvI75ok+U1wLJV?=
 =?us-ascii?Q?rnFiaKbuCjauCD21YZStGYkZC3LUvjiIqUqaQvPD4oeRstNnSrdlUjjRUB11?=
 =?us-ascii?Q?KyXh2Bl9kzVyYJLXUhBUyuT9pNun7asJHQ2aRQXjI9ahPAeKQPCg4+q63OE/?=
 =?us-ascii?Q?U4twS5I7McoR4E65dnMG76s9HmoGWXSB9tGNlF/q7/xJdYJS+DESdOmT/h78?=
 =?us-ascii?Q?ElnefW9ApB54OS7yG09xVCJl6jL6P66KRgL9dmR0DbdO8/sX3JDISYLY/wnW?=
 =?us-ascii?Q?vMAhE9oMgRbMmTSIAAAV7SZsPXgMOYBZTkiROBH21pBi9Y7jLb3YYKZWgXBm?=
 =?us-ascii?Q?507sxKK4PwEGtY6UUBJn3Fncd9ye1aKisjECh7EV+GbnlibvZhm5oGxmi47t?=
 =?us-ascii?Q?Nr3Q8ymCcYaGiSa7rBIrHoz6DQlJL7XH+qb16ixZiVeRrvchEKAEHVKZclWB?=
 =?us-ascii?Q?GWj+CESsD5X6BRMowXEBRJiByQ4Z128NuJqs+4Am3KbJrFB2bUvmnFB1WKmv?=
 =?us-ascii?Q?BG76tKLa/I9hDyyaXACt5BaU6OyJNmnEzOEd3+hTU0s/R4XhF3dwzJDocraQ?=
 =?us-ascii?Q?2ecbuErK/zvwYY5RQKptbYxQfxGqozoS8a6Tv+rdYs3YEE1Sg3twWvSxRh1z?=
 =?us-ascii?Q?bIcjRWOxy7luuNcEZkVCN1CJS+SW/9fn4YjcNgIAVJGchtJIkQVBo+9Lc3ke?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ed612-349d-4027-e1d7-08dc377227dc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 08:57:41.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS7QbJ7xpIGo47GacC3HHjE1qWNb0ZmWOZIfOJl/7DTSyFDUTytevZj8r9C5TCfP+IiSMo9+mgly5gCYoaqc7HB+luZ6hx5xZovQEoyb5ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
X-Proofpoint-ORIG-GUID: tws2dsCXc-3-L_MptzvJu_18JlE1Vmj_
X-Proofpoint-GUID: tws2dsCXc-3-L_MptzvJu_18JlE1Vmj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 08:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196245

From: Xiangyu Chen <xiangyu.chen@windriver.com>

GNU grep started to output error messages in v3.8 (see below) for egrep, those error messages also
records in test log, that cause test case failure in diff stage.

error message from egrep:
egrep: warning: egrep is obsolescent; using grep -E

The bug and a patch has been sent to bash bug-report maillist[1], and got an ack from maintainer,
but not merged/fixed on bash master repository yet.

Ref:
[1] https://lists.gnu.org/archive/html/bug-bash/2024-02/msg00154.html

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ests-using-grep-v-e-instead-of-egrep.patch | 100 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-tests-array.tests-using-grep-v-e-instead-of-egrep.patch

diff --git a/meta/recipes-extended/bash/bash/0001-tests-array.tests-using-grep-v-e-instead-of-egrep.patch b/meta/recipes-extended/bash/bash/0001-tests-array.tests-using-grep-v-e-instead-of-egrep.patch
new file mode 100644
index 0000000000..6f96b4215d
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-tests-array.tests-using-grep-v-e-instead-of-egrep.patch
@@ -0,0 +1,100 @@
+From 423c45a41f044e06857a5a893187e65d46d8ad53 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 20 Feb 2024 02:54:55 +0000
+Subject: [PATCH] tests/array.tests: using grep -v -e instead of egrep
+
+The console ouput lots of egrep warning message, those message causes test case fail in diff stage.
+According the message, using grep -v -e instead of egrep.
+
+Warning message:
+---------------
+9d8
+< egrep: warning: egrep is obsolescent; using grep -E
+31d29
+< egrep: warning: egrep is obsolescent; using grep -E
+34d31
+< egrep: warning: egrep is obsolescent; using grep -E
+37d33
+< egrep: warning: egrep is obsolescent; using grep -E
+41d36
+< egrep: warning: egrep is obsolescent; using grep -E
+65d59
+< egrep: warning: egrep is obsolescent; using grep -E
+84d77
+< egrep: warning: egrep is obsolescent; using grep -E
+---------------
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-bash/2024-02/msg00154.html]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ tests/array.tests | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/tests/array.tests b/tests/array.tests
+index d0bb08b..07452ec 100644
+--- a/tests/array.tests
++++ b/tests/array.tests
+@@ -16,7 +16,7 @@
+ set +o posix
+ 
+ set +a
+-# The calls to egrep -v are to filter out builtin array variables that are
++# The calls to grep -v -e are to filter out builtin array variables that are
+ # automatically set and possibly contain values that vary.
+ 
+ # first make sure we handle the basics
+@@ -61,7 +61,7 @@ echo ${a[@]}
+ echo ${a[*]}
+ 
+ # this should print out values, too
+-declare -a | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++declare -a | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ 
+ unset a[7]
+ echo ${a[*]}
+@@ -92,11 +92,11 @@ echo ${a[@]}
+ readonly a[5]
+ readonly a
+ # these two lines should output `declare' commands
+-readonly -a | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
+-declare -ar | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++readonly -a | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
++declare -ar | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ # this line should output `readonly' commands, even for arrays
+ set -o posix
+-readonly -a | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++readonly -a | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ set +o posix
+ 
+ declare -a d='([1]="" [2]="bdef" [5]="hello world" "test")'
+@@ -111,7 +111,7 @@ b=([0]=this [1]=is [2]=a [3]=test [4]="$PS1" [5]=$pass)
+ 
+ echo ${b[@]:2:3}
+ 
+-declare -pa | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++declare -pa | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ 
+ a[3]="this is a test"
+ 
+@@ -129,7 +129,7 @@ d=([]=abcde [1]="test test" [*]=last [-65]=negative )
+ unset d[12]
+ unset e[*]
+ 
+-declare -a | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++declare -a | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ 
+ ps1='hello'
+ unset ps1[2]
+@@ -155,7 +155,7 @@ echo ${vv[0]} ${vv[3]}
+ echo ${vv[@]}
+ unset vv
+ 
+-declare -a | egrep -v '(BASH_VERSINFO|PIPESTATUS|GROUPS)'
++declare -a | grep -v -e BASH_VERSINFO -e PIPESTATUS -e GROUPS
+ 
+ export rv
+ #set
+-- 
+2.35.5
+
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 46d921bbe6..18b821a29b 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
+           file://0001-tests-array.tests-using-grep-v-e-instead-of-egrep.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
-- 
2.34.1


