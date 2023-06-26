Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3932EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:01:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web10.5933.1687780854427028985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 05:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=SdyjCpo7;
 spf=pass (domain: navimatix.de, ip: 40.107.21.40, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1SeT9xPD2h76QDdQwpTsKby8zXwm1ggq+5qcG+6yXHR8VYTMYYvDmcrgcC0MO7AdGGL/8BgJVFDgl4n4FpGjuZq99RmIaLRpx2f6z+BM1CgTT/ZysP/IcXP13ZspPrJrAxA3JTmxNIKwhLs0/MoUNi755AcNEbWvC37179lZNM0VMrvRbvh4/wGvgdUnPaVrZxTenJ/Vf/ZHsuQgGpCHNwgi+k5etFGoemuzvgxLMtY+4gDn0DQcjKBb17NgPEXrLTM7uJ117VmYa6+UKPeYMZj5VkgQr/QmK/EtJC6y5KDZlN+bMiOpCqMx9+Zvg3lQkXnjX4BFWVMtxJEIOHyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HjkSOK9tqr01aZFE3uo71RIxWD2dG9NJFl7VQZP3ug=;
 b=HA/D5qxkNIzPvNk0G4UYGBDetxj2LZ3VHddQ9SOBwJuDiKC0EeMDD5DtuitPe4q/ODkiQ+hprC5atMilrxjo38+niuAnqIw6Yb07sXiTemZlTs1eQDivQH3rBphmtVg1tJIXOER1yhBWMiiyuXpkI14odSHuZ38KiN4VbiDr3Xsun+wTcorjfdIoyfGhEFpTylWXdVaRq1qmSlbTl0Y/isEy10+j8LFDMR5P0c8VU2owXVbkhsKHzWbrahNhwimm8ZGHwqc/ZXSm3dGRLnuPhDDv2sf/vbyugbNBkcraVA1eGHgsbuBSLJPik/cX/Lfjoy4nNWHiMlk78jHFhOneBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HjkSOK9tqr01aZFE3uo71RIxWD2dG9NJFl7VQZP3ug=;
 b=SdyjCpo7VkSFIJL5CndE54BeLGA7riL+n2wCKxyMsLKuvbEHC7fOg/sDKvXVZjbZDuEJKMDzB0jPEPmXbf39luP0vQXtTcsOXppiK4+DUNQY/rJxiBRwQ8EZHi0PLZnR/5NtC8vxCK5dCDWrahVPPQR25v6VEXz2eAnF9jojyoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PR3PR01MB6394.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:3d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 12:00:49 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 12:00:49 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] bonnie++: New recipe for version 2.0
Date: Mon, 26 Jun 2023 14:00:32 +0200
Message-ID: <f9be76642c5464c317ad0aac165a0970ec95da04.1687780832.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0477.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::22) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PR3PR01MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: d96cc081-60ad-4e5a-7981-08db763cfba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EvTLNj124Cx8ThftdJ3oklBeI0QIU5HTqncRKpsmVsRJK0gYT7GJg8x+W3fy9meX8mWVqxoyuunpQ0cJdAe7bNZD4av17nylSIfewu8yJYwUoqcJpOn1tpDeNSW2j/DVvsdjpMowzzulOJo4GIPx/cnyFShC21DZ3lZIwiB2Rr9KoXG1GABdTODwbwok2TaFr/cEuxuFkuTKkQtOg+r+eGT7dGxlss1AC0t+CEwTm9ljovhT8T1szZF4tkIY5B1tdxUs5VM+E5mEYRP0wQpChMUqAgjuqDTDFb2f22JDfPnxTGtWvcg6b7fWf+eU4Po14B9ieCD46R08Lth8m7b/fWE8no+W4/OgMaJmI3bdz7+12ByOgTr6jSa7Fm35P76uzQ9R2aDd90f9qmko8s5nyJ0wyxG2YnT2GX9CaYYXaAknUB1Q2wBv25qxTdCdMNEQoKJ3XH/c751l+Kun5vfUIJnZsJ31xOcdrlR7x4RdOD+XKIqncIvIL7XglA4RRVxEx9niMtwsFAEQuabzqM1L4UlA9Rxlwp6r4EB7cJ2iHNNhmwj9sVs4AOiPlOlcXcj1cZHRBvcfFC00qo9WBTD/o4Mv9Z4imPgve+oJjNZZqtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(136003)(346002)(366004)(396003)(451199021)(66574015)(107886003)(966005)(6486002)(508600001)(52116002)(2616005)(6666004)(83380400001)(26005)(6512007)(186003)(2906002)(5660300002)(36756003)(38350700002)(38100700002)(66946007)(8936002)(8676002)(316002)(86362001)(66476007)(6916009)(66556008)(4326008)(41300700001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qr4PpqU2sIJ716dw4gBRSgj9FopV/8qS+mGaOQxf2eS+40h/AsuKmEF5UngW?=
 =?us-ascii?Q?+tJdIb1rpvmByDJThPaq/1wsr8ef5RiGyoKilwoX5NE1jwbskwTjjtC23RGl?=
 =?us-ascii?Q?CTep8SaLAt4AeYF/lGb6HEdtt4NV0fUwPdBJudNUxb2ez5s0EQqV0ihJefOc?=
 =?us-ascii?Q?XVR8oA1rNiBVKlHqXkAZztxUf1phHgHRJ5RbTEZz67EeMampNiLwPCSFQbJK?=
 =?us-ascii?Q?j/Ga8VoUNFs31wDDv7h3uOc/u+e7SwvlXQUprYKyK67aekSs4UbyL3StG4E/?=
 =?us-ascii?Q?4nALEFDtX6M4txPxsp3/y9dfRzYanTocC8UE9RqUKFFACkX1L8SHzauuefqa?=
 =?us-ascii?Q?9eBvxQOnafCRy9+7CwAENJBfvXYrp3LyYXIFKpNdOW+cqj9kO8guS8C446xb?=
 =?us-ascii?Q?PumWfYLGhkX7jiVlkoneekJ3tYURHQbF/FPkqeseeO+SGhX8rHGJu/hmp5d6?=
 =?us-ascii?Q?5lcyUqRGSUWTYlrn/CadF0U5LGIEmU+C4vuGOpEk7vRVqFHNYEqDbTN/t2Zt?=
 =?us-ascii?Q?TkdzvzKL+JZGpvcMWH3RipvPzMKHXSAsu2g8/drhVnlANEkfYqeJ+4QlYuhc?=
 =?us-ascii?Q?4hUbThEU2uZucdePAfBtalRR1+msRAqgq6DG6qFgcEOPNEU/iWh6V5EkjHz1?=
 =?us-ascii?Q?TYVi9quww0c2GLbXcY1owYLS7lSNo2GF/Ci8hTMSGdq1s6oNUmT10DCybKnY?=
 =?us-ascii?Q?HPZcmo6cNzIVFplQn2JuI5RnRm6iP7cMVjyePUTDNLqdnmgB64luNMkMnPBt?=
 =?us-ascii?Q?CdbXwM+5ccwin58FT8aMPjNxGaI8C/Mps5iwshGTv9b/RI3s6COBfKfpdf/t?=
 =?us-ascii?Q?WSmMiZECot+YrHil+IYMu5w3v0QqE+e0JxZeu03E44vxYoU8exLLslSubzjy?=
 =?us-ascii?Q?Ny1l/y8cjLZ4csgr/hD2hO/Ns3QC5FcQKjJzyXlGm2ksRRGS4on4lXorOfSc?=
 =?us-ascii?Q?FgI2LSG2PMoJFk8Ml64ZuiHp1JelPF26Ppde1xnJjF75Lz0t819MtjSex54B?=
 =?us-ascii?Q?15ZCEKNzJogVLeYuQqcEtDP1D9zLoli3RxjYjfuWvK5XSso3JFlQI6aAc2gp?=
 =?us-ascii?Q?Bp+mxK2ZwHO4dAi1RuN3hD5TccremSl4WYPkjPc9fte0/XV7QMRaMIffC4KC?=
 =?us-ascii?Q?ybIyuIcUNJQ9gVE1DHePqrdSapIoanzRAMF2uyXOkWmt1e+56Ab7aU3KRc78?=
 =?us-ascii?Q?y9gM2STKuDeKwVwJrZSj38xmvX/re8/yPnD6eY5AbMu3S047vuiP0Hv2Kob6?=
 =?us-ascii?Q?xZTRyL7uEVR0HxVZ5utNDf1PjxzEHbHTH4C47GdNGaVwzXZd1j6UcXZJmeSQ?=
 =?us-ascii?Q?qD2rvP6ngyk3I4fI5Dq70sCALQjdz/MeDb29t7aTqFzVk5L4oMdDbEoLXCjj?=
 =?us-ascii?Q?r5Oq2tYFcjDAf//U/zBSpTNdTlJkS6rYvSJTL3v658epCmQn8yrxyoL4caNC?=
 =?us-ascii?Q?EpZaBb0P2hN3kUpwavuSMAwIAkeHvAOjE/6l/DIr3l8X5U/ZMdvtOUweA2SH?=
 =?us-ascii?Q?x8S/Ldane0+6usKZ+RRd/QYRExC7bttdrAoB/jaAuBL8JZhrev2a3DTG1HNX?=
 =?us-ascii?Q?DTAA4t3JHuQ6AA07XQrNCsx2R5+/CcB5wjJrbFtWeHGpmw5quD+SStslDMo/?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d96cc081-60ad-4e5a-7981-08db763cfba2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 12:00:49.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haOlcKl53Qls65SbI4VytZb2pcIwPDAayJIm/gv5dI+OxsPCSXojpbpzbQJmopMZ1x5H4hHhq+5gkTODc0EeBKcAbY93xrJ6drCk3PJvSQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 12:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183411

Newer versions of bonnie get published on
<https://doc.coker.com.au/projects/bonnie/>. Unfortunately, the new version
doesn't compile with g++=C2=A011 which requires *fix-csv2html-data.patch* a=
nd
configure fails due to cross compilation which gets fixed
with *fix-configure-lfs.patch*

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bonnie/bonnie++/fix-configure-lfs.patch   |  37 ++++
 .../bonnie/bonnie++/fix-csv2html-data.patch   | 181 ++++++++++++++++++
 .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
 3 files changed, 251 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure=
-lfs.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-=
data.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.pa=
tch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
new file mode 100644
index 0000000000..d28e28658c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
@@ -0,0 +1,37 @@
+diff --git i/configure.in w/configure.in
+index 080e40c..f2a2bbe 100644
+--- i/configure.in
++++ w/configure.in
+@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }
+   , thread_ldflags=3D"-lpthread"
+   , thread_ldflags=3D"-pthread")
+=20
+-AC_SUBST(large_file)
+-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
++AC_ARG_ENABLE(lfs,
++      [  --disable-lfs  disable large file support],
++      LFS_CHOICE=3D$enableval, LFS_CHOICE=3Dcheck)
++
++if test "$LFS_CHOICE" =3D yes; then
++   bonniepp_cv_large_file=3Dyes
++elif test "$LFS_CHOICE" =3D check; then
++   AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], bonniepp_cv_=
large_file,
++      AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
+ #define _LARGEFILE64_SOURCE
+ #endif
+ #include <stdio.h>
+@@ -118,8 +125,12 @@ int main () {
+   }
+   close(fd);
+   return 0;
+-}], large_file=3D"yes")
+-if [[ -n "$large_file" ]]; then
++}], bonniepp_cv_large_file=3D"yes"))
++fi
++
++AC_SUBST(large_file)
++
++if [[ -n "$bonniepp_cv_large_file" ]]; then
+    large_file=3D"#define _LARGEFILE64_SOURCE"
+ fi
+=20
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.pa=
tch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
new file mode 100644
index 0000000000..78ac347aa8
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
@@ -0,0 +1,181 @@
+commit 7e9433a56f22426b11cbc9bd80e0debca67c893b
+Author: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Date:   Mon Jun 26 12:38:30 2023 +0200
+
+    csv2html: Explicitly reference data in top level
+   =20
+    With g++ 11 *data* became ambiguous with [std::data][1]. Therefore it'=
s
+    needed to explicitly address the variable from the top level scope.
+   =20
+    [1]=C2=A0https://en.cppreference.com/w/cpp/iterator/data
+
+diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp
+index e9d9c50..652e330 100644
+--- a/bon_csv2html.cpp
++++ b/bon_csv2html.cpp
+@@ -87,8 +87,8 @@ int main(int argc, char **argv)
+     read_in(buf);
+   }
+=20
+-  props =3D new PPCCHAR[data.size()];
+-  for(i =3D 0; i < data.size(); i++)
++  props =3D new PPCCHAR[::data.size()];
++  for(i =3D 0; i < ::data.size(); i++)
+   {
+     props[i] =3D new PCCHAR[MAX_ITEMS];
+     props[i][0] =3D NULL;
+@@ -109,7 +109,7 @@ int main(int argc, char **argv)
+   }
+   calc_vals();
+   int mid_width =3D header();
+-  for(i =3D 0; i < data.size(); i++)
++  for(i =3D 0; i < ::data.size(); i++)
+   {
+ // First print the average speed line
+     printf("<tr>");
+@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)
+=20
+ void calc_vals()
+ {
+-  ITEM *arr =3D new ITEM[data.size()];
++  ITEM *arr =3D new ITEM[::data.size()];
+   for(unsigned int column_ind =3D 0; column_ind < MAX_ITEMS; column_ind++=
)
+   {
+     switch(vals[column_ind])
+     {
+     case eNoCols:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         if(column_ind =3D=3D COL_CONCURRENCY)
+         {
+-          if(data[row_ind][column_ind] && strcmp("1", data[row_ind][colum=
n_ind]))
++          if(::data[row_ind][column_ind] && strcmp("1", ::data[row_ind][c=
olumn_ind]))
+             col_used[column_ind] =3D true;
+         }
+         else
+         {
+-          if(data[row_ind][column_ind] && strlen(data[row_ind][column_ind=
]))
++          if(::data[row_ind][column_ind] && strlen(::data[row_ind][column=
_ind]))
+             col_used[column_ind] =3D true;
+         }
+       }
+@@ -195,22 +195,22 @@ void calc_vals()
+     break;
+     case eCPU:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         double work, cpu;
+         arr[row_ind].val =3D 0.0;
+-        if(data[row_ind].size() > column_ind
+-         && sscanf(data[row_ind][column_ind - 1], "%lf", &work) =3D=3D 1
+-         && sscanf(data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
++        if(::data[row_ind].size() > column_ind
++         && sscanf(::data[row_ind][column_ind - 1], "%lf", &work) =3D=3D =
1
++         && sscanf(::data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
+         {
+           arr[row_ind].val =3D cpu / work;
+         }
+         arr[row_ind].pos =3D row_ind;
+       }
+-      qsort(arr, data.size(), sizeof(ITEM), compar);
++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
+       int col_count =3D -1;
+       double min_col =3D -1.0, max_col =3D -1.0;
+-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind++=
)
++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_ind=
++)
+       {
+         // if item is different from previous or if the first row
+         // (sort_ind =3D=3D 0) then increment col count
+@@ -239,7 +239,7 @@ void calc_vals()
+           min_col /=3D mult;
+         }
+         double range_col =3D max_col - min_col;
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(arr[sort_ind].col_ind > -1)
+           {
+@@ -250,7 +250,7 @@ void calc_vals()
+       }
+       else
+       {
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(vals[column_ind] =3D=3D eLatency)
+           {
+@@ -263,25 +263,25 @@ void calc_vals()
+     case eSpeed:
+     case eLatency:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         arr[row_ind].val =3D 0.0;
+-        if(data[row_ind].size() <=3D column_ind
+-         || sscanf(data[row_ind][column_ind], "%lf", &arr[row_ind].val) =
=3D=3D 0)
++        if(::data[row_ind].size() <=3D column_ind
++         || sscanf(::data[row_ind][column_ind], "%lf", &arr[row_ind].val)=
 =3D=3D 0)
+           arr[row_ind].val =3D 0.0;
+         if(vals[column_ind] =3D=3D eLatency && arr[row_ind].val !=3D 0.0)
+         {
+-          if(strstr(data[row_ind][column_ind], "ms"))
++          if(strstr(::data[row_ind][column_ind], "ms"))
+             arr[row_ind].val *=3D 1000.0;
+-          else if(!strstr(data[row_ind][column_ind], "us"))
++          else if(!strstr(::data[row_ind][column_ind], "us"))
+             arr[row_ind].val *=3D 1000000.0; // is !us && !ms then secs!
+         }
+         arr[row_ind].pos =3D row_ind;
+       }
+-      qsort(arr, data.size(), sizeof(ITEM), compar);
++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
+       int col_count =3D -1;
+       double min_col =3D -1.0, max_col =3D -1.0;
+-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind++=
)
++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_ind=
++)
+       {
+         // if item is different from previous or if the first row
+         // (sort_ind =3D=3D 0) then increment col count
+@@ -310,7 +310,7 @@ void calc_vals()
+           min_col /=3D mult;
+         }
+         double range_col =3D max_col - min_col;
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(arr[sort_ind].col_ind > -1)
+           {
+@@ -332,7 +332,7 @@ void calc_vals()
+       }
+       else
+       {
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(vals[column_ind] =3D=3D eLatency)
+           {
+@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)
+     free((void *)arr[0]);
+     return;
+   }
+-  data.push_back(arr);
++  ::data.push_back(arr);
+ }
+=20
+ void print_item(int num, int item, CPCCHAR extra)
+ {
+   PCCHAR line_data;
+   char buf[1024];
+-  if(int(data[num].size()) > item)
++  if(int(::data[num].size()) > item)
+   {
+-    line_data =3D data[num][item];
++    line_data =3D ::data[num][item];
+     switch(item)
+     {
+     case COL_PUT_BLOCK:
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe/r=
ecipes-benchmark/bonnie/bonnie++_2.00a.bb
new file mode 100644
index 0000000000..f31fd09fc4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Tests large file IO and creation/deletion of small files"
+HOMEPAGE =3D "https://doc.coker.com.au/projects/bonnie/"
+SECTION =3D "benchmark/tests"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150ae=
9cc3ee0"
+
+SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
+    file://fix-configure-lfs.patch \
+    file://fix-csv2html-data.patch \
+"
+SRC_URI[md5sum] =3D "3a16b3a91b1d38b6f5561e197f81d870"
+SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e5=
8f27257e468f0e"
+
+SCRIPTS =3D "bon_csv2html bon_csv2txt"
+EXES =3D "bonnie++ zcav"
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+# force lfs to skip configure's check, because we are cross-building
+EXTRA_OECONF:append=3D"--enable-lfs"
+
+do_install () {
+    install -d ${D}/${bindir}
+    install -d ${D}/${sbindir}
+    install -m 0755 ${EXES} ${D}/${sbindir}
+    install -m 0755 ${SCRIPTS} ${D}/${bindir}
+}
+
+PACKAGES =3D+ "bonnie-scripts"
+
+FILES:${PN} =3D "${sbindir}"
+FILES:bonnie-scripts =3D "${bindir}"
+
+RDEPENDS:bonnie-scripts +=3D "perl"
--=20
2.34.1


