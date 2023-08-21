Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59951EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:36:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web10.9911.1692621413791136383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector2 header.b=SAuHpfvy;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.53, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz0SFqqAAy4Xtf8L3h9ZQHhCugm6R0bDHcmabzM39JWYVm/X+3cjkKRnExGgWwMCb4bke7fcSn0OvcMG/d3rvpIosK3S/krkiXuXSXppqGamClwpkq0zoPIgM+U/PGmEbFZ7eAswSubQkhTvTLMkAj44lW8PN+wOM1LXaZQGMUyHb9dlRlfZei7oNEMfWPTddKDglXxJxKb6GW/bb7xHG+q0jSw2iyM7NBx2s5/PBnkDtnBNd8KII+NN9IJwLGF+qXeVAPqueMtYIrsPjGDI6FAITu9bduX9I5jG8qkDz4jfbQEwdBIhXEj011k8M+UtfhtWzBruM3Y155gTaDOwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVN7DjgDHMABnb2kjCELcwbs7j3rIr6GYBvBHGbfXBY=;
 b=HO/pbtZfrOQGFIPT2eoiHtfFWTloZ/ws27y0aEdQpQ15tNBCgzHvYRtJ2aFJ9NfMqnJcmLiTuk3rEeYQajUSjmaB4c6/nDv84YTerxSK75iYMJZPB1Lw3qPepHnDQgnxpKiIFjhuVXvz9dECaE8yNnlUM61gvhzCRhw/hEtQoI1AucjYlajhcmSsFMHMxCOMblmq4ptYpdhjOylwtoKa0mlYAjNDkvhsYF1tVysHijvfTQhMMFSGHoJ4ojTQPWMDBqujo2B3b9in4lBTRVoftgUB+7qbcoNHVheq2jgR/xuFsjajyeyVzhXKsFkb0pa5YlDdE9+MrcgylqRnQc80NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVN7DjgDHMABnb2kjCELcwbs7j3rIr6GYBvBHGbfXBY=;
 b=SAuHpfvynpCS0cKunxAd8AmE0VmpBHSVlsj4aKWJwCsZ4W90MCrSmJ16YSRt9NUtvkScLnmocKKbzS3J65Xo0eAz6UIOUJvr92hbtndFPpdpbS5x3qYkGv0BibVwRJBAX9/l9u6Guyj5iwncu5rfv5d0KmIlPnAVbRX9Vvx6tKq1VDDE+9ViY8DHRfAXv9+AHahTip5oSKCfWKZdWCSz55XZJJpCbXzPCs3KfNR0UIymGCcG4Nvuc1G28yatHYvT4XEyFySnhnNKN7vN19mIubuQafscnoy49c1EPwJ1aiYB6jxn+BjOUKw/G13hChX0QRzPM4cPj+8IjszaGPb5Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AS8P193MB2191.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 12:36:50 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 12:36:49 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
Subject: [mickledore][PATCH] ccache.bbclass: Add allowed list for native recipes
Date: Mon, 21 Aug 2023 13:36:11 +0100
Message-Id: <20230821123611.1448-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AS8P193MB2191:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a1b206-c082-43dc-225e-08dba2434a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/FZlIlg/ie+RPvmoH0BcM3dSzqzvzCZwoT7O/TAjTtD1ReVK0DaWtdRTUMjt6jF6sfKxggsfOlof4KGTXZEv7TI+W92oBKbz0JW16QQhRDGd4N0F2N/WnWtOl6s/5VqRrR/NRvPHMrXrISvea+vt5moCY3b8WpTKjs4kOpvyIdCyHejN8PjkU47Bs4WF/dUAgeRv72G5gUsRZnFFspmHxpvrlXOcec5H7DsrtTT8SXp7/PfpBvP4aurEgeyu3FtBJ4GmgNO3hYPxwe5hQMBWWyLFq6BlYNVAh+Cc3plTl4iEuGJbOJYhLPqqTuw29C99w+ummhDScExMxyKnhXVTUVDJjGIezBe/xog4xLa7zfrzYQO/N1YFrJDSDZq9+NjG6P4pE5E5rqlgH1NOgh3OC5/MIfYof8+Jusg9QcJflqEftilf3pF2hdFMgbp0xZFNC5oFq7IZlQ0romG6XdAzwvRh2KUvzt8pxJnaAxK5nqcXSnT8p8MccFGrMJqMQD7hUSCxR49QbU25XZWsc2PL1JQJhDU7IXHGE+oNhF44M4CMLMjFdLP+TufJBQTyfgCbsu71L5qt7AhDaIqMcBL4pEIw852d/8HrH+WyFmnY+byyLbEsHp8e6mnvMRXwwGMO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39850400004)(186009)(1800799009)(451199024)(6916009)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(2616005)(8936002)(107886003)(4326008)(1076003)(36756003)(41300700001)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6486002)(6506007)(83380400001)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4AdnvirGUK8Cragcc7+FjIbszbdDCZNtkjZ/j+05gwWuW8L3AIzrzRVUZM3h?=
 =?us-ascii?Q?HLMnCgyA3G+R778eIWIOS0OnhJlUtC4s2qAGmpYfzH4LwEQlxNahZuX2Fe/M?=
 =?us-ascii?Q?xAeiaGObi080au3LKqYSFLUI+STgtzXOvUjm7Tj7+BKUBwCpniI6Vzqe+TtG?=
 =?us-ascii?Q?o/iqVsmYcAZyjYoDjysvxUMGklA+YmwmiV1PiqIJOQ4JsLsM9VleBACmzzt+?=
 =?us-ascii?Q?G7OIXra0ZyEWDppUa3kEmAafVDj1GQO2QhH+F4rpRhG7pGR1SFcBuAVRvmm5?=
 =?us-ascii?Q?NsJvp67x7ct+GR2qC2DQKfkFrR9ekEyuTgRyl765py+DjNfEdbuSsLOxhMWZ?=
 =?us-ascii?Q?PUzsa9TBOL2bC+7Ajne4T6H47STSdyK9cG9AZTkbL54lRAHH+ouZQSZ0Ote7?=
 =?us-ascii?Q?aGjp9uXhNM28yuqVhEuFVK5GYX5s+uqzktB8ArNvlFqDoiaiOy8QyMD3CLoS?=
 =?us-ascii?Q?Pevi4K87SFXhM5u34S2yuijpScWTSfuq5taMKmeTPuIA+Xp5XugIMzuJCHgv?=
 =?us-ascii?Q?0tcCS+cbNs2u7Klk6AT9ZAQAIMNNOSFsC6SWACexlXSLCJzSAwcD7W3My6TE?=
 =?us-ascii?Q?IAZh+W3ynMkRDoZHjzeYSps+llBPfqOF2MMgQZBdJIHLDaSixIlX3hn/npfq?=
 =?us-ascii?Q?UG7DzcZrqPq+g8QOatPZXyfoXKG/gFlDaVA+B6o7JsXHIJO82YJDfpR6jUpw?=
 =?us-ascii?Q?BaJvQtrWi2DOtS/eex1j/m4KFZQaaoEurNtQxQBvTrC+1qkwrDIuiiMnHkQv?=
 =?us-ascii?Q?hvL3ya1iCa6cW1bBkR610I4kSgjniZa5euRZ97Mg4/qsCfkGu9vSoMkuEj79?=
 =?us-ascii?Q?AlHP3jqAz7m212cAQ27SHtOfUyOsY4cmisjUNH4Dkth/Krf0ehQmTuxYB675?=
 =?us-ascii?Q?ysTpsPjJ+JLV2LF78juP43YcY9+TkCkujH4ug1R8E76vsGbEQfuyYTQJHRwf?=
 =?us-ascii?Q?74CL4SCHEnYVU0rwaJkYiQxbM4N9nFJuqqMCK+lFPt1SB+wL1Y9xFBW0VroN?=
 =?us-ascii?Q?uSaToyTvFE5hcGP40RHhbrSihJ+L1vdCebiHnvImVehyJEtOkVew0lRvPd7W?=
 =?us-ascii?Q?WfYy3w7B2LVCnkg7G2zXCvJTyzAtWKQHdatiiA1k4fkUIowSfq8P/OSvCLAj?=
 =?us-ascii?Q?F1HALF45hzJMFyDDfokN3AOpkybEShNbmOkrQaX5QPRYIIKu2vuIuYXMLeUH?=
 =?us-ascii?Q?DEqfDOOOWaUTORAPVjs6jJpgFkdlXXYm8wQC9UMXR/mMOSyDvHdPOj1IX2yO?=
 =?us-ascii?Q?egKVBmLLNb5ea926lPIsAL3un43KRUGYc3d1jz0GkM5w2aQZLg1vRHnKZzIe?=
 =?us-ascii?Q?CdEgw5aRn18HylQjybUj3Tjs2CxO2SslVVquQ8E87SHiXdPVDRNs1eiLN3rn?=
 =?us-ascii?Q?2j8IeU3cii6VpH/UCtdnkFF//6CHqNvUcY+FvNw1MgRcDXchfl0y+BNDEu0t?=
 =?us-ascii?Q?Vn+QI+CcVjsWms83ouRycQFlK9zJv3ZjTwWm+//adRGM+RoXlS2eGeNgHObE?=
 =?us-ascii?Q?ZRLXrMf4WFUpppOlpaSUyuCCoJ+dUCER4zKjqziFTnfbBGx9StGl+RICT1pX?=
 =?us-ascii?Q?Nk0A0re+L8ifpV1Y/6gd89eplcXBim0nsfdyUb6UZNr+RBK/OTZ2i8H0r0cD?=
 =?us-ascii?Q?ZkCxZ2OmSO5BwuCdf6ar8SE=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a1b206-c082-43dc-225e-08dba2434a57
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 12:36:49.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfxtMJF04Uzgm4c8hQ/I1uHgTbvOrKsBoRPrJ6U3z+GmzICPZSf+3WeHaMtAFmWUyfW1v48CKUjfUS71PdhVpYvuV8U7y8gbAzjRzMxl7ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186437

From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>

Native recipes are not able to use ccache currently, due to a circular
dependency between ccache-native and cmake-native.
This affects also other native recipes, but not all, imposing a
limitation in build time optimizations.

The introduction of CCACHE_NATIVE_RECIPES_ALLOWED allows the user to specif=
y
which native recipes should use ccache, keeping it disable by default for a=
ll
native recipes.

Signed-off-by: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
---
 meta/classes/ccache.bbclass  | 11 ++++++++---
 meta/conf/documentation.conf |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 34becb69d1..262db6672c 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -28,6 +28,11 @@
 # be shared between different builds.
 CCACHE_TOP_DIR ?=3D "${TMPDIR}/ccache"

+# ccache-native and cmake-native have a circular dependency
+# that affects other native recipes, but not all.
+# Allows to use ccache in specified native recipes.
+CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
+
 # ccahe removes CCACHE_BASEDIR from file path, so that hashes will be the =
same
 # in different builds.
 export CCACHE_BASEDIR ?=3D "${TMPDIR}"
@@ -54,9 +59,9 @@ python() {
     Enable ccache for the recipe
     """
     pn =3D d.getVar('PN')
-    # quilt-native doesn't need ccache since no c files
-    if not (bb.data.inherits_class("native", d) or
-            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
+    if (pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
+        not (bb.data.inherits_class("native", d) or
+        bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')))):
         d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
 }
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a27d7a53c3..7279e89e63 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -106,6 +106,7 @@ BUSYBOX_SPLIT_SUID[doc] =3D "For the BusyBox recipe, sp=
ecifies whether to split th
 #C

 CACHE[doc]  =3D "The directory holding the cache of the metadata."
+CCACHE_NATIVE_RECIPES_ALLOWED[doc] =3D "A list of native recipes to use Cc=
ache, this variable is useful to bypass a circular dependency between ccach=
e-native and cmake-native that inhibits to use Ccache in other native recip=
es."
 CFLAGS[doc] =3D "Flags passed to the C compiler for the target system. Thi=
s variable evaluates to the same as TARGET_CFLAGS."
 CLASSOVERRIDE[doc] =3D "An internal variable specifying the special class =
override that should currently apply (e.g. "class-target", "class-native", =
and so forth)."
 CLEANBROKEN[doc] =3D "Specifies if 'make clean' does not work for a recipe=
 (and therefore the build system should not try to use it during do_configu=
re)"
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

