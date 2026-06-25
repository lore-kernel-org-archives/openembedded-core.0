Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D912ACDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 17:06:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16204.1782407203187033386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 10:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hVg3PN3t;
 spf=pass (domain: est.tech, ip: 52.101.66.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da6gEp6dPcMKklHlk3K736ld6cyPLjlnRF2UIujCTtIjz0cX60RHasAtxV7Kdm3OjDLFYkwO4sZdM1EtkCaIJCaM65SH7Py2DOmffcT7Rm2G7JVgiqUczTUSmHsU25Cd97JaWgKwCtSrMzRC2/6b5OWZDgIJxYegb9J/+eQfmhw5psUcsisZykm9DPYX696JE+I8vfhmg4rjAxlce4DfL61YRkYKC1x4BtBq6HYiAHXC7bzi87XZDKQVlD/s2/XrsG74CyKBxpc81ymMuVGBxxr0Vhzq8FgXDxeNGLNqwkJTZkKTD5MVFr6zGhzk21T+/dvpXDdeAgr+aXiBxRHyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00CZsf8GLCwrusTFrMm4wlfbDxuVFB9Xoe8NolylJ38=;
 b=ShFCwoXgL6dl6gGjvKNPhSvFZEbAG+sLNehhpz7u52DG0tALurwpLwpXP/oFwNMzzFwCy1PioVb91BBqt2esNHZZ5UWP+VcCa9JNCUZWcPGsbVWpcK34eaqFccGfD3crIdMBsa7ZgRHVTnkQSANqJL1I2Zf58KW6kq93ewoud1OWiXzM1/ySQ0jS8ldpi/A+kAPDObVBi6lle1H7HkB35wrhFsXvA6AAda7/TlJI72vnRuQf+qi9sQMoFhvZbi3n/tATLCLTY8hc/2IYlzK9e/CtolXHejHbyotV4D7eT5xzFr6uOskhOuS1lVvJV/BtZ6IrIAzgdFLScHpboE5rpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00CZsf8GLCwrusTFrMm4wlfbDxuVFB9Xoe8NolylJ38=;
 b=hVg3PN3tlnHtup2h/csemqvY8vc9dCcA3rwHUC7x86rG2biBEwUlCQ3enDNNnJogdfMa9Ivhah8M5MsoIKxtEgj7iCPvVknGZGjcT8xpvEdWObsblhZV729SSIuh/yr//zkSdQzUsQmsA0S9KlHRavkLwdibjoMHzxNzwmOUDB0ICJmnxWsXVEFIjUxrUD5r45ijoHTFjWJSdQZ/sPmfhXbvFuxAfAeAXQtN24ki0rrfd16BrUQfWISjnHiEJzbAEIaisXMU/KlSdYW8gnN/xfQKk/25M4fJdIVM8Fq15U1gCeS9UTTmuOFxo8Yr4YAF8gC6SACqP9q+StUYuxciqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB2768.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:258::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 17:06:41 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 17:06:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 2/2] install-buildtools: add --local-file option
Date: Thu, 25 Jun 2026 19:06:20 +0200
Message-ID: <20260625170620.81300-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260625170620.81300-1-jaipaul.cheernam@est.tech>
References: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
 <20260625170620.81300-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:10:232::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB2768:EE_
X-MS-Office365-Filtering-Correlation-Id: 07054a8c-3c15-421d-a667-08ded2dc20b6
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|6133799003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: IfXcgyl5k8IxNr9xP+OkOuAxQb02HOWQU85HAx1GuVBahfqngPnk7UZb+HW8XVsxsWFYmaQ+QrPdLN24+vJPOpUbVV2oYkXFn643sYZl8sRRQB6n+XAh2TufKlaVaY4UNkotW6PVQhQNpEPbDJ6XAw28jNyBpbuuZVpjUB9UHBHRXr/4ncKGSx3a/iOco8fFN9J4B/8+pYS17+tIdc/R1dkwt5sMp9zf+WskgNak+M45pgyu2JxnYb7JRtwbJ+WQw91ogKrKuLSbRxMz9jCTHy2gv/QHevjhsIUw+QiF41CVvgyuUafJW+5nfD41UsIqGyaxqT4vpR+d9SO8FwKJ50M8JGYIDLBuzUCPRIZdGILxX01b3aOmK6vYvc7rLRi+vPiGst4DkzJDOKC4g6wg3wp+FnXmnJUdi1Wylw0sdRLbARDMVIB585c3JpDvgi6oIUXbVV51QVA+6t1IBHBpoOsnTjtmq1DWfbYmGz3Sd3hnQH4Up8yR9Br+wcuKlH6BE9EE4GNT+mqDdE8UpMcXteEcjkWWaAbrn1bTcmNbVt4IzFXA5tLHIX033jea8OUPa9d1r08a16/sOj+jlLxA/FgfHpgp39KjjbvTbQk3hlqqbpFaZyGRY9JxtBbEnlCuAIAeQ4QIRbUXxFwLOG1q4U7i0NjKArVd+q8QzsHQDvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tl4JOxOxh/DpHqXxz0zUWQUd+3EKEpC87ASNG6UA+/gqAA3Aw8gIJ34CyR4E?=
 =?us-ascii?Q?QKqi8tGY9IMuLu1UYuMtEBL7P51lMmoUP/RuVA+GJQAecqY0J6oxSCUHFUE4?=
 =?us-ascii?Q?lY+ASceX52M1U2Ojs21x5JMuitlbw8UfkWxg4JxIaGNgIpoKqyjNaDXx0pVH?=
 =?us-ascii?Q?3+kqdLExbfGxFO3ZxUAHBV8bzI3LwYVu/aVMvlGIinHOvE5tkCxtLxoqRx4Z?=
 =?us-ascii?Q?yY5gPy/SLu5LPAkoa+xPylCBdn4cXZ52nRyxIJ5hXEZXQ2mLaDWEHe82fkce?=
 =?us-ascii?Q?TbhTiOXBzZovXsutS6EX1U370D+ZOcQGIotX8w9HpetruJFAxsdDI/cnUpBU?=
 =?us-ascii?Q?Ff+ffckalXEnnwMvuV6YZ8xm73uQRIzdAvJDX8t7EfwVpQ95f4KTldN7+g5Z?=
 =?us-ascii?Q?WhXVHUh5Ex8Ij3GDjLuRfuTmBSmagRFNR2hf89wNt4jCNiUTUmCM+fDzaSuC?=
 =?us-ascii?Q?CtqGmK1gbCJiFq/wid2YrmqLtl3inVHj0kX/bUw4aqKcFyse90O2E/cIJ5zx?=
 =?us-ascii?Q?uRBNm4VrZGPo4qVViTi7JIT4+lxJMEiC574eo1M5+s6ZBD2DWncSUSMOaPBX?=
 =?us-ascii?Q?Yvlqth9lrukqvxJI6LtSvn5pmQb6F72trAXHG6ytDH4lXpYGyI/jcJYi308t?=
 =?us-ascii?Q?C6ZO8D/jo5Co012QiGzdc1fE+Oh/8VjiC62XntqQe/AT2vp1ZmooiiaPlkR8?=
 =?us-ascii?Q?GciA7SexP4R7zR2o6YXoeCip8BtqsJIo0NXk0nc5f5qY5H1Iw+LPrZ0tas1b?=
 =?us-ascii?Q?F3CTA6WU5b5oyZ33K7R3gSuA6F6Fg2XBmzzXFjpO/LjL/t5M4rBzURk2hAze?=
 =?us-ascii?Q?1QD+an9VELioxW6opmK+kz3V1jWADwM2dIizHYf1l4RV1KwpUHd2ZAnfKnRG?=
 =?us-ascii?Q?pJAck7u4FPw+NCIOEHzQ0WOqY79LwiPmV3iAOl/7JuVmoI7LOqAjUJbudraG?=
 =?us-ascii?Q?diiw4rUsFvF7UmK86ve0B6gcK1MSxriohR5rt8F7CPM6E81ckNrt8nYdo4zB?=
 =?us-ascii?Q?FPe5dqUzLGgqgKpxQ2QQnrqzqVRkQwPPOZrKgi+HTygwbcgWktUIyQk0S2ZO?=
 =?us-ascii?Q?lxYc99vbTXZiBTk/CX6HRCCVyR9hfrjDQHCN0ajtRRGjTcneCs4HbfyqT2Rw?=
 =?us-ascii?Q?aWl1leAphi5GxBuU90vBCl/yOZTgIAhJ9mA/dm+hlBA/vcv+rzTZ35ky93uG?=
 =?us-ascii?Q?BAGYbDQX44N1+eusYJQINbVW1jGoEVA9rBTeYaAu1esZ6ebtsCmqFovCdLBY?=
 =?us-ascii?Q?gsSGaQwSGniU1eNk4Sgb/EuD8kgRjLF2ckpdOkUtgzQU7QaZGj6LFM4R4E8g?=
 =?us-ascii?Q?Rk43I42MqpDpWfHADc5eRRKL7OUvnGqGzzuJBtgx8W5yPc2+D0XKvZt4bXQE?=
 =?us-ascii?Q?vUvMP/RHXIC4xxHJye9g/2SOxcdRSnvfhx9yvW87Bumghin2ILMWknsiIaD5?=
 =?us-ascii?Q?yDjadj6VhQ93xLESTbP0axW3S9QdhwwA8ZvUwnFk3QMVS+ckeDJjix9rYetM?=
 =?us-ascii?Q?WuKmYGACJYVXSsSRqj/rCJ8BfKaJgQ6lENdsnRMkMoChvzVWVaduaWbu7Guv?=
 =?us-ascii?Q?214wMCM2fQm6k3RG5vbq2BC90/IFqSvQ9SUfjWA0xYw8F795cGUiCtAdFBxZ?=
 =?us-ascii?Q?afIrYJtZHhWXngDRQPy72QWYIa/qT6GIVA6zBZU4LmEZRCQA0Tk5pAxh8hxc?=
 =?us-ascii?Q?jy1p1Bi2AT8w0rRQ7Dl171+UVQDkGEzwVM3QyGIQw+fLoFw9hny+QM7Fj1eL?=
 =?us-ascii?Q?FsnHkaGWTw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 07054a8c-3c15-421d-a667-08ded2dc20b6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:06:41.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmAc8nypIiCZpn1XsOQ1LnMr1pKf0sD07VfCuTpEsuXQp+Nz1Wa5h3ABdREFtipLj8VbYMSCPPr13Gvw8CQxVS7UKfKtWq13uwIzR5Ncfy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2768
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 17:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239584

Add --local-file so that bitbake-setup (or any other caller that
already fetched and verified the installer) can pass a local path
directly without re-downloading.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/install-buildtools | 40 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b438d7a359..4e6f6e25d7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -176,6 +176,10 @@ def main():
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
@@ -289,21 +293,35 @@ def main():
     os.makedirs(sdk_dir, exist_ok=3DTrue)
     try:
         # Fetch installer
-        tmpbuildtools =3D fetch_buildtools(buildtools_url, filename, sdk_d=
ir, args.check)
-        if tmpbuildtools is None:
-            return 1
-
-        # Make installer executable
-        logger.info("Making installer executable")
-        st =3D os.stat(tmpbuildtools)
-        os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
-        logger.debug(os.stat(tmpbuildtools))
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
+            tmpbuildtools =3D fetch_buildtools(buildtools_url, filename, s=
dk_dir, args.check)
+            if tmpbuildtools is None:
+                return 1
+
+        # Run installer
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
-            ret =3D subprocess.call([tmpbuildtools, "-d", install_dir, "-y=
"])
+            ret =3D subprocess.call(cmd + ["-d", install_dir, "-y"])
         else:
             install_dir =3D "/opt/poky/%s" % args.installer_version
-            ret =3D subprocess.call([tmpbuildtools, "-y"])
+            ret =3D subprocess.call(cmd + ["-y"])
         if ret !=3D 0:
             logger.error("Could not run buildtools installer")
             return ret
--=20
2.34.1


