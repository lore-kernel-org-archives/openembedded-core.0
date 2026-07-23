Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257B4C531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:39 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=iMsAoNTc;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI+WlOILC3Ij2fkPx/aL22dKVk1FlftH5c5XDnpaUWUzmbtTwqSRRskI9G9KkQRRNI2c2J3bc6n0rJ+iFQQsCeHkm1AucbzSjjMCTvT6lqgEAQTFLzgov43cNJLMetFBGPIcgPW7fDQVwPlGFB3BVSriOaOfTcNuemi8jUt/7I8O9d/glNLu3sW3dgn8EGbvF/KCo2Tg4iqV07T8nXjpKhSaxSPNye2Hb+isjSo7AfK67LbIVJ/Q6XYveUkIS4qDmkgbEjw534WxFMttAupwby1nG8RAzqMmmMYDOvBD/S2sW8m02i0GscaZTgqR8fsORDrqAEe24pDybNSJNMbdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY6iQXP+e3YsnoMSC/GRTy5D2+zf9JPLpJyl12d78Eg=;
 b=R4m3mwzIHZCjtAseHMRBHzBrfqQvunHyaOebDDxLJjyytvD1AminWDoYyL0ZFhfxTqpt5mWFpQIxHj1KVvkWmvmEMzy9yKHBCBNciEggpXl1AVbZBpCRJnz5w6A3NzdRJJ9GrJBCAkPYEi+s88T9M1UaP4c14CGRJL80pvstp54AYn075aZkAgDkdZ779AFqJHuIIgf3efwQFfArl7DSVvkujIR1f8eyElXa7weacinE+eFg9nKAAeNNHD7UsUOBrKQkD5Z0WF2Hd0wXmpaZ2V9MAh0ddnGstQISxkF948mtrtSLFwOpumZnPUcgD6BRmZqJllnSfCYZXzJo3IH9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY6iQXP+e3YsnoMSC/GRTy5D2+zf9JPLpJyl12d78Eg=;
 b=iMsAoNTcWpn0AqYHfv6bsbSzBRErBNMpKw1JpSZ9TBWF4L/v7AjBh161afY8kSdNF4cZIX8J6y86XOPX5f2ED9qYlq8b3+FJ3kN/onrRy2q9Z0MLf2WPd7w53VIp1ROYCHv255NZIoOPHUVzpg6g9iBebKSNAFCRlgxUvGnEBnEjgkg1avblesXNBtNWV7Hlkr8ezc8LFj5XsH8/UuR07CvHoCIWY0pve6iZPsMilO2yubJ5b1XW5NU6jK4NdS0mH1N78cEkN97x/ZKd/O84rWiewKDOUhaXx4SfiR1BWH16NAiV+DNMeBRRKiGoTbDR4duwph/39RVRRS1isMgAgQ==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:22 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:21 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 2/5] oe/patch: Skip commitIgnored when nothing is actually
 staged
Thread-Topic: [PATCH v3 2/5] oe/patch: Skip commitIgnored when nothing is
 actually staged
Thread-Index: AQHdGnrYvcKwCcy9lESTd8cfpmmSQg==
Date: Thu, 23 Jul 2026 08:11:21 +0000
Message-ID: <20260723081118.1558249-3-jamin_lin@aspeedtech.com>
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
x-ms-office365-filtering-correlation-id: 5f333e09-883b-43a4-539b-08dee891fb56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|38070700021|10067099003|56012099006|5023799004;
x-microsoft-antispam-message-info: 
 mV4SGN9BqQxvRxXLXt9kNBkXTEE+hDFCGJtvpqnO34gsX39YEg+zIJOTgdMFXBF4lG81n0WNPXlOnpcLUsbR406bg2IQGwONpPeg0UtrLAO+XqB7g6S8cZ6kyGGo/z3ksGlBKPMwgthhJGD4Q43pq3+Fq31FI7jB/tbg7qMzX90SnBxOfsqrvuBmH9rxkYObMjeBenpbQ0NLvPnT1PsjtJu3N2jgR7xSR8C6Zfuo+haNk+uO7rMUa9Ij1jKWinspYnDff8oyWzvaDh0THB7wzcmYzdZvgoyIo10tnKx3OXcAwmUPldyEZLxrnqlV16DSWMPaXH7ivRmAjA73MBaVvoKV00JHk4RSoQe5AykEv2xLdwec+l+y9XsVPSAohAeuvngLI9MRUnbMd/E01T3bs4myu3YL636Zb7KvXJTmkxk6O2Uo/u8/9QjdvF1dGvuwwB6JIKnk2vL0LM7UP4zTW/aPffOx7gAc5W6QC2VzI16I/MruHjbVaACVSEu8d2EMLF8LoOwRIu/Zo+6Iadi+1ZW7PbtRs4q8wUdzAf0d3XLmh+v/wYUxKLsaZseZVM7zSzVbYutQbyxLDgrzM3EgG8XzqxE5dkG7TWdJSuJcsPKzhnEh8PhK/HTqD+NGWX3eXmUreutV6T8NbLyR61JJ44ZHsP/2AAwOguQi9eTzu4Bz4lyo8iLUFlD25f6t4Mwkc//A396oCmM8BmTVR9eD4zq6xCcpmMvfGHbKtvR9Vyo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?T/wwp4j1wJKNdaA7wA4TXeZDsBg6PloZCG/Qh7UXJ8VJr3JGnPk12h49kPDg?=
 =?us-ascii?Q?WZ1DXOdtnjI05Pz+r2qR9JmiMxt0XHA8yLKX7TbjJ3F+ir0DWQmO8w6SDwsv?=
 =?us-ascii?Q?oyan5P71+YFc9DJeFftNiZZ3CNdgemUPt46yAEuIZFfJ0Ezhuo7LwHt7dG3O?=
 =?us-ascii?Q?04hq0DR6pTyktT8NGGB77OYoAZHQmImhytsojzEB1vgkSlMOZ7HPGdqVX3F8?=
 =?us-ascii?Q?JmveZoFMh/LKF6YAZiI7QxbeEgHlRGMlBwXD5/DsVMcL3iyTH8abGKIVKRSV?=
 =?us-ascii?Q?NeyP33HNMMX1wXZRfjLtFRXCvCgQyozWM6etYnhlyHnIbcASc1OrFZfYLnj4?=
 =?us-ascii?Q?N4zBLkP9UcltXPm5hU1vgqz5R/+y3avm/2KsS27n+Adla5N43xWAwDs96ae7?=
 =?us-ascii?Q?uZVG1pldA+50yDYTn7GXy0jSXcnLuKPAs2DhWLmS+XfUZ70kEOFH5YgAcsAz?=
 =?us-ascii?Q?gwYcHCVcJOYD2ZOi8c8Y+5s2eJnZpoSTts7EtZchbHGZZte37Kn76SmpEpzK?=
 =?us-ascii?Q?lD1eOMWuZUJHK0ZOjUhctaIJvymoHKi204DXS3vwAPB2LtS2b4OLOFJpOulM?=
 =?us-ascii?Q?BDmaTGkAR6sGgnqTdH5B90lTPFU3tUubCFDWFCujSDBCZ2jDyuJBYhYNLzdl?=
 =?us-ascii?Q?SmqQmgNuQblWheEdjp1FCxChNdE+ZzzZ2hVLBB3FkUDqZfkUyG7zRKXdmfdW?=
 =?us-ascii?Q?IaKcq5+yrOiqLOnTuYrCA88maz4HUhYaVhajdMISk84498qpaRpgobf/Qbxu?=
 =?us-ascii?Q?OwCgKqhpBq4vVY+V5IYYfXYXinsC15CnmR3UOtRcqaxW/jqMgVSD7tqaj+qf?=
 =?us-ascii?Q?8FFoR/b9pUTRIereJvq1mRTXpq0vsMg/H9aMgAiXhrYyR5RjwCk9ZlRsBAcx?=
 =?us-ascii?Q?QQxCDVzSJTaNTGjPysyAyWjUPRtfN4RB1xrMlqsZPvMVBVY5FHsk6j/GsvfC?=
 =?us-ascii?Q?lE7BujTqVVDTiafUTFdJbGWSelfYcCWMxrfFxEQPOg8ITLWLOlQHaiPGM7mg?=
 =?us-ascii?Q?oax5iFSmO7vKsp2RfUWsfW1OEmii9IUqiISA1NqHeShsscB/hmfle3cJmhCg?=
 =?us-ascii?Q?o8NZ7x56q42+nW86I+N5fnOcZzJVhyrTDHo4FbkPAY1mWt6DFNj3TWW2bfp5?=
 =?us-ascii?Q?/Lwc7VcK+xb2PYO76wMWQ2JxgJzJCRtxJiWME+7zed8PhDWPqEI6rf84LucH?=
 =?us-ascii?Q?LbJ6H+eNkh88LthlYCz5LvOuXKLVghzyTEBsoX9sENzBHXkKPvauQP2aARgW?=
 =?us-ascii?Q?vHFjJD4rOB59is11l5WF9SXRRdVlIZQwIjD0j8MSmWQUR8IvtV5ynBg820cf?=
 =?us-ascii?Q?BIYezmwfY7rxw5JHbn4bsxcodNYe48K3mS++jaUNhU4lrkXDQr3moKVXqPOm?=
 =?us-ascii?Q?2oHl2KvcIkeTLLvF7Xj3J4iA8TRYssZKdja5daSaUYWszNsvjSh503+ZB/Mc?=
 =?us-ascii?Q?fsf3qp+ca/TprkCEznjGbFftINBa8UdsVqXL/aEFju3jkpdfg+PgFwC9oBOq?=
 =?us-ascii?Q?YB9QHoe48qwlHhUyywBWM8NJkMTFD46VexNXqTfNtAP84Mg0gFElb3nKUxDF?=
 =?us-ascii?Q?zCiTMhAQZ1SOQ7tQFo4ZBSEWKBx02mTlb8BbcoOOofpuWz5Jz8IUYvOukgZB?=
 =?us-ascii?Q?HLMOEylA2JgW65/mO7fsxg0m3Q2mjcADa0v7pgwIY8loa1T/zZPEk0m4G3tN?=
 =?us-ascii?Q?9AIedYslxZ24wFb7i6ZViT4/p5gCuIMjxcW/Odm8uy+Mj0WSpsTTQ0XD/7G3?=
 =?us-ascii?Q?O0+kqxR5wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	IAtXNpXszEvr/e9qXWRk06Gvl5LdN5BzWq14kC9T5NNL9ikd1WIc5aoEIOg/aHCMf0g3SKe/hFj7T0d54EA80To2Fth0sV0fyO6SCpgLbM0CV4lZPjdxdOvknJ9RO0oyou4Ep9BAfOTSXRckFWHjn+VxRCOtvxpbjQKj40+1V51VSw0WRwdUt5aWxevV7VERMkw631rnyo9svQK/VE1xdwuPv2sMKKYzY8Xnd78pcgPM+o1BUAE2N1EO2sWFguJ/dLBvS5fQN/kZGF+wvkC2KTULzjVy0Ci99FHDDwxc6ytnxavnKO7nuE8B7RZpD8yuuL7vdXO//PmLL/MOEOd6Ug==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f333e09-883b-43a4-539b-08dee891fb56
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:21.7740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h207lFAF/rxeJo5gmRVQY2OHJwTUWlIuchB5stMmqqXYRA/8pHLZNkrGFnpTiFFFRKnHQ8v7anZxl1X0I5sHnK6tpinwEgp3wDB+N2GDf2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241785

patch.bbclass's patch_task_postfunc calls GitApplyTree.commitIgnored()=0A=
whenever 'git status --porcelain .' reports the source tree as dirty=0A=
after do_patch, to snapshot those changes into the devtool tracking=0A=
repo with 'git add' + 'git commit'.=0A=
=0A=
A path can be reported as dirty by git status purely because it is a=0A=
submodule (or an unregistered embedded git repo) that itself has=0A=
modified or untracked content - for example a recipe with multiple git=0A=
SRC_URI entries where one destsuffix places a repo inside another=0A=
repo's own working tree. The outer repo's tracked commit hash for that=0A=
submodule hasn't changed, so 'git add' has nothing new to stage for it,=0A=
and git refuses to fold the submodule's own dirty state into a plain=0A=
commit without it being resolved first:=0A=
=0A=
  $ git commit -m ... --no-verify --no-gpg-sign=0A=
  Changes not staged for commit:=0A=
    (commit or discard the untracked or modified content in submodules)=0A=
          modified:   level1 (modified content)=0A=
  no changes added to commit (use "git add" and/or "git commit -a")=0A=
=0A=
'git commit' then exits non-zero with nothing to commit, and=0A=
commitIgnored() propagates that failure straight up, taking the whole=0A=
do_patch task down with it.=0A=
=0A=
Fix by checking 'git diff --cached --name-only' after 'git add': if=0A=
nothing was actually staged, there is nothing meaningful to snapshot,=0A=
so skip the commit (and the note it would otherwise add) instead of=0A=
failing.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oe/patch.py | 12 ++++++++++++=0A=
 1 file changed, 12 insertions(+)=0A=
=0A=
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py=0A=
index 1d50e83ab7..944dde1e03 100644=0A=
--- a/meta/lib/oe/patch.py=0A=
+++ b/meta/lib/oe/patch.py=0A=
@@ -516,6 +516,18 @@ class GitApplyTree(PatchTree):=0A=
     def commitIgnored(subject, dir=3DNone, files=3DNone, d=3DNone):=0A=
         if files:=0A=
             runcmd(['git', 'add'] + files, dir)=0A=
+=0A=
+        # 'git add' can leave nothing actually staged even though the call=
er=0A=
+        # saw a dirty status: a path can show as modified purely because i=
t=0A=
+        # is a submodule/embedded git repository with modified or untracke=
d=0A=
+        # content of its own (e.g. a further nested git repo from another=
=0A=
+        # destsuffix SRC_URI entry) - git refuses to record that via a pla=
in=0A=
+        # 'git add'/'git commit' without resolving the submodule's own sta=
te,=0A=
+        # so the commit below would fail with "no changes added to commit"=
.=0A=
+        # Skip the commit if there is nothing actually staged.=0A=
+        if not runcmd(['git', 'diff', '--cached', '--name-only'], dir).str=
ip():=0A=
+            return=0A=
+=0A=
         cmd =3D ["git"]=0A=
         GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)=0A=
         cmd +=3D ["commit", "-m", subject, "--no-verify", "--no-gpg-sign"]=
=0A=
-- =0A=
2.43.0=0A=

