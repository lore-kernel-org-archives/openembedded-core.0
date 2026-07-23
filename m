Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE21C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:38 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=O4dWAYzV;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYPzWAkVSZP4Nzsef9VM25hN1exHGQUkC/526GjiyAsoangt7nkaxshYfyNiXQFRfBmHampGmxb9D+EsSGq/MdE/uAnDx5JTJ5SjJ2cQSL/3Minql1+HfBP6ViPejabCitluIHHYRROEqga76tzAAIxX+b/fkUFCiwE+eymrdA2mX7CQY/kP12UaISyfLrtx3h56LacI8NAuTmsvh20GiUzYqvLTzZuFKWLpZTkYybpe27sdKR7JZuQWNZzbDaBUTxl0/GdBsbKuRdeIMYrmel5/rRLeNxDIN6Yq3W5M0x/oSZ7GKtr6Wnf82Ycfr1ngIaFv3p/S9FcNv79fgr9VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehwGFgobKnuK1NsPI8i7DPrqoWYo3pkos9f3oUkWiSM=;
 b=IHDhgE76Hbc2awLlvGX4kwhNmWHU4XIjNnekx8UjkcC6duHnfmTeLh2Rm7e0lMHKz8oeOrEAPIhHi73QcymcG+UymexHGtWu53Iw/XwdLMFNh3yLqqqiU6yl8Fk5FHkP4KEdfmnW45Etn3qhF3NyR6gJG9pEGoqeUb2kOdR4lfg9BX/wZx9C5bAg+q8XgD5MFgwSb6ke53NFvmIsy7NucEj9Kja85RhD9ibkqB4jC5UcV2QYTJZNe/+OwkwgX825HIWhtEvVzk0iaofEGm34DrR2+QvGwBr7Jsj9Sv8aWnOCQLKcbNjHlQT0nOrAxRQhSalnzmDVq3wQJLknIlRAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehwGFgobKnuK1NsPI8i7DPrqoWYo3pkos9f3oUkWiSM=;
 b=O4dWAYzVZebc4xX725wjs3YtVDu9HazxZQBikNPj1lfneOnk5kElf7UtbWa8wApkw2plZdswnpe/nvEu4o8Pk4tzXDtkMtV9V7lz/k6fNGRmtC6lCklGo1iH2Ja9I1AfvsPDxUyaWOQtqrwLQ65ngN8tWyu0kHVEP7sa+QRD05roZA7Sw2K4LS4ntkSyc+bHWJc+NBnteusck7RCjYljRFpOfbUlilfpvy1HiL5rxbWux2ZSrPDHMWb+sjHcIX/vwJDewqjOPAsnxM0LYlfTu3Z/UB7+vY9W8dyT6hzTsdXMNZcGKe+evoL/YK3OWuMQXVXyGjIDKMoSSkqA/Eaatw==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:23 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:23 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 3/5] devtool-source: Convert nested git SRC_URI destsuffix
 repos to standalone clones
Thread-Topic: [PATCH v3 3/5] devtool-source: Convert nested git SRC_URI
 destsuffix repos to standalone clones
Thread-Index: AQHdGnrZtiIoNhwZ3EODfKkGkiR5+g==
Date: Thu, 23 Jul 2026 08:11:23 +0000
Message-ID: <20260723081118.1558249-4-jamin_lin@aspeedtech.com>
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
x-ms-office365-filtering-correlation-id: b72a21aa-ab71-4bd8-37f2-08dee891fc45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 0ALcLFD+JIdyws1Ww1ZXbUBi42qHS60+x+962vHiXoeAx0jcpdSBk64EcTCZZvHUR3RfLuM03eX5OEps3HggC5+IVzlEFaMuA6lKWfAOmBrKyfVk+XiNC7P/CHzO6To7v9ZGB0f2jK16e47pWQt7rRpOpLRjbXrtKDEtgvKCvc7WzfJ1CdlxH5FARHZFQAlauVP4AcQE+JRmuKL0v7l/7/8tGrwWajox1hAGZf2T3wgm/E5uOArdoatcPDl8V2iga2dg1TLL49tvYzUCxynKmPfXTZDuFmzzbptMvf6C6Nsuqbv9NPUsEUvS3Le5uznUBPPi21ipCN5kfYGGTnO2SBLs3+Of+uYu2kFBsSKWX9w3W5pzjkGh6Jno2a8/9T3BCoTK2tmEISgXuB8c5ivS/F2V8BKQURSl7dBdEv1hDGdYRc8FzMQfzbWPHZ+w/lOz+5k4WCupNvVJRowUFb4xcsd7nJ1KL2CV+vw/2wXlWl7+h8ntNIJbsT7y8YQB8elXSWnGWj61mOJwpvVbHMEwxx4bfeS+3LI9raBVaEuLe5H4t1YlB9P2XqFs/Kq3VcZAI/9CLdusuL7m27Z8x2m6C4nRN+UzcxqiumuR1s/o0dSmO1kVY/PBtZrBETq4gv0+6PPqIyMkQrULX0ZYix1TaVK2aNr26Y714nzZlyjSBHGKSa4rUnZlSmh5+kpA+VHtxJ7BLNbzonjE+RY7ce5X9NG0cbgtbz2enyjFwIjUL3o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QrT8sMpJNp/LprH2RW7Udo5EWWNQFm9gBlWYA6OMtWUoS5tSlnh+Jy24tyE7?=
 =?us-ascii?Q?lCXMXBoKX4zrpdBC/Xd1InFkHmHf/+awYAX/3O6JeYmkL7K70G+MjMfR7cT6?=
 =?us-ascii?Q?6CPfGwty46obadtNPSn3MFSfyWevL92JQgKzfAiay4iJnALiL+H7z4ROZVSw?=
 =?us-ascii?Q?01+vYNurF1DvPpyO+QruYhuZd43bjEl9bDuVr63ManpdXsTn13G8UgvuDX0M?=
 =?us-ascii?Q?vcT2fbFNVRxiv8PpKcsOizvpHYpslU3muJOk40O0faznrCNFCqq7FICXk5ef?=
 =?us-ascii?Q?JMpk+A6j6RRp/pb+s9IOO8CAiVVwypDPkU9Yiv9G6MJB28DD3WZXESMxcWw4?=
 =?us-ascii?Q?sz8aEFmyVHDvSpZKiUGZyfnhemdWxlyvtJz82q7YpfRenygQhHRe/MnSf2qz?=
 =?us-ascii?Q?Ly7+nEZS9o9yfR3qyTERFXbCDGLOOmkBs8mxvI0N8xiACV4tpK+JsliZ+6JO?=
 =?us-ascii?Q?EKB0LodIgHbTZmJuEHb3ewKnFOYIkkBNKrBYT9Q5C6WpNUnn9s9fwB2ojOX4?=
 =?us-ascii?Q?7ABoMDlWNh85jbw4fwIFw1a9XnsT78Fkgrtnwf2B3Wsh/oyQ1WgSnVv1fnq3?=
 =?us-ascii?Q?Z5eFQNarX7/KGrvcegT+1Vv0LXKi781n5mkaFR+vk7ED1RoEnNhiDqBsIjOH?=
 =?us-ascii?Q?4y1EQbzqUngfCoWlaFkUBwfucUcdoPFXoUCs4QuUyZ533PVY0y2kgtIqMokR?=
 =?us-ascii?Q?fJc18A2xDPW+FQfullyrLDF5oE9znkH6ubMo2FWZwqB8ktJY0QFAVCE2c3Vx?=
 =?us-ascii?Q?0h0ZcDTrEnUm+y3mT8AlMv7PuKr2iFx03lkbKVG0vziR9LQoY/Cp8zidyd3H?=
 =?us-ascii?Q?2Ibh09IfFx0FZXebuzEPnRVZBP+MsyO2c4a4r928ptp6Th7+bAjZme7jvQpy?=
 =?us-ascii?Q?vXVEyoeRMKOGinvS20xzCOGekbL7K+LdLo7Vo363nJ6EIBaUm9sa5d4euZT8?=
 =?us-ascii?Q?K/7ZPv9rXlg9NM0czZAVwJdmgUYG75cbfLszbaG8SBkWppu7FfM6kk2DpfrF?=
 =?us-ascii?Q?DTrvc6oY6dynVZyBm8DWDH+Tnd9P1kOYuBobpxNZS4yuZlbUP6q7MKHGBDfW?=
 =?us-ascii?Q?mr+PajOxuiwDmvPC1PCmAzDI3Uy2afkY1kIj8mZD4BSp8sgg97kqAtPuYaEk?=
 =?us-ascii?Q?LTkdUsXR6NhotMoX89CS/OzclClFxk0eJf8qWVfpZf4vLMmPiF6kU1C662I6?=
 =?us-ascii?Q?lBdJ1AQp61A+dCzIOvaStCwShl7WTU/LtkhKp+2dmQht4twCOUNbD4MXDtmZ?=
 =?us-ascii?Q?vBKc2Hp4iNdRpnakOdqTY15bRXkUXi9BJmciyACoH2dDtultZCTwckQQMovV?=
 =?us-ascii?Q?tZZSn4IS3iM/GPKnDTUZUqa/v6Ne+w6ZZSLrv9RPT2NKXaIPnrisqpfulnBn?=
 =?us-ascii?Q?fK9aLbu+Td/s4OhqWOsPVOUmX8I1ECin4czNTkFpsJ966Whmgqsqru61GO0I?=
 =?us-ascii?Q?qfDQ7iOtBO5nvsIG/m4N+jdpwxJDi/dB3KkZv44jrwOzO143LckcGUet3WVN?=
 =?us-ascii?Q?mdCmsTcrxvzJQ3acyyha9UNQdUDUXCXj0z4g6Tohx05aOZ8/BlC5T+sF5Bbn?=
 =?us-ascii?Q?HqtacWm8mCASyFs1syLOApRbCzHcmZQEFJar8wBZ1UkxeIC2qAHg3wQKFAN+?=
 =?us-ascii?Q?cc/IuLy3+PijRkDLh1SmFpW3OxQreXRdaPWKwdrlON1UQuX2Xh4GM1YqTuKS?=
 =?us-ascii?Q?GZMBhPs3FOhGhJEBlcK5zlaYILQOP2A3jfgSFCBRyiNA/ZskCmc1EEbk0iQJ?=
 =?us-ascii?Q?xH/2BDEoUA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	UYSBGf1mmpGFWnFPX5WUJ+UeGz+9VMJAXGYZapdBImeTCtb1CrzL+yQ9drnBi38e7fy2vU7Z5HDQueoFp25KzMhfeWr7/ZLwx1deVilEmSa1MMZpz4APsukKt8eqXLFWSAeeorABy1EPw+xPzck/pNeGRZVMLkHwdeUnyN6RVeoEh4gjW3ITa/JEqjPgutvgQz9xgUt7rGe2EcxMKlSzmOVh0dwnkDLGmZeZc7CsoxchQmmunlgu+Wy6sz++GwymXCYSvXm22nNnI8AHOY4ECXhFTcaC5eKNQB/VMxkyXPEgKDrZkhfLwtAfPwcDdKF48YUOBO1/3wCwdHctz/1Aag==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72a21aa-ab71-4bd8-37f2-08dee891fc45
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:23.2634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQjbgjMIbXPjUywX5IcFUve1AjQB9fxKqRSVpGAFjizngxi4CF3bbAy4rnvPQkSXjPEG+WgrGamHRI70jfDC+OKw0Zh1SAt2nFxSAO44WNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241786

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

