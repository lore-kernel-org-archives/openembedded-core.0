Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC118CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 17:06:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16204.1782407203187033386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 10:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JkX5bJla;
 spf=pass (domain: est.tech, ip: 52.101.66.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUusafwY+2gYR4pwagxSY/QpcvvIYgOHq3qdWGG/xQIZ6SoDzCuB2Wn2SzuPQbPg2hd/IwMi4y96NJ8lll/OaqNWYsfsX72A4nEj5dOpGS/L3UnPkQl7bF7bBgphzuFZIQNXZ9zIrQkKAV+5IxQjqVhbA/J1fkgMuXb52fogUIhMJUObsEgqnz/zqiBzbIq6xUKt3NKbDQ5YbSFVavcq0E4/ZeogclFf4UC86uLQAF8Js57unsK6jH1h0X9cuSlzwO9j4eXLLG+Gt+iWtln4Jw0DupNTczTF+7yOvJUdogsFWgCKZS7R7fc4ecKgmax+NGAXuu3NLSUn2jD9nKn4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpXcvDHZ0KaBUHazYtmcQdAdApfvbCAA5eFQ+Rz/TgI=;
 b=AEbqdwXsZPide6j7g6ZH7CyVMPGSZdG6f0lF4l2UHArX+4igXFnjW3JKlfK7vdxAI4EMoDykwbEvo15rFr74GLSxXARRInKik6GAwhnKEDK9Q3a5T6mueBK5O6CDSnUt4il91RLvfceR+WrrMkg+LmrGiupaaY9dFql41xDsv/yHN8lPb4ulsYxMHLTEfcyKNKmZCdqCEhQUJl8A4uAB654l3OO7RC4z3ajZySj8tpcbrvbtZYdY7B6UOACZscrWjlB6iC4ZxvVf6LjmtqeePzpnvPtSuAh3HczCTlv+Ys8gB+QdJTCzZVd67+a3mBkuzH2n0ygY3L0TnLh8uJgn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpXcvDHZ0KaBUHazYtmcQdAdApfvbCAA5eFQ+Rz/TgI=;
 b=JkX5bJla/SUySxGUI55OMVk/8e2su0FdXnGT5dzftyAQFIRF8OW34Ey+O6oiQl2pp45/lqOn6Q2/2cep1U0tV31f0cKOZqaGSNyFteeu6ewBjtov2CtxlR9Pi7qoeOhgYwTvQjYWGQP0uweO9m2O6AFahJIyp0q8yEU5cNS1nfyTqPqJMNGxoEF5KdfItnC3KSuharzae7l8soZklOgkkb8YHUXcE9uxRYynupkbSkYzHiu+FnfhmGOW9mx7DGTNVTiNUUi7/Dc8TOutDoXjzLlkWb+170b3tKVte5v/9sxOUKHaLPnSzxEGZk9wt1nay7B9/vz75ciCCR7MZ3NOgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB2768.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:258::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 17:06:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 17:06:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 1/2] install-buildtools: refactor fetch and install logic
Date: Thu, 25 Jun 2026 19:06:19 +0200
Message-ID: <20260625170620.81300-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260625170620.81300-1-jaipaul.cheernam@est.tech>
References: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
 <20260625170620.81300-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0323.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::28) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB2768:EE_
X-MS-Office365-Filtering-Correlation-Id: f14e494c-400c-4b17-c218-08ded2dc1e6a
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: T2o4W9KQBDVs5yhHdmhDnikRm6Ja+HnecwFiEzphpxUrMWUZD+5/JcnL3VIjGRBnGq29FDrtPlSOyqHAj4PoHPDnfnx8CDoSsUn3zCivMTva4grSxVSNz+Sdr2yB9GkKn9dTYU6DmAR3BuFE/A1TPG372jvKgYbBBEqq6PI2ACnB3/HfxJF3Zmb2mJE3l+uCDdiJEJjBxMjKthPu4e4zKU539kpwlOUhBitoHykFE0AjYcp7wdhbBleiFONRpoDGBYEW3U23yF/hS7eAaolZB68xZfccs3u4R+7k6XfALl4NWYeobdMNfk2dIwxDFI/nYCcLiAjgOrUCrZsJf37UNUhz92236cM8SlKZAXxjUW3B3JFMlx8rqat9wVnz799/Q0ZGn+cEvXkUIsnmm0bktMrYtMkEPK29/+RwB8CbF9dtTTPeCt4pAO4a5uSsI7tNvuW9/cpTTptRl8OUxD1tF5JVr8Ip4f9bvcY/FkmrHX6k5kdi3L9XUtPWPdI96aix3f9BqL3krFPBTq+FG4OSWpyvSvdb8Ox3zlIEPj6/YfgrGc0bhOpAXG0DSa9vDJ+3nOYlh0ocze/z2TX5m8FfrWnXnosqhlYZasumS7YvP7QEhDasnF2+jHLwCcUF3As/eawZjd/+hoF9APPfOBJsC/+LjJbMVKcRJwvAdGzl7S4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUs0wYoIw6Vyj/VuXg6Lk24IICmwdjXJu85jJMdCmuZyy5RbVlq+pgoX3N3r?=
 =?us-ascii?Q?IEFCZMzRwLuNjGo9YNkvHfR4kkSCPGr1WnYDhE9PQAlj4NGIhve6fN/GGg+8?=
 =?us-ascii?Q?5yXcAPlp6/R/424a2jz2vFrOolSDtIQAcJZQpBgW9T/WzB7c9/uyX0qZR4zo?=
 =?us-ascii?Q?82ithSRUg/lqQWi1iL72uScrvxn+EmE2QqIrEn1bVFvJQ/6YozJW9mDU4BgI?=
 =?us-ascii?Q?iGwfIzPpAGXGupnVAMBvJ6uBgdzSMnvg+E77HRKBdCM1BGIJsII4Jxm18cfR?=
 =?us-ascii?Q?AYOnvXEGFZpMYOeX8mrcIoMbZEnbtk01H0/y4xlOZoNDonJgg8smJNFBUrGc?=
 =?us-ascii?Q?JFLLb9d8cr9fzgAtYv1hVj68iIu740hgnKeOSVapynTjyc3vP3aCLYcyGkMQ?=
 =?us-ascii?Q?7rGul51880RGbCdpcddkGteBmqsiNdpKRvtxzlQnJ3j/St02ZTqHcd96kZuq?=
 =?us-ascii?Q?EGSZkQyVtUAnmfmU+IWOIMbRrvzzNY6xpp/tDQVrknygJsOuEdeqgAva7Zgx?=
 =?us-ascii?Q?XObvMM50reY2VL0zYBU7HK1w9+BkQB5UhnXWLHN9eiqzZQovMAPX0S6k2Wuq?=
 =?us-ascii?Q?WxGfS/dm1OTR8ZyNiN0SQQAE9o+DQQWkGDRpfrV9F3hUfN9ZKU0INPkuDpZ5?=
 =?us-ascii?Q?oP233l/OYJo66Vii+M8Xen5pQRDe2WbvIqYu4Q2byJc9Jf1d5gwXHZ0t1xJH?=
 =?us-ascii?Q?JfMrseKdPjEKVNkjUO3ZA4ZXdSDon84ZynxrWsX7Dyr6g3j8leXBLntsfGch?=
 =?us-ascii?Q?hImcpJtW9HKfVyYTZn2MNXZnccV+BBU2KXRAghO3ki3Wu7m0rUu96x0Khc68?=
 =?us-ascii?Q?X6JNZvmkMKWLhr4ASJX33N64O0P2GfKJJZ4O4/U/m5zH+uVC/alwV/FfV8rW?=
 =?us-ascii?Q?0IyJ7QvXajgEodrfUT+Mv0jgLoEfigZM3FzrVTyVC2BKHZeU5F0tueKVPBLj?=
 =?us-ascii?Q?asLtI1oMMqS+lSJV+voIj8qz7jcanxksys9BAi4nroA+IxoOdkOYTWsJEFgn?=
 =?us-ascii?Q?BGGivC7/JsrOksuMZE+YeQc5PUc/kTxWHR9IcqA1c9qHEsO63y4+WHg/gz0S?=
 =?us-ascii?Q?2VT1E7OoGKqGHbzaKO1Tvhx1TSwRUp6KjNAcL6Y2Q7du553oR7woDlo2AnsL?=
 =?us-ascii?Q?Vikw9V1Yfs32guqiCA2L6BQLIWhUnstEawqlI5oIEkiKELsIqrixDsNe8ccF?=
 =?us-ascii?Q?PZbuOaS6sR0RW0YMKDwBtgBhPCOipAPfxYKISfzM6jBt4MRQ0yXf+1/jAeUm?=
 =?us-ascii?Q?VgHswtV10S6yrAZwuNNfDh36lFFDH/qIA/RGZVskADVt1JDaJYdk8rjvV2G+?=
 =?us-ascii?Q?p1y7F9TQBc+Oh06HXOlN3zwgaxpRfW37vISY3yS86PdVJhRMFAYvPVUwpaKo?=
 =?us-ascii?Q?ghiyrPcrP9L6L2fAMtqAld+LTudfgYjGtAyjbShHiVhX5x4bgW6M71e9TeIQ?=
 =?us-ascii?Q?hSMPlH3O7lsGLsk+WEceu+5uHvXkkA2ZTiJyJESijnUV5hNIcUEH+p9kY+Tr?=
 =?us-ascii?Q?0mhBdk9UmbFazFI0j8w0wIRJXC7epKH1fhDKc/xnO7Svoe4G7aTyM/ce847v?=
 =?us-ascii?Q?K1YkoSsCGwjgbkvb54udBiE28T4zgcsoEFsKktxoedFa1KmDP8ekf/FCMPaz?=
 =?us-ascii?Q?61J8oj0jQZtpWoGCpvggNnjA9twaX2iUcctjecLQ05aebXR3LF4FFK0shUR+?=
 =?us-ascii?Q?oQwkbMFY/5oqvsD2XymJ8/KY1ERLMj7QI50QF9uaZ0TPwe7Y1sfavbLoRpYI?=
 =?us-ascii?Q?fX+bPqWZfF9e0Mvu6XI74a6xnktvOkE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f14e494c-400c-4b17-c218-08ded2dc1e6a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:06:37.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/wvTNCm2ep1vKtL/GmsPpmUFjU74e1tijsPes2pCnT0QBrKe02ic5BWagJoSmxlu3VHKqelRL4FOdfeX4E447aBvRH9o2LiQNaIK4ZTx/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2768
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 17:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239583

Pull the download and checksum code into fetch_buildtools() and
switch subprocess calls from shell=3DTrue to list form.

No functional change.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/install-buildtools | 97 ++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 46 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 723edd793e..b438d7a359 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -114,6 +114,52 @@ def remove_quotes(var):
     return var
=20
=20
+def fetch_buildtools(buildtools_url, filename, sdk_dir, check):
+    """Download the buildtools installer and optionally verify its checksu=
m."""
+    logger.info("Fetching buildtools installer")
+    tmpbuildtools =3D os.path.join(sdk_dir, filename)
+    with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
+        f.write(buildtools_url)
+    ret =3D subprocess.call(["wget", "-q", "-O", tmpbuildtools, buildtools=
_url])
+    if ret !=3D 0:
+        logger.error("Could not download file from %s" % buildtools_url)
+        return None
+
+    if check:
+        logger.info("Fetching buildtools installer checksum")
+        checksum_type =3D "sha256sum"
+        checksum_url =3D "{}.{}".format(buildtools_url, checksum_type)
+        checksum_filename =3D "{}.{}".format(filename, checksum_type)
+        tmpbuildtools_checksum =3D os.path.join(sdk_dir, checksum_filename=
)
+        with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f:
+            f.write(checksum_url)
+        ret =3D subprocess.call(["wget", "-q", "-O", tmpbuildtools_checksu=
m, checksum_url])
+        if ret !=3D 0:
+            logger.error("Could not download file from %s" % checksum_url)
+            return None
+        regex =3D re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?=
P<filename>.*)$")
+        with open(tmpbuildtools_checksum, 'rb') as f:
+            original =3D f.read()
+            m =3D re.search(regex, original.decode("utf-8"))
+            logger.debug("checksum regex match: %s" % m)
+            logger.debug("checksum: %s" % m.group('checksum'))
+            logger.debug("path: %s" % m.group('path'))
+            logger.debug("filename: %s" % m.group('filename'))
+            if filename !=3D m.group('filename'):
+                logger.error("Filename does not match name in checksum")
+                return None
+            checksum =3D m.group('checksum')
+        checksum_value =3D sha256_file(tmpbuildtools)
+        if checksum =3D=3D checksum_value:
+            logger.info("Checksum success")
+        else:
+            logger.error("Checksum %s expected. Actual checksum is %s." %
+                         (checksum, checksum_value))
+            return None
+
+    return tmpbuildtools
+
+
 def main():
     global DEFAULT_INSTALL_DIR
     global DEFAULT_BASE_URL
@@ -243,49 +289,9 @@ def main():
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
-            if ret !=3D 0:
-                logger.error("Could not download file from %s" % checksum_=
url)
-                return ret
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
-                    return 1
-                checksum =3D m.group('checksum')
-            checksum_value =3D sha256_file(tmpbuildtools)
-            if checksum =3D=3D checksum_value:
-                    logger.info("Checksum success")
-            else:
-                logger.error("Checksum %s expected. Actual checksum is %s.=
" %
-                             (checksum, checksum_value))
-                return 1
+        tmpbuildtools =3D fetch_buildtools(buildtools_url, filename, sdk_d=
ir, args.check)
+        if tmpbuildtools is None:
+            return 1
=20
         # Make installer executable
         logger.info("Making installer executable")
@@ -294,11 +300,10 @@ def main():
         logger.debug(os.stat(tmpbuildtools))
         if args.directory:
             install_dir =3D os.path.abspath(args.directory)
-            ret =3D subprocess.call("%s -d %s -y" %
-                                  (tmpbuildtools, install_dir), shell=3DTr=
ue)
+            ret =3D subprocess.call([tmpbuildtools, "-d", install_dir, "-y=
"])
         else:
             install_dir =3D "/opt/poky/%s" % args.installer_version
-            ret =3D subprocess.call("%s -y" % tmpbuildtools, shell=3DTrue)
+            ret =3D subprocess.call([tmpbuildtools, "-y"])
         if ret !=3D 0:
             logger.error("Could not run buildtools installer")
             return ret
--=20
2.34.1


