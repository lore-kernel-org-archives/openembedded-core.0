Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.952.1600787728540473183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=FcXFrxb9;
 spf=fail (domain: prevas.dk, ip: <nil>, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNgDNGY8xU344x6CKOUWWjRtNOLg+q02C0NsCbd2Yn31IwQvYrHCZNEW3nAB9SV4muqRSQZFFizuka94P29pNGOceaOjtnxteMlAIp3JRgnq5adgvDnpwKlZ6b4fY/qICPCSNvOeugtLRKo8WGmvldpOWbsBKO/BnjtGC/WbPasC8JeHVvhixxHTKdxsJq1jv8zVCdx+5ohw7wNpLMIj4dIlnUu9EMSJVDIoTuzWOZmqMm5rSw/Sgb7bd4Zg6ArSJdU8/wPm9StiBdeULkp8bj8oxSpoMXNTmCDLOVAyJry7znQjtLRLRZPdOrTZ9LQJBMwlI6EYNA+pY90Qmjo3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymyy/VpRspbQv3LWfbhGSfrVqOMdAeywz738e6xo3w0=;
 b=nrkvxHQKCOcA05+kYqaG2titR0kVwhofq9g3luZUMggeKdexUpIilgpWobhvbeJjLos75bMA/ieER2ptvv0nfnl8TW6c62vftxY0xfMqiDkf1pGT8CdKkFAQhORj2Yo4PxauzlYtIqTowb7Ec6BkScAHobyuBzW8sZm11I4g9vEdkszJMXnmJ5Xixi0EcGj/B28NLIkiie01oxSVZmkuWmW3DvvfanGfzde8KxioYsYwaEhKCLYUJ8Cq3oVNBJja2cg3qJFUIx10Aikcbth5fc3BFy5eQAOeovueSnBpCL4hgDs/Cj2xeslI0/soAfBQrz4no/RzQ6ESOSofM9TzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymyy/VpRspbQv3LWfbhGSfrVqOMdAeywz738e6xo3w0=;
 b=FcXFrxb9/t8jrXOyTnFHx28rGk/fr5++TvUisGd0+1GJ8EZavbMoJV6flkA+ZB2xOdasZ90Wu3ayZbLOEsaD8yLxQ7fJthoIUbVbjsjGBJekfBWx6oVftwIpuQmpsbhX7p26RiNUKaevhU95BzptBFYFZvjI8UNz0Y3G34csp5A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 15:15:27 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 15:15:27 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH 2/4] externalsrc.bbclass: make SRCTREECOVEREDTASKS noexec instead of deleting them
Date: Tue, 22 Sep 2020 17:15:16 +0200
Message-ID: <20200922151518.1615-3-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
X-ClientProxiedBy: AM0PR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::36) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR01CA0131.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 15:15:26 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bbf25f5-380f-4db4-64c2-08d85f0a55f0
X-MS-TrafficTypeDiagnostic: AM0PR10MB3441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB34415A69113D9FF6D042BBB7933B0@AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xh3vHdShCatX/itiGkMIQz7ird4NhsOdX6LCWiihW6fUq4hXADfXOy6ELIxcc3NlmFKQK2BuTdmcr9jtk8VpdL2VbnCS38qcLZ3xncwDySOeDXuSY0yZSoQooZg0C3w3pacoJe0NYBqPC6WjtWnVGIzTP4gkVhqxH2F1kuiROci9aRL7KX42XGbAjKmhOdOGMdUuKrOXelXKaarRD3ObUxVijGdK4IDdpoka592+Lw94lyrwQBXGBr5J/CEZO5cP+ATtFQqFyNyeFyHsqF6gOL6E6CCkRaWTlZdKPM8HFSa+ShFZATl8CU8pKyS+RK3cPfUMwlnpkNAkL/W+8l5cXi2DXVh2TQb3cdRuBfe3FAWTEO1uRu1RC+sIPdqYVJ85
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(6506007)(36756003)(186003)(8976002)(6666004)(2906002)(107886003)(5660300002)(1076003)(66556008)(6916009)(8676002)(66476007)(6512007)(478600001)(26005)(66946007)(83380400001)(956004)(86362001)(52116002)(8936002)(44832011)(54906003)(4326008)(6486002)(2616005)(16526019)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	CTCqYCeamccXwS6VBlG6Tvr0TK6ZFOTFtcdONP9HU0loHR2wrtYkiAOdtjBcvC0BNAuSvjAYHn0QC2/ATophGCAnvszcdcn8HltRuqYebJAvw5cO18Y1tpFHLLBuixZcUuGqTSVyjgd5Zmfh4h1M7kPt4oyM9T+brt2tBDMSKSNZYkZwp8iOuAg8ejAOBzZu69XBzqOdHNX2zrT6jOJmdId7JuOmahJfUg9kvwxq+9JcTAIuN/w3v2xGQbtl96NJNSH/Piss1lXqwJlNolJHVn0MXVNG6Ao2/C5ESR7LQvVNzVjXnvIbDAs4cPB6teABFm3lMl17alZ4Dzbo87yFrDcCagxEypn3KrYYsugUvfePHOMMKx5hW5eGvIj5QojWmtjg/2SGf6G/S2i4VGVtDFDGknOvp0hiGWlRG0WuKyDwRLsPBH9iQFN2R+qqfDio410tpStUNvf+8DXvgX1Tf45oBmtPXElCaYn961qJ1Z59vgBOqNfzreH3SEytxjlVOpLfsIVxB/WPhZgdofX2LzY8ou8P8ZCpElDpx2N3wOb8NtX1E8z2CZFUf3VkkQOSZ7RVPuspNZs1Cs03zA60eF22qqJLezaHuOXs25ULJx6IJ7Mi3uqDnkJbxzLxr7LEE0SVZpMdBZzHafezAEbUxg==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbf25f5-380f-4db4-64c2-08d85f0a55f0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:15:27.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyTvnWiKXUrYKqI0jWwiDWK5i61etY7rsjtkGFeaWZ7NTGnD3s+Ou5G1xH9tyTaT8mqpGre9oGwqn7p88ShxPGUNC518Dxn72nx327tnFZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The preferred way to prevent a task from running is not to deltask it,
but setting the noexec flag. That way various implicit dependencies
through the task in question are preserved, avoiding ad hoc
workarounds, such as the one right here.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/externalsrc.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index d200129987..7b4d8b369f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -100,14 +100,11 @@ python () {
                 d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
=20
         fetch_tasks =3D ['do_fetch', 'do_unpack']
-        # If we deltask do_patch, there's no dependency to ensure do_unpac=
k gets run, so add one
-        # Note that we cannot use d.appendVarFlag() here because deps is e=
xpected to be a list object, not a string
-        d.setVarFlag('do_configure', 'deps', (d.getVarFlag('do_configure',=
 'deps', False) or []) + ['do_unpack'])
=20
         for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
                 continue
-            bb.build.deltask(task, d)
+            d.setVarFlag(task, 'noexec', '1')
=20
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_pr=
efunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configur=
e_prefunc ")
--=20
2.23.0

