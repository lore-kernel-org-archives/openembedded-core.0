Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3993.1795811477544034289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=VgWtUIOl;
 spf=pass (domain: prevas.dk, ip: 40.107.159.3, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INuZbNVtgMhg5xu/3/W2INFSH+yPdapbG4za1nublu/eRjHupvQ2szSJmwvW9SGWMX+/Rwjos4+VzhujcBRw2bFbl8Y0HurKye8gsYGMTmdpKnUEyrKB//aytYpwCG3ert4bwnhF+Gxl5LZbnK2BoJCugQ5k1vtQGIpubVFkx8Xq++YRuqLIfNkwK1DXNKJGzScna4Jz519JKR+LYV1Dfuia5FWrvbb3BMP74j47uF25xviJQ7NYtYeZ86cXgHOxwcoeAhQr8V/M1RqzRTs/o28oOhXK2cY+Wr4s/LZ8bZj23bVcIfm8k1/qj01zgpLsfi1GB1I3A/AXxLhGkcvVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz6rpJEmE59MTf5+d/crFmMuIK5U2F91/vxkXBsM3is=;
 b=WuYxTvRkM2kOjGD5UKo8agnWcurFvqzVxsHUJluxwVza9tF7v9IrqyvUiYwCTkEYuhKfWoWtjP45cLVDnwon8gJnXsImEDguu8gnWEkvvGyVu/lijrUiqg6nDeLThlBaCxTED66WwKHcNo0z6STtvKdw82rJs0qIDwFseWFe6zKqoy6OCMnZb8a/xZ2Nn8DUfM1XMOIVhlWlJQ92crgpveSbfZ8Uqv4uftloQ0GlM7T01whwAsp7BQhveL1npvF9aPeLbLmyjrQEaN6agIx2QTHAwB75M7jeifz7x6+9qTiLEPkz/UzIEIYXaZ19NJal1pLXQRYwlvPHmdq41/V/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz6rpJEmE59MTf5+d/crFmMuIK5U2F91/vxkXBsM3is=;
 b=VgWtUIOlU5G0K4ahRRFfyw05l5RenDnHKTpr5e2KsbgckkOFJ/QfCJHLaobpG+f3AfpIQxRoDXpZcXQKNPLRq1dOI8VSrPXlKUIzqlZ/CvtgKsyF6WgfXWXriCgvPyGJ/cJiXqGRIx3awA+45BHlecxJPdz1Ia+JeC2rxguFVlQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ca::21)
 by GV2PR10MB9632.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 20:31:10 +0000
Received: from DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e639:bdd4:4bb5:6361]) by DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e639:bdd4:4bb5:6361%7]) with mapi id 15.21.0688.001; Fri, 27 Nov 2026
 20:31:09 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] classes/insane: improve HOME checks exceptions more
Date: Fri, 27 Nov 2026 21:31:05 +0100
Message-ID: <20261127203105.2860300-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CPAP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::6)
 To DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ca::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB8248:EE_|GV2PR10MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f09f45-900b-4dd7-03f7-08df4cc55ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|261026140227099003|261021123027099003|261009223027099003|261026121527099003|261021121427099003|261022105027099003|261028144727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: iU/LkqTKaAFs8eKeq45enSdKP59UuWGXIQs7Ot96FLq1SbnQN2Vdru/V3K3L8gg06SEhxd8d0NuEPCRu3r6uBl1Gm+VpKzqmkuALnMs2NdEhiTy3CWSz9GSgTaVeRL/7NNDk7BrFNhDkuOdxNNFioYYHIDkKxatPVoSmsARNS1h+gy6fuEzw8JjrTJP8DHJ+nYMqRSpPYacsYxYsKfqGC7r/P0vpn88v1ag1DWxY03oFN4wpEkyWn9kulDWThEUZLgydb5ziBc+hXkP6PuIhue9Y8g/XKv/5Ft4MaAJLyYWuaLSwVqBWn4f+0vjsYlpZCbaGlXQB7KoT/ukhBQNNaet8oGOQ1pcBVYVYQIvQTQpKvo3Tvc7BofL3BlpOdkpiPiPEjRPuKFBqaeQX322Rk+9HVHFQH3TPglqaV1nj8P9zrkBz4/64dxgH7VPwfpYS7EaSPgyDOKz/1ZCgB6jIU+GcrseRl470E9YLKk7sbDvoSIpY9u1zJiTE4wqtVUyAXRz1EymRcSd6sk0FugSowkvy+DwKXoej733S1Lv9slGsfON+Y9FJwDrSX6jgB9PTRvaFweqdzeNK6wzKc3o9NNkCevWqBlotUpj/qENvKYB5R5Ho03dO1ZFvvdO4vqL5gfEzp1nCkeao3oNHz2S3zW3FDJxJMgAwPxfLPt7ibV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(261026140227099003)(261021123027099003)(261009223027099003)(261026121527099003)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?leSZu1ZXbsEZiAQuGajbFjQ2w1tH8MB05dqLpAgOT45oWr6rkLumztC/Kysd?=
 =?us-ascii?Q?gLGSh/8du+ZSgpJRreAT0U6ER4ynUgsuPSvJKrM5Qj8YoyYjUcazEXRmFFKA?=
 =?us-ascii?Q?RWcEYtZF3xl9rrTFIjDoxlUcM/dKONmeq9llqDKlUWRhzx1tZ2r15q4Jj8F1?=
 =?us-ascii?Q?LgEMmLceQTbgsNzTOKYsJNDV7JxPFCP7bE0AfEx9lfNWeQ1taaqsl+OWrv1H?=
 =?us-ascii?Q?b+GglhKZzXZ3hVLs5qzU7iIdBbo+bGBHnY/KTo92XGA/bedZXdV7ad3TKQmK?=
 =?us-ascii?Q?Yk5x7ptIffQ+TVXsU2olVMK1YyefMmeb5dZvNFkqcY5F4IaoIeavcO0K9LI7?=
 =?us-ascii?Q?y58zCDs+MfAowKPjSQt3tHzpAuRQqVBEGRg8bffUI11vURN2E+qYoSEe56fh?=
 =?us-ascii?Q?UM1xTGwx2rh+ydVKUhU+Xt1qA5k9y/ttJuLL7dlg4+e6r/jsiT24UHIqxQN1?=
 =?us-ascii?Q?NKkdKVrWNYrBzC2jKN7EtdyYPwxQGXhn25DQo5w9JM2S/WiV+0PtFL7tGz7s?=
 =?us-ascii?Q?bdreb3Jy2pmxk0bnuN7qOHiCgxrXFeiNEKqpjnTv39KyJgBqPCqbvKu0VnJp?=
 =?us-ascii?Q?uYdsHg2HnSvzel9HeqMf8u0BG3R4i6zKHGoCy0E2rLJgKGX4oArHCkPm9aE1?=
 =?us-ascii?Q?7a9EZgETswV/jcdNyVlASF9WOfPcQ0yzHvIAASOKuHoBp4eAZYvPHRynXgid?=
 =?us-ascii?Q?88QpGQ0a2fc3Ws9SRdkjWSVtXzVima8isyLOQ/RbkwEcbqzMU2hYActJyh5X?=
 =?us-ascii?Q?i56rfuFOSJ8n9bSg+ZvU55sDQnthQNAOCMejqCh/CkuHwWvY/NQy+627Jb9G?=
 =?us-ascii?Q?cPhnGXVWeOX4JuHev7woUbaPlTKwuRNCpzR8hgO4crdz/ICLxDrqrRgVOiCF?=
 =?us-ascii?Q?zj0yW2yJydSSh712T+gjh9htEng1C2P0JE21Q+rv+eo94/1b9hmIiboM1ppt?=
 =?us-ascii?Q?f5UwQUtJFYSU8e4UTPRoAgLVzrIVUNfcVqokhqGfwzsecsRPJRJlBwxJlQAn?=
 =?us-ascii?Q?klfB57Hsct/hom9JRz0zLM3TpODXRKbSimPIYpssSX6Ags5ir8TXdkK3XnG2?=
 =?us-ascii?Q?01wD0Dk9BklF0653Pu0iPlLKIh4NbBFgmOrg5X56tB8qcLypaW3CPQQWI97k?=
 =?us-ascii?Q?S9faa5apcjm6s0VZ+JFWxvZw7V8RbK3n+25IPUdgRwP/kS6KuKRKNoxyZHQX?=
 =?us-ascii?Q?x2uuDTY4eJXo5HXwJoSbCy2GLTmN0yJQ7K+q2HGhCW2g/rFqJoFjKQnle+lA?=
 =?us-ascii?Q?hm/x+opr8+EYI7lPdXaKkvXYV2am8GtBIJrosB6HhlX5v9FxsBKh31XX2yZZ?=
 =?us-ascii?Q?DjbxvANpGBzegYHhAsRDd/Gs9J8rypG3vMOBp1Y6yrBGk4bT9RVnLpgqAXBo?=
 =?us-ascii?Q?XMaSZmrCSMFmhdQjtQiadZnBQJ/jq165rRkwogpz8ZO0DnZo/W1308B/qD/P?=
 =?us-ascii?Q?DzLgONDGUqp8DGP5O2fVyE/xvzcIt9nPC4yu0m4T/fAzo+u3NbLDtCgbdmp9?=
 =?us-ascii?Q?4jnrKCXVvTUHS42Yoy+9OfdMNOecTHYXXu0EBC6z+Nm3Xzhhm2k+9aF3vfcX?=
 =?us-ascii?Q?P4qTGZxRgoXlQI57jXQAUsAxC+uvsJooryHdn5PanrfKMcMxYRCBCveYyMSk?=
 =?us-ascii?Q?HjRgN5BYQ/d1W59ejk15TBtJHgaGcyjQHdKqr2BV8ZWdvXRphlGWWfjljJEu?=
 =?us-ascii?Q?hKHWrXwk21o7nGW7q8GH5Hg7sjAfWE/Xg/BT9/c6Qooi6nAPMlzbCEfNbDtt?=
 =?us-ascii?Q?wifVrRyp7/vy/VQHO+1fPQ5ZFlsJljY=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f09f45-900b-4dd7-03f7-08df4cc55ede
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 20:31:09.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRBsqYyZt6DSp3BkrrvaSNvybf4xEcZjEMn4vWqPPh6ztRd+4yqmcjiICkcFIJR/lqDrn3aItrjZnTcvWW9z7dfWLRGJS1fvUEGefcwuA+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251454
Content-Type: text/plain; charset="utf-8"

From: Rasmus Villemoes <ravi@prevas.dk>

Currently, we skip the check if $HOME is a prefix of any of the
OEQA_BUILDPATHS_SKIP. That was done to avoid $HOME=3D/home/build
matching a packaged file containing e.g. /home/buildroot, and the
recipe having added /home/buildroot to OEQA_BUILDPATHS_SKIP.

However, one can avoid such false positives by instead checking that
the homedir actually appears as-is in the file without a following
alphanumeric. We're dealing with the file as bytes, so we cannot use
regexp matching, but splitting on the homedir sequence and checking
the first byte of each following part for being non-alphanumeric works
just as well.

Concretely, what failed for me was sqlite3-src containing /home/user1,
and building in a docker container where $HOME happens to be
/home/user. Of course, one can (and probably should) add /home/user1
to sqlite3's OEQA_BUILDPATHS_SKIP, but let's make the check more
precise anyway to avoid spurious failures.

This essentially reverts f6b9494eac ("classes/insane: improve HOME
checks exceptions") and reimplements that, but in the meantime,
46b77e80ad ("insane.bbclass: Avoid buildpaths QA reporting on HOME if
its in TMPDIR") had come to rely on the prefix checking. So also
reimplement the intention of that commit somewhat more directly: when
the TMPDIR warning has fired, and TMPDIR is indeed under $HOME, just
skip the homedir checking.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/classes-global/insane.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 350e1f83c2..d8b4e6deaa 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -443,10 +443,14 @@ def package_qa_check_buildpaths(path, name, d, elf):
         if tmpdir in file_content:
             path =3D package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contai=
ns reference to TMPDIR" % (path, name), d)
-            buildpaths_skip.append(tmpdir.decode())
-        if homedir and homedir in file_content and not any(path.startswith=
(homedir.decode()) for path in buildpaths_skip):
-            path =3D package_qa_clean_path(path, d, name)
-            oe.qa.handle_error("buildpaths", "File %s in package %s contai=
ns a reference to the build host HOME directory. If upstream hardcodes a di=
rectory path that matches your home, you can set OEQA_BUILDPATHS_SKIP =3D \=
"%s\" in the recipe." % (path, name, homedir.decode()), d)
+            # If TMPDIR is inside $HOME and this warning fired, so will th=
e one below. Skip that.
+            if tmpdir.startswith(homedir):
+                homedir =3D b''
+        if homedir and homedir in file_content and not homedir.decode() in=
 buildpaths_skip:
+            parts =3D file_content.split(homedir)[1:]
+            if any(not p[0:1].isalnum() for p in parts):
+                path =3D package_qa_clean_path(path, d, name)
+                oe.qa.handle_error("buildpaths", "File %s in package %s co=
ntains a reference to the build host HOME directory. If upstream hardcodes =
a directory path that matches your home, you can set OEQA_BUILDPATHS_SKIP =
=3D \"%s\" in the recipe." % (path, name, homedir.decode()), d)
=20
=20
 QAPATHTEST[xorg-driver-abi] =3D "package_qa_check_xorg_driver_abi"
--=20
2.56.1

