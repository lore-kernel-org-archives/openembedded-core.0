Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFB6CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:59:43 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12593.1779436772187511780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=mQjkEo0N;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.72, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqWzaWI48omNFKBcy2PZ1duKdFI6yYs8Ti0zHdjnVMavfMhXmuEHxgKMgYEx6b+IHrf4ufTOIeZwdD/RC0+SRx8HBqE/BQmWxxbCEjX75vvBMJvt3jqisdmhmO1bOvRcmIlDfisZzLZmqMLgefsh4UmwH9P8xdvGUnbT2+zqZAwkk5uMOQgvdGTRbvvnR2Dasf+8tNE3Zgr9U8Uv+zhoSL7jBGd4QhgkK3vn0lbX5LFY5CyRIjhBa5Eo4qloMC6KuBQDsvQixNPUCa7GLmNxc1NoQlK6bFMz6eueC4Z80lD0fw/CK+BwVo1+VnNQlfDooKmxMNWBtX0bF7RSfBfgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOJflKtXjsOb7Gt8xD6R3ZfqzVqf+e0pdRe0sKo6u2w=;
 b=UOr4yFIuliq5xSHv/fKm6FM2aHQ3WgiJlqcqAdTi+cO26YTk12wLnXwOHU7GWui9RxAeMZWQl0DGVnNXC5xb+hS+evXOgJpNwpvShYO47QVAa0+4jqJH0LK5yCs2xzR3O7GCyd11SuPXStad4ogbop0kS3I8ITcGjhQnm5o1IXdq9mJ1Nu/T8vmvR7q0O0rdLcK8fPOxEUzy2Z+j/M7Tfl7WbqiZxkHJuvbnDO7zzqoY378gP+BhH3P5p6Vm/H2l734kRz8T3UR7dIZQF4qr4MsuIWdIHHSBBz78Zz49Cu/hCHAxwvcmVXtZqW4Z+t2Bd17p4Q/AuyXrDAu4Jpfp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOJflKtXjsOb7Gt8xD6R3ZfqzVqf+e0pdRe0sKo6u2w=;
 b=mQjkEo0Nl1inl5Eb/K9c8QP4A7Kr5vpcd/XVQA+ZymHPAJP12YwRaXxQm6qqgDpp+fo+rv40ajrtzjQlvkOjUnH2KUJl55Fg5w4C3CDYRmoLb3XA3Ij/P6y1F42qrOJPj8eWpJ6IXdaVGtwOIakvgybRLVdZW1yny4TjPhmwrTEzXCp/e0HVlwgytCk8bGtGnhwXNjMjrvelcv4j/Ohypc0hfzNsAd+9Njz8UcXG5VuU2R4258C0CUpzV2CioUB59bPwuzM2IH8jFz9bwuTfoC1TQELMTFwQ7GZ/4yRClH4I1Wmbg8hwPDBM4XaxztEKelSHu5g7ECYwnGCHNpJZgA==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB6118.apcprd06.prod.outlook.com (2603:1096:101:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 07:59:27 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 07:59:27 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v2 1/3] scripts/scriptutils: Convert nested git repos to
 standalone clones in devtool workspace
Thread-Topic: [PATCH v2 1/3] scripts/scriptutils: Convert nested git repos to
 standalone clones in devtool workspace
Thread-Index: AQHc6cDpkx1GNxcQdE66YMMPIW/zNQ==
Date: Fri, 22 May 2026 07:59:27 +0000
Message-ID: <20260522075925.2381158-2-jamin_lin@aspeedtech.com>
References: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB6118:EE_
x-ms-office365-filtering-correlation-id: d0b742db-ed68-400c-f417-08deb7d80c2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 
 orEXoNLubj/yRBxSHwSibQV5goEHiQbxh9QL1W3D36upf84Iz2pdS9mAu77qi2+NpFCp8JU8RTYbT9OdZVMgeOSLMPLFmrD1avY+Tf2IikTCrJWuF6brPvHZ15E/kGdYDr0SdPKKCkDBDJ5Om4a+PZQDtqdNkOL79h4G+g/u+ZIPlDAl6FHmbWsHIsiGwhHAS8+Hn0zY5SqjTVw61aoi2Lt9wY7kuQa8FBFxFRmxo/niJ0fElshN6uCkLtFiEoW+lIBj+ObujrxPbF6+wXKoYH80+Hu3Tdr1ivy8CfnQSF6JtlNqpsSoARpUGLZnyCfRal8N0bV9H94PwyobrNMVDwMlSxk+lFj4UuCdQ7AgiJjbZs5hLvsShLqyO/FsAYssQ2kyTNO77tuP0dZJEnjksiQqZKt2PNltkXYDAqA1zrbJCpWhDEpsVm8vPHOOBtaHt2wyEodNEouRmK9V2GOFIumWBjbZygvI1uEFWnEXpOwHxBHmzg3GgjzpbXXQ6Yq+dhw6eDg2KXS0SW8SJc3iLhVz2tiL5/kUBSwfsMlDzLBEyjF7Zx8V/55AeD46B35GXImWsF9sHadpOmL5tnOOfQes/xWVLzqDXpP5sq/MhyswS9pe9OXdn35HSG/N4M2bs7YHbKd1b9Z51V4tpMcZKzeLpf4XKjTTl3qBm9YM0gcJZV4aKgvv3R0C4GzWvh/J+HLIb44MFdMl93PttdYCpGh6Kvv0RdEnJ2LdIwXwSAsajQzXqQF04nY8gXjAbJCJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ebTfAsHrF9Uwlm4vawO0WADWaENZd/9uEL0msFNkpylrDIEPcjtZVLJLygM3?=
 =?us-ascii?Q?jYtlHWrs9E0jLwsyNWvNlqnvcncrhxDHs6ppvsFo4eaatT3iwF5ZSykHslLH?=
 =?us-ascii?Q?pAfWfIMUsbCBraoHdue8j1FKzIExct98kmcSi2iIC87bBr5EM19xgPO4JMjB?=
 =?us-ascii?Q?39YRpJ8q6vnRdal2YFsERV5PPobgR7DEB8lPyX6LbnG0q9/mHe8LtOX/ylv5?=
 =?us-ascii?Q?x4aWPQQuFRqH4whuUctGT5t62dzqIE0g7hQap9onw0e6O61xtgv6ivSspZ2k?=
 =?us-ascii?Q?FbIhow/P/tVaXWpLkup9zXOmoFV9odqfkFwD2iD4jVviYsDZdVQ7wFuflCBS?=
 =?us-ascii?Q?PpO51xCiLJuMrfN50hHUlpIPYPDvz6q1gN0V/g+ZvxVgkdBhWl18R/0bFWVv?=
 =?us-ascii?Q?rcSIxUIjCxK8RKbq5aQGXwYE3WRRb3smxUQQR/AikMokqhK5W4trRZ6qNX23?=
 =?us-ascii?Q?7yhL4wULwgjdxVFJS7RvXKve8OtCcFzfGtrEejL1pQj9ZntAvMK+t5qHuqpk?=
 =?us-ascii?Q?BfXtpiq6OT1xhRIqNYU9XWWBZpWg0yhB84kKYIvOULtFpTnO8DIPhr0ox8rG?=
 =?us-ascii?Q?loutLAv7Js8kK0hToh+HoVBrKp6W1W9nnFzUvlWupZ/5DTqQLVdoHalycvAC?=
 =?us-ascii?Q?lvQR5Iq/d/FMTIt3tyuXXUJr7BSNmzXrkYLA6+LDc6JS+wi5Qbctana3cImK?=
 =?us-ascii?Q?UyztGgPaBD7DnTY2Ru+tEEar0xGCeP08bAVF2ewElJ995j76FvVUHBRLYglL?=
 =?us-ascii?Q?cWsU3Z+BFKt0O0qmXPphIPfV2J7wS2+C1GyZiZP2uDELOmtnNT0nMW2xZqWK?=
 =?us-ascii?Q?955vi8vjhVKKMw+L5E3POjY110S4n/SWSQwLz2/BIbQKcISFZyJ5I6hmfwL9?=
 =?us-ascii?Q?95bpV2hSHc6D8NtWwcw3NYLdsbQwt+Qj6PU+RlfYFV2P21iqUd3xqKpTcgUv?=
 =?us-ascii?Q?3ACFHvtpIQ6ic++JUpUK7mgpT8RJ/vCJ+aXpG2XaprgfVSbIlfPq2uoconPL?=
 =?us-ascii?Q?zTIH91/Q/zi5gSlqAezviFko+enUnFzdm151wY+FLH7TCF0vTvBvv2UPqdmM?=
 =?us-ascii?Q?29vqoBOlw9K8w5kYp8A8LKIjuZFJ0CHG/ztHLZTRxzjZ4qLA1/8t87UEhhQ4?=
 =?us-ascii?Q?BLjTvKa1m1icAPM72Ll6VDXkKfvrUApNC0yVWCOHHGLEqf2QmMB1nOBTMong?=
 =?us-ascii?Q?GBn4ZkYaF9UN02pKUYs8Au9IlG+dlgH/cBvF7b1hoTQ9+GkKRjRAJEs7UtLZ?=
 =?us-ascii?Q?bPWtXnANdQD+REzv0hUvmFbpixaPeZB97wcpuZHLJ9t9s3qgNAzcR9wrzdKP?=
 =?us-ascii?Q?DMF5tmph2C1pVDgB1Q+4vO5fyCVJtqBlxwhJDMNSu2KkN5TuPgglhCFDXIWK?=
 =?us-ascii?Q?Hb2FxczA7BP8/zJ7fAPakuRCoNRpauR266uwN5K90CRd9pPgap5Y7OHgNl5s?=
 =?us-ascii?Q?XVGIu9Kj6gbo5r04u/qRw+8azL/yIALyVZx8QHVVKkNq3m6z3CgZnH7+8RHl?=
 =?us-ascii?Q?1+J3H+dfsp+E0zVev9hPf17ywT39kwPeGK0PsmKuGMXOJ0HVTwBuOfSGISDA?=
 =?us-ascii?Q?lgCxf17Vd1D/Bf5DBtPv3ylREDaRnsqZUA8yVMH9XtfS0z2KdC7NgK3v/wOY?=
 =?us-ascii?Q?L6dHaCIUoZOA9Sj69xDafzR2q2xrMEa1sVztSbn7+3W7c2ySW059okv3UuYB?=
 =?us-ascii?Q?z9Yi9uVNWWSYkCNF5epxL9y4gCQfA0VufthBGbOv7QFtHoBEWDT+oCCAP0jE?=
 =?us-ascii?Q?Ynfw4acAzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	gPb4Ulh7Y+YQfBND3hbUc77j1/JGpPwsikee8zOla1JxVdvCfUx/iU+QYr3xe4xwF6JYm8NtF5C6Oj4VDfkmKvY9SKl9y82N64MVmD9qb6f1KAnO3KoG/+hc5UG6Z177qMfE9VhU1JjInYxUIe1qu/Pn9aGNWe2jH8MJ0vnzxeEJnPB8jJLrxQw9lNfS4fTWOb16pFYmOos82d27w9RANpzg7Y5HVj250NZ6YRSQNMooLvcn3YKK/+s4wkyO7IsP5lwxsVLhoji3bX981WSV8lAvTA9SVjmNh3uZSc4xEy24MLSSJRIdFinPPd8LVTk4Tuzflbi061Vi9k9VzE7tsA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b742db-ed68-400c-f417-08deb7d80c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 07:59:27.7733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulsTg5rsm8z3fxBsk2DRBgBQKX8I3re4vaB7/fvcINxIy5ktxU+ARfMj/qd/ulLjfVrkku0dF0K5a0uhLoipOg6g/TSfTa7ViOXvxvzCCsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237530

When a recipe uses multiple git SRC_URI entries with different destsuffix=
=0A=
values (e.g. Zephyr-based recipes with separate repositories for the=0A=
kernel, modules and application), do_unpack clones each source tree with=0A=
'git clone -n -s'.=0A=
=0A=
The -s flag uses git's shared-object mechanism:=0A=
instead of copying objects locally it writes a .git/objects/info/alternates=
 file=0A=
pointing back to the bare repository under the downloads directory (DL_DIR/=
git2/).=0A=
=0A=
git_convert_standalone_clone() is called by devtool_post_unpack to make=0A=
the workspace standalone: it runs 'git repack -a' to copy all objects=0A=
into the local object store and then removes the alternates file.=0A=
=0A=
However it only processes the top-level source directory.  Each nested=0A=
git repo created by a separate SRC_URI entry retains its own alternates=0A=
file still pointing into downloads/.=0A=
=0A=
Steps to reproduce:=0A=
  1. devtool modify <recipe-with-multiple-git-SRC_URI>=0A=
  2. bitbake -c cleanall <recipe>=0A=
  3. bitbake <recipe>=0A=
=0A=
At step 2, 'bitbake -c cleanall' calls fetcher.clean() which deletes=0A=
the bare repositories from downloads/git2/. The top-level workspace=0A=
repo is standalone (alternates already removed by the original code),=0A=
but the nested repos still hold alternates pointing to the now-deleted=0A=
paths.=0A=
=0A=
At step 3, srctree_hash_files() runs 'git add -A .' with a custom=0A=
GIT_INDEX_FILE. Git internally calls 'git status --porcelain=3D2' on=0A=
each nested repo to check for changes; this fails with exit 128 because=0A=
the nested alternates are broken:=0A=
  error: unable to normalize alternate object path:=0A=
         .../downloads/git2/github.com.zephyrproject-rtos.acpica//objects=
=0A=
  fatal: bad object HEAD=0A=
  fatal: 'git status --porcelain=3D2' failed in submodule modules/lib/acpic=
a=0A=
=0A=
This halts the BitBake parse phase with a CalledProcessError and leaves=0A=
the workspace in an unrecoverable state without manual intervention.=0A=
=0A=
Fix by extending git_convert_standalone_clone() to walk the source tree=0A=
and apply the same 'git repack -a' + remove-alternates treatment to=0A=
every nested git repository found, making the entire workspace fully=0A=
standalone at devtool modify time.  The walk uses dirs[:] =3D [] to stop=0A=
at each git boundary so it never descends into already-converted repos.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 scripts/lib/scriptutils.py | 28 ++++++++++++++++++++++++----=0A=
 1 file changed, 24 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py=0A=
index 32e749dbb1..0a83470373 100644=0A=
--- a/scripts/lib/scriptutils.py=0A=
+++ b/scripts/lib/scriptutils.py=0A=
@@ -100,16 +100,36 @@ def load_plugins(logger, plugins, pluginpath):=0A=
 =0A=
 =0A=
 def git_convert_standalone_clone(repodir):=0A=
-    """If specified directory is a git repository, ensure it's a standalon=
e clone"""=0A=
+    """=0A=
+    If specified directory is a git repository, ensure it's a standalone c=
lone.=0A=
+    Also converts any nested git repositories (created by multiple SRC_URI=
 git=0A=
+    entries with different destsuffix values) so that none of their conten=
ts=0A=
+    depend on the shared downloads directory via alternates.=0A=
+    """=0A=
+=0A=
     import bb.process=0A=
-    if os.path.exists(os.path.join(repodir, '.git')):=0A=
-        alternatesfile =3D os.path.join(repodir, '.git', 'objects', 'info'=
, 'alternates')=0A=
+=0A=
+    def _convert(gitdir, workdir):=0A=
+        alternatesfile =3D os.path.join(gitdir, 'objects', 'info', 'altern=
ates')=0A=
         if os.path.exists(alternatesfile):=0A=
             # This will have been cloned with -s, so we need to convert it=
 so none=0A=
             # of the contents is shared=0A=
-            bb.process.run('git repack -a', cwd=3Drepodir)=0A=
+            bb.process.run('git repack -a', cwd=3Dworkdir)=0A=
             os.remove(alternatesfile)=0A=
 =0A=
+    if os.path.exists(os.path.join(repodir, '.git')):=0A=
+        _convert(os.path.join(repodir, '.git'), repodir)=0A=
+=0A=
+    # Also handle nested git repos created by multiple SRC_URI git entries=
=0A=
+    # with different destsuffix values. Each nested repo is cloned with -s=
=0A=
+    # and has its own alternates pointing to the downloads directory.=0A=
+    for root, dirs, files in os.walk(repodir):=0A=
+        if root =3D=3D repodir:=0A=
+            continue=0A=
+        if '.git' in dirs:=0A=
+            _convert(os.path.join(root, '.git'), root)=0A=
+            dirs[:] =3D []  # don't recurse into nested repos=0A=
+=0A=
 def _get_temp_recipe_dir(d):=0A=
     # This is a little bit hacky but we need to find a place where we can =
put=0A=
     # the recipe so that bitbake can find it. We're going to delete it at =
the=0A=
-- =0A=
2.43.0=0A=

