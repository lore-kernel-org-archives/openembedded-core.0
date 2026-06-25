Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84604CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:27:44 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1782379663484853644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ba41GVOa;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feBS+ixq9/y6KKY7009QbFzxMCq1g/yrBzKOnIu/psHP56C3AKUB2X83O27J6wLbSdymBRde2dDpwDsZcF5+SOY9p7yHUarB+2tLhEZzoJs8McDxJ4n14Ztw8gWHzr21hnBkVw7kMIUhH2xXdPy5r/byoh8S4XMggPveZnBWGtnzfSDWn60GaykvDvp8eDrDzhP2tMKmfSiOTCgLIa1X7DKbZsuGw2eQ3Nta9kst93lvdLd2v0j2fnaK4ghP3kYxOYlZrzvTqpE84ULSIEUnIPLVA0oWEPpi46vUHoUO47YBs68RGmuUSbkGkpnDfKON5ODA5BFxK7bzD9DFKPn9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGYj79tFWTifMJVS0eyBDCph0SgQJyvWipeYJ14Q51E=;
 b=e5+KPei4OJjFsXTuenx2PJiyUUrRk7nruRQaRTCzfdMM1hOqD2q2P9exZDLxGwBGaSG1cprrMvXy4bEel0Tdg2Y4/xqLTpFn3ZmuytVz1DHaorE3bpe4pWvHCpSr4PmmEBfRJ682A+RCYVGU1YsVxIRD3dVtuWeXfNq3vnOkg7Q4GVjinLQbBRBvIb2OqHA7jDZugSxYm0YkMsCizVRSCNhNxZbHDskH+78iHrj7ePvm9sGDmDJ1+wgzAPcFVem9E7ZM6/8J7bZQmU2S7Nd58Llb7PFFAxQu6BP/3mdY9MBLjdrNJf8H+beWziWIGz5Q0I5ZBETeKoW6olsvVudqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGYj79tFWTifMJVS0eyBDCph0SgQJyvWipeYJ14Q51E=;
 b=Ba41GVOakJQOsBanqXMAI/zlAn3vEWdmMM/YDZiuujRQ++/Udj5fwIr7RClKXuSUEiNdEjX5Hg5gKC3lJOudy4PMqh38+0vnmSwMZvCAp5UeuDSAt3etkC6wc7S7sZ1qLi2W8mxyRNUCRUOYmPx239GyrgttsqxDrStkFx3SjkX1a4QKLDYCLGWevvaPdx/h5+40KIWlUc/AXWKj0XFaaVb1wwLozYy9PUwlWPP0kuqa7xXhrJEzCVInU2fDuMvJd/GUCClzFPi17MKGNd4JGemjQkDOcQI5q/M1+4hHrKGCvk3loMUhXCUMmfey4DIAFGdGWVT8hdWAWs5yd8edug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA2P189MB2692.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:41d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 09:27:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 09:27:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2] install-buildtools: add --local-file option
Date: Thu, 25 Jun 2026 11:27:26 +0200
Message-ID: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA2P189MB2692:EE_
X-MS-Office365-Filtering-Correlation-Id: 40721d68-6ee8-4c1e-2464-08ded29bff31
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|5023799004|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: KKxreKmg6Lbbu3F5TufpVP3PttDob2Qi80mJIC3e7tFg88+B5HtRnkUAnqwWDLddy3togikK9muNtHnv2e+lK0EklkPtTwgCRQhnrKt4MvpaU0qyTQHc8ZnjYDZInUGbh2f0UYpAAgA03FoV57kZ63GFF63Yqvru60SRZBb/mZlQ5e7uAIg4rswEfJtt/vRX5gYpTReGndkfE7OeowvmVW6gCrRsv9HNIxOqpdRlWj5Ke8NHAFGBR97Dpe2RforL6SOSwC/C9ZjmfiaRXnwm8Z5TfioZ4rrSzbMnXOX0sVrr6Kd8cRBvbfiSKtBTsWtU1DfoWGBcFvU8XriKkLWPdtBIC9ewposjs91Nu8tlOTTFzlT7ZCazMi5eK3L65AdhLSeZf32r6g5ujAHgSszSiUSG/qUE/v2Tsd5B0Pamsqwi3syX+uo+dz2+mPBNgOh4313TFCYSujiq8N5hOKhRlZjkkcqxTJPhOtsFxi2fnIZNhIv28mz2j+WmzBTQqOUkmEPptDt4CSP2n8TjybZ9PraONFjikDYw99Hp8WiRMhpviI6oeHZm/zhRfb1rECsG1NqFy825exLy3ou0LwuXLAvvW9w5o1GECn/IFeKNULy7BCGWfajHxdotxqIdV9AbGsuakE07Hg8VuWmTV7Aierc0KuV6f/7F7g6y3Nix12Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(5023799004)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OY8GQgLIkqc1WSRY0ObizkwB6Bjg+rVgiexXc8B3K86QIyDIcXqkMDEwjLEg?=
 =?us-ascii?Q?NLv8d1a+Whi08gXXq6VPo6S/wgKY6Ec4zQPfU3qNZrC1M7BnUp1zrEg8ABvN?=
 =?us-ascii?Q?t2cgyDgiLuGduU0NSjePm/Wq27cUmOrWu9RkA1Az4KLwfxLWyHlXWpKXcdnv?=
 =?us-ascii?Q?T4oN3gx7O4Bm7FUoG26Gb4m20jXzYYeEbGTNSCj3nILHp5EMzk2xWnoZysp1?=
 =?us-ascii?Q?kdYogWOK/Aw/9C33iIXu24C4SIBjIToG10aHR8q+YY7ukwvJFEeNgtOwg7le?=
 =?us-ascii?Q?DP6ioy7BYaITLS2WKmCKEqtNrkJ4EZ24t88cgUuE5wYi85+nE5uRWctRfaSb?=
 =?us-ascii?Q?OenfUyXa/tV+I3CsbNFk/SDmdNKI8wuun892kQfJXujLY3+5+03DSI7HBmKr?=
 =?us-ascii?Q?33MJDRWJGrYe/nvJBH/BzZzm0Re261Q1vUox0CWPjrEZP4n9s06OK9RZp/+K?=
 =?us-ascii?Q?1Rz4rg5tRYTaAJXbYIpcggLvj6V5qC5NSQ14OurtoAJfGJcp4/HLwo1awfam?=
 =?us-ascii?Q?BAubPcEYsPfL0Gj+iq3WqRWHnVdJeGYVpbDw8OWbHcfhYeM96bu79H/BqFG0?=
 =?us-ascii?Q?iX/md1Z+zr2hEIQf4jJVfElshq14g8V0C1jYWGxobXwBviAcXxLRaNN+Hax2?=
 =?us-ascii?Q?rAiR5M0CYASHIQsdeqrISzRJdwgsoOR6ghK2R2Ib6CSCwXkZIU9e6gZgfNy/?=
 =?us-ascii?Q?7TXDRB6Zh2wN5Km8lefpLdG9kAU9St4fGY8GhRp0Vj/HWE3/lnNWisOc752r?=
 =?us-ascii?Q?nXZXjAzyh6N2gTxYdHK7BzAzf6bYzWi4xKzRIL6fL1UJx0+pa3utVFyTrmt4?=
 =?us-ascii?Q?iRxl8xhiT2Uvrr2dBP37DPwFz92TVWA6PRESRz5YQHMlIs9/pBxcXib34uGR?=
 =?us-ascii?Q?xZS9MrfQFOEgYP6SgFJ5G3YoPj9bt6haVxTyXcactELYal4NliZHxj9StXAw?=
 =?us-ascii?Q?3/5OBPLTI84F6WCBpzfhT6oBIHkK6w/5ZG0PA+V8Ys6Hh3w0ISMvlJFgNEWU?=
 =?us-ascii?Q?00O5d+57w57wz1Je8Yr/NQhA6V9teA+HhL9j19/NkLh/aB3WxUFcl7uGXsu6?=
 =?us-ascii?Q?+3GenKndYADodNNbGBocMQV4aMLnbM4OhqBEp2qIkC/BPiFtuNHcgeNZQ3h9?=
 =?us-ascii?Q?ifuXMNCnDLLMOAakfLWMZBdUQnMVwReL4jULxj1gtOk6gMxW86/Y/0rAtsa6?=
 =?us-ascii?Q?dV7lVHdui3VXmf+tubaGh8jquIge6vmEDxNTfijCYVqkRVnZA8aAYAZ1gQi3?=
 =?us-ascii?Q?5DL7VN87GaNyLUmSACX63DlAicGbF5uSYwzNT5Sm8mFjpmPGTPeXjlRx4WiF?=
 =?us-ascii?Q?663GRU8JdQcGxOyNLTgh1xHqUDMMQQYrjDod7suPuFFsnD0C5tf3VC3G5RYF?=
 =?us-ascii?Q?h/5S8npUumJvO/bjxhri2u91a1lPJGvyPGBaJQ1INI7gJNDGsUxBKr17wBA0?=
 =?us-ascii?Q?4f1agLA3TWQqTPuMWaYBT/7S+faO3z87/Ent9WRvKiSA/GmFCmmHL1aTw89j?=
 =?us-ascii?Q?U/WktMmQ9sW0Jcuxw1fRKyvRwp0Hflv4HCZnbs0sI+3q1A9FnAI0UNXZFI1e?=
 =?us-ascii?Q?zSxI3EX1InLBA2PyXlpijQ+9/UgGnAhUGk+qwhbiKE5ADTJaPRWqXZXx2ABP?=
 =?us-ascii?Q?KFWkG6QbSNeBsLkm7Yiuvgv146/gSuqEGN8OrJ1mhKz81Z7m+GNJmIZRwaad?=
 =?us-ascii?Q?KsFEVBDJFbABsmpc4CounNexr7/DFtOhHHi6HSvnBLABT2yJ/CEL1igqbmUP?=
 =?us-ascii?Q?worELlo4yg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 40721d68-6ee8-4c1e-2464-08ded29bff31
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:27:37.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2pwYFBaQ4S2ISgKPD0cUWrO2sPDhUchArZM8yYKisIUQ60VEz724+skWk6D6LZjYOmK2n+YAHzdRCGEHCtSvA3WVw6OmUmnKQB4DWGzi08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2692
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 09:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239551

When buildtools are fetched externally (e.g. by bitbake-setup using
bb.fetch with checksum verification), install-buildtools does not need
to download or verify the file again.

Add --local-file to accept a path to a pre-downloaded installer,
skipping the download and checksum steps. The existing standalone
download behaviour is preserved in the else branch.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/install-buildtools | 109 +++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 47 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 723edd793e..943770c84c 100755
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
@@ -243,62 +247,73 @@ def main():
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
-            ret =3D subprocess.call("wget -q -O %s %s" %
-                                    (tmpbuildtools_checksum, checksum_url)=
, shell=3DTrue)
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
+            ret =3D subprocess.call(["wget", "-q", "-O", tmpbuildtools, bu=
ildtools_url])
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
+                ret =3D subprocess.call(["wget", "-q", "-O", tmpbuildtools=
_checksum, checksum_url])
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
-        logger.info("Making installer executable")
-        st =3D os.stat(tmpbuildtools)
-        os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
-        logger.debug(os.stat(tmpbuildtools))
+        if args.local_file:
+            # Avoid mutating caller-owned file; invoke via /bin/sh instead
+            cmd =3D ["/bin/sh", tmpbuildtools]
+        else:
+            logger.info("Making installer executable")
+            st =3D os.stat(tmpbuildtools)
+            os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
+            logger.debug(os.stat(tmpbuildtools))
+            cmd =3D [tmpbuildtools]
         if args.directory:
             install_dir =3D os.path.abspath(args.directory)
-            ret =3D subprocess.call("%s -d %s -y" %
-                                  (tmpbuildtools, install_dir), shell=3DTr=
ue)
+            ret =3D subprocess.call(cmd + ["-d", install_dir, "-y"])
         else:
             install_dir =3D "/opt/poky/%s" % args.installer_version
-            ret =3D subprocess.call("%s -y" % tmpbuildtools, shell=3DTrue)
+            ret =3D subprocess.call(cmd + ["-y"])
         if ret !=3D 0:
             logger.error("Could not run buildtools installer")
             return ret
--=20
2.34.1


