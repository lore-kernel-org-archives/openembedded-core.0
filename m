Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53214C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 12:51:18 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.40])
 by mx.groups.io with SMTP id smtpd.web11.5829.1700139068059036699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 04:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=hYWnnOOD;
 spf=pass (domain: weidmueller.com, ip: 40.107.104.40, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCw947TPV9dxOxs+U4gMrmn5dOJaVsRw1UZUrtTqBbSyvM5BRiEjSWGonR29hXxnr9jQhZ81vAlxa3ZCaVI5cjrOuR6R74LguVlhZxNoxnYkoV16jIGs2dg4O0MxKnqgXiULsvZQM1sEF2hZZZhf7Skk/xKUTfLbpC3rJ0QDpJtOvjjJ3uF4YxKYILOlRJdIBLm9Pj6yOIK1IthiWuKMbfvyNOD6GnFHvSP1MiKVj2LtQTomi/0F2BCqvtKUOevMOoDeb44YmZjeAK7EXSlgex5KbSBTCMMJPo16zYuno5Q76DDw1QR+paorJqFTCmAK7XDI4y55hdq8rZVNuH1BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayLttCK4S4FDesNwooHgnAf1a7FLKufnYqIiGXlQlqE=;
 b=J+Eqsro9N7VZI3zvlzfzhjcpyGEhOtZl/RFkfrnY8HMxW+Neb/B7OrZiZLWqLtr3OZqM6wMKVbmcCNtI96eb5VYDx8yEjP1oHt/RoktQRMldtqZnpbFV/C8oX8IEYf1Se60DtV9BxjTC22hU/PwFLUkQ2JKcG3CEJZ9qjppQs9avWlNgpynfe4M5GGpgGIbcFs/mqPfco5A9fx76dehxoCBlUNvAWbz3vZGZNppUOAYAyCZDajker1JxyVKixGL7wvPj6opoQ+X3+ZjC19e+Yt2nyhFflYVPRbenU28gjAOQ26Ag9xA1heuSJSwRodaOGS2YrIBcSZY4GE53F8hLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayLttCK4S4FDesNwooHgnAf1a7FLKufnYqIiGXlQlqE=;
 b=hYWnnOODVhFDn/vJWu4gHwNqp9lusNKD0imKj5mgFZ4sEBt8ZaNRa4PKYvd8yCYuLw+w4NU0H4sRUXU16F4N2wtIl8m8Zd3YAzLzIOhpL52DhbulLCSPNp7nw/tYPLGF8Zuqs9mkaGMHfRqI87Y24rNnukWzX0NuOJzqpXyK7Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7829.eurprd08.prod.outlook.com (2603:10a6:20b:519::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 12:51:04 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 12:51:04 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH v3] systemd: use nonarch libdir for tmpfiles.d
Date: Thu, 16 Nov 2023 13:50:59 +0100
Message-ID: <20231116125059.1483544-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1798186BACD6DC19.9929@lists.openembedded.org>
References: <1798186BACD6DC19.9929@lists.openembedded.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::7) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 313e78b9-bf97-4a69-e9cf-08dbe6a2b1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NvW9xMxiRGLr6vY5cbvSPkOKqHNzH240cbwzULmNbnumP7xJJ6PkdVlG5ibfFGyTlu3QLkGNhVer2FJHC5fc5PDdPjPZdwPA/uL2b2VWR8jYCr2L0PZtYR+lhxxj5smrLhZahL3tBsom77POrFeK7gNOMm6kcFqPro+zvjS+ghKNGKxnB1GR3uS6bZCCGZQt3l8AJlQNCLHqFWKYbbwN685oKPaPubJAx1FMp6iA+VQ4YTGWfepGyqu14ARgd6AIQxDp8uZOV29o5sU5gvnTTeZ0BUP8rpOAHy4IGE8EkkF5XJyUTGp476NvK8BQGuvFaM+O85HpfxXtMvji6MoZNfNSbuiYoMSbCFBrPz1JRv2C/VGnT2/QoX7LxO7aaMAM2J2CM8z3jk2ZgaY3E0lPK+54BcC588iBmnBfBZUJ8KvvnnmNmEkJOWWkuogRteouKOSTNMhRCdRNmatJrdnaJLW6PoclG88+xvT4AREHEsyH5ZBtMsoY4leJXCXy68SIJwFItk3GEmgHaA8XQndZVr0ntuWT9d++ZGW6fLoS3vcSKa3nFZwphwYqeE+hv3CIa2Gxn7+KzbsojA/9fM0mle0PFYlin6H/8mPPrkchZiw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6512007)(6506007)(6666004)(9686003)(1076003)(2616005)(26005)(478600001)(6486002)(966005)(86362001)(41300700001)(52116002)(38350700005)(6916009)(66946007)(66556008)(83380400001)(66476007)(316002)(38100700002)(4326008)(2906002)(8676002)(5660300002)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/c4GcB2Iy61jHaOcWuSyNp/lA/aKPmSpHcb+p5IB0Mbicbtdr+Io5ksZh/Z8?=
 =?us-ascii?Q?qnOrZ25H/80Qlb+YsrCyo3VlbV4jm16McNzirYb1KsIblM/QPZllt/5Bgf4x?=
 =?us-ascii?Q?0tQlRmlOrKQX2A2vdfL9JoK4hqAfIRoiE4aNeTgJ1ECkEwO3kjvnpYIrlIFr?=
 =?us-ascii?Q?181gVvmKVjIAUQmM89aznOAFZm91bRzSwvofEYat64mHDvU1o/PpRFQis4iH?=
 =?us-ascii?Q?yJBPKBBm/i3HIZDsNroY5V8j0eVlcT22gOQF7kvRWPsGGgrfHHKVhuUV0/6j?=
 =?us-ascii?Q?Axw6W6lVGB7FgwEgD31xlZ1tMbLwJAL8gTwVR5YI8ZJbsWzudI3wlUkCZsBz?=
 =?us-ascii?Q?mVORezafsemTenj88nkk2twqES6KrXG6kmcOzjBv5OTTLqeDQa4b/G8fUPNM?=
 =?us-ascii?Q?ZFITQPtEzJoenosXgbHe6OPhf48PToC95fqTJdKVdxo9oz9Xs0v6WM8TPaxJ?=
 =?us-ascii?Q?frTYRLpO2vfRbJ+cUbj2AlZ39jLHNhgnyvY7ljPl3lrBM3IsO4gc2viZ0Ym7?=
 =?us-ascii?Q?rq0Zutq1aXverj5CgtWEyL73KRtDUgCOEA+SkwIUG3IFX9qsxilK7NbJv0zY?=
 =?us-ascii?Q?i2ASpW5qzSOoFiE37chB0LnM+prBctNaTjCh0W1hXfFbtYoIuT5PSLLTe9yh?=
 =?us-ascii?Q?BYiNr/w5DDGu0k17xpTYBPGEGYusNhWYGBclBwAlqfSv2UPu+IA8SvrZbWUG?=
 =?us-ascii?Q?d6+ScBOoWVVUAJiau4dmyPxzH7GY57uyTbrf+PxL/4E2rx933JAORvm3ueEr?=
 =?us-ascii?Q?/VhD//7rz+R2DloaXG7I13t+P2vgP1Ugmh74xs4mQo+PHp9ZleqnxMkkvpZG?=
 =?us-ascii?Q?gPR7lOlBQu0yxK9bb96D5ggKGhXKgUnVd1YKLfWN0voINIykDNi5rhrj21NT?=
 =?us-ascii?Q?SUn1fqFWeJHKVcEDtkwAqpMHx4+B/nZxuL6Md3VUbNXdHqcAH4Yl+e87J1Og?=
 =?us-ascii?Q?TrnbgdTkuiJ0SNPime2eSRkRI+m80EJHyW25GJKC2Uaq1KvJTHCjaKOYjOfF?=
 =?us-ascii?Q?U2bY1X2dzt8RbPiWehWwCLlbr05CEy8dAcbm9Rk24ybIdahDUDpr1SEr7jyT?=
 =?us-ascii?Q?8y4/hl5SNEH0RVPTrwPN2vHu8kilm+ohoNVi8nuz48ekE5Zob8tqn+NiCCbF?=
 =?us-ascii?Q?WLsVemOAYXVfdaJoXQT35jFiLz2gA++5cHErJHCQQ183LyBMrfrxlxyRMkPM?=
 =?us-ascii?Q?UrRvP7N71aAyjByIWbWYvRQUQ/zr0Rs2Lwd5Pslg86wEH97GTAvvpmR6jO48?=
 =?us-ascii?Q?9CUoiSTXmKfi5FaO8gxquN7v6op49N2mUhHDQG67/WRe6e4YgpuHQVmHAPMo?=
 =?us-ascii?Q?zWC4HPeInNDJZunK06jmqY+I9M/c/L4Z68BqXuCYsJoSeAC26DkhbYs/P0GW?=
 =?us-ascii?Q?V11Pz2c3I8U2g6NTOLbI3MIMuO+t4yJor5eR3gN6R4xHkFUahC+egYuzO7eC?=
 =?us-ascii?Q?dspbBgPadxlRsZO4URMAr1oLQNqAM8JMmaYAMfgF5dTggfgB21/6VzD1rybA?=
 =?us-ascii?Q?Z2xbkiYrejd6eMqsNnfPgwwc53LjeVvDRW1HUhZTluQvkimvhBz6YRptYrAO?=
 =?us-ascii?Q?5KT6NrfP/C9Los4ngz9kI6sOUTTvV2NfFs9LiaGNjw3RT6gxWIABoCb1s9b/?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313e78b9-bf97-4a69-e9cf-08dbe6a2b1ee
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:51:04.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhBKFkWL84p3/kFgBuNOT7ljilyPAANxBLIlX4/CtQA32ADFLxTbJVwypDSx0Rg6mfJRXD0/EuEVTpp1E1LO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7829
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 12:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190793

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core=
/systemd/systemd_254.4.bb
index cc0e29fdd2..6d71fbaba2 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -282,12 +282,12 @@ do_install() {
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/sy=
stemd-udevd ${D}/${base_sbindir}/udevd
=20
 	install -d ${D}${sysconfdir}/udev/rules.d/
-	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -d ${D}${nonarch_libdir}/tmpfiles.d
 	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
=20
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpf=
iles.d/
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/=
tmpfiles.d/
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; =
then
 		install -d ${D}${sysconfdir}/init.d
--=20
2.30.2


