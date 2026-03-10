Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E466EA8550
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:29:25 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35605.1773131058668505948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 01:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=SyP77QHd;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.37, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywHkcsIdRRLo0eBVv2inQOhAU1qMDX0/UK3aa1GrbzHG9ZQJmJpWwQpdB09OTsyJtLpG9bc02e2FmRtjUOLADU+VcWsZ+D0+8ZaTg5L09M6MtFqzDsR/ufIU6B//ctsVec3DTXOiC5cfeLJptj4kW3X3LLEbSz6i0VMHQTH5FU+MHVxG4J4r0oWo+3dVJbeTbfdxlMtAjFnk9RJ8oWWiDV/hRmfQPxbav9IjHGpbaPe1wQFhO5eQmeyNhKr3FuKVCCb847UzVo4Ku9RNMH+6ak1KZNUxMuqWnNc7/dComiCU0ezjrD9KQpKMTyjk5nRmOm5lpu6j+WCTwLww+f170Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFLVLldMkVITLQnU4sYQBbURTBGCbBKpr5zkVc+Akb8=;
 b=xxrKq6upfP0NyIWSXeOH+V3WjxPKDELLD+S9eAsfeRRHY3JK7cmRiT53V4AE8ArJu3BkhWyIZQ1DlMfyoz8QVPrpyr12GEOxX7/bRlrwvWjQb5UAHsl0tTlgVeKghw+Zedruo0Q8dB6xaRIzYl7zKQDKubcX6T0LuoTaBUBvcyGukY8O1ME8Nh4/Wa5JsWr/eLqJ2T2Np/DcziqFI47H9dWURFuPqPJRgQY/H1ezP3dUY84UzldxkYLpKAFtzpKbVvRsx5lez6OgxWHwpcXUYJwSqrD99+XO0HtLJiNdDigbJ6BuYpPdjgQLf/FDNEcSF/bP5yUqc4g04MkSnyhtQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFLVLldMkVITLQnU4sYQBbURTBGCbBKpr5zkVc+Akb8=;
 b=SyP77QHdB0ljrDFR9ExmYVBdBqi5W+3jiUS5vekTMCw8SX2/ZBMZ8CGKIlPUumjmb03LkiTtah9h73cIg7syf88fEshPFgKdXmy+cVwBHsOgxggXbtwM+v/29yFWYR45GKVKiO5hHYfRWP+1j6ROTkPCJ37jtZ2gqb8jblLcN5od6gusdsT0Ay2lxTk+5XHGuCD0HPBEzdzLkqrhjztYLoCGj6mAvTdVCW2sicUq4fExLX9wHljk5cUuYuvf+Js+jPmsgjJf7PJzgA7RYtCSpfSDUVa3kWUMYUICcxNYPgZ2Q4E4zD5Je7LJ3sKYqvNcnPwZWHyPtjKf7OZiDKBjtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by MA5P287MB5221.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:10:00 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:10:00 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Ashish Kumar Mishra <git-patches@bmwtechworks.in>,
	AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [PATCH] shared/fdset: add detailed debug logging to fdset_new_fill()
Date: Tue, 10 Mar 2026 13:39:42 +0530
Message-ID: <20260310080942.47334-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN3PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::9) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|MA5P287MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: e94afaf7-fdc8-4f7d-8c12-08de7e7c6cfd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ponF8u65qHQ7IK3GNKLELlK28HvhVssgZZ3Ey8ERHo05itwsavl3PgHZn5ytmzT83DQT148lpVFSXArgpVheokGRTIMcNxswSd7NIR9vu//GTjPn5fPZrJqEXLMCGEIYP3WkCIPx7eJEfHX9IdbG2WHNj2wLt/yymMPtve0CD3CPTnuTaMBVldgb3f8YBwEaFrS0yPX/fzdyn0l4zuA0rmJmGXaQr1jJ/nYGcDncbzE0EoF7Z/5ZU/lj51FJVEDL4WPOucSnA4HhMFRqmHdNJ9ABeGAtX1fzLGBZWioIoBbTzfUVhtYoCu1SYMk3OiOKoMDa7gERGZBAgaMbLw0ZnjJNNSw3aKrjfAp8gSiVBD5RNN8GuxikoAtgrB2YKvdSCv1RCJV6xmhKWh5cp/nsmHVOP9NitNrtHpNALGDnxVIlndd6EAAGR1XbsyXdMmVx8956WsEzmljZ4XQRbosAEkHD0PiK32QVZsLq/Ln9lKiix/HKqj/2p9wPrEZJSSdoTsDKwAlGU7vrf5z/3YhqAQCJ1stiX+GGcpWoj39zY1rN94d3RfBmSvB6cCq0e96lG7eQ6HSpDDAALlbaLd/avi8MY17V+Z4BSaPeAZoSyHtdVu80bs7X5xjpgOTEcq8g6HAyJvwkpv6fkghNy2xnhtlqEEupUVGAktkzdKOkQuLvy4JW8pv1ARwPSluYNpfYbQDBQ/zhgq7qau/pJYnVD99IUA6wTPEWTPHr0RDwpTTKcJw63VwpNec0yUfaivu/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1rUUBgQAVMMWsbZZ6g8SN0b3xRGmdaMSkck7L3sOjdvh2krrX/XY5GB2W6Ze?=
 =?us-ascii?Q?L4yqrcSNAx49kg1ZUOhy0AfIqBskwzSCzzt3x8Pe29G0ye46iirKEUhrXKZ5?=
 =?us-ascii?Q?XWyknM0G9f0DoJGF+bn2lQMKKq4Zw5VoY5dbahbefsmY8ZSk39Cj2A4lH22Z?=
 =?us-ascii?Q?qCXZbH/ySRRwjqaTldqJ/A4dMscocXkuG/vSdB0Sz0s/OMvyMWzNFPHlV4PI?=
 =?us-ascii?Q?74q/vjKTqXrZIippxBRyXBu1Z929LbQBifTylwLr0EdPDE0fyqVI0Zc3m8GY?=
 =?us-ascii?Q?qgNYB55BT0JH/323l4vzwwFaokJeUMxpqfJLmeNHQGM/Mcd42nGMWSv7eNPn?=
 =?us-ascii?Q?lT1BMievrGKAs9ZOSIzY4mCI/RuRG5rc24WEEP43Rd0uuTVX4xYHA7wX2bIR?=
 =?us-ascii?Q?OrWW6CQIoQzsut/OXwd++mJw/zQGCHWGuFF/SQPj02DNSs9GTD6Mb2IoSTOd?=
 =?us-ascii?Q?w4CcXgZEbw5g9fRpkiLGvJeJuI3oah+DpOdQCBYbXg+FzQ+v+fv9Lf51rMlu?=
 =?us-ascii?Q?ZPR5UXxQ+0o3bk9yon1r87FXsK17en5HikoX1jkFTPbWfcGnUkQPb6bsaSlG?=
 =?us-ascii?Q?UrwTGMsd6fdlfQcmWNdArR1Qe6vGqn3OalNXF/iTUM8TLkN8f/pyUe4Vbx9L?=
 =?us-ascii?Q?u8cjQ88oNw7GMSa7CY1B9oxCwS7Xlfn5iCkQ+aBfr6IDXe9Nhb0r5vHRI7ZG?=
 =?us-ascii?Q?TmJywPuA/9cG9OyRLC5Nxu0goFA4ph1cP6MV6NgGV0fnlnPWxAmPtxyjoNhI?=
 =?us-ascii?Q?4Ojc/q0ycG5Doin2XhRWK8+KEXN5rgljw8BoxfrJsisuN24emD3WanFOUQTX?=
 =?us-ascii?Q?Ys3GnoFAQpnjUa/kCxnATOjwpbgm02/Q68qlFFr1a5aYcS31qUXohXVrFYey?=
 =?us-ascii?Q?pFCe+BhpREomvln2OFd/IrGsicuHotbPtqEiIl6U89hxCvoW9JCzlBEvSnl8?=
 =?us-ascii?Q?ZVV+QOffaFW0RDw+03lhYt77x5N0TNVqoS4riUZrcPZ1gptcIUELZep1/tiQ?=
 =?us-ascii?Q?Ye2G7HVSddzDIqz8Br1DF3MA+t51psJJXHKWzNKuoU2T93AP6u8Osp4+nAOJ?=
 =?us-ascii?Q?JxSmTeJufRbA0iIMkJ89HZObrGEPOGxy8d6B+GNEvlaYCYdb0ff8wsaGaW+H?=
 =?us-ascii?Q?8096JPl+xpiRTxJj8dH/BpWvr6geuRavkOGOpE7WZaJTMx9FUR3x66DlxC7V?=
 =?us-ascii?Q?SfxPeD5SET+P63IZXDyPz8sw9wYW2A62dvWYR/qqcQAKFLmTtItqfD3nZ4TQ?=
 =?us-ascii?Q?6EZrGDoJAzwIhMqwHSiCIrzPnDgi4NX7cgHwOyiZm4fhilDNOOYk86uWDH6l?=
 =?us-ascii?Q?jEXzRTTFADhAtEHj9i5USrq6fkv7ibO9d+3g4Wb89is+V4TuOX/Ku1/mX+RX?=
 =?us-ascii?Q?+gOcm6/pOgjAg6/d/QTkDetoRbU7dl5gDxi/NDwY6XlWRD8O/nqRbewfaAl8?=
 =?us-ascii?Q?e7BSjGIt4UjpHeQf2TSc+kRkjZgKXRH+NHbx7Qas0Vvouhr979QwsGce2dmr?=
 =?us-ascii?Q?d1hnCH0dU2fBizyJzOK8KK/ahUjA+MiDnEQ8cNM/eYawMojEdXQj/obddJhU?=
 =?us-ascii?Q?INcsQG2S0dyj7M/LUyhiRbvpk2B8DAExjPhMhpYIbAqwlUphU608BJfDHHt8?=
 =?us-ascii?Q?QcnpNaOeSRRUbQ9bp3mVd9J0rPkWK/3r29VkJenpRCn9mCmw30RX3Ze7b4YS?=
 =?us-ascii?Q?1+zq5cuX8FQFzrhNYdxVZtSzJaQvQZIuoOJKnmSXE1EufoWKzbnI09NzPNir?=
 =?us-ascii?Q?xAVBN5TYaSkKC3SdCpd9zNqe4pZkIVs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e94afaf7-fdc8-4f7d-8c12-08de7e7c6cfd
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:10:00.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpWDBIdHc+DoGYfw193lGO4LKYNFQnxQ3sSOKxai2+lKIemmchcxwcGGMkUXZLPDaZIkFjUetE74drIHkX5gcgoZEVsPj1PeGPFBoVHnjC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5221
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 08:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232763

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
 meta/recipes-core/systemd/systemd_259.3.bb    |  1 +
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
diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core=
/systemd/systemd_259.3.bb
index bcb8fe3d9c..44d319d0c5 100644
--- a/meta/recipes-core/systemd/systemd_259.3.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -33,6 +33,7 @@ SRC_URI +=3D " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
            "
=20
 PAM_PLUGINS =3D " \
--=20
2.34.1


