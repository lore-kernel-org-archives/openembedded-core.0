Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.133])
 by mx.groups.io with SMTP id smtpd.web12.3274.1592383944875122203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 01:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=iLBkM97Z;
 spf=pass (domain: prevas.dk, ip: 40.107.1.133, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNgkydgcNX0XNv+jUFYM/GPXrMnhT0aiKgnElErN+ESytvF2znNIu4Q/gtgD+kqnBll9Hvmt4SwAy795Sei64kX/yTERTmZqJUXojAEYRyb6c2fXvfl3d6Ng9gVLTiWkmxG9zyene15Rc8cV/2EJENNQMg30lboML+9IGdyPruGH65w6QQiOTgmQamlaH5bDeuD8flpkrrsEov8SCaMchql03Eo29NHZnD7BuYvpyQzfrTbpIEKtYscdDB7tm68ZeZamI3+vZ70IWP2+q9/sGj81xI8r36/hXvaW4zHPyoBg76Ywj8mYRPAKCyEXVpyqtgscJSDQMIeTW9tTbcS5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbVpUY6g8yLEnL6uodwnhgY76/r/P5fbphDVVczA9Sg=;
 b=EW215E6DuLACO2WLFDR5KurGkbHi783LXMndECxhfGCTwY+bgi9ho5EIl5skekbqnPpZ69V31cqugAe32ue1t6UA10gFv10Q3VckqSmfU5qs3x1Co1f8ZDIZOLr0rhKHN0TGIEEEc+h75MFRiWApjg3iGYfG0B7VSqz32IU3M5OSj+x0xozGU+FkuEdc8fIRuKmS5HvFHt37IdKTRKuKNstLFyFDKH1FuNlTJJrWj+L1Z9IO4bVDtzjMuYfkexH7tdZIfVz0RLlXkzdBUAXgNxMbS3xQ8qETWJUlYQ7J0Vavf+GZZ06OUODzjVzXculWtZu3bcxjomUieanpozQqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbVpUY6g8yLEnL6uodwnhgY76/r/P5fbphDVVczA9Sg=;
 b=iLBkM97ZNqgEdxK1snKa/br7QslC94PAmztIQDb7oiKS5v/0fRZRTjbOZfYRnGk59dFDGKFuTRvrgCFjWHCqD159Z031hSLkor7rUP2Hlndkt1des60Y8L17BRH+VUJi9waLfKW8+IjSbknxeW8wo1hESWqQCs/xycWQZVxqMVw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2403.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 08:52:21 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3088.029; Wed, 17 Jun 2020
 08:52:21 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Pierre-Jean Texier <pjtexier@koncepto.io>,
	Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Kjeld Flarup <kfa@deif.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] curl: add debug info
Date: Wed, 17 Jun 2020 10:52:14 +0200
Message-ID: <20200617085214.29173-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM6P195CA0081.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::22) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.112.31) by AM6P195CA0081.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 08:52:21 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af3dd90-24af-41f4-4738-08d8129bbf72
X-MS-TrafficTypeDiagnostic: AM0PR10MB2403:
X-LD-Processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2403A8314DB96B08B233CB77939A0@AM0PR10MB2403.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxg30h5yzrustao5qwze1jIkgEQdCLyCuaI4CkWmbtchbTuwYglSZ/+hH97ZYN4ckcKKPgXAP4R1q5kiPGMGkMd6RWF3VYmP4v5LJOvf/fWSd+ma6c6lWdFvKNw/QpaU7WAWpwGNa956xhbIu8HSxOsS9QJ9H7a0uvbnudKfFKH/Z3dTTAra01J50fm6MRIQY4kUm0a+68dKPaTUP0pA8SuE6hA3eWJMARRIN5a7izLOQ8xlQgfYjEgn3VZxxBPEv8xw8m6vxgyT3JHt57a9Ki6aSZtFLtPrrBNJAmeQxoMgCQFbelLiqh5DAnWpEWRk/lDLR/KAsg26YbqYyKTT/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(346002)(376002)(39840400004)(396003)(26005)(36756003)(6666004)(86362001)(6506007)(66946007)(44832011)(1076003)(956004)(52116002)(8976002)(186003)(16526019)(2616005)(8676002)(6512007)(54906003)(8936002)(478600001)(4326008)(66476007)(2906002)(5660300002)(66556008)(107886003)(316002)(6486002)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: vouc1XELiNRzVLZ67WwkcUJ0AH0Iv50glw50DX45ccGbZzxi7JYGYk99r3KOb5na6g8Z+v0iTI9PuFOHY8PBHZ4jud40MnJayM5lAsxFkcotO6MK5ozY0nMP7VNcm6Shfxr3l10HVZzpZxgaJUApuuNRjd4qzMaiwdVqGfW/YN7+fhP2mpCcCRCdA+cGRvEZxPVuGcE+0FXL9jFOVM8BXiCWD88KrHKIui750zoCDC95yo+P4/JDhrGQ5njEau5ABaq5sZv/KcdLON0TbC3L8coEl60e8v62Jf846Mlry3Kgo4SHStN9yiq1mWRfc0QWvk1LBFDH209nPSzSbQDL1Ich6hdgW+vBaxXfFFcL+wKV8Vv1iudOZ76jM8veXzBML+8TQaBoTwAcEBZg9B2MT4d27P3kyg0oM+R/xSJ14L85ZZJVlgyDx2i2lzDCYpl1P7hM0gywG9FXe4jHDp8P4bLSPtRClh9KoW2PwSG2PJk=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af3dd90-24af-41f4-4738-08d8129bbf72
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:52:21.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6g9M49BUE+DVPkcs0mxi8bE/W811euTHOzN5N7jaUzfu+PYIxdv7EkJYTxLTtkaMuPxr6dHGSkuYALiiUDylI6rOSRl2XU4MND5dLOBb74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2403
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Currently, curl (and libcurl) is built without debug info, making the
curl-dbg package rather useless. Since debug symbols are automatically
stripped and put in that package by the build system, making sure that
curl is built with -g shouldn't hurt anything, but will help those
that try to debug a libcurl-using application and hence explicitly
include curl-dbg in their rootfs.

Unfortunately, setting --enable-debug then changes the default value
of the optimize option from (assume yes) to (assume no), while also
changing the default value of the curldebug option [which is a
separate thing that actually changes generated code to add some memory
tracking] from (assume no) to (assume yes). So explicitly pass the
appropriate options that make those two have the same value as they
used to have by default.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-support/curl/curl_7.70.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.70.0.bb b/meta/recipes-suppor=
t/curl/curl_7.70.0.bb
index baf72f8e75..bb25677ef7 100644
--- a/meta/recipes-support/curl/curl_7.70.0.bb
+++ b/meta/recipes-support/curl/curl_7.70.0.bb
@@ -57,6 +57,9 @@ EXTRA_OECONF =3D " \
     --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libmetalink \
     --without-libpsl \
+    --enable-debug \
+    --enable-optimize \
+    --disable-curldebug \
 "
=20
 do_install_append_class-target() {
--=20
2.23.0

