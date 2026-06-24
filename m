Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DE7CDE003
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=k79SgDnd;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ba9wzUQl7L6WyTKNoIqgUddAxkF/uZjd/jD17frhicmFNXbbsJfrKRsKhsP0mUh6ewrnSM1/R3d1dhE9g4PxRs79ZHehmop9mhoKEYNMEsJkholKz50wMLiajDRGNVaB4/qtBWoP7IDBbWTtGbBdkFzLzqK7mj1NjX1uIJPmSYogOwZNPZTI/ly7vlsgQwZcW4Y0394cUkdlT5HWuGDfL+f2WPZjlQ+P62VhFU5i40Wh9VpqSwSs81LboMUEyB+3z303TcMEk9k4zIzs29Vzx/u0+anvKQiMLUpC9miC9JC+0szcyprchi0e/VwXLnGpuHjYjNy5YEbf2ISsVg7hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9I3SfQXISsedP0k6xDWHzHt7JLusXgN9J/8aDnEj9c=;
 b=aSyqwmoH314Y/mRuY3rGgi3FQXGEmrxB9lAwPY3P2CGjD14XhxtPIS0jbEYZtQZuqlVJdMLh2yxjRVCBTSSSMG17Mp3BBT0I+9pEjzGkWnj8uf6/FpOW1iH1+m+TNt50xksSfyKHCgcgHWTTBQQAiJ0K6MN1Is/4+zu7mAKyBu6FJU5b6kR/3805SOyn3ZBIOOVgzDgmDKjS+72znzf502l8AagZLtObEsVhZHZmXZ3vtLgWtDbM42bw6OadTcrrVafYainneoGIznVN8s/bNA3gZkoVOnMHqZzdap54PBcTAwG6jb7KaztBkfPtnBAG9R+M+84wGIsARri96KyZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9I3SfQXISsedP0k6xDWHzHt7JLusXgN9J/8aDnEj9c=;
 b=k79SgDnd7yHuo+H4cqbpjzP2YIU12V0TGBdyOUF1Dh+px4lXgCpHpqxHvK52ADNZWzacUMKE5dGUlwAN9mv6fIFs/uXIxcI3NgTIfNWlFCGoQnzVUZRS+8dJU8dU0+Hl09GKC/Y/KOJALgF7sDon3PQiW1tJBTeT6KaBBkb33+Srpw0IiDPknQBTSiNug2NrwnJcAl+tPtIlV9trQ43bAZYXN/H75D6Em8cuFoOmAzSIkLv6oXnsvqwO4vTOMF6h+ddvcKDOxUx9lshgAFXb/Q6N783bmvrgsOoqsDdA07V8efb7bWHhMZSRK3UESpVKb/T/eBKpMEdcfWQC+hUacQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:17 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:17 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 5/9] oe/patch: remove obsolete PATCHFILE assignment
Date: Wed, 24 Jun 2026 14:44:03 +0200
Message-ID: <24b8da5d288a617092a3ad55148223f1a0e6a127.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0042.eurprd06.prod.outlook.com
 (2603:10a6:10:120::16) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a50330-2ee2-4816-cfa1-08ded1ee4e0e
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: OXCAtWW3w1cQMzK2rC+INjlBbI3bIgeddI1HESK0RZY9GrsO6wg+2oveYI+o5WWzTdtW/1Zuq41poRt8m1baiFIZSyQy7Ts9TvYGFh9M3NzgoBb+Uvbm4lFIbofmNzI891oauovuqnwMeAKg96mypJBI+/oSLORpnhP5evfzH5OEH4FM4D5owSjlhk/1EYXmaGsori8Yc/0f2yieA11MWd+vBV3E+ny9SYPYy2qw/cq0zKzhJEdT+8N45HfnHY85fhzWI4OTiZg1DmiTf+eO0W4a8Nf55UyvjbZWxtRDrVHe/R+9+wXfLO7Q+PtnF7p/tahnq1Lq4h9mLx6LswXOxgwHMpAOO9rgDcZuTNV5TDiqElkpoDw6QlwROnKqW/aYn+8xpNA1Cwdnb8JiTUwChmVpr/kFat629uKl5UiKGY+q7WD7/uQqPYeSVqg0aAumzPN6F3gfbxwqPlHVKAw31N1IthCKLqjHPZ54EYOHVFwKibYUivVeFVBPZ3bxUNcxAmq7JQvLC+KKkTLvXkRd/6HTytv/5WwUOYcUnUc3sTF40qbLeUbnvWB8c7Bztb8Y1TrXM+9M5iO0Nf8vPYwQmlHuClk1kAV1NajyZyLeVgPY2TuJQDv0nYTC7HVl9w6c6aXIFVVWEIpAiO0HhUpcfwTHrHNGuilfrn4DQlvqmhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tR89kT6Onz6AA68g1RT5U7UcrUTCA2vdz4PKZEaMUre1jXD62aZvGTLGR7nh?=
 =?us-ascii?Q?25SGwjWprDNPhxwa9/ESX6tTj607eZs6JGLPxwgQgH3FdZW5VvQnnDP6IpsA?=
 =?us-ascii?Q?Xz5CIxiwGDwiFvvNZMxVHjR/m+21LBkVaaOiL0LbzoH/8LvrjzwcQjFwhRhz?=
 =?us-ascii?Q?ypp5VnoZQ7QN+AGdzqD2mg/MaXNCGn/bzP3iQGK0L3bP/cT4MeYT2R8+ED+3?=
 =?us-ascii?Q?RVbNpTR0FVV0XhPx9vuG5FjfEcNpayGdxMoNsgmFoZobuZdpxelOV7NrlbGL?=
 =?us-ascii?Q?Oj7TSQo/Rxq5eWtaqT6OUTBI3yNl/Cp08OdHR1dKK8PT0mQUFLPZHBfB/Tqu?=
 =?us-ascii?Q?QRiouWTJveqO2/U3scZs1+gMSbX52+tYjP8Mx7qy1k0PPmQ42rsayOyyJUDH?=
 =?us-ascii?Q?r9C18EjAfYZ/I5uWRPetZ9z6UeSGyxgD1uT+OB7oDD5t9ipLOFigDIm+OLX3?=
 =?us-ascii?Q?92X9wT/BBbHuiE41rYfahIpie+9ijbX/1lZRu7wveRaLzdh8IDG6nUh3MrnN?=
 =?us-ascii?Q?ThZu/b+UTQJNMgrtggJ6BOoiQPhZYgXXJ0WHj+veoDFz9kNB0d9TuImxg2Le?=
 =?us-ascii?Q?10i37eFwfNAW8SGc5g9sKFbAllS2u0PPkCVauYdBbFf3zBnrKcUHnBrIPROt?=
 =?us-ascii?Q?3qvMHZC1Lj+9yi7pTM1+7o5svRVreIPnDu5ytwSP+06bj81oUThyBJlonJLg?=
 =?us-ascii?Q?q6rzRUAyuSoV2vo6i6MDRdEFca2qzS+5UvE+/15l3WNuLD0uNU5FNq8p5X9t?=
 =?us-ascii?Q?UyylTfQ9qcWXzFRJN4RnLR+LGNCcfox7qaToWjf0NxustbbIXLlfuR+WtIn2?=
 =?us-ascii?Q?k7XO6vFDBnsFeCz4MD8k5JHE05pcPzYXJuQ23VxwSFf4lUlZn38NE0p2mDVO?=
 =?us-ascii?Q?riaE1EX7PchyEM8NVTHxsG0szNWgdL2dhDCb1IfLmAEf1NvNlUUUekhUTIYD?=
 =?us-ascii?Q?HgCOZ2etnL3fkWyyGWme96Cx8cSbpdTpFfimW6KYOLuLiSr8Agg037nJsiW+?=
 =?us-ascii?Q?qj3PWWcf89Sb+lUOf5ZqjhcHtVwZYlO+7M1AHtc2212i9xf7+m3nX+hkGJ8X?=
 =?us-ascii?Q?KNd0kbuDo1k1oydSZanE6OO0MPs2dAQru9r2YJ9o0Pd737TXLL1hO3GajYbJ?=
 =?us-ascii?Q?Ig6VOzx3qEyDgdIDy5K4arbVEyqVevyQK4AA9IrK/50DM+A2D3bQ1uGRH8q6?=
 =?us-ascii?Q?QKmgtlfO6LoYBzCtvnNcyt763tejX3mMaO13J5Wh+xd3lZLHpxNYwxnFcNVd?=
 =?us-ascii?Q?0hnHcPun1vVjRFDpFcuHCNYrqJdGJip2vfRZBErhBGfvy5LWcxZN8dYu1LLC?=
 =?us-ascii?Q?BtoxBRD71nhRjjyn3WFVRXvV9bD187tWJEawGtefc76gZ9fqv6k47/j9m3T7?=
 =?us-ascii?Q?Xl5c0ZXK8+FCu/OkXAwNZue1b8LWIigMCWKCkqz5ScP7ER1j2Plsw/7Wx7Sz?=
 =?us-ascii?Q?14mY50rkY72+i8Wfv4yyZqCmZfL59UtZpoOuiIoeu1dgptUnUsZRqJl+xnz0?=
 =?us-ascii?Q?VXvc1v6gYqbZRtmDwNI1PSSCnSuNK4aLVxW2HNgejRfhARoIuX2ODOUYDsSa?=
 =?us-ascii?Q?yk5lLuvc29r3xIYens4p4ry7Mbp0YBf50IwfFnj0mP8cxAqQc/obgLF93IKR?=
 =?us-ascii?Q?2lfA9rZVi5ed+AuOJ1Gf9+X70MoqZcLTEEcI0YSDhwEjOJjUzDFszafW6yF5?=
 =?us-ascii?Q?Wt9hGz1FJbBfIParAiS8B9c00rJhBNBqwC2MirmvJe9qgKA99apJazEgSclb?=
 =?us-ascii?Q?7VY4shAmGw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a50330-2ee2-4816-cfa1-08ded1ee4e0e
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:17.6047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzRfrinrt0ifH9K6tXr/+SpY0BcvunjDQmz+QVK1gOHf+OnMmg2gHR1IG5Mxv3uINY7rQD4CK5roUeRICSmKRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239499

PATCHFILE was used by an older Git hook to preserve the original
patch filename. Current GitApplyTree records that filename in
refs/notes/devtool and extractPatches() reads the note when recreating
patches.

No current OE-Core, BitBake or installed hook consumer remains, so
remove the unused environment assignment. This to simplify the runcmd
argv-list changes.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1ff57a9f8a..9240637189 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -584,7 +584,7 @@ class GitApplyTree(PatchTree):
                 check_dirtyness =3D True
         return check_dirtyness
=20
-    def _commitpatch(self, patch, patchfilevar):
+    def _commitpatch(self, patch):
         output =3D ""
         # Add all files
         cmd =3D ["git", "add", "-f", "-A", "."]
@@ -595,7 +595,6 @@ class GitApplyTree(PatchTree):
         # Commit the result
         (tmpfile, shellcmd) =3D self.prepareCommit(patch['file'], self.com=
mituser, self.commitemail)
         try:
-            shellcmd.insert(0, patchfilevar)
             output +=3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
         finally:
             os.remove(tmpfile)
@@ -621,7 +620,6 @@ class GitApplyTree(PatchTree):
=20
         patch_applied =3D True
         try:
-            patchfilevar =3D 'PATCHFILE=3D"%s"' % os.path.basename(patch['=
file'])
             if self._need_dirty_check():
                 # Check dirtyness of the tree
                 try:
@@ -633,10 +631,10 @@ class GitApplyTree(PatchTree):
                         # The tree is dirty, no need to try to apply patch=
es with git anymore
                         # since they fail, fallback directly to patch
                         output =3D PatchTree._applypatch(self, patch, forc=
e, reverse, run)
-                        output +=3D self._commitpatch(patch, patchfilevar)
+                        output +=3D self._commitpatch(patch)
                         return output
             try:
-                shellcmd =3D [patchfilevar, "git", "--work-tree=3D%s" % re=
poroot]
+                shellcmd =3D ["git", "--work-tree=3D%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self=
.commitemail)
                 shellcmd +=3D ["am", "--committer-date-is-author-date",
                              "-3", "--keep-cr", "--no-scissors", "-p%s" % =
patch['strippath']]
@@ -662,7 +660,7 @@ class GitApplyTree(PatchTree):
                 except CmdError:
                     # Fall back to patch
                     output =3D PatchTree._applypatch(self, patch, force, r=
everse, run)
-                output +=3D self._commitpatch(patch, patchfilevar)
+                output +=3D self._commitpatch(patch)
                 return output
         except:
             patch_applied =3D False

