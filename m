Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A0FEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:39:04 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web10.9952.1692621539559349112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector2 header.b=OoOH+KAA;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.241.45, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHCMe9CdPAYGF+qVJaRTtAFInYkup7vamaWwQos32j34egn4I4SgSPQVQKYF1G5fWdzdI9O4ihy0KWb4tRS9Kb3Tt9J/DnaJHugHnrdwMxZdpFonCSzPWuKSCmgbNQI16zRY7nvjw96cLS2eEZSWVzEC5HPv83eYzSKhYxKma/8FWESln3ekplTHpIo2lQ2Dx/yhYlr9ShvNzfKya4FXihUORi6/BEk8mtaimp/9/TeZqa1liX2i5SWCwfPfljX74nUs9gZOrWI5zIiESL5A1KD907G0UBcTeV4CRwVLLoeUSAvkUS+uKj+gvHXjY9L4lFhb9l8QA+nSrtgTInC3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8kk20te0Hf8XGiSJGVLbnWQUbhfuJq5n4MuCRLmx/g=;
 b=S9ruvOx9BufgWe+59gsLAy4qUO0Ycjc5Wq/JjPL/Penq32P0Yg7k79E7UpG/PcAkLr0RjwpyxVNo5DE05jQ4/4yiQVKg+Mg9ibJHLdN22dJ53+7Q34P8Tw67eUgai3KnyX/6cN5szEDK7/NgVpJDuT+YVNUJo/eHTw+iAds8QZ6oXT6FHFRi7LpzLVfoDZ69Iy2z1YnPNi2oG4irygS9rTEiN2Fa5IHXlL8sUD0nPxJWLnb86P5OP1So40Jjkv56omgOGBmkMTzYnqwSKhk+RJwS1Fl0jwEKsdOpgmDBIN/Rf1dgalMRo07h9UCwxy7dO2/yA1UpOtb7epGkpCtsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8kk20te0Hf8XGiSJGVLbnWQUbhfuJq5n4MuCRLmx/g=;
 b=OoOH+KAAmY1OW0utP/2SxxMXL3ofZEINQLo4HvOevJZSM7nnw1nNyNqPXnAkkulDPvDGH9SgJEbUOTXyzmdy5lisDgSpK7+AQqJLJBi/o5XdpchdgFFAdrd+/2hAHWb7199dZUNGDSk6yb8z5O1NHLx5QadtvIhwzb3Txm6wzPYLey6rfi5kq9d/Xu9ZrBdm6BKUC1XBqCq5rJ5OJWY++zJMPfN/j7mLg0YK/guQFa05sh/14PySBDciahup689F9JGeVAWLZNAAL8uCTTy2OKQc4KPijtxV3yvy4JE7uL8/L4OOsK3i7PEb2C1obh9gXcO3j7Gsdtn4Gv083PV57w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by VI1P193MB0766.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:147::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 12:38:54 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 12:38:54 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
Subject: [kirkstone][PATCH] ccache.bbclass: Add allowed list for native recipes
Date: Mon, 21 Aug 2023 13:38:36 +0100
Message-Id: <20230821123836.1561-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::28) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|VI1P193MB0766:EE_
X-MS-Office365-Filtering-Correlation-Id: cef682f2-f9ec-4d83-03b2-08dba24394c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	srjyxKLPS9d4nehFNl7xFtgheTqosdTZeHPiHq3/II1zz9DmOJy0XXTfRsD4zDHGkwe7Q9NMFxxVvISkeccHANz+WGd8N1nEjlJPE/aw0gm+8HQW8W545VerwTToVTlgYa6rWQcfCLUWiiShwvnUddFA+F57CYO5UFx/vXN3C/ifo27lhwCzEK5W0VUqCSyXzhJ5Y5vHXDoyO00XnWyr3Q+t3QiPUHCe4hRSpqG0z7IoZx05RpMn8gS05mCfL2KwNYGPRSZmqkV6kNDSxiHjDpQXv//MyIH+rht140nXrGXLChpK1zpk44jnr97s7rx5sKHlSF2eqUKc1uD3YxjsNPPrLQJXbe9avOXNoKY9bQyQVsEeqBHsLLqzl0cI1z0h8WirqmcLKNA9WiCnMlQKgH3Vsyrsj1YIlm7IvVaZcau1SjQ5UFiECe1aLiSEPYKJhyooNO4M3QxxWGBF2NqgRAzrXoftqTt7uj6vcHEEI+EXolBcp2wWzdpEd9IOiNSK9zt0y8ZTyojLu0zv9ZsucMIcOSLSSUK60ipwQ0zJ6Do71CKPUD1XCwBQCYadWTXZcGmlw+IB/T+DUSCHQDSP+75MwwtjDepy8fvy9bgzwlJfNV8Sems7+yV8KPMdYe+U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39840400004)(136003)(376002)(186009)(1800799009)(451199024)(86362001)(36756003)(316002)(66556008)(6916009)(66476007)(478600001)(41300700001)(38100700002)(66946007)(38350700002)(6486002)(6512007)(6666004)(6506007)(107886003)(52116002)(26005)(1076003)(83380400001)(8676002)(4326008)(2906002)(2616005)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pqqm61sjmm4kY5VLHqN7SJJ2femyadMAnxWsJX4t07Mmvt68a3ujXvmIBrQo?=
 =?us-ascii?Q?fvyTFXzEQ9u/Y8C7F2hCqgjBry1IEAr12XiQvzNV1fIO1+t98IVzv1xRzc4o?=
 =?us-ascii?Q?SCPK23itn6VP/Pw5PuVrvAWOiNspUG8WT8MRDKItDYeoWLmepZJFmIrxm6ub?=
 =?us-ascii?Q?8rE+ikySuHkjD4SKoijNgHZJ8W/PmLhyC5AfAVUdUCH3/85lpzCU+836SP7w?=
 =?us-ascii?Q?NFsRCCeD1ZUS+IYwQX68mr5pohQczjEY5nOVp3JHBSYq+axzDcLMuHdMn5R8?=
 =?us-ascii?Q?7CohV/wVQnltVrnZQKQ9ckzsHGzsb8STmT+92usUfYTQJ14gkc/kPveLz3LN?=
 =?us-ascii?Q?EjwDiOf1d9Lr3vWg15rSjwQZwX+VyyE5vC3AdkICX6LPo+R5VxELT2VCagsi?=
 =?us-ascii?Q?uwfDoB/ZjASdHLILRwy/XwQhwulm7sHYDOlcWkho3wZBwn1+unmiHSJ0Wf/h?=
 =?us-ascii?Q?H4mXkEi/K76tue9iePzF5gQkbt51R3sVwN/gTp9PjHOe6X5zsrMBcPHBpOun?=
 =?us-ascii?Q?6V1E++WEVAtb8Svjn+MRhongvjvmyv6bV591mROT5FfCfvTnNMkJprZJwNoD?=
 =?us-ascii?Q?ikhlWW/Pm0lT98ArVLAvJgZa8gOF7/3/rhiWn/5uk6BuhdPQc52D9ItwxZxf?=
 =?us-ascii?Q?Fe7oIpRS9+zNNd2t8+C1l2xQI9rFjCRjMf2xUt8dXuOLwHT2KYPRHxeazb6d?=
 =?us-ascii?Q?BKYhY2oAbasMxtIUpSTDDJEvXacV4KE7VgC7PHxtKxOZEMQVTWdX4bTFpaYj?=
 =?us-ascii?Q?PutegXl1bxYj6UC/ggQQ0qeeNfXn8Jboyxb0jwMYaKaONGu/gdK9BuhbJ/zh?=
 =?us-ascii?Q?V41gM9HNlAx87u0kPiNnPJL8tJT5kgvciGMlSPO7bmBEkxBpxJLsDpJnKNAW?=
 =?us-ascii?Q?8JnoqoCL+LT3VNWe9vRFzj5HGPlOvU9wUg+u0Cnwor4L5DKSm2ZJ/Qr3Vpua?=
 =?us-ascii?Q?BGt/jN8uPncyjWkLv5RlGV3uLBTOkiOdfF2B04wqiC17EuvpUVneOvBCyST9?=
 =?us-ascii?Q?sZrx3vo3a7zkve7WKR+tc+FaV68cFv61lRzlWtjwIaxCB6Wof6g0yrbplGgS?=
 =?us-ascii?Q?WIiyba2Xzk3WiuJxn1P+SrSVNPIwch6rQno3y19aBR004/Rqg6Fzo4ern9NO?=
 =?us-ascii?Q?Ke0wHf90fW0B5ooQEuvFbEAyy4Ik5N/gPSETTfm0K/61PRV8qupKCwWLAB1d?=
 =?us-ascii?Q?zFnF/2Aac0sUS7lJNDoe23lbVqhD/f7OpBDkYwX/7sM1L1TBghQHVKle4SGZ?=
 =?us-ascii?Q?sN/bqrzzyYMuEKo97ms2DVIYA9v02QKwH67wvd2eNauc7k5lilE7XuUjfJFa?=
 =?us-ascii?Q?h2sbBfBksn6gEE60F6NUxg2M3sBqzc3vKp4JWWglS/xHMgKwVcRtZxRB0fHA?=
 =?us-ascii?Q?7utFxvS/42bXN8I5/GcoWZuupgkOSFHAKmv3azTm/hN4jSBSsBSgkR9kcREc?=
 =?us-ascii?Q?X6WO4HnJ/Ugc0NRVuaxbiJwcNd4Y6zXyPhf8Zh24Q7Utnvk4VeD0Ckn9kMP8?=
 =?us-ascii?Q?5GJ3whPk8VBnjMm9qZG/1S3hBeKK5l7mfCu4VBDrMHkqbVrIGTweotGPHcVJ?=
 =?us-ascii?Q?BPBywiiA3+c26DgqyrMEUNIYqZ2pjViit6AhlYuOXngPh6UOUrqy/D/4B1Wx?=
 =?us-ascii?Q?SWYmvxds32qOvqywgib06IY=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef682f2-f9ec-4d83-03b2-08dba24394c2
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 12:38:54.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qd+JnDebjSzCqGfvHESrStLgfGIKuuNKcGawjjXkIisZMAzVinwdiruRCzA1OwUrtlz4jHkXNKpjdDXzqWBO3VkupPTBX2blkBCyWWb77Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186438

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
index 4532894c57..15eab11a0f 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -22,6 +22,11 @@
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
@@ -48,9 +53,9 @@ python() {
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
index ab2addb321..362635fc9e 100644
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

