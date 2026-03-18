Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAC1FB5EAB
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:31:18 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9239.1773822628329713941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=stPrWnhG;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.48, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4Ozf6hAFaofv9qcYruRoYsv/tl/RRRPny9ATxOkute/s2PjgKoz1LrYL33XRupMnbqiGj0tLM20GuqLs3uiJtyW7w9oMvMeNClGUwpC3cRxKEFUhd2xfUrDT3DZwVWo4nuKwpvvpqdXjXcP1TgjqUD+BebL+xuhJAAV6503LBBhH9QRegxaDgDqcstqFVfx1mrbd9BvtNnaMxqTASkHNT8jdkYECK0azqdZqOEIZUPaeEX73RLoFWW7TuJjoq0WgnWJqp3zeVq56PsaOH/VtmLp1eN2OwZBz16QoERfCj9VLCceLf5WKEONCvfiqKqM1Y40wqV6whj6jnNwKYwQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulEUaym6ADT2v3IMzb5wKFaXipuvIEi81mxSIPO5reQ=;
 b=r2h/HwY/Uk4Ia0cmNX6u4CNlep1xfV1gbga4ZgIHWGEyBNfFAKU0VXKpc85+dc3UDtc9TQCoPDMS0QMU2y6Xd5IREtcnC1GAUeE1SzA2afDtwA2mfh3qz54uJI3E7jLBB1MZV7ls1PrOAV6d4maIOAODCi5qeBWRYH6zAgWu+WZ6OAGFB3xxgo38HWA2qbLxGCukX8UZYNxNyvOqpOiq+F7uw+vGuji3nSl6kMn2sSoiFJReP+GZNJ2NIRSO4FYrp9yEr8FlWBmzW5oPSkEcWSZ+PXVEEbhcMR6bfa+7J5u58qNEDZSbewDRceTYUalAKeuoCxaJU/aTqtbyaLV79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulEUaym6ADT2v3IMzb5wKFaXipuvIEi81mxSIPO5reQ=;
 b=stPrWnhGR681FFEOKoIFA4Rm7oiMeOme+BrekuiwkNQr5Nn+/OTvensptswYyYHyA4KLHikd/yIOW6ZS7oI1R1bfy9SNWCX50kzB3ga8xVUy5gXEJ4UB82Lg+w1aBsZp1Zalei6yNnC2qAHNGzlJILDh6h4NrPE5wbgYoOEmcjaygdaIc5KtsE+Jf17fUMf5GdrF8l1dAtoA/p3A6HSx0v2KfaypamPkUo8iEwAkyV9R9pIJVOUdYgg8HxF+B6JglYFPZIxyYQmZPgtslZh+NRQ+YDZ8b1XZdPUH1R7DH+f9IiDjbwug53RTZJcrk94eJcgrQuKWQ4pxpBw0H8CeyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN3P287MB1164.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 08:14:46 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%4]) with mapi id 15.20.9700.025; Wed, 18 Mar 2026
 08:14:45 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Ashish Kumar Mishra <git-patches@bmwtechworks.in>,
	AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [OE-core][PATCH v3] systemd: add detailed debug logging to fdset_new_fill()
Date: Wed, 18 Mar 2026 13:43:06 +0530
Message-ID: <20260318081306.3268022-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN4P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::8) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN3P287MB1164:EE_
X-MS-Office365-Filtering-Correlation-Id: bc66349d-834d-4473-e8d4-08de84c66a59
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|55112099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 92rGZR7aIBXQhIqshpCx9dw16efq9xoUUMS/ifr+jb5xZMq5yCkeMbzL2oEe5gU7CwtGyDkKPOJBSR0srfHTaUjJaAi6E3inA9FUlgw+womvpT7MQtM40TlnC92LSRhr/N3RIIAbrr4EybtVzQPNqFsFk6tUe1u12vLMcAydTEnpAL4K+/Cq3XKuAW2W4zWapFrpS05rdagpNfGHU5jt/jA8hCcyKdF+wam6qkvLveLFTGeFBCEXRTofbP/WvZE6J085H0SUUKEwLxhMbHqmDtBzjmQfOVsiF9N0Ff1VkUKJyrmT/8WkCG581lHZG3e68HCeRwcoEBh7sQW1+qT75CVxuQmI3L1S87Gc9UKmyvAQ1gr+tg5MoPwN/sNXCChNcmJ+nvCF2RLSJczslY6skriJlDEPV/PMs+oRxwaNTgeEIcbk3MHQqtq3zQ0DuUvvWFpSivKdC0rpr3OQQhEevmtgDQrxZWmRyPoO4OPzT/S8ZopaDbC6j8Q9Y7QpxlBHM/PTYfsO2rh8ulJl+aHVEk64dKjBGkAeR0HGhJRyPr4JbLoO7OClfxd4019aVI2yhxCOdWTEQPNAhhV7ujpLEpK1Vbb19DJFIVzjTFSGTaqPvn0MosTqLPxyU634MAq1b199dRquuvSwrU6S8BqdGvGDGEfisRDhiXFvEifcl5pzz1SJ2lLs8s/iEnxr4J6h9til9jFHIUSZiQJ4/gbvYedIDn5lilfHVloA4LTpXqaC0HtIOqLdwC6JuyUqUJJodjQp0xLpjhsbaByyMwqOl0ACB8axMn9h3irQfx+xUUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(55112099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJ/mMe2nA8uR5f4cDITVFL06D6YPVcENhSES/kFIsp59NW39uJ8GLwpIY8Fq?=
 =?us-ascii?Q?EmIymfXNPS0a49YhWloxWqYX89YrD/O7Doy3+veXqjcAo6fqTYLNlTC9NV07?=
 =?us-ascii?Q?/G+uarvLTNv/zA/GcB+AYjxbowuAr20Vxvv8+ePcSB36jSfC5Es1vvJrGU3O?=
 =?us-ascii?Q?YMg30Umed8/ZS3JcmfyRbTQ/FDq2JY5j2aJvv8jelgyo/TNolXUS6lqFFLyJ?=
 =?us-ascii?Q?IT7jhHIJKryYmbqAol0FVbLtI38RfrUep4X5SMhoj4UtssrBViaBvXjSsrYv?=
 =?us-ascii?Q?uOtUABsv3jLTJcpiC3tKnfLrsXoCOFccUaVFWoWS7e4kY83iFwyvSYBk8l7d?=
 =?us-ascii?Q?Kr1bYKGk/0lJa9aIybe8ogJdQwOzYos8DrxfzoEpRsmJh/PBR0Rq64v9rCjB?=
 =?us-ascii?Q?WUOYhwW9PMSMkvFqlUfGAsQ7wA/QFbXuwrZ8/N04bxVQeCgKt7HL+EDeil5e?=
 =?us-ascii?Q?FBKbGJGzciR3vnM2P1xLC7UkdAIIIDrd7P4b4OPUTXHVqtN6GXDiBFbkxetv?=
 =?us-ascii?Q?3fIa9wQTD1fg2lahW8rKVP1O5xzWYPEkrNHeGxlbyBkAOMGwcga1AJuRZoBf?=
 =?us-ascii?Q?K50ji03bSwJzGJR8KKD3Rv/Zqw6irP9W1UtT0qc57Z5njCU1RnnFbhWT8v4x?=
 =?us-ascii?Q?ATtDozk+Lid6VQvFokludGnky9xtDFOIeMOcjylgDTvQrcfnN9bI5ccc7ahH?=
 =?us-ascii?Q?jb6bIuyc/RXruIOtQCqnRWgWG8gqZ+Fe91K5/5IjEiX25EavrYSUCPTSUPut?=
 =?us-ascii?Q?x9Cm/d0ctKwjiK7j004/D9F0uBA/C5kAAEh62QuigCS+IUom4dowbcwV0aN8?=
 =?us-ascii?Q?yBGZ0uPaV/g+L91NatJgMylgLhn9S7gfxXAqwvPGSi5O6fDbnTyl0/v0S8Z5?=
 =?us-ascii?Q?KjrMK3LWOb90lh/0AnRefiFczgUFQhS7XlmwfrDJsaKLsHHNnnq4qLk8k79u?=
 =?us-ascii?Q?XZ2z1TSHR8kAPt4Cl9ebFoYbHL7DjXytxFd9TQ3iF75Q8ipEBLZT9EO1wUNn?=
 =?us-ascii?Q?k3IK/3wyr/P7rsc0XLVlIwQvEIr3SGbLqzBK5kxPy/0X66j+z0kSl7ybJLOm?=
 =?us-ascii?Q?GSEgF5+sKLaRMg9mTL8cnOMe1L/kipIKzCwieAfi7xtfQbRhBoj0oSbBvSdq?=
 =?us-ascii?Q?jaUbUOoEY7nd3hECm0VURyTlgGDRUIaxEgFknSmBRgd0EP4fZXvafnCyP1hT?=
 =?us-ascii?Q?hYF9xe+QJDACjHyS3SDp7tfRrNtaLtx5Mqv/OyLz44MqM+aRK4TR9LTzVjUc?=
 =?us-ascii?Q?t9VQlo8i9xRFAgtYOA6jQVIYFpyeYKxBZrFmojYafLPfKarvJO8C2qVgI/R/?=
 =?us-ascii?Q?AOk/yJAyMg6yAyCdM3OZZWJ3L90OOYZBoE1MDt1oY1JA7OfFUprKUqtnZdu1?=
 =?us-ascii?Q?iN5a+wJYjYcqeMmpIX/O2IZUIjVVJwUts159U6cguT3Fiw9jSfcx3oNS56yX?=
 =?us-ascii?Q?/zK4RQQCUMsR2yRBNtRQ1MeXJFwUiRKd8PEiC7NXJrVCgMcraTBg/5EvfM/C?=
 =?us-ascii?Q?wypWGdRs4mZYUWho1ghLL7LAS31wOdTb0IZywiy6eaMaFjHnWMZdQ7/eoNHi?=
 =?us-ascii?Q?sWFEWiipShk0Xmjlz7PxLQBnfDy+AkuwiKksd51UhXRsA35CfTMMYkebDTFd?=
 =?us-ascii?Q?P86n+ZCRbqpNrZvamhIgWmmWceSjv6ywAIZqOJADZgITc+8VIUnjg9nI8T3P?=
 =?us-ascii?Q?o6fIb6iDh9Pw6llMAQJUbuyKIXvoZ9PuMXdZcXsWadtzZi/gIuxD0YRfNgBL?=
 =?us-ascii?Q?mMtdGRwtfjnxfXey3Ic5p95AXec9kZk=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: bc66349d-834d-4473-e8d4-08de84c66a59
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:14:45.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxFYHVexUCUwdb375BW2zFA0h3jvSu413upv0WDy+Zfu6BDII3Rq5dEo6iz2XC6Ws8mYW1S+6Wm5zKjE9PHYdrxPnAcpUXCWwADabyJjrJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1164
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 08:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233372

Currently, when fdset_new_fill() fails to open /proc/self/fd or
encounters an error while processing individual file descriptors
(such as fcntl or fstat failures), it returns a silent error code.

For debugging rarely reproducible failures it becomes difficult to
know the exact cause of failure
This commit updates the function to use log_debug_errno() for all
error paths and hence  provides better visibility into why FD collection
failed, including the path of the problematic FD (via fd_get_path)
and its inode type.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
v3:
    - Removed Upstream-Status from commit message but retained in patch
    - Updated the commit subject and added the changelog=20
v2:
    - Rebased to systemd_259.3.bb
v1:
    - Initial implementation for systemd_258.1.bb

 ...-detailed-debug-logging-to-fdset_new.patch | 97 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.3.bb    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch

diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detail=
ed-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/001=
8-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
new file mode 100644
index 0000000000..63fa7fefec
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debu=
g-logging-to-fdset_new.patch
@@ -0,0 +1,97 @@
+From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
+From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
+Date: Wed, 21 Jan 2026 14:13:29 +0530
+Subject: [PATCH] systemd: Add detailed debug logging to fdset_new_fill()
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


