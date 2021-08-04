Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.70])
 by mx.groups.io with SMTP id smtpd.web10.10860.1628091644145948548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 08:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bl6+MpOU;
 spf=pass (domain: kpit.com, ip: 40.107.139.70, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIMmuYnxhWg/Sc7OZcpzONeuw5Mlx8YIlI8r4f/5KI37QRAeqmtdZhvkYbM8RM7vgTJWgtODsJIDCxEUdJ1L7usdRMJsNASPF4LhpGHzvvVxDswK4bH75sHYRSTVYsI9SOKO25qQ94lYsYkqZJ3Sh20F/G1731rEcG+9JoY8XLaIJFg2hsKvSHJVTye2UjUZVHx229qSFei9FMclGFMBtBRVS660FH/Ef3PVcLgIQrnJ8gR2FQsRwuBDsPLDT3OAIskSz4ntggcomPq4dOp3QeWvUGPRJjJsDqgV+mP4mvyQacO86H7itmf+r51HnF0FBqU7ufymP9N1Vv3XlyO91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSpr+WgY+Se6klIQLQe8rh52vJZ6jML1zASK3z5qBJg=;
 b=afYajSjcPzz3qbhaLeYBkLJo+PSN1NqHJQYuSMobUKUnJBjnQC5JEV+GPNY9BONhnwGjPSQpmTq231XQz2KTkdARFrnsMutsrmCqOW2v1ObbE6KvC2/L/mWCyLFT4XybSueB80wgWrP85c9Vf9lrW/CoU6nCrSGRfX2YhrlL8rI8lFp33YSUhKKL/vXs1bKdnTh/KiW1EyejPRr0TQBKQneX+le2i54NWv1SJ2WRMZiiOQSX2vkUgStj2GeHrKRlFDRp7tfMmym7N7lcqSqYSUpj9sdauOli6bqpLYki1MMjcYAIQwmQOQSpdLZA5dUYdPVQLZseT2t9JHBXNI5m9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSpr+WgY+Se6klIQLQe8rh52vJZ6jML1zASK3z5qBJg=;
 b=bl6+MpOUJf8vE1fLys5jK7gbw86FfjO8EeRGvdVbsNguHwBUDcfYulBGYRUu+94kp5jWrto6A1qs8PRmeJJR2dnv/2HoFV5ByyJEr3/IDiKUPnBHsyrNDtVltsK8QG9QoHKdSeFkcobW2ycCWtk+CZ5u98DdNyq00JnuBNVPFqM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PNZPR01MB4368.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 15:40:37 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61af:347e:2f4c:10ca]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61af:347e:2f4c:10ca%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 15:40:37 +0000
From: ranjitsinh.rathod@kpit.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][dunfell][PATCH] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
Date: Wed,  4 Aug 2021 21:09:59 +0530
Message-Id: <20210804153959.15503-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::15) To PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:39::7)
Return-Path: ranjitsinh.rathod@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.85.10.44) by BM1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 15:40:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23b04b6f-be6f-4a17-3307-08d9575e34a2
X-MS-TrafficTypeDiagnostic: PNZPR01MB4368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4368A9557252A799559859A48FF19@PNZPR01MB4368.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0L/zletPGVgPQ2OPucP0YNEanKp0HFwABKNqusF5+UvlmqYL9gydXbaouv+5g/DT1+I1wgEjY6t2I1HqbeaDN7zj1+0lv2TedSjTEJ/CIkSC4GW2X7vVoChm/zpbxIgUWrliEBstzDY0nuxd3R9ILIXfEMBG3GrNvvakVfJGYTygJ/py2RjomRHg6/d9QXr4oRo6iCDQ+ErRZHhp2icZ8OfBctNI2QMSTf6XSfOFVMOrt4/KDTDeXcc+P/ibFiYFs8p5+4bXZx5GPyxDlHZZeAIrEA6rzaXG93ibrxpT9Z9dv2fjkG23RPSOERuJsVCj3jhBMob+aJSYyMXvrDHkUiYcbMb/Wv0SVycvF+JYnymPCnzM1DuMfpkVjeFNFIKWymrpXNHln5pHNllS1r19MDEUj8wwaZbFkm9560o3So2teNaLAnn+4rcXX1cPaWc/UJ75lVk6SAT9fG6mnAmmSTQn82t866HI82d7lSAU5hqfj4vzp/I5vaYiLZJQqOnuof1GBPqiT9q8zX2rl7fSPJGIrkAiFYoJ+TvPs1MtQesGZrJNEA+80f438HuBMj2ORM/rFbB0jTlhibEXlK+HkEnBZMo/Y4HKJK5zIjHPdnAw4Kj4fwd8Mw0+wca38Qk99TjKD4mi55b/O42Ex5DPnqTUVcdwJyhyKaxi6zD8li+ab0IvnFUS4hj5VFsgXpbMiDdZRmhSrRgZItJgjQYc5UWYrsdmKjW41ds9v57Um0ch5NsvpPLDPCppKNTeSsjB24NuaQX2Ui1tLFFazEQXB9L23n+srGhkNFfJl9hfHYY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(8936002)(44832011)(6916009)(6486002)(956004)(8676002)(2906002)(316002)(52116002)(6666004)(86362001)(2616005)(6512007)(478600001)(186003)(66574015)(6506007)(1076003)(66946007)(38100700002)(36756003)(26005)(966005)(38350700002)(66476007)(66556008)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C55/XTo2ONLNNVXxFddlxi/weSM4rXER+kTdM3DMJrNjL1D6oRadKpqinrzI?=
 =?us-ascii?Q?CrQAlPEvpz/B1FRO1jqv6JAXcwMvsIFp79k4uNvdECyn3F9rWh29yc+Bti8p?=
 =?us-ascii?Q?M/RaYRmekgQnnP+NqkUEAs6tTCowcxvH+13Ycsr/jIc6J3xARDM4NqRB5Mgn?=
 =?us-ascii?Q?tvDnp9zEC9f5vT2bpGVDwh1wdAHQrwjR5YHJkBJ6VrAPpDMqkYbgiTYP65XS?=
 =?us-ascii?Q?ps3eR3TY6eGvV+HBcnK6aVjSfFL6vWcLzdzGIhcyEar3U4/GAM4VvjRGcuq9?=
 =?us-ascii?Q?EPTh4C1+BbinwA/by4c+L1WGw+BYRJ0gfe2Nil8ZO/Jnh8S4cX1qs+trRg46?=
 =?us-ascii?Q?+gWQEIPNsvoroJPfUL55Yyfe8l5rvWoqS9BUATjySi29BFELZXx5NWDnkA0f?=
 =?us-ascii?Q?csocilPRNklTYrdN5pLaCBmQ5AxIHRjm5I1u+W1dHH5GaRzbZS2vLoMwiO0V?=
 =?us-ascii?Q?R09IRrB6A2A/3HKIzNPz36qZmjTds95yzck9eaYmKpxgQiw/GxfUkTEqmGSX?=
 =?us-ascii?Q?QZ5BH7tNUlVBEUDNUKhAtlWbAytYhMhvrMdsNfLNxmxPWrIKCiSOsC3Iptby?=
 =?us-ascii?Q?DW/F8LJQas7ObCIoYfpF2sl2i4+qXzghy8q/RVFOqCaAvdc1CABt5OeL1R//?=
 =?us-ascii?Q?C42jcsgw3e+1+k2mZ45RqsWCGglpm7lPW0A7YbYOatCYrjSP/YgVm7dZquA/?=
 =?us-ascii?Q?GAggi8fRQUa4uw56LC8WgdllYKm4UIGDzeYz6XamzW/yhya/xA85TkEU+xP5?=
 =?us-ascii?Q?3FZzUEkO/HXY3RbM7sqJ/y5wwFrTJJD87GDp2jHYaZnplW85+tNPtdsex1Bg?=
 =?us-ascii?Q?/dw7oyHCZ3xLy4pB/Tk3YH69ndVx6KDa9unMi3RUPrtYyAERSBi0+CXp9YgT?=
 =?us-ascii?Q?Oh1BvxY4XFlUmfOTUjEz5SyqIeVsZG1kNswN5xxb2svkI/oIKTK5D0Xax+I2?=
 =?us-ascii?Q?Wt0b3iST9wUpO7aqD4ZH6BKENHUAt65TDOcOlGQ/+1B3/yOlQ+jU8Ly9R4GH?=
 =?us-ascii?Q?QgOd4pwe1dFVIzVU+uCoxEJ+4sEW8ZO+AlDgR9iIC5quj9/jBy++NKv5Se2u?=
 =?us-ascii?Q?Q0zVtW6SLsShcJkUf4t/0UEMOxXdqdx/RNgVfkDZPphR+hjXycPDATrGh0lM?=
 =?us-ascii?Q?nuKcl1hG1orVbVuKhpkc0zib0QvB7U2s2wyf9Pl7cCS2GuQvicLHaP3JC71e?=
 =?us-ascii?Q?yRy+8MF2f/AqFRGQJc6w8+vu8ASaC5IUq+P8O+PV9SZZonzGl6btyGfPldUX?=
 =?us-ascii?Q?HQMWqJ42m51Zsb29p1RTiDcbfZqeSurHRFUlK525dq1c7pOJX5F7vD+CCO37?=
 =?us-ascii?Q?lb+XVt605c/KyD9dPnLBZM0d?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b04b6f-be6f-4a17-3307-08d9575e34a2
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 15:40:37.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3EjOpTb7MC8edILF0WZYsToS6hxfZmbun/AByxhBTrcjmqq2H05tTavsVvSDdir8UeBM5DPWp/Rcgrgq/evOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4368
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added fix for below CVEs
1. CVE-2020-13529
2. CVE-2021-33910
Link: http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3ubu=
ntu10.50.debian.tar.xz

Upstream-Status: Pending

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../systemd/systemd/CVE-2020-13529.patch      | 37 +++++++++++
 .../systemd/systemd/CVE-2021-33910.patch      | 62 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch b/meta/=
recipes-core/systemd/systemd/CVE-2020-13529.patch
new file mode 100644
index 0000000000..80ae2bd883
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
@@ -0,0 +1,37 @@
+From 38e980a6a5a3442c2f48b1f827284388096d8ca5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 01:22:07 +0900
+Subject: [PATCH] sd-dhcp-client: tentatively ignore FORCERENEW command
+
+This makes DHCP client ignore FORCERENEW requests, as unauthenticated
+FORCERENEW requests causes a security issue (TALOS-2020-1142, CVE-2020-135=
29).
+
+Let's re-enable this after RFC3118 (Authentication for DHCP Messages)
+and/or RFC6704 (Forcerenew Nonce Authentication) are implemented.
+
+Fixes #16774.
+---
+ src/libsystemd-network/sd-dhcp-client.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1305,9 +1305,17 @@ static int client_handle_forcerenew(sd_d
+         if (r !=3D DHCP_FORCERENEW)
+                 return -ENOMSG;
+
++#if 0
+         log_dhcp_client(client, "FORCERENEW");
+
+         return 0;
++#else
++        /* FIXME: Ignore FORCERENEW requests until we implement RFC3118 (=
Authentication for DHCP
++         * Messages) and/or RFC6704 (Forcerenew Nonce Authentication), as=
 unauthenticated FORCERENEW
++         * requests causes a security issue (TALOS-2020-1142, CVE-2020-13=
529). */
++        log_dhcp_client(client, "Received FORCERENEW, ignoring.");
++        return -ENOMSG;
++#endif
+ }
+
+ static int client_handle_ack(sd_dhcp_client *client, DHCPMessage *ack, si=
ze_t len) {
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch b/meta/=
recipes-core/systemd/systemd/CVE-2021-33910.patch
new file mode 100644
index 0000000000..9932962749
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
@@ -0,0 +1,62 @@
+Backport of:
+
+From 441e0115646d54f080e5c3bb0ba477c892861ab9 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@in=
.waw.pl>
+Date: Wed, 23 Jun 2021 11:46:41 +0200
+Subject: [PATCH 1/2] basic/unit-name: do not use strdupa() on a path
+
+The path may have unbounded length, for example through a fuse mount.
+
+CVE-2021-33910: attacked controlled alloca() leads to crash in systemd and
+ultimately a kernel panic. Systemd parses the content of /proc/self/mounti=
nfo
+and each mountpoint is passed to mount_setup_unit(), which calls
+unit_name_path_escape() underneath. A local attacker who is able to mount =
a
+filesystem with a very long path can crash systemd and the whole system.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=3D1970887
+
+The resulting string length is bounded by UNIT_NAME_MAX, which is 256. But=
 we
+can't easily check the length after simplification before doing the
+simplification, which in turns uses a copy of the string we can write to.
+So we can't reject paths that are too long before doing the duplication.
+Hence the most obvious solution is to switch back to strdup(), as before
+7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
+---
+ src/basic/unit-name.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+--- a/src/basic/unit-name.c
++++ b/src/basic/unit-name.c
+@@ -370,12 +370,13 @@ int unit_name_unescape(const char *f, ch
+ }
+
+ int unit_name_path_escape(const char *f, char **ret) {
+-        char *p, *s;
++        _cleanup_free_ char *p =3D NULL;
++        char *s;
+
+         assert(f);
+         assert(ret);
+
+-        p =3D strdupa(f);
++        p =3D strdup(f);
+         if (!p)
+                 return -ENOMEM;
+
+@@ -387,13 +388,9 @@ int unit_name_path_escape(const char *f,
+                 if (!path_is_normalized(p))
+                         return -EINVAL;
+
+-                /* Truncate trailing slashes */
++                /* Truncate trailing slashes and skip leading slashes */
+                 delete_trailing_chars(p, "/");
+-
+-                /* Truncate leading slashes */
+-                p =3D skip_leading_chars(p, "/");
+-
+-                s =3D unit_name_escape(p);
++                s =3D unit_name_escape(skip_leading_chars(p, "/"));
+         }
+         if (!s)
+                 return -ENOMEM;
+
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core=
/systemd/systemd_244.5.bb
index 8c95648ca0..7a7eddcd45 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -20,6 +20,8 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
+           file://CVE-2021-33910.patch \
+           file://CVE-2020-13529.patch \
            "

 # patches needed by musl
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
