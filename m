Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7C5C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.89])
 by mx.groups.io with SMTP id smtpd.web11.6161.1633679337460503950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ap3ZWFhU;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2JOyUMv8tUcnLIiUQ3PfLMjDchZ4L29uaC2d8PjNHGG6E+oJbjai9dXVJUTw0U8ZXXk+5QFGTlEVRXfRSHnVF1MGXhxftvadVggElumfsPNxPQKcdeCnNr0aY27olsKnLRz95eSsvVPTJhmj4r4qcMV3DlJtbsSxywfgKPcRapeyetEhjR5OBa1Ex84h/QLjVHcnAaFtXAbmiZil2p602jDdjsep0hqV5OMoyzWusEAC2198vqvXq7hKIP8kcoCsRYXiDeys+Lsz2HvzQZaCzmUa7YQwX0Cr51v0diIP0zq9YCotvdGsldF2Qf4xcwtfJLXAgNycWkvM7mcFl4x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCckV+wggiN1DKFMEuie2uVqk/2s5IAHWlPojt+Rnhk=;
 b=Smsvao2ZEQlA/IPlYhFtJrdFXme0/l0qwEp7nnIfjKtyV0Ksm6+Gi99bfQGlvPVZaDAhO8JW/lUaIRjDa2VBtdJ4RlmnVKrFrsdoQdXlvQYZkVQOSvugE+5gS3sBt/OBgZ1mTfgPwuaKAwCd19Y/SK5x8avYMnGl/d4gSlwIEvt/fE6nSHOb3QOCYqJn3r5T0xoVbW7ERfwmu1UM7qcr6HdmdO8NMlSIVfgmRS26S+E4g9rPIUGt9H+tsM3SCQmgEs8IlQ7SVuefopWYWodXYoxHGvkBDcaRuPYbCqHFhLfTJm4l7nQAvo9txMrAV9rrkgj0wv/tdkjKbGZlg0tUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCckV+wggiN1DKFMEuie2uVqk/2s5IAHWlPojt+Rnhk=;
 b=ap3ZWFhUjn4OWRHQoX7C+cR2u26UiX5SvRHN+cMXVU/tIuoO9VIWDcXDnBpIPoHHDZyAKgDdcRCZt+VevQ6zNd2YJwW7vriDTO8uuAYcX8XHSaZleiDB1YuufSV9AzD/77yj9PlgKRmwf3/jqb6h9iheaSfTwJ7+NFLBf87Vo7s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 07:48:56 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:56 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 12/12] recipetool: Rework crunch_license to recognize more
 variants
Date: Fri,  8 Oct 2021 09:48:35 +0200
Message-ID: 
 <20211008074835.10320-12-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8220ee8f-3706-409e-616b-08d98a3014b4
X-MS-TrafficTypeDiagnostic: PAXPR08MB6478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6478E13D354E044E55D44F4AD7B29@PAXPR08MB6478.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bqskXnMKr/zyKAGLYa1KeBKETHrdDnE33PdvBb+niBvk05019EHCBHwtkNv3lWWNdVYOgadSw4QflPQ1iCcTqGPABqpy4bWy1DqgTcR8Fw5JKo7qWAxQe8xr/12NJbJ/90rKW5/LPm1MgW1PTDmMO1ggsNJZ3ma3rCedQfz1m1Qp4Pd67sC7PwNr8mSAqNpzdQ99EIbGdIVZ2zo1EAMieDjBn2ZBpC8iDK7yx4exCvPeQzlY9LtKkPNMIQjy3paIvVJrFd4wkJKDC8jskRT3u12bEHA9tAsHZXgG3pqnA+G3+0iumThAks1DUcBH47yjmvWn2YtgRtaCtipKCdyxhDcy4LLi+vrvDcksTyBXPNncJNXIfqWf64PmwVBP7RRam8qojglo++Nqt0HMFqxUFmQqLK/ilUFcjXsyonWh3fn0yE5pXQYpzR+ue6//ga+1RiLirX8WhKKqt4WP6lamkwuexwQXQzyxUTECbb/SD5h++HKwA4a5nsNG0buybiK4a+UNVzD7mbqhExnVLBAdzdXHuM5nTiBB4X+AlsKSn2cqRaE9bO9J2L/7JIuEYEpM/S5ZVvWEDentwRlzMuj5Vs+NfF+2hXyhNBfdGQ8JF8mxDJVjhDHZW+9gJPwsYkMx+4EUJ5P7dSyCW8koifNUgj3Bdoza54/YeJ3W+5muHK8/e4pXH41Qh2zdD7iLeLrUOoOJpmOtGYSxrbqaVXP0S6oGzE7wIwVKz7b/bjLGfZoZOab2RaBrlDkozNTgY5fV1GK53ilhF/dGuja8pxIiY9ZXUaAXxIxwrfKLfw+FSq55A/lU3PRLfiI4Qt8hiDwqh9CV68GKWdJOOKWfZ1LJaYad4Ctu4HsgbtIVW6DMacQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(7696005)(4326008)(86362001)(956004)(966005)(508600001)(52116002)(2616005)(2906002)(83380400001)(26005)(107886003)(186003)(5660300002)(6916009)(6666004)(66476007)(66946007)(8676002)(1076003)(8936002)(38100700002)(38350700002)(45080400002)(66556008)(6486002)(36756003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1+H5mdKZHdzWAuHx4pIXEee3JmI5ahmObj6BgT35lBBSc1SWjzlsv38ToVNI?=
 =?us-ascii?Q?X53co95rs7n+fb6yfe5SVzdy6/g4bM2ecPO3JHePEcGS4VRLh3DOh6nK/EQa?=
 =?us-ascii?Q?D7DDUFE1hzkWMUSjxMJPqa0V9E+LFMfJSuvE9ksoY4QQ+dpsi7uFui7ad4X3?=
 =?us-ascii?Q?9a4ohOhgvri+doI8Ypeg3p/HoRW0tD8JIoQqzuV/OFsiU8l7RqnHOGp6+y70?=
 =?us-ascii?Q?OFeIub55ffnn0ov92Hn3BhBguOQl8ErNm+/mjleG0IKsqlA7KA0P9vR6X3pE?=
 =?us-ascii?Q?70160ztIEes+aLaLikQIi5oUrzO2IA6QyDS7MEmlb/uDxWPv+z/xD+D4B7S6?=
 =?us-ascii?Q?4Tb5zHRrZz07gyHwhsZiNdD97YcKBPcPZULYOII9YgLsJ81suNQwQzEPI6Kq?=
 =?us-ascii?Q?cM3QSxed1AHZ0TcgypFIitDqfNxwL69AfubuDgkCA31jvEk1Dbf5872x/N6M?=
 =?us-ascii?Q?t4Bez/jtUPfjlpuOUefsUSnKurQ64PU8M34CnVDREaNBLVDk5ybkSxD9wQW3?=
 =?us-ascii?Q?6XfahWQkzP4xlm27n2TPJZs2N7gVHRvLVgYgds/Ff3WuMQkHgrM1WErtDXtt?=
 =?us-ascii?Q?S/XV5GMqq+mgNDorPn7aMiuZ/p5cPfncpSrfJhhWYTRi0hOepvUb6YY54iWm?=
 =?us-ascii?Q?aOnaQBGedMnj56QQ6XLctD9wc5S3qPGmg5vzWRBCf2iVUUUCwcYvLDXCoiYy?=
 =?us-ascii?Q?L8xiQOKHXnHn5NjyeuSvL/WWEC4TLY2w41Nd13Z5qwxdRTtNp4BzdFN8I37p?=
 =?us-ascii?Q?gkv+hhw1Db/dlPvyG5nbnwFNF1FS2W1choGAGQT8150amuPBdfNBiCE25qhG?=
 =?us-ascii?Q?ZIt7l9XGAxCOTxIbYLN86O1yTp3SnL2b9eDjsWG1YyCA4GUBJ0vU+SihLWiZ?=
 =?us-ascii?Q?piBVSZo9xasHVkV0VEbtwRpWv+yhbqbtprSrzseOqAQHR5haS7xemQmVpkWB?=
 =?us-ascii?Q?xBRnACEbBlaNevECftsL9wY6es33of6VQ8Rkjn9AUqkU0tqZzDqOU6a8mg7K?=
 =?us-ascii?Q?UdVNtPSdhOW6bTXqIxF1qAfA8KjlVY64JS+H4VIs4s+pH7UfAg/Un+dGP7MW?=
 =?us-ascii?Q?+/5eYgRbM2JS04Bv1yfBU2Uc4aM/fKC0XrjCfnYejY1lzII6/la52FOBnp20?=
 =?us-ascii?Q?IhFc82geA+F1Frzdy/5Oj1zJQHu6Q1dsu23dsaipywh5no08fWryNsPXprhN?=
 =?us-ascii?Q?k6jxIHGfOO41HDaZplxU6VjX+xgW1CZsx9ZGCrh04b0Qgw1J4uIT9K9+Q+sA?=
 =?us-ascii?Q?rtPyByeQ/P2LkO++J60CKa/rHawGID18K5IyTVAklWrDRK53A3XPFTofQD3l?=
 =?us-ascii?Q?6DRtQsNadVrLBfXcRY2J/FQD?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8220ee8f-3706-409e-616b-08d98a3014b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:56.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xgUb5zwYma0i9jSycDvl7X2TrYteJZsivXaX0SJzpeZfbF+AMSJUbDqld6tjhAj41y4ZolR2mTtVIe5iTmxPAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156769

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v1)

 scripts/lib/recipetool/create.py | 121 +++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 277266be4e..3b58d6fa82 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1048,54 +1048,127 @@ def crunch_license(licfile):
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


