Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440BDC2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:01:48 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.47])
 by mx.groups.io with SMTP id smtpd.web10.183126.1692262905987571468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector2 header.b=i1biChg8;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.15.47, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuHeUH+yeoOP+IoV9T3w4HzZtQmU5pXEej2Z22R+OHNps0AKsSRXkKVxtjYRVIDFfBnbYqJqSVSHCw91Yq/0vklW8Rs5/M/Ed0MeC1fUm8LmrLmkZGdG3F7uQPsj5D1ZiVXWM20sM+GVpjIuaivZQnmGYMQI7Bfok50cDDFFFdVua5b+gQXVs6e6pynhN+pHnwYrVTy2ra311wuxi0LdADMQaBY/Q2/BcCfXBE92N2FSoh/9i26C0/8nIkklZMTX1o3NnTgLAl4hjdw3RzOvyubIpMCYbfXT/1ZfaKita+zlZcL/T8lH3JFGxjDirY4ufQM9KveNMGGNAXuvk+Inrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa3KNogxSox72+yPBlGxAQSZGGvaKB/aVcCiPAyBiaU=;
 b=YZLgHEBWQBgby5txBK+Sw4I4acNgSUESHdQovjokeE4J3nl5Br3DIvxU/v3iCYX4JICZiHAfTXf26uWLgeWJDLubGNqD5iZRVFIUL4JrxhGa5bWA+4Cft9HdqayiIh/oCkuEKSZzK0pV6U+YE4RiGubOtwVPuD8u4CHQvLy0+QSxL1iFIc/RisFhqGUh0DECsuon6dxORcUlw802BTBvDNv2QggPEPUcWr5I/1nNKZw4VwgK0hNhSr9slB3AMLdkJRVCX6qTvUn2hrBZ8qjHpTysKXKjvfZfiS/3mAbl6222Z+2X/3nQJMPVWO0umho8At0bWMmvgvDyJWgkvxO2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa3KNogxSox72+yPBlGxAQSZGGvaKB/aVcCiPAyBiaU=;
 b=i1biChg8f/KflCbrPD4cKwKaqbgeBF6J5oI3fsUTvR4yj7PfnHev+AnXrvyhO59VS/pS40Ezgrt/enVYGm24yHbgjSDQ82iOxSW7283eViIYZENIL9wiiq5LyCqagArLRtCBDRpS0U5yd84VSXcWcckeWC8POgI5W6NacjGToubII4PPj4LP8znGvliGMTbm7k3CYJRctVRM/tcHw98GJfvUrZFwANuBOFP9XJqRHZsC+dKLKfhral+t/aMgHyyMPMOWC47ajMVwkgd1cXcnUoKfcPYV0qCs7TZr2V1VWYVvIpt2bT8GS6/cQW4mY2w7W6ASOTdu9jPVN48RzSFvJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AS8P193MB1240.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:33c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 09:01:43 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 09:01:43 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org,
	Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
Subject: [OE-core][PATCH v2] ccache.bbclass: Add allowed list for native recipes
Date: Thu, 17 Aug 2023 10:01:15 +0100
Message-Id: <20230817090115.3043-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AS8P193MB1240:EE_
X-MS-Office365-Filtering-Correlation-Id: 6915a712-eb74-4957-4d61-08db9f0093cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ok01g9Gh2H5TfrwvkOGQdXgbiWQ80mDN4X+Kpdy+CcCKGn0eOtR3gmkVxL54qxRjU646X5nCTZSOb2zHtmdNSJLDfm0wWeRJpfh+iDEoP7ABLKQb0lNn63BchqsOGr/qfX/Kd+FG2yxQG9+7RMWlKvITTaokRlyXIMJ29uGc39efFjXEpRpbfE79jjPjE6xp4qTRLwmHBa+cWNLFjn+1vD6fGlcE/rFO0wuhnNxZJbZ0aDitTyKALgwjpMRh2K0rdwea+4JQocEjBLLmFQAaDx8lW6PRMsiB/bGXDl9AXxqWPH+6TX7Cfkhh0B8T1c/D5J/f+WvSNF8+xJGb0O+uvQr5thY0S7gQFerq+VAZBNY2zA0UxuSV5OyGfqRt6FshqlBbh31vgTbgjcXQsmFKejSTHAb8QSohBWZTn88EP8IS504nEynZPDK2CU+Pra0s2RajQoECi9+8I64Ad9n0KNStrEPIryxGY1P98l2ZuHcrtx06dyczIJzAU3owY+5puJafknLToDEwDDd4PtvcMO92IzFLm9nt8H7A8o33ubo+j7f+8CVPfIblHIZwaPv8E+1D92OcTqvRQHOjbitVnfrzPomt+5i45C9uVM1Og4TmIsdRtmYWS5Q0ZZrhXlh1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(39850400004)(376002)(451199024)(1800799009)(186009)(86362001)(36756003)(38100700002)(38350700002)(478600001)(2616005)(5660300002)(107886003)(66946007)(66476007)(66556008)(6916009)(316002)(52116002)(6666004)(6506007)(6486002)(6512007)(26005)(1076003)(41300700001)(450100002)(4326008)(8676002)(8936002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j4tYIo7MtJd0fTaG+gMCxJd4QoIW3t2W/XbSuNAVsbIAosxEMoyRF40On/Ip?=
 =?us-ascii?Q?HZmLcxOZcP6+ZFz3ndo8Ljy8/tmtXFOu1yIDq2PkHgcy6VwZgF4GmanVAUxN?=
 =?us-ascii?Q?ZlGEqNHtueeqtVLDIxC4Pi39EpSMEB0EkV3voGc46jn8u2VEVgYnjC5ZZEPe?=
 =?us-ascii?Q?GOqly9IVmYu+jnff9QvG7tnOrQjt/n4oTEsITNr8enOcr+r0HiO4zjE6r7I7?=
 =?us-ascii?Q?JubGkgAJT3rs0Lf29fkW9vSVJgNScyBdTFM2gjTiThLhH+CS9ZbGuJHftjUo?=
 =?us-ascii?Q?DCVczbtHE/psmL4kbqIYSrQla3tqgKHyM1DtjUezDHot3tkOpi3o304cfxL0?=
 =?us-ascii?Q?zN2zVsAGiHBZTDsJomP9NZIGyDeV2TYtEnuTWi3GIzC+EWRsqzCuwrSDevnv?=
 =?us-ascii?Q?Lgx73/PJNcEraHnWncygsb8+AjRSaMbs9/CNHzpvwKeV4uJ+13wCyUcb021z?=
 =?us-ascii?Q?jFnW+E87KZ4qe6vgn+GeocaNs/hzisr7vsX66Kd5aBiX1Qhyno+zSPDvf179?=
 =?us-ascii?Q?DDvbOA51DlLcrkhyliTb/iUb4EHO/o/3HTogZO42fhuuPNVTjFiF9mm4MbZV?=
 =?us-ascii?Q?6nzTCmNsVo5Y93vJQBqcsw5tNsZsgSEOhRi3swz4PJVWNdGVStOMKVJPfIk6?=
 =?us-ascii?Q?2DWWi/bh2FaiJBYam0EeQq6o/Uw8UrufhAJydG12qPlNycynhwv/l77yMS8+?=
 =?us-ascii?Q?UTTDinWS44ELydyv8PCKgGDqXP1r7pr9yrA0DRifHFGBUiaFreyWAObHA/iW?=
 =?us-ascii?Q?ZSr49EFhPJNXVy3bAtPShZyLHQQhv4SNaFXLxfzg1LhmK94Ai3Tf8gmQGd2R?=
 =?us-ascii?Q?MUlAIBbclVd7WbkoxqIptkWg5nF4CDTbPGQcYd2ElWDDIioYWZd7VVwaSCwU?=
 =?us-ascii?Q?K87fV/9Wx7vkQ4MEohWadldPHBBSdatZb9vij/MR4sA63HWFaJkhD2IYI8ks?=
 =?us-ascii?Q?Odct+AqcOUtjpXtPTOwdVqlbdHhlqdN8fuUHfXDs/IqYb0aTLqQluKheeuVk?=
 =?us-ascii?Q?wwrsl+4/xAjyJBtZnC4wCye86alhz3jFivqWT6F2skNEYWWOpPWJGA85LvYX?=
 =?us-ascii?Q?DdUreE1vxrKRjeeu6YryptqFQ2AEKCFGeIuDQZp8eIN81y/8B/I0mNoA0db6?=
 =?us-ascii?Q?1M4rW8wzuDvMEK5Ft1jDkszKIZwIVkizAKA3Brxs0rtq1AnM/6I2WPlgqWgw?=
 =?us-ascii?Q?eq0Ko1j9Fqi1dMj8zvJkd+3b37lDIlYH8Yv4vvY+hbZ4OUL6nwMY3vpVtEaY?=
 =?us-ascii?Q?6UTIac6sZojhTr3D6k1ePl1Hl2/1EQCeR3XC+NEpl2bDu8om1WmcG7pQmRub?=
 =?us-ascii?Q?jz36aJPweUjEfzn702tOq1Cq4fjmLSM0z7X4dXC3Wp0kp7Nf5blzvFNjB+HV?=
 =?us-ascii?Q?QJpnufPOpl8xgkoA89VeixgShqPQYWPSHiZXQNx4uFpE/i9fVb0PVMiLzu18?=
 =?us-ascii?Q?unmdRDHb+dQwC90gyYIxjtt1uqpO2TUi9NcygkoX/ayQ+N/IVF5NPrZoyitW?=
 =?us-ascii?Q?1up6/ZFa9fjFPYiNULH6F28QZh4Cb6iGLB8QJiI+TOInbVlO8PSTaLFTBzR3?=
 =?us-ascii?Q?1Ax1i3Hr87HR16QNOEcRwOqGmjF2AP81W+dLTbW1Tf91EQ1SwGIfnzk2UnHc?=
 =?us-ascii?Q?qDpvFXc28L2gkjnx6Fn2wxs=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6915a712-eb74-4957-4d61-08db9f0093cb
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 09:01:43.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/DoLkH8V5ksuSn3THDayZikK0sslar8bIDasJuBvzZdP9YQ/kK+q/cycqPqzR1GbS99Gw5+rIN8MDh2XdNSo6lnmXwePKICE/mRPzN9kP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 09:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186298

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
index 66b8e2f24f..fc1b4978fd 100644
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

