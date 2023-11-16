Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE226C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:55:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.5065.1700135707865706721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Q5zKXuDj;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IosIjdIHRHKB5J86vPRG4QdL57c3xpBIkvYd9R7339PUaeA8UymUmXlTuwOol7zY+EaXogX1saveRN8ZWV6OIrIBNCi+DdJpLa53MbPtYXHIGGqTv+oqeL4me+Ya1QDw/HP9PVEjvSyYFJg9yJ93XrXJGarxGbEveGdpzhXGkXEjkCt97y2OqEEckR8U/UZ+F9XnfmlrD9Alq0+MFFkDTpA+bbhXfrxWVNRl022nwBzBCOU6vv0bUEAoFkLrFWeE2LS80uTy0Xbr4LXMYFUJISw+7rS9FSCJWvPNyr8oPajJQgGk1jFqqecvGbiDl8eFTy1QlUERBJTvKnSiIREz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oMZM+E3B7WuRjR0jFjt7EnPtE8+rWEgRqu0l7Ky40w=;
 b=ggI/MeFXYy6FIftvbLfq4dCcZosNYqx5XXQ0jp7ENIsX6VrtYM3CNFoOG5VJcSVPBsV8JeTy6fUGCpOxRR6ZpyUY5JqnlCdAmQX85Uqih8zGgvIHJxmMy1N94lREMRXkbd86n/tx5gv5Wb+UjOpYmxK2OYvfntyOz/TE3oJvXgpH0m3WKqf3Oi36cmFAMvDQd2rhGa/Rd1Br6k45EbY0zXBNXZB7TDFG1zY2r2OEytR2YqsGX+k5oLfY7IEJJWVGTBkdqb2kIlTm6KilftEiGKKL+SOa4rirlnabIaoSRFz41w1eKsM1kE6Rrq9KDsua/6y2SEDjqmsi8BcyT6eSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oMZM+E3B7WuRjR0jFjt7EnPtE8+rWEgRqu0l7Ky40w=;
 b=Q5zKXuDj/XYYR124aeztAOrTpdj50EcRJPjkqPz+SJwXCCho6GXuG7nvzUI3OrK7SZFaAOq76fjZamacxIlOW50scLuNgoRc5Rv7njrJS5OHNw2VVR5YeKNE5hF+2ay9kudA9TaNC0v+ognoKQOF19dYg3pyu2hAYmZkT4KRHLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10581.eurprd08.prod.outlook.com (2603:10a6:800:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 11:55:05 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 11:55:05 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 4/4] glibc: use nonarch libdir for tmpfiles.d
Date: Thu, 16 Nov 2023 12:54:57 +0100
Message-ID: <20231116115457.1462082-5-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
References: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: a2363862-1740-4c25-58a8-08dbe69adf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tgJrH5sUz1sI52WDpN1NpKTfznQbk314Ra+Cqh+a2k5gnm8bIk5pOh7RKFuNQSVz7wHfFb51PsH/Do546wYSDGvJzQKQr8btMckat9rQVKBPYrML+Mdy87yMH8GeWMto0UnbKCqN9+PIfvRMyk/0C4jGaypxtz/++X5NOlmad+spTbpxAVTJCXernAoqmj9n4Yek3txb0vF2C5qLYmaNyUSRWmUCrq0YhddSN2e3p3yGb5XRTVCXuE5xBuHtwBxlw2egLBlOmkpmbIygnD/pxYu6v1ekM4DQjqHaFYadVHOYGcCedCj/N4nXl55Ua3givNqoTb+ufkCGNeKZ6dJeh8E4DQ+aGgYkmpRtS+Y4tUihfR8di1fH0S8efWD+U5xE+f9E5Xcd3fTNM6+lnaGbRJxjlE7gsyUt9KlSEMbJIXRAUsgx2ha/cfF9O6dTiHgnVth0o480cSIrk0+Cu2GR+oI7GnJsP7c3KkuuDAXnm7uZD1NiBFhmstnLIHMh2FN4Jpmr/pzPEYRsi031bH9OzIkn0qBI3HCELc7kx306eUeTt+UHG04Yc4NqBkpsm4KXoqkm3Ks9rCs2xOpNh/5GYi0b7dtOeRdGZcRPx5/dVig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(478600001)(6512007)(1076003)(9686003)(2616005)(6506007)(6486002)(107886003)(966005)(6666004)(26005)(316002)(54906003)(66946007)(41300700001)(4326008)(83380400001)(2906002)(5660300002)(66476007)(6916009)(8676002)(8936002)(38100700002)(36756003)(38350700005)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gkky2vTOd1s/YZRWXOEHozhagJcQqFCAt0fhzKrobDMOr8PSANIK7t9vlkkO?=
 =?us-ascii?Q?vx7hsenw4Ek4AdVoAYoEeuKxDpRGRCnQBD4LkmxPctoP4I77h5R+B5H7KeY5?=
 =?us-ascii?Q?P5L9mHLB5CbH5xoEtnMDf+FD+JCBF0fWg5AgSNlw/JhhVd92yGyX3g076d5I?=
 =?us-ascii?Q?FN/725msRw7qo71gDPeOLuuTfdxR4Uuo0XCUyCMwrXkqIuoOjy2K9tDuYW1V?=
 =?us-ascii?Q?31jt5Ht7ppNITVx/RLp5iZYXym6xm9dZgmZ3UkctzaEWTymoehBfvZiV88u/?=
 =?us-ascii?Q?npKohinsF51bOXMk+01Iar+7BDT2UOeAMMONU1kr+cykSpR5Fk/kt6/lGxQl?=
 =?us-ascii?Q?UuBr3cNPJIyRuuzVQRBgLfke0gkCazcLxSAPvpOHARMQ3a94jfSty8tcNrvn?=
 =?us-ascii?Q?t/neTB1B8PA1nh9mtP8N/dSkA+T10XePi/hI1ptaTq45UClFuInj3bgks5aI?=
 =?us-ascii?Q?IJe/c+VpKNGZhD1MJ7lYcj0HbyBKJ/54wAkeS8HQdDWjerGaImN/AJq3AeTx?=
 =?us-ascii?Q?qkAnk1Zz8grrCwBHET/tX8D0fzuEoSToNDa3X+hfcIljemxbwlfo7xWEtIxK?=
 =?us-ascii?Q?TPlKE7FDMbkGzjgqB6TjEbXm4VTq9OWr213dn0lKyoYvJ/GMER4I1Q57mPTa?=
 =?us-ascii?Q?Z9Zandfj3vmcrN3/ua9dOJxmgdgxvpd+QfefT6MfalS4ez1H9pci6mDvWO5k?=
 =?us-ascii?Q?vLbXsY77xCvBd7DdZYXdsG1GoJ1QK9LfGPGNgngg4YzHtg9J8bHXJVAIoEgg?=
 =?us-ascii?Q?6Jj/CXa7zgwKIzbJwu4guz1N5GFJoRH78i9hi/0SJ33oQHJ+hUZ6bn+RJIXG?=
 =?us-ascii?Q?ZljAnbzlAZ/pPQ2Bfx+AQyr9BMSfRCVJHWLkJZopKqdLe0S08Y2Q2cmJlrZ9?=
 =?us-ascii?Q?1BYamtQEOBZ984N4dDqUJOxO35zof545+mLzbw4L6BvJ6QZqpmgtmAiq3L1a?=
 =?us-ascii?Q?eVBXIl4kGdnOsQ2qO2jlCVpAnm+dPJfzDHFnsviHio1jmUz4vzQp2xD2dg5S?=
 =?us-ascii?Q?36UeaRnmppyo//XPMMYOxhIb6406JMYjKRySBRgu18zhxtl0zmgF1rrXykMW?=
 =?us-ascii?Q?nVYnUUnI/DK6TDrKHXgwfZ0x69cnWGvzgEK+Ow+UmYOfk0aXanUq5R2KPmH3?=
 =?us-ascii?Q?rypcSi288fyVPoaAm0mxOD9p7GG0hk/CQMYe4JLeGi+97UR3INvGj1nCfDYd?=
 =?us-ascii?Q?DcjvW6X0xgzmC5zj5xxpBXXgkbrcXbvUa26Aods+UY2PU522DXxWgw2G5myh?=
 =?us-ascii?Q?BAJq1LNHQQ7pBZIx6ZzTJrxo+aJMBUiw8DPmHFrn/y5SbjbcPxrMCHAuan5C?=
 =?us-ascii?Q?KDwH6YVniL++oc6lRwfQmDKqBInvxsDgQrQ4mV3xb2d2+s3BMFdFDuLqBNtH?=
 =?us-ascii?Q?/8fEq1DDgYhw17G/w0FV5iIHzNveTjpIrqnHyhU7eTJgDta+21ayrcqAXpeV?=
 =?us-ascii?Q?s/f8jSg1nCbrAblMKqJMdigXwtyIcBsCd8NVRYLAP97v9F3dCy5s2sp8ahFh?=
 =?us-ascii?Q?DcfOJmq6miuh0zWHK7SzVtKi0J36n4xlGFlKQmaE8KZYFzcUALpw/b4tyvmY?=
 =?us-ascii?Q?GIdp06JrDq83wv5YpViJBq5rP++i5J6ETRr8TLeTkJrjTUS15zpjKFqWm+ib?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2363862-1740-4c25-58a8-08dbe69adf33
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 11:55:04.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RySXz6KGmj11Y67uVXVX+QYG3YcmcaQts7CKlFABUT5hUVvcXlo6R0WO06Rt/FvKAGSL2/D3Mc1/C8zucA8y/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190789

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index 1d4e4c5274..1ef987be0a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -42,7 +42,7 @@ FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-dev +=3D "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/l=
ibutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonsha=
red.a ${base_libdir}/*.o ${datadir}/aclocal"
 RDEPENDS:${PN}-dev =3D "linux-libc-headers-dev"
 FILES:${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
-FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_syste=
m_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
+FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_syste=
m_unitdir}/nscd* ${nonarch_libdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_n=
scd ${localstatedir}/db/nscd"
 FILES:${PN}-mtrace =3D "${bindir}/mtrace"
 FILES:tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
@@ -132,9 +132,9 @@ def get_libc_fpu_setting(bb, d):
=20
 do_install:append:class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
+		install -d ${D}${nonarch_libdir}/tmpfiles.d
 		echo "d /run/nscd 755 root root -" \
-			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
+			> ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
 	fi
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d=
)}; then
@@ -280,7 +280,7 @@ python populate_packages:prepend () {
 pkg_postinst:nscd () {
 	if [ -z "$D" ]; then
 		if command -v systemd-tmpfiles >/dev/null; then
-			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
+			systemd-tmpfiles --create ${nonarch_libdir}/tmpfiles.d/nscd.conf
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
 		fi
--=20
2.30.2


