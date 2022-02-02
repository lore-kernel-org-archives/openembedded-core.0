Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4CEC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 07:36:00 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.68])
 by mx.groups.io with SMTP id smtpd.web10.61504.1643787356066037702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 23:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=2Mh6CEnw;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.68,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2ompDAhCLiG1cU6ZKO2IOoiwGXvSeoyWDtH0CtrEExPLoHcmnMhFw8cwzkhjY7KEUIkI52KFIvX7ixjJ3H8kJRCDt6CGAylNhxL0dM4m4gejFktsQ8Xp65M1xLDALdtMtfTxElrwtPiWlgHqqOFAeoQ2qi4UJdyZYak1+yDvbAwQISAy5DG5Uqgju3M2PQsRtyv7Wi5P2G2eRvOf6y6WED5AraTh5dfwi0fyDwG/DrH1KV04T19VEB0BpCkO8tG8suFcwl/XOQeUDk2N9zq9z6KgviDNU0pPMr07II2UJnOo8Owsf7DERbSaTAFeOxmaBlWOGJ1gaCZXxhB27yDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XShy3HFzXWrCEXQDLcHhFUy0bdZdFPvFhRzbrMZsIUY=;
 b=YsuakMO2DeJrQTZm9F4hXRS9Ntp4bFn5QkIk9lfnaqWeFTEKqobL/9N2YqsrX6OhMOecAQuN9Ou3A7HKKVeHzeEpiGhgHnCw+HblXWMww97ImbYvX9aFO7VRdBcYOilpS9YY61GkvrHEuqfCxAp1O51C7z/xd7EFZUBucBoC16jASuRupLC5Ytayz21itRsyXzq7k61MYvhMTiMrFHBAAdhSL3oUMawZYJtr+2rCdQzIWyjTp1zpWqw/DSI5Hxz5BxeqG5luRpMJiRlVbOvw/jHaoK+5Drj22qZVM1Clkp0x0NOcRjUm3VN4XdcNHqaqA6BFezmiqxpdnU8cG4s3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XShy3HFzXWrCEXQDLcHhFUy0bdZdFPvFhRzbrMZsIUY=;
 b=2Mh6CEnwx1gX8xibHB4lGLSHR18hW5THaKjCUGFdZEwgMm1Wb7dF38TjeU9u5A4zAES7WHu/0S8qWagFK3J9jxLv/hXFf/neH9k7ENuyxhhJc7ytF0jN3Xo0mLJXhmXak2TbhYWGZ6j8L/CvedD52thL6mkuDTACV0jZRDxech4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM6PR08MB3111.eurprd08.prod.outlook.com (2603:10a6:209:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 07:35:53 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 07:35:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 3/3] systemd: Minimize udev package size if DISTRO_FEATURES
 contains systemd
Date: Wed,  2 Feb 2022 08:35:25 +0100
Message-ID: <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::48) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e62e8698-0962-4046-e55a-08d9e61ea42d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3111:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3111A31A6DE75D2CF9FF3CB0D7279@AM6PR08MB3111.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9NoBHWEqDS8/CGc23MMLzILJjVTx8G0toHrGBUqcomXljZ1L7oCghZyau2DA8CfDLQV8ncS0UBy25VnwRjclC2xCtNP+1MYaV84oEg4bCsrU6kF9vpamp/wtdL4DP9+NXG+PVrinZEecQ5k7uZtmmTO/NblZfawD6bwsUCcFpyqBtg4JiMLqMT91d+5Ys4PkJnRrQwJwo5dgs93OKvvjQEW0dIemWKPVij5MZSZ3ZDo3CPe+4wDaJEmfAq4DjVUSzZAJddYGV+Dc0Th9bTRsUPN+36E+7relcTEJp1e9/uaZsicDzW5gR8I33NW7LcQuTafaYjRwBe5WZS3ty3zromazQyHmKid84YCj6ndjLL2e0gczFlrU/sdyCdczkYjk3788ZGLhhQ6teNpCTbEilKIpV5KC8nFfz8Cgexx9nbKx/+DyUrxo74zdWui6xKrMXVi7COWMlOhCesi4F9yKAMZVbxakNnytq2PZH5Hb6WFs1B28o8IxKQTyx5VW51x6ca2OB0c1k+6juGywP/z4I8hsvi6PQlbaZ6+e/HKqW0pQmTTIkqBe6hNdt2T9R/zBcpsZ7hO811YsR7CuNvmPJqSUkc7ujpbu4buHiSxUKdXQrTJtQYB0uMXExqdVKcx3J4mUkP2627FLzzpZK54pXnw+Qoeo3labJkcSfoL75vk0K7saCIJC11IvKcyNT5r6UaaW5erjffa93NzeG8sbjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6666004)(6506007)(508600001)(4326008)(8676002)(316002)(6486002)(52116002)(6916009)(8936002)(36756003)(66476007)(66556008)(66946007)(38100700002)(86362001)(2906002)(2616005)(186003)(26005)(1076003)(107886003)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hyv8amRV1XKMRIKzuuJly3cJPCzccfSJDhiJE91Hhd/6o/t2PMXTXksn7twX?=
 =?us-ascii?Q?2A76SGSwwI6AWI2omNEY1KvyJYSEX/SEmTFVhleNUq/e08y5KNKRXFOJ1tzh?=
 =?us-ascii?Q?4sh8zVgubRLmk4o8y4bXEkdIgXS5YISIFQr0jpUdIbGWjgaBLqBcvZMXwPN2?=
 =?us-ascii?Q?Xun2gyDjHSay+MIgth1IHUmHqmIgisR2Q8EVHIWzrai2IkkfzoMnNHi8CvEZ?=
 =?us-ascii?Q?wc8nSzjjvEhJskizQfld6hvM+0cdQs8gmibrVCfCBuGluOaXgbOnwE0On736?=
 =?us-ascii?Q?aQBzE2VnA4SgNvBCyB4/4QWF+V9BivCTESaA9gnctr2un+qCc2Zptt4zClTI?=
 =?us-ascii?Q?3hlqvh+ic0GH6239sd7D2Zw3PKuAbzsCL8zkPPNnVXC3UHLqp5tLgzuMZcyl?=
 =?us-ascii?Q?qp1ulTLBPA149i9Lizcxn0lP1CTi6uqy6NzhPNgZbHG3SY+UvjowMLX2EU/K?=
 =?us-ascii?Q?GPvsxeOaTnjm3TswyKClgQx83yQWi3ELl2wl03IRAg0i9yVziYYvo7wn9hwa?=
 =?us-ascii?Q?tM8taBbhZThbKp03Zrhx4iF9tW/UNM1TlpNU2wrFr0CqFo/vnKt4MfP3cBYu?=
 =?us-ascii?Q?G6y7CXPLqS30zAHaYh0tpRS18xdCCUcXukZ+ehrzhCty3G4NVzvUepfhFQzK?=
 =?us-ascii?Q?QpnndTaS7vj8efU3zzMxFwxbSBga36mT8uIx/MHC9NCwdjR2joVb29PU1nK4?=
 =?us-ascii?Q?IixZUQo+D9hBHsn0TQALaBVKbc0XyueTrqV5t1LIv3UQHTpT/iqhGUXVEnoC?=
 =?us-ascii?Q?uNTcD5qAUAYhDkXl6+DSUHRRZRrVvXZ+0mcfw1FWyr4SHBMfjRaSLK1JVB1/?=
 =?us-ascii?Q?gnX88Sc3CJnQQzOreJT0WVOIigbauy40wlTm9NrT4wvd4lqwaYCBSytQzKaK?=
 =?us-ascii?Q?08QpR/8rdlUsbXY/Zo2GbbGj9cqWJiAT7slNAxmMOpkojwY07J0J0tmPiZlq?=
 =?us-ascii?Q?9ZMP1U/Gba76p/BtmokSsfbEOMueFEuBe1OGQ5SRPZVE9qBLmAx9PkGfQcXs?=
 =?us-ascii?Q?AJE1lt1NC3zGW/qgECx+X/DkObfF38jlA4c0TiVGuexZCUbxXfsJTsbBXnV6?=
 =?us-ascii?Q?znC3SUqu5Jm0PafphIiy72QlmdoRrpsffKW91ghUh85OpkHdqo7vADY7u41r?=
 =?us-ascii?Q?busj0XP8Co9ARm0qXE+COUl3SexjFkWJ8pB8/vr0jCZHs1Xty/5SfVjZgurt?=
 =?us-ascii?Q?Dr0epAzgj3eOo6o74WiJLyF2DlEMYQ353NdUmP6KO/BXpnSt2FQiO6nNg9Br?=
 =?us-ascii?Q?ZSM5q2vpCiRf3/FhZv4c2oeqLwjh2SviwjTSk0orZvpV5DkikFTkU4r9QLzU?=
 =?us-ascii?Q?tZ604cQ0z6cbfnH1hQRBa9h0W5Jwdv4mQgfPE0BgeoopVa1KJ4wnywbqjHwg?=
 =?us-ascii?Q?7YoB/3QDJXBhD1wX3QTXJNXdSMHKtf5fxeqD/8HQe1A6nfbNjD8FbUXfL39+?=
 =?us-ascii?Q?ZMtXJTEvlBmj56WDV61l8KFmZHWLD3fTULG+xmQ6kCVOIx3erNuTaZOg70z8?=
 =?us-ascii?Q?rFP/uawwXGzslu/5YzmpZNlFZB8pbVgE2hsXNagx3+h6DwwuyEymIiX4VXcj?=
 =?us-ascii?Q?5rt8p+mrBaOWbrT1SwrRG+TCoSAdQfViP74f2Sz3AJ1BkK5jGrh9A3KWPXdm?=
 =?us-ascii?Q?k4z+orpwGsA07NS5iONDdNc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e62e8698-0962-4046-e55a-08d9e61ea42d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 07:35:52.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3hkyXwszGIZeaxutUipu4BhcLye3nPMW4wNVREnW4MyM+EX/1tVSXd1b+I6kAqc+Uh0QMe9owVDCnNCb71oGVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 07:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161182

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Link udev shared with systemd helper to minimize the udev package size
if DISTRO_FEATURES contains systemd.

It is only usefull to link udev static with systemd helper if udev
should be installed without systemd.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v1)

 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core=
/systemd/systemd_249.7.bb
index 739f3aae86..431781e6c7 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam seli=
nux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'link-udev-shared',=
 '', d)} \
     backlight \
     binfmt \
     gshadow \
--=20
2.30.2


