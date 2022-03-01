Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3ABC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:56:32 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.102])
 by mx.groups.io with SMTP id smtpd.web09.5942.1646121390553349542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=ak/QoSj2;
 spf=pass (domain: outlook.com, ip: 40.92.69.102,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUmQS1WidahNsXnesHeo3GYfeVsIBV4gmYs2mrMn4vylHJgm1diXqnCX2SPqZ5QFvpC7pNbRL43N8HymkDAU/bWY0v2FFwU1OFtb/q8/494FsUT2+oyFY6YZfofF7jUCSVWf5yK/Gijtf8kSRBqY81CP5FEIQ0hgfKj4JoTk/yG4FUq0ebkHtdUFvKzKrEk2uokfkxRIoXcJ/pCgmQ/8qmlyWA/FTOQoOr7hm4tpL+wP5+vzDWayhQHuoUf8cHkAVAMxn7mP/r0Q92Mbr4fLmhWCpl7m/OvNjMhBENjj3wJBVfPyjoczVhD+Sj/pBYs9lUTjN04G3QRVyTbDUs+vFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN8GrZAVEVkp69Oi7lksRENpVxrad7giXuRqFwzqFz0=;
 b=Dd/QBrtyyNzhustGBoEROEF+le/3Y8vojTwFXkGVq3kJEOv3DrFsvEwvuvMwmN9fNf7WNjBZbx0u70YxhVHJWnb9oPGeJvARaTIERru3Uhgz+VhL/pO/WcqhDxjjcZNq7z3sKuMPzA/V/X+pol0lld8eCBALgPgriHqbobz1XLo+9rp9sAu1i8JxR5GF0botkG9+35i8vJtCQ0nGmAFTvbWnT9uy5Z9l6cvf2X9XZclm0xAwoDHmS6GRa8W+CfLlfBHYzXh//p0q1zRgVUZ/NW/f7RtbCsHtaNkYr9Vgshrmv9xy1QIHQUv2XRLT+GAA8WtpPgdZO/g48PHON3INOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN8GrZAVEVkp69Oi7lksRENpVxrad7giXuRqFwzqFz0=;
 b=ak/QoSj2ykCbU7gWiEZAcUuXc+osX3iS7mMiPRQQy1BcH2s1I6qh4hgqyxLZqItBX0dN+11hiBlEy0jhQm3yOWARDAStJHZWFVRICT3M9eO2SrbXGp42OVZq7pW3BOoZiDRZmXIyOVrTEj/ZmtqsmSoeIzPSiRXNlATuWlkcDrL4iG1lfAglqyIBv9hBXnMeGtQ3T1tKu2ME2JWHvPoOrdVaIQGHT/wcyI0Vc3O/cYQClBhmZA6+THoncgvfdqen/OeqefK65knQ3ErFRaGjuvHkUbkXRyE9MZGLq22wVoa3v/XmK0x2J8dr52tMB3HrVq2cY9vCNzrkZ05AIA5VYg==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM9PR09MB4818.eurprd09.prod.outlook.com (2603:10a6:20b:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 07:56:27 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:56:27 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v2] pip_install_wheel: improve wheel handling
Date: Tue,  1 Mar 2022 08:56:11 +0100
Message-ID: 
 <AS8PR09MB464590807A078F0A6DD0EE24A8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [oyCDWsmXiS8fdcV0ARvpa9PRER4BAvYT7+y5uHpVaTEY1J6jAV1W3RXXizrTvKNS]
X-ClientProxiedBy: AM6PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::39) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <20220301075611.18798-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670e85c5-4d78-4e3b-692a-08d9fb58fd2d
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPckUxFtwzn7qeFsH753DMJdSkkWxpjCAzEnnsXdH7Ac5sF0l74mGw4MbCX86D+2rW4FGxGHtiw+f7m1ISSGXK0fDAZWrGdtaVHBcrb7VNv2qwB5ZtdfiAAb5P+gwhTgX5VXhkbSJFuPToR2GOwWSPm3E+sH5HI6C04UPI2ld5nyiPCeyVmi1Zejm8mpd6eQ9McQssiZ/V9WbhPdvygQjxZrOquNrsIibSCA2h2+56eISBoi5Wwtd0oozVvflXM6x5/6xku6aK8Kc0hSDo6Foapcvfm8BzLqZB6rIF1DGumiXyGwXPO+8niL3yrbKCoA1cShYMj4SMNSKR3DX0IZMteKDFD4RNeiV45sT8SQ7eK/xtRUP9fKD7mH8+Jr/FeknRLhYozFZvRPILrfny4s2NkuagMKLauDUeGmLGPq7FXX4gZQDx/K6AlxkrHZe8pvW67HvMy0hrFk6dUlrq+07qEvK9THEBXiTN2FFHUayZ+SRbRBbLa8ZZoPkLi7HB8uldQwQONSeqGoybU5nNQEKu89KRRVv8pkk1AXs/2dep3023k1VVGNBR8Rx8gHNT+4bo4eAo20zaB+ylmRWHouZCb+2AmbVTuNxmzLoFKmTrA2h4q+guO0HYcOHqAgZxHbvugsCGPRd9jgnRpcHhiQMVbb1XPrde/4QL5z20b5xBzZdBAexkE8yfaTihD/a5UCrvQv+wfD8mmQdBw6gwM18gMzKYsxCj6YgOoJ4j4h/IVGyYL9Q3oGxMmGiyR3STinCYMY=
X-MS-TrafficTypeDiagnostic: AM9PR09MB4818:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZT430BRekYDW4kmKS6DK6Jo0NMJcaxnDwP6rEB/+dZHs8Le+SVc0MQHfeQwn5zTv99F5c4AUzxKC30lvd4cH5xDtr1pUAbo4Sm0g2bCW6SJlJQebDG/oengXdyxjkOwpe2chWV8khdLs2mfHvfBFJhw08au+9rFC9LvPLTStT49rjduwtr0pZ4bkAvcJmVz+iWgBKzoP3seiZZLXdboT9vXW21QzX8YbY60yLHSLGZKkBMWd2Hv7B/JrDxyuBlu49YuPgC45fs3MNSLkRxp9I4gmMaWniTZSzMjWmK8MGbpaEbK642EOkQ8kL+K1s3g3bQ+RaprA2m/ecZP7JrMdyKNd+04UIt9oAydhqEw7wpFoR4W3CpCaCFzpO556IB4Zw5PIuGdB4eokA1QM+GuTkuCbbotSutIN6euayPFmW7fkOBvpYvGH0Q46YCKFYUwAsaQhPa18Nf83NO5nz0FMXZLgcE+fL4ijqv5hJM4u/KNC8/RZbFsihXcAYIEObJByfypfrusOHgBlTJU95bTN3jw5pRllf3tvURerdS4l2bjBR/PrALaH6yuRBZgcA389d1xbCrB1RarFjcIE3Cu4dyIi+M5liDkbNibKI8yP6A9+X1S0enELK9inY5Zk7ngG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uouiUhChAwXBd/4hgcyJYUZ0lLFYaocRoQZtqcFZp4PHDgvhouZMtYDUpe1/?=
 =?us-ascii?Q?O0WryhBw9s8YnZUeh7gOc26oyRylI7y4MyOvu76+I2iaB6bT6IOckCPbyZ9O?=
 =?us-ascii?Q?eXFX20rNfLvy5aC3ri9UuBRYEj4ccUsFOx8WyVxkHLsfeOGmYRap96iRf1tP?=
 =?us-ascii?Q?nl/XNu14EGR3XK2BmBSh8HidmQ8VkO61zHw7NQgutiV3XkHuL6UHi263buJt?=
 =?us-ascii?Q?PJMBRe+M0KDVKaypILVMm3RFUgUXFWSRe6QhX+qN4/Ojro9G+0OhbSupnWQc?=
 =?us-ascii?Q?H7zF2qOFU4TZ6nyH590iQ3j3XvaA2rRqIx1N2a+lEOQZNayi1t5LtYfbaOdv?=
 =?us-ascii?Q?N8pfxDmJfokwEbV5SECzVfkDB/xeu8urYtVPyV7/26HuO3fdwumdrNHDURtv?=
 =?us-ascii?Q?wOqxQr9fp8u81h+EjGYHibbx0A2M1GMxrOs4WCCDEm7Qr32yCHnC4EYhdUOT?=
 =?us-ascii?Q?HOXrA+AttnfFUW4SDLzifkcE5FdvRWI8Iq4+NjQoCc1qCFdph2mc6TX95Xzs?=
 =?us-ascii?Q?x6A5+xJ8yItKVx+aJL1+Vc8qt45e7Cuyp2eyNam4ed+mFoGJ89/obkn+5s4a?=
 =?us-ascii?Q?TauCbL+xCSwJi1EJVNnr31oH1PPVDISrQHTC01aVUZF5fEdwn0YqR3MPrxcS?=
 =?us-ascii?Q?qqmg1RlT/rzmJ+YVyy30vYzMx7RSGfHDSV8T+gGvfKJUORVekZb2BkYzIBkx?=
 =?us-ascii?Q?rDoRQOCyUpIuPbSorjrxbsSUT/JyjTa7AlMn3GWqnL4LYIxZgo60FTCpacVf?=
 =?us-ascii?Q?oAoNV76dmZPHLX9K7u2Qn95YiTCBfX2Oxlp5JXpku4tsBR7ezuxevoUQoLOZ?=
 =?us-ascii?Q?qQzOsv9I+aVaJeYJDx0wAznUblPikfPlBK94ZHg/S6Pg17LPcRem7a0oQ48a?=
 =?us-ascii?Q?myArYMgLKxoMGkWI2Du4GzjZFzZ3BfdswdCEWdCKkKgonZLykkavojjurYtp?=
 =?us-ascii?Q?pxA2PCdSFEQVeafpjYBIN+ZjZ3F85TSULZhSTngnOIw/8a1l25VO0YxmNGBk?=
 =?us-ascii?Q?LeqdteToNXznkwm5IKyBeViLMw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 670e85c5-4d78-4e3b-692a-08d9fb58fd2d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:56:27.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 07:56:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162529

- replace python3 prefix when guessing the wheel name
  as there are still plenty of recipes out there that do use
  python3 prefixes
- remove all previously generated wheels matching the glob
  to avoid installing any outdated blob
- don't use PV in glob, as PV doesn't necessarily align with the
  version used inside of the setuptools configuration.
  this will avoid having the user set PYPA_WHEEL in a lot
  of recipes
- respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH
  and use B as a fallback only (in case this class is inherited
  without setuptools3 class being there as well).
  recipes like python3-smbus run in a subfolder of the
  workspace and were failing in before this adjustment

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2: fix type in python3 prefix replacement

 meta/classes/pip_install_wheel.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass
index 5b7e5cd706..1b6db91d6f 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,12 +1,13 @@
 DEPENDS:append =3D " python3-pip-native"
=20
 def guess_pip_install_package_name(d):
+    import re
     '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
+    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar(=
'BPN')).replace('-', '_'))
=20
 PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_name(d)}"
-PIP_INSTALL_DIST_PATH ?=3D "${B}/dist"
-PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.=
whl"
+PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SETUP_PATH') or d.getV=
ar('B')}/dist"
+PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
=20
 PIP_INSTALL_ARGS ?=3D "\
     -vvvv \
@@ -28,6 +29,8 @@ PIP_INSTALL_PYTHON =3D "python3"
 PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
 pip_install_wheel_do_install () {
+    # cleanup previously generated files
+    rm -f ${PYPA_WHEEL}
     nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
     bbfatal_log "Failed to pip install wheel. Check the logs."
=20
--=20
2.25.1


