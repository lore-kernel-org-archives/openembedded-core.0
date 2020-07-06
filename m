Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web11.60267.1594049058544683593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=sj9AoFXS;
 spf=pass (domain: vaisala.com, ip: 40.107.7.50, mailfrom: hannu.lounento@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwsO0Yir+eRKFX3zJj8jikwUhEJUh4kKHitF3YA6YALDs3m2NkXx/gI9ZhD2xkpquJ2n/ZPIXGNftB/WjMltb0BlsZ1XH4o9t6Wgm+mY4rLqEbRr3wTI4ci0ZEVMYXw1KfGzx67P8kbiCoptD3tUiySQWlp2mL+wx9DKDBsv/gaoReUV0m7ZC9Xv4zSKL6f3hi4tfeiKTg0+GbsQGcH5SHP08piAERuZTqQbxjHCsEHykkF0t9OupDH86M09VXBSTzecmU155MoOrkVHTo7a0ApEt5RPliHvRtyJ6PzYxPlnvBHC8f9Iec2eHZpZaLoQj+cdh2HPknCrwzYVlrA6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4czteIu5WWHfuESBsu1wFVuM14GGDGLC8egmBYV+v/E=;
 b=Kp1gSRIRoTkhJWwOGYTs45df1tQwzegfw9vOiUwXJQgZCR04sj6WAXDhgjaSSRo84S26Ct+FrBeL0LHcgJ4/4cF39CJCoRENSq8uxdqPKrRStoZmIjbUt9vRUyvONRdz6ij4ZhEEQzmPtHSicV8b438iR3kjcqvbzP3ACk81I5+rzf3c8GDzkVql22XpuB47SSlBBZPnql7MyQ16Twg2c8okZ+QWVsh3l+2ioutdmf0ajDgTBdnj6MkVOsy5is8b1DoEpdNBBdOPMsVs5KpWekWpfdQFfpaQ5GjkDA4vA5CV0NhBx7MSQ8sPbhOcK1I+Zy4s6tJt1LeR3yYhIRQEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4czteIu5WWHfuESBsu1wFVuM14GGDGLC8egmBYV+v/E=;
 b=sj9AoFXSdi+dCCHmOgAbt5aVJPZBoGtWKACS8RRks2QAlsRd9Y00PsCLR19CJz8SuUuBDmzQArCA3JZZPXd1tIwj/8PcXnaepWg1RhLqSDCDG4u/s2crNavXrOa6AK9HTTanal0Q3ZLm6gkO7Ff7a5BDRwTu0cLLcUnnxpozuDI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com (2603:10a6:800:18e::14)
 by VI1PR06MB5341.eurprd06.prod.outlook.com (2603:10a6:803:c0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Mon, 6 Jul
 2020 15:24:13 +0000
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed]) by VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:24:13 +0000
From: "Hannu Lounento" <hannu.lounento@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Hannu Lounento <hannu.lounento@vaisala.com>
Subject: [PATCH] openssl: make ${PN}-bin rdepend on ${PN}
Date: Mon,  6 Jul 2020 18:23:25 +0300
Message-ID: <20200706152325.4075747-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: HE1PR05CA0200.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::24) To VI1PR06MB6639.eurprd06.prod.outlook.com
 (2603:10a6:800:18e::14)
Return-Path: hannu.lounento@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-r90xmr7m.corp.vaisala.com (83.100.46.136) by HE1PR05CA0200.eurprd05.prod.outlook.com (2603:10a6:3:f9::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Mon, 6 Jul 2020 15:24:12 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [83.100.46.136]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c3cf404-7748-4d02-74e3-08d821c0a33a
X-MS-TrafficTypeDiagnostic: VI1PR06MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR06MB5341DF61CE0220BE23A35F0D8E690@VI1PR06MB5341.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Afn1ddmqsBCWHIZZDHAms5ZvYfDpMTHl5x1Q+WmeCaIKnva0Hm3c/LMcHFm+FACDZ2bSuKJlVBXo/PMVwGtgwJqsuGCsk9U8HirmxjHQhU2GPHsIEukv+FLyzC6nCotl1yN+RJm0CJjd6MFOTylYD9vhGBJ8vc5hdOJe4UOiWAG1GGSKN/eLsOlmA+BfUqZ1ix6p5p+gyb0gGdwIuNJ86Ril9jYJzxZgz+/+w8DcC2LeiYuQ1VvhcpgzkVK7bO0sM5m2NLutVapZ9Q5apgg0QYBxCEJWGBBeUcRmdp4M16svQIuYQDTZOIN8bpn3B7gxSijh4nyvvj4M8MXqk8t4/h7QDRLPBtiXIe4Eh3+PD5hGF9uLopgc3i1vf7mj9gfv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB6639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(8676002)(186003)(16526019)(44832011)(8936002)(26005)(107886003)(1076003)(52116002)(7696005)(66556008)(6666004)(66476007)(4326008)(66946007)(6916009)(478600001)(2616005)(36756003)(2906002)(5660300002)(6486002)(316002)(956004)(86362001)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nizAbgmct0ajA3pKrruRlICvCxfDxewoFHP6AVyp/E6LTygds8Gozc+jkA/qovZpft+osjXiHMy7NOk/wDB2vSbOgFHhfJO+xnI1lS40A7bTNWKxrRcLSS924Oe5sM9fKmNIaw9we/PFpWJQHo6ORgLS9rTi90+XTy6JCwU6yuoZW7CMQOon8TcLc556MVF0qeFkCV1fFZt1f6uzBba3UANxfiv7yQMwOXDnztkmms1p7ZzqhvqSxwbrBJeuBSFO2Duy0gBq710QdvEoUxZPAsBVTwUsqf5rVCOLALzv2gcLwnA16AJ+g2vzeF1P+PrhIvL9X2nqIF3DHNdiykkBqFcnlUI9szY5ajb/GkLU3PRVOkKqb7y7w9dU9j1eVnlIkVmjvpj2PrgCMnZaVLFXaX/pojXbN6jm389O7BDtpoN1cAGUgLJT/uP3pQJKUuS8yBlOxoU23yYmRGw+9wFihPqBSES98cqsWn9bR0MA1V0=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3cf404-7748-4d02-74e3-08d821c0a33a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB6639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:24:13.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/Vy60Wk+ECDhfEfhRosZvYwe8Z5LslcHiMThdveTTP3CjqfVG6p2rXvsHBDJnxmSzkvaNzOM8a2MkbOTyERQKYhFe6/SgJwAcF5xnbY0v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5341
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Some openssl command line operations like creating an X.509 CSR require
the file /usr/lib/ssl-1.1/openssl.cnf to exist and fail if it doesn't

    root@qemux86-64:~# openssl req -out my.csr -new -newkey rsa:2048 -nodes=
 -keyout my.key
    Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or di=
rectory
    140289168594176:error:02001002:system library:fopen:No such file or dir=
ectory:../openssl-1.1.1g/crypto/bio/bss_file.c:69:fopen('/usr/lib/ssl-1.1/o=
penssl.cnf','r')
    140289168594176:error:2006D080:BIO routines:BIO_new_file:no such file:.=
./openssl-1.1.1g/crypto/bio/bss_file.c:76:

which is the case e.g. in core-image-minimal with just the
package openssl-bin added to the image by declaring

    IMAGE_INSTALL_append =3D " openssl-bin"

e.g. in local.conf.

The file does not exist in the aforementioned image / configuration
because it is packaged to the main openssl package

    FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"

(there is no other FILES specification that would match the file either)
and

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_6=
4/openssl-1.1.1g-r0.core2_64.rpm
    [...]
    /usr/lib/ssl-1.1/openssl.cnf
    [...]

Hence make the ${PN}-bin package rdepend on the main package to have the
required file /usr/lib/ssl-1.1/openssl.cnf installed.

Note that the openssl recipe has the comment

    Add the openssl.cnf file to the openssl-conf package. Make the libcrypt=
o
    package RRECOMMENDS on this package. This will enable the configuration
    file to be installed for both the openssl-bin package and the libcrypto
    package since the openssl-bin package depends on the libcrypto package.

but openssl-conf only contains /etc/ssl/openssl.cnf

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_6=
4/openssl-conf-1.1.1g-r0.core2_64.rpm
    /etc
    /etc/ssl
    /etc/ssl/openssl.cnf

/usr/lib/ssl-1.1/openssl.cnf is actually only a symlink that points to
../../../etc/ssl/openssl.cnf.

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1g.bb
index 66fa8f7d0a..0ac40091fd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -201,6 +201,7 @@ CONFFILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.c=
nf"
=20
 RRECOMMENDS_libcrypto +=3D "openssl-conf"
 RDEPENDS_${PN}-ptest +=3D "openssl-bin perl perl-modules bash"
+RDEPENDS_${PN}-bin +=3D "${PN}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.26.2

