Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06725C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:12 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=XA/m53Q3;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4W27XH/+xd9wC3fZ6iNxGT9yirEnfIFlJ5W22NQVnYcvUNvNAsFdKYSgTTVE3bCuPFhYhp/1Ylky/foIJEGFrQZRYOIqSJFjM6UfQxYXGmdp6VrGOfT7YNFknmSJNqCd4ZHFiJTHhfaXNPb2T5rJrOidHEV3UnaBA7bFEXosIVmzHgpt8RFrOcsMjbVEI+EkCc9IDlx4XxrqRPsxpkO26SSDnFxjqQf+cHE4re7KeVh5X1Nq6qKLqKP5hANrK2gc5qq3XxjifZAmrYiHmJP/1EdVB8Uof5aOvOtWQHkX3w4+1Ou/AoguJ0WfJ1MVAHhZv4anBKf1hjMJG9vvkHIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LCE44N0I8WJD181VgUoNvZCAOF0SXOVpATfCxtuT0Y=;
 b=atQVNr/WdC1nQ3nrwi2bMtX1nJL4DIkrQt0ytVubw/25goJNPlm0PyHqBXDr28GpclksXsHgG2Z8f8Ayw7N/HCPnek6xKc4zDwjg3213Uk2sPizW6MBmiCVsf7FvXMWOhewA1lw0aNv21pQkXfDXcLi9TYvNJNtr0LQXVqGtNw55KX7xg4oQVkXxV1fe+4jpuvPqNX6WlL3nvenjseEyDUUAwAziari2e8+RmYJ2oGW96u1Mik01GMhNGQQM63zAZhA96UO6I+pY7LqQ4fQlKLXhYJmepCr2deUGAi8UWChJtZrv8ofxEXRDHkaykt3nyxFO2YecOqiYQ31KR1Uz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LCE44N0I8WJD181VgUoNvZCAOF0SXOVpATfCxtuT0Y=;
 b=XA/m53Q3dAmYgLzEQD1KVFIDlniP31BSmGj/zHgyc6ACJCc9lPpKIHZO9il3yaQJ14dbzGWLDnFs9tjZSeqpg2/bUtNqxjUj76HLP9tmL7qVVk1MLmJa/Ddh1Uz8XIaS4biON8lOhfBKTbGTfCaTbQn3LgF5qsrOyeTSQXhyn24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:07 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:07 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 06/15] npm: Rework to use plain npm commands and avoid npm
 cache
Date: Wed, 24 Nov 2021 15:47:30 +0100
Message-ID: <20211124144739.2250-7-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56fc3e71-c086-438c-787c-08d9af596d33
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801D8152C19589A20C6A69FD7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WBaHi5DXN79SAJnFaptzm8H0h7vTi3U8KGow5FGmGew+LZh1QNBzAeKADHu4i/03Onkjb8gRGT7Ws7+6rrFk9Ter66Rm6JfxP9AagmoMx7lDC5Ia+1uZK2vYOQ9WpVTaiZupX8tNj14CVBa8fTy/PkTUQ2A4dfAtnO6WpzzgByq9ZYROprmFeqFrYVIhNad1SGtTYoQFr9973K7JrShpSWtykxitSyBHhyNDNpeNehxmX1hH7MMPelh0p2ompWMCcfOUDYx9ZVYm5PT8FZBnezzgPYzYNk7n5Vf1XnCVKDL4QO5q0e+1+I3c6dg58cksYdl0ALNAXtkvBfjABCnULjP6rOluzc5rcryInxqzXKMU/FrAVgUsGrQFDb9jrGxGFyaUBGTiLAxupSpCRJVBw+iZeKCeyRq2sleCLNbDqkgw60BHzX/oXSenIl2bByLIMZ/yi3YziyzzMTyYOUQpql7XK/VeebmunPLE1E1JGmJ9+eaUp95Tar2nqkVjR55rX3dffdsSKEu9tU8TqRutunxHftKIKYaGJnYXWVxtQ9v4zbSRZqTwzWMOGuszAUZiF4z3kBMMfyueqasUyXOod/mPbgiNjYw55ftj9K6xaqkc3nhRDR5TIW8on7sUv4k6HSrvL174ZaQTj28B2PNEpXKpVLvVL6n45U750BhB1QjN5DpgZdkxhr31BLMGpI4++bAmOi9J5NcKaWmvqMnsaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(83380400001)(186003)(26005)(1076003)(66574015)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(30864003)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wESrEOVTOdauf+aHqn27CDTzf/o5U1UBAjInuTD9nj0hDXbmWBFJsB4XyhD3?=
 =?us-ascii?Q?trFvk6OuBr9abf/qnzZClZqUVWAquL9fDbSTlOk6XdG4SY3+Akzi25Mw7kGJ?=
 =?us-ascii?Q?+BWZ41Q+pfbzI7zIO2iPJS6upfIcjyvQAA9usR9ybgqPPmqcOsIyRaYPpcGL?=
 =?us-ascii?Q?ZZL4CMkrG2ivOJDgySFnGOFcKuHieIY4k8a3Awkd8SO+e8T6LKkLd2adf8PQ?=
 =?us-ascii?Q?FWE/KIEVOc77+6hjbSPWmHa95TZUl895UIZHAZcm2ZwHxghKm/XtWNnOA9ya?=
 =?us-ascii?Q?wPSBmDGpk9Z59z9rTvF5TFUjT88jgE/Bf5sFGpaEDTy8FM9xPUJidjcNa9NG?=
 =?us-ascii?Q?AQh2u1C1piu2tUHawBqw8yh6KMDrmP5dlMqw+/OL9yTN02sD5sqhmGSlKyhC?=
 =?us-ascii?Q?cKPc8WWZEGlLdXskeseqkiVHYQwgm9xsZASGg2oMahlU/QC+OkdxbBDcln3/?=
 =?us-ascii?Q?8W9lWQ2x2tLKO0XL57lP1EhYQbTJIJLvwUFqaxu8SCh60oZYwBUB5nh2HJJT?=
 =?us-ascii?Q?plm0Bn0Gax70lKT7JxrdnOc49t8KVjH/h5y7/6SLUea7QWQz0Cbj8cQDvAAc?=
 =?us-ascii?Q?yxC8q4E+y4Da1HkyLHM2YpzUVVFkFYTthmAxrPzrC6VHJZJEE7gtgw/L27Fs?=
 =?us-ascii?Q?m/nVwf/UoVIz/J1MZqpcNvnxcuOs6K10GqFkSLF293hnqmVRtyy3jLdVnBtz?=
 =?us-ascii?Q?IlJ/ckR/kZFPA8lv5+R5gia7IqkIGtngyVFeiGsX/Zfez3RHjHJqSKjb5lXW?=
 =?us-ascii?Q?4i3Uih73fWCQEjI5diLu0pbGoRn15iVuyyRcVODZHCT/2GQJr2QCbxkGMMh4?=
 =?us-ascii?Q?LhP0QUas1tjBphx8PwakFKcd3jd4q9Y4qni895uNGPCbEHCiQ+IlmDoFTXbG?=
 =?us-ascii?Q?T1okKkGI4YhFqnltiQMhn4yz8u20BBNQ+v/lkK94dx7rxUhEZNM5vkhCS/iN?=
 =?us-ascii?Q?7iJ9LEbrU7oalR+jWGGiSgmhMM9irb++EFzMv9kIK4ebmya2V1FHHQjgC1ya?=
 =?us-ascii?Q?cvvWRbpGkpk63g0zIpc0mTpslFOR8DoIS8af5e8OSlliAjxNcgejE98tdzGZ?=
 =?us-ascii?Q?WCMSe5FWhpe1vra9aXbZDUPz4wYQxtT58FEob8iKvrNhLcw8cmnm1d2MmVRT?=
 =?us-ascii?Q?Icnb+sMzjZEQCT6PAIZcYPs0z2SDTNXSK74PSJfIqjR7vCJo0vCUmTaSJC3a?=
 =?us-ascii?Q?wCFZuoL3yvu1g0MQLmRS4kXLXN/txAx1EAMizttssBgoN32/6i36gCRuKXUg?=
 =?us-ascii?Q?7VZdCrhle9l/DIHSwD/DvmaEzhw7qIc3Ss+5vY1gPZpVph4fUu/uQE51K3Gg?=
 =?us-ascii?Q?PjmLfDRTGpkmpshrSJgyk7qtGILyW8zTu6ZC+g7lLX5clvm4aj3VHA8/Vkkx?=
 =?us-ascii?Q?LTrX7btCuGWpdHfJAepbvGYVHm07c5HsZVL8WE81V/0raAxRE0b8Z6Z8pd8A?=
 =?us-ascii?Q?8yJKCYI97JB7V2RnYcE2VhpK9S48gOC9eUQNPK7XD/4h8URQI0CxU0pbSNSH?=
 =?us-ascii?Q?rnhYL+oDvlbo12SR/fBQZP0ftGKWPv/mtKvVpp5LKXxUJazG4M7Vbzd6oclT?=
 =?us-ascii?Q?MlphsXcPuewAF5kr1/IBSeJ6IFWqHOODAsKPfoyULdeEPKq+57ugrE6L0AFz?=
 =?us-ascii?Q?tfqkkfQXuBQ7rHw1rwhCrPQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56fc3e71-c086-438c-787c-08d9af596d33
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:07.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2z/4ZxVtAuFbVJP3QqMDY5sz1crEioJhGwhggzY/hnbJIsQ60YBIojScvOZKL7AFM8mNK7bWSg/Y3W9qtDJanQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158697

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Rework the npm class to use plain npm commands and remove the usage of
the npm cache to speed-up builds.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm.bbclass        | 340 +++++++++++---------------------
 scripts/lib/devtool/standard.py |   6 +-
 2 files changed, 119 insertions(+), 227 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index ba50fcac20..cb22dc6998 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,7 +1,12 @@
 # Copyright (C) 2020 Savoir-Faire Linux
 #
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
+# A bbclass to install an npm package and build its dependencies.
+#
 # This bbclass builds and installs an npm package to the target. The packa=
ge
 # sources files should be fetched in the calling recipe by using the SRC_U=
RI
 # variable. The ${S} variable should be updated depending of your fetcher.
@@ -16,18 +21,29 @@
 #
 #  NPM_INSTALL_DEV:
 #       Set to 1 to also install devDependencies.
+#
+#  NPM_BUILD_PRUNE_FOR_PRODUCTION
+#       Set to 0 to keep installed devDependencies.
=20
 inherit python3native
=20
 DEPENDS:prepend =3D "nodejs-native "
-RDEPENDS:${PN}:append:class-target =3D " nodejs"
+NPM_RDEPENDS =3D "nodejs"
+RDEPENDS:${PN}:append:class-target =3D " ${NPM_RDEPENDS}"
=20
-EXTRA_OENPM =3D ""
+EXTRA_OENPM ?=3D ""
+EXTRA_OENPM_BUILD ?=3D ""
=20
 NPM_INSTALL_DEV ?=3D "0"
=20
 NPM_NODEDIR ?=3D "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
=20
+def npm_flag_dev(value):
+    if bb.utils.to_boolean(value, False):
+        return "--also=3Ddevelopment"
+    else:
+        return "--only=3Dproduction"
+
 def npm_target_arch_map(target_arch):
     """Maps arch names to npm arch names"""
     import re
@@ -43,247 +59,124 @@ def npm_target_arch_map(target_arch):
=20
 NPM_ARCH ?=3D "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
=20
-NPM_PACKAGE =3D "${WORKDIR}/npm-package"
 NPM_CACHE =3D "${WORKDIR}/npm-cache"
-NPM_BUILD =3D "${WORKDIR}/npm-build"
-
-def npm_global_configs(d):
-    """Get the npm global configuration"""
-    configs =3D []
-    # Ensure no network access is done
-    configs.append(("offline", "true"))
-    configs.append(("proxy", "http://invalid"))
-    # Configure the cache directory
-    configs.append(("cache", d.getVar("NPM_CACHE")))
-    return configs
-
-def npm_pack(env, srcdir, workdir):
-    """Run 'npm pack' on a specified directory"""
-    import shlex
-    cmd =3D "npm pack %s" % shlex.quote(srcdir)
-    args =3D [("ignore-scripts", "true")]
-    tarball =3D env.run(cmd, args=3Dargs, workdir=3Dworkdir).strip("\n")
-    return os.path.join(workdir, tarball)
-
-python npm_do_configure() {
-    """
-    Step one: configure the npm cache and the main npm package
-
-    Every dependencies have been fetched and patched in the source directo=
ry.
-    They have to be packed (this remove unneeded files) and added to the n=
pm
-    cache to be available for the next step.
-
-    The main package and its associated manifest file and shrinkwrap file =
have
-    to be configured to take into account these cached dependencies.
-    """
-    import base64
-    import copy
-    import json
-    import re
-    import shlex
-    import tempfile
-    from bb.fetch2.npm import NpmEnvironment
-    from bb.fetch2.npm import npm_unpack
-    from bb.fetch2.npmsw import foreach_dependencies
-    from bb.progress import OutOfProgressHandler
-
-    bb.utils.remove(d.getVar("NPM_CACHE"), recurse=3DTrue)
-    bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=3DTrue)
-
-    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
-
-    def _npm_cache_add(tarball):
-        """Run 'npm cache add' for a specified tarball"""
-        cmd =3D "npm cache add %s" % shlex.quote(tarball)
-        env.run(cmd)
-
-    def _npm_integrity(tarball):
-        """Return the npm integrity of a specified tarball"""
-        sha512 =3D bb.utils.sha512_file(tarball)
-        return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decode(=
)
-
-    def _npm_version(tarball):
-        """Return the version of a specified tarball"""
-        regex =3D r"-(\d+\.\d+\.\d+(-.*)?(\+.*)?)\.tgz"
-        return re.search(regex, tarball).group(1)
-
-    def _npmsw_dependency_dict(orig, deptree):
-        """
-        Return the sub dictionary in the 'orig' dictionary corresponding t=
o the
-        'deptree' dependency tree. This function follows the shrinkwrap fi=
le
-        format.
-        """
-        ptr =3D orig
-        for dep in deptree:
-            if "dependencies" not in ptr:
-                ptr["dependencies"] =3D {}
-            ptr =3D ptr["dependencies"]
-            if dep not in ptr:
-                ptr[dep] =3D {}
-            ptr =3D ptr[dep]
-        return ptr
-
-    # Manage the manifest file and shrinkwrap files
-    orig_manifest_file =3D d.expand("${S}/package.json")
-    orig_shrinkwrap_file =3D d.expand("${S}/npm-shrinkwrap.json")
-    cached_manifest_file =3D d.expand("${NPM_PACKAGE}/package.json")
-    cached_shrinkwrap_file =3D d.expand("${NPM_PACKAGE}/npm-shrinkwrap.jso=
n")
-
-    with open(orig_manifest_file, "r") as f:
-        orig_manifest =3D json.load(f)
-
-    cached_manifest =3D copy.deepcopy(orig_manifest)
-    cached_manifest.pop("dependencies", None)
-    cached_manifest.pop("devDependencies", None)
-
-    has_shrinkwrap_file =3D True
-
-    try:
-        with open(orig_shrinkwrap_file, "r") as f:
-            orig_shrinkwrap =3D json.load(f)
-    except IOError:
-        has_shrinkwrap_file =3D False
-
-    if has_shrinkwrap_file:
-       cached_shrinkwrap =3D copy.deepcopy(orig_shrinkwrap)
-       cached_shrinkwrap.pop("dependencies", None)
-
-    # Manage the dependencies
-    progress =3D OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
-    progress_total =3D 1 # also count the main package
-    progress_done =3D 0
-
-    def _count_dependency(name, params, deptree):
-        nonlocal progress_total
-        progress_total +=3D 1
-
-    def _cache_dependency(name, params, deptree):
-        destsubdirs =3D [os.path.join("node_modules", dep) for dep in dept=
ree]
-        destsuffix =3D os.path.join(*destsubdirs)
-        with tempfile.TemporaryDirectory() as tmpdir:
-            # Add the dependency to the npm cache
-            destdir =3D os.path.join(d.getVar("S"), destsuffix)
-            tarball =3D npm_pack(env, destdir, tmpdir)
-            _npm_cache_add(tarball)
-            # Add its signature to the cached shrinkwrap
-            dep =3D _npmsw_dependency_dict(cached_shrinkwrap, deptree)
-            dep["version"] =3D _npm_version(tarball)
-            dep["integrity"] =3D _npm_integrity(tarball)
-            if params.get("dev", False):
-                dep["dev"] =3D True
-            # Display progress
-            nonlocal progress_done
-            progress_done +=3D 1
-            progress.write("%d/%d" % (progress_done, progress_total))
-
-    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
-
-    if has_shrinkwrap_file:
-        foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
-        foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
-
-    # Configure the main package
-    with tempfile.TemporaryDirectory() as tmpdir:
-        tarball =3D npm_pack(env, d.getVar("S"), tmpdir)
-        npm_unpack(tarball, d.getVar("NPM_PACKAGE"), d)
-
-    # Configure the cached manifest file and cached shrinkwrap file
-    def _update_manifest(depkey):
-        for name in orig_manifest.get(depkey, {}):
-            version =3D cached_shrinkwrap["dependencies"][name]["version"]
-            if depkey not in cached_manifest:
-                cached_manifest[depkey] =3D {}
-            cached_manifest[depkey][name] =3D version
-
-    if has_shrinkwrap_file:
-        _update_manifest("dependencies")
-
-    if dev:
-        if has_shrinkwrap_file:
-            _update_manifest("devDependencies")
-
-    with open(cached_manifest_file, "w") as f:
-        json.dump(cached_manifest, f, indent=3D2)
-
-    if has_shrinkwrap_file:
-        with open(cached_shrinkwrap_file, "w") as f:
-            json.dump(cached_shrinkwrap, f, indent=3D2)
-}
-
-python npm_do_compile() {
-    """
-    Step two: install the npm package
=20
-    Use the configured main package and the cached dependencies to run the
-    installation process. The installation is done in a directory which is
-    not the destination directory yet.
+NPM_PRUNE_FOR_PRODUCTION ?=3D "1"
=20
-    A combination of 'npm pack' and 'npm install' is used to ensure that t=
he
-    installed files are actual copies instead of symbolic links (which is =
the
-    default npm behavior).
-    """
-    import shlex
-    import tempfile
-    from bb.fetch2.npm import NpmEnvironment
+B =3D "${WORKDIR}/build"
=20
-    bb.utils.remove(d.getVar("NPM_BUILD"), recurse=3DTrue)
+NPM_SOURCEPATH ?=3D "${S}"
=20
-    with tempfile.TemporaryDirectory() as tmpdir:
-        args =3D []
-        configs =3D npm_global_configs(d)
+export NPM_CONFIG_GLOBALCONFIG =3D "${WORKDIR}/npmrc"
+export NPM_CONFIG_USERCONFIG =3D "/dev/null"
=20
-        if bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False):
-            configs.append(("also", "development"))
-        else:
-            configs.append(("only", "production"))
-
-        # Report as many logs as possible for debugging purpose
-        configs.append(("loglevel", "silly"))
+oe_runnpm_plain() {
+    HOME=3D${B}/root npm "$@"
+}
=20
-        # Configure the installation to be done globally in the build dire=
ctory
-        configs.append(("global", "true"))
-        configs.append(("prefix", d.getVar("NPM_BUILD")))
+oe_runnpm() {
+    bbnote npm "$@"
+    oe_runnpm_plain "$@"
+}
=20
-        # Add node-gyp configuration
-        configs.append(("arch", d.getVar("NPM_ARCH")))
-        configs.append(("release", "true"))
-        configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
-        configs.append(("python", d.getVar("PYTHON")))
+oe_runnpm_pack() {
+    oe_runnpm_plain pack --ignore-scripts --loglevel=3Dwarn "$@"
+}
=20
-        env =3D NpmEnvironment(d, configs)
+oe_runnpm_rebuild() {
+    arch=3D$1
+    shift
=20
-        # Add node-pre-gyp configuration
-        args.append(("target_arch", d.getVar("NPM_ARCH")))
-        args.append(("build-from-source", "true"))
+    # Create symlinks for package executables
+    # because rebuild doesn't respect the dependency tree
+    oe_runnpm rebuild --ignore-scripts
=20
-        # Pack and install the main package
-        tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
-        cmd =3D "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXT=
RA_OENPM"))
-        env.run(cmd, args=3Dargs)
+    # Rebuild dependencies
+    oe_runnpm rebuild \
+        --arch=3D${arch} \
+        --target_arch=3D${arch} \
+        --build-from-source \
+        "$@"
 }
=20
-npm_do_install() {
-    # Step three: final install
-    #
-    # The previous installation have to be filtered to remove some extra f=
iles.
+do_generate_npmrc() {
+    cat > ${NPM_CONFIG_GLOBALCONFIG} <<EOF
+cache=3D${NPM_CACHE}
+loglevel=3Dsilly
+offline=3Dtrue
+package-lock=3Dfalse
+proxy=3Dhttp://invalid
+; node-gyp
+arch=3D${NPM_ARCH}
+nodedir=3D${NPM_NODEDIR}
+python=3D${PYTHON}
+release=3Dtrue
+EOF
+}
+do_generate_npmrc[vardeps] +=3D "NPM_ARCH NPM_CACHE NPM_CONFIG_GLOBALCONFI=
G NPM_NODEDIR PYTHON"
+addtask generate_npmrc after do_patch before do_populate_cache
=20
-    rm -rf ${D}
+npm_do_configure() {
+    :
+}
=20
-    # Copy the entire lib and bin directories
-    install -d ${D}/${nonarch_libdir}
-    cp --no-preserve=3Downership --recursive ${NPM_BUILD}/lib/. ${D}/${non=
arch_libdir}
+npm_do_compile() {
+    # Create a tarball from main npm package
+    # to respect ignore files and files property of package.json
+    cd ${B}/pkg
+    tarball=3D$(oe_runnpm_pack ${NPM_SOURCEPATH})
+    [ -n "${tarball}" ] || exit 1
+
+    # Unpack main npm package
+    mkdir ${B}/lib/node_modules/${BPN}/
+    tar -xzf ${B}/pkg/$tarball --no-same-owner \
+        --strip-components=3D1 -C ${B}/lib/node_modules/${BPN}
+
+    # Copy npm dependencies from sources
+    if [ -d ${S}/node_modules ]; then
+        # Copy sources without preserve mode and ownership
+        # to prevent ugly file permissions
+        mkdir ${B}/lib/node_modules/${BPN}/node_modules
+        cp -a --no-preserve=3Dmode,ownership \
+            ${S}/node_modules/. ${B}/lib/node_modules/${BPN}/node_modules/
+
+        # Prune dependencies for production
+        if [ "${NPM_INSTALL_DEV}" =3D "1" -a "${NPM_PRUNE_FOR_PRODUCTION}"=
 =3D "1" ] ; then
+            oe_runnpm prune --only=3Dproduction
+        fi
+
+        # Rebuild dependencies inside node_modules folder
+        # to create bin links in .bin folder
+        cd ${B}/lib/node_modules
+        oe_runnpm_rebuild ${NPM_ARCH} ${EXTRA_OENPM}
+    fi
+}
+do_compile[cleandirs] =3D "${B}/lib/node_modules ${B}/pkg"
=20
-    if [ -d "${NPM_BUILD}/bin" ]
-    then
-        install -d ${D}/${bindir}
-        cp --no-preserve=3Downership --recursive ${NPM_BUILD}/bin/. ${D}/$=
{bindir}
+npm_do_install() {
+    # Copy the entire main node_modules directory
+    install -d ${D}${nonarch_libdir}
+    cp -a --no-preserve=3Downership ${B}/lib/node_modules \
+        ${D}${nonarch_libdir}/
+
+    # Create symlinks for package executables
+    if [ -d ${D}${nonarch_libdir}/node_modules/.bin ]; then
+        install -d ${D}${bindir}
+        for f in ${D}${nonarch_libdir}/node_modules/.bin/*; do
+            name=3D"$(basename $f)"
+            link=3D"$(readlink $f)"
+            target=3D"$(realpath -m --relative-to ${D}${bindir} \
+                ${D}${nonarch_libdir}/node_modules/.bin/$link)"
+            ln -s "$target" "${D}${bindir}/$name"
+        done
+        rm -rf ${D}${nonarch_libdir}/node_modules/.bin
     fi
=20
     # If the package (or its dependencies) uses node-gyp to build native a=
ddons,
     # object files, static libraries or other temporary files can be hidde=
n in
     # the lib directory. To reduce the package size and to avoid QA issues
     # (staticdev with static library files) these files must be removed.
-    local GYP_REGEX=3D".*/build/Release/[^/]*.node"
+    local GYP_REGEX=3D".*/build.*/Release/[^/]*.node"
=20
     # Remove any node-gyp directory in ${D} to remove temporary build file=
s
     for GYP_D_FILE in $(find ${D} -regex "${GYP_REGEX}")
@@ -294,9 +187,9 @@ npm_do_install() {
     done
=20
     # Copy only the node-gyp release files
-    for GYP_B_FILE in $(find ${NPM_BUILD} -regex "${GYP_REGEX}")
+    for GYP_B_FILE in $(find ${B}/pkg -regex "${GYP_REGEX}")
     do
-        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${NPM_BUILD}}
+        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${B}/pkg}
=20
         install -d ${GYP_D_FILE%/*}
         install -m 755 ${GYP_B_FILE} ${GYP_D_FILE}
@@ -310,6 +203,7 @@ npm_do_install() {
     # using /usr/lib/node_modules as install directory. Let's make both ha=
ppy.
     ln -fs node_modules ${D}/${nonarch_libdir}/node
 }
+do_install[cleandirs] =3D "${D}"
=20
 FILES:${PN} +=3D " \
     ${bindir} \
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 01fb5ad96f..10dc2b1373 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -260,10 +260,8 @@ def add(args, config, basepath, workspace):
                 f.write('}\n')
=20
             if bb.data.inherits_class('npm', rd):
-                f.write('python do_configure:append() {\n')
-                f.write('    pkgdir =3D d.getVar("NPM_PACKAGE")\n')
-                f.write('    lockfile =3D os.path.join(pkgdir, "singletask=
.lock")\n')
-                f.write('    bb.utils.remove(lockfile)\n')
+                f.write('do_configure:append() {\n')
+                f.write('    rm -f ${NPM_PACKAGE}/singletask.lock\n')
                 f.write('}\n')
=20
         # Check if the new layer provides recipes whose priorities have be=
en
--=20
2.20.1


