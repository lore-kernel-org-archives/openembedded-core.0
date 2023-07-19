Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30CAC001DE
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:03:26 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.124])
 by mx.groups.io with SMTP id smtpd.web11.5269.1689796998738403251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=iOsVH+Ki;
 spf=pass (domain: ni.com, ip: 40.107.93.124, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksAzv4KpM0T9WFAlVisSnyRaKsFDIDRrWMdpL+p1rqrLcX32hy3wQrOwU8iXQv1MPQ3JnjlB/kfXljdyuwRYRhvcKx15yd7baMVTjn6vru9LjJO+DRXVu9BP75yqolYjLU1KUTnRNrLn51E8ciE6eJez7oIyZUslU/Qlv3fvNVCkdVdPR3P9u8IqqRG+b8bb+02JCs1XbNl5TP/LbZT/bWYIUgMv6J+Iwkk+xkSFMtdCVeZP58f+ibWpFc2QwLNu5HTCjBT9HgzGX8L+VJHchsAL2q4bJokKtOPHORUWiiNkghugsvjpyu12cme1SteENdVRLqjG8T1gw5uCOYww9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFc13pdRFlFejFMju2lNQ6iYrt7en8yyjgO76274YwU=;
 b=SOzolcc7iRuPuK/Tf5mdYzqb9DQu98siPHJP8kO3gPP8tPpVWE5slZopRpTPdC0QwHHJbBRWD9gTsnqRziI5bZUk7Ab3U6eKEb7xycVUo9cTxS4bOJzZ1xUQNr/tTz0t/oRRnUoTa8oBD0fdNOyXzIunljKvvI9FvRAEJPP80ZeISxM03dPOFrCheRVTb+vQfeLtYHCamCmK1kdHuP/NuWfO9zVPHZ6Wrylb28iE87OtGBKjtkUvpyCS2QslLDTjs3DftHjvxz8rLIDs3WdzGgXzqJgbonPoJOZ82Nq8Zq9UApORe/QQSIQ9CPov6HB1OS7vvl+aI9L7kVPBAYsvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFc13pdRFlFejFMju2lNQ6iYrt7en8yyjgO76274YwU=;
 b=iOsVH+KiamkY6JCimUimZNrgezwbhQ+0NqOAM8uCqBdbToHC22QOJYH9g4z26jPCDKIeEIsrcMTjxUJsfs2IN9ezRYqez/KmDFi63ss1hxUNCXTGMgFY9zAzl24kIojRfQy2gEB3pqkq2oneYiGDAqV4/jrpUjff/HmcXZf1aCs=
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ0PR04MB7805.namprd04.prod.outlook.com (2603:10b6:a03:3ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 20:03:17 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada%5]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 20:03:17 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH 3/3] packagefeed.bbclass: Add new bbclass for
 building feeds.
Thread-Topic: [oe-core][RFC PATCH 3/3] packagefeed.bbclass: Add new bbclass
 for building feeds.
Thread-Index: Adm6fA7nYjwmJM3KZkuqihkzVagtug==
Date: Wed, 19 Jul 2023 20:03:17 +0000
Message-ID: <20230719200252.1203047-4-charlie.johnston@ni.com>
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
In-Reply-To: <20230719200252.1203047-1-charlie.johnston@ni.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SA1PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::13) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
x-mailer: git-send-email 2.41.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4870:EE_|SJ0PR04MB7805:EE_
x-ms-office365-filtering-correlation-id: ac686f49-a723-42fc-dd38-08db88933161
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FrZU/Iemzu2z2ooWDfZTkgpQtuvDtG76Z4Ibz/epeeo/fgy+MbjR3UjPHSeCy5vmw2g/GscV52+E8lbOZhGfUDzZx3nBJAOmlhSt9rRgpH6lA5WO6niy1/5xm9pGWA/SI+SFHY8k5zCuZ1Cja8+46gQ09iVx7TlmxO3GfCmBkP54wtQnIceMuWgRUyGfwCwnAzmwh1TQhd2c3c6pNMGkOXymrltSCWkBt6x6zpJW0G3PW3QldASZy5AaN8w4rJIkT0mezerjhJmFAZxlxZ4a95S5AHecQTbwlZK6HWbRl33NFDOHprJ/DWVxVrwZKSK4XuA3Fuboy9AscqRm6fBrbl8AB44KJywaA6tAPRXD26PxCxrBL7Umj2t+i4Cd2kshm0qgYQ5yMENTMvvjNWz8StWEJ3JFPtDrDIlk+DHyLho2yZ4ATWKKycF20MHJiNQeh+MFgPppxTGtJJIhKTGGM/iDVwqwsTG8FsuF+ZrDSnGKTf7ckGlNj75gxvm5rAphK+rPdqqm9SdEI8nTLJXDTzzQFLXq2/WDRrrIoN7lFBGb7OMMOASCyrKbjPJSHX0d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(6506007)(1076003)(26005)(186003)(2906002)(6512007)(71200400001)(36756003)(6486002)(44832011)(38100700002)(122000001)(41300700001)(8936002)(8676002)(5660300002)(316002)(66946007)(64756008)(66446008)(66476007)(4326008)(6916009)(66556008)(2616005)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rIZV8eRmayQ7d7Jjq+IJO7xckMxF/ZPDioQ9bPSBoSd3uGy/JzbtoccFmj?=
 =?iso-8859-1?Q?T20Z3sZ986QJSwUrT5UNW6pqawITlwPnc/tKii9DsYGq7jftCHuv0mKBNn?=
 =?iso-8859-1?Q?ZERaZ79IgndYkZ9uDK2wgWSfjJFLt9HYOxRfCe9vYDo8wmjftqyHUC9nAZ?=
 =?iso-8859-1?Q?ocNRwkkWKYmmBJen0i1q0T/XiotnFDx20c+l+8eO8K7EJZeDqJvPRoV3Rx?=
 =?iso-8859-1?Q?Nt7ox/bdotqG45ZIQ/BnyqVFNzRnMsnzYXY8A9iNMCCZtL8+NppA9RHPCF?=
 =?iso-8859-1?Q?TSt0KiAQr+sDU9MW5/I4CSuKlsPPkEUAf7axBO4Qa2r/niPAKdx/vNqctg?=
 =?iso-8859-1?Q?UvwAvqxxqHWPVURhz4wobNQbdu2n4zyCFFUGkEJaCh1i7AmmKA0Zvbj43R?=
 =?iso-8859-1?Q?Mdp5kRtC01G7wZqzcUIT2nvJuF0hGtPZEo6QbUG1snKXq8TfVJyUk9NSkn?=
 =?iso-8859-1?Q?Ca0I3Yx8f3sEXirG6yzPp9EnsrT/dV0yCYGt2bwZDtNwMEKBcUvQnnC5Ad?=
 =?iso-8859-1?Q?Inw72Og0uzC33NFbehqC6hJsTrkSkEMuTZ9Jdob1/uGHwEj1GdcoWI80rP?=
 =?iso-8859-1?Q?xy0A3x7f2l7PjGt5g55EX6N0UGhUTxdB2HtDesXNRTj9W5jl+gUmX3eUtw?=
 =?iso-8859-1?Q?HiWM1E7MEDVXQsn8+hy7BByidLSiFru/vp+f/72hqiz2yPmtLISnydwInn?=
 =?iso-8859-1?Q?M6j2lHh2K25Z434MS4rbFc2kkC2vX5OoKxh9bP9h2BNvg8ducdG/lHOtv/?=
 =?iso-8859-1?Q?Y5Kuz+ElfkKSP2GPKFXnXG90FryR8rjjwR+qzhoKCX0jYo4r3Z4S2zB7X7?=
 =?iso-8859-1?Q?mqa3rrdaLi8CNW9eRhL0qgIvRn9TAtiwgv9Zj21PznMBHn59ppjtxOP5qi?=
 =?iso-8859-1?Q?JKbT7DgWTTcYcbPmeMwp9KoG0EfJ5qWfnFM09q9UKBaHEiKaMuCFMlLra/?=
 =?iso-8859-1?Q?LXPUfHoAPRhvkCB8fiuP/5vOO6kTGXHp1FucCRs5H3DEVgXQbkMH4SAR+H?=
 =?iso-8859-1?Q?wYgP6h2i917K8Elu7jhwr7zVTJjPH5c7CljSNg75S6XXoOXD3VcTmx+MhD?=
 =?iso-8859-1?Q?bF/TVewZJoy5GOwbBU8am80m0X9sDBfPKdfXv2qA8PXmGJfk8mx4AykCdr?=
 =?iso-8859-1?Q?Yhacc4lCHgmy68lSGJhgOS1qC7e9XWyJ7P8cN7HFXwOk4FwtS6T38K/gyL?=
 =?iso-8859-1?Q?+PBCXzmt7ZfJQC8/zgmlPzrurySDa4pKgnt2K1UvLG4wWXWEw1PvJ0ww0I?=
 =?iso-8859-1?Q?8YVSj4oTDtaAusG9vw5nUGnmhSt4hnc34orNl8w8SY+o4YgFNi0Oo7waU/?=
 =?iso-8859-1?Q?vbXd6JROp0SbaNxgA+anijY6FhUmi5RTR35OO+ry3KHzK9A7yfApt5AMi9?=
 =?iso-8859-1?Q?Gx//9IzX8D8nDRybSTVpQ8RT/LkV+4A5XgiF0hC8OXAMq2vSeGt1J7lLn9?=
 =?iso-8859-1?Q?p6zuWW1QMjMptlelZhJkBkoKfK12YiJ2kkazoAlphiHXB/+XTGOjEP2VHa?=
 =?iso-8859-1?Q?lAxGLtAoMRhPfX5vqBdalGC22ltsmWWhzMeQrFgYNxXjVOekKddLmNCpdv?=
 =?iso-8859-1?Q?u+WRDp80Xzl5kIQYNl4KINOBn+8NWmPS7uzTB7+o4neIJpReQe0lwVIQCQ?=
 =?iso-8859-1?Q?3acuxuOo6BkeoYMDXOd8X6134scKHbAojPT8g2tdntY+HqrJ8/k4dWxQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac686f49-a723-42fc-dd38-08db88933161
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:03:17.3037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zD2iWFeM+/m+ios5TJu4Cq5N23PZhali+wma3GDPp88wxcG9kXycoc5RTqHwt9jZAYs5E8qQ+GiWWGuSrBLDoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184604

Add a new bbclass that allows building a feed using the
new oe.packagefeed class. This new bbclass inherits
from packagegroup so that there is also a package in the
feed that represents all packages in the feed.

The variable FEED_DEPENDS can be used to specify a feed
that the packagefeed depends on and will be available
side-by-side. This prevents duplicate packages in the
two feeds.

Additionally, there are packagefeed_<type> bbclasses to
define package type specific configurations.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass     | 16 ++++++++++++++++
 meta/classes-recipe/packagefeed_deb.bbclass |  2 ++
 meta/classes-recipe/packagefeed_ipk.bbclass |  2 ++
 meta/classes-recipe/packagefeed_rpm.bbclass |  2 ++
 4 files changed, 22 insertions(+)
 create mode 100644 meta/classes-recipe/packagefeed.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
new file mode 100644
index 0000000000..7dfccbb58b
--- /dev/null
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -0,0 +1,16 @@
+
+FEED_CLASSES =3D "packagefeed_${IMAGE_PKGTYPE} packagegroup"
+inherit ${FEED_CLASSES}
+
+FEED_PATH =3D "${DEPLOY_DIR_FEED}/${PN}"
+FEED_DEPENDS ??=3D ""
+
+fakeroot python do_packagefeed() {
+    from oe.packagefeed import create_packagefeed
+
+    create_packagefeed(d)
+}
+addtask packagefeed before do_build
+do_packagefeed[nostamp] =3D "1"
+do_packagefeed[cleandirs] +=3D "${FEED_PATH}"
+do_packagefeed[rdepends] +=3D "${@' '.join([x + ':do_packagefeed' for x in=
 d.getVar('FEED_DEPENDS').split()])}"
diff --git a/meta/classes-recipe/packagefeed_deb.bbclass b/meta/classes-rec=
ipe/packagefeed_deb.bbclass
new file mode 100644
index 0000000000..6ca5a33e93
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_deb.bbclass
@@ -0,0 +1,2 @@
+do_packagefeed[depends] +=3D "dpkg-native:do_populate_sysroot apt-native:d=
o_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_deb do_package_qa"
diff --git a/meta/classes-recipe/packagefeed_ipk.bbclass b/meta/classes-rec=
ipe/packagefeed_ipk.bbclass
new file mode 100644
index 0000000000..00ef8a30df
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_ipk.bbclass
@@ -0,0 +1,2 @@
+do_packagefeed[depends] +=3D "opkg-native:do_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_ipk do_package_qa"
diff --git a/meta/classes-recipe/packagefeed_rpm.bbclass b/meta/classes-rec=
ipe/packagefeed_rpm.bbclass
new file mode 100644
index 0000000000..862ba99290
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_rpm.bbclass
@@ -0,0 +1,2 @@
+do_packagefeed[depends] +=3D "rpm-native:do_populate_sysroot dnf-native:do=
_populate_sysroot createrepo-c-native:do_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_rpm do_package_qa"
--=20
2.41.0


