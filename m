Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EE7C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:10:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web11.161490.1692195004280227949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector2 header.b=Ilcj2vdW;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.21.85, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeErd6nF5ym0MFrnBN6xrsURq37IM6pX6fqsAB161z6bTSYNOuUSy3Eh6OcKpkaZYd7cxz+Sm1YvX7gvgpr3ZR3xrhp2aoZ8916f90yI9WgNZdutFAjdJ7gdvRKAT1c249z5Rssc6qD9+tnr/rGEKiAZfSqdtnWzHLp6fY0tYzg3c3B4Bb9shcrVcFSS8V58cMG3iwfnJhbD5NYGf4dl9rCJ/Ef3O3rW2tIBA/+0cV3n8M0v+lR58qYW3soQFEMOXFnlZr2zI0c+NVW/pnHyoaZa9USDhWeCu3CVv6R81jiO7lBt9eMZTzeIDhzH2EK+a0wy7Y0RgP6iPNtJkFl8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBioMusfBCd0H++loHG929kU+shar2WckLI2v1wOhEU=;
 b=bo8/6VbMzsSjYIplKePKP+TCCgfS/LKsmtXhtWxh0y461T3xE4OWWxhC+A1+ZboPZcJZbzBZhheaRtzTam8CA28h5L0GIEkQ+ai6hUgvXU2syYlVHfQpOKpORtxTOiJ3dMBpE5QdBv5/iaagqcSKaNNpso2Amk5/edagFed1gdIdFYH5sy/4wgyG6S/U0Ag/xCNb0Qc5dG1lgt3XpSEWRXtClwKc6wBSUHIKZP0YbU1M/6477hr8UpkHXlOAHd5GzPpPI/umRZoSQTRZaR8SJAqCa7P71vg4d2AdHBruz6nI2D/WO8AOjNxYMksx0Wof1TNUzluDWvQC0s4ohQcr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBioMusfBCd0H++loHG929kU+shar2WckLI2v1wOhEU=;
 b=Ilcj2vdWCAZgl35HgQet1f8TgfGzeyNJMJalxojvGyqPgJMYtUY3TjbTW4oLzARpe1cPEhE8H4cXztxkc2pO8+AVRY/Qg54kMNxSjGsoynoJgkgHctJ/VlRMcYfGQAWEQpISTeaiXRsfyEB4i3aKZ5ur1paJ0G/oKpMndJP68Qxv6pd0QiR/sQikSWx1Pwkeos+EAuPKST2r+GiOSJpZ6MU7dMwwuf/aGrvYvxPF0UBQYT1cEp+sNQDTNXFShZiM8YBVXcwBwZVP6lLOHbZ2tiCl42b3rge8KiT0Rufx4MbQ1kWrd+JNJRDYEMYH32supwf9wA1MznWa9zreSQLjNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AM0P193MB0707.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 14:09:59 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::bad1:a36d:235d:6f91%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 14:09:59 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
Subject: [PATCH] ccache.bbclass: Add allowed list for native recipes
Date: Wed, 16 Aug 2023 15:09:36 +0100
Message-Id: <20230816140936.2511-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AM0P193MB0707:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ccd563-e1a5-477c-f4f9-08db9e627a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WpgNQrtAaqNVBwxy4w2b7LihxfbzNOzAG15blM1+H/DhYwvynwFQTGixLFTkGSQrBDmknRl83O9effxTU5AqvEkArVzWj4QBN70b7Q4JquWVq6ieKb1E+ZPYZj+ZfvyVLsOH+/M6RTxbhbtJEclLwrBg0YRYkbe/uZ94uUV6WePQrnLW0IUwKB5W0rQbnUEcJs8OKZz5NO9B5SEsTmyGcOS9gG8HeD8Hpni/HoZnyFPvnCr11jpyAfUz1LHRCtoP/53LKSXmnHdRMfr1M1NT6TPpkfc7aDFak5mCys4rcrI770Ub0GQpytU+dZuJxU14J+8cqIxyD2XikB5vtVNPKexzD6+O/X7IsqB64hYqw2jgY0Q92oGM2+C8bMnI6/U3YQrKhchMWUFNDraPuQhdCjVJLmXuOe8Ov8w+pSz8D3xAB7ppoKPe9vdQGgsZ9r2qAkCmJNl/J1QuQXjhS1Ocjp4/h9RuNDgO7LlxkwefvzJfP6DcHBIJXUFpumLv9pXMAPtHokqwb93RuorLTiqNkOYLHjRvkSnGUFSGy85kOHBknncgWf1LF4o6I/hf/VO9mh4YwSpAfgOSACaIuAVu2cBS/hK4htusg3qOn6j5puGevlJviEpw/TbN00J4EIB0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39850400004)(1800799009)(451199024)(186009)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38350700002)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(52116002)(107886003)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HLrIA2XmKckLCn3N0L+jn27wt5VMsfV4GDlxmAzgTMvt5g2y6JEi3nPBBXmg?=
 =?us-ascii?Q?Howfp0cnAbkbdsnlBaK2/upPYAg9gYNnl980mreKLAIx1Mz4n6EN1uk0528l?=
 =?us-ascii?Q?zVpXZcPmx6evoE3RiiTr01lxKuKbWT6Pffk2t3oNqYN67h97yJyWE6zf0XQb?=
 =?us-ascii?Q?qoH4HS7prjKVwPWjpcwGc+uRk6O++kZTEeZjPpBScWIR1uKkH8/3Lc99Wa9F?=
 =?us-ascii?Q?MGL5VSIEhv1ES5LXeqrGHWc4A/0GntI+E4Koo5Fx8jIcdq/J1TgJDguPWHVi?=
 =?us-ascii?Q?13/vfjM9pLxGcI/x4Tcc1IJZCUgQdR3Q8e3GSQZ/W6CGK0nyUmdEY4BYcLfo?=
 =?us-ascii?Q?0XrlC+Ybtb2saKb9dmWfGZAcPFZk/FKflqOZ111oakBOjbMdGg24dbdRTxHi?=
 =?us-ascii?Q?TOZmPPDq8T2G0S3UL9UhjhjKn9L6VPhb8CxKC3s4h4F8rJeA6QQkaufzRLnI?=
 =?us-ascii?Q?9xLw3qc4wyrvddpnKXLyFhfeey+ALPgM55XItVw/s4WPnb8PkONRH6Dl01iD?=
 =?us-ascii?Q?YUm95qFWIkqdN6mEETb44Z9OFUoh1OkiJEFHoCp3CGlvwb80ElQ40sud9G7L?=
 =?us-ascii?Q?2y1Q2tGnCbLFtNbnvQ8a6IiyVxb4+2aobFhWyl8Ksh41vQrxeLQAsiBHl4KE?=
 =?us-ascii?Q?uSVLAdoG1/22PrKgQyrZ1Z3u77dEhK2mY1l2SWZw0L56K6AJiR4+ERz/Ukia?=
 =?us-ascii?Q?W7r5JJLxpa4FNpyOgLziiQVDvuCYe8sIapcOG9GUvHSICTgTsgB/A7YHOkI5?=
 =?us-ascii?Q?4xr1QZCDYDP41MSQO08LkUKarWtlDGE32JTbEH1LUuovvaymegpesvFY95To?=
 =?us-ascii?Q?/ZOR+m7xo8xar950FFsVpg2IOEKloZHDnQAj3wxP0ih/PTq9UP4h3mmOXjoE?=
 =?us-ascii?Q?SnFH6jfG8gP3NGLmgTbrl27uhkFPE4Dqq+vtMAt4CbfX47mcP3lrZ8/bmepA?=
 =?us-ascii?Q?q3QIPn6G1NoDX+WwJaDWQvQ8UHHzv7NzxWvUJqte/ffgJMF8TpCn4mKdhD6F?=
 =?us-ascii?Q?M2bIaJhgr89Ou/d1zkFbJ33fclUY8Z+uq4k15YjmRZ5Oc+6d3ve1cGx48S0c?=
 =?us-ascii?Q?EF7b6oPG+KQkXpWVs9XQNYIUmrfV/s+/bJtGp0DOrDd31wpQGPqAJOFSwqX5?=
 =?us-ascii?Q?kyYITqhqPlEPycRJtk1MjkIZ3wv1Pd1qtfB9bt7OZlKlhhbTfL94MU21zGum?=
 =?us-ascii?Q?OHmQc5UfCHA+r02PKWv/3cIwnAYZ6t5s7zxnGhB1nPotdj3FybEwstuLkZzx?=
 =?us-ascii?Q?KXl8e9h8eXPwrB6hCzN8EGP2mUeRld9aWv2X11IAWsW3uFXilEVNUQyZdZYj?=
 =?us-ascii?Q?H6Fy1QPdkpK4mK/3jsmgQ/HQIQr9J+jLNo5u9gHTCPiTpGivPTZlNGBuxXUU?=
 =?us-ascii?Q?D9Cg1DjTw6m2cTSJyzJ9Y+TTBXfN003z84DgX2T9aq8BM66/PR9nflNuO3Tz?=
 =?us-ascii?Q?o9SK5ETG00q1SNOwiYElyWg2U8K91zrIr43ALHfW6KWzyKSCPvyjI5jeZtty?=
 =?us-ascii?Q?7B8O2xMF0uj6YGQunJ67FcqvemLa8qLQS/uWYlubeDMGjNpXQciqGRYNs2rh?=
 =?us-ascii?Q?lr4ELOfmdM9o2IMHkqIrOyEo3hWdT28/ywj6wO5pjURGhWb1ZCyYEcWBlj6+?=
 =?us-ascii?Q?wxgKjh9QhK2awwUq+zHjd4w=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ccd563-e1a5-477c-f4f9-08db9e627a3b
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 14:09:59.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZKm9RsyEzLjaf0SltQ/k/Tlb4azE5/z6mO8X1SQgN3ceXN15W2Q8KsRyoFXdU6PJydhexMMNApfji8b131j0c8UV6SHjYIyFbLjXjtGm8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 14:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186132

From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>

Native recipes are not able to use ccache currently, due to a circular
dependency between ccache-native and cmake-native.
This affects also other native recipes, but not all, imposing a
limitation in build time optimizations.

The introduction of CCACHE_NATIVE_ALLOWED allows the user to specify which
native recipes should use ccache, keeping it disable by default for all
native recipes.

Signed-off-by: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
---
 meta/classes/ccache.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

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

