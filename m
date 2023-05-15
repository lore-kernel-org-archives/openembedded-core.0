Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CFAC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:15:21 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.80])
 by mx.groups.io with SMTP id smtpd.web11.83902.1684142114700412073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=0jwLyuhv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.6.80, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laPj0XtpU3q9WYwrd52cdocG2/4w4KpoD6P/ik/Z7s3Ag3EJTN93Qa4+UEz2zn91zQcr+kzw6/XR/bekqZtZ5VWVgE2PzosDW5/G0rMG/b6JV5i7bOI0Fu2IykaZpG4q/++TnEQqAC9e6zk/e0z/4BCrW8QdyBFNg7yftAvfSh9tFtW/HAknr9WpaxYtgIUgKYuYYvZOjdJJL88k1pzrsk7ac3f9JAoR4p6/1A9OQTiWcGVHLgiPCnIy7Q4zZW31a3i179IuGb5cyodyg/pbdtSMjfoEuscA6Hc9Tfty4x41q5S5OOk5W5gBkv21my77g1/vCr4IGKiJtXjerI/B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/XE4qpG3JER5tWkP8y2bODZ9+hEv/gQ6AhXAXq/vms=;
 b=hJKy+toOos1JzO7ywB+FkU58J/NDEcC14OhKIV0QdorS4Ibs/+R5/WhIM2ynp++5KMzaT12LCqLrJk0vjiQZ4wZ+n4+7NknF+Z22IyB7cJ4fBqry4MF8dcbCo6p+WNMhFKv7JXcfGi7dhE0xJ0i8VNRmV77gCitUFnBEbFM0pJWsre0IKckhGvdKfFq4X8GOF69YLx3I3CfEVaiApU69dOhqzmJWeU2sUUXU8cqY4CZRlRi4TrGqyXHhFnaUKB7rKUNsHGHV2egstTmBeNpcn08G+yNIj+WT5Wl40Xnbcin8d0D/GHZZAlZUpAk7Jav55Knn5ljPjueQo1eHQKmemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/XE4qpG3JER5tWkP8y2bODZ9+hEv/gQ6AhXAXq/vms=;
 b=0jwLyuhvqUUYzOEdOnQ+Jr8m7XXPT4PQ0bzQ0mQ6Et5OzyTLjOKCADhp0Calgv00jOHIMIzFEyDLvNXmwZesZKgE3oL2KHXbSfASK4kmQ9JmWYkkERHHUhUEOlPeS5on0YTx9c0ch1hF9UbQ2EavVJMKa8rkho7rGjOvM5w6I4KIy8VPuELj+iBPn6oxguae2wl8hOn1vkOtupePQa1ZoDuKuBVp93QvIW2oAYO4JriuoNhB0xjLLsMtt0PHNkuI9nLqt9jD8sNVSP8knpcKcVAPFGi2p3JK/yAGdi06yAQAKKQvjdh97vgFed9TmM7/dKz8JbZ0CFFr5jpJcBxWsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by AM6PR06MB5416.eurprd06.prod.outlook.com (2603:10a6:20b:88::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:15:11 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533%3]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 09:15:11 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [OE-core][PATCH V2] avahi: fix D-Bus introspection
Date: Mon, 15 May 2023 12:14:42 +0300
Message-ID: <20230515091442.419892-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000000DB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:2:0:d) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|AM6PR06MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd1cb3a-6fcc-4a9f-ad1f-08db5524e2df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ega6VzW8JbgJNlAYkX3zYMkQJANMimQL0y5MGUuOGkta3tTAsTDe2KMeWrXmYlaIPe9V9Bu4uT0VVQdAhFJ6+vpIdhS3KC28+jqUUssKiFu7/SYPuQk9w/KaDWCvIEtOfxFqgTUVlisYKY29SNVM+vW/+oA9CYYPfoWOkPxMKgkK5wmILjhGKLmYh1m4jtODDGphTH9l/Cgmw8LnN9w8Z0y4A8oWEHo1autDk2VpgycQdwVEllFXdjgHqaOuyxguma9vt+4/+0QTktImh7A3rl2QCMui/G15P7wVqlgVeuU2bLSeE4udlwgK33+5DvFmNFubELuCYdzb+tM3C9GVxgliu5/HG/PORue3NM+g0WGlYLTBOURyc3P1EZj8N0zU5cLLZBRXBYjw5iAFh1oChMquuCvq/JN4BHnFBG2T3vR9p99p07jDPCHtWtwUsBL4hBU6OZYvtOQkX0WB85hZefgfArWIM97lnzJQdmt2OHm74RGBcLdjbLW/EAnBJ431rl+VLjLVaQsTHIvQviSthavIKSidbCv+W4spCkXTGAIGzRmFAJGHap3vycpnxvvKq63BKMFS/JmjQdPEVWE+Efz9HSUgPnA7rA1SE1Fgm2hnUczp9WiDUl+Z6wulzfl6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199021)(83380400001)(66476007)(66556008)(66946007)(2616005)(6486002)(52116002)(1076003)(9686003)(6512007)(26005)(6506007)(107886003)(478600001)(6666004)(186003)(5660300002)(86362001)(8676002)(8936002)(2906002)(36756003)(41300700001)(4326008)(6916009)(316002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?49+ZHdf98s3XeE4N7D9bxA10DEQgTV0Cun1UJgKmfHjIscJHGO5ch0rvnemr?=
 =?us-ascii?Q?iJn4OtUa/IjAWWagu+ifITK7AAAR8vPaONHWOeYVtSn7D5jjJAAABChIeGRm?=
 =?us-ascii?Q?qeN2QnxVEZDR7aky+u52Gy2dM2R6GxXC/vQWN+B0SAg8HOi46m+pNuFlw9hs?=
 =?us-ascii?Q?woP5ydVGh8sGbEbudfvdgt9PejQokKTie7ucE8Q8vSqcqzsh7MmKD2CAwlki?=
 =?us-ascii?Q?cMp/cXkSx8a7rU6ac6LfJ1z74q10jNB5USWK1SG5PeNWFc3Br731jSmXmx/v?=
 =?us-ascii?Q?N+J+laJkH1Rc/17r0ERME2eIAAP2n8vHyocpI6+xVxx1ffjB9J7Pd8YmOiBZ?=
 =?us-ascii?Q?grwPg5hV4XC7Uq5JmgsCg8MGQ+w483nLNTjV/tQz0p7lRN1WYeCVAhcVeFKm?=
 =?us-ascii?Q?ljBZRKcagFHAZ5QQx5oy7EneS3Vt5CmOmrCWzRXQLv79gXelmzNliZ1o96BF?=
 =?us-ascii?Q?7zTlNg2XFGtP1X6xEkXGDeoa5B6QS2VaHSZKDtFtKRB0RYgPsHxIp0dFgJji?=
 =?us-ascii?Q?woJW2JhGKo2bAWGK96FgH3W9IpEbiE8F/DXb6YgeVjpTBgTK9BLQ4izugpnJ?=
 =?us-ascii?Q?VKwHI9t8GWtB0EqvxXiQ/KFGhuJZQDW+c39RNgkLKwRgcIAwRHzncy1WwB17?=
 =?us-ascii?Q?C6lXEYpy1RjI/zKHEJ6ksDbtJMac0tofGn54eodtbDxdXowAUkwKQmTIxuC0?=
 =?us-ascii?Q?XH0Hb0V+4fNgDvrkP1BCzIUYhxfLvL9L45I8z9U/WJJt45XEuexnDBekDKQC?=
 =?us-ascii?Q?AqM9OzKdz5kyH2KgH+C0dJwycQTzV7R+MZ0UxldUgtwZ3kqeZbWvNbgoc1cf?=
 =?us-ascii?Q?SDGS6WW+NTmpOw7bm2UtcYQngiDq1UMuXCvXorWVRC/LwlBme3AvrNtgSjJe?=
 =?us-ascii?Q?xYIONyq8PI5eKxVJLYKdmDAG+RAh3qzwLg4cmYktO1LvXlNDssm5AYZyzBND?=
 =?us-ascii?Q?fFVp2H2rUDju7Sk//bTzxoyomzRZSPydVAAiWFKd8Uhwy7+BFozSFSmRKHQm?=
 =?us-ascii?Q?6LUSpaL1iGc397VC4v4gtwUlYXhqc1sfPmqtI/gXFk06F2qZp1xYvwflrLl3?=
 =?us-ascii?Q?sUCKkLoWJJ9BndMk7eb357PcMP3ZC92eSJj+O/LSfrD6mBz6lXUd4PjJQHYZ?=
 =?us-ascii?Q?+Xj6lZuLg9Zh/SqG0oJEZpq82TjiIZgLfb53xb3H+zOm816aOuxoK2I+hN8t?=
 =?us-ascii?Q?RYfB3QuaQZ8ipT/r2Muzreiso+19DPdlfgyOqj/vyYFw8JmSaL942v2EuvJO?=
 =?us-ascii?Q?TuZ59p3kKSDH1wj/fKmuJMIpT+skWnwGx3VsfuVfNZMUK1lYJHOXPuoKTnWU?=
 =?us-ascii?Q?bl0MXpmD363X9xqW0ZK4iCSQR9MEejHpPJMGbw0xutD7LQWG10733SwVIpaD?=
 =?us-ascii?Q?sS3OFq47rbnsa9RJ2kRMW1/wRL3bTI8i19jYalqxJTgMrOhTkUHzn+J3/K3V?=
 =?us-ascii?Q?FNkBIXqeo6ozz/jO6e4yZHUn0aYLMH8OnZeFWtA7PUa0y9yYYstcwGY7Pgu2?=
 =?us-ascii?Q?pPXU1z5c7eZ4leb/vsQBsEcWUuhmwaRm13qyzEF4MD3q9u/RCwcJ37lLBy3l?=
 =?us-ascii?Q?ygJCbnSIXi0ey2DfiM2rPrx2jh8fxBLzsSZQceJqH1G2yz2qNJoAamqVkfw0?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd1cb3a-6fcc-4a9f-ad1f-08db5524e2df
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:15:11.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSdTcAG7PGcBDG5MDHPgbiVkeRXcqFLy2/z+QAzsHivUVn03bgE+q8Ua2LQdOAYXSn+soy9UuL72BNHis+4FiEP1uOLYnOyrZRODzbxFJgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB5416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181236

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Install and package the D-Bus introspection files.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index bf6835e0d6..8649140a45 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -83,7 +83,6 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " libnss-mdns"
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
-	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${d=
atadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
=20
@@ -135,7 +134,7 @@ FILES:avahi-daemon =3D "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/services \
                       ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
+                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
--=20
2.25.1


