Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33053C55172
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:49 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=YoN527rw;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi5VZoSmhcb2tdFOBU+YFj0ieawG8PD8DSd2y1tgDdUxAEIF8N9zaNinZIu4SWGGl/7n3xW73FFzR0ev56PzPhIfluz4KCQGvcU8kTIanMa8qV7LMi+zNklSq3ubb3tWjGcjJz3t1+kdWWYPmkwWpgD9ZmDxpBTITbR3CeLE6WbS4CSkCntTFq+YQc8fjnCQarHSh9yTbmhLLPo87Ezrpa5GSuF1JUMgvzCLTBTnDgVVEiXpn/ELifQHC5mXofYV1RfW2SQmBDZXBWsVV1FjujO8hmZKOJ8JMCJW+aQLQs7eLlL74Fcf7u0Xewha4pTzRbZ5JCuETMuGQNm0lvst9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtRHyUsNC/9vReP8p3z7qb/vBHHiT/nQ6SjpkCKJvTE=;
 b=PkSQ2A9KCzVAHjl4B95ZXYz8R0DdE2iaTtntMXmfvc3OuSgg56bBpjPQioOHK7uar+GEjZ36YLKplxnbSWNJtAMXT1/gH70fuY9Cf52bklJi69JrgVVCC/cnq8isdl6qK3hTG68r2W8cbaULrb/MrD3BULdUcEye2na+Iqp2p4QZ1yjMw/vCgpPefGiX63hiy3pYceiEJolAHvA5zbm1RycdUWiK9Etn73VUSjt+GJG2D8YJhkUueHgbo5q+3SKUVgKE501AHXL1rCqyVGkhQAWQmXWBIrWnNGLvHQxfyVEdKA6hRK0f+5O1/NvDWbzGThaDxOVWepkGDg+j8VQwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtRHyUsNC/9vReP8p3z7qb/vBHHiT/nQ6SjpkCKJvTE=;
 b=YoN527rwj06NUd9FZsYh/C3U2zO8WdGtO3RIpK2vV7AL0izvltL9+z2/I0M8niMW1CRpGyDY//4GqtEhj6zBSh7cDI4slVmxgBzcNG884nsDVbej8+iDR0FjtEEn8QDBxn0KXzX23h7BW1mEBlfIFsZl7PDhE85WRrM5neQ53Ix9VDCX7Z3yisfvITLRnjk0svLd2LUVXvxAF2AjaZ1qAtzcOCVC6ly1IhxkPd872x7arKBroRCqzZEJFx7KXN2eQiSNx2+T814AaeBy91JIgt/o0HIMTXCA1TiPGJyQ6pHDjdmxbGd8/XC87FKbFvj4VwShIYgMlAdhHl87HayX3w==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:38 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:38 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 2/5] devtool: Register nested git repos before the initial
 commit
Thread-Topic: [PATCH v4 2/5] devtool: Register nested git repos before the
 initial commit
Thread-Index: AQHdIM6v+ernWD7tZ0ifQ5Gml3Ixmw==
Date: Fri, 31 Jul 2026 09:26:37 +0000
Message-ID: <20260731092634.1127862-3-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5295:EE_
x-ms-office365-filtering-correlation-id: d955f3c9-90e6-4df6-9f79-08deeee5d2ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 7siHmWJiCgttpep65j8OQCPGZTQ9Ygq01e1XX3l3qZXpW5uNYUi88yarvtLcMq0sgKhJSKu6B4l68QsHuGLxh486HM5OshlgWvXxuavWlItOd9gJb2eetj8hMoUFi4BfD6tETVJJad7FJEenZrQy3lI9yVrpA94a2tUouqI8DK5ahoMZh5ArSNTIPna8v6TJXnVr4F7Ryi2Mdy9kFla0StoeCynu8725tGhzCeq8l4hOhDMOtBJ613TqbmhUAV/zLtPzC4wmjBEOa6AH28SDsP0oUTgdCbVaUWtezjRPWwi0elzbDqXTiw+vYT95jDXI/eOVNspDU+cvtAbbphhIaBXbKDpfZScQKHo8GvKQ5epGLBgLwrMjB/znxBfoN6edRMjS2yiD4rqevKvIj0LcMi6SlhjiEDpChD47P+qmKawn3RzhgpAt54B2fx2ZWQetJxRC+x8BD1DoIGfnFquu+7lh9wWH82hYjHlfMXvTWyv5396fWOIdMQgUopAFBneLGe8H+lYBGmqXrXjVT1JPaJzrD2cjLvywbw1zTuQtMAkfM+LA3Gmyp6wvAE7UOsKkafiIEF8wgxqxM/LGDeDtq1shEfmOWQxpQutAJdwZmnm6iPfZejDp6tNwv6hT0kdx5lHOM9GqQB5ntM5XfGrwDjhESn4HSK2TlbC39M9ZY+c1QCFdRa4HiD1WW/JGe8wWHERxAjUN4v4VFHfVAQBbOyXwxq2FX1+Q9sKPd2lRYt4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5uLgvdFHRtS6607Z7a0SW/Pmnnef8bncoOtBTY6QFQx1YHQ7T+gnhkanAQNh?=
 =?us-ascii?Q?W9uO6DG+cTezbbG4l8/zrN0fQX9Sk5E6NoG394tWV+6bHSrH2OZ8bw/s+6VN?=
 =?us-ascii?Q?zYCYwxt/h+Deda1sUczRX7IqYLqvyGKymQp7auuBk8UtmgJstO7x2J8pASpT?=
 =?us-ascii?Q?H5/BqsQYr6S69Q4lYfO78cpdPbNIgd5gTZZLoj4j3abtJPo6gSiEX6hKIwQ7?=
 =?us-ascii?Q?0IrMCi7QdAf+0mrqCZijKRLzVffkCqdbueWjqINtUgJ9wzpLZsNrXNWUArTZ?=
 =?us-ascii?Q?PQrX1ukl9Rx/7THotdqjWKVAu2HTw1OQAIjWCEx8RfDshZavTjAt4gKoEaIu?=
 =?us-ascii?Q?+r7UkQsyYIsMjmJJdRrdq8Gl3UWHs8HLJIXa7hGVZluUq3OIHiZmD1yolYxr?=
 =?us-ascii?Q?jT5SlD2d0B6uY2+V2ydDgJgml9cflvPYsdgNKduqKVi0Feu+DvGHA3/dN6uf?=
 =?us-ascii?Q?KqsqFzBcr14QCR9F7mWLCjo5RV+HWTzH8onra/3zYv2WWrDmnFFTX9Dy3BeJ?=
 =?us-ascii?Q?Rl3GoB2NmjmLqMitVBc4YKGrR1iD4okxuDuAV+857XbmYLR1cT3CfDsnHEdP?=
 =?us-ascii?Q?R1NYz8Ld9J9fiiRhTWRn6cbsWdm87pfHRUldVeR6SlVwbBSiubiMd6OY/awR?=
 =?us-ascii?Q?uJU9FNOaPcrXmDRTbmaFv+H0ikPhBy04LP1k0yWcuvoGfYVuCBSoIVBiAl57?=
 =?us-ascii?Q?q02kEeTkKvDSGA1o01DiBKEBF9Ylv0F9Q8G9G6B2FrqTpZ/Klg+sfke/QrnH?=
 =?us-ascii?Q?jAfvwmzzzU25Poy5qrh6igV3s/tz8+uvt/XKkjYvwIuR3lmvu2zuMAQaGvxn?=
 =?us-ascii?Q?/Nx9f2EzKfvuo+18XS+2QtQivI7i7k/xyxqcqxwtfu9gIhfWtqU9cUP6WCmD?=
 =?us-ascii?Q?cb9so/PGpGW/ngaf585tJxYFl/oV9Nc42Ky/y63tGv6iMUZ166NYq9j20Yoe?=
 =?us-ascii?Q?eSzGBEm/De5bdTg2q4R2Eyul2sUEsCuEbiL4CzDiGZ4+g0MEwBFT32gbSWva?=
 =?us-ascii?Q?ZU0gMCTkDnc2u/IMJchRb5sXX/dbiVok8HUUCOszdhadC+Z7lLxZLpqMm/R2?=
 =?us-ascii?Q?/txAXIoPm8wHxLY+ojjl1sUac7sYrRZnIgYVN61EluGISRpAPci3iqiRZJu2?=
 =?us-ascii?Q?Jphrf38qOPnmBX6wxqCute2KjU26hAkmVInZ5+88f4kxFq9onPMqxHGxHrCW?=
 =?us-ascii?Q?0L79jn+1Tz/wd7jpG2f5exx8WcOM6p7JSXC2LczlZXalL56NpDrXo88f77om?=
 =?us-ascii?Q?glcBqMrXuy2Y0KHr4QAS9Prr95M1x+CUgJP8uK8kGOyKLCzogS95+fg44t0H?=
 =?us-ascii?Q?zvZz9ZUx1fI6koI1s9HURMGD2v9EIGeUc1fXOjW0X1qRGthDznOm8MnWtxuF?=
 =?us-ascii?Q?R3G/vvq9bSGm5sbl/YxoYrBnPliUA7TGTJnGLGcOUYHywIXgWaH6DA7SH9Fz?=
 =?us-ascii?Q?NleXi9gN3g39lxCx/f7hHk2AUWSA0kzCJgGvu3+MhA79QDdsHEepKbmn5dJ5?=
 =?us-ascii?Q?reeMMmBOQQs9REDlDa2xeSaKGyz5Kr76aACoI1xqArgJbm0d7J07E2gWa/w7?=
 =?us-ascii?Q?Sh5TTkvbQK9BObui8SjFmRlhgFG93zv9MB7qfKAoKnsodBLVsxQ4PclYmrRT?=
 =?us-ascii?Q?RwNSRkzmnTA94XAnKphlrTBaEswYtKfqjDJ+WlVF1gamDpj/Mxq98IiYTnTI?=
 =?us-ascii?Q?0QhYmG+I3Lk70vW7KAjeW19D7ZtB5wGc+FF/wOCJk2lQyADr1FYaoSYABUPg?=
 =?us-ascii?Q?x27rqiyMWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	mUSETkIbhKqSLDgxAm676l3QeoWaXbi+mNNLsQGvHbO7GuPPqZ/VmBu3r0CZtbp8V/XqGnshq6UynM+ZhVjyl3DkPI3RzPrBrccZ2yc2k2dPB8mQo8zfaGh/WqNIoGyQ1MKllFujP/PcJ7sFjgNOCgodiu6BYrppcG1AObfrlVuMbhIqka9a/4lFL5erYczzhVjcYTT1AoIZF76y3xEo0pSlFPA3dPCGrUyQWG1sJGDMETZy2ezK/qKG6my8DJJH+KxLKOJxzF9rQEyG8m36P8MRGDWbBtLq8lgvmrjQ02kpUltfyI56UwNTbfcHSCM7147KVuj8bfVHF5GGJEGRxA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d955f3c9-90e6-4df6-9f79-08deeee5d2ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:37.3823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQV4iz4vPM5lY+yOKxfFmYxozbWon851Nnag8iVmoIxdfVL2UOhQayoDXk5ZVkh5v8SOzG/CW4t3a5tucdUtCjJocRqYNUeiYjF+6f+ISOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242414

setup_git_repo() is meant to convert a git repo that a recipe unpacks=0A=
inside S (e.g. via multiple git SRC_URI entries with different=0A=
destsuffix values) into a regular git submodule, so devtool can later=0A=
tag branches on it and extract patches from it via finish/update.=0A=
=0A=
That detection never actually triggered, because of the order the=0A=
function ran things in when it had to create the workspace repo itself:=0A=
=0A=
  1. 'git init'=0A=
  2. 'git add -A .' + initial commit  <- commits the nested repo as a=0A=
                                         bare, unregistered gitlink=0A=
  3. checkout devbranch, tag basetag=0A=
  4. scan 'git status --porcelain' for still-untracked directories=0A=
     ("?? <dir>/") and convert any that are git repos into submodules=0A=
=0A=
By the time step 4 ran, the nested repo had already been swept up by=0A=
step 2's 'git add -A .': git treats a directory containing its own .git=0A=
as an embedded repo and stages it as a gitlink pointing at its current=0A=
HEAD, without registering it as a submodule. Once that gitlink is=0A=
committed, 'git status --porcelain' reports it as e.g. " M <dir>"=0A=
(already tracked) rather than "?? <dir>/" (untracked), so step 4's=0A=
"line.endswith('/')" check could never match it and the conversion to a=0A=
real submodule silently never happened.=0A=
=0A=
There is also a second entry path with the same root cause: when the=0A=
recipe's top-level source is itself fetched via git://, repodir is=0A=
already a git repo, so the 'if not .git' block above (init + initial=0A=
commit) is skipped entirely - and so was the detection that lived inside=0A=
it. In that case the nested repo instead gets committed as a bare=0A=
gitlink later, by patch_task_postfunc's 'git add' after do_patch.=0A=
=0A=
Fix this by extracting the detection into a helper and calling it before=0A=
anything can commit the nested repo as a bare gitlink, in both cases:=0A=
  - freshly-created workspace repo: right after 'git init', before=0A=
    'git add -A .' and the initial commit;=0A=
  - repodir already a git repo: at function entry, before the later=0A=
    'git add' in patch_task_postfunc.=0A=
At those points the nested repo is still untracked and reported with a=0A=
trailing "/", so it is correctly picked up and registered via=0A=
'git submodule add'.=0A=
=0A=
Nested repos are discovered top-down (so a repo that manages its own=0A=
submodules via .gitmodules can be skipped rather than descended into),=0A=
but registered bottom-up (deepest first): a parent's commit recording=0A=
its child's HEAD must happen after that child is fully finalized,=0A=
otherwise registering a still-deeper repo afterwards moves the child's=0A=
HEAD forward again and leaves the parent pointing at a stale revision.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 scripts/lib/devtool/__init__.py | 79 +++++++++++++++++++++++----------=0A=
 1 file changed, 56 insertions(+), 23 deletions(-)=0A=
=0A=
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py=0A=
index 58b02eb460..030ba7edd9 100644=0A=
--- a/scripts/lib/devtool/__init__.py=0A=
+++ b/scripts/lib/devtool/__init__.py=0A=
@@ -197,9 +197,59 @@ def setup_git_repo(repodir, version, devbranch, baseta=
g=3D'devtool-base', d=3DNone):=0A=
     """=0A=
     import bb.process=0A=
     import oe.patch=0A=
+=0A=
+    def register_nested_git_submodules():=0A=
+        # If the recipe unpacks another git repo inside S (e.g. multiple g=
it=0A=
+        # SRC_URI entries with destsuffix), declare it as a regular git=0A=
+        # submodule now, so we will be able to tag branches on it and extr=
act=0A=
+        # patches when doing finish/update on the recipe. This must happen=
=0A=
+        # before anything else commits that nested repo as a bare,=0A=
+        # unregistered gitlink: once that happens 'git status' no longer=
=0A=
+        # reports it as untracked ("?? <dir>/"), so this detection can nev=
er=0A=
+        # find it. That can happen either from 'git add -A .' below (for a=
=0A=
+        # freshly-initialized repo) or, when repodir is already its own gi=
t=0A=
+        # repo (e.g. a recipe fetched via plain git://), from a later 'git=
=0A=
+        # add' done elsewhere (patch_task_postfunc, after do_patch) - so t=
his=0A=
+        # is called both from the fresh-repo branch below and from the=0A=
+        # already-a-repo branch, before either has a chance to do that.=0A=
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
     if not os.path.exists(os.path.join(repodir, '.git')):=0A=
         bb.process.run('git init', cwd=3Drepodir)=0A=
         bb.process.run('git config --local gc.autodetach 0', cwd=3Drepodir=
)=0A=
+=0A=
+        register_nested_git_submodules()=0A=
+=0A=
         bb.process.run('git add -f -A .', cwd=3Drepodir)=0A=
         commit_cmd =3D ['git']=0A=
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=3Dd)=0A=
@@ -214,6 +264,12 @@ def setup_git_repo(repodir, version, devbranch, baseta=
g=3D'devtool-base', d=3DNone):=0A=
             commitmsg =3D "Initial commit from upstream"=0A=
         commit_cmd +=3D ['-m', commitmsg]=0A=
         bb.process.run(commit_cmd, cwd=3Drepodir)=0A=
+    else:=0A=
+        # repodir is already a git repo in its own right (e.g. a recipe wh=
ose=0A=
+        # top-level source is fetched via plain git://), so there was no=
=0A=
+        # fresh init/initial commit above to interfere with detecting nest=
ed=0A=
+        # repos - do it here instead, at the earliest point available.=0A=
+        register_nested_git_submodules()=0A=
 =0A=
     # Ensure singletask.lock (as used by externalsrc.bbclass) is ignored b=
y git=0A=
     gitinfodir =3D os.path.join(repodir, '.git', 'info')=0A=
@@ -237,29 +293,6 @@ def setup_git_repo(repodir, version, devbranch, baseta=
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

