Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064C5CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:01:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13086.1764061274055726105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=Zo5fpBHu;
 spf=pass (domain: phytec.de, ip: 52.101.69.77, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSrG7BFAUiuBJgxrva0hqNpmND6De2RMwsZWN6gcaQRryx/6sgXyKGNdXC7ylyUsAYmVNXlXlT+wGuHEq8/500POeJ+q7uW1Wv4lmqaXYw5q0CiMwOtgfO+R5fOnlOsHys6uEVsdUa3JIvH1yHXWEqtQ7W/51mqvp+/kzgDT9DqKSU3kN/P0j8QTghqIn69Exz5pPwSBu3YIyHYAjmqEHBmuIbPA9x7L104xpUEhe2WsUorRMahBQPKsqgwG8mA7xSYDfUnRUPfjInhkLQTgessZc6xpbppEVRv7coc4QoqCF7IW9KgNncBAAgKQlnqniQf6B3V5tFrLr2dF+dP8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPudlg21DL7Vjkga56z/u3Ugz3xChlOaK50ksOEDJAo=;
 b=Q3MR8pe3dTuH9Mm3spDObtdy01OVXnzt4hcwqqrpmAKucFQlgrSUGlBTcTeYWeapnTeftZyQK74khfIjq7UwgBjVLi5PGGUqgB+/BGJD7WSd9xynvphAEI49jnmcy98WRixdcqE0uSwlqF0luC26GCBptHFk64Z6YqbVOiTkU40TQUMuijN3BKLIAX7bu982EqJoQM4e2tnpfH0FOOMPWixT2yj7HiGmychqtSxGyHCUqhBCGZmtYGf+q+2PbaeqGU3i5/2Y/99zC9n2TFpzzKNBAGqBlfPrs0U+Zd90JxpD2peZ2Di06eppvjK8ZE8zMdwy0FHkQKQKvkOTKlj0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPudlg21DL7Vjkga56z/u3Ugz3xChlOaK50ksOEDJAo=;
 b=Zo5fpBHuny7jVa3JsRam1jn5xsc5+IID9tXO1lXTsjoeeXXLET9eOqSnxhJpQkIXW5mW7Oezhr9s9rCrK3e2k+unHAGCgbrWkbcXIQxY8QHszTE/474T80O3Lit/sZMeUckxZC29wiCkqWyACACXyHdQ7szn4av3gLXRNf0fOsMWLour0GWOc9LYYcZxBg873ZLm9j7MSf1cd7ME2kqAXvE7phxAQThX14w+xegGoiSYm3dzRQzmS6gtasue8aUVB6/HLOBXS0n3AvQL4uZ8zXc8D/yhbEgmREh8Funa68Qxh0IxYF36wPWaYDQC+Zmvg+WUnIebiqKpfepd+UJXdg==
Received: from AS4P189CA0035.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::14)
 by PRAP195MB1556.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 09:01:08 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::99) by AS4P189CA0035.outlook.office365.com
 (2603:10a6:20b:5dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 09:01:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 09:01:08 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 25 Nov
 2025 10:01:08 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock
Date: Tue, 25 Nov 2025 10:00:59 +0100
Message-ID: <20251125090059.3155853-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PRAP195MB1556:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd7193b-18bc-4478-1b89-08de2c012c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?30W2u3TZK5RL2/k3b1A3m8mxwhMti+orAv01MPdxr7fD/K82sEIHjUPbz5pz?=
 =?us-ascii?Q?vDQEtQHqfiDOMQnJBU5IObILGjKfu3UfE7vtPZ0r94FAnlCIXIzIAlqW5b4A?=
 =?us-ascii?Q?EWJL1bkubPjdLNnAx5Q9AbfJ+v2vrIKxFHAL7YIOYvDt4D3fVBDspre+h1tS?=
 =?us-ascii?Q?oe3G/UwbFAXusWDoRdozRJR8AlUvnzb5mKKHHg38U9eXwC+WWHrRAR4OWzOt?=
 =?us-ascii?Q?UMR+buI0TvqTXCdlnMa9ZlOUeBy5h4Ue2Aji01Bjne1bGZWtyWagP0xgNUwM?=
 =?us-ascii?Q?815cRM2O6GSx3TywKZJrUytmoRhTtzX5iA9jydZ2YW3SXpnkGunEU6Mxm71j?=
 =?us-ascii?Q?Hq/iuEoVyyAvUHQMOSK5/ogdyFFMgZqNSxiGPy98K6fqtMbWlGbdawOJVlge?=
 =?us-ascii?Q?GZyebXW1f2SPgjlKIYkd2UykELq6S++UpFa4jClSZYdRxuuMrCZMcrDojbxi?=
 =?us-ascii?Q?KAs+smStKNiTcw1fBVwQPsdrOg2JaVlnGGdDAoHsu6zlUah/V1tPU8qIsG2/?=
 =?us-ascii?Q?alY+O/3diqogBeT/SGZW58kJFxfBi5C7ZsYD+Jbuudk1bETZqaDPOP8IL0Io?=
 =?us-ascii?Q?exbZfZHOmfDGflfkL9d7hXKdTKtREFZ/p9KMiSKOIA0l/zrdS0Y09kpz3QBG?=
 =?us-ascii?Q?G7o2w/8eux/7tcjPbD3NjOipQ8Ji/FVl2dPXulrfK9tf2QeMC7wIZYXGu0BQ?=
 =?us-ascii?Q?sliw6nJn2TgpIESc7aECH23n1Anpklxynbk1K7NtogAWHkUpsfsbVX/5tj2A?=
 =?us-ascii?Q?TLaV8gL2vpt3o7qbGkVLvby9oZ7/m3W3CLiVmq0e8u8ye47ZyBOPkiEHPSIW?=
 =?us-ascii?Q?MsH1s3YG6TrXVL9YDNGTndPiWaVNLOTgHkji1yHlUjDA/ktLflf5HRlxiZ7Q?=
 =?us-ascii?Q?N7G7EMP9dZs4u4ECLkEWPHW3T4i2cgkTfn9S8Pb298xUpowUCQMXLe8rwGjY?=
 =?us-ascii?Q?WwL2va41LtsRsInSqvOheQ9C3zROnDc3aH+G0QG2Qi/DJ+Hy5nLERQDWwl6A?=
 =?us-ascii?Q?404Jo1mfU98/YUD5lYoPQL++CR8s3MOOvlkHE95xCMkA4C+428AgxPRWzkhA?=
 =?us-ascii?Q?3iHgiPCzzpM7pP7tTN0LIeH751ypPpRIrk1Vg3Gg13SwowiAjLCaNozFSQ6n?=
 =?us-ascii?Q?82hRf+EMdEpwTbxrq/RejW4ZBCBnV+u6eB6RLN9f2nZiGkxt/NyDSQEUEHm2?=
 =?us-ascii?Q?qpWmIEpakPM3Vzp7XkUQVsHUHYmKPQTADkBLrGkaRhObkT9up0e+Af0rJlre?=
 =?us-ascii?Q?yP0QJKmYiV/rKzEZKY00SHTjDeoHbsg5RSt6Flsof8TnQ/1LITL0nMUkesg6?=
 =?us-ascii?Q?tvHSFbIoOb6PljZ0tjww1iCoN26xTaL8WCCHoIyp7z+3kByb8bV8QosP7pjg?=
 =?us-ascii?Q?Df5EuEuBtKav2QphBDmpzOwqG7icgroDxdD5Ilw4oooJfCrstc0uU0MubhAT?=
 =?us-ascii?Q?nSGGtr61U92Uzjz4k+wrd0qADqxGN7sxf7+BQCF1Dhl1ilsqQA/MA5dpNWDD?=
 =?us-ascii?Q?mLHKPLasZD7yKOi7ozrkl2pWWpW8u7tyooz2wmLL6Pegx6tlwiZR2mG4d3SN?=
 =?us-ascii?Q?OO8NFyVHnaSW4ka3P5c=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 09:01:08.4366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd7193b-18bc-4478-1b89-08de2c012c68
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP195MB1556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226757

Do not fail if only some Cargo.lock files are empty. Only fail, if there
are absolutely no dependencies found in any Cargo.lock.

This fixes the following error message, which would occur with "bitbake
-c update_crates python3-orjson":

    ERROR: python3-orjson-3.10.17-r0 do_update_crates: Execution of '.../py=
thon3-orjson/3.10.17/temp/run.do_update_crates.70693' failed with exit code=
 1
    ERROR: Logfile of failure stored in: .../python3-orjson/3.10.17/temp/lo=
g.do_update_crates.70693
    Log data follows:
    | DEBUG: Executing python function extend_recipe_sysroot
    | NOTE: Direct dependencies are ['.../sources/oe-core/../oe-core/meta/r=
ecipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:n=
ative:.../sources/oe-core/../oe-core/meta/recipes-devtools/patch/patch_2.8.=
bb:do_populate_sysroot', 'virtual:native:.../sources/oe-core/../oe-core/met=
a/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot']
    | NOTE: Installed into sysroot: []
    | NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native=
', 'cmake-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native'=
, 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-n=
ative', 'zlib-native', 'libedit-native', 'make-native', 'patch-native', 'pe=
rl-native', 'python3-native', 'bzip2-native', 'xz-native', 'zstd-native', '=
attr-native', 'gdbm-native', 'libffi-native', 'sqlite3-native']
    | DEBUG: Python function extend_recipe_sysroot finished
    | DEBUG: Executing shell function do_update_crates
    | Traceback (most recent call last):
    |   File "<stdin>", line 41, in <module>
    |   File "<stdin>", line 12, in get_crates
    | ValueError: Unable to find any candidate crates that use crates.io
    |
    | The above exception was the direct cause of the following exception:
    |
    | Traceback (most recent call last):
    |   File "<stdin>", line 43, in <module>
    | ValueError: Cannot parse '.../python3-orjson/3.10.17/sources/orjson-3=
.10.17/include/cargo/simdutf8-0.1.5/Cargo.lock'
    | WARNING: exit code 1 from a shell command.
    ERROR: Task (.../sources/oe-core/../meta-openembedded/meta-python/recip=
es-devtools/python/python3-orjson_3.10.17.bb:do_update_crates) failed with =
exit code '1'

After this change, a working crates include file is produced and warning
messages are output instead to inform about potential issues in the
corresponding project:

    WARNING: python3-orjson-3.10.17-r0 do_update_crates: Unable to find any=
 candidate crates that use crates.io
    WARNING: python3-orjson-3.10.17-r0 do_update_crates: Cannot parse '.../=
python3-orjson/3.10.17/sources/orjson-3.10.17/include/cargo/simdutf8-0.1.5/=
Cargo.lock'

While at it, restructure do_update_crates() to be a real Python function
and use the corresponding code directly inline.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../cargo-update-recipe-crates.bbclass        | 91 +++++++++----------
 1 file changed, 45 insertions(+), 46 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 3251d5ef2e..589f497680 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -23,59 +23,58 @@ RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_update_crates"
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??=3D "${S}"
=20
-do_update_crates() {
-    TARGET_FILE=3D"${THISDIR}/${BPN}-crates.inc"
+python do_update_crates() {
+    import tomllib
=20
-    nativepython3 - <<EOF
+    target_file =3D d.expand('${THISDIR}/${BPN}-crates.inc')
+    cargo_lock_src_dir =3D d.getVar('CARGO_LOCK_SRC_DIR')
=20
-def get_crates(f):
-    import tomllib
-    c_list =3D '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
-    c_list +=3D '\nSRC_URI +=3D " \\\'
-    crates =3D tomllib.load(open(f, 'rb'))
+    def get_crates(f):
+        c_list =3D '# from %s' % os.path.relpath(f, cargo_lock_src_dir)
+        c_list +=3D '\nSRC_URI +=3D " \\'
+        crates =3D tomllib.load(open(f, 'rb'))
=20
-    # Build a list with crates info that have crates.io in the source
-    crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('sour=
ce', ''), crates['package']))
+        # Build a list with crates info that have crates.io in the source
+        crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('=
source', ''), crates['package']))
=20
-    if not crates_candidates:
-        raise ValueError("Unable to find any candidate crates that use cra=
tes.io")
+        if not crates_candidates:
+            bb.warn('Unable to find any candidate crates that use crates.i=
o')
+            return None
=20
-    # Update crates uri and their checksum, to avoid name clashing on the =
checksum
-    # we need to rename crates with name and version to have a unique key
-    cksum_list =3D ''
-    for c in crates_candidates:
-        rename =3D "%s-%s" % (c['name'], c['version'])
-        c_list +=3D '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['v=
ersion'])
-        if 'checksum' in c:
-            cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rename, =
c['checksum'])
+        # Update crates uri and their checksum, to avoid name clashing on =
the checksum
+        # we need to rename crates with name and version to have a unique =
key
+        cksum_list =3D ''
+        for c in crates_candidates:
+            rename =3D "%s-%s" % (c['name'], c['version'])
+            c_list +=3D '\n    crate://crates.io/%s/%s \\' % (c['name'], c=
['version'])
+            if 'checksum' in c:
+                cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rena=
me, c['checksum'])
=20
-    c_list +=3D '\n"\n'
-    c_list +=3D cksum_list
-    c_list +=3D '\n'
-    return c_list
+        c_list +=3D '\n"\n'
+        c_list +=3D cksum_list
+        c_list +=3D '\n'
+        return c_list
=20
-import os
-crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
-found =3D False
-for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
-    # ignore git and patches directories
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
-        continue
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
-        continue
-    for file in files:
-        if file =3D=3D 'Cargo.lock':
-            try:
+    crates =3D d.expand('# Autogenerated with \'bitbake -c update_crates $=
{PN}\'\n\n')
+    for root, dirs, files in os.walk(cargo_lock_src_dir):
+        # ignore git and patches directories
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.pc')):
+            continue
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.git')):
+            continue
+        for file in files:
+            if file =3D=3D 'Cargo.lock':
                 cargo_lock_path =3D os.path.join(root, file)
-                crates +=3D get_crates(os.path.join(root, file))
-            except Exception as e:
-                raise ValueError("Cannot parse '%s'" % cargo_lock_path) fr=
om e
-            else:
-                found =3D True
-if not found:
-    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DI=
R}")
-open("${TARGET_FILE}", 'w').write(crates)
-EOF
+                c =3D get_crates(cargo_lock_path)
+                if c is None:
+                    bb.warn('Cannot parse \'%s\'' % cargo_lock_path)
+                else:
+                    crates +=3D c
+    if crates is None:
+        bb.error(f'Unable to find any Cargo.lock in {cargo_lock_src_dir}')
+
+    with open(target_file, 'w') as f:
+        f.write(crates)
=20
-    bbnote "Successfully update crates inside '${TARGET_FILE}'"
+    bb.note(f'Successfully updated crates inside \'{target_file}\'')
 }
--=20
2.43.0


