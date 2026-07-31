Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A00C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:49 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=bRy+lYz2;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0SNjXqRPyF2bXODUqIf1RloToWBt4jwhUq2/QRrku01Pq7Z3LXAtK3LuAHRukURioVKgxGlIUhOBnAYOim8f5teapOoTy0CAxTfvVUPaKZX17FksjeYb2QDKTRp1LY40VsbGAEqo1kyibf9xhP00EkhCv8NjhtQpl7CNpRouEW89bMyQGL38Pbw4ejOlpa+/ntAqVI3aTDwmKUSffVBosMcoUMBXHBaBmOOPRVaCzqbez+BBmvOOMSdxBrC93AjDNe4qxre0K+MAb8+7chvgROlDYnNMiHij/kVnlKg8eZHGgTj0yrTyOaicfcPYdaxRdz3l39Fq9xGQPmBGMtlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehwGFgobKnuK1NsPI8i7DPrqoWYo3pkos9f3oUkWiSM=;
 b=c9TPxga85tE3gAkFkOmyMb9zN5vnmiOqnCPMHiJ0JBdi+aaU8vIX5YqthhFmAA9Hko+0y/9ya2L+LVnjL6FZNOYnuY5dr6GBZpJXVtaeQvEThg/ZxorSUz5j/guwy1St/03zwk1eF2nyAImPmL2WsU5LgnC0SbPqPwF1Xq2DcoUV2+1wjPhA0ZBppLpNid5UmHuME58PR8gFg22XZEtFgw0lZtq7ko4TxGTeXkQGkPgHKe2oxlgupVkBdiMrj8/k0GVXxhS0jSBNAlCQOIXuqPcBPvnSwZhtsk4CMyJ5kHTk1q0ZTIh/kUB0I6duEb3XF3kSA1hdba6g6NfOC4qnEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehwGFgobKnuK1NsPI8i7DPrqoWYo3pkos9f3oUkWiSM=;
 b=bRy+lYz2AJ6s+GEevFXJtOfv0lv8hCtOOkzpYZ68VCMInilPm5aEvvwn0IpOOxILwaxfdyHChphWl5SzlomYb9ke0SEG2n4WMjA2V5kZ7BpSQiT4NRIufDkPPFOEB2tptgebkCcC2ytievDlgLB7NXsaO13WhuTtOND0F/s/YmtJQK8F65KvSz+ddu4/fXbG+0lhCA5EnIOgEIDFQNKMcycNz7tJa2PaN85JFG7B5JwWMdsnALCvUE2U3UJ+b9b/AMraWO7lgWrvmQxJEpqmmtau8i7+bINX8rP1GmJdTIqT1dzATbr4aTvF1wukG/qq1B29WYNrJlJ4hPOQoWAv7Q==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:39 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:39 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 3/5] devtool-source: Make nested destsuffix git repos
 standalone
Thread-Topic: [PATCH v4 3/5] devtool-source: Make nested destsuffix git repos
 standalone
Thread-Index: AQHdIM6woWBvYqrPJU67Gb6XFzIKJg==
Date: Fri, 31 Jul 2026 09:26:38 +0000
Message-ID: <20260731092634.1127862-4-jamin_lin@aspeedtech.com>
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
x-ms-office365-filtering-correlation-id: c30e5e47-bfd1-49f9-271f-08deeee5d32f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 pjx76VNxUkXpv9a796Priw4RwfPQ8mE6WtpJWM4hIq9leZsrcJZmxZN6+h1xhAmgb/HoTlbi3vtHcOMb9uxXEDEgdubJ6POccuebZEHdKuZKSt0ivRAOwK+GZjj7NLh1/1FHCi90obI9v5I/aTsfCoilpr4bDqO5U5GHCWZbqjA+KduIFx1WyvfLdFEYvB9O0jaOXRIav6TZkaUlt3T5xgFsc5SlC3SGnRBOeN624ggZvqRA7YN1Iey4VJ5U8whulWFArxcmacOXxUUHWzEKp8iw1XLV4f7t5a36STOGUNA3F192Alu0BG98LspPiS7ql80/ljmxgrcBNtcW4mJ5/V+PSToE4XK6sU5bul3kf/AaGd42woibm3TV0K9nzwCalmfZSv/t62Dd1uvg2ktW5v18V+OfXDSkhuKjhHOybqp+Ie3jVEmKRx5w5nkr4Zm2DWdAIKPV0GRAIcy++6gdUgDgUOwUTVIuru/VD0Ar4eTcegTqpmjxd3yd7p5x414ugoOOpSDeC9EanlDTu4RH/17ayyShcEJWY22M2Dlib3amOeahG33vi2jbkWQKK4q1PtnOLO8MfCHhQWtcE9Pa0jjm0VM7/S8jaTsFbt5JRAfngfndkHyPu2dmWMRAczWQD9dQfdtsa2GQWu08kp21yDuYKk2lh2jKLZLbMri+KY+7F90WZDYOfscfMZmH7DdW3zVUZKPd4CnZjazmFGIloKbEDyXi7YMwA9+OA4NfU/8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1wZuCRtcCUoQDGw0/YR7bxNqWnztGY5rla6ST9MkhQvjrm8ys7OjzWCTsb3h?=
 =?us-ascii?Q?F3XN7dwNdk3zkZm2qpMYgXBxL6D1zOsxLln4vcrjoUq3khvbDbEh1FcRx0IA?=
 =?us-ascii?Q?U3Q5F+wtVflm3iB81MpYeZwLc0CPSJjrj6JwRnKMfkkAIwc15PDBYWRPKlMn?=
 =?us-ascii?Q?oDuR5zlbWt3T5iaWRmLnEiwWN785KwYPg+NhR7KpqB0PhMww5zW8Pp3YsRJl?=
 =?us-ascii?Q?bnlWHdcnuGbAWAPT5U1qwyCtC4Ce0Wml5ZcdWkNsZs3Tbj84GwPBfHZnx+RG?=
 =?us-ascii?Q?/WfTs8LBuCmTccZR2Fz55YMg8+S6oDJcn6G7DUmlzPRCNsKjdmr0CbPFH7pQ?=
 =?us-ascii?Q?XIS2sZdMNq4UPX9tCevrGyXCm0s/FvBezqX6itVNFj8EDJFb3NYUOPUKGVX7?=
 =?us-ascii?Q?AJP096/uDUK5/D70Jz7O6JvB3E3Qf9B4WLhs2NEE7DTY5gCzRXKqWW78mSXb?=
 =?us-ascii?Q?WDN5FAY2/8RbGkrKsGP0N85RKr7eUVGDqbpb1z1deqGvjcIJivlRPwTXFXlr?=
 =?us-ascii?Q?qSkoQichred/6/CP2nuq0MwGYFidVcpQrC+EZtZaRMo1pDweS4icoKGdpX1p?=
 =?us-ascii?Q?uH6jstgHy3cuSMMAGex9u19S9SqVcszBBokMaSmAwweJZZ8L/FEiQ7ze57vJ?=
 =?us-ascii?Q?625IKG6OcZQ1XG1scX9J7YcKqPN2vqfNkY7snKoz78tQJjhGPvMTwvSi7Z6h?=
 =?us-ascii?Q?ux8vfj8xc9+aQVx6N4aYjKBeoJ4q6ty6HdVAzNJL91WaJzRQLf6yBl/hZ3NQ?=
 =?us-ascii?Q?Luz8Qnw81xP2l8AmPIUkjqojxr2v+hrnB43K5PvkBGboX6gZIUoHo8cC+j5W?=
 =?us-ascii?Q?9Ug9D7qkOE/QO5wrGwNYrFY1wlizYiAgE8QPYJc+mV8KWM5bbUc8anYQBNdm?=
 =?us-ascii?Q?6S+fNAkivNdry3Y1Ze5j6hlwJhI9IBrXDkWJB7t2J5/48n6Rr1bcxEoT93a0?=
 =?us-ascii?Q?oZi9Me3NPrlaD5x1yXeLM0AzIl/oP9ZuqzvDdy7oO51Pr9BQ5rqNferep6SB?=
 =?us-ascii?Q?n93jWmE21lFKs0ATBhbFwLLqSeEfWmFZYLJ1/v239uUo0lj2J0CVwcpj/EHO?=
 =?us-ascii?Q?ld5+peFzFy5sRfxSH+OwXshYdH2HUGJqomPf5JzEeM/Z3GMnj38WdwcSoIlL?=
 =?us-ascii?Q?WbtpqqeYMdqqQ4APIokO1J8H9gkgRR9MKftvsI6KIYyDuvtHhEoQwa1DgGmr?=
 =?us-ascii?Q?62ONVtwxYzwDvy6k2SS+oNHuwtk3teW6dtJcfJiP9AYmTghvYvP4DwqT299i?=
 =?us-ascii?Q?7nzjyPczp3ziO2iYnykb4LzoFGCfuasVlmw6IralU86wJKBrfCMwKKY2TbQf?=
 =?us-ascii?Q?6/uHs36he5qmiRVZYNZhwM/pDIexyO1eIpZxO6OTOnKcT86lPCQmBLcOFEZ5?=
 =?us-ascii?Q?ILI80N7Y64KJmANzk4YZx54XduDearattl5Sf7HDjh7+jKak0ZGTT5QodSXR?=
 =?us-ascii?Q?XsXW2wf5KLszopPeqXqkJZhHPMcsWOiGozpjElvlajrx8+JQQ/28S82n+PFw?=
 =?us-ascii?Q?ceCD+11Nojymob22hZAGA1glWDNQT2qPHXtsaM5uibX+xxW6igVVw9Snr74c?=
 =?us-ascii?Q?cUIGvm5hMXOzWDz+rlqdQaJ9xQBa55DVD+eeDkPS7ljsNI2jn1pJ+MNPHRFn?=
 =?us-ascii?Q?2jYCPN38thK6t2LYlpl+7uzh4tGz1IAf2v7/g+Re1iPsbsvIVGAWGduU/1Dx?=
 =?us-ascii?Q?ofRIXTAGNDDpimeumCPVCrimZMs3lVyELgo2jIZFliPPk7nuN81AQGJuauwL?=
 =?us-ascii?Q?H4jBj3OzcA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	maaVM1Qb118xSljH2Y6xH5kLG/46jIZDrRGXE9iupQ3kWheZtt91HPckUQTfm0i0Tql8FKQSBu7Za6oPEJRDuYGyICZ4wHOkiqE2N4qAU4ccFF3M1Hqu4ApdlAB/s0EAOl3pmPwzk1tveslLV7VDTGmdMgr0bpkllV7zSxyKSkmvuykY24grOnbJxruifgtM/FNGKo6Fzx38bpUfT2/zFAGgQroHAbi2gOfCDHB5I8vv1hGDrEg31DbaDLhixQ3qwCu7ofA3lufcNKsn5Ya9rcOxBfP/KWgLdEukEr2bkURbc0RoRwOXg/gnNBuQoRUyi/vu78+ZHhhgli+PGnY3Uw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30e5e47-bfd1-49f9-271f-08deeee5d32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:38.4189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fS/x9qeTZb3u1pwzY3b8d1cldq9Avkr24UVSGBwee+6MUZNjCZJTwrouv54k4SN9Fi1LXnq747j2hG94PrmMfDeWlNpZVGZ2r9E3WWY+fIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242415

When a recipe uses multiple git SRC_URI entries with different destsuffix=
=0A=
values (e.g. recipes with separate repositories for the kernel, modules=0A=
and application), do_unpack clones each source tree with=0A=
'git clone -n -s'.=0A=
=0A=
The -s flag uses git's shared-object mechanism:=0A=
instead of copying objects locally it writes a .git/objects/info/alternates=
 file=0A=
pointing back to the bare repository under the downloads directory (DL_DIR/=
git2/).=0A=
=0A=
scriptutils.git_convert_standalone_clone() is called by devtool_post_unpack=
 to=0A=
make the top-level source directory standalone: it runs 'git repack -a' to =
copy=0A=
all objects into the local object store and then removes the alternates fil=
e.=0A=
=0A=
However it only processes the top-level source directory. Each nested git r=
epo=0A=
created by a separate SRC_URI entry retains its own alternates file still=
=0A=
pointing into downloads/.=0A=
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
         .../downloads/git2/github.com.example.module//objects=0A=
  fatal: bad object HEAD=0A=
  fatal: 'git status --porcelain=3D2' failed in submodule modules/lib/modul=
e=0A=
=0A=
This halts the BitBake parse phase with a CalledProcessError and leaves=0A=
the workspace in an unrecoverable state without manual intervention.=0A=
=0A=
Fix by having devtool_post_unpack() look at the recipe's SRC_URI directly:=
=0A=
any git entry with an explicit destsuffix param names an additional=0A=
checkout nested under the source tree, so convert each of those to a=0A=
standalone clone the same way as the top-level tree.=0A=
=0A=
This is deliberately metadata-driven rather than walking the unpacked=0A=
source tree looking for '.git' directories: a directory walk has no way=0A=
to tell a nested checkout from an ordinary subdirectory of one, so it=0A=
either has to stop at the first git repo it finds - which then misses a=0A=
destsuffix repo nested inside another repo's own working tree - or keep=0A=
walking into every repo's contents, which is wasted work for large trees.=
=0A=
Reading SRC_URI instead gives the exact, authoritative set of paths that=0A=
need converting, regardless of how they happen to be nested on disk.=0A=
=0A=
Only entries with an explicit destsuffix are handled, since that is the=0A=
only way a recipe ends up with more than one git checkout under S; this=0A=
also avoids having to duplicate the git fetcher's internal logic for=0A=
computing an implicit default destsuffix (which depends on the subdir/=0A=
subpath params and BB_GIT_DEFAULT_DESTSUFFIX).=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/classes/devtool-source.bbclass | 16 ++++++++++++++++=0A=
 1 file changed, 16 insertions(+)=0A=
=0A=
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-sou=
rce.bbclass=0A=
index f29f40588f..940cdedbac 100644=0A=
--- a/meta/classes/devtool-source.bbclass=0A=
+++ b/meta/classes/devtool-source.bbclass=0A=
@@ -97,6 +97,22 @@ python devtool_post_unpack() {=0A=
 =0A=
     scriptutils.git_convert_standalone_clone(srcsubdir)=0A=
 =0A=
+    # Recipes can use multiple git SRC_URI entries with an explicit destsu=
ffix to=0A=
+    # unpack several repositories as nested subdirectories of the source t=
ree=0A=
+    # (e.g. recipes with separate repos for the kernel, modules and=0A=
+    # application). Each such entry is unpacked as its own 'git clone -s' =
and=0A=
+    # needs the same standalone conversion as srcsubdir above, otherwise i=
t keeps=0A=
+    # referencing objects in the downloads dir that 'bitbake -c cleanall' =
removes.=0A=
+    # We only look at entries with an explicit destsuffix param, since tha=
t's the=0A=
+    # only way a recipe ends up with more than one git checkout under S - =
this=0A=
+    # avoids having to duplicate the fetcher's internal default-destsuffix=
 logic.=0A=
+    import bb.fetch2=0A=
+    fetch =3D bb.fetch2.Fetch(d.getVar('SRC_URI').split(), d)=0A=
+    for url in fetch.urls:=0A=
+        ud =3D fetch.ud[url]=0A=
+        if ud.type =3D=3D 'git' and ud.parm.get('destsuffix'):=0A=
+            scriptutils.git_convert_standalone_clone(os.path.join(unpackdi=
r, ud.parm['destsuffix']))=0A=
+=0A=
     # Make sure that srcsubdir exists=0A=
     bb.utils.mkdirhier(srcsubdir)=0A=
     if not os.listdir(srcsubdir):=0A=
-- =0A=
2.43.0=0A=

