Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.71])
 by mx.groups.io with SMTP id smtpd.web08.5316.1628142873128505699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 22:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=uhJ8rCsT;
 spf=pass (domain: kpit.com, ip: 40.107.138.71, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmu5i66xRuWdst83cASs07WMXyODujBz5C3RfOMzvf2JSLMVhvaELZ7fVvznf02USHnUnl1jwYyWL/U+GbT5xdRRCjT14gftLDsfcjAATpYbjEHleT3qe2M857L3UEjiONW0tGRQLPusDX7uTSthQGR3FEXx6dnZbQYOVz2zSzRCwDE/+eItsR+SvpgBY/U84GEzfxs94fMz88Ml9r9sNjSWfufU386YX03y0mpPY4KDdhEqVIw2GFRJGbUtN/oc8Us1NpHpnztzKHUoQteR4cGsRKh5P0Tl4Q6ks4bmDLGOlyWKyjHkePuc4X8Ch6e5KBBiHSCMsOpndaHAPYfeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwCofC/ZPzqEByOomxDST3lNfgnmyrJ4cWOYl7cD1Cs=;
 b=iYVgmXcVySfQK3EX4V4QOJMh51XAqNAKxwee9k0KsM9AH6hsdbnLy7/MClh4GktVdYAyvVW3N+H9p0L+Da0mIr2BJzutCjW8kQ7a7bl/QpJ2aZAGjwTe6gFYtGXeHCIln3ALw2yC+krWy/Dh0ttpFyIW2nGyBJd8aOOJiE0fXxT59NkO9/lLXAzRtyv4RlJ/0DDqP9MPwNgYISKZY2wH9MgoqVfqZVLVkb1a6O5VnE/MC6SAgcs39XZLX2gwScF1UhrFHG1lxbvc3X7mZ99aVzfOvGG7EBd83SVeDqcFcEOsTs/3kfwIJFUg0nyA7vG6ab7173RRXHcg9EEkN4Rs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwCofC/ZPzqEByOomxDST3lNfgnmyrJ4cWOYl7cD1Cs=;
 b=uhJ8rCsTRCx8F9DOqiihrezdML3EaY0Zm8Lb7v+8zHgixD9XHRK1mnn1NAHT3rHCdZsXvZQgR7VsH7hmt7jxxkJXKXuRgkybZ6o2scpulgaLpW1leonXex5iZX/U0pjE/seLPOtccmsVDuTdCpy6dC5tXzN6V6qlr0/Gw4PWbJU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PNZPR01MB5199.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 05:54:27 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61af:347e:2f4c:10ca]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61af:347e:2f4c:10ca%3]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 05:54:27 +0000
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][dunfell][PATCH v2] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
Date: Thu,  5 Aug 2021 11:24:00 +0530
Message-Id: <20210805055400.12437-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::26)
 To PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
Return-Path: ranjitsinh.rathod@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.85.10.44) by BM1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 05:54:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc0715f-b600-4f21-023f-08d957d57be8
X-MS-TrafficTypeDiagnostic: PNZPR01MB5199:
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB5199357B95AA420B9F8515D08FF29@PNZPR01MB5199.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/r+hBDcbOnkTDO31trQ6zle4Lqt+gP2oeFvSTlIBIyqwo6ymv2QqEvk3zgW7YOIUVUtOY5KHLeyMdfH0mY+5VZ0w2vH5T5wUH/ejbq8Val++HE/ObbMqciLFBQj71Qj95zBw1APYfxbOppPR+rEh2i8BKpdWikgTSLlWhIcfMsvyVbdEPcGv8APm8tAH5HzX1Tr5weVvuem22mA6VuhLuvQUN5ppp+OrCOIJPCiLsRT7vBzrQ9u+7qUroE45VehKUhFYz7OdI7E7V7RQdl++lS47ySg36EukyEL3CIaoR0NN0uP5RiqH2fgCI56Z2NKBxe6bCeL1JG8DfSLCXibGpdsrn3AbFGE4C+C44gvIOnMFqLMFiZblls25OeZhGg+RVNaFYNq0kFgUnvWKUIU5wwZOw8KAYgY6IGTZxF91Oex4bbaN6qECSQUaqeIiPOAA1UtVJxGJogbnXweam/wnhnqv7fV5AH0czdFo5TFYzVjAcC4gu2nOsfn8CI1mwqj+5zB0DDQaVPYvSmJwN+/UpTt3pHCG1sMQekRMSVHqvEjVRQ3+3b6615G1wmc5CJJLzTVaA2FksI9GppIQl41N0inGqlAl80M0ohaDtCog5y210j44Qbmy6yVqnqDlngFtCvrpZLg0QsOX1P/oxnGIeu68+rvU+fQg664BtlCSl+iBsyO1yuMDtlZj/qvm/IkLw/KR0t5Quq0dqR+o5vEU3b5GOTQQTwuOqTEr9QYF6i+j8frajFD/X2Q9Pi7N9FqRICzcAeXdzh6W8JNANH0wCMswBxeOVffp3UJOYu8CoY08+tx2QrSjhb0tyqV69sVQ3vureVig77o2cuMNDwj99Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(83380400001)(66556008)(6506007)(1076003)(6916009)(956004)(26005)(6512007)(44832011)(6486002)(2616005)(66476007)(66946007)(86362001)(38100700002)(5660300002)(38350700002)(8676002)(8936002)(52116002)(66574015)(316002)(36756003)(508600001)(966005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nYfUFEecsshYj+5WhPqRgxJ9pNnAXxAlauZnQrhq6HP+79DbaLgVPOyrcu0T?=
 =?us-ascii?Q?smCZ+dnDS5REgjiEvD11IjrWshyLPV1QgomNxdMuFKKpAjc6n/Kmq0GWkocM?=
 =?us-ascii?Q?hJgnThPypmg4BiqVjHExbEgW3nM8rbd3NnumQ+pRUzpt8BQUKTE0rtNOInOe?=
 =?us-ascii?Q?LB1BPUujSb/dNj86cb3KO1DaCT6b5Hw7EM+jB52x5dhdjFbaLFI+l/F4xVp2?=
 =?us-ascii?Q?0iPdA+arnLpkDMejJsssaE8u6shLeE+dSuAD9LK5F70m293oGTC2d2K7FeeX?=
 =?us-ascii?Q?1I2Vhd2T2O/f3ALeC8dBoqCKkgzj7hlozoWBQ558TGilN+b0AunC4umKQpOk?=
 =?us-ascii?Q?7203jr696LV2K3FmYeIs3v+R/u9HnkXbBTAXMevaxbRFGy2j0vwekFjWII3M?=
 =?us-ascii?Q?V0pd+FIuZlHurXDiLbT6CO7Zz+Y1H0kCNWFbplpVuAQAf/MHy/4Iv4ksvN85?=
 =?us-ascii?Q?/DlpowPHhNU0iRf79pGOKMNdX81sGE4d6lnTA5aTwVQvszwnN7409F8rp7y4?=
 =?us-ascii?Q?skAscBeZlSNkRJGQcj1IWYJ4FlWEjGxYcLbFo1OVDtw2JGGSmLqz0l3mum0A?=
 =?us-ascii?Q?gQcASUCSEzLXhe0hqbA8Ft9wNWJk4sYc88fus2tUfu8cwhgJ49pjx8WXJB+e?=
 =?us-ascii?Q?B7RNKOEaryWVZT9BhNU6UIKCRf4msSgaIDYCAYQBoJVv1bAsRwGQdW11OfEc?=
 =?us-ascii?Q?JuNNHx/w3+OJmQpgbSPRaOIijzSjYFYKH6t0gjW18qMbOsXEJ8ulpqwZ1XI2?=
 =?us-ascii?Q?NQD8lVHjKkkf2ioDEPyGAW2TSdqyPtcKyiqXmZgG+Bz16zc+v10+0itMEfff?=
 =?us-ascii?Q?0Hvl2DnyuvspoISfGmj2o2F/chD4A7+ba7V81O6ppJQNHNunXYAGGNyMoVmf?=
 =?us-ascii?Q?o0U15lyfd6p51umeKy2WzCzhkTU/m5tXafyTZlxY9XuC0ssJspgX6F+E0HN4?=
 =?us-ascii?Q?P4FNQIgsVVcvyu7VsAaIm4Y/4i1zcp/jz2Kx68SB+w8MqYC6aiJlhSYcTHZ2?=
 =?us-ascii?Q?PLZBR1poMDZJ7UsQAUjFraVsbwWRjOmib4N1JoGdXLwCvB8ohY3AHxZSbaUa?=
 =?us-ascii?Q?tpkhX8FKifgoxQkXRh9j2zXK1Xkw/deJIVV5Q7PzJ+lqbbOBDofacrfjU6R4?=
 =?us-ascii?Q?IdeLpXlaX+d5eRvOFHlj36CG6J2XUVX35vS26pOumCJwSQ1QnKDcrMmVj0L8?=
 =?us-ascii?Q?M39Qa78RYGZgN9VuLzh4ka2tJ7ZQc19XqibAQGTFvSX6i7OquRzvLkjv2TWm?=
 =?us-ascii?Q?S/P0qf/AcY/JaVkaB4f3V5njNY/PWJBxJjuY+HNJiLx1wCyXFULwlbc/NDMm?=
 =?us-ascii?Q?cH1yPA50XD/VofgRInNA4mS2?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc0715f-b600-4f21-023f-08d957d57be8
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 05:54:27.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZm4BGZPh6PeJcKRuzbG03PtwpNzUzhsZFIEPcy0u732SPaWZe+JkauABzYLsV+fAEMmDrFFah+r39DcjWx4pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB5199
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added fix for below CVEs from below Link
http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3ubuntu10.=
50.debian.tar.xz

1. CVE-2020-13529
Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e980=
a6a5a3442c2f48b1f827284388096d8ca5]

2. CVE-2021-33910
Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256/co=
mmits/441e0115646d54f080e5c3bb0ba477c892861ab9]

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../systemd/systemd/CVE-2020-13529.patch      | 42 ++++++++++++
 .../systemd/systemd/CVE-2021-33910.patch      | 67 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch b/meta/=
recipes-core/systemd/systemd/CVE-2020-13529.patch
new file mode 100644
index 0000000000..4c013e2532
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
@@ -0,0 +1,42 @@
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
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e98=
0a6a5a3442c2f48b1f827284388096d8ca5]
+CVE: CVE-2020-13529
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
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
index 0000000000..be042165a0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
@@ -0,0 +1,67 @@
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
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256/c=
ommits/441e0115646d54f080e5c3bb0ba477c892861ab9]
+CVE: CVE-2021-33910
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
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
