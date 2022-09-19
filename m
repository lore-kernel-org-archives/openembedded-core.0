Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9320FC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:12:48 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.74])
 by mx.groups.io with SMTP id smtpd.web11.20309.1663596761441085790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=H2/LBZ0U;
 spf=pass (domain: kpit.com, ip: 40.107.222.74,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDu0+ASm1cjMlDbDp48AqIvHvDoqjfIIwwUff9HxKa/rMA3h9+/qLNvBrJ7Y5NtAAxPRBudGogcINW/LAjqSr1l0DUdUlP2ke78AwO+yXzgDsC1Jjv3IBztsh0gbV81wMpZwWKgCYJHyEdUi46tha2dBCYT0/Ejeu0RMGxaYYuWwtIdgmct4zaml2xUi60HagFR5dlQ+fv0bMTNAr0oJCY2N0ZWzJlew0Y0K+LRz2T7iLHO/qLYgg3pTLpoKS5QgYbyxDrJnxL0wtmmAl2pug4Hdv6u5ou8WzhmxhsdgzIsoYiXf0cohJDiusWiafb8HIVGDBvoh1dvhChTmy5zkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wLhbj+4cFBHp87S7/WlwChsI00MeQOpfQbI4oZwuoA=;
 b=hsBR5CxqdvjjwlFecm+EAq7GZxx3C4nQgY4csSwHh1EEeq8uFj9JXML175jTtlSKrOjYJqJsyK4JrjAK03/Q+JzjoxRIG6yZsidBP5WkQ1stLKMFV2AUWFwc1N1VSDAB5KWWqnsoNTVWb4+Q1CqYTdZbVU0A4ZjOC2egITi6wsZT844uqVUy8/hvxUhdYaFtgBs2F50/wQMlUF+o4sMfykhWSDqW/OL1PFA7i+mbZSiLyir8TFvv7cBc8NnxAXLrf+PmNBfVdqJ6taqs07gZlBfbQ4O8IzrVjcFZg+5MhrdlsfMY1MDlB5uVKD2g44siN27Mi68M+L023MyzmQfQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wLhbj+4cFBHp87S7/WlwChsI00MeQOpfQbI4oZwuoA=;
 b=H2/LBZ0US4j+q0kuYXLMw4wm+97Hri3+gg7nF9L3l2JXIwd6+7UWTG/oMOZOIs3grJ337w3DphXkEFuMk9U+q4r36Vb6dBeMEhc96edPxydiPbkrRRIaFm0D19vLPPIpxd8fRPZEDsiCELWYeXroMAI13cwTuzv3aMw4H7mhlgs=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB5692.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:64::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 14:12:34 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 14:12:34 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: Re: [OE-Core][dunfell][PATCH 2/2] sqlite3: Fix CVE-2020-35527
Thread-Topic: [OE-Core][dunfell][PATCH 2/2] sqlite3: Fix CVE-2020-35527
Thread-Index: AQHYzDGrwlKtG4XqDUeb6hzwuEBCXa3myxPM
Date: Mon, 19 Sep 2022 14:12:34 +0000
Message-ID: 
 <MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <20220919141050.15332-1-virendra.thakur@kpit.com>
In-Reply-To: <20220919141050.15332-1-virendra.thakur@kpit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|PN0PR01MB5692:EE_
x-ms-office365-filtering-correlation-id: 808a8504-6853-4072-05ef-08da9a48ffe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ALK/RIi/BsuHDnr+CABWiT3etm6KJCWY3Iqfa1eEY95tKuzLS6FvLfWiZPxV1uM6P4HgndUBdvfN7giQDPIpuL12gg7/N6iNRHp+49DJ99CwzRomL4tgrXEjJlZzHDDP9S3dKwieLvPrUqQ0zcTirThcNW47bO5ui9hf9JB9bp6am9SwJeuqlx5Mt00Bxuy3LPejGxgsTyBUHHdCOPtO4DTR3Yl8Mt4sUwRupmCfwNj4QQYyPyUgEsAMNqqSSaZCHEzNdH1qJdN3/+YBu9gemzYhWKelmftgznq/XC5MqykmX9FTT4m4jt1wZf4Uye9nLza+NI+ubByz03KrNEeJpgE3FnNqLlYGJF+aTO6ozqZ4VIS9MHDE99M3RH3YqeuqMPCs+JmfEQAY+LLFp2P058XmGQrR833kJxDpyTZhzCxdcyKS5PVJl92ANKID7rViFz6yanY4A05/aWJhiH1sgWg6NtLDT4ueRIyikJgcbuMLE0365MaF9oiVjNOqvIhWq5xghvbd+CfKeooXLdn7CI90PK0jLgMdNIzFcxVLyeVV5QbImR4N5sg3zZBUO4le2KxwVCaldA0tD7yZe5uG7EL6BJIXjmJVG7QFnfL0oHUXF+hNl7OkrmiVlEVDOiFc/jtcIFFNAwZvS2JzwC8kN0NH3d30Sv1Uw/+6UxzJyFy3W9evdwvtfU+CSHUvWEyX3/J82k9SVLL0stRM9j0Nr2/ncPXp7aoFU+qP6klsHaGTVvtrfu67qfb74g0qo5iL8s588+zkGdAFV7FjUYIMJDWQiTQa/eMrHOB1/QT8iJOyRsg9ksSjMN4tgiRuXASFCqyCeckXte9g+LMmtA6hhg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(2906002)(966005)(38070700005)(7696005)(53546011)(41300700001)(55236004)(64756008)(6506007)(55016003)(84970400001)(45080400002)(4326008)(33656002)(8676002)(91956017)(76116006)(66446008)(66476007)(66556008)(66574015)(83380400001)(6916009)(66946007)(316002)(52536014)(18265965005)(71200400001)(5660300002)(186003)(8936002)(478600001)(86362001)(38100700002)(26005)(9686003)(166002)(99936003)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eMbYehZr4fsLGtNAT9JTWjjUZWqYlDYh5Vf1Fi764dJHF/cgjwMXXVKdAQpr?=
 =?us-ascii?Q?vfhmIYu42zLLS18sYhL0N9zCFSVXeEjQXBYSfUE+tU2Ir8chZQmJv3N+55hh?=
 =?us-ascii?Q?82CByE7AtP83dklyIa9VRk6n6pP/1wa4ExHmSuVBzTRaM3qMREmQmgp1FJX+?=
 =?us-ascii?Q?dAbfTeV4WouSyd5ZlxqiFsI2h7YkUqb+Zgu5fIStAwU3YLyIfkYu1QToG+bZ?=
 =?us-ascii?Q?AP+T6DGqpIf8gkVMx0rbl2vNAi8K1nDJ8X4dYWkR5Kc7pUTNUQnH1yWcOVid?=
 =?us-ascii?Q?kinQgjhijyYAqLLUFF9X26yDjw0XRlow+TwLqW3aVSjUi+pYzjvUgdiuwhXP?=
 =?us-ascii?Q?tisFbJ5w5WdKaRDTj/B+H8HalyQ8pl5OVy3b4UJw90qW7pFfJdplV78A9yGe?=
 =?us-ascii?Q?ihcAhdeUPZ7xv8CSPDD+J7gFNq312q1SpKREy7bIC17MWg7Vik53UbjBFGPk?=
 =?us-ascii?Q?ChWEkhs8FPsDDnzdbcDg8LH1D8H5msgiWdzJh5W6EzIdIVFra5+KK7/n7lqm?=
 =?us-ascii?Q?kV7oJjBcYDKeSZ4+V0m0U9ciJCE9vi0N1m8GkjQVwF1KyisZeeBFF72GW2nP?=
 =?us-ascii?Q?ev6dlikWH4qHP52lnnourhUDij/aitNvqwNIrs6+/SHl56xaq/O2OPAPHPNy?=
 =?us-ascii?Q?8mXywIK6wq14W8plnA/88Zr/jTgGsBvOpXP0rdRg46lhStHrWRbiewnucpQe?=
 =?us-ascii?Q?rAhfrhY/3+1boK2xU3wBPZjV44mEzKirouGuBFYVJeNT6A9UH6RL/rN6QlUi?=
 =?us-ascii?Q?rFteo2YnXZ4wURmrRSnyC3vXdURCCbwK4LEhp3VELMSBHLS9J5qJ+fz5TfgO?=
 =?us-ascii?Q?emnAHfvQXkqUTk6JmG6Lh892gMCll1vh8LXQgVuiCX55r1jc15L4fR3AR16W?=
 =?us-ascii?Q?MdwgRUAX8x71rxkzXQtUbfrvUtLYV9swDg+UIk+947SkanzIDovYxIWLejXu?=
 =?us-ascii?Q?lMQc37xJFm4Pc1VtBqMmYNNfcvDZiLyedr2jf9Juat5O4zQTFL/+B+1z7zug?=
 =?us-ascii?Q?j2PbGUDuTFfoGOf+I2xAPwnQ9bdlZmceTQQHChRRSTxaARJ/dzx54Ug6wYYo?=
 =?us-ascii?Q?2OcK/VE5BPaKx47HRCXuVNiUF5kFuV9kqVjpt39i75Pvx+9EiEHdeTWVDA1a?=
 =?us-ascii?Q?3N4xsbq4H6xUBTi8EguvHEZEIeZmsHnmrerlxJnVt1RUNaPM0JbtfgUQmUou?=
 =?us-ascii?Q?lf9Zbv0w6tZGweY/5L6mJcKXbLEhT8SIAQ9IBBJAnZJHnhZDrpBuUv2fWeXk?=
 =?us-ascii?Q?3bspwzB3k3al8GQGx5YMX3LKBo0mQNNYjmQUeU7W1GYuBOg0DtQzM7ClvVwL?=
 =?us-ascii?Q?bmmN3TPjcUEw8W3yW7gdBSCJ9u5/p2VKanbkrC3kN848coB8qKT0RXS9tldN?=
 =?us-ascii?Q?jGnNZNPHmGO1JppcgKPOeZ20U8mnMRUIUt6YrCk/YX8rIMWSqlw7tQRd8Dca?=
 =?us-ascii?Q?oXwpDgvGPS5jsvSCYoisnkGJ4HKF2TQA356GECZI66pQ4oIZHn89JvHA2qxh?=
 =?us-ascii?Q?3ZUw2fH47EhrwLAcl/wgXvh2vt3KonEk8u7irJ12B/GFH8FPtbjlMm0/fqz7?=
 =?us-ascii?Q?aKzZzu+8xbIWxHNZu+s=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 808a8504-6853-4072-05ef-08da9a48ffe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 14:12:34.7490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 HpvB8ooaGmA0Jfy9e1VJWkN/A/DA4Y5UbvpdFhS3KOIVfTB66N7tu91XnpnpstYvSjo5lXSgH42X6kLVWSazUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5692
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:12:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170862

--_004_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_"

--_000_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attaching patch file also
________________________________
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Sent: Monday, September 19, 2022 7:40 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: steve@sakoman.com <steve@sakoman.com>; Virendra Kumar Thakur <Virendra.=
Thakur@kpit.com>
Subject: [OE-Core][dunfell][PATCH 2/2] sqlite3: Fix CVE-2020-35527

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2020-35527

Reference:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsecurity=
.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlit=
e3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;data=3D05%7C01%7CVirendra.Thakur%40=
kpit.com%7C137fc88ada814f8afb7c08da9a48cda1%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637991934731945883%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D5JGYey8Gm0ngS09jsjZbdSrQOogBmVmRW3bivwvnmes%3D&amp;reserved=3D0

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../sqlite/files/CVE-2020-35527.patch         | 22 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35527.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35527.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35527.patch
new file mode 100644
index 0000000000..d1dae389b0
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35527.patch
@@ -0,0 +1,22 @@
+From: dan <dan@noemail.net>
+Date: Mon, 26 Oct 2020 13:24:36 +0000
+Subject: [PATCH] Fix a problem with ALTER TABLE for views that have a nest=
ed
+ FROM clause. Ticket [f50af3e8a565776b].
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%=
2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;data=3D=
05%7C01%7CVirendra.Thakur%40kpit.com%7C137fc88ada814f8afb7c08da9a48cda1%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991934731945883%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;sdata=3D5JGYey8Gm0ngS09jsjZbdSrQOogBmVmRW3bivwvnmes%3=
D&amp;reserved=3D0]
+CVE: CVE-2020-35527
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -133110,7 +133110,7 @@ static int selectExpander(Walker *pWalke
+             pNew =3D sqlite3ExprListAppend(pParse, pNew, pExpr);
+             sqlite3TokenInit(&sColname, zColname);
+             sqlite3ExprListSetName(pParse, pNew, &sColname, 0);
+-            if( pNew && (p->selFlags & SF_NestedFrom)!=3D0 ){
++            if( pNew && (p->selFlags & SF_NestedFrom)!=3D0 && !IN_RENAME_=
OBJECT ){
+               struct ExprList_item *pX =3D &pNew->a[pNew->nExpr-1];
+               sqlite3DbFree(db, pX->zEName);
+               if( pSub ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index 48051593e4..d9e98c9120 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.sqlite.org%2F2020%2Fsqlite-autoconf-%24&amp;data=
=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C137fc88ada814f8afb7c08da9a48cda1%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991934731945883%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3Dn%2B8s1tL9NuC8%2BkcAIxrrK0LmWgsjC5J3fWagEc=
O2ks4%3D&amp;reserved=3D0{SQLITE_PV}.tar.gz \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
            file://CVE-2020-35525.patch \
+           file://CVE-2020-35527.patch \
            "
 SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b78=
25a2b6b51949ae"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Attaching patch file also&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Virendra Kumar Thakur=
 &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Sent:</b> Monday, September 19, 2022 7:40 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> steve@sakoman.com &lt;steve@sakoman.com&gt;; Virendra Kumar Thak=
ur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Subject:</b> [OE-Core][dunfell][PATCH 2/2] sqlite3: Fix CVE-2020-35527</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Virendra Thakur &lt;virendrak@kpit.com&gt;<b=
r>
<br>
Add patch file to fix CVE-2020-35527<br>
<br>
Reference:<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2Fsqli=
te3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;amp;data=3D05%7C01%7CVir=
endra.Thakur%40kpit.com%7C137fc88ada814f8afb7c08da9a48cda1%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637991934731945883%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;amp;sdata=3D5JGYey8Gm0ngS09jsjZbdSrQOogBmVmRW3bivwvnmes%3D&amp;amp=
;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2F=
sqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;amp;data=3D05%7C01%7=
CVirendra.Thakur%40kpit.com%7C137fc88ada814f8afb7c08da9a48cda1%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637991934731945883%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;amp;sdata=3D5JGYey8Gm0ngS09jsjZbdSrQOogBmVmRW3bivwvnmes%3D&amp=
;amp;reserved=3D0</a><br>
<br>
Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
---<br>
&nbsp;.../sqlite/files/CVE-2020-35527.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 22 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/sqlite/sqlite3_3.31.1.bb |&nbsp; 1 +<br>
&nbsp;2 files changed, 23 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35527.p=
atch<br>
<br>
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35527.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35527.patch<br>
new file mode 100644<br>
index 0000000000..d1dae389b0<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35527.patch<br>
@@ -0,0 +1,22 @@<br>
+From: dan &lt;dan@noemail.net&gt;<br>
+Date: Mon, 26 Oct 2020 13:24:36 +0000<br>
+Subject: [PATCH] Fix a problem with ALTER TABLE for views that have a nest=
ed<br>
+ FROM clause. Ticket [f50af3e8a565776b].<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool=
%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&=
amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C137fc88ada814f8afb7c0=
8da9a48cda1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991934731945883=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D5JGYey8Gm0ngS09jsjZbdSrQOo=
gBmVmRW3bivwvnmes%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2F=
pool%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar=
.xz&amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C137fc88ada814f8af=
b7c08da9a48cda1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63799193473194=
5883%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D5JGYey8Gm0ngS09jsjZbdS=
rQOogBmVmRW3bivwvnmes%3D&amp;amp;reserved=3D0</a>]<br>
+CVE: CVE-2020-35527<br>
+Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
+---<br>
+Index: sqlite-autoconf-3310100/sqlite3.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- sqlite-autoconf-3310100.orig/sqlite3.c<br>
++++ sqlite-autoconf-3310100/sqlite3.c<br>
+@@ -133110,7 +133110,7 @@ static int selectExpander(Walker *pWalke<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
New =3D sqlite3ExprListAppend(pParse, pNew, pExpr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
qlite3TokenInit(&amp;sColname, zColname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
qlite3ExprListSetName(pParse, pNew, &amp;sColname, 0);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( pN=
ew &amp;&amp; (p-&gt;selFlags &amp; SF_NestedFrom)!=3D0 ){<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( pN=
ew &amp;&amp; (p-&gt;selFlags &amp; SF_NestedFrom)!=3D0 &amp;&amp; !IN_RENA=
ME_OBJECT ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct ExprList_item *pX =3D &amp;pNew-&gt;a[pNew-&gt;nExpr-1];<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sqlite3DbFree(db, pX-&gt;zEName);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if( pSub ){<br>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb<br>
index 48051593e4..d9e98c9120 100644<br>
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb<br>
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb<br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.sqlite.org%2F2020%2Fsqlite=
-autoconf-%24&amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C137fc88=
ada814f8afb7c08da9a48cda1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379=
91934731945883%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3Dn%2B8s1tL9Nu=
C8%2BkcAIxrrK0LmWgsjC5J3fWagEcO2ks4%3D&amp;amp;reserved=3D0{SQLITE_PV}.tar.=
gz
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2020-13632.patch">file://CVE-2020-13632.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-35737.patch">file://CVE-2022-35737.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2020-35525.patch">file://CVE-2020-35525.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2020-35527.patch">file://CVE-2020-35527.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[md5sum] =3D &quot;2d0a553534c521504e3ac3ad3b90f125&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;62284efebc05a76f909c580ffa5c008a7d22a128=
7285d68b7825a2b6b51949ae&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_--

--_004_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-sqlite3-Fix-CVE-2020-35527.patch"
Content-Description: 0001-sqlite3-Fix-CVE-2020-35527.patch
Content-Disposition: attachment;
	filename="0001-sqlite3-Fix-CVE-2020-35527.patch"; size=2744;
	creation-date="Mon, 19 Sep 2022 14:12:07 GMT";
	modification-date="Mon, 19 Sep 2022 14:12:34 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0NjVhZjk1ZmMyNDQ1ODEwMjk5NjNmMmU4NzQwNzkxZDZlNGU5ZmY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogVGh1LCAxNSBTZXAgMjAyMiAxODoxMToxMCArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IEZpeCBDVkUtMjAyMC0zNTUyNwoKQWRkIHBhdGNoIGZpbGUgdG8gZml4IENWRS0yMDIw
LTM1NTI3CgpSZWZlcmVuY2U6Cmh0dHA6Ly9zZWN1cml0eS5kZWJpYW4ub3JnL2RlYmlhbi1zZWN1
cml0eS9wb29sL3VwZGF0ZXMvbWFpbi9zL3NxbGl0ZTMvc3FsaXRlM18zLjI3LjItMytkZWIxMHUy
LmRlYmlhbi50YXIueHoKClNpZ25lZC1vZmYtYnk6IFZpcmVuZHJhIFRoYWt1ciA8dmlyZW5kcmFr
QGtwaXQuY29tPgotLS0KIC4uLi9zcWxpdGUvZmlsZXMvQ1ZFLTIwMjAtMzU1MjcucGF0Y2ggICAg
ICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0
ZS9zcWxpdGUzXzMuMzEuMS5iYiB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9maWxl
cy9DVkUtMjAyMC0zNTUyNy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9maWxlcy9DVkUtMjAyMC0zNTUyNy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9maWxlcy9DVkUtMjAyMC0zNTUyNy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5kMWRhZTM4OWIwCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvc3FsaXRlL2ZpbGVzL0NWRS0yMDIwLTM1NTI3LnBhdGNoCkBAIC0wLDAgKzEs
MjIgQEAKK0Zyb206IGRhbiA8ZGFuQG5vZW1haWwubmV0PgorRGF0ZTogTW9uLCAyNiBPY3QgMjAy
MCAxMzoyNDozNiArMDAwMAorU3ViamVjdDogW1BBVENIXSBGaXggYSBwcm9ibGVtIHdpdGggQUxU
RVIgVEFCTEUgZm9yIHZpZXdzIHRoYXQgaGF2ZSBhIG5lc3RlZAorIEZST00gY2xhdXNlLiBUaWNr
ZXQgW2Y1MGFmM2U4YTU2NTc3NmJdLgorCitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRw
Oi8vc2VjdXJpdHkuZGViaWFuLm9yZy9kZWJpYW4tc2VjdXJpdHkvcG9vbC91cGRhdGVzL21haW4v
cy9zcWxpdGUzL3NxbGl0ZTNfMy4yNy4yLTMrZGViMTB1Mi5kZWJpYW4udGFyLnh6XQorQ1ZFOiBD
VkUtMjAyMC0zNTUyNworU2lnbmVkLW9mZi1ieTogVmlyZW5kcmEgVGhha3VyIDx2aXJlbmRyYS50
aGFrdXJAa3BpdC5jb20+CistLS0KK0luZGV4OiBzcWxpdGUtYXV0b2NvbmYtMzMxMDEwMC9zcWxp
dGUzLmMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KKy0tLSBzcWxpdGUtYXV0b2NvbmYtMzMxMDEwMC5vcmlnL3NxbGl0
ZTMuYworKysrIHNxbGl0ZS1hdXRvY29uZi0zMzEwMTAwL3NxbGl0ZTMuYworQEAgLTEzMzExMCw3
ICsxMzMxMTAsNyBAQCBzdGF0aWMgaW50IHNlbGVjdEV4cGFuZGVyKFdhbGtlciAqcFdhbGtlCisg
ICAgICAgICAgICAgcE5ldyA9IHNxbGl0ZTNFeHByTGlzdEFwcGVuZChwUGFyc2UsIHBOZXcsIHBF
eHByKTsKKyAgICAgICAgICAgICBzcWxpdGUzVG9rZW5Jbml0KCZzQ29sbmFtZSwgekNvbG5hbWUp
OworICAgICAgICAgICAgIHNxbGl0ZTNFeHByTGlzdFNldE5hbWUocFBhcnNlLCBwTmV3LCAmc0Nv
bG5hbWUsIDApOworLSAgICAgICAgICAgIGlmKCBwTmV3ICYmIChwLT5zZWxGbGFncyAmIFNGX05l
c3RlZEZyb20pIT0wICl7CisrICAgICAgICAgICAgaWYoIHBOZXcgJiYgKHAtPnNlbEZsYWdzICYg
U0ZfTmVzdGVkRnJvbSkhPTAgJiYgIUlOX1JFTkFNRV9PQkpFQ1QgKXsKKyAgICAgICAgICAgICAg
IHN0cnVjdCBFeHByTGlzdF9pdGVtICpwWCA9ICZwTmV3LT5hW3BOZXctPm5FeHByLTFdOworICAg
ICAgICAgICAgICAgc3FsaXRlM0RiRnJlZShkYiwgcFgtPnpFTmFtZSk7CisgICAgICAgICAgICAg
ICBpZiggcFN1YiApewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3Nx
bGl0ZTNfMy4zMS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4z
MS4xLmJiCmluZGV4IDQ4MDUxNTkzZTQuLmQ5ZTk4YzkxMjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuMzEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjMxLjEuYmIKQEAgLTE1LDYgKzE1LDcgQEAgU1JDX1VS
SSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMC9zcWxpdGUtYXV0b2NvbmYtJHtTUUxJVEVf
UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMC0xMzYzMi5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0zNTczNy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9DVkUtMjAyMC0zNTUyNS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMC0zNTUy
Ny5wYXRjaCBcCiAgICAgICAgICAgICIKIFNSQ19VUklbbWQ1c3VtXSA9ICIyZDBhNTUzNTM0YzUy
MTUwNGUzYWMzYWQzYjkwZjEyNSIKIFNSQ19VUklbc2hhMjU2c3VtXSA9ICI2MjI4NGVmZWJjMDVh
NzZmOTA5YzU4MGZmYTVjMDA4YTdkMjJhMTI4NzI4NWQ2OGI3ODI1YTJiNmI1MTk0OWFlIgotLSAK
Mi4xNy4xCgo=

--_004_MAXPR01MB43272CF04F0B4E6D6F59BAC09D4D9MAXPR01MB4327INDP_--

