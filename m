Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BE3CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:13:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7142.1782378811063670284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Wf7q6LTm;
 spf=pass (domain: est.tech, ip: 52.101.84.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUPJMyRWI34s0nz2IlwAEiKOfdvPUyUjmj0TtgKmdXyxMjzMo8zoPOvxEqh2ihktz4PTNkWUu456JGeYGhAkmb39t1ddgnV0xvJ3UM/VUAF29/l3ZDpJmr5aEHybN3WWbXd9JFNxCf3gYV9TyHN5MvKZ4FAFD9OqbuxhHfxKJJ5VMvQJk535HFLeWqVx3KRhFfYflaU7ovJh+aXtR1YGAodJHSIocE1MrKhNuTPUn6NX1r0VllRU5rJJ4oET2lxzFXuxSmsS19lC7xTWG2wjxIQRy1KSHDB81glbEoTaoWaOH/GeBTLQOPFF5+ICv4uaJdQcUFlBg3mZeRoN4PsMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZtGeWb5sxy6tpmvWNVkf+a/X9/jhFds35mngEOfa7Y=;
 b=P0EVTjwc04lKUNPLtQPuS82JPNBfPFT5MDnYNQ+IPXGl3NR1qa/25w0XL0Ybwjp0NkPu0wvb86TRRo8K7e5LN57bOZAeAno3vfB6o+ka2YxdL1Az4pNKw/L7dHAteUNHilwa9hZaSzxHhiVmwMQFDqUhZqS7AigYizUw9raQFfnLZpgv8jMcCEAWWf5YS3NVxbzYNFsX3bm0X9ej34zr77KWAaKlh/4NOSF/duVRBIw72qZ/YrazoLW6kZQBKBVfQZcIYXmZwBqdHYTM2a3NLJLlAXZhno7Os/rui/E2h2THhmLVW1b/JwJsx0/GisJa/VHi0pfPkvgb+pbV9tpFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZtGeWb5sxy6tpmvWNVkf+a/X9/jhFds35mngEOfa7Y=;
 b=Wf7q6LTmwi5gif6SZFrcrv5XpqB8+Mdcwkqa5dE6JWQU5TXsoUrZkK2gaUtf+QKD6zIWnljzfeE6pZ02uYqAoGK7WcKz7U1SR3a/wW2UNxl4PRLg3vqLbO36QCYR4F5AkM5fdkbVS0lxg5z+D2onfqDMLmHyhGu+Vqq3yiWxyT0DhguhMxk36nt2QOQ/S+UmXZIijQAczdeZD4IyTImcZ+YFTX+dL8AXBl6RM6tspNCnA3TDGwK69DdcUR4fpicIqu1kdBAgKI2j1OBUfFvrGWRBS19Ft+xgGJq0jrJBOGc8rBxg0dj3YiPonU7kv9nDRJiutPixoKSob4oNdp15Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAXP189MB1903.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Thu, 25 Jun
 2026 09:13:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 09:13:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] install-buildtools: add --local-file option
Date: Thu, 25 Jun 2026 11:13:17 +0200
Message-ID: <20260625091317.33964-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAXP189MB1903:EE_
X-MS-Office365-Filtering-Correlation-Id: 492a6288-aa8a-4b26-f65e-08ded29a03ef
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 0tdYyjLdx+TnSGKn8Ieu/+GXR9/jg09jszD6r6fhOLCo4gPlbInGGCgXVvLLY9YxPjAJqW4lIVgnIBclKVg39PwcPE2kUyR4w24S/fWSdgfyea0eu/PZVwf2F33XDYsIj0AWYyq4UXVGULD6bM3Yy3HlWTzZ8dYUP2fVCCDTTIwpVpDdtPDj/Gx2A5YRt7BJwqa8uAFlPf132wmQeX7xx6r60vaNnutPOO5M7ZfYOBHqvCmRO8pobr3uD8vc2XEgFG4PZs+os7Wh7M6a48EVcoL9+dKFwIsxydhpMm940TZX/3l4ge7AjPEZC/mzfMd9bBgOYnZwX90qXt8Olf29Jzo7vD/SqvQ5FzUAMAK7c58PnHw5fSOXUSXh469bs6IeesxF89i/wccH2tvqTacEKzSvpTnnTM99Hwpo63B/eVMqfABjHYnR2f2if/uisE8gGEsZhqEG9Cf9lCJ3W7w6VNn523m4sEnLaYDKWYXBstAr++2ewc7yfpf1q7/Y5OFgrzLYGT2gtPahtBGLfIrPewud4Vxg/Emb9qSucvH+tF3hkJc9Y84ef7D2yJMKDXWxU+BvyyLLHiGpTQhSIDg8dQbS0yj9x+wnJOg2A/YyFgtZBS/n8KLy5+15mVC0qfNntP40Zho7MwrA6STUFF4h7AS7GRnXAQa67X96LRuD9qU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LQGmwaAwl+V6OC2EKRKWXCeh1GwJleZr7x0+FHU1HE5PvCePb0gTMTmNYXJD?=
 =?us-ascii?Q?1SrgCe+0vsCeG4WCpLSqjMcvP4cRQWYnuZ8v84kmbqAt54J/mXY8tzvXWoR6?=
 =?us-ascii?Q?8bkc0RTu9HK3ESKh3NhYgdkbIqfKQ+yxkdRFaAzIFoQ22h9RTs6YA2AYUuqk?=
 =?us-ascii?Q?BvFZAtfSCsetZ/abL85XuL/KDo+Q20WJ7Ds9XMSUTbFIWvCHCqFFZP0tFoTq?=
 =?us-ascii?Q?gZXLFdhhbPK3Zp6gQsadNnEU5hlxPpCmXw8NAEMLxIallxQTy7+AEuv4K0s5?=
 =?us-ascii?Q?Eb3AyoOcLvFfGl5DdM1ycrLFF5hcBcFwm5V4CjKOvWl3b9KkLdynzf4JPG3h?=
 =?us-ascii?Q?XdSx3oAU3ZmRNP4w9bBJ45zyANKoz+vGc3oqPlQRbtxGE7lhS/77pb6JKjIo?=
 =?us-ascii?Q?l52t4eaqRSWDOFoEdrr2gVHC/8rwuFvNVNAyle/ahy6ddi31ShHM6qPJEKpp?=
 =?us-ascii?Q?2DJ1NfD5mVDIsMcx8QIDsKiBnOitk02fB3oWPIo4CqWFL4i6wFOPGQwRVDTQ?=
 =?us-ascii?Q?lLS9Qyncf0b5uVqluCsxwe0xj4GuLidioGNiSG+HG4GrlC1sdQ6gYwJHEs1y?=
 =?us-ascii?Q?pc0PVz7N12bTIg/txt2PEjtEp7S8gmAI3UXpBTOOdS0MpktVCAyORpGBEQMl?=
 =?us-ascii?Q?D/Pj+SrvHdr5oejHVlos+5gPiGMrjWoFAFxcREtTgg7OojyMlcqyKpZ1igqd?=
 =?us-ascii?Q?kCmC5jNDQCaAhIJcIUJgg9djhSIFGhtJ0KRXElsoT5IxQ3k/p2mfGDkyNscj?=
 =?us-ascii?Q?LqdZldo/Q+eye8w2v5+Ik310M45Rc5qZ/IDLJtkHQowOFOCpBjTgjbHKHSX6?=
 =?us-ascii?Q?1jWu8xymWAvHu1Lph6T62U3NHNXB1fwyVE2B9tVeZmsN1y9V4EC3CfbPp7WS?=
 =?us-ascii?Q?iQo5pw/2oBWaPJW71ltypioYQIn4lUfJR1E8cxtoMULjvczkdNj/+SV9V3yJ?=
 =?us-ascii?Q?IMSqd5B4FZr9cCw3uTx5r7Kq4CmfMVDH2+zU8qp3U0oVbUhlaFBvq2BUwFsi?=
 =?us-ascii?Q?aG24OOALNE6+VjQAgG2hNEd6Gz/SFaIjlnTghWo5x4LUyA/VIXiwIoD4O4gJ?=
 =?us-ascii?Q?ONpIt0Rn29FDL9Bt9aDV5uvbs4VhLCkKDVJ76mX+5WWkI2Hzj6RBME1j9FDw?=
 =?us-ascii?Q?rOcp9lpKH9aPmGTO28YVI0ZlU+abARgbMlfz08VKelI0pxU2S0px56PdrV2x?=
 =?us-ascii?Q?U19ykAIc7htzbRnmNfEWjoiKAukUGicRBjX/wuLolgZt8mjAxJk+H8/nQuiU?=
 =?us-ascii?Q?u/xdCL+vocrTjX5Xo8M9oa8tf4sPnqmheDE+JaLHJhJsMQxGoGoTjs/wmfAr?=
 =?us-ascii?Q?6dHcEMpnf8v6PEPwJ8AXevIukKUS8u939UX9ARzOp3B77uqQFt57l3K7ezfF?=
 =?us-ascii?Q?kEl1q1yrd8KL4gov05b/NWugec+u++UgA/65F29Sl5V0huh5uG2kSVqHfih0?=
 =?us-ascii?Q?n1TJ1r6XOKdPVzxai3m3uPzGFm3qxkTUG/WEI0i6dNDQifKonjksrDPjAtO2?=
 =?us-ascii?Q?OYaNmz12ubnw9oGjEQSM6QSm/IvYvYuC7YzO3gVr8pDfFSIQ9+on1uNVxZcc?=
 =?us-ascii?Q?h4s7iXeFKlvO0gkXEY/UYMRjoYVdvszdxaA/Iavnnhn0JzX2rJ7xXsa95psF?=
 =?us-ascii?Q?yFTB4q977pQGgPw7aQ7Pq0Y0AVXaOKyKQuaU6NTlF+EExX6IN2xf4KGcFP0K?=
 =?us-ascii?Q?LzbS5fn8WqLSAtgY0/e3W3LZ95frtOD9wOPeHtmv2qwHniZCFpSZCVsdVNHa?=
 =?us-ascii?Q?sRzbaxqsCDdIk3pH6vH2hJMzqyALgnk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 492a6288-aa8a-4b26-f65e-08ded29a03ef
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:13:26.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQnpD5jO47KrVHdYYfLqhSzh/mByjxBkR5BZnXVylAw+xdkxL2XPuov7Ng1xipqm/401UiDd9zayoGbW9FKbxM+voKVn5B1DSzsM5ftu1qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239550

When buildtools are fetched externally (e.g. by bitbake-setup using
bb.fetch with checksum verification), install-buildtools does not need
to download or verify the file again.

Add --local-file to accept a path to a pre-downloaded installer,
skipping the download and checksum steps. The existing standalone
download behaviour is preserved in the else branch.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/install-buildtools | 91 ++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 39 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 723edd793e..52ff5ccdce 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -130,6 +130,10 @@ def main():
         description=3D"Buildtools installation helper",
         add_help=3DFalse,
         formatter_class=3Dargparse.RawTextHelpFormatter)
+    parser.add_argument('--local-file',
+                        help=3D'path to a pre-downloaded buildtools instal=
ler file.\n'
+                             'Cannot be combined with --url or --filename.=
',
+                        action=3D'store')
     parser.add_argument('-u', '--url',
                         help=3D'URL from where to fetch buildtools SDK ins=
taller, not '
                              'including filename (optional)\n'
@@ -243,49 +247,58 @@ def main():
     os.makedirs(sdk_dir, exist_ok=3DTrue)
     try:
         # Fetch installer
-        logger.info("Fetching buildtools installer")
-        tmpbuildtools =3D os.path.join(sdk_dir, filename)
-        with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
-            f.write(buildtools_url)
-        ret =3D subprocess.call("wget -q -O %s %s" %
-                              (tmpbuildtools, buildtools_url), shell=3DTru=
e)
-        if ret !=3D 0:
-            logger.error("Could not download file from %s" % buildtools_ur=
l)
-            return ret
-
-        # Verify checksum
-        if args.check:
-            logger.info("Fetching buildtools installer checksum")
-            checksum_type =3D "sha256sum"
-            checksum_url =3D "{}.{}".format(buildtools_url, checksum_type)
-            checksum_filename =3D "{}.{}".format(filename, checksum_type)
-            tmpbuildtools_checksum =3D os.path.join(sdk_dir, checksum_file=
name)
-            with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f:
-                f.write(checksum_url)
+        if args.local_file:
+            if args.url or args.filename:
+                parser.error("--local-file cannot be combined with --url o=
r --filename")
+            tmpbuildtools =3D os.path.abspath(args.local_file)
+            if not os.path.exists(tmpbuildtools):
+                logger.error("Local file not found: %s" % tmpbuildtools)
+                return 1
+            filename =3D os.path.basename(tmpbuildtools)
+        else:
+            logger.info("Fetching buildtools installer")
+            tmpbuildtools =3D os.path.join(sdk_dir, filename)
+            with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
+                f.write(buildtools_url)
             ret =3D subprocess.call("wget -q -O %s %s" %
-                                    (tmpbuildtools_checksum, checksum_url)=
, shell=3DTrue)
+                                  (tmpbuildtools, buildtools_url), shell=
=3DTrue)
             if ret !=3D 0:
-                logger.error("Could not download file from %s" % checksum_=
url)
+                logger.error("Could not download file from %s" % buildtool=
s_url)
                 return ret
-            regex =3D re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/=
)?(?P<filename>.*)$")
-            with open(tmpbuildtools_checksum, 'rb') as f:
-                original =3D f.read()
-                m =3D re.search(regex, original.decode("utf-8"))
-                logger.debug("checksum regex match: %s" % m)
-                logger.debug("checksum: %s" % m.group('checksum'))
-                logger.debug("path: %s" % m.group('path'))
-                logger.debug("filename: %s" % m.group('filename'))
-                if filename !=3D m.group('filename'):
-                    logger.error("Filename does not match name in checksum=
")
+
+            # Verify checksum
+            if args.check:
+                logger.info("Fetching buildtools installer checksum")
+                checksum_type =3D "sha256sum"
+                checksum_url =3D "{}.{}".format(buildtools_url, checksum_t=
ype)
+                checksum_filename =3D "{}.{}".format(filename, checksum_ty=
pe)
+                tmpbuildtools_checksum =3D os.path.join(sdk_dir, checksum_=
filename)
+                with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f=
:
+                    f.write(checksum_url)
+                ret =3D subprocess.call("wget -q -O %s %s" %
+                                        (tmpbuildtools_checksum, checksum_=
url), shell=3DTrue)
+                if ret !=3D 0:
+                    logger.error("Could not download file from %s" % check=
sum_url)
+                    return ret
+                regex =3D re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path=
>.*/)?(?P<filename>.*)$")
+                with open(tmpbuildtools_checksum, 'rb') as f:
+                    original =3D f.read()
+                    m =3D re.search(regex, original.decode("utf-8"))
+                    logger.debug("checksum regex match: %s" % m)
+                    logger.debug("checksum: %s" % m.group('checksum'))
+                    logger.debug("path: %s" % m.group('path'))
+                    logger.debug("filename: %s" % m.group('filename'))
+                    if filename !=3D m.group('filename'):
+                        logger.error("Filename does not match name in chec=
ksum")
+                        return 1
+                    checksum =3D m.group('checksum')
+                checksum_value =3D sha256_file(tmpbuildtools)
+                if checksum =3D=3D checksum_value:
+                        logger.info("Checksum success")
+                else:
+                    logger.error("Checksum %s expected. Actual checksum is=
 %s." %
+                                 (checksum, checksum_value))
                     return 1
-                checksum =3D m.group('checksum')
-            checksum_value =3D sha256_file(tmpbuildtools)
-            if checksum =3D=3D checksum_value:
-                    logger.info("Checksum success")
-            else:
-                logger.error("Checksum %s expected. Actual checksum is %s.=
" %
-                             (checksum, checksum_value))
-                return 1
=20
         # Make installer executable
         logger.info("Making installer executable")
--=20
2.34.1


