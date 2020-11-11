Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.49])
 by mx.groups.io with SMTP id smtpd.web09.10662.1605117415625437154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 09:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=UhfEiSXZ;
 spf=pass (domain: spinetix.com, ip: 40.107.5.49, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJMiIObsIV5d2+JUgk90+j6Mj1qas1rUSy1Mv6Xaev+lVX6opdNa0FcpWWBZahYqVWc7U2LFeskKDv69dKyzEqoiay2u78wQrHKcwd5STn5xZHptBcpClMdka1WhbAux/ZYo97hUpdoLRQ0V8SNbH8In8fgeX8f4IXedRtlK1Ln7IHUTWeVEO5D7nv0iFIthXlRqDqR4juFmW6LxNu1VVXBYGfNbcO97v1I6UTZ2xfeAxHRL2AnAMztvsaac7uFwAZQQgeoxa+9pN7/p0c4fX4bf81onLMdt/kvvIfh1m18hCJge8xYRwBqYQFXhTY4jHjCIx6Sbg+12SJoAMfg09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTmHaYxS/SzQ2HGMlMJdiZls9u0F356OAqTgqdkd1E0=;
 b=hOyAKTjZAlQ0F1XtvQW0AhwMNQ/hl8x763NLI00DazpKdJQ2nqnKa0hupjt8GpZL6gXsHQivcVzP5HT6abjDmi7m7LQHHFnqnoqlsVwjsa0/nGrUOyzMeXXRNjRlooMPnUgjr72WEOtu631ICr7t0VF6KCZXxKO1x5Hgx5JxGrBNdy9wQ8dgpX/cTTzTJdOGhJrLcz6oUDjDaaTCESW4Uqnf1rlJVC5qA+QzA999bEr4LXwP1jRAhy7N0gK0X+J2sqxHqmBE9W7+fILyGMdvQKLamD0yLoPuqMYWRPvH7Y14gpEDJ0t+RLDkf7Y/h+BPFDF0te723SoyCOrdiUQq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTmHaYxS/SzQ2HGMlMJdiZls9u0F356OAqTgqdkd1E0=;
 b=UhfEiSXZ3ca6P3R53rjDnqg9m9D3KrVt/XrxlB8OQLsGB0psr9wODEwq68IbNQnNg7XCfj+vYEjXTXA/rmrKtHoRJRNOe2AXoFPaO81y/J2gzUkHIBYgMjkWGyBuaobwnPbS0llYpumUN3/0QFAusDjnuaTlOR9QvId4vnQi6Do=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4379.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 17:56:52 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c%7]) with mapi id 15.20.3499.034; Wed, 11 Nov 2020
 17:56:52 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [gatesgarth][PATCH] freetype: fix CVE-2020-15999, backport from 2.10.4
Date: Wed, 11 Nov 2020 18:56:01 +0100
Message-Id: <20201111175601.13818-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.1
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::18) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0031.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 17:56:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b41ee11-32c6-42a8-2099-08d8866b2b78
X-MS-TrafficTypeDiagnostic: DB7PR01MB4379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR01MB4379405435B6B8736B5DBEA288E80@DB7PR01MB4379.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xOp+4p5s/CeFGy0NqNKpE+/04FZz/KvPihnw8f0xurb4RbWDupbWA/i+ErPtgeUD/e5C2t7g6G6qLV/m/xVExLJ78NYjxLEYZybmKqKrDua0oJlRMu/kWQnzexrMe7xrSt6FA3+umKnY+VEJ1lqCSJUS7XlCj+714nlcLQIR19sbx/FJUaktcCZTmrQJErBz6zq5561sOOSzvEzF6WzZsemCT99C9PCy5f2kc2vuYt7CZzLy94ucTMyTBz1hfg3SLlNSvKUyLi1kyAJ2IgvTR63acR4AjzkeebcAjOI7HeZpvAIXuel0T1f8yoEU4DkazQ9eY7oPtDhLxMaL1oPBJXDH9pERZx1FrO/r0E79QOriiD5DdcrwKtLy0vML/3/nC8HnNSTY+hw5UUIIQTz6cw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(346002)(39830400003)(6486002)(1076003)(107886003)(36756003)(6512007)(52116002)(2616005)(8676002)(186003)(2906002)(86362001)(26005)(316002)(16526019)(956004)(6506007)(5660300002)(66946007)(478600001)(66476007)(66556008)(8936002)(4326008)(83380400001)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ytjS25Fer3m0z7inX64dOAFLeQWQOMMw7SgApXDfhvxp9dgEgP9XlUxiEK3ajG0JGON/kHNRllJco+Z5g1Jtnko6F5PtjCC2xqSueDk4sH91ABvIiciNO5btRMJmUlonPkjRQSGIBCU8xlvunK2Rsr17AZmWAy7jC4Z7RkduIn6LJcozmyEHqmK6zF2X/fLZ8qOigp/BIENjuH1kXQDe+VqK8FGS3NUxTYEENVdbfnDQ2fqbL32EhkyDvrQ2g588zGaVxwPRSY+lFzJo0t5SME7oH5c5NUutO1wJe8kLCDHIRfiaCA2sn+NruxU5QTIaPRwfCnrqxSzewulFlnXvERHuiMk84Li8+gyen+8UScOZNNAxcjW8HN4+HSmHC4WYIbhDC/Ij5NlSUeu4Ujulwj3xtvjrH2b0JC51Po4urZloJlGNV67IWNTqR44BNxA944Rwy3MDxBE5Xknb6RWp8RukjKzXpYy4roErRMYQuMgVfVuHCrpKoT4Rd5ij0LJKJ6k7aLBq0CmOIwxdL+83l/euJvPxPi+ULV6TMl4KPUf0zNyZoffyPibMPBtD2kfw3/WVBIzF5I5uy3zR16o+AP0jlBz7L2kf+ztFIDsR756ZCNrzR/Aw75a11PDwthQHj2NA5mbMiTaAvTCMELMsIQ==
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b41ee11-32c6-42a8-2099-08d8866b2b78
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 17:56:52.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TigJZY6Rf7TbR5UDNDg7WIYahPxFdKaOoO40Bcd3OPHheHJif/jgeUJDI8QjaqAOSXFaBICt/9mNRCR5aC1q3Gex/tyRZHMveJ/rIffLfjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4379
Content-Type: text/plain

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.2.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch

diff --git a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
new file mode 100644
index 0000000000..fa8a29b798
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
@@ -0,0 +1,51 @@
+From a3bab162b2ae616074c8877a04556932998aeacd Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Mon, 19 Oct 2020 23:45:28 +0200
+Subject: [PATCH] [sfnt] Fix heap buffer overflow (#59308).
+
+This is CVE-2020-15999.
+
+* src/sfnt/pngshim.c (Load_SBit_Png): Test bitmap size earlier.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=a3bab162b2ae616074c8877a04556932998aeacd]
+
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ src/sfnt/pngshim.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sfnt/pngshim.c b/src/sfnt/pngshim.c
+index 2e64e5846..f55016122 100644
+--- a/src/sfnt/pngshim.c
++++ b/src/sfnt/pngshim.c
+@@ -332,6 +332,13 @@
+ 
+     if ( populate_map_and_metrics )
+     {
++      /* reject too large bitmaps similarly to the rasterizer */
++      if ( imgHeight > 0x7FFF || imgWidth > 0x7FFF )
++      {
++        error = FT_THROW( Array_Too_Large );
++        goto DestroyExit;
++      }
++
+       metrics->width  = (FT_UShort)imgWidth;
+       metrics->height = (FT_UShort)imgHeight;
+ 
+@@ -340,13 +347,6 @@
+       map->pixel_mode = FT_PIXEL_MODE_BGRA;
+       map->pitch      = (int)( map->width * 4 );
+       map->num_grays  = 256;
+-
+-      /* reject too large bitmaps similarly to the rasterizer */
+-      if ( map->rows > 0x7FFF || map->width > 0x7FFF )
+-      {
+-        error = FT_THROW( Array_Too_Large );
+-        goto DestroyExit;
+-      }
+     }
+ 
+     /* convert palette/gray image to rgb */
+-- 
+2.18.4
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.2.bb b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
index 1034ddc0d7..cb0006b23e 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
+           file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
           "
 SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
 SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
-- 
2.18.1

