Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.91])
 by mx.groups.io with SMTP id smtpd.web11.14982.1598366126154348851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=G8SA1I/s;
 spf=pass (domain: prevas.dk, ip: 40.107.5.91, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF0K1NuE/mzwX4ISQLrTlgvfNxyPx9uyb79zRaHONe2l2bhzP0nlrWZKS3h33cOTJS2ssKifYFrebGYg1bwmqG80Rf5sFmxhhJgQmP3TTrMKG6Q69GblTPLLNdb15ENHaA1vELcxv+Lh1+JBQwEQh8olcRXTHfKl8Yu8qwljadQcXyS4FHQ7h6wj5mXg9XiME1GS4d9HC1lnuHwaKiX5ShE5wMNNBycVcHAxrt08agJb6y3epG4a4H0prcxDCnu1FwJE7TtKxyqFM5bq8/rdt/1eiIVf0j6gWPem/N3RAte/Lm4PIBXoYSbgOv0WAqyrtvaLsB+MGwQWQtHDoMvu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZDBwF7XslEmReyEOmExEWl5WZHocthy4esAU21OQYA=;
 b=YTdLyXbx9PYTuczQ+DkYj6e9+/tmrXFZ/xGnBaD5ir8WzkbScMBpG1eNqqsJQjcadPI0n1l5A1GBqUcJnp6JVKYYj52DlBL3oBja7OyuXsLAytL9bQS3ww6QNBiw0+POpJYKpgWVNtxer5fdaz2vZ7Etl0TrKVNuLs63XRrSv/VpLC4v0OIa2PqLhlYEp3Vu7v3qiGGLi/7ECNtRS1yjST2McQ+3DV3e0tZNr4q40SRcwqJ659G6zhcrI6SXJ/5CGCfQ3K9c3VLg+7+DvCiA6whMZmAeRqp20H4nRW1ZhFI3NKDSWrua2Zwp3nUh8jFRHejUyIXDCp1nib0lvX9iGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZDBwF7XslEmReyEOmExEWl5WZHocthy4esAU21OQYA=;
 b=G8SA1I/s2TEuZffzRUIrhHtm+Z0VNZ8XpOSUK956sWmZt4313HTAkqdYiANJYOsTByblDaCJUJc68yU06XpIBinosPBG3LGOJqNbunWwLg3ALl9bvE6Ayp4ENRlu4D0EUeX8VK2fZCAkl4S6HfZXzbWTxBV5Tk16bIykjjJCEgw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2579.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:12f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 14:35:22 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 14:35:22 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] kernel.bbclass: run do_symlink_kernsrc before do_patch
Date: Tue, 25 Aug 2020 16:35:15 +0200
Message-ID: <20200825143515.12227-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM5PR0602CA0017.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::27) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.112.31) by AM5PR0602CA0017.eurprd06.prod.outlook.com (2603:10a6:203:a3::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 14:35:22 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f44a32b-229e-45a3-f1e7-08d8490418ff
X-MS-TrafficTypeDiagnostic: AM0PR10MB2579:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB2579D3EC60D6C8CA5AABFB8293570@AM0PR10MB2579.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YUxPkpzVGqfAQhT4D87K+Z6tJ18tbM8ipiJrSk2TMa0EJN6PRc1lBFMmMpzVa2Ew0tX+iJOn09tKhuAo323rUy3FGBPskkrU1RN7ciEXGpErvNqqSi18+9LCQ1EoNoJ6kYsvf4K9QEYHiw2bbI5iLOlR55fm8ttTX9semhcibnZH112PJ1tA7bXhUwDuPVH0IbhIzm9lHEdLt9NUjMqDZ7rLKFfcOR0jbsH7sRO4vJqPIoOXvgV4HXrUFouqG0rw7xQthuT3Ne8dTlVfPCcNWkwBPgl2P7rrLJN8CJyHnX19ReGWAzAYFcAipryR2YT/Ru107oPT3BnFBOYQuo9/mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(39850400004)(366004)(396003)(6506007)(6666004)(316002)(54906003)(5660300002)(66946007)(8676002)(66476007)(86362001)(66556008)(6916009)(26005)(36756003)(83380400001)(4326008)(8976002)(2616005)(956004)(2906002)(478600001)(6512007)(186003)(16526019)(6486002)(107886003)(1076003)(52116002)(8936002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	nBX7vVLV2dhkMPbgOFOdV73R/hmteA18F0OMO6cMsNfhJnP3hg7P4dwScfOnDX2tl//XgbFrK2dUXxobZ770dSn1jejXo24euRumpMbuhBQh8B31X/LsAzW1tzs720Zk9ptm4iyzztyxZ3tLdORv2O5E3vblmPYGbFklQODFD76hOP6FHMpk3McSkZ7Uw/DvcwtPTcgkKEWOOGJ1R3eACiH9C1pGDzvkFy6aItY0eoay5Hz+ZxtihxhXkR5wL69veY87mDUupNty0qdd0v5A6XMHNVIp+yJmczzig43UWtbRGZS7Is+Ki3F1LVA7uvzSlV11f7Rk2QKER9hjGMIYz0sHacX+opYqCEi9zRBHUiZD6y+npQuCEjQ0aGDTOgGhaCnW948FkIk51ZBkZFnB4kCWEk0eXGQ/zMaoVObbJUx9T4OCssdw2YRgVz30EL03LWj9/32Hlk9voKyIzQ/6JO/UVFeAUItT8M4j2ycqCCVgWdzy/9OjTVWd1Z3y+Q8J040uCEv5yBH4USwlsSLxnP8O/Vcg9al+7m/Jty09bhfFxvlheqCv3QwCQsNWr746c2JXcBVHWs8Wf0sqjOl5/c0/iUBP66prVHAvoCQvhJjQ14fauRjq5ednIjJcL0zXL0Plzyp0gaVaWBnQSsLrnA==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f44a32b-229e-45a3-f1e7-08d8490418ff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 14:35:22.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldM0E849Qk5Gu+1r1t2LaXslU23coNlIyWYINWN1v02F5VXdY5kkqXckhHlhxXwGRwESsX/kUynfrdAwpLxmWtu2qZUrTIz2v8mbQhvdlZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2579
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

There's a race between do_symlink_kernsrc and do_populate_lic, since
the latter is ordered "after do_patch"; so the two may run in
parallel. In some cases, that actually causes do_populate_lic to fail
if it happens to look for a license file somewhere under ${S} in the
short window after shutil.move and before the symlink has been
created.

Fix that by simply ordering symlink_kernsrc before do_patch. Any task
that pokes around in ${S} looking for files should be ordered after
do_patch, so this should also fix similar latent races with other ad
hoc tasks.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e2ceb6a333..cba77daa7a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -172,7 +172,7 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-addtask symlink_kernsrc before do_configure after do_unpack
+addtask symlink_kernsrc before do_patch after do_unpack
=20
 inherit kernel-arch deploy
=20
--=20
2.23.0

