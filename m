Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16008.1794916312290085460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fwFz5+ym;
 spf=pass (domain: est.tech, ip: 52.101.72.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwz+dWMsVoKL7jjJeD3o3m1BtgDzu60CwdHyXcif0SbLjjNoEgwJMuq2zDBRzxFPjDFu5kcKKN7TNGqpLrvtSv0e1MIy0i2mz0yMqS3eyinX9J/FyAeDZkEa4bGJRIvUsBE0/W7ZrRBrBEO2TgQIvBtkBGVvzcRY//AL00zHOBre6Mqyh2Bn2PR3rZsnrYaO9/GxEfNrzQAgE+83p058cocCwVrsMzOwNtOT+r6rZaFoN4eDyVbytFvROBUus0630dVYOnBYs/+Wj4uAbl3Lzeagb68nbaiJmCDe/qGnsu7bkhmbQNoKhohMs8tn9Jf3A7dEh//aDuea4KeJRvTRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2muKaHGixE0KKEH/0yR5GyPM+ozIjyW0wAgxPqSPJqA=;
 b=k2MQ1P49nrOkmxKp+KxXfcTO5HcNutm+4hZXPlG5yLBiEHN4SvZB264vFt3VadoxtPLfmLmJECLc3oIPj8fDNZyvWUjPRR6oOUMxPCxmwKPRP/KJDK0IGuntZ90yzgpFrsSb72q1syxBZYHpucc+/DpyORGa2ziizwc4k4yKr07d/iCFUeIyXAOTPITlca+OMu6K+iU3IZ7LjznCbZSu2s1s8HydGXCQFplPS5r+GDzR1ckL8sQvxNtr2z7nHYtzRiK6cFPim8h79virEY0Hdu6a+yISNQOCeYjU7bUBkoTQS9pN1QOvVxrg4PpLlw2V58xBIoN1P1YYA3HDlQgD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2muKaHGixE0KKEH/0yR5GyPM+ozIjyW0wAgxPqSPJqA=;
 b=fwFz5+ymh23fpDOo3ScrObv5FJ2qXOy6v9FwA70D6M/hLJmERvlWuwVrs7YMaZNXvWqTmBuKaa3ZZwovsnk9XN4jqqELZALTtWRtmT7XlED3dljglWRZQRuhLegHBBr+gcRtVhR61KWobPujTt2eM34X/vUiyASrGx/jbsnLxn6nd0PoYjWFYQsBWXJLiKKLDemxJ9Uk+yWwY72ARUyde5YauGUImOZMOUEPPVnwCrSd+22a0MMYjhSgkZvjJCNJpDfKx0goCawXVv2JI9fEog1fv7G1MDXULh6k9Yzw9UcsVcWKoQHOfr/fMFj84/qdzU4z/Pizhu/jgjHrmeOX/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 6/8] systemd-systemctl-native: add systemd-hwdb
Date: Tue, 17 Nov 2026 12:51:24 +0100
Message-ID: <20261117115126.14374-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: b72c040c-5c2c-4bad-31e2-08df44a12312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|13003099007|260925022911599003|11063799006|260925021911599003|56012099006|260925021311599003|261028144727099003|261102123227099003|261022115727099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: p9h7eosbLa+Vk3nNmiYgWoV8IrDrfO4mQTOWAQIWTYhLw7iyV5gdvPlO/AORfcUNhJ1OvjH8PlX81zl0Qf4Q921tDS6GsC5g8XMg9J5+n6XLO+nWSMYyS65IOn0X1MaTmEJY1BWD6nh2fzJAT53uqYfP1CK64Q5Ns+A6O+mi6gc94hcw67IYp/de2WyDFQflifKYHaDY3Um0ozFd3KvRp6WOhzlosGkE4JKox8Tk1YD+x29sgoZIDaMQxKX8Y2HFh94g69dRHR4YAAFNIn6XK66hv7gXlfVxgI81jmRTDQrocifFrHUSeIb0kIhktfmRHFjw4eFvNds+FETU+yOzZtfnCLkHMX3pbAj24bDJlepeoF4zJyswNSt5agoHeUGFXn7LcXjvAG7kebLkpviBOJsblhY/DiMW0HG9p6PnZHqinfJRgBUfiEDUE4b/FpxdzMM6iZSL0acAWhDAkWVtJjmV5FtDYG0umIr0NbeylYVECUyD51/lbJETthp8L85oVEhqOcb71kjqSB3+AmP+ouU5usmZ3BjF3zp4/9iRPnNt//kr2FH6Oqy+UHogq8GlCQ/JpiEeUpT26RY172lzkmFuAfdtfWiA/f63qZgZs+LnW3FgIsjeoZ5RzUYfKpo7hp2m2b8S/9iTpf9EaHinHNl64RKHBltbRZarMLC6HkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(13003099007)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(260925021311599003)(261028144727099003)(261102123227099003)(261022115727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBSJHGE3udvP6KxUftwfzGn77VDFN513cTWhD4kgxfR49wyqzKXVPb+JEIOc?=
 =?us-ascii?Q?7b9Zt2TiiTXWjahwQeptzASOQTF60ilQd6aSaCtSBIGt0DQhbG/hYi3GCqXy?=
 =?us-ascii?Q?xYjR6gFIZhHfO9E9rBeKaEUXSoBX0aMHy9zJFt0j1QM1Y/378unX69Xl8FZh?=
 =?us-ascii?Q?X4hYlahezuDEBIRLNHEyowX1ZPMBt36YFAo9ltcyJ2346RWseV8Po7W7qig8?=
 =?us-ascii?Q?yjGUqzX3HjkoEhLbqMJknzWsi0jcy86kb5YfS7fOdwbmH0HvtJkF1gzc4dem?=
 =?us-ascii?Q?N4XUj7u3uv9XHSw1bVxBMYiscDT7K2cl9kNca40+ydVX+g10ykuPg45ENb0o?=
 =?us-ascii?Q?7DZJ/ULxikvFU4v8+9cswYc0Q2zSP9qRK9i4HL1cswRwIxXa3O5fmGf8G4SS?=
 =?us-ascii?Q?/nfQDicALOhp40928TEogQvFPzfjvXhKjezJSF2C/QKDjO0p5t9MTSTcz9CC?=
 =?us-ascii?Q?hoW0TA+Rz8Ytkwtwp/A3Rxweri8aXtXFF2GhI7+zNfc8/NwIYerWeSBcpDvh?=
 =?us-ascii?Q?LbBJjNPyysAqpLtFMjGRS8QK0Ga3j3e8kTT1MXHjUSil0e/IsSm/gaS/z5TM?=
 =?us-ascii?Q?h0+31AuFDJKWu6ry8Tgx9fY8MrgLJ39a587F3Tic7cg7c2xJS4oaP0rNFZzA?=
 =?us-ascii?Q?SZLSKllzk/errl7TEwSGA+2E9Rk6o70KCbQe5eGRP3cWLnteNaOhUvuq/7IC?=
 =?us-ascii?Q?agoGpRRVyS6YOUJUz/djT4Uxmdv+JXTWTqgV+gRtzSj4kbQ9DnreAh28yiuG?=
 =?us-ascii?Q?NqVVVyOgjJQ1kctYmN/8ZHjFeqCBbcxXa4zBcQ6Zvn8z7kdX0jPdbXneGO2C?=
 =?us-ascii?Q?C474QkiXIgT2GoW6Lkm+qpW7ZodO4WDSm2sbQnfc5oI+oTGXa9+8KYVkEyEW?=
 =?us-ascii?Q?0+K4zIRE5Cz1BqILqlc656uJej3Klw0+mQ+CejU7qBP3lqs+UNbnegbxdraY?=
 =?us-ascii?Q?P7I4ivMRfZoicgQrZFFS5Am5psqcSyk5jvaUkVYbjwFBf2nxX1wVDBlg54Uc?=
 =?us-ascii?Q?Rx0dwqFgAPN9i+k9ij9ZkNcSpaLoxdH/IbIQMwpwQ/2To2hH/9Bb0fFCn4ru?=
 =?us-ascii?Q?gzOmixpd4t52+H+Tpxaxo2HMy5ax2PExp6x9Kv/uBkXZfsC5ncfKy6mcXwHT?=
 =?us-ascii?Q?+4aGBOQqZd2ZlMzr8uX3vUfv0M833IiSlXcpkyeaKbj+d/f4zleFyGhbizfo?=
 =?us-ascii?Q?hXOfJYio/Z2VyNsFp9KHymCh0v9dpysaXUvObaMO6POHzAKbzX1c7o10Cihs?=
 =?us-ascii?Q?m0Fr5yYUK1ka0EAnVsTdvf+iPgKWnlqzEG+jdm18qm8EiPX6ToN0gpnBvFzd?=
 =?us-ascii?Q?6fSpNqUwUFsbPK9wH8R3JLYtdgeg1sCylGe0xb8GMy1UE65Vp+QWlpHLkVvZ?=
 =?us-ascii?Q?z1W+68kjVKkEp9YXfcbBfDF1HEozU6jYOC6Skh7EK+VKenGBz2HDhFFCqWdV?=
 =?us-ascii?Q?iM9CDWRJpXp7lQ57pUwaIMj6ZJYQ/DuFQvNARG0QuL8d8i6B+JFDwuOrS+vJ?=
 =?us-ascii?Q?Ow6B50UPjSGMwLa5DD80F0o1v/rF4Hnn1rexDBp1RUfjO97MaAaW/bjawsCC?=
 =?us-ascii?Q?Em6IaDtFyhNb/52NdG44MPYwpyc8lFeyJvjEgDcdgOFUKkTA4QHsUA6N1Edx?=
 =?us-ascii?Q?eiP6ekNZi81Fx9vTtp2OXUqXTJPDJxIuQ5UKhZSGWUxLfsqnvenyPZxEHZBN?=
 =?us-ascii?Q?1MYPmKELV5lgP1XqAQIOVc0Tgr1Xr3LackPLqgRSjwtxMoAR7rJfC3tUW4n2?=
 =?us-ascii?Q?6YRW8DkLng=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b72c040c-5c2c-4bad-31e2-08df44a12312
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:38.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN1u9fzMmhtMgkFpoK3rrK6k3RHR1DSesqJGBmloOKr6V9mXTnAvTaOrXldkUxjCSiB3Q1Van/dsJFj7YskpyxfFoP+zFFZL9ZbtMiKD6d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250430
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

Note: applied to the wrynose systemd-systemctl-native recipe (not renamed t=
o
systemd-tools-native). Kept our MESON_TARGET ":executable" qualifier,
-Dpam=3Ddisabled and the systemd-sysv-install do_install; DEPENDS is left a=
s-is.
The strip-the-root patch is only needed on 259.5 and is dropped again in th=
e
259.10 uplift, where it is already upstream.
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../systemd/systemd-systemctl-native_259.5.bb | 24 ++++++++---
 ...oot-from-filenames-when-generating-h.patch | 40 +++++++++++++++++++
 2 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-r=
oot-from-filenames-when-generating-h.patch

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
index 3c0dcd35a3..34f64e2eb9 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
@@ -4,20 +4,28 @@ SUMMARY =3D "Systemctl executable from systemd"
=20
 require systemd.inc
=20
+SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
+
 DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
=20
 inherit pkgconfig meson native
=20
-MESON_TARGET =3D "systemctl:executable"
+MESON_TARGET =3D "systemctl:executable systemd-hwdb:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
-EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+
+# Link the binaries statically as we don't install libsystemd-shared.so
+EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3Df=
alse"
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
 do_install:append() {
 	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
@@ -26,4 +34,8 @@ do_install:append() {
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
