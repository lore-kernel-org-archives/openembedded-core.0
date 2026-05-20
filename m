Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6E5CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 05:18:25 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5368.1779254288678780765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 22:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=iJ4Ljv3N;
 spf=pass (domain: aspeedtech.com, ip: 52.101.127.76, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FePh/PskEu/6UAPVYkmn4gkRgVe/+H7vJ+wmmjt9HQC/Eb6YCNSpKcbX71arxlKmT/z3R59tNLbmm6TNCMr0D4bj4ucRYN+12CNRx08mpq+vsGa8muQMoErYkUOhrAajeC6Rkw+9sgJ8u1LFXmjbPwOQDqo5zAmtmYmypNL/Nkcm9i6aXwDu8zOK2d3InktbFqy9YpfgjWk5UKpqaeIB/uZbLQUnCw6QtPybK5jMTuETAtvtSdC+Mjayj1Ja8COjDyAtJhC+QArCYu5lVaa7riJbX5ZKJ1nTd3SQwp6PUilbPvM9fxoRRoJQzUBLBvhVdGA1qclqhS8s3d7/6aLD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOJflKtXjsOb7Gt8xD6R3ZfqzVqf+e0pdRe0sKo6u2w=;
 b=PLRULPBMUnykj5vZuw9uDDQPmc8/DCoz5pETt0LPeTM6/1BeWyw12K49Des2yjfhd/aXyC/7rVWCbkoSu1Ny6QnLUd79hgPuAZHfOjC/2aM84cG8XYPazqVuAJt8a4EC2zySAheMZPVY1qyA/8xZLddcJeLZ2LHAQYgrbrQZDAdzGQeYhR/2FSq69mQ4flIoASyP1/+UF5KFM3JO/DoRNd4TZkiXkAgtK3y5jeYK4w0DHKmnqvjsKlDR71I0FiJr2ir77iJhNOlB7NmLAbueJe0UrIPc4b42VJdi6ajsapir1Mix7NOhG2amohQH7DcX5wZp4uEG25+m87tGr4zZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOJflKtXjsOb7Gt8xD6R3ZfqzVqf+e0pdRe0sKo6u2w=;
 b=iJ4Ljv3NZmNaD2sBCyMBzyz5BmsZ29hJ/4SxgYbKVEkGLVQCYbqxhCsjtSXtJefjiNK+WtN3eJKJIFZ5kkh0iSoOq6Li2C8MGV+4v19vyk+AG7LmIUMgE3cYyrkup3hHBEt+gzERhnc8RqCceEVwcdR4NqlijH+sPUPEycsPu6iYmgyojuUQzX9STzDJZFLv04bzVcCN8+oLOJZuJR3x2xcfMvyaLGDl311mLhNgPK9DJqpIKg4kaL7pyJHDqFQWBd14o7RyMGtSzyfBLTK/zXCJeEeohhFGoGZFkhJVEOeDXGXkqgMGpp2TEWR2fOmMxTlgKBHc577rLsr+LUl5QQ==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEYPR06MB5939.apcprd06.prod.outlook.com (2603:1096:101:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 05:18:01 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 05:18:01 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>, "paul@pbarker.dev"
	<paul@pbarker.dev>
Subject: [PATCH v1] scripts/scriptutils: Convert nested git repos to
 standalone clones in devtool workspace
Thread-Topic: [PATCH v1] scripts/scriptutils: Convert nested git repos to
 standalone clones in devtool workspace
Thread-Index: AQHc6BgHN1CBr1epV0S10IbNYRkvLw==
Date: Wed, 20 May 2026 05:18:01 +0000
Message-ID: <20260520051800.1951624-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEYPR06MB5939:EE_
x-ms-office365-filtering-correlation-id: 00d2a4f5-808e-450a-e85d-08deb62f29d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|38070700021|18002099003;
x-microsoft-antispam-message-info: 
 Dt3k0LR1b2m+45o/h2UYK/6eBXLsuIA0L5swQz+NHZrpfe7JlnMHY9/TIuNhYCdsZKfdh9vvAC0q+ZSxp0O/5LGiCTMZu7Qr/Z6eqaRd9TcQY13eLKyye9IAXggzg5Eg/Siqb3CnMlh6a/ruYz74xBRV9vwmpjfidHezi2vrUHjAKT95EgA59Wum0+IEOU0QEATLN7zEkLRfTT5LTPluLPXq1BcfrjcR/HUWBTJa/rU1secnr2VQAOKI8FYTioYuV8nm4qqUihWHF+ABAMFkGPsN8f2X8F4q0PPy/EfPwJZxki8QpJw6KZOO86kpnEBMkp0N6BcUZpMO943Guv7VrbIuR++2czCvtIATzRUtXFl/SoYPyjZGPzstP82aGo67RUP/zy/sVMQ9kXRo3TWw2vQy5zDfBONhn7KsIUJQXYjMdcLtHOmcVEZecCCZ65vyQJpbVSsAetNRAQWfn6zmlVofhpwvkxzDm42bR2OH2iMY9F3KFOaCWJ9gcIjl0ni3cKzUkA1Xfr3cat1bAEwHLGYO7GnIf4+lTT2qeqdGY1dw5jkGHjIxGSbrc2Mu2aJ6l9Iu+VxNIiz4lcBgaliqVTsE89lSa/gUZkYV9BfFafrSnAMEEbEFEUduorIB7oT7xTn3IAnnyr+g1lRg79Oeh8jfCikq7nw6VGuttZ8hvHe7lTHNpQpm5bcDeDz9YpoiMzhP3TwCTi+OT622YA/QmpBmVTZuxuTHMsA5+wAFswJiWU4LngSF6dhUnkN3H15F
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xzK8GMI+QuuisjZwIWQ0LJQKkhcpfKtUJ8WntHD9uuSZENx191qBw8J2b26O?=
 =?us-ascii?Q?NUWxah7EJQgz1QHD6xuWy77mEk/ja9BtF5nMp4ieYhgUmUfCo1CBYa+/bzzG?=
 =?us-ascii?Q?tZngvPv3l5fLBtiLmsku4aDCWObESmb5qvTWZaxiJjrxoQXCNbkZcimKbPCO?=
 =?us-ascii?Q?7isD2wcJKA3IfMmMcsLZAFzBHSz2ONEp8IQ33m/ycHsFWYKwjaVpRAHrPe6Y?=
 =?us-ascii?Q?0kvrEJFoYHaHk/3+utCcdqPnuqX/3Um4BGfDFI1Lw+SvmfTGqCxpcH6tacd6?=
 =?us-ascii?Q?gyWLqt4k/xtsgQqGYuihj5PMYwPh4aliLbn1xFTwK/CDb2tgBSM7ReH2uBHT?=
 =?us-ascii?Q?vmMrFJC53XlwAAKy9SAuoXBUW/HNv9vLMoH2CMegcwfq+uDNeaENGAlLPqg3?=
 =?us-ascii?Q?3CQUd9joWAzgoFSWlsg2BmGUtHBMozAlVN+E8P9WuuMLvz7U55Qgl09rb/K2?=
 =?us-ascii?Q?XboW4LAUxkte/O+/FzpVOM0berdo9WaeuCK2ypkeD36y+76ap8UUHSi+/M+I?=
 =?us-ascii?Q?Wsrn8M4jJnVvnj5NVzEs8ARq4thXRVttIWanizOsv6dC9vIc7Z3rD2Dl8pOK?=
 =?us-ascii?Q?xLE0zj/31t5m+GGmdEA8U/8MiSnZ8Tf2XWjyGTew3AzXhOHdxS0YAneE3Y2c?=
 =?us-ascii?Q?qnUZcVoIMUrM+PodWMMrSl27/pz3+ycfDS5zG2cGaxrq5ka6IiHmiHLOceGy?=
 =?us-ascii?Q?Lmc26ODYrtIE9DhVNkAmJPzxkKjuINJA9+AkyJOLbGJGkAfKnPcigsmx6DJZ?=
 =?us-ascii?Q?KvOhiPpf+W7aMV2exzqLixdgEm96bjYgI0xWT5XqgnnIxYUGDVgjkEo2poMI?=
 =?us-ascii?Q?oJQgnIcFh0hfDTEcVQT42ltI/959VCOfyRNty/bSPky2viKTgCxN3aDEmZvG?=
 =?us-ascii?Q?v5LHa3E863sKWWyDxhLQvv36P8YePp/vPzlOP2dB5Vxtg1ofOUS+zBlNzNpD?=
 =?us-ascii?Q?9izVCYgMz/GANxUc7G9L0JRp5TGiA9W5A2gdSt0mh5MwhJ8dHiJiiB0jyz51?=
 =?us-ascii?Q?+3ynuntsNYc0EoqvcNBpZ1XhXN4l+dhVyaQ9zq74CDlx1d11bFhafnar7HGO?=
 =?us-ascii?Q?xtMmwe8UI3vHPrPsK3NpmSABfqM+mCRuZr5mRTpnuBI6TVOCGbBTDiyFLdlO?=
 =?us-ascii?Q?tGHM7llsRdIsh9DYw3PNlnsZNnIz7rgpgGhAVuGILIXZq5p5S3uAYRw6HyRA?=
 =?us-ascii?Q?P+Ne93ylsQ4NroQ393SB5RpdDAox+EM9jTGzLy0s+RqzPmjHgB2ECJsl3wvn?=
 =?us-ascii?Q?Sc9TsZRHC9EK7yOyEQ3t8hBPYkWuNuUy8owOUMZrU9XQ614OMLZiEtXlKryr?=
 =?us-ascii?Q?miIGp7P+y7NNto+npVNNx/tzwvdCmGp3nt1LglNmykJvRujCvRY27VW4npuK?=
 =?us-ascii?Q?Rex1MHZuZf1rQyiB5CLxtxKbSuarGyaYg2FtNq3FIlwyUycbILADms1CmMux?=
 =?us-ascii?Q?Ai9Ip+6doAwPMjf0RpPRIuf59Qtsqjfs8F3NCrpDabs7hOJeYEV6LJE4dhD0?=
 =?us-ascii?Q?ur+HcIKYR1qX6cmhadNuUlRt7JEw278VvrG6/UAd1b3p9nvHlWMPzUnb8eXQ?=
 =?us-ascii?Q?U3JvjSavB8hQ49oPqcDgoTzbSrNx9FczQSv2GgvoB4CnbCG3sus8knZfmq7/?=
 =?us-ascii?Q?5v0qylTcuRt2CkcWw9XBq8ycJosCD7wpnoQL1sARrDwGDj5Wd2LVDKLMlmvA?=
 =?us-ascii?Q?/0B8EYul41735ysQYpv0/66r9Gv/5vZ1dvu34FWb9b+GYSqfHuPqzfUs0+Ky?=
 =?us-ascii?Q?f0Y1Hbzj/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d2a4f5-808e-450a-e85d-08deb62f29d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 05:18:01.4346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t28ZsCUHWKcTq44tgC5y1cPv0qmQ6P3xTteC7sdH3UCbZc6Fz22+81VglQs5HinSuWim4AxMX9f62ThmL04Fb2eLQ6uzzgIq2bI+uJAorOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237382

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

