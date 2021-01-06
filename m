Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.80])
 by mx.groups.io with SMTP id smtpd.web11.6396.1609930627493300896
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 02:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=PNs1G0iM;
 spf=pass (domain: kpit.com, ip: 40.107.139.80, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMZrDX0LWWq3VpJsXdjKZX+w7KSfl35LpIb49W7fGyO2Bb5AAzT0BGy7HMsvPjI5rorOVzSCpj0yvlOpZUuU6yUdUQTpC71ulVZ7NLiKYIEQP+1sSL9i+JTt5NknRI/WmIERp+s4sBRlyZjw88tD23k37CCXb/GKFVGtJnzQWWDYxwWIgq6gdY6ZQ11e7Q9gi7jQq+JLJiNhKZtVTxoKPwj16Te7wQx8pqjhziS2W1A4amVYxdcFsufBMgnP+QdrydpiMc4VZQttncoDFV2JbqWs371ea1IWAE4tWzfcMjLLVNHYKyAx6tYQ3b8rfw7RWdGBx1xlPJw9TBOBoUCriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m8c3s4eM/gMDBZdHLE/gQnGNtB2KDVpQNlVjSNDIVA=;
 b=L8b1pDpy/ED+IHY6WuluITWW2jmcjWpemej9Iv78NWL6zFC6TKV7Nvy90QzrlDFRc2rYR7fxqP8aP/HxU0zwlu6hCQ0XELuO6xwRQu6W+CBfpEngbnIRCE4HwK612Z77AKU37SsT7kIsGhd5iZHcG6wEjWmdE4vbLbpGF87fh3f9wxb0MNFuksf/qeONw9nSV6eXn6DDmCZ9D/reH6W3Oro2eLCFjf63jo0uXTvI+rz0zhke7fG+w9VKjJPu7rcekoBcMDQmWdztsdh+FmEuSVoaCo6qQZfOGqQHGHC+7guelS1IYiEkTQkQfvjtQLSUAN9CfnYigHPGA5QUBZlsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m8c3s4eM/gMDBZdHLE/gQnGNtB2KDVpQNlVjSNDIVA=;
 b=PNs1G0iMx3Nf51/M1C23CbhFdFOlvvPK2dOFIkEQrwcQPglZUU3nG5OaEtR0Mgo+mEsbGKNgBvxWRLRdhdhlYA9XIxhiA9fyCycFxNPuD+NW98yiWdvxT3O1AzRzIwGR0hC3bbc/NWQ9D/xCJfOGdObdSypIu0m44AnctWOca+w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB2161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 10:57:01 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 10:57:01 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com
Subject: [poky][sumo][PATCH] busybox: Add fix for CVE-2019-5747
Date: Wed,  6 Jan 2021 16:25:28 +0530
Message-Id: <20210106105528.27786-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: BMXPR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::15) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by BMXPR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 10:57:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 627460a5-e843-44ee-e7f2-08d8b231cbcd
X-MS-TrafficTypeDiagnostic: BM1PR01MB2161:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB2161DBC5141008087F9FC4A0F2D00@BM1PR01MB2161.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jX0rLRoqV0c8gW3AA8yCde7qzN1zwfvt07msu/1O5NUve1T+3vkS30zXzUlMghY6XQdBtP+FvKsi2UzunafuSeI/gx9CXXDUC6IvkV4AT5vdex2L6LWBEAAqcttgCoXRGLR7VLWXNwQ2z37F7QxF8Zh31kSCLiw5cXpJ9PO3e032uSxgVC4WXCxabNYEIoDFCoAAirnWb6pM3r40++jPk4egjgnHKDos/bRWJWolsQhfSvLnp477naSEV1ZH+S6kzoawBP+uZhCkiLLTFnA6feWph9kkM5XopekeOQJse3rjlKnASYJKh3s2yTJJHCYjTDi7N2IDoRThuwTAYsVwVUcSNbBmEDrzFazIB/OXu5vD+B0JyGyH4fh9XAVcqgf1tY5yceviVmEEEVG0hOgBE0KBm3itKrfzMvCO5qEs+FiW+yLf90pWcFiBclaC7csznlm84NrYJWXIPPOqan7G53zjHBlZ+uOKZAneNsuw09p1WkNdQrtz8doqE6OS7nGAn8reMdB8eZsaBV6nyqZSnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(6506007)(6666004)(1076003)(66946007)(26005)(66556008)(66476007)(36756003)(83380400001)(86362001)(2906002)(66574015)(186003)(16526019)(5660300002)(107886003)(316002)(8936002)(478600001)(6512007)(966005)(8676002)(956004)(2616005)(6486002)(69590400011)(4326008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?VPWkp9ThawbkLEEEUM5ggV6QDfMSq45mV4LX4E0QtPp8pkConennPn2MiAl5?=
 =?us-ascii?Q?xwjn1/58dzXwuOPrzmLfM0JnwzKceY9Co5JjppRnpZTtwMTbFpsiQH0z3G2p?=
 =?us-ascii?Q?tk7HTx3uYfBZgJR16WcxqdWZHq6c7d3ZNtNw8cgJSERO9FN5bBcErDvpcXrb?=
 =?us-ascii?Q?6TwhLtKKfwS9lMoZT6QaPvqGc9zduYFoSNTC8zRa5HDfIkJVkveSkct9K/Vu?=
 =?us-ascii?Q?ewqcUvyqkGHahxTXIfV6OkuiDb6XezkBLnL7BrL0OkE+RDRSwrvI+EbA/9CY?=
 =?us-ascii?Q?oG0YOvQGTPpNvkROZ0ergGTM1tm5Mf3Wg4r3ChSfSA5RHYVExsECIpBJm4iY?=
 =?us-ascii?Q?yl8DMpPIZqeUEk5cVPtwhM/3hulVHDHcTQ9IAMvRmkJ7/Xd9QTqbfoY7fNNj?=
 =?us-ascii?Q?OdvA2+z1G64VWv3o5koBH12v4phKqvJyWdE1pieXAE2m6KctR+9TG4XU+Gcv?=
 =?us-ascii?Q?K+zbq8biiSjdxvTEeHmaS/m/VSIvMNcr4VaKa5L5zWDj/abtV8MoYS3nOier?=
 =?us-ascii?Q?/+9AZ1v1f0AaUD8y+szyos1oozk57otEQMPPBhBzu6iKWoloQG+y4Vjih2V2?=
 =?us-ascii?Q?uGHYW4qfYVwK73RELPp/zfVDv9nMTpinTdgOrdosJYubGJO3hLHV92u8I0Of?=
 =?us-ascii?Q?XRc0Blbm2iGsh0GMzitnNWsXNQMJPOMrZVm3Pge8BgfTnLNtvTCogSFb5OAV?=
 =?us-ascii?Q?9PClo3iQIvwchuFIyR4A8bUfOJeYugeMPOYJLmO5viyqdrAAkSLxjvJ5o7lZ?=
 =?us-ascii?Q?jl3tmEsSS+0xo+NHBfb6D0VH407iwIBwGoZ7Kl5+fRWJOaUPs4A9q7J642ez?=
 =?us-ascii?Q?maIzVA5EfLw2lrqLg086hM5ifeyle47ts80d0uIITriv8T0OTia4lmogNba1?=
 =?us-ascii?Q?rpZw2Un5aAAce2hOEbGcwr2ZIT/pRvMetIxmZf38TqA615WhfGeFNwW+PzAw?=
 =?us-ascii?Q?7HT6ka6QOP3OnWXfMiWxVBXbz7p9cm7MklTeV+omavlmuXlB54CDQdTx2Uxa?=
 =?us-ascii?Q?223Y?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 10:57:01.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 627460a5-e843-44ee-e7f2-08d8b231cbcd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gpuhoNlzha4LRHcGPj3n3oun7FUh7Rq8DeL69uWrbGnYUv4DrVyiXEoTLF03zLiRT4xRjfI5FsSFSwGp5xzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2161
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch that Ubuntu applied to busybox 1.27.2

The patch is available from file:
http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubuntu=
3.2.debian.tar.xz
in path debian/patches/.

The below patch is added:

CVE-2019-5747.patch

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../busybox/busybox/CVE-2019-5747.patch       | 57 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2019-5747.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2019-5747.patch b/meta/r=
ecipes-core/busybox/busybox/CVE-2019-5747.patch
new file mode 100644
index 0000000000..c209e48e73
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2019-5747.patch
@@ -0,0 +1,57 @@
+From 74d9f1ba37010face4bd1449df4d60dd84450b06 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 7 Jan 2019 15:33:42 +0100
+Subject: udhcpc: when decoding DHCP_SUBNET, ensure it is 4 bytes long
+
+function                                             old     new   delta
+udhcp_run_script                                     795     801      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE-2019-5747
+[http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubun=
tu3.2.debian.tar.xz]
+Upstream-Status: Backport
+---
+ networking/udhcp/common.c | 2 +-
+ networking/udhcp/common.h | 2 +-
+ networking/udhcp/dhcpc.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: busybox-1.27.2/networking/udhcp/common.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/common.c      2019-03-06 15:10:51=
.569626885 -0500
++++ busybox-1.27.2/networking/udhcp/common.c   2019-03-06 15:10:51.5696268=
85 -0500
+@@ -300,7 +300,7 @@ uint8_t* FAST_FUNC udhcp_get_option32(st
+ {
+       uint8_t *r =3D udhcp_get_option(packet, code);
+       if (r) {
+-              if (r[-1] !=3D 4)
++              if (r[-OPT_DATA + OPT_LEN] !=3D 4)
+                       r =3D NULL;
+       }
+       return r;
+Index: busybox-1.27.2/networking/udhcp/common.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/common.h      2019-03-06 15:10:51=
.569626885 -0500
++++ busybox-1.27.2/networking/udhcp/common.h   2019-03-06 15:10:51.5696268=
85 -0500
+@@ -119,7 +119,7 @@ enum {
+ //#define DHCP_TIME_SERVER      0x04 /* RFC 868 time server (32-bit, 0 =
=3D 1.1.1900) */
+ //#define DHCP_NAME_SERVER      0x05 /* IEN 116 _really_ ancient kind of =
NS */
+ //#define DHCP_DNS_SERVER       0x06
+-//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog)
++//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog) */
+ //#define DHCP_COOKIE_SERVER    0x08 /* "quote of the day" server */
+ //#define DHCP_LPR_SERVER       0x09
+ #define DHCP_HOST_NAME          0x0c /* either client informs server or s=
erver gives name to client */
+Index: busybox-1.27.2/networking/udhcp/dhcpc.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/dhcpc.c       2019-03-06 15:10:51=
.569626885 -0500
++++ busybox-1.27.2/networking/udhcp/dhcpc.c    2019-03-06 15:10:51.5696268=
85 -0500
+@@ -524,7 +524,7 @@ static char **fill_envp(struct dhcp_pack
+               temp =3D udhcp_get_option(packet, code);
+               *curr =3D xmalloc_optname_optval(temp, &dhcp_optflags[i], o=
pt_name);
+               putenv(*curr++);
+-              if (code =3D=3D DHCP_SUBNET) {
++              if (code =3D=3D DHCP_SUBNET && temp[-OPT_DATA + OPT_LEN] =
=3D=3D 4) {
+                       /* Subnet option: make things like "$ip/$mask" poss=
ible */
+                       uint32_t subnet;
+                       move_from_unaligned32(subnet, temp);
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.27.2.bb
index 716a0650fc..4f0b0db69c 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
            file://CVE-2017-15874.patch \
+           file://CVE-2019-5747.patch \
 "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "

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
