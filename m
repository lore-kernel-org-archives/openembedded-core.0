Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.83])
 by mx.groups.io with SMTP id smtpd.web09.6505.1628344616315478029
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 06:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=s6Ha2V83;
 spf=pass (domain: kpit.com, ip: 40.107.138.83, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIViKYd6zNseeT6Z2XQhkkoujVZ1xTdFq7iga/LgRqssShmFZynK26J/LWZT5J8RNLWhiQBqYpOW907Dr5ITlzX+Za4Xxt7Y9g6SCQt8uUcP6sPWiLCogFasijpte5VLMJY0PvwkOq0/eXCR1Y35Sr8LoFuBMkbi1xCXEP6xnX7d3nE7Pk8IBCXQX/OQXACeXvKMMUp4O/W/1INyG7lRzGtzob4d1UBT6a7joHhDKDUZQcMMlg+5GOFBtrk/Z9WOdoI9nSOJ5BjQzi0tJppEZkZ3tQtFBISUycQ6lNau+yZuI3ClCCIREwfWCmSq12DVCSbf/TLCGX/vvlsxBKCxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF+qw/NhGJw8J+r/3mcS+cGH5fv5qSbRMWpysfT+PLc=;
 b=Pqg6faIrkh/0UbcpSOHGZ1nj9FycrOThuXIj1R9PW4IXssWW+otMZFDopIYMso/z6gd38FkyPIep2x4ejeacRGlQpH7VSqEq1QF3ng0oNxkd4d/N5qZ+4YpxswSfdUHW4Ehi0waHLgnrC+qbS1GCyjJ88921lV1nSfijBgxmAzpDb10/xCdanqAOMpaIFZ5jGh6xGReU0OrF9X7fVIL2FCLz4/oUXBT/QWIs7zz6Ld8LlRNmqZNhkhtK5xOUwI/NJ+jFOVhDXALLzIOxTHnW0LN+GFwptDklw5elvUBX0euE1JVDz2y7Bqy0G7jIXTvibakC1bOrgpKvVNN8y6EEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF+qw/NhGJw8J+r/3mcS+cGH5fv5qSbRMWpysfT+PLc=;
 b=s6Ha2V83M+egqes+ytCuKcsXPceEnhto+C7AIzeCGA5XSfcyejbgRwhngQKC3DRQkkX0RvTFQ9nJvFymPTlNFPlPGXQpYmXO0ISlozkUgj5I8y7MO8kPR6J3ErtArAEzEeCu8HX8FQ52o3B8C4JVpqNdgUCt1mShnv96LoI9wds=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PN2PR01MB4924.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Sat, 7 Aug
 2021 13:56:47 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809%5]) with mapi id 15.20.4394.021; Sat, 7 Aug 2021
 13:56:46 +0000
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][dunfell][PATCH v3] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
Date: Sat,  7 Aug 2021 19:26:29 +0530
Message-Id: <20210807135629.21212-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN2PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::31) To PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:39::7)
Return-Path: ranjitsinh.rathod@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.85.10.44) by PN2PR01CA0176.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Sat, 7 Aug 2021 13:56:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291fc568-45bd-4cf0-0e20-08d959ab31f4
X-MS-TrafficTypeDiagnostic: PN2PR01MB4924:
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4924BAA24B4340CA9339686E8FF49@PN2PR01MB4924.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yNFKYTXed3Db6nBKgs1n4KtelqAHWyaHWsshCWSVoslyPg+hoeXGke5Dh3IOuOgrV7tjiS3W9VTEV/CMzcoOYFfKdU7+ZdKjkwn6b5/nqkRjwSeAOx2J+Mz69wJ5XBSuhZpCq86gy2qbK+pwTf2j1Svn6S46/HSeqF46hLiRl59St1iaCCqTsNJjnOWjTPDQS3DgkvazQeaZL2geDk+hWVfX2eGv658UtGB24jVzAOJxhA4EsOeJjUsbZBSozm8RfZ8lTAKJ5zEP+ZXU7w35J0cVCf8icJsEI3kSDjSjgspv/kGbfg4CSupM6nckdakZBlMkKa1DqDCNl0acvq/kZnYp5/i0FD1bqQK6LUFEKkQYOnOFn1UCwUgTcedfKnW027AGopEJZYceKexGmq40Fxr5EvvIngiAosJpVTy2o1Yo07m/YaeH51izO+owi5zBQGtgoJI1b640zyHqeZsmpuPtiqhNsHay4/BapZPfbgyOHUz8TnzrLmEgMUv1PPDWZ///CpLxQt6Wwd5/qVUBfUor6NQLFAu0wLTeNGQ/FFyB+xnnSeDvzN1hm/LBLa/o2KAmEwco6KeMTmirh6pMx8ct5vT+BAYCxszBumjfqeXqORde25kqzw/3lxqE+ZXTuZr4HfhQYI1MyiRDWITjsCKAnsdVsNL5mwK/uwILCozBtg6LfIf62RXqVgQzmb1a6jUYu/3gksH0HMYjkevdqzFN5Pf7utGkT2/tFj2GMtZ8ktfS8gaFuZE7btrU/bUuiOHZkv9JcyVzR/Njd/fh6CEihl+ZH0F4em/wuAhAGWbEb3sV5hpFV+gE8UciaOsS+mU6840JyHqISwK+dgmvSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(956004)(6666004)(5660300002)(6512007)(6916009)(2906002)(966005)(66574015)(316002)(66946007)(478600001)(36756003)(8936002)(44832011)(6506007)(2616005)(1076003)(6486002)(86362001)(26005)(66556008)(38350700002)(83380400001)(38100700002)(66476007)(52116002)(186003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QQkZX2qtnLv14lpyTjSOevZDqmkQphbePCl0LDVWRDiV+STI09VJP1Cef8cZ?=
 =?us-ascii?Q?iWUhiyfoUO55WfLfjRbLfktXI5Ab9B64ey3xITGjUJmixzDvFKs2PeFPJqYq?=
 =?us-ascii?Q?ixxSWcT16I5FYH7xsvSVwy5oawS3KCXVp6Ns0m5dDqz/Cpor3u/qtQvjYMqR?=
 =?us-ascii?Q?TJLmDZHXpzGubPEwy2pqgdjlJk4y/KbKX6x6F4SSDvIIl8wh0uU9uD1KGiC+?=
 =?us-ascii?Q?CceXTEbOzq0EC9kcHpTXJPvpafS+lCjsABVBBp/Pri8JR+hAidGZwMl6e6a1?=
 =?us-ascii?Q?+BFA4iCaVw1r6BnsG1KWm3aQCIRdlqaNBI58ezk+ZnBsAc7h8wdTDvMt6cMq?=
 =?us-ascii?Q?z98QP1g9/A5WI775GCCeBfBwPQ4E/A/ga4q2jtH97wHpSb+k1aBYGwzBumeU?=
 =?us-ascii?Q?lUjX+juy2uNbkHWUycR6dc90jUFxoWgpjbmWxY2ROUl3xQXjR+dhoK6Y259w?=
 =?us-ascii?Q?6QGOjXW8qKu8iwDqdahS9ePUd1yT3GIBIUhW5FtJEKyzbQHjBf24TOsaTX+u?=
 =?us-ascii?Q?2N+FF/pg/nPdgTbDZ26fplDl4w8kuE3xlN+UQPdgifW+05V0WYQtxzGiWW03?=
 =?us-ascii?Q?IWMJnK46qZLHPTMasO3XPnjJCCquPBiU5vYJ6+rMcmDC7svHyAf2qMRdX2tl?=
 =?us-ascii?Q?e+y0tkd3Fu0OhZU0p8nTK83o4jPVAKDiR+Hyn7QoKdgUKmfVfIg1eNUZwcXV?=
 =?us-ascii?Q?ZLYAeCrgEEZTAN+zFIu4GAGLXfWKtkzOl3mJveAdLYB6Veh/1tHhQStrX5ew?=
 =?us-ascii?Q?8ymslFxqy3hN6lcJz/srDVWcYQjnh13BCV2SI0J/sA/kExYYEmlP6k9NSjje?=
 =?us-ascii?Q?i0o75hZlFMQafqKdDgeHFIVVCVtnc0exOgqz2OpZOM/kl5a3vKhznusF2ARa?=
 =?us-ascii?Q?EKpNiHon6T0ZshnGIYaUVQJPx2iRLK+dUDDsjPdQ5BTuvcATk/rHhSo+GRDX?=
 =?us-ascii?Q?U1vOIM3zGH5Ck/LhxfKHOahqotHYv/Ue15fxLBOnY4QmRRQWZ6zXRTetyX4Q?=
 =?us-ascii?Q?RWHU0oeVMmsNKFMLPqVkY+cAdzvCHyXeP+kUHC2RFYllZE20hd9gywKvsiaU?=
 =?us-ascii?Q?MxBqvCb9j9lFGI/UDOoUTStXncha3O/p4WGDs1bJAW/74JxzlljQLsb2jTXM?=
 =?us-ascii?Q?CDlQwH4ncPXUE+9Cid0Ln6cN4b9oc4DOLDC0qqCoi/3aQNYw77FQ1D/MYMnU?=
 =?us-ascii?Q?3+K3Wl3Vb7TcCHeHGERJYcbLbwmCM3mLuN+D2FMntjjvkHda8XFrCxe5+Vof?=
 =?us-ascii?Q?t0g8dH1YhOXzd0j2gvIJCTZF+FUk9WkhcmRfyYVDLEx7W1n8h+20h5QRFGJn?=
 =?us-ascii?Q?Kq9lEsplzzbF4SQqxyJ7ej9g?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291fc568-45bd-4cf0-0e20-08d959ab31f4
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2021 13:56:46.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hyj1/kaX2/dG72e4FInqLLWAfgpJE27IkbIcX8FXXp/vF9X2RXsWIQQEHIxvZO3bUAo/f2OaWHq0BBT2R3VWSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4924
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added fix for below CVEs from below Link
http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3ubuntu10.=
50.debian.tar.xz

1. CVE-2020-13529
Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e980=
a6a5a3442c2f48b1f827284388096d8ca5]
Hunk #1 refreshed to resolve patch-fuzz

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
index 0000000000..5523e940fe
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
+
+---
+ src/libsystemd-network/sd-dhcp-client.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1392,9 +1392,17 @@ static int client_handle_forcerenew(sd_dhcp_client =
*client, DHCPMessage *force,
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
+ static bool lease_equal(const sd_dhcp_lease *a, const sd_dhcp_lease *b) {
diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch b/meta/=
recipes-core/systemd/systemd/CVE-2021-33910.patch
new file mode 100644
index 0000000000..c97408de82
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
+
+---
+ src/basic/unit-name.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+--- a/src/basic/unit-name.c
++++ b/src/basic/unit-name.c
+@@ -369,12 +369,13 @@ int unit_name_unescape(const char *f, char **ret) {
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
+@@ -386,13 +387,9 @@ int unit_name_path_escape(const char *f, char **ret) =
{
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
