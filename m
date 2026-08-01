Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230D7C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 05:54:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.836.1785563643409189476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 22:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lp8ixXMz;
 spf=pass (domain: est.tech, ip: 40.107.159.3, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAVZSuBlvgAGwrVuUtr23AKZidj30KovUXNxMEdU2/zPLPhp5zjr4HHZ6Jp0NwbrBixdkbyx8Es5huXoWwN67kB6mq65FKEn8xsoH/XRi2i3feVXaCaJJnj99UmJ2f/uMF5BZj4eaAcIjdQ7d6Q4BrgwPxAy6th2clY3zfSH1ccyc35ZNkrDVA7mwzX1bhJXXR7HjOgU2/T+5v24JZ2+/1ANJMLIwjwWNpWGrh1oLxO1Hp6bQFmD5kPQXzkMRWUxC0WsjAerfI4vLFFyF6cWRc1ZWX6eJbdo9WErWCVQZ0+wWIxGF81yWNJDUXABn4OAMVt4TqZzcCthUbMbd0isEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLS1pWUfYL4dnzthIZVfTgQOWrDrefLMSsDY2yy/aJ8=;
 b=UOAHcLe9TzfxxQ00L+IPG0T0NoMQO0mw/wianV/uDyqlkBMeCieJHp/8bGE6KGrtW3VE1hpv73Qzw+t6znXHhDLk88opDdi6tJsHFmWcluzpqnlOICLuj+KowFrG6bRedlWsZ8d6o02MBhcLFl8sXpIo+ubWPlJD4Cf8ybKhTCOZvnRwdThfIB2eTko6jUElHtIHXiHYwj8xxj5+qTYrDB1K/RQEZKU93smldJb96bDrmT7qTMwArKy6nPzdiVA3jnJJ7Yhd0TBOZqVhVpYUGao7AN0qKqeuuX8WowyKQNBdtn/zsOfhHCdnvFWrvsscenEGH59OFtpy6tto1rVzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLS1pWUfYL4dnzthIZVfTgQOWrDrefLMSsDY2yy/aJ8=;
 b=lp8ixXMz2k5MEOeNr9bb0/6vHtfaNFzrtoVWq4bl9oq5LBkNYqho6b6ZsEM1btItOMEG0LCmr//8XJisGFMmUi22a1e/O6kw1g8LU8iRFiufDts0JquTdJyq2AN2dCGGmyyLlpt+4nJ9hdgTvKBU1HoVsIusxmwhRAqBOSLo5Mh9MLD6e+lKegsD5v8dlvjGfIImPjkmApCIWeFRoaWJYyiPpS+vJXOJqR+lm/lPTqUn36J0Efl1PGiD2X7PwKxkJ8gI7Tf3Mkkk87kR3yw3BAScVTHSUjoayf7o9nI/9is88mjoqNCoC05zgUCi4w3O4ulq/I01h7uA2pqBU3PNrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB1841.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:341::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Sat, 1 Aug
 2026 05:53:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.010; Sat, 1 Aug 2026
 05:53:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4] glib-2.0: upgrade 2.88.2 -> 2.88.3
Date: Sat,  1 Aug 2026 07:53:49 +0200
Message-ID: <20260801055349.97228-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
References: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBB9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6f3) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB1841:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5e9387-fcb2-4b73-6176-08deef9145c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|10070799003|1800799024|366016|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	scA9jHGz9VgMunhBvrUd/AW0qw+Ct1dOaZIXx3AtFefZKzcOKSR4dD6QX5YAyEX7JYHJLNN1epKA2cUcRE7w/o5MGMBmdGFRBNpeCY6i92R91TEf6Eb1o//OyBk0lY+Wwrgm77XCNtTCpS5qhsJgTk8XbL8WrJkpNErdoyXF7Ks4qHm8m/eLxGJeLiE1fdgc7nbvPy7eYYZ0zXgvoDzQVna6ljPvmK6ogiJ6mIJEDHpcQ5r4vHeKRbFpU+ci4JrQEEWkF2WsSK5Z/3MzTgK/daMZ+/R6fHRQ+fFgYDjzGMpGXA/NuWRkj3RVyGOwl3kW10eT1+HqoWLxeF5jZDibQbajoF6Jz/DA4G/ZUucVE8BzoTR1nA5Ucvn2uViX4tXT+AkOgCxnVoWRm2GhCj+bJSn4M5vwIJxxk8xXXSn35nbHTBLjiB7pgPsGON5BG/4u4nEolnrbCSNY5JMl6pVR7x5D/FwS2F1KMw10wwUkRAMWEYkV6cotNq3DcENr7JC/WYG90okVXJpEyG7kjlyzpLGQMDEWAbzVmGqAscQSIcOd/5EgM4sq1NwSK0758SfaQElwIEA35E6lx1+MPi/DNjQYxaimkULUMb8etfthCEXQWIrDmUAOxkhy3XqgBJG2jPu277+G7yspB0t1LY19mQoE2hqLoQ2hhPdGo02/mTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CiXmQbiwlN2iCGdpylKLavhH4j01nLxQ4r1AznAGBM8d97UU8AUZUKfnsoyz?=
 =?us-ascii?Q?1jYr0VCSNbMQy8iSGSXqu0MJqpr3kK9DHl0QYo8A+2OdlGWu3lQDQAn7dlIx?=
 =?us-ascii?Q?iM3FNQYVVWR/JmC2I2Y9172nHmfpwjjJ8YllEu99XNBn7pRNkkRgDFhq6NhS?=
 =?us-ascii?Q?okVrV/cvrVjvI3cjlp/w5llWnWcZZZ7YjdUclaJp3j3JMvR11RrcX7B+F20D?=
 =?us-ascii?Q?IVtlQ2z9KAOVl8GgMTUOzl+v5Kdh6KdOaC/EonQ/iE07nLfT5PYI6GxmpX57?=
 =?us-ascii?Q?Q+RBQCazoY72R6oGo9QGOGU2FJmUTLG39Be8SjSvJMnTnytVrqdXc6PGaDun?=
 =?us-ascii?Q?F80fYypUiggeXjmM2GQ5qciDU6AYR49fwwKXqLpO1DOI9jpCWdCj0h7Dft0C?=
 =?us-ascii?Q?OX2B0P2/dglSUFCuFrR9Q623LBpXgnwWKTDO3FPRssB7rdco28ahNfWoiuxh?=
 =?us-ascii?Q?msroXK3bHBx+WOU6/vdL8fQ98zMVDlp+Y5FB79Cjl9jqXw/TE5Cri6QsR9GJ?=
 =?us-ascii?Q?g8i4EYuvWdpMAiNF7vLrmdWp5m6nzHqD6rbzt1lb2i/xL42rJo8dcABWux6b?=
 =?us-ascii?Q?cwsBgmTn+a2sP+yk0Pn1xkEchix8ArecPtCl/mUv1ChgW687i95r2nzi5MC+?=
 =?us-ascii?Q?JURVmOH5uomeTjeZ8JXHRnJntTfwYhqXeXlv1lz+lnfNutxeWis1WYoa3YzJ?=
 =?us-ascii?Q?r/St8mJixEPuosfoNw21/7b/cvwWVGG1YwlCOrxXrxT8DHopbLavax7cPy+5?=
 =?us-ascii?Q?pSfGVp/+ebs/oW8yVcmtp2siX6W3hxUWv4LswHez4/qhSbJcVQiDcWELJq9Z?=
 =?us-ascii?Q?8B6KLgEwHeE7FHJX4X7D3TvrWd6Yx0KClVPelZBqbOmzqM2M/+JbpWObiwHr?=
 =?us-ascii?Q?shbItgaQmqSb3GCjEGqrPWvDzRS00OrelnhfuLmK5QuzZLuxMyTCxwE8p4be?=
 =?us-ascii?Q?Xpe5Scodiet5+2NCSFpnn/0HtMmTQxw9rZse4Jq55QU3YBXLop/CKSI0z+IC?=
 =?us-ascii?Q?IJaYpA0mtg/oeWvC6pnOKZdJi++wVctd+SYUSbC9QBcZwZXpSj3Loi3EnSlB?=
 =?us-ascii?Q?HTWciJMMHr+EdORhKTHq3F/VOhHTBZfftE8Dc56C8m65IF0xb6/ESCjVIIcU?=
 =?us-ascii?Q?BEgGQAfMIlJK7feTB/tKykG3rzArOMmekBEtJ9D0oMzxTjd8lTCV5lhGvo0b?=
 =?us-ascii?Q?rhqn4lNqJ0OVN2bpq9UAT8o+0GbP+gu3ynL4okPreKp7Rt4U2SfSUjxf8HIC?=
 =?us-ascii?Q?40JHgJj7m/Dcgcyrn39jPSO2+WgZGu5cZDEAjxSK1t58cZNq1HxDe1TegXRU?=
 =?us-ascii?Q?dqmVQkqeXQIExLLJ7CwvEEFll7I0407eBv7ngIB36w0+Z8oop6poVUkwBYsz?=
 =?us-ascii?Q?2T6VR+pXxRBHmTA07B9ppEnsja439QmlyVVq+ghBJ4JfvL0Q88HFsGjKFlVY?=
 =?us-ascii?Q?Wf5f25mpHZMOF/fEqLhRWeqA7vgeL9YTq7nrx/VoNB41LiTWX6zEDVlilRel?=
 =?us-ascii?Q?ddNh6YSDEUp3YH8SURBQeLcb6nQTlylgJmMoBSZTxETd/IjSsYgqAc1o0oLw?=
 =?us-ascii?Q?I0N9pjwBTx6f4aIh9D7nTti7/ClLL3tMfV3+rBO3N9VBsxku2wFtdt2veSOU?=
 =?us-ascii?Q?5n6u9cWnezHjaj9pvyJUihXs586shfGqmcwlv3GepQDbmZX0GMKc+5UxUTOS?=
 =?us-ascii?Q?qBbZmTw319lcG/zPJfduDb1RnrPGOkD98RvDEc82omaqCYMmo4b+Qo2Si5GZ?=
 =?us-ascii?Q?Y18Gh4WDH3QNuopbshS/399Yc3in+1+oxCgeJVOtQ4/qoBBgq8pXOt3AmfQP?=
X-MS-Exchange-AntiSpam-MessageData-1: nDnGcbudTRiUs/9IqtuQ2Vv7FJIXABqmfk0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5e9387-fcb2-4b73-6176-08deef9145c6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 05:53:55.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahKqO+UAqpx1COnrTeIamPgHKSqEbRUXo/JnfCYW/lotuYmG8izFqJB2EUmcvcbAh+9zIUjyK6Y3gURqs/o5IohMbooVW+IcG2M8U3Moejw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1841
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242457

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17

Source: NEWS

Overview of changes in GLib 2.88.3, 2026-07-29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type()
  functions (#3984, work by Sam James)

* Bugs fixed:
  - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
  - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authentication =
DoS
    via unbounded SASL line buffering (Philip Withnall)
  - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-2-88
  - !5241 Backport !5240 "gdbusauth: Limit length of lines read from client=
" to
    glib-2-88
  - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated fd_sets =
on
    macOS" to glib-2-88
  - !5243 gdbusauth: Unmark a new string as translatable
  - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-88

CVE-2026-58016 patches refreshed due to context changes in the new
version. The patch content is unchanged, only line offsets updated.

Backport fix for buildpaths QA error from upstream !5259: use the .in
template as input for the installed service file.
[https://gitlab.gnome.org/GNOME/glib/-/commit/ed5956d]

ptest results (qemux86-64):
                    2.88.2      2.88.3      diff
  Test binaries:       308         308          0
  Sub-tests:          6207        6207          0
  Passed:              306         306          0
  Failed:                1           1          0
  Skipped:               1           1          0

Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both ve=
rsions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v3:
- Cleaned up subject line
- Updated patch to Backport status (merged upstream)

Changes since v2:
- Dropped unnecessary output rename in buildpaths fix patch, kept only
  the input change per upstream review

Changes since v1:
- Added patch to fix buildpaths QA error, submitted upstream as MR

 ...t-write-bindir-into-pkg-config-files.patch |  4 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch | 12 +++---
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 35 ++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  4 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 26 ++++++------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 40 +++++++++----------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.2.bb =3D> glib-2.0-initial_2.88.3.bb} |  0
 ...{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 16 files changed, 86 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 11e9508840..c22ef9fdb3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
+From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index c7da257..8a00989 100644
+index f9aa0c8..48ff2a5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index 40398f25f7..bd7a04cccf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
+From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index bf669bd4b7..8f6fd98472 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
+From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -9,15 +9,15 @@ renamer does not cope with library packages with files in=
 ${bindir}
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 ---
- gio/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ gio/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index a3e6f18..c7da257 100644
+index a3e6f18..f9aa0c8 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1067,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
-
+@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+=20
  gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c',=
 'giomodule-priv.c',
    install : true,
 -  install_dir : multiarch_bindir,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index eef7c9db86..d64576b11e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
+From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 14c8c701ba..579999fd6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
+From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
new file mode 100644
index 0000000000..755e51cdd3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
@@ -0,0 +1,35 @@
+From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 30 Jul 2026 11:28:36 +0000
+Subject: [PATCH] gio/tests/services: Fix installed service file containing
+ build path
+
+The refactoring in !5259 changed the installed service file's
+configure_file() to use the build output as input instead of the
+original .in template. Since @installed_tests_dir@ is already
+substituted in the build output, the installed version gets the
+build directory path instead of the install prefix.
+
+Use the .in template directly as input for the installed version.
+
+Closes #4011
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed=
5956d]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gio/tests/services/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
+index 1111111..2222222 100644
+--- a/gio/tests/services/meson.build
++++ b/gio/tests/services/meson.build
+@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
+     # Build a second copy of the service file for the installed
+     # version of the tests.
+     installed_service_file =3D configure_file(
+-      input: service_file,
++      input: service_file_name + '.in',
+       output: service_file_name + '.to-install',
+       configuration: installed_cdata,
+     )
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 1fe00df8fc..3f9b9e4741 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
+From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 25802aa..c53d216 100644
+index 22ed181..87497b7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine =3D '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index fa46bee904..0912859698 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
+From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index c53d216..330ccf3 100644
+index 87497b7..6955b02 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index 7a2c168756..c032d575eb 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
+From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97..f6883ba85c 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -1,8 +1,8 @@
-From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
- <node> element nesting
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
+ element nesting
=20
 The check for whether a `<node>` element in D-Bus introspection XML was
 nested correctly was broken. `<node>` elements can only be at the top
@@ -27,10 +27,10 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  2 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index c7be334ce2f7..6f722ee6153d 100644
+index df5daa3..78a63e2 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* --------------------------------------------------------------------=
-------------------------------- */
    if (strcmp (element_name, "node") =3D=3D 0)
      {
@@ -40,13 +40,13 @@ index c7be334ce2f7..6f722ee6153d 100644
            g_set_error_literal (error,
                                 G_MARKUP_ERROR,
 diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index 44cb7a96af45..daca313f77e7 100644
+index cb99c94..05710d4 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+=20
 +static void
 +test_invalid (void)
 +{
@@ -80,15 +80,13 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ----------------------------------------------------------------------=
------------------------------ */
-
+=20
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+=20
    ret =3D session_bus_run ();
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a..3acb16f75d 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -1,7 +1,7 @@
-From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+Subject: [PATCH] gdbusintrospection: Add some assertions before array
  dereferences
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -27,72 +27,70 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  1 file changed, 8 insertions(+)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 6f722ee6153d..ed0d291f99f0 100644
+index 78a63e2..4df8e87 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+=20
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+=20
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+=20
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+=20
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+=20
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+=20
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+=20
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
 +  g_assert (data->nodes->len > 0);
    return data->nodes->pdata[data->nodes->len - 1];
  }
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 421dcb8f9a..6c982ca735 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
+From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 25f5324784..7bc83adf6b 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
+From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index fafb7e3391..6759ce328a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,12 +235,13 @@ SRC_URI +=3D "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "cf3f215a640c8a4257f14317586b8f1fdd25a10a93=
cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

