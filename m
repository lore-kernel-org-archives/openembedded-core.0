Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C8EC047D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:26:47 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13788.1772526439852661788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 00:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Pc3eXY5d;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.30, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwNntiL4NSyhWQo7WtGGhwIjG9boFQjMF6cFj3tkVKx83qjayGxBoQOIoS++eY44uga8A9xafNq4/5rUDq2iuZ7Gmi9ejfRsW5+spG/+RzRStNkRjRyASiLTyPPTPJIbkLCccObtxCtAyZrYykhSL8L9iiiWYocmxf/OsmThPhQU7/Hm1O0s7iZ+atYV1uM9r2oUT2CMHZtp1sHPhAYznt+jw1lhbQMrQm1w18MeoMHVEmLnZH2LmxuiujS2OhkhAhta0/jhZp5lQXjGNAYxdeIGbaL++rFCE5O3/tev2fyn6DN5fw3Wd+8GnW8+dw4+gxp+EvqQnnYaUH44tXSS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DSH/kPLWhxZG5dv9Z7xfYTEJ/6qcBOTSBfORioPdR0=;
 b=nJHNQeGeSlupbRMUM9bBvGR1+iVErBC4AZzLywdUzLaU/cS3IjvmGg7qh4Fr6mI7u3q+yarDpnlcWbeoxw1UwQUT1kYjJUdWkwr81akdusurvbJ61/3/gtSSsF+owissskiFDnolb1m+FxqShQB9N4LqmK6tLsCdNqIvMWjdJcN1BFkoRDjFyamiM+2hTIbnjxGWA4L9NKxjlwRJdYMzTspEGKUO6mIagHBpYjhfjmtwRYLVvqw52GGulbkCxh/uVIe9NpNO9EePhXblxGRUuFLtNsc6RLLIEn2opukivvSJBK4duUq2jryUJYJiF7+EPb2A/WgBPpG/fbdksIx21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DSH/kPLWhxZG5dv9Z7xfYTEJ/6qcBOTSBfORioPdR0=;
 b=Pc3eXY5d34HX0oN7gOlzyWvAqISeBtBXi7CbSm30Pk1LTDhXKJg4YeXHSW16g9mQVt2fOm2IcugtggoktFWY2gAchr5wiNBdsVgu01mE2qT8lUNUlmdk2rD5B+Yz9Rd2xkyevNeAfwJSrFDNFPbrUUhJZxbiAmrDxQ1oXncQN/PDFrET66jWzS0vyzrjDwsDp/0PPVw13oYLRVYopmSifak/RE00dhI68fNDne3cJCCf6sY9Jqd9h1+wmk7JUH2VyANNkSm5masD3HnpLfAZe5wa9as500tx9WfD40XQdxp9LDi7qG26YRliGFqpIbP2BxGK7F76mQIHnla9hzf8yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by MA5P287MB5395.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.16; Tue, 3 Mar
 2026 08:13:05 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9678.016; Tue, 3 Mar 2026
 08:13:04 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [PATCH] shared/fdset: add detailed debug logging to fdset_new_fill()
Date: Tue,  3 Mar 2026 13:42:44 +0530
Message-ID: <20260303081244.3330595-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|MA5P287MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: b45a9ac0-f8e2-49e0-8d3f-08de78fcb1fe
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OaxpkEr3rqRpwdvtKbZfBIA4UG19C7OVPWGrPvpOweKiQ7y/AoU3Sh1dvvTXDn7Gs7rjSVhYnzKF0x9Fm6qZ3V/MLfYc7eQ6Xev4O8bcI6Ul8ka7ZiY7ydWF74KL3NXnECdg3zENSTtbDv91C+FHRYy1DnbiPtO7Ixl3jRlg4PgudK7tWZhud0aaEFYOEhPhtMZ27cUajq4RJ4OaSLsSV5sEW4MoqFNVoSx2uEF3wX1lrBULN5Dy1B6qXAPGXoGwOCgGvso/Q/IwII95kCFvfXBZTppF7Qg6V1wFjg0BVdF+mZGaZexGYoBAXuUoOQswS+6DT8KZGbAVi4Sc0/6FHZs1DoIR1S5/n6rodWCEKShWva4Bn4huPluFI7gWBVFmHSo+1B1aL9lK9u367mi2AJJy1ZbAZwlfkxg3bq78Ted0jlK02jY47L0PigQ97dEfpb27P1PyF89qwaPxv8U0D9uReyaTILYl+7jfWpqlJXrrYNp/bfQW/kV1e8WM4vBx2Y7JFKuM+kVbW/jyOTbwKTL44/0QPsmEqQMc6N7QD21HeFmQ5pdWDpFYHOIJn+6fabRnP/q4UXyTW4m3RtMKeMXyBhPyRgSqrticMLtcm+ZE/6cbTuojlcE1R0iD83UAsBvvFHjLWEvSZJ1tGgszaKramY14l4xD2HaOH7N0i5291CM3+B+HP+OJWFitNOaL2KgQfBHiC9d9LqMyJxa2K8M/Wf3ZBX8X+PrAcvpssZiLuNU1pH9MOcgD9IRH9+/6qxe8gWkZ6J91FcjET2o2QauDVhXnKEQu6cXNKgQnrHg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pRwJ8ic9hfTBJmWfIkQoBflfSYkSahMbI9vVrxMknx4CUOZcRaAxzfjd3TXO?=
 =?us-ascii?Q?dzbVUcfaflslJAXJce54+14GLVNJy4YSGmaWh2bnWgyhdee1BApI9Qx31f4A?=
 =?us-ascii?Q?tNSSBAWpxlE8/3lyJ5g0JnADeJBA86Bxzg7GcxSzCaZiyYEZ+XNZyy7uGYfN?=
 =?us-ascii?Q?WAuP+VD5wBUEKDVNUZSYpYDMT+l2dUBqKKj1IYJnVTJpfJwOElXTpgyw0pfy?=
 =?us-ascii?Q?uZiMHo+x5a8Sxsn/gl/bxda3n3uMimgB1s+3diY5DNr3Pkw3tS+VlLZ8ROuE?=
 =?us-ascii?Q?iaHlzFoGuPlxyZTGlC2XaeR7moXG/Pr/MTbZbikC47lHEK1w8aRxpJsIeGtF?=
 =?us-ascii?Q?Y3vh1Dlraj9QvC6MIvYM5umRf5cotuVCDbuiGuXeoUXTdWXSZw/iO2V6YGgL?=
 =?us-ascii?Q?taJvSHimIiw8yUOe7aqm9UcRU+H0Hlp2M5FC3YRTWesk10MP1ViM9JBN5/ev?=
 =?us-ascii?Q?u5v2pACg34Vb4kWOOMw4DOvqU0YT/+eBK3AhOnFN5I/uKtNM3DTwQAKUgeiU?=
 =?us-ascii?Q?dgCab9L04X3yvisXBDh5Pf1hPNGzvPk3pB6FOjaSIqOJpLGn9hLU3As5t6cB?=
 =?us-ascii?Q?fZxkJ79k5v/qlp9W1DgHXnHKY4J//5mGaNGBmF24A/ylCOC+CPPO2+y9sVOp?=
 =?us-ascii?Q?BW33EQ4ksyXeNY24mN/mTAKG2h+ORn1k+h862VNznLcZ9BXJgIt3g0X7WEpE?=
 =?us-ascii?Q?QgxqbNGe0kLj5Pp/OhIKEwIp33K01vbfnMXCjhWsftvCxCAeMCLMI3z5X7Aq?=
 =?us-ascii?Q?+XvQ/opFUADsvZF/9s0wi2aePgmnwxLjh77rzyOIyA91jk3Qf1j+nPwXGi08?=
 =?us-ascii?Q?/s/XNPFzvie1UPa/3zkPYXmZsGE1d8DGCddBKmp6x2TJm02T2GZZ90/vYu8h?=
 =?us-ascii?Q?/kRDkkxpeH9wiYxUzCS7404HHwBjJwzLTJBFWjX6CWfOnQHQ+6HAIbuJra4U?=
 =?us-ascii?Q?TilyOPnsvpjbJ8i3bGiCJxxxVXTfEDPZjWtX3OaXhR++aXKQhUYwtNXige/4?=
 =?us-ascii?Q?2jvEYL5uM9wBHHKr3LAANu5GFX9+4WfdfRbFa0c8NWsFe1vFH8TqzLHY7IIn?=
 =?us-ascii?Q?Pq6O3gnOwQ1AseqlQsRoVpciMqvKC9+0OxipeLCQCF3Wt7jlJo+gCKEsScZF?=
 =?us-ascii?Q?aEBDsBuhnsmPLDA/5OMK1uZq0FfYoxc9V66Db2mHVuTGT64xmYn9E4iCnaHl?=
 =?us-ascii?Q?eDxpVdIsHpJEQqIjhPh+jGGmwT6y9BSS9hh2hH4r9ullgwBQg1vXFSJafJVe?=
 =?us-ascii?Q?x2BxudHBRWVjuiRG//+8YdhKDIKXpkRy99g4O16lmZt1kSfOZzntcw68JSNH?=
 =?us-ascii?Q?slW4jYuympe9yJNblafAQH8ygeeBaMfo4EazzWabY+ZQiAvul6a9h/lsxWGP?=
 =?us-ascii?Q?hQjbgB1F9u3ACYDzkJNy2LyFU5eA4fuvgp4k/fONVbOO5RabzXhClGD9yuQZ?=
 =?us-ascii?Q?X5kcHjMp/DVCcKiVV3BkLpiiUzdVSMoxCife525PdDCJHb+Uq9d1v/NUg1B4?=
 =?us-ascii?Q?YldhECzAVx6Jr0iKMsdqEZX0lOajraGkGik6qq1UOYNINZgZ0nGEDU/KbU7R?=
 =?us-ascii?Q?nYfH/6ttuvNsqzGZdQPPwuMeTg8CIuNderIAE6sqg+NBYDTwlfMt18lMAftD?=
 =?us-ascii?Q?JxN0ABUlbKPgVUuUEuYkbWTd6aaRfCyHPIKQelqISkaK9tiKDZJtS/gUc4Mx?=
 =?us-ascii?Q?UbfET48uuSq8WhnqSqfwqcR4trxW3R1Ye1qJ9Uke6PQV3a/toNraGFzf3Uik?=
 =?us-ascii?Q?/AwEPsKuWJwh7/KtxDEnJoFyb3lUHCs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b45a9ac0-f8e2-49e0-8d3f-08de78fcb1fe
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:13:04.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKaD9N9CLUF1mFLWbh0SN+b//7oFAt0NJplu2KJlS3HwB8NeZN91UYJZB1O6ZnoYN0HmI0xPJ3yEVVf0N0qDHxwmzfO25M47M3MR1EMX6U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5395
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 09:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232269

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Currently, when fdset_new_fill() fails to open /proc/self/fd or
encounters an error while processing individual file descriptors
(such as fcntl or fstat failures), it returns a silent error code.

For debugging rarely reproducible failures it becomes difficult to
know the exact cause of failure
This commit updates the function to use log_debug_errno() for all
error paths and hence  provides better visibility into why FD collection
failed, including the path of the problematic FD (via fd_get_path)
and its inode type.

Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 ...-detailed-debug-logging-to-fdset_new.patch | 97 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_258.1.bb    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch

diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detail=
ed-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/001=
8-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
new file mode 100644
index 0000000000..849f5cfda1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debu=
g-logging-to-fdset_new.patch
@@ -0,0 +1,97 @@
+From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
+From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
+Date: Wed, 21 Jan 2026 14:13:29 +0530
+Subject: [PATCH] shared/fdset: add detailed debug logging to fdset_new_fil=
l()
+
+Currently, when fdset_new_fill() fails to open /proc/self/fd or
+encounters an error while processing individual file descriptors
+(such as fcntl or fstat failures), it returns a silent error code.
+
+For debugging rarely reproducible failures it becomes difficult to
+know the exact cause of failure
+This commit updates the function to use log_debug_errno() for all
+error paths and hence  provides better visibility into why FD collection
+failed, including the path of the problematic FD (via fd_get_path)
+and its inode type.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]
+
+Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
+---
+ src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
+ 1 file changed, 26 insertions(+), 9 deletions(-)
+
+diff --git a/src/shared/fdset.c b/src/shared/fdset.c
+index 832e7fda60..f340f41b0e 100644
+--- a/src/shared/fdset.c
++++ b/src/shared/fdset.c
+@@ -8,6 +8,7 @@
+ #include "alloc-util.h"
+ #include "async.h"
+ #include "dirent-util.h"
++#include "errno-util.h"
+ #include "fd-util.h"
+ #include "fdset.h"
+ #include "log.h"
+@@ -179,9 +180,10 @@ int fdset_new_fill(
+         d =3D opendir("/proc/self/fd");
+         if (!d) {
+                 if (errno =3D=3D ENOENT && proc_mounted() =3D=3D 0)
+-                        return -ENOSYS;
++                        return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),
++                                               "Failed to open /proc/self=
/fd/, /proc/ is not mounted.");
+=20
+-                return -errno;
++                return log_debug_errno(errno, "Failed to open /proc/self/=
fd/: %m ");
+         }
+=20
+         s =3D fdset_new();
+@@ -210,9 +212,14 @@ int fdset_new_fill(
+                          * been passed in can be collected and fds which =
have been created locally can be
+                          * ignored, under the assumption that only the la=
tter have O_CLOEXEC set. */
+=20
+-                        fl =3D fcntl(fd, F_GETFD);
+-                        if (fl < 0)
+-                                return -errno;
++                        fl =3D RET_NERRNO(fcntl(fd, F_GETFD));
++                        if (fl < 0) {
++                                _cleanup_free_ char *path =3D NULL;
++                                (void) fd_get_path(fd, &path);
++                                return log_debug_errno(fl,
++                                                       "Failed to get fla=
g of fd=3D%d (%s): %m ",
++                                                       fd, strna(path));
++                        }
+=20
+                         if (FLAGS_SET(fl, FD_CLOEXEC) !=3D !!filter_cloex=
ec)
+                                 continue;
+@@ -221,13 +228,23 @@ int fdset_new_fill(
+                 /* We need to set CLOEXEC manually only if we're collecti=
ng non-CLOEXEC fds. */
+                 if (filter_cloexec <=3D 0) {
+                         r =3D fd_cloexec(fd, true);
+-                        if (r < 0)
+-                                return r;
++                        if (r < 0) {
++                                _cleanup_free_ char *path =3D NULL;
++                                (void) fd_get_path(fd, &path);
++                                return log_debug_errno(r,
++                                                       "Failed to set CLO=
EXEC flag fd=3D%d (%s): %m ",
++                                                       fd, strna(path));
++                        }
+                 }
+=20
+                 r =3D fdset_put(s, fd);
+-                if (r < 0)
+-                        return r;
++                if (r < 0) {
++                        _cleanup_free_ char *path =3D NULL;
++                        (void) fd_get_path(fd, &path);
++                        return log_debug_errno(r,
++                                               "Failed to put fd=3D%d (%s=
) into fdset: %m ",
++                                               fd, strna(path));
++                }
+         }
+=20
+         *ret =3D TAKE_PTR(s);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core=
/systemd/systemd_258.1.bb
index fdf4dc5bdc..0259bacb37 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -33,6 +33,7 @@ SRC_URI +=3D " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


