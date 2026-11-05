Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31626.1793876992219552122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JGD+XOgS;
 spf=pass (domain: est.tech, ip: 52.101.83.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZgE2ZIdIhY6KkfhiqOZfntLtJJCJTctWt6uiJY4F3cMAzsibFnaFKpknTt4Z1MqMaYe/Td7+6smC8qyS2PAUKsbqiojdorJ35nTCWGUDV+LXUxAMeq7MNYj7oedK+AkcLevdmKcSu1gozNfRxIYRxaAvNa8EcG/xXz5KPlHmXXmiFn5gkqhXd8cjvvr6nzNEtHfOXLeOsowO5bBicjqWInZX9kuK3XBxnw+8ixWSCeYFvT/9lpQJ1kvyWdwN8DyNq2c54w1d3E5BQpsG3ZhuKDajhBCL44PR2LFTuFleBSJOEDXNp9UrlkUhv0Y6xqY0RW2Rm2Oiei2yrI2ZZe3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/OmlnoWTxzP7t19XJSTA5LMF7W/9KAZPsmiMMQzeYM=;
 b=ppCLa2T9dLBxETu3jHbF47Obp/e5YBpH5/b3XMsQa13RO4Sh1+dV7LintcviQgNTzGdSx+2sBOPaIBhfrr4mjfvuh0bD3Inc0dhz3IOeM7beHqH1WLgP2Wx1wXRK6DBCRLQtHUJ6NFoJtOESCLHPgo9JN3JgNvSF5vSGL1h7eTvSq/advugVwZGUZCPvW/dsnHqCbL8JQVAOiAHw9R1uWAVob4vRrAehqVM0fT1wIJc3N8cNFGa1cHz7ndPgev+/r8gs+r25Q60asLcU2QjGcFClLaBaTJWTHRdCD6Feo76vqzBwF/Cnj52hd68AmfXVXEwqc3l2Et6UfelAiXW5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/OmlnoWTxzP7t19XJSTA5LMF7W/9KAZPsmiMMQzeYM=;
 b=JGD+XOgSCLVxGlnLdLC4wEJ76/SwOifbBCBObioWgEsxAktN6AnNPOry2Ka6mu11tHLYWXu21tjfHkbgq7jjHeJ/EvGt3lcusQjwyjrQcqFcmRiFAje7XF52pRhdJDWeMd0071hDKUPcEY/rLf3Qk7eYR3CI1L5fdv3fXrb4SHPEneS8AGEfOZf9KSld4lNGkX48aqiX1IXpwuFe4irC3YbiSgWIMqESPxTmDWFReJ40DUwUQjqQlNFwotAGSlyurw8vuol5HzmOiQ8BuM+g9uZStwiySO+y2lrAPaodro6pgdgTSZZadYjfL5phoRGprqE3oHNUZf3CqGLZJTNLxg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF0806ED8F1.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::185) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 08/10] systemd-tools-native: add systemd-hwdb
Date: Thu,  5 Nov 2026 12:09:28 +0100
Message-ID: <20261105110930.52643-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF0806ED8F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef26b41-8b98-404d-0f6f-08df3b2d4cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|260925021311599003|260925022911599003|260925021911599003|261026140227099003|4143699003|11063799006|56012099006|261022075727099003|261021121427099003|261009223027099003|261022105027099003|261102123227099003|261021123027099003|261022115727099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: MMDAvZsVuXUHFoh/21kjbOhbMBkqejV6U8osLJ8V0u6bAc3UIarHJKBEsBVVCejI1jPTHd1YrR0MqfWR0SxHuvD5mNRVBHyAMZjtFEq4Bu5pemgpFcyy78gIwivE+dpZcyeeS5mD8BNsXdh0sZvoNmksT9xepFLAYYfjEFQ2q+PcWdxcTdCJek03jpPWDvVfiF711/grCZqGOUT9+RFnN6HITEKukCogyifCM5dA0WJLHmIBn1UklcSlU6VbqPqPlyfL6iDiMy6hFSr/Kim/Afp3MIWdts8ezI7DW/e96kofPjDygGVBTOxlDut497kzRbcITupSsU194Fm/tHSOd9O2AHlFSWvTnRTSwzvi/DY+AF0r9vhWZSFS0gHYzA2G407SM42CBqKI3479ZSziz7jxjxyfKzKf3jTR/SGO6BBq2RA4EOOtOlAAYeaBlECqIGiuBFrc5kw2KVcGxvh41UENdQUJ1dsqZAy3ZR++au9mTcOdZUBM71lmJv9Fl9Z3am/MYmsyyDw2DuA0Ckedw+xZomTBBSSrouyC/ks9M1+qrFpcyWV+EDBkP5+n40xT37rpsYW2BxKZt8dRQeMKgio76fPTUH3c7rglJ7F/XOZynxT4CmK4Ou9qK0r1iXGu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(261026140227099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(261021123027099003)(261022115727099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQkJldjHNGHfMaBZN87DzNXgzgJWR4A83QADtBH/IdOJ9N+fBg+PhPQFEma7?=
 =?us-ascii?Q?NxrklyA6zZ1NdS0SZNVs7PmcOLpRD0F168MasJdPLsPIR59NQZE7SokgsPqS?=
 =?us-ascii?Q?yKoSr/uHannQ9vcYkpYJiGpfEN/C9VrQi6XpfRiXd2d2Xzj0lkLz50E6JL2v?=
 =?us-ascii?Q?DXu7eWg5nf4TXtFB5yoKNqnjexMJeMilY3oet/Pv+Y+14nX88YpqEWAwf10d?=
 =?us-ascii?Q?ivpcXU8IF0edUH55DLDRJelWwtvx9+CigD36pgT0e1ytSWgJ9Qt3d+G6Y9/W?=
 =?us-ascii?Q?E3WfzD5xwiR59rY4g9stJzEMO7g0QuEhHL7+HLj4OT84W0npNNBRo7CWtOIh?=
 =?us-ascii?Q?f/rLQ7xk+9jjhJ/Y9NeNTc8Uzt+5grp0Qompy8P7M+aW/YbJuh5K9/wWCymM?=
 =?us-ascii?Q?IMpwt2Le4tmbHUfzWk2prX0WZ6NoQ7iGj9XCth2fC98jRSS6j4hDsRVCPj8Q?=
 =?us-ascii?Q?AkAiaprfger7CZpOq1+FOMYWcafy6D/ZcHhIm6vBJxJhCebqgZJrSUHCAM9c?=
 =?us-ascii?Q?GPqb1bJlTDmKN69Q0FnNCcBkCVTjNO5ITPuFJhg+OUR+PClB3S4Hez0/SKjw?=
 =?us-ascii?Q?3yUlQkau4yDIeMbD+0VO8AiUOTq23OGo6KM2HQmpPnZYT8DVXXpSP+RLIypq?=
 =?us-ascii?Q?mh3oAlgeuYmftX3vCtYgybE0gMcYKgzeAfJAP+uSE9eCFLettsxcqdjac+ht?=
 =?us-ascii?Q?goJeDoe4bkS8Vbl/nPcHEzhfJTqt33FDeXGylqL/ID/xAtjWyun12dGmhe2Q?=
 =?us-ascii?Q?MJejPDYTTlXDMTg48sgwUKxDGnnq7d63DHky7br55TQChRVXQKkdnPIPD/3u?=
 =?us-ascii?Q?0MZm2dfXjt+AJt8i+kfQWrf+DDViqX0efktsbc10ctOW797CnpAEPQgkhEyJ?=
 =?us-ascii?Q?WYR0qACt45GHA/IsGa5OqzDA1zTEmm1e7YASg6CGs0lwuHnVzqFwcI+SIUFr?=
 =?us-ascii?Q?A2ykXPBbKJWgq2xrSWD5WI4ftwUydJKN0nr2eoo/nPlXBd8Wc7I0VnBGElZK?=
 =?us-ascii?Q?n4Ieb0TKQ6ERShgvZkPLFxiOQlxENmHblmc+D9N4QO1z2EnzUeLpvWINDNzb?=
 =?us-ascii?Q?skmVdEiHSD9hzQse+6qzsUJdmkuSnD9oEVMABZM5x4f+2yKfUoGdkFxkBdzl?=
 =?us-ascii?Q?VrQhoCdPNiFGXuuM9RVDZrMIgSK20mKQGGL3TfxI2TYgZyZDIZ/9sDo4kYCL?=
 =?us-ascii?Q?Uo9muZJ8s5dGM+c4uvAOpjoiyvA4HpiQWWh+Z0sZd8ycu+kpClT2e882Ht1N?=
 =?us-ascii?Q?ycuNOy+wca5ZaA5dxpd6LJpr7eR70A3ABCTe+Fx78hgJ4HzJ6m6AknLEmw0c?=
 =?us-ascii?Q?XYwt/XkUHPalMqc0oX/yc2t1tnkctBY00fC0wP73374xWvGqazgxz52DTOS7?=
 =?us-ascii?Q?KLZZUwlTl9OBAcNC409Du8hvEK6LrVJ0DEOtsxWK0DDc8DS7G+/GtsIOfhKp?=
 =?us-ascii?Q?ta0g/81hZdoypo7qR5qcvYDyze0J3YDsEwoAE7fOCGRM7fnFisVXhdEGYIun?=
 =?us-ascii?Q?0y91KjiEsoOItsgjsNYQ4jjVXXcaY9yiL3ajfvyhVW5HGx4UQtkjIUT5Rx5M?=
 =?us-ascii?Q?26k12QYCU30d6L+WyaO4I43iXh6MHLOsToxGnwt9WaLw56Sz1/2utrVJD/Oc?=
 =?us-ascii?Q?vPoWmzcQws301XT59JA/vXsym8uIC2N9anYd0epzp9WtbOFD9WF1n8LcKJn4?=
 =?us-ascii?Q?SJVu8qvyC7fPyQrW8oSf9I5pCcKE81A6MsjAXdYYU2Io4wQSH1VYz9dvYv/J?=
 =?us-ascii?Q?ug/5E0RdAQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef26b41-8b98-404d-0f6f-08df3b2d4cfc
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:46.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ueae9j/vKnb4UAuxwacxDz4Zy36Pj0JtiNtE7sxE2oRb1y91S5LZY06TsP/MaPCdvwR8A8yUfDB0dPARE+aPZSYH7AxFVk+Ry0n2HC4DesU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF0806ED8F1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249535
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Also build systemd-hwdb so that we can generate hwdb.bin at rootfs time
with native code instead of using qemu-user. I've verified that the
hwdb.bin format is word-size and endian agnosic, so we don't need to use
qemu.

Add a patch so that source file names in the hwdb.bin have the rootfs
prefix stripped, so that build paths don't appear in the final image.

This does mean we have to hardcode prefix=3D/usr sysconfdir=3D/etc as the
target paths, but systemd effectively mandates these so hopefully this
is not a problem in the real world.

Partially based on work by Daniel Turull.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a7c2ddd739db59bc14d781aa919bdd4724b365e)
Note: kept ":executable" and our systemd-sysv-install do_install; keeping t=
he
strip-the-root patch since we're still on 259.5, dropped in the 259.10 upli=
ft where it's already upstream

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../systemd/systemd-tools-native_259.5.bb     | 24 +++++++----
 ...oot-from-filenames-when-generating-h.patch | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-r=
oot-from-filenames-when-generating-h.patch

diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/meta=
/recipes-core/systemd/systemd-tools-native_259.5.bb
index 89b5220e3e..d8d0eae009 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -4,6 +4,8 @@ require systemd.inc
=20
 SUMMARY =3D "native tools from systemd"
=20
+SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
+
 # We don't actually need jinja to generate code, but it's checked for at c=
onfigure time
 DEPENDS =3D "gperf-native python3-jinja2-native"
=20
@@ -12,19 +14,23 @@ inherit pkgconfig meson native
 # Disable everything that is auto-detected by default
 EXTRA_OEMESON +=3D "--auto-features disabled"
=20
-# Link systemctl statically
-EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+# Link the binaries statically as we don't install libsystemd-shared.so
+EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3Df=
alse"
=20
 # Ensure unused build paths are not in the binary
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
 EXTRA_OEMESON +=3D "-Dpam=3Ddisabled"
=20
-# Systemctl is supposed to operate on target, but the target sysroot is no=
t
-# determined at run-time, but rather set during configure
-# More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
-EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+# Target-absolute paths that satisfy both tools from one meson configure:
+#  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
+#    (/usr/lib/udev) matches the target rootfs layout, letting
+#    "update --root $D --usr" find hwdb.d sources and write hwdb.bin there=
.
+#  - systemctl needs sysconfdir=3D/etc; it operates on the target rootfs b=
ut the
+#    sysroot is fixed at configure time rather than run time.
+#    See https://github.com/systemd/systemd/issues/35897#issuecomment-2665=
405887
+EXTRA_OEMESON +=3D "--prefix /usr --sysconfdir /etc"
=20
-MESON_TARGET =3D "systemctl:executable"
+MESON_TARGET =3D "systemctl:executable systemd-hwdb:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
=20
 do_install:append() {
@@ -34,4 +40,8 @@ do_install:append() {
 	# with version 259 of systemd and then this, and everything that was
 	# added along with it, should be reverted.
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${b=
indir}/systemd-sysv-install
+
+	# Can't install this with a tag "hwdb" also tries to install the hwdb
+	# itself, and there's no separate tag for systemd-hwdb.
+	install ${B}/systemd-hwdb ${D}${bindir}/systemd-hwdb
 }
diff --git a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-fro=
m-filenames-when-generating-h.patch b/meta/recipes-core/systemd/systemd/000=
1-hwdb-strip-the-root-from-filenames-when-generating-h.patch
new file mode 100644
index 0000000000..f11199c553
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-from-filen=
ames-when-generating-h.patch
@@ -0,0 +1,40 @@
+From 0031715c560e8138cc320f017a0a2c7160b1f7fe Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 17 Jul 2026 17:25:31 +0100
+Subject: [PATCH] hwdb: strip the root from filenames when generating hwdb.=
bin
+
+The modern hwdb.bin format contains the filenames of the input data that
+makes up the database.  This is useful but in offline builds where
+--root is used, the filenames are the full build paths including the
+specified root.  This introduces build paths and thus information
+leakage and non-reproducible data.
+
+Solve this by stripping the root prefix off the original path when
+passing to import_file.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43062]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/shared/hwdb-util.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
+index b42681a289..5386b4e9f4 100644
+--- a/src/shared/hwdb-util.c
++++ b/src/shared/hwdb-util.c
+@@ -632,9 +632,11 @@ int hwdb_update(const char *root, const char *hwdb_bi=
n_dir, bool strict, bool co
+=20
+         FOREACH_ARRAY(i, files, n_files) {
+                 ConfFile *c =3D *i;
++                char *path_in_root;
+=20
+                 log_debug("Reading file \"%s\" -> \"%s\"", c->original_pa=
th, c->resolved_path);
+-                RET_GATHER(ret, import_file(trie, c->fd, c->original_path=
, file_priority++, compat));
++                path_in_root =3D path_startswith_full(c->original_path, e=
mpty_to_root(root), PATH_STARTSWITH_RETURN_LEADING_SLASH);
++                RET_GATHER(ret, import_file(trie, c->fd, path_in_root, fi=
le_priority++, compat));
+         }
+=20
+         strbuf_complete(trie->strings);
+--=20
+2.43.0
+
