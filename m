Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCD3C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:28 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=GtMhnm4h;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI0ijnHRM7iJYsg6fWOo/n1kVn4XK3OJ6j0O+8syoEey+UCHyM5X+uEWFolLpgcx/bMdmwA7BNYtjjE+0nDEFPfUVyuJjsVAdmgdgVNDMKCcZQRGmEAb08KMFDQNKP88hEAdBqCpE4Dtdn0T5rwxdwNLSnccG6j1J2Ra8+pTfUPk9TvY9mVfyI6z8rTPAMAphNO0Ju5t4MXey9wYw+Vu4pILjhjzrYKV/iRDMHPn8RE3DfbIuwKkW0w66mmnnCKOw7UAvBPcTvILHmt61eqhBbdX2C/bPLbSXOxuiB6ItyInwbV+A/lHAGpb3anJEY9FliROlFmfb6p29WK0S/uWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49NX/wN4wP8g/j00CMiz1KkFhbizvJ5JJjPsna0tRSU=;
 b=B4pgS79G8EcnPWZoB2y+3ht96u3hqfYGpZWtqqP8dDitc84Q/dc4d+npRIgwsnst7GVRvhyn4Xab2WLfQ4Vt3DJBmn3j9PlQqDRyJgbRIpAa2Zi3F+TM7lIu4Sm5PpMWY+UNYyGvHbFX5sOrKIlinfF+WCr3aQR0WYTAUhvzYVTxkmnAT/C6XqU05l8hdst/WbmjFJDFY+pw251GJc5mC4o+c9QM59n8b5PlxQxgsbUgdEcPhie491S50YBRLQmEWKbxVAnwKzE5O4gNS90y7nSLMnY1FiVIL8DEsMAEOl4v7xXIRuWQ2JJdNR92+mbM6QOioGKjS5885prJDIfmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49NX/wN4wP8g/j00CMiz1KkFhbizvJ5JJjPsna0tRSU=;
 b=GtMhnm4hgjagXWciOc+HXQttOdY1YvQ16EBURCJM1VpjUSK/XU28Bkp1KXBMNan4Zgcp/njxNtXFvsQw8PCy6luKw5q+AGwYguzyOG/SfO3Yf4hgRuXMF2z6LuutDnXl8LPWXSJ7E1Ui90A5BExhPXzDdx4CEx12sesk5poEcop1sc1XqHCm1MGMTUyFgPl00fu6N+FPcaHECNntNFz/Du8cKhy3Svl8+lZwaOmq+Qyu4rN9PyvnA/F1/TY1u3Pq11kHsAZQjTHzBuGjZh9od70JHksJPZkjs4RRfw9tekYTU4//o4gGS17QTz141Uw5MCabWNUvAOh4S0kjArFkHg==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:20 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:20 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 1/5] devtool: Detect nested git repos before the initial
 workspace commit
Thread-Topic: [PATCH v3 1/5] devtool: Detect nested git repos before the
 initial workspace commit
Thread-Index: AQHdGnrYw++KVBeVrk6autu7sEYV3Q==
Date: Thu, 23 Jul 2026 08:11:20 +0000
Message-ID: <20260723081118.1558249-2-jamin_lin@aspeedtech.com>
References: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5022:EE_
x-ms-office365-filtering-correlation-id: 400654c7-81aa-4fe5-1159-08dee891faa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|38070700021|10067099003|56012099006|5023799004;
x-microsoft-antispam-message-info: 
 yx1eXarraH3ruwImPiPgY6b/eGuxPy6rz5yUYzwLToA113Mnc4UVdQMtNoyX37KBMdgrzLJvbjvUJjZjXOZmRuu08wo+M8ntvli7epQf2nDbfJOHhEzrzaa39eQbe4OhX8+TfW3z4YlMDV8pBsAD1PDFKcueKjEjTQATjXH/ZWqTRkrfiLeFduPk6vsgfyVOXvFHFSQApUFpbhRqG5jQSgwo75XPEd2aLl+63VbRpRoAM93KE2/4a4E11fUqy1P0a0S9FaNQ4pcjVixj68ycI/or0/tw6YLID1alEPruTK5pj93C+ghBmXu8Tt98356350m0koJHK/ArZ7qWYHUyhSTZlECyDw8qNtZeXMsTCuZ4GKWNQ7ku5CFC0w4K1PIlYrk5rw435qR9WW4picRHTuFG+KgCKXbphMRSjq5kTys6yYaUMR25UHwYfgHyAS0a80dslVA8pvl/EGqP55aWGh02tMQFYzKWhy3/4FQOZ75k6J0VdJ4kg0fq+oO6avcIDowGuOfyr5xrfYsmzFgUtwgmasBPGgQR7Rg9LpsPRZrWHvv6CtDCmSiAcG7+h5hctxks1YaBgU4zP+RJDgQtd5HgPljVTwaIGa5vfrQxq0+xfDuwk3vw9ywgSBesNDHZRsLK0UeBb360UXQZAVawgPeKFIo6gftFs+PIbcU4F49QklVxfuMAnpIv2vcZtFirqHsxudeWhYM145sJltpk1W67B2EhbdxqBrr5eQb0law=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DEmBiAH5k8joDEqxNHWRsgmmmsACAICP8TZMf2741WuaDF+HeFPljQe81aT1?=
 =?us-ascii?Q?EZCbyt+UQYx2KzMtVG5Ruk2rijklXOP86ocHr5MNP34Gs3ZSUg4yjfHDoQ7i?=
 =?us-ascii?Q?oCUjKufHgWVkeXRIvxjIJEA6dL5rL3rAr/BriOkLTJ89JPhAmcMXZO/IMOEQ?=
 =?us-ascii?Q?ggem88JTL0eEsCuJ3b4KhOQUekHr6IL0Jo1kluDqsfUFYhMIRzESD/o3Wy2E?=
 =?us-ascii?Q?+21dz6k+8eby7uI8g1lPu2O1vjWyLrdkDthSISYkGxOZ8KMDXDxv4ZBqQHHZ?=
 =?us-ascii?Q?tLvEj6lXjQykjLNwYplrY6FYGdlUx9V3qcyjWhOomGZiydlmJ95hUAbT3WTB?=
 =?us-ascii?Q?ysnG+S/+4W6ucxjYOnGZiRUF3UTTkkY0leuoQRwFnKqBpU76MmFqYFvrpmQa?=
 =?us-ascii?Q?UDd842TI0RdFH5RKOcRp5du1t+lvE0gKceBnyeVtn14eGuTiNmHcpsBKpJGT?=
 =?us-ascii?Q?r3vr5iJyqjbadSlCWAM+FmUHYVesYijYCIceuQIr4gZQcs4mVlHyI0Bn+UqP?=
 =?us-ascii?Q?U1biGh9PgbqKLAv9c8nG6Hwl7aXF+gosBzLaP/BIn5orpA8+jrN3BBI330Tg?=
 =?us-ascii?Q?iDylBX+wlP0ySRg7mKTTVKp+rCdqB3ZiqE2T+1dlbb2FftHCXKGKZAoHioI8?=
 =?us-ascii?Q?MzWR5XY/Tzof7SWs32GVuoZ/KwC1JODkmPIZeElDl8hElJdynV48eBWLtmCI?=
 =?us-ascii?Q?9XaAZmb9Py/fXfjMSC3neo+ToERuam2jY0C/vXF84uucMg1tQrKuI8W7CsEE?=
 =?us-ascii?Q?c5HSfXftTmwn8qPpHIxLeeV2uZ75fB7/5tKAM+CpAGB+LYKi714hNjVjaFcb?=
 =?us-ascii?Q?JDp+QiqZlM93T0VG7HlaaN1942ATWjo0DKfwym2VgUGx/ILM9WfnC1FFFPH0?=
 =?us-ascii?Q?5lBcKYxSlzZbYlu6LKjydi//TCsV5mqabjmE83Y1bPD4Vxd7hcuF9XZgtHPk?=
 =?us-ascii?Q?QnEnuaK5IgIQkp9fOjlZdpKPw+GzY0VlhiCW293SOOdEkZUHV0iT+9+Ra/4E?=
 =?us-ascii?Q?TSsEH9O4juzH6Ab1ECCiFEQRYOHbHRFTFaL6fsHk3/6W/maB3oRII4COH1P7?=
 =?us-ascii?Q?+C+rrs7bKAfjzmMXmFcHJra+HAQSG64TiMtxe0tVzQQWN/qZ3jcfLs9G7mde?=
 =?us-ascii?Q?NcoZ9/5Rx7lKI6LaRv88EY6HJr8DhSYxEohFIhHfPYJ2Gr4ca4yCn/1TD1oV?=
 =?us-ascii?Q?w8vQirTJ1ZkVkWg6UD0x5bppB6i31YxUE8w93hFPDCtvGJgliv00kjrc4J7Q?=
 =?us-ascii?Q?8Jhip50zZPqqSVNrqyZwlZ1Sifj7CMj7ebOZ8+snrQ3UsgsQYph1ooNNAQk3?=
 =?us-ascii?Q?PGP/pC4BVOhePT8UlRewAucVC+nQkZumyKGSdKfoqDu74/bfBeV9cnIFTgOa?=
 =?us-ascii?Q?mFcISbuIwlbIA7l5l2gsPN421/oRElgjfAlwTxDCeZ2ZS6piCEN4KQUbAIZN?=
 =?us-ascii?Q?3Q3Z+Sv5WeHvxsz1kzKW5XkzQpR8lLj6AY2BjarpGhk9Ht88sLT5G9SkRaYd?=
 =?us-ascii?Q?aTyyk3MRgNmn0RrgOPTdR3/x8DkWcHXSUyYtl99q1UL1RNiWmb9T9SyDoCIF?=
 =?us-ascii?Q?/qEZtOEYCdUAhYD76rA2CCWKxOqhdQN56Ze4ermlsy/iEocjHPFDGIM9GJXt?=
 =?us-ascii?Q?aIZPkWSXcvCGZeGabBjOMQSUxR1IW5UK4t//jvWgOF3b75rYitB1oY/VH0uy?=
 =?us-ascii?Q?M69fqa4+jDewLprwS6NvYC0oI1bf+9umindFRvYeUh5/eN9x6AWubuukXcRU?=
 =?us-ascii?Q?5O/gPMPMYA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	JCTS9qJpyjPQC+/dOFxXmoz5/MsaMZfYKZtUDgFyXMM34MZDnfp2xVCC3+pt2uJY6LxCh3rJECyxkmbXiEBGvRbtIYQHJ2vYrGKmy5n7twAYpx2/OshxBjJlG6xknlSjaamA87qcz18BLt/v+6+G+fWWaXcSeXsc8uhSCFB3E3TYXX+F1PiK2FwFc8hhTJ6nysVhWaRJQpvrmXHDBE5D2ZiE9R1bJPq6Ch9bj912WOes0ilB943KyCVg4S+e6XN7U07pFxsj+3hPMctY4fhYT0Fb3FFAOW3L64jZIinX82YCbowxDMJMwR4ZNXFmtnfxLozV+LeNX83Trz3XfR3YWA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400654c7-81aa-4fe5-1159-08dee891faa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:20.5951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XhfbPkfuaS94bKmEVNd1JCp70c0azAfKPH7zfDM+JLUPqvfi3lpuNUIqvVSiTF9wDiyV/BLHwiX/bBOHBNv0Oa0BZ8OuxNg7lKzxVeLhCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241784

setup_git_repo() is meant to convert a git repo that a recipe unpacks=0A=
inside S (e.g. via multiple git SRC_URI entries with different=0A=
destsuffix values) into a regular git submodule, so devtool can later=0A=
tag branches on it and extract patches from it via finish/update.=0A=
=0A=
That detection never actually triggers, because of the order the=0A=
function runs things in:=0A=
=0A=
  1. 'git init'=0A=
  2. 'git add -A .' + initial commit  <- commits the nested repo as a=0A=
                                         bare, unregistered gitlink=0A=
  3. checkout devbranch, tag basetag=0A=
  4. scan 'git status --porcelain' for still-untracked directories=0A=
     ("?? <dir>/") and convert any that are git repos into submodules=0A=
=0A=
By the time step 4 runs, the nested repo was already swept up by step=0A=
2's 'git add -A .': git treats a directory containing its own .git as=0A=
an embedded repo and stages it as a gitlink pointing at its current=0A=
HEAD, without registering it as a submodule. Once that gitlink is=0A=
committed, 'git status --porcelain' reports it as e.g. " M leveldir"=0A=
(already tracked) rather than "?? leveldir/" (untracked), so step 4's=0A=
"line.endswith('/')" check can never match it, and the conversion to a=0A=
real submodule silently never happens.=0A=
=0A=
This isn't just a missed feature: an unregistered gitlink that has its=0A=
own untracked content (e.g. a further nested git repo underneath it)=0A=
shows up as "dirty" to git status even though the tracked commit hash=0A=
hasn't changed. patch.bbclass's patch_task_postfunc sees that dirtiness=0A=
after do_patch and tries to commit it, but 'git add' has nothing new to=0A=
stage for a gitlink whose hash is unchanged, so the follow-up 'git=0A=
commit' fails with "nothing to commit" and do_patch fails outright.=0A=
=0A=
Fix this by moving the nested-repo detection and submodule conversion=0A=
to run right after 'git init', before 'git add -A .' and the initial=0A=
commit. At that point the nested repo is still untracked and reported=0A=
with a trailing "/", so it's correctly picked up and registered via=0A=
'git submodule add' before anything commits it as a bare gitlink.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 scripts/lib/devtool/__init__.py | 64 +++++++++++++++++++++------------=0A=
 1 file changed, 41 insertions(+), 23 deletions(-)=0A=
=0A=
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py=0A=
index 58b02eb460..0003b7b107 100644=0A=
--- a/scripts/lib/devtool/__init__.py=0A=
+++ b/scripts/lib/devtool/__init__.py=0A=
@@ -200,6 +200,47 @@ def setup_git_repo(repodir, version, devbranch, baseta=
g=3D'devtool-base', d=3DNone):=0A=
     if not os.path.exists(os.path.join(repodir, '.git')):=0A=
         bb.process.run('git init', cwd=3Drepodir)=0A=
         bb.process.run('git config --local gc.autodetach 0', cwd=3Drepodir=
)=0A=
+=0A=
+        # If the recipe unpacks another git repo inside S (e.g. multiple g=
it=0A=
+        # SRC_URI entries with destsuffix), declare it as a regular git=0A=
+        # submodule now, so we will be able to tag branches on it and extr=
act=0A=
+        # patches when doing finish/update on the recipe. This has to happ=
en=0A=
+        # before 'git add -A .' below: once that runs, the nested repo is=
=0A=
+        # committed as a bare, unregistered gitlink and 'git status' no lo=
nger=0A=
+        # reports it as untracked ("?? <dir>/"), so this detection can nev=
er=0A=
+        # find it.=0A=
+        #=0A=
+        # Discover nested repos top-down (so we can still skip descending =
into=0A=
+        # a repo that manages its own submodules via .gitmodules), but do =
the=0A=
+        # actual 'git submodule add' + commit bottom-up (deepest repo firs=
t):=0A=
+        # a parent's commit recording its child's current HEAD must happen=
=0A=
+        # after that child is fully finalized, otherwise a deeper repo add=
ed=0A=
+        # later on gets its own registration commit, moving the child's HE=
AD=0A=
+        # forward again and leaving the parent's already-made commit point=
ing=0A=
+        # at a stale, superseded revision of it.=0A=
+        stdout, _ =3D bb.process.run("git status --porcelain", cwd=3Drepod=
ir)=0A=
+        nested_repos =3D []=0A=
+        for line in stdout.splitlines():=0A=
+            if line.endswith("/"):=0A=
+                new_dir =3D line.split()[1]=0A=
+                for root, dirs, files in os.walk(os.path.join(repodir, new=
_dir)):=0A=
+                    if ".git" in dirs + files:=0A=
+                        nested_repos.append(root)=0A=
+                        # Do not descend into nested git repos that have s=
ubmodules themselves.=0A=
+                        if ".gitmodules" in files:=0A=
+                            logger.warning('Nested git repository with sub=
modules %s; devtool will not recurse into it', root)=0A=
+                            dirs[:] =3D []=0A=
+=0A=
+        for root in reversed(nested_repos):=0A=
+            parentdir =3D os.path.join(root, "..")=0A=
+            (stdout, _) =3D bb.process.run('git remote', cwd=3Droot)=0A=
+            remote =3D stdout.splitlines()[0]=0A=
+            (stdout, _) =3D bb.process.run('git remote get-url %s' % remot=
e, cwd=3Droot)=0A=
+            remote_url =3D stdout.splitlines()[0]=0A=
+            logger.error(os.path.relpath(parentdir, root))=0A=
+            bb.process.run('git submodule add %s %s' % (remote_url, os.pat=
h.relpath(root, parentdir)), cwd=3Dparentdir)=0A=
+            oe.patch.GitApplyTree.commitIgnored("Add additional submodule =
from SRC_URI", dir=3Dparentdir, d=3Dd)=0A=
+=0A=
         bb.process.run('git add -f -A .', cwd=3Drepodir)=0A=
         commit_cmd =3D ['git']=0A=
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=3Dd)=0A=
@@ -237,29 +278,6 @@ def setup_git_repo(repodir, version, devbranch, baseta=
g=3D'devtool-base', d=3DNone):=0A=
     bb.process.run('git checkout -b %s' % devbranch, cwd=3Drepodir)=0A=
     bb.process.run('git tag -f --no-sign %s' % basetag, cwd=3Drepodir)=0A=
 =0A=
-    # if recipe unpacks another git repo inside S, we need to declare it a=
s a regular git submodule now,=0A=
-    # so we will be able to tag branches on it and extract patches when do=
ing finish/update on the recipe=0A=
-    stdout, _ =3D bb.process.run("git status --porcelain", cwd=3Drepodir)=
=0A=
-    found =3D False=0A=
-    for line in stdout.splitlines():=0A=
-        if line.endswith("/"):=0A=
-            new_dir =3D line.split()[1]=0A=
-            for root, dirs, files in os.walk(os.path.join(repodir, new_dir=
)):=0A=
-                if ".git" in dirs + files:=0A=
-                    (stdout, _) =3D bb.process.run('git remote', cwd=3Droo=
t)=0A=
-                    remote =3D stdout.splitlines()[0]=0A=
-                    (stdout, _) =3D bb.process.run('git remote get-url %s'=
 % remote, cwd=3Droot)=0A=
-                    remote_url =3D stdout.splitlines()[0]=0A=
-                    logger.error(os.path.relpath(os.path.join(root, ".."),=
 root))=0A=
-                    bb.process.run('git submodule add %s %s' % (remote_url=
, os.path.relpath(root, os.path.join(root, ".."))), cwd=3Dos.path.join(root=
, ".."))=0A=
-                    # Do not descend into nested git repos that have submo=
dules themselves.=0A=
-                    if ".gitmodules" in files:=0A=
-                        logger.warning('Nested git repository with submodu=
les %s; devtool will not recurse into it', root)=0A=
-                        dirs[:] =3D []=0A=
-                    found =3D True=0A=
-                if found:=0A=
-                    oe.patch.GitApplyTree.commitIgnored("Add additional su=
bmodule from SRC_URI", dir=3Dos.path.join(root, ".."), d=3Dd)=0A=
-                    found =3D False=0A=
     if os.path.exists(os.path.join(repodir, '.gitmodules')):=0A=
         bb.process.run('git submodule foreach --recursive  "git tag -f --n=
o-sign %s"' % basetag, cwd=3Drepodir)=0A=
 =0A=
-- =0A=
2.43.0=0A=

