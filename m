Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web08.10550.1605117472773052483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 09:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=ln1gj4I/;
 spf=pass (domain: spinetix.com, ip: 40.107.7.45, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsBh/sKHPUlqoGkNPCi/3p62UMNPEfuX0CI88AgoZ7D3ZuaOyQJ/emriwUMXLQ9rPOAp1PfHzPJgYqNC1xyUtl7r/WEm5Nfr1XoshooH61sb9mR+Q2e6fD1ZCwhp9dKmRuWEP55qq2Z8M1Uf7PiFLD5YwTCZApLFK4KCaNjZYSXkk3lEWO9Bo3glHW5yA5KaFsqbXjOmjIwYycs8HcBJ+ajGDAyGjk3UPDj7jD4eORQSzOIQpC5FV1O00guxDrDsCaYQyNxxw7ikvK+/bn1uQVcNlQ6VELMGmX/TmDSqfG/HN/3/y9VSA8N2OMrfCsYivMI02GJe1Y/gFZbXKrMjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APIAKqNnxFGluXGjmm7KZp/NQ22LetGs3M69UNHFqno=;
 b=OHkZFm8cOEQiIiRXg6gNaJy6ggOx7/haHudAeLgbX5au0lq11dubXk5DsxJYWlaXV5vSl0MGVGJGfukrhQczpDRoX9iuE6HfgoZUfWDJTuv2wIg8MheCbNH6rt1bh+Kkps8cKQ++FpWfipN8aekXb16amPRZxXHF+nUq4tjka/3nCLy+pzpJkVq5xF0qfJ1Nks1Xqk58W6c9VqXG4S22qj+rG8cYfQZ+9ORy4vD74Ux4T8I6XmY3pvg467ZU0hYHI65IEpoDwB8x+nqljbtHxrYCa3LbxfVUiOKq7fhOp8dc8YZd1+7LP+7ntCgbUiw+mgLHLx+MvWrfsC0JBUB/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APIAKqNnxFGluXGjmm7KZp/NQ22LetGs3M69UNHFqno=;
 b=ln1gj4I/1wk8r+XgsUIEP6gPLKYaevllwQR6ONvi3EoM1QxvLXUijeHmcydL+aQ+WKNQny44hDKp8ZTaX7AsPf5zkgEksGkFVmjTP18LnpOrUF6QrYD75avpT92IpC8UJIVBIrCZ9Er2OKUZZ9r+96ZcsYrcoGNpAAfR7VmxV3o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB8PR01MB6011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:10f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 17:57:49 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c%7]) with mapi id 15.20.3499.034; Wed, 11 Nov 2020
 17:57:49 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [dunfell][PATCH] freetype: fix CVE-2020-15999, backport from 2.10.4
Date: Wed, 11 Nov 2020 18:57:33 +0100
Message-Id: <20201111175733.14111-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.1
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 17:57:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0558f65b-755b-4d56-5b20-08d8866b4dc0
X-MS-TrafficTypeDiagnostic: DB8PR01MB6011:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR01MB601135B367BA2FAEA8A7680E88E80@DB8PR01MB6011.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m6dRIOzlT2/JuWjVBaeP91ddpYf40IgL7/4ZSCO7v5mG5tIR/6T6C6SJi7F8LvDXOn0VgjYps9WHDtQWcOd17daOJi5EmgYyhf+N6dsf6CKjZa6eRaiXGN8NzPSvW/CjWjO3Tb6zjlfeD3hp0WMgp95FSM5JQGDuCJ6eSp5GHcemhZaXlN91W9ycamu88iRJVPsvHExD3hT6M4Y3eJAz1SjrczPDUzgrluFPN2YpG5H73HnJUWxmjUA59XyHIdDN+Wklx67dcVRR9KB3+Rle1Ke6sbz06iY9KyfRR7CVIOOZHUndFVPtTqDJAfp92JQJ/iKN5MIytmf53r0i7UxFjsSN5kvVZ5XQWnTpCDWKmEqmj+hwi2u+amR63weDZ/SfeRnbzwvC3cCDOxk4LYb20g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(39830400003)(346002)(396003)(66556008)(186003)(66476007)(5660300002)(26005)(36756003)(107886003)(6916009)(316002)(1076003)(6666004)(16526019)(52116002)(8936002)(956004)(6486002)(86362001)(6506007)(2616005)(2906002)(66946007)(8676002)(83380400001)(478600001)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1tiJXCSK9pQzGggwM+/jhHPn6Auv7OKw4AFQOiq7BNO4onyQ7xDBb2N+OvKd3eKuPtwE8qpXaaE6ae43Ba2ItUQdxP1irqsz2/Gq2ER7NAc/emDuuXkS0Rs8kFd5oD52/22uadsqzKq8WzhHHeo3oLeno5lBWcWvCF+G8NeWZhKqxaGaMdcUooQKIrMdJfCTdQhoPzGxvpAq0mYiVq4E2tndDmRgyo9WHrmw3tYf/o9Q+Dtk/ILVJHOXVSBYBqj/EKaV+RQRyBJF7ctHJNQHZEdmn9mts2yug3fc5nKqQreria7a0K7CxyQTFg9bLNpFprDrfxdtdPkTgxMvhLE+F20IZNWArkiA+U2ARzPtgOxCYXRapERIU9266a9PReW0v8BpewFUZcRR66e6swBaARj5SLVpo7uLuV6mEJpIx305BerGuhV3DDI2rUzZThQh3WKnZwDpC/BTWszt47/TjS9cokTKEleqvUTLJ/DXdzSl4Em4VG6ZEi/By7Vt7Hx7BbdsLzGbxW4cID5YiZdfYqSpV8xvXSUc1cvv0INp9EzU9QiPfHTSEK4p7atL0aiGIEiet+DlnRzyqOz6CCtbCUakw+ro/E0LLBYG8uSAeoajUtP6HEU0YEYjOu2vELXHfd1wkKe6rglp7KaAekXRdQ==
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0558f65b-755b-4d56-5b20-08d8866b4dc0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 17:57:49.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zba2vicm39aOXFBmb0gJJQ1wI9ppQFO8k3PvCn/K7WiF/Gy+R2PFPt+2U1lh+Fxj8rKGUhHgh7JfZwYXKmHrNQ4+gbvS00P+/iIr/zHy2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6011
Content-Type: text/plain

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  1 +
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
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index d1c093054b..2d444bbf19 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
+           file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.18.1

