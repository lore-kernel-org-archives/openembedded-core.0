Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B96BC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web09.9592.1633601638149770076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=vWhSJt3s;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.58,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUVLcfQxOl9tv0ZgIGvm/bir6q9cnSmLkin3mCGdoHpnM6379nOu9+Ln8gn/Pv3KPatMZKgw0NkTj+FJiXvqLdPDdNmbMRfjzCqf8iCxpjlZhDsiepqVScyfP+tNg22LJt1yiEmhNScb13Y4iQF8IC/Dnn1VDY8NLJbzudhBK1LNR4nYWC2UHYckkkbXg5rQqNxQW9KCtDqdlhRnZ6uO9IDXTteHseSK1qRRLJuaHquZF1NUeOv2DSqO5JcXkRrKprIC0fyFNn1ImcibFISXyeWphlJOvN3LMpMxo+lZPe+vUtC5e9iZNW5pWYxCS/HSl1adRUqBOAa9E2gguZCSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW3ixuY4PT5J7q5PWR13SLyPOmX28X1/QipBDim+n8I=;
 b=nZkiWzrQa/l4DlmIQltc+dGmGdFaWHoE2tUoF4qMc9ERJ/A8qCGAE2GRcj8ZortFKleDkA1xVixm/7v158RyfQg/m02bbWJ9iMf6ZDHvGROyrI5K8JjAPUFU1zQv4GNwNqYpak4O7dhbstDw+TLc0BJhFEuBcuRw7PFB96ZXf+2Vc3o+WMsaxSzhxYJvWqr0nijqf/eHAN+hlO1zIDtPOHGS9sTfeqrGXLm0dvDKl2dAcD0TvpYfsFwpPBAFSCqTybZ1bLSBJDyPjjFoReK+xdk+5Haok9jvLo2PSuzco/4mnTeFciGUQOJ9wiaDURfgZZ16+O6ElWbyG6L8RsQY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW3ixuY4PT5J7q5PWR13SLyPOmX28X1/QipBDim+n8I=;
 b=vWhSJt3sFhcOr0KIHikAjBL7QyB2gHmYkPPDLKN2ciUG19753B62IstwZTXaE+31ppDiYBO35E9jqm1IRYBxYMaKzxNtAzl3lVfHcrLHJj61g0smWjqKCfsMFQSwAnyHQmJSryoAuckOwKzv4SJWdNXDYq3wdrNlbPV2Tvws5yE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 12/12] recipetool: Rework crunch_license to recognize more
 variants
Date: Thu,  7 Oct 2021 12:13:26 +0200
Message-ID: 
 <20211007101326.11075-12-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3236ddb7-d00b-4bcd-2263-08d9897b29c6
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4649F5442BE9B4B95AAB25F0D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+hRmKJFbX87ceDdVD+rTMc8p2/Pi91RIi1M9A7ErjiEAtosCY1r+dYpgj2S4UcJSle2V9kTnq1CBYk38h1oZ1dJVWwIKA2tCSFUuKzuaNsA5c3/8c3gw86fvZ5DZBlFSYzTeFBtHynltUlsJmxCpufekpFDX71VU+LPs6wL0hsO5eRtO9iksETz4j9fizuhyPbWNxU7alQKnqAK655GW86PUP/RqxafEp8qHhFtqNFugkg3u1V4Pgzbi6h8p7mdOg2rLig7C4hoPveFzt72CD5Xk53D2Svxy6odEFWUf2ih4tMnuSFRHNk7ITmVZisMob/tWFhhJcqfpFrcBQDtkyAprzkjUIVibncdTKgHGTZWNnCYTYnzWRos8qaMkDvVHe+l5TcLDR4SHUJCcy5ctMhePCSN4Zz5Oknrv2/QqVxfqqkf8nzpQuaXcGbvIn+QmQx4Ei2NoE+5qrdFTvGnNq7sGkYXwUjwtn3b6DRPTpQoorLHuWAPOVxd1jFEGx6/uS1V8efGm/BWcTq1wRDAnsZSmdoMoUGfg3eOwDbX4XrsQQBSP1cnEvYvfYRz46vKYYgYhcI7f5KaVdrtHbWmoT3BarKL2ulObmwHJ/B/2xwwfKOLWTEGmQgsNroKo9USUUxZEBqgRBRiu1FDE5CeNcST3CL+ty+q9FEwUl70SOOh7Tpi45jtDqjlTbigs3Qj5aD9/o7gxDk+XkuDqKJqOapFRuPq54OoPlAWeRfDpD3DSw2EZvZAXSqkMfd8Od1aNdSrTMSCOrYV7ejskcuXIgyJCTeeoVDwbsDTYYiHwRIhMC6GwTPEJucipcPj5TcqGteGUaeZYEQTplh6h4cUsIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(966005)(2906002)(186003)(45080400002)(66946007)(8676002)(83380400001)(107886003)(36756003)(38100700002)(38350700002)(316002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pWSYsydMSi2POLeQqN6t4h0JE6q+HzCoCN9ESty/Hvp7DTtaYBq6yXHK0ayy?=
 =?us-ascii?Q?WNAIQlCfVL0xSdwpgks2HJ4MimXEjtOi0DCL0a7E4/b6Z8MYdgB8mCXrjC10?=
 =?us-ascii?Q?14y+4M2x4baRoq0Pgl5lYOIyaA1jt2I3cipIi2g2PYc2kUlU/N5q5ThVgrTv?=
 =?us-ascii?Q?DfZ0wi+7sBxfEBhvbRZTI1ATYDUQuEbi9xodLtmVEmqhDasiQsHK1aF11u3H?=
 =?us-ascii?Q?6TdQFL0+I+PdbLWbPG8nb/vbxsMPmdPFQXlB7mKiC82rWrf1GwthYZSn8Iy3?=
 =?us-ascii?Q?9yb97RbzN2voFVX47meEaSVdXOUlKcB9t5qqXH44hNMkmGrpcLk/q/q26rUm?=
 =?us-ascii?Q?cVdOdHEw8shByNuxQV7xfOtofhEnrKxvX8AaZHoitkTD0AKKoivTfSRPLYQv?=
 =?us-ascii?Q?eox8Ns8dYW4ERmM3u346mjWLUB8GU3a1pTqf1Ir2aLkadpirugXwNDVc3hmX?=
 =?us-ascii?Q?Px0BueVnLTSK93iel5I8i/CF/QCrUqpvEob0/UXC0fKq8emq/p7IvsvnhZmw?=
 =?us-ascii?Q?CqdmqMcSxqMAXVKz8mLfznjDXreU3GxQGNtejxwPkuk0O4+zrPPaM1Y8Fw5u?=
 =?us-ascii?Q?729FTmr/VHgdyd9m2VgjmKDpE50b/dRz2X1WuMdxwCbn6z3THcKCPs4q+Ew9?=
 =?us-ascii?Q?nx7MmjrEG9410+eeEJkSoADnGDwpNT1si6BSPleBS2zjYty4ilaQ6EvH44hj?=
 =?us-ascii?Q?2NQBjmOe12ghW5b8AHtGDD0BjzL/6o5eDjb8kUrmcTlBFKhsd99/m+CWxaBm?=
 =?us-ascii?Q?rnFW1awAhCVyF+t2b8E44HpOlFniFWNt48IyVHcxc3VHIQN0fbBX8txscQ3S?=
 =?us-ascii?Q?M353ag23Fho83f0O4uo2FkQXrgisS0r+9jhuz2a4E2jDCO75YCtgn2bZRfLh?=
 =?us-ascii?Q?2AtQXHUzEmfWUvgHLPEN2PqWiOUvzUgbtgpdSqxpDA+75RrspSlF1Kp3A45f?=
 =?us-ascii?Q?9L5T1Rl/+RRmTZEYZcr405STzrclMIo40ajGhXU3uEMg3eg4fVl6K/FHuh2K?=
 =?us-ascii?Q?ZrWt/Ta8d3+z795Fz1OkH6R1hJHJnf6xdsUDEpdnzKJDGVpE9SCPnb3McEkq?=
 =?us-ascii?Q?TpkcUf8H27OOQckSyKFWvJW6IlfP5jHjA0hkkZ6xuVxhwAfScSiUCpNR1ylS?=
 =?us-ascii?Q?lPKCzAlQ94efg/b11+LlB7K11bnnUMipFJ/gPJ4wbVj7WfbNCD7qDrsSX1Ne?=
 =?us-ascii?Q?r0I0fldedrKayqAjh0W7Q8GrMLSaS1Xtu3hQ5AqrzVLX9neam686yCaz5M6/?=
 =?us-ascii?Q?bvMBUeSXsmYLfkze5zdFONdo+6tKObe/7K4/PpR10/w3HdbwEazWP0695yyf?=
 =?us-ascii?Q?gigyII0hypTraPIJCt855oUX?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3236ddb7-d00b-4bcd-2263-08d9897b29c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:52.5853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Sy1WJuGKBJOpQcXVc0c6E1jfFY9plmQpbokpt5iLxGYXBp1HIBSGmMK7Dd/pJtuNHbVT4w+Qbc6UfidQ1tOGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156719

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 121 +++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 047462d389..5e5d10e432 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1044,54 +1044,127 @@ def crunch_license(licfile):
     import oe.utils
=20
     # Note: these are carefully constructed!
-    license_title_re =3D re.compile(r'^\(?(#+ *)?(The )?.{1,10} [Ll]icen[s=
c]e( \(.{1,10}\))?\)?:?$')
-    license_statement_re =3D re.compile(r'^(This (project|software) is( fr=
ee software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,=
10} [Ll]icen[sc]e:?$')
-    copyright_re =3D re.compile('^(#+)? *Copyright .*$')
+    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,15}=
 ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
+    license_statement_re =3D re.compile(r'^((This (project|software)|.{1,1=
0}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) unde=
r the .{1,10} [Ll]icen[sc]e:?$')
+    copyright_re =3D re.compile('^ *[#\*]* *(Modified work |MIT LICENSED )=
?Copyright ?(\([cC]\))? .*$')
+    disclaimer_re =3D re.compile('^ *\*? ?All [Rr]ights [Rr]eserved\.$')
+    email_re =3D re.compile('^.*<[\w\.-]*@[\w\.\-]*>$')
+    header_re =3D re.compile('^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
+    tag_re =3D re.compile('^ *@?\(?([Ll]icense|MIT)\)?$')
+    url_re =3D re.compile('^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
=20
     crunched_md5sums =3D {}
+
+    # common licenses
+    crunched_md5sums['89f3bf322f30a1dcfe952e09945842f0'] =3D 'Apache-2.0'
+    crunched_md5sums['13b6fe3075f8f42f2270a748965bf3a1'] =3D 'BSD-0-Clause=
'
+    crunched_md5sums['ba87a7d7c20719c8df4b8beed9b78c43'] =3D 'BSD-2-Clause=
'
+    crunched_md5sums['7f8892c03b72de419c27be4ebfa253f8'] =3D 'BSD-3-Clause=
'
+    crunched_md5sums['21128c0790b23a8a9f9e260d5f6b3619'] =3D 'BSL-1.0'
+    crunched_md5sums['975742a59ae1b8abdea63a97121f49f4'] =3D 'EDL-1.0'
+    crunched_md5sums['5322cee4433d84fb3aafc9e253116447'] =3D 'EPL-1.0'
+    crunched_md5sums['6922352e87de080f42419bed93063754'] =3D 'EPL-2.0'
+    crunched_md5sums['793475baa22295cae1d3d4046a3a0ceb'] =3D 'GPL-2.0-only=
'
+    crunched_md5sums['ff9047f969b02c20f0559470df5cb433'] =3D 'GPL-2.0-or-l=
ater'
+    crunched_md5sums['ea6de5453fcadf534df246e6cdafadcd'] =3D 'GPL-3.0-only=
'
+    crunched_md5sums['b419257d4d153a6fde92ddf96acf5b67'] =3D 'GPL-3.0-or-l=
ater'
+    crunched_md5sums['228737f4c49d3ee75b8fb3706b090b84'] =3D 'ISC'
+    crunched_md5sums['c6a782e826ca4e85bf7f8b89435a677d'] =3D 'LGPL-2.0-onl=
y'
+    crunched_md5sums['32d8f758a066752f0db09bd7624b8090'] =3D 'LGPL-2.0-or-=
later'
+    crunched_md5sums['4820937eb198b4f84c52217ed230be33'] =3D 'LGPL-2.1-onl=
y'
+    crunched_md5sums['db13fe9f3a13af7adab2dc7a76f9e44a'] =3D 'LGPL-2.1-or-=
later'
+    crunched_md5sums['d7a0f2e4e0950e837ac3eabf5bd1d246'] =3D 'LGPL-3.0-onl=
y'
+    crunched_md5sums['abbf328e2b434f9153351f06b9f79d02'] =3D 'LGPL-3.0-or-=
later'
+    crunched_md5sums['eecf6429523cbc9693547cf2db790b5c'] =3D 'MIT'
+    crunched_md5sums['b218b0e94290b9b818c4be67c8e1cc82'] =3D 'MIT-0'
+    crunched_md5sums['ddc18131d6748374f0f35a621c245b49'] =3D 'Unlicense'
+    crunched_md5sums['51f9570ff32571fc0a443102285c5e33'] =3D 'WTFPL'
+
     # The following two were gleaned from the "forever" npm package
     crunched_md5sums['0a97f8e4cbaf889d6fa51f84b89a79f6'] =3D 'ISC'
-    crunched_md5sums['eecf6429523cbc9693547cf2db790b5c'] =3D 'MIT'
-    # https://github.com/vasi/pixz/blob/master/LICENSE
-    crunched_md5sums['2f03392b40bbe663597b5bd3cc5ebdb9'] =3D 'BSD-2-Clause=
'
     # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
-    crunched_md5sums['e72e5dfef0b1a4ca8a3d26a60587db66'] =3D 'BSD-2-Clause=
'
+    crunched_md5sums['50fab24ce589d69af8964fdbfe414c60'] =3D 'BSD-2-Clause=
'
     # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
-    crunched_md5sums['8be76ac6d191671f347ee4916baa637e'] =3D 'GPLv2'
-    # https://github.com/datto/dattobd/blob/master/COPYING
-    # http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/GP=
Lv2.TXT
-    crunched_md5sums['1d65c5ad4bf6489f85f4812bf08ae73d'] =3D 'GPLv2'
+    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] =3D 'GPLv2'
     # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
-    # http://git.neil.brown.name/?p=3Dmdadm.git;a=3Dblob;f=3DCOPYING;h=3Dd=
159169d1050894d3ea3b98e1c965c4058208fe1;hb=3DHEAD
-    crunched_md5sums['fb530f66a7a89ce920f0e912b5b66d4b'] =3D 'GPLv2'
-    # https://github.com/gkos/nrf24/blob/master/COPYING
-    crunched_md5sums['7b6aaa4daeafdfa6ed5443fd2684581b'] =3D 'GPLv2'
-    # https://github.com/josch09/resetusb/blob/master/COPYING
-    crunched_md5sums['8b8ac1d631a4d220342e83bcf1a1fbc3'] =3D 'GPLv3'
+    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] =3D 'GPLv2'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
-    crunched_md5sums['2ea316ed973ae176e502e2297b574bb3'] =3D 'LGPLv2.1'
+    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] =3D 'LGPLv2.1'
     # unixODBC-2.3.4 COPYING
-    crunched_md5sums['1daebd9491d1e8426900b4fa5a422814'] =3D 'LGPLv2.1'
+    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] =3D 'LGPLv2.1'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
-    crunched_md5sums['2ebfb3bb49b9a48a075cc1425e7f4129'] =3D 'LGPLv3'
+    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] =3D 'LGPLv3'
     # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v10
     crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] =3D 'EPL-1.0'
-    # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/edl-v10
-    crunched_md5sums['0a9c78c0a398d1bbce4a166757d60387'] =3D 'EDL-1.0'
+
+    # https://raw.githubusercontent.com/jquery/esprima/3.1.3/LICENSE.BSD
+    crunched_md5sums['80fa7b56a28e8c902e6af194003220a5'] =3D 'BSD-2-Clause=
'
+    # https://raw.githubusercontent.com/npm/npm-install-checks/master/LICE=
NSE
+    crunched_md5sums['e659f77bfd9002659e112d0d3d59b2c1'] =3D 'BSD-2-Clause=
'
+    # https://raw.githubusercontent.com/silverwind/default-gateway/4.2.0/L=
ICENSE
+    crunched_md5sums['4c641f2d995c47f5cb08bdb4b5b6ea05'] =3D 'BSD-2-Clause=
'
+    # https://raw.githubusercontent.com/tad-lispy/node-damerau-levenshtein=
/v1.0.5/LICENSE
+    crunched_md5sums['2b8c039b2b9a25f0feb4410c4542d346'] =3D 'BSD-2-Clause=
'
+    # https://raw.githubusercontent.com/terser/terser/v3.17.0/LICENSE
+    crunched_md5sums['8bd23871802951c9ad63855151204c2c'] =3D 'BSD-2-Clause=
'
+    # https://raw.githubusercontent.com/alexei/sprintf.js/1.0.3/LICENSE
+    crunched_md5sums['008c22318c8ea65928bf730ddd0273e3'] =3D 'BSD-3-Clause=
'
+    # https://raw.githubusercontent.com/Caligatio/jsSHA/v3.2.0/LICENSE
+    crunched_md5sums['0e46634a01bfef056892949acaea85b1'] =3D 'BSD-3-Clause=
'
+    # https://raw.githubusercontent.com/d3/d3-path/v1.0.9/LICENSE
+    crunched_md5sums['b5f72aef53d3b2b432702c30b0215666'] =3D 'BSD-3-Clause=
'
+    # https://raw.githubusercontent.com/feross/ieee754/v1.1.13/LICENSE
+    crunched_md5sums['a39327c997c20da0937955192d86232d'] =3D 'BSD-3-Clause=
'
+    # https://raw.githubusercontent.com/joyent/node-extsprintf/v1.3.0/LICE=
NSE
+    crunched_md5sums['721f23a96ff4161ca3a5f071bbe18108'] =3D 'MIT'
+    # https://raw.githubusercontent.com/pvorb/clone/v0.2.0/LICENSE
+    crunched_md5sums['b376d29a53c9573006b9970709231431'] =3D 'MIT'
+    # https://raw.githubusercontent.com/andris9/encoding/v0.1.12/LICENSE
+    crunched_md5sums['85d8a977ee9d7c5ab4ac03c9b95431c4'] =3D 'MIT-0'
+    # https://raw.githubusercontent.com/faye/websocket-driver-node/0.7.3/L=
ICENSE.md
+    crunched_md5sums['b66384e7137e41a9b1904ef4d39703b6'] =3D 'Apache-2.0'
+    # https://raw.githubusercontent.com/less/less.js/v4.1.1/LICENSE
+    crunched_md5sums['b27575459e02221ccef97ec0bfd457ae'] =3D 'Apache-2.0'
+    # https://raw.githubusercontent.com/microsoft/TypeScript/v3.5.3/LICENS=
E.txt
+    crunched_md5sums['a54a1a6a39e7f9dbb4a23a42f5c7fd1c'] =3D 'Apache-2.0'
+    # https://raw.githubusercontent.com/request/request/v2.87.0/LICENSE
+    crunched_md5sums['1034431802e57486b393d00c5d262b8a'] =3D 'Apache-2.0'
+    # https://raw.githubusercontent.com/dchest/tweetnacl-js/v0.14.5/LICENS=
E
+    crunched_md5sums['75605e6bdd564791ab698fca65c94a4f'] =3D 'Unlicense'
+    # https://raw.githubusercontent.com/stackgl/gl-mat3/v2.0.0/LICENSE.md
+    crunched_md5sums['75512892d6f59dddb6d1c7e191957e9c'] =3D 'Zlib'
+
     lictext =3D []
     with open(licfile, 'r', errors=3D'surrogateescape') as f:
         for line in f:
             # Drop opening statements
             if copyright_re.match(line):
                 continue
+            elif disclaimer_re.match(line):
+                continue
+            elif email_re.match(line):
+                continue
+            elif header_re.match(line):
+                continue
+            elif tag_re.match(line):
+                continue
+            elif url_re.match(line):
+                continue
             elif license_title_re.match(line):
                 continue
             elif license_statement_re.match(line):
                 continue
-            # Squash spaces, and replace smart quotes, double quotes
-            # and backticks with single quotes
+            # Strip comment symbols
+            line =3D line.replace('*', '') \
+                       .replace('#', '')
+            # Unify spelling
+            line =3D line.replace('sub-license', 'sublicense')
+            # Squash spaces
             line =3D oe.utils.squashspaces(line.strip())
+            # Replace smart quotes, double quotes and backticks with singl=
e quotes
             line =3D line.replace(u"\u2018", "'").replace(u"\u2019", "'").=
replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').replace('=
`', '\'')
+            # Unify brackets
+            line =3D line.replace("{", "[").replace("}", "]")
             if line:
                 lictext.append(line)
=20
--=20
2.20.1


