Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07BC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 22:12:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48.1648678326074458077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 15:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GRSAC+u3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=10884e0209=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ULnKXa019943
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=z/oZ9oFCWqjdyxE7l+sS5jegAfcIqKiFl793YiHwCyQ=;
 b=GRSAC+u39xZOWLVkST18knQspD89QkXRQE+o7ZqAHWtxWl+0qREBjPcuUn3195mTmisX
 X5N5WFAVse6L3iDrMD+ldi4Z4pqdcpURykjaX9elPIIwiAJ+UaeQkLbq+Y0wYhT0/0Et
 vtwszR8GFpsYgFsRynjJGXkIdBSh21opvEQPRnvhGZYMaPL6fsRFYCcydECJlMEVmmXS
 65ahJRaVRFYtoZet9BHYYY55pVKIA7ewIeItfrpX7diNeCOkCwtVC/qiKq/FBzU+LtxS
 R0N8DNXkWmXddjCn+cCfiKyV0wzzHx6JMqJJcvjjy7rPeSpNgbCGmy+kUDMuUbIL2m+f wA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r213x43-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:12:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3QtmjFHHrpD3CFs0XlolAMeS7BIYJ4Es0CzkNZ0RqQ/9RmXV9v5cpoTZK8llVUDuMuvUwH7nIP6gv7GUibRbhmy766UxWiz099N5cEwZ73Oidkn4clg3FqJxxHrsY6vf4Ktvo5hKlTD4VW6Y+Yc3QPIJN5euEQ7mwH/7nfjZ8XwXopK+UVki0eRn1xZLBvGefNOigi4N8rteB5ZQ5WREQz1SHFTJkzjlAr9yN/8CawEgOIILOnNXx0N8fIVLn1gTPvWyNKOSGFs6yj19kBZYtqXffzUzMjP3/ab+HOJ2cRZplP3T42vo1xbvydedn2WWrfxzb84vQQVjkswBqocvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/oZ9oFCWqjdyxE7l+sS5jegAfcIqKiFl793YiHwCyQ=;
 b=KcqJwlZMrsOMmiX5/kwM1KrEG3ntZ9mhKhwEmEy+19btz0wCcNktc/s+PXVyt4KRYKYzGccUHT+DkM1cJs9g/wSZ28GqFP/qKaMxsb6j3RFTOURIl7MHy2x8G5AU661d07Qw+jhyUEZlJbyz8PnL7IcF2y5LkPwSUHCcpie4SY7HmthJ70P2Q1YNL76uu/Y03zxUT989f5GJkmCFxN2A6ru/m2ZAcr/J40PiACLvNE4bgHCAuHMFuDVvM102fMWCbM/gBQJmPzE74W8FdAf0HOZSMkuI0tfgjm5KRoFB5eM0BUbg4/JJ3qWaFgOqiw9KSUOnhDZk0P+tQeaoiMr8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Wed, 30 Mar
 2022 22:12:01 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5102.025; Wed, 30 Mar 2022
 22:12:01 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/2] kmod: Add an exclude directive to depmod
Date: Wed, 30 Mar 2022 15:11:38 -0700
Message-Id: <20220330221139.54366-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de969988-c0fe-412c-c5c0-08da129a50b3
X-MS-TrafficTypeDiagnostic: SA0PR11MB4591:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4591E0BEE225D3CFAB334C88EE1F9@SA0PR11MB4591.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YdGCGAfPcOdKWSNulp/HH4JDWxA9yOvQEKcHByT5Io9R0lD2wGqINmKM4C1WC5Zoh8Pu89SZP+TZQIZUwSg5zsWA7LJmRqogE8W7BHk0OG4B00VW5LELdPmrPcFdlMHoPqko/0RrzjUEX25n29aoF3t1/kEPQKRjiBEsrwuNLmPrIe18P0iW7pMX3i7Ka+n5wv7AV8u8UTnnzeL7QfGBinm15EsFl7e7gtO9ejd79B7/6cHMyF2yGqTSdCapOnm4bmr35AV212E3gK/vQtEZ5YHy0y0ky06q0nQ8RUPai99SYVqgSk4GUEdYubbA/HGqCE0WNvxTDmiJSw+gdPynTs1zvE1C9ec9mSFGfF8xw4ao8UcTBVFgOJKHeR66mlPkWZg2VEK7BBofUj0HSP87ss366swxfDVUOOtdIdrf3EWiURuHa3/osPFNPD7YYDl0JtshU4+fGm5U3JBxBMvy5j1M/6dS6le8v3hxQWbYQI7cIi0g40uZ5Sryii4FtoAyULIgPjJBFvx6Kasi163Gs5E1m/EhxBmFzNb+jz34wsW258R/eGhVvFAdrDT6BKB6KtvX5yH/EFyqr7G5QszxAmnoDgM8EZluuuMKb/wDBHI76vmk/TbjhMbnzkfE86SRSUJB0u330uy138nNq9IoYqXgA+03H3R3JqLyAPNtwr6q7c6hB88AmSHL1ckxW5XrvcN4NdJ2e9Bp16ADxR0lQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(2906002)(38100700002)(38350700002)(44832011)(8936002)(66556008)(6916009)(6506007)(1076003)(107886003)(8676002)(4326008)(86362001)(2616005)(26005)(66476007)(66946007)(186003)(52116002)(6666004)(508600001)(316002)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xdozYE38rMu5yYQGzKcHZvlmHkxAFFCedjzichvx8EziMt0NhbhjCsf76yGN?=
 =?us-ascii?Q?ungXJdswZilVeIR+8MsvoPffxaacToo3O8gkz80emMYPqgr95tp6eSi7Yqvs?=
 =?us-ascii?Q?Kp9U1cvX5lzI0WQ396ZpmbLHjdICHc7mdzNpfijfFOI5Tjf+WzwPB1UzdfI0?=
 =?us-ascii?Q?0CsGlg44rBIdbw5yJQapEDbPgh8m4onk8pW3NsbFTWtvH20cXUj38lRgoB06?=
 =?us-ascii?Q?n9JKFJHVYBlv5ZSq+iEFQkTRcJmYf1mJlMWnyluxbVTFam5OVN35KfRUERFE?=
 =?us-ascii?Q?SX7XG6RwxnkagNEwkaN1dvnrvvUuaxArxlr65MoESKHAzISHe7r/vPTgI5wz?=
 =?us-ascii?Q?rQMgojf9nfQTq+FH2LagioNJsH4RURvOD22lTwfzSbFGxCXI/0DySCTv+Dss?=
 =?us-ascii?Q?B6dKZAJh4+1K1C7TetZcM2ekvfv5wre4V23kf1N9ZZiGvtwqDE+NMu8TAznz?=
 =?us-ascii?Q?GcF3bGGKDd6uElrHINene8ikVgpwOe4PmKB7y8/eFhZ9HGDlmeQGP8f7we0u?=
 =?us-ascii?Q?HbmWy0twLikkips6+sulcHpf4PSXLX3WowC0WtSUTDQKOG64TN/svTBu3eHk?=
 =?us-ascii?Q?NGMYY4qnUg5yGHRhEVWhLYtlHsjwQAunMlUUB7EMs7QDuFX9TgVnq6porrq5?=
 =?us-ascii?Q?AUIuRYSpnzyQX3FkXgLYXZkj1fgU1b3FrM9AncpBV1xqWJvGq1LA3V3gbJKH?=
 =?us-ascii?Q?gRXdnRJYjpFCBbWPfWj218wO0yTmUxf+89njqClPuki4Q4AZGjCLCUhkXlsw?=
 =?us-ascii?Q?SHC9tSaCb5HNDuLEIHtUCYtMIZlfOB9/M9tpvs4tW4O1xGqPs734Q1S5EmWV?=
 =?us-ascii?Q?eU0IiPkc2+0mCnIZSkyaFq4shSsA8bgUCIxHsgj2hvWjjPrjb089TjDmaKw2?=
 =?us-ascii?Q?vrfGeJqRuG2xb5kzXHxwyyNkR5WGrTFdZaCzExkzCix3brHywCYVZEHz+Q5z?=
 =?us-ascii?Q?pXlxTZBdev0d69jmpSk8L3qSRBZfjli179Mp4LZ6rp5Ic0/jXo7WLLQQVPBk?=
 =?us-ascii?Q?rDS+W/NhfLeooMWdmk5Zxi5M5U/rjNw0jmX5jNJpF8uePZvKWc/yfiQCVvbx?=
 =?us-ascii?Q?S4X+rwxBkZ9T9PmghTD2q5o9UmWrFqMX8iRAVBC14Iy3EzcZf8+M0MFp7BE2?=
 =?us-ascii?Q?pNjqYPhWBCy8S1u6nbMRJQAUnu2oI4aIlgIo/IxURPzorzkQNnkE0ggPej5B?=
 =?us-ascii?Q?c2UhHbx43GvOVwh24FWKY6Ro6nwPtOrzbjkx2kvMnRmCYlq0JUfJxe5YMFr/?=
 =?us-ascii?Q?Y/UzftJYoa7dCqQzK/q9m+pgNmusHv6KHZuX/Mr016V83WipR0IQkho3BpRN?=
 =?us-ascii?Q?e761+Epa2dtVoYBTamJELRhHMCpN6vm4TMAt1Y9qCGFA82sn5YLnAu7Jzx/N?=
 =?us-ascii?Q?sQgZdaaAMheR6IxKogaAj7opip3pQGl+6epehxsqD/Ujdpp5P36k5sODmyIi?=
 =?us-ascii?Q?LcVuXkVaZWv3onbjcpaikiAd0hm5gcPKJjo8KVmqc7DSYrRPQGXa1IMW3027?=
 =?us-ascii?Q?YXQO8kBTKd+h7V7fmKFU9rdBTHMG4bdNsCf4S1JOJDdO9wUbZCIeNrWT3zh/?=
 =?us-ascii?Q?Ib9uHyxnseK6O6D+Xk+9OH1nLYtjg0tY6bR0XjMMZPDgdLdNn78DH2DEzuwU?=
 =?us-ascii?Q?CuHPjPM4EY2DJMtPSIkJn7BuWmf4Qvn7PKM2v8wKvBkh+JMgoKyQvGdk0y2l?=
 =?us-ascii?Q?NnwG49mq0RvWhvZqsPc9i6nPh5iPoF3UT6dpGY0AbDgRCVggVj4KJa5AXjTr?=
 =?us-ascii?Q?0pg+8cqj3Px0VqnVKQJimS1EF81qqlY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de969988-c0fe-412c-c5c0-08da129a50b3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 22:12:01.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6gTibARfPUmiMYlB50Zbg6A3ZhuEl55YsZOiZp/eLphtZekAKUfxWRqs1LtMiS2j/43QcEDaXcIM9nmI7bgxjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-Proofpoint-ORIG-GUID: cWr3STOXXeOjL5VEupcPVHHKd3h1ygB_
X-Proofpoint-GUID: cWr3STOXXeOjL5VEupcPVHHKd3h1ygB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:12:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163795

This adds a new configuration directive to depmod that causes
depmod to exclude a give path entry like .debug.

kernel-dbg provides the modules .debug/<module>.ko files and
when installed either directly or when dbg-pkgs are selected
this can cause depmod to fail.

This patch will be submitted to upstream kmod.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../kmod/depmodwrapper-cross_1.0.bb           |   3 +
 ...dd-support-for-excluding-a-directory.patch | 158 ++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_29.bb           |   4 +
 3 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 04fc14a6d21..aa23ba41276 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -16,6 +16,9 @@ do_populate_sysroot[depends] = ""
 
 do_install() {
 	install -d ${D}${bindir_crossscripts}/
+	install -d ${D}${sysconfdir}/depmod.d/
+
+	echo "exclude .debug" > ${D}${sysconfdir}/depmod.d/exclude.conf
 
 	cat > ${D}${bindir_crossscripts}/depmodwrapper << EOF
 #!/bin/sh
diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
new file mode 100644
index 00000000000..3f16cdf0574
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
@@ -0,0 +1,158 @@
+From 8bc07c3ba3a412bd6bb94ad8bad0d76801ec2c9f Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Tue, 22 Mar 2022 12:11:45 -0700
+Subject: [PATCH] depmod: Add support for excluding a directory
+
+This adds support to depmod to enable a new exclude directive in
+the depmod.d/exclude.conf configuration file. Currently depmod
+already excludes directories named source or build. This change
+will allow additional directories like .debug to be excluded also
+via a new exclude directive.
+
+depmod.d/exclude.conf example:
+exclude	.debug
+
+Upstream-Status: Submitted
+
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+
+%% original patch: 0001-depmod-Add-support-for-excluding-a-directory.patch
+---
+ man/depmod.d.xml | 14 +++++++++++++
+ tools/depmod.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+)
+
+diff --git a/man/depmod.d.xml b/man/depmod.d.xml
+index b315e93..9ab790a 100644
+--- a/man/depmod.d.xml
++++ b/man/depmod.d.xml
+@@ -131,6 +131,20 @@
+           </para>
+         </listitem>
+       </varlistentry>
++      <varlistentry>
++        <term>external <replaceable>excludedir</replaceable>
++        </term>
++        <listitem>
++          <para>
++            This specifies the trailing directories that will be excluded
++            during the search for kernel modules.
++          </para>
++          <para>
++	    The <replaceable>excludedir</replaceable> the trailing directory
++	    to exclude
++          </para>
++        </listitem>
++      </varlistentry>
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/tools/depmod.c b/tools/depmod.c
+index eb810b8..8b19ab6 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -458,6 +458,12 @@ struct cfg_external {
+ 	char path[];
+ };
+ 
++struct cfg_exclude {
++	struct cfg_exclude *next;
++	size_t len;
++	char exclude_dir[];
++};
++
+ struct cfg {
+ 	const char *kversion;
+ 	char dirname[PATH_MAX];
+@@ -469,6 +475,7 @@ struct cfg {
+ 	struct cfg_override *overrides;
+ 	struct cfg_search *searches;
+ 	struct cfg_external *externals;
++	struct cfg_exclude *excludes;
+ };
+ 
+ static enum search_type cfg_define_search_type(const char *path)
+@@ -580,6 +587,31 @@ static void cfg_external_free(struct cfg_external *ext)
+ 	free(ext);
+ }
+ 
++static int cfg_exclude_add(struct cfg *cfg, const char *path)
++{
++	struct cfg_exclude *exc;
++	size_t len = strlen(path);
++
++	exc = malloc(sizeof(struct cfg_exclude) + len);
++	if (exc == NULL) {
++		ERR("exclude add: out of memory\n");
++		return -ENOMEM;
++	}
++	exc->len = len;
++	memcpy(exc->exclude_dir, path, len);
++
++	DBG("exclude add: %s\n", path);
++
++	exc->next = cfg->excludes;
++	cfg->excludes = exc;
++	return 0;
++}
++
++static void cfg_exclude_free(struct cfg_exclude *exc)
++{
++	free(exc);
++}
++
+ static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)
+ {
+ 	regex_t re;
+@@ -657,6 +689,11 @@ static int cfg_file_parse(struct cfg *cfg, const char *filename)
+ 			}
+ 
+ 			cfg_external_add(cfg, dir);
++		} else if (streq(cmd, "exclude")) {
++			const char *sp;
++			while ((sp = strtok_r(NULL, "\t ", &saveptr)) != NULL) {
++				cfg_exclude_add(cfg, sp);
++			}
+ 		} else if (streq(cmd, "include")
+ 				|| streq(cmd, "make_map_files")) {
+ 			INF("%s:%u: command %s not implemented yet\n",
+@@ -857,6 +894,12 @@ static void cfg_free(struct cfg *cfg)
+ 		cfg->externals = cfg->externals->next;
+ 		cfg_external_free(tmp);
+ 	}
++
++	while (cfg->excludes) {
++		struct cfg_exclude *tmp = cfg->excludes;
++		cfg->excludes = cfg->excludes->next;
++		cfg_exclude_free(tmp);
++	}
+ }
+ 
+ 
+@@ -1239,12 +1282,23 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
+ 		const char *name = de->d_name;
+ 		size_t namelen;
+ 		uint8_t is_dir;
++	        struct cfg_exclude *exc;
++		int exclude = 0;
+ 
+ 		if (name[0] == '.' && (name[1] == '\0' ||
+ 				       (name[1] == '.' && name[2] == '\0')))
+ 			continue;
+ 		if (streq(name, "build") || streq(name, "source"))
+ 			continue;
++
++	        for (exc = depmod->cfg->excludes; exc != NULL; exc = exc->next) {
++			if (streq(name, exc->exclude_dir)) {
++				exclude = 1;
++			}
++		}
++		if (exclude)
++			continue;
++
+ 		namelen = strlen(name);
+ 		if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) {
+ 			err = -ENOMEM;
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 91951edde16..9b663490666 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -20,6 +20,7 @@ SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
+           file://0001-depmod-Add-support-for-excluding-a-directory.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -64,6 +65,9 @@ do_install:append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
+
+        # Add .debug to the exclude path for depmod
+        echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
 }
 
 ALTERNATIVE_PRIORITY = "70"
-- 
2.31.1


