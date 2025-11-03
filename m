Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD9DCCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15252.1762154829900899546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=uZ+K7zRT;
 spf=pass (domain: navimatix.de, ip: 52.101.69.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1sGtxm3gEIvilzp6ORa6+hOsr5bmjnObThy9ONczC0+Om6MpFa2Z0V70/unP8mkXIbVYUQ/hLEAZeET/SwDx7Cc5hjxC8rM1ITQr7H1WqO1ghG4NYhnQpoZ3rJ9q5i9RCAsFuZykv2HcHWFup4VQljjPXs2gzYfeiEQiPq1sZYewJqJQZmffbUCDhzLIGDrWCJSnaIeB/fFnxrC7R7QRn8DUFlcM5AE9UKncNu/z+iiOvFOqXeTh0bAWAlSjymHxopKDVH/koymCDLe9ukZkuf370CKfQdOeV5uoGr+oiWtqIZVrm+wwF4D3eqAV4NBsFMPwDolupYV3nc4PH5MQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab0KHTG2pynmELEflqodLmoqIx5OuL1gxKLuwqXUeoU=;
 b=mhFNhoHxwVY6O1GEJp+m9dIs/vXPqt7BQQsh75vCOyDepKljV/4tvFZb0cw9ZVHJ0LA0UyJeEo0qSstv2n7ueK0bujP0YK8GwMKnzC1b68ep5lvZGrhrt/uXgNyp7XhixW/H7pvNLDsMd05dZ24MESPK9W1pLdLSs0bnDy/b/rdkRVfeYp1bXfoJ7GQVhqDIKHVCF8mzX9LbCY+atuxz6e5C9K1upM3gR/BeiT7Yjtlg/HSvTUb41UroDC8t/15YcRnGv/PvtPZRce0hs2g6mLzpsVG5Q5pnBeihvDZnl9K8+3RULEOBiJpwsRQ01c9L9iJN/5p5GtPmWkC1qZKNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab0KHTG2pynmELEflqodLmoqIx5OuL1gxKLuwqXUeoU=;
 b=uZ+K7zRTbXRRdJ0JvO3bLIyj8Jefn49mWgStz1feJiug6HLt8uS7ssfWCJLcqH6uHjBF+C8H8HOXiCJbMKV9UmIq7cJRRI1SuulMCrQS2O7LlxldfAeLDXviNlCRKgKljRhaxPrXroNeqiJSCwqqRgucB93BDyl9rirdfXCi/7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:07 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:07 +0000
Date: Mon, 3 Nov 2025 08:27:06 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 09/18] at-spi2-core: Convert to gnomebase
Message-ID: <5400bdddb4d9c5dd8d99ebda029d523537dec171.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 648faa6f-6d94-416f-c5b6-08de1aaa64f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FASGni3e2RYL//JFz9liAbTMFLMs1EbQEsaf8gSy+xcyM3x0PPS3/rDRX2YY?=
 =?us-ascii?Q?2BGPBpZxloh1lrSH0j386RptwDvmBsPU/uLd6F1jwtdmWFYVmNtGEV/gSJnj?=
 =?us-ascii?Q?TZ6MUA05BaiQN+uAiZPS3gnqkEHIX3Hy6jgCWZ9bV8z5SNQCIGFNX505smwY?=
 =?us-ascii?Q?+lS1z9tjDqSnbii/cYSmuqQ5w0Xjmk2OS1sz5eXicoIqusXpayIUobp10aiW?=
 =?us-ascii?Q?fYMxHyV97Exesa1F5qGPJsu3fgjBZuS/DqaKFRk7RiBZOzuH1w72hB/EgLHg?=
 =?us-ascii?Q?clGaSvvx+LzDkPtkzmD3rPwF2qXLPl1mkD1NQGrhA+dEQJoHUHMV+0i2Nn8u?=
 =?us-ascii?Q?K6QNYI7/QXTHGPUdU0JsE+lJHoA7u/bZb1I6U/sRrE29BCOGmU2J4L/0q5XT?=
 =?us-ascii?Q?H6ci8+65rW7V0+C/UQTfsf4M0UOfJbRyaABQSNNT0UADGTZ0WSrsNj3UKO+A?=
 =?us-ascii?Q?x2+Kl0m+ABqcIuDDyjhe7R6wqR3aQL+gQP3G51YGh+TeRlpvSRy3e1gH4QOG?=
 =?us-ascii?Q?YKZkTeN8o7fkLuAP215bvZ+BaHr/B/GjyWPfnpxUuTjWSXMpbunzhZpzzMQc?=
 =?us-ascii?Q?OTS5DRA21zI6As+vpMboxQluWGocfnQ7ZjaRGsgUVYmOWHjmTMI1ZzJdC0FH?=
 =?us-ascii?Q?t6J6D8ccIyz1tvbgrSz21tWmXseFubiLR/ONri/tQzs9+yURGLZTfhI7NzT3?=
 =?us-ascii?Q?ey5yNlrsCmnGUKhZH7kOeacvIgpsarTFyuOrzEXYGOBxfXyNVKaLZW8MWGO+?=
 =?us-ascii?Q?mWtV4ASYYlTnFeB1GPpwfppRGfKd9Fu+N1gQkWJV7aJaf9WdjK33IQ+1CpL8?=
 =?us-ascii?Q?ZzQcEUFJ8w+M/BJApxGcZYLb9DI/jblQXovzfxz5zCZSeLJkTxr7Ozh9eIE2?=
 =?us-ascii?Q?We1B/RWqBSPEZBOlwRrGkp08/rN/zTgawjAAKjoalXPdHHcvPegiodowQq40?=
 =?us-ascii?Q?/TjwwXN+bei7PoiZRrfu65Rtb5+fEJfnKn9GlUB5BIq+VtEwBe1j6VbGAr5G?=
 =?us-ascii?Q?2oWhK5r+PpmN2loIXE7uVfJXqQ2Fu0vXinK/O6LUOXAYo+Vn9UcxF5OoGSs7?=
 =?us-ascii?Q?N2f6zUZ9h+oaOy5zRr32ECSIqAmXcPhWLsygDY8HPJJBTwjP4gXDPn8XpXQy?=
 =?us-ascii?Q?jCqwP8DzvOEYyqWyQ4UARzdWAwnX0AdgDq4LmW8dnC2KkriRV7FhACxBWM82?=
 =?us-ascii?Q?VmY7qYiDmSDmCWKk3lePtpArCYOca/+WUVrROEZGSy7r6VoVeHoMy2Ugifx8?=
 =?us-ascii?Q?zkKrGsv0mARaNSs7Mu0TpX99JLzuyQd+YIXnt12WnvNePeVseqUmYjRWysKH?=
 =?us-ascii?Q?SrnqCWk18rKxI2N0I+s5iZLBPVM+lf+eawIHdVgMeVG+zUsOgyvbuFAoY9J7?=
 =?us-ascii?Q?BbRcpwHR0czkt8Q+g/VJmGLglbsueDfmSVHlbrzTZeBvKFG6y/iJmHP4eI1l?=
 =?us-ascii?Q?2FxiK27YEV+rHwlUhG13ZhKmVHCovxED?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FDBHzaD07t7kiHtnJlayHt8kfdDq3IR/LR4MqirABsZkt3CBJtOS8eFAlAwv?=
 =?us-ascii?Q?ZM6X4+RuNXP2gcmwNgtKriATnIRsaMMFNwrjbXj6Gi8YjW4gl/8OgtGT4+Jv?=
 =?us-ascii?Q?IfEcnD7FgdqoQqtn+kq66NRn47XQdR/DIZCWQbnSWzeqVcNbfpAW1r1faPzY?=
 =?us-ascii?Q?SSUAD4cLmREofb/MynAnlUKqfg+egC9JCTqSaacs2uFVDS4n3Tq5WbSMxQkb?=
 =?us-ascii?Q?kZBrqmxUeLPYLj+Ad3FTcezKcq7V6+wVm1KBPhYB3IK/ioeEQKrHwK6z171g?=
 =?us-ascii?Q?cm9kCU77tvPlPlNcTNdj/FJFuOWMj4icF9+MCdq9iQLqQ2MOl43Q3Ni+hLAF?=
 =?us-ascii?Q?wkmZkvHCTnQbLcFlgQS0LA568nW9prG6RR5rEYaM/wtS6joUcZEIqho0qWU8?=
 =?us-ascii?Q?N90sqt8vzcpY6kOg9YEvF5cx+4t9LC2O1fnS8Uquc56Hu/tLKm7usTmmTkLC?=
 =?us-ascii?Q?FEyFKfSzx+CYT1KfEoiMccWBmoxMPbq1/yVHi1Eqxvhk+pZp3Rbhukxuaa++?=
 =?us-ascii?Q?C4NMzJmqJJP0T8+CfpwBdKB5nCWR3iz/F2WtjyecQKWrgfcjchzOBAQ4zCsU?=
 =?us-ascii?Q?W0dcrfT5jgazf3P6nQHIYLKrT/BYe9DaSqcLjAjuPmEXwdYZVF9kqbk6tbS1?=
 =?us-ascii?Q?fp00aCGKxh3hE/aggQsO9z8ut+Uyock1apEFFhbjab/RN1gV+YJNlZfzZZ0y?=
 =?us-ascii?Q?f1vLwFk1wEfH5fAyXjkHJW9QbRbkQAZ9Af6ZCqc/YIITZyn0HL8MgI7St3Vu?=
 =?us-ascii?Q?G4Oyw34MdZ+WCz0+szBLwaTZwQ9F+PMBBwnpDmljMYqDPqgylGA5MFGvVFnu?=
 =?us-ascii?Q?746pPECOHdALSLRnxxLBAB1nZWOTtYDIZy0q+fYSqcMvAc/dQ7xvPFXehJ6T?=
 =?us-ascii?Q?ajeHbyi2mVK2iKRLbWv+ELkrHZoysoM4KST298K4V1aXgJIP9PqnVdvnYNTW?=
 =?us-ascii?Q?zeDHnWa0JK5XR6XIBYRvrxTspW7I7pUGoRPOO1Q/jDSx1Jj+SL30rnYEfS9t?=
 =?us-ascii?Q?RiGMM4DBUTN+jIDFra8YmHiP0CN2gujRyd8TjGIktNfECWNWrm7OzunsoPdH?=
 =?us-ascii?Q?aynBdTY3HvpKb5QlcDOndM1bL1aeKwV4oZBuWiFGjOyVi+Tr+LL3QQFDmzHc?=
 =?us-ascii?Q?pb2tK/20RPKG3F+ncxz7I+9ss1WKy7RWETlqocNElPC6XUmUiY7Q/Bw8BhKl?=
 =?us-ascii?Q?2QOilFqH1R1WWct0IEvajOJ/P1R5JpsvI8zXxmqeJXN+CO06kD91qMoiXvLm?=
 =?us-ascii?Q?w6JAVTAyZag67zSlqyqZenUf3QOZJj3DqnMztSSZbDaqbBm84AFnCHqa7Wif?=
 =?us-ascii?Q?70+fDTuJbPomc+kVYUeR/vX3t/KG1EtynFXne73ygHsRZFRWxusraBZh2D78?=
 =?us-ascii?Q?msBfiLQhfFuTf/XpSHXKYkvi4RdpZ/+xuLW9DlmaNkZT7jyhp3XnzNktp3Ij?=
 =?us-ascii?Q?FKhnJP2RqYlf+xADd6MHmoOLcBvVpleZt3e6QZYxyVzSSObyAxvDEmN5SYsA?=
 =?us-ascii?Q?CRD66yhl8x4ZBOhdN8AUwqPqPLujS0mSHy+L3KgxxnN2OxHc+ZWEV7ABoNOn?=
 =?us-ascii?Q?mAtVtuaKQ/zgzN3IeIgyMSZfsg5IoIBZTKi1UwFB8OaYzY9b1xZ2XxYzmogi?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 648faa6f-6d94-416f-c5b6-08de1aaa64f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:07.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZJvYDwvDGTwJE/2o8NQf76zxCxvrjzNEcQzJY130BSOB4H9wey0yHqpF6x/JEg749LrI8bmClN8SQnwK/oWcx3A4anUh4qSn8LR0wWhMTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225600

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-support/atk/at-spi2-core_2.56.4.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes=
-support/atk/at-spi2-core_2.56.4.bb
index 90df892461..a1cbf4b455 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
@@ -9,11 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255=
951079008b364516c"
=20
 CVE_PRODUCT +=3D "at-spi2-atk"
=20
-MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[sha256sum] =3D "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2=
c85b6c094a3a02"
+SRC_URI[archive.sha256sum] =3D "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6=
c2eba0b2c85b6c094a3a02"
=20
 DEPENDS =3D " \
 	dbus \
@@ -27,7 +23,7 @@ DEPENDS =3D " \
 PROVIDES +=3D "atk at-spi2-atk"
 RPROVIDES:${PN} +=3D "atk at-spi2-atk"
=20
-inherit meson gi-docgen gettext systemd pkgconfig upstream-version-is-even=
 gobject-introspection
+inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobje=
ct-introspection
=20
 EXTRA_OEMESON =3D " -Dsystemd_user_dir=3D${systemd_user_unitdir} \
                   -Ddbus_daemon=3D${bindir}/dbus-daemon"
--=20
2.51.0


