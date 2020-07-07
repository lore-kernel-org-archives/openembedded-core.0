Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.47])
 by mx.groups.io with SMTP id smtpd.web12.13850.1594119962619343577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 04:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=gfS6V+3e;
 spf=pass (domain: vaisala.com, ip: 40.107.6.47, mailfrom: hannu.lounento@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULdpfLbVN8MAF8hd8q0aud4oPmr53Er2hPG44q6dV6p/j+I60bd92osK9kVVh+ixpLACcev0CN8SmvFTBNApgScEtEwMt9lTPL8l6kausBN/37g153rfLx3pSSUTnWhovQb2CXeMXSDi9nfRHFju/TehhEtNTuKjfLYgOQaNRbZ+urtLMVXGsx86pYgLmaeWetzMTsnvpQ5V2YuYwZqzdnT/TkqaWm5bnUskPzIA290KPnKv/0CTWixCe6Q5ULHVU4SLiJWRYRnYVQXco1OinTxgDv0r2x+yoBFWOKWQymNPiO2hI3n+Q2Ak+B0GYnUyv+HJKEGYmoStvFyUd8iIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq14Jj1yjCdNHRy0T0ZSyllRvSD2azLP5r1NC9ZwaVE=;
 b=GOdhzshczYZPO55yp9U4bcyk8jo80UgYIc/CuI8bYn/yoe/g48jsCdEL6uqKjzZ7sr140z+a2UkAGJj8v8CQoo7hnWzTQ0ywaBIn7NzoMhwLTfzKK9BC2zO/JH0ekL2G1OEEBVowf/FKklwU5LvKG1sYlOLKkM493u59Rqw0x3WCOEJ4wqcKDyqAp6IhAKcrZYE+AiHNryRmLh5v2nSpC+Mm9n6leKNek04ghGvHmOF6UdQlaSEvpabQTmYHfb389LgyDCJtWlhwZU7i2HhIFeQheCTqCPUFIKY7vVyCWxCiXYcK7d7Sfkm2+2YKCSClr2dmbfuYcOo6coiFPYzx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq14Jj1yjCdNHRy0T0ZSyllRvSD2azLP5r1NC9ZwaVE=;
 b=gfS6V+3eVecOgjECc9oMKbM0yBnaIKzLWElQZ+cprfZnzaT66GN1R1UFPsPseDoTlSeQ3BIXlrI0H2WoZOUnqjJc0TdQ4tSsThf2dq6dbRxt4b3KkHGdK6lMNVDW9ZY6S7WXw1W1MloLP42bPONvaaramfGytlvUbfP+rb4cFow=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com (2603:10a6:800:18e::14)
 by VI1PR0602MB3360.eurprd06.prod.outlook.com (2603:10a6:803:c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 11:06:00 +0000
Received: from VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed]) by VI1PR06MB6639.eurprd06.prod.outlook.com
 ([fe80::f5ca:52bd:a228:68ed%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 11:06:00 +0000
From: "Hannu Lounento" <hannu.lounento@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Hannu Lounento <hannu.lounento@vaisala.com>
Subject: [OE-core][PATCH v2] openssl: move ${libdir}/[...]/openssl.cnf to ${PN}-conf
Date: Tue,  7 Jul 2020 14:05:46 +0300
Message-ID: <20200707110546.401355-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To VI1PR06MB6639.eurprd06.prod.outlook.com
 (2603:10a6:800:18e::14)
Return-Path: hannu.lounento@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-r90xmr7m.corp.vaisala.com (83.100.46.136) by HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Tue, 7 Jul 2020 11:06:00 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [83.100.46.136]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ebdebb9-c8e7-42be-c08a-08d82265bb72
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0602MB336025010845528B4FF4367B8E660@VI1PR0602MB3360.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/+2Aro11ok47zb+wzTgHup+HZzbtsq1IbRVuKCuv+R3p0SGk+ZFmwenRqFxslHJkHUmBFlFQyrbkJeMOGPYmS/L8M9F+3ZWbABfnpX+UBmHBP+tQWGEd6ARr4rCSXH8vfZ62xWxpmcvDMFbvwqEm2HwHXcF6wsVv45qt1/fyLzdINOyfmgfiIBfJPqdE8EvtcaDmU6MWNkFLthdqxw21vtuHLYC0aq/QaSOVGhpXgHKHX3XmjJTe8ThByL92TM6uw/GW/X4qT8VznUKR8Q+bNtVdTUmTcBy0yNoCVKx9/1ZXmbR9w3vrpKyBpNPraVZRQ12FuFJtPFunPWciVFCvdCFtpUJDtGpZIC436pOzGo4kJxEkrfDGimyvEAYfey+F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB6639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(956004)(2616005)(16526019)(36756003)(186003)(1076003)(8936002)(7696005)(52116002)(4326008)(26005)(86362001)(66946007)(66476007)(5660300002)(66556008)(478600001)(44832011)(6486002)(316002)(6666004)(107886003)(6916009)(8676002)(2906002)(83380400001)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FikOYjmzJ3DN7ajiX2cIgI5p9xYEROtJK2KdtBKThMHD5zZ6dv4Bz/FLbsLT/1kAMJLiPG74hfT/qehAe20HMFOv2ZYGQzACABYq9UQqMnAKGFbHb+Z70PkZLaTbCDDvsNyJOl6BdEHmin/JyYO1C0d+urPA1UM4LrmsynklLRmAbXfJrerVjw5waDkUlDpsyTJSoM6AkruDE9V7hiYapWASX2CZtj8Mm6rdM9J09Vkt3QbNJU+3sGjIjM2iLuT+x/CqT7PoIFIMigL9a5QUmNDDx4yahzhhBbRA9il2lR+Dr3331cEo9Jw/JbxZARzEb2DAfyUgLMmnt4Fi8gnnf+V8OqQbsJpMXFe/PU3utKqHBogjYfcYnu5thZSoojKQow7nqCDPs5PefgsvbhjiMYQq59R+i9ZEQ0K7VNboxPHQTmx8+eFGydzkPAQpB8MHEf77s4PEAuvOzkewjs/SkICsBpqaPGHWM5mXC0k43vM=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebdebb9-c8e7-42be-c08a-08d82265bb72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB6639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 11:06:00.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wANeVqu6xytZ+dLmZMovSUxMymGNuIfpllg7XMSnavQrKGE/6gmnegIYsiXBsiZfG3gpW2e0zHoKtP1aYWSVpy8G22RTjOrSg4P35i/Wuvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3360
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

The file did not exist in the aforementioned image / configuration
because it was packaged to the main openssl package

    FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"

(there is no other FILES specification that would match the file either)
and

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_6=
4/openssl-1.1.1g-r0.core2_64.rpm
    [...]
    /usr/lib/ssl-1.1/openssl.cnf
    [...]

Hence move /usr/lib/ssl-1.1/openssl.cnf (and openssl.cnf.dist as it
seems closely related) to the ${PN}-conf package to have it installed
with ${PN}-bin, which already (indirectly) depends on ${PN}-conf.

Note that the openssl recipe has the comment

    Add the openssl.cnf file to the openssl-conf package. Make the libcrypt=
o
    package RRECOMMENDS on this package. This will enable the configuration
    file to be installed for both the openssl-bin package and the libcrypto
    package since the openssl-bin package depends on the libcrypto package.

but openssl-conf only contained /etc/ssl/openssl.cnf

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_6=
4/openssl-conf-1.1.1g-r0.core2_64.rpm
    /etc
    /etc/ssl
    /etc/ssl/openssl.cnf

/usr/lib/ssl-1.1/openssl.cnf is actually only a symlink that points to
../../../etc/ssl/openssl.cnf.

Other files and directories in /usr/lib/ssl-1.1/ were considered as well
because they seem to be configuration files and / or related to
(symlinks pointing to) /etc. They were not moved though, because based
on our use case and testing moving the openssl.cnf symlink is sufficient
for fixing the immediate problem and we lack knowledge about the other
files in order to make a decision to change their packaging.

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1g.bb
index 66fa8f7d0a..47ed6b7640 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -191,7 +191,9 @@ PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engi=
nes ${PN}-misc"
=20
 FILES_libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl =3D "${libdir}/libssl${SOLIBS}"
-FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
+FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf \
+                      ${libdir}/ssl-1.1/openssl.cnf* \
+                      "
 FILES_${PN}-engines =3D "${libdir}/engines-1.1"
 FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc"
 FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
--=20
2.26.2

