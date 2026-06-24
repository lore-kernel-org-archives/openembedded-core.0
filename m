Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D54CDB471
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=g4k5+PT0;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtvTor6GK5G4mZEsjcO4nHGYLdiFtX0L4cpu3aZHnQk5VNx6uQWvQQ35KnxPZbwFa2I6Jj9E+OKyhHea5R9e3hID9N0AgfKmSfht2w0ZXI2bHC9oHFtecZ5ywGmSm5VYEIJvdDgIMsWOqS9YGy6NU3EGXGakLOtc39bfIyondzonXVOxSeVylhhPa9IuX/P8Fg5Ow8FpEmr17OmOwsdgCtlQkSi5vfmiYPTs9WV5t0yzQOivygHQp5L0VHU8rviN5fqYgDPqgKFuMdiKCNRUVMn+C2D7F2iuuZ+eVY7gsxM3b/KxyAXXNHrN2v8FrNDpVjCWkGOA4tdxiHVSDRTfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr5xyvAjHrAr/JGTcwEbwEhjXHO4WKUV0tHv08/tb1Q=;
 b=BqiLR0yWW4zY/c3LEnOlze+hx0FCisrR7TNwKdEJKTV9zD8kW9rCOuCwUvEsnHNsFa9vWKhSLCy4y5LpqwkbOth7SjP+1rZlsTacNsXD5jwZazK1zmtqtbxI5U8KYJGDObRdcH+47zJbdIe85eNeidzaRX7iuyRzIlQyAhNLK4dD8AyFJ8cms9aR5ByOEB+3GEK/PrxHjai8M92amCrsLvlh/Cj5nvGqjFNUcUkD8CmIDOFwuecgD2jR7xAqZ+Xg0WFk86Oe8VPOT6jN7jVuBHA/+c5F6tGi0rCXmowqsiwf7S1q+fC6DGpjiHIJbAQqO0Kgzprie9fzri0TKxEIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr5xyvAjHrAr/JGTcwEbwEhjXHO4WKUV0tHv08/tb1Q=;
 b=g4k5+PT02mBhvJw93tsVfrEdWdk9YZ4HVlSbV/NyoDMSqRHOYmGEU3CmRHJ0BuNG+NPQwwbw7DNeL74J/IUIfjcheSsv+leXOxVhjWpk+SVU2hhWxwJSSRhesbPqXBlRpn3ULGShDK5birSt9sql8EdLkIqIvATlNWPJNzaoc/Nz+mGjnFQPaP+JMGmYIZFXPvr4CvXX/IQDphjAnnY0smJ8qUf7DjSGigmPJ3uBreDCOOAYl1tsFlaOeV1hmgxjP6L6zDs6d5Mog35nbLLKAAN0X5C7bBFIq/LrFdE70AvFacKtvsI4rJ+Tt3PemQM9ZxPwkFxK5lkE/x3M8WvKaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:12 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:12 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 1/9] oe/patch: drop shell=True from runcmd
Date: Wed, 24 Jun 2026 14:43:59 +0200
Message-ID: <9dc1edaa428d6a93b72170e9ed47377460c0d506.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0175.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::30) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edfbaa1-0ea9-4379-341c-08ded1ee4b11
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: FpVMcvn+e8VoaaQJ9HjPhxkAIECwtqF+SSU/VISBdMuLErRHHK3JTA3q8NAXRIDlvzVcYd/AFeT46pkwykI9PYp+wUb/YgSAjS4WOeHmWYOJ/CC0xotOr1oJFB32ATr13r1G3aHur2xEAf0BsanI4sblJtMsdjDA7bhF0kvxG48Hxfj9J9+zJMsSlzeId6OzLG1WVrdTljNsDoE6moUXOx/ODva9YYl7Fhl27j1ZYXlJEwqQtWb+HCDggZIIjjKnmRFNgDahu3Gi2ipZ3iNW8j/ZWjTt2sLrwHg4EfwqunlOnpM/nxzdUwYMNbO8ukNUbha8sEXEbOqdP7Ifd0qwxZDjomQQ8F/BSQGUsOqv7vRlZFITKvU1WS2hoP3DgdA1lRhtFmo0RZbsSHXg288xs5EvQCbmJXJFfoGR69bF5KmS3xY/GD8XBXt2TURJygRHx9R7k1zP9RwWi4t4LDzUTrajzrjnWguq2kWLmnHPU1QgmzMFG2rYtqGmK219C384zwBY1AZYyarwr4xYd9HnTcG/nLsAwBhyxvIfO7bAeUvcZPopl4W58QeDaPphmA9wKmKXb/w1loY7z40VqpFPbPBD7tbv13hGfocvND3LTuNGH2scfL5sbl85DCXgowsRleKbXgRUdM/pDh4Pl5hKiNTjxoT+zD9fO6J3kVLipTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpxgvXKsyHuFzEEaMxc311EGo2lIloYDZgpQIzMiV4XWMy31eck+GcfLxu1A?=
 =?us-ascii?Q?KYD+LArVGHD++P+QVLPOJ9ab7KPdBar88rRMDhJJf0sI1tAx2rLrWvatY+NW?=
 =?us-ascii?Q?GrdtZmOlHMPn7bP00coRo7ccL19aQXfWBwZIa+cp7FniUEkSlLSVOg/do6gH?=
 =?us-ascii?Q?6tHhxQHdLIuDAUeVKfRedMo+xnHV5MdD4uYztsR421sWMLvkPz6SfFHOdSu/?=
 =?us-ascii?Q?qn/9I2zr0JhutK2WVtUl7yXcdIKkXmsHpnzuFH2/Fs0Dx/mL08qlqmJZ8URd?=
 =?us-ascii?Q?5HiMopF+ThB7eLz2BmaFBZcbuIC0F4rjp/isuB+GTsT8ELRl0gpZ09B8501M?=
 =?us-ascii?Q?xYo7V9bKzaLqqiPHS1wnAobg2JMIza9a0IaEldJ7QKBso0D5p31jart7vXrT?=
 =?us-ascii?Q?l/PJQgtAH4LtSBy74nuZ9xFd6Nhd4wj5TVibGbxzQMccd014VUZt7ZXjX3Wq?=
 =?us-ascii?Q?vPmU0qu+h7BjmErHO5mM0CCjve6DY1Sd57Vsoy3ZSDNG89Om6Rpbd2Wq6OLj?=
 =?us-ascii?Q?fQD+PJ1qHp3VmOwyyYHorycObh+l3UKXXer5sPjgRQhLNaPaEsbg0htXK8FV?=
 =?us-ascii?Q?vhZgbUQLCms7Ze2M4nLxBqX3v/Uw/2Cz+j09HVxx4osaMysJhrDObg9H+6S/?=
 =?us-ascii?Q?Ifa3cIIXZATR7iAR5/nBYPCdypcC2N/K0ZQDFO0dyVHFzcCwsT5SsuVpht8Y?=
 =?us-ascii?Q?wHpfqgwNxdcmPMiaxkt+dLjOc32F4EZjKDf41FAcWSJNcBHPxijp+6WllbTb?=
 =?us-ascii?Q?BCx7Sm+0zjqsYMF2T7mTDVCc+Jn2AdpZZgtVyCa1sepHJWE5OfNqXPMmO3bd?=
 =?us-ascii?Q?kGFWEk6lgTF6GLK5Gpy9DNLW3N9mBT+9jEw4QUIZndYe/M29k5KN/F2Au5V0?=
 =?us-ascii?Q?DD2N9+fu1ane0TPWhbGTw21LSOe9ERHvrXESnE6uNQwqLmQO+xRv1w9TdzKD?=
 =?us-ascii?Q?H6VpLHygK3tfqZPX9zo8eiYm74p9mB8DtaKYK5opLfipueR889P1BwbYLAUc?=
 =?us-ascii?Q?Fg+3zoAQQzH1GYSbH/Wp4M9opiO255ugk6+SQn2J6Njef39p5rOoAqxLghi3?=
 =?us-ascii?Q?adgvJ0UFmexAc1RoypfJ1PZvLu8tBj0k62NY5sUyKaUdgaVw/SoE394capop?=
 =?us-ascii?Q?yaOoBuiCCIcpqh+rL2qfcYmttbfgo24KF5TU8yhIk3ae0Y1YAPiYCjGYhiuP?=
 =?us-ascii?Q?OedsqfCAHpyXjnmliVKzzCfSZXzqhbgLblabgPd+HOEv9DzC2krIaYXB+w6F?=
 =?us-ascii?Q?Y2YkKWP5kLrNsbnC8XLNXv/GCKtQt4YuiuMZ9OTRjvrTO0hfj2JT3s0ny1MI?=
 =?us-ascii?Q?0fZAm6bYYpCJzRWPruiV60rGfdxRvdku9/FeIE1LAdKn8NFYJRndUMi9lHod?=
 =?us-ascii?Q?zpbz5Dho44ac3r7DtJMe5JJk0vPAACL/rd/UOiKp8yHMBCDOt/R7MBcrUumI?=
 =?us-ascii?Q?mnWwSIsqDLIdORAsEN0HD1UKI7cqFUsNZoBjJK8K0YywW7/84oViD41bwE5A?=
 =?us-ascii?Q?RCLVGOpSoESWRqBPjtWRhT89l/Fi19OVCaqmVO8zTgZoe2lQKpDHKqHPKKqf?=
 =?us-ascii?Q?rWWM46GTATCBNJR2CFNJLTTfOSB3DPUltlY2/hKAaFrQ9g489psQUVUnC/rY?=
 =?us-ascii?Q?qjGerK7N5TvgAUI2cTLpoQ3HSYmzHOiVD0n8tNfsKjDU34P0RGw/R6xXDOOm?=
 =?us-ascii?Q?nZHGkKEBDlcD5VLCJqtHYg6XD5knu0mL5g4l0jdD4XJvNFOglAt5FdDjj9sB?=
 =?us-ascii?Q?MGSpDXpgvQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edfbaa1-0ea9-4379-341c-08ded1ee4b11
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:12.6105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwIRQ/5GjR5KZ83L/zKBS6TBpRN+iu4J0HRYvs1MpIxBEwBbgDde7iTNuyBG7EyEQ19/GOJgopJpf0tGitn+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239495

Run runcmd() argument lists directly instead of joining them into a
shell command string.

Callers that still require shell syntax continue to invoke sh -c
explicitly and are left for separate cleanup.

Running Popen with shell=3DTrue could return shell status 127/126.
Preserve that behavior by translating the errno codes.

Unrelated bug fix: Stop shifting the return code by 8 bits.
subprocess.Popen.returncode is already the process exit status.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2cd8de22c7..b152a2d784 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -5,6 +5,7 @@
 #
=20
 import os
+import errno
 import shlex
 import subprocess
 import oe.path
@@ -37,16 +38,19 @@ def runcmd(args, dir =3D None):
         # print("cwd: %s -> %s" % (olddir, dir))
=20
     try:
-        args =3D [ shlex.quote(str(arg)) for arg in args ]
-        cmd =3D " ".join(args)
-        # print("cmd: %s" % cmd)
-        proc =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIPE, stderr=3D=
subprocess.PIPE, shell=3DTrue)
+        cmd =3D [str(arg) for arg in args]
+        print_cmd =3D shlex.join(cmd)
+        try:
+            proc =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIPE, stder=
r=3Dsubprocess.PIPE)
+        except OSError as exc:
+            status =3D 127 if exc.errno in (errno.ENOENT, errno.ENOTDIR) e=
lse 126
+            raise CmdError(print_cmd, status, "stdout: \nstderr: %s" % exc=
) from exc
         stdout, stderr =3D proc.communicate()
         stdout =3D stdout.decode('utf-8')
         stderr =3D stderr.decode('utf-8')
         exitstatus =3D proc.returncode
         if exitstatus !=3D 0:
-            raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" =
% (stdout, stderr))
+            raise CmdError(print_cmd, exitstatus, "stdout: %s\nstderr: %s"=
 % (stdout, stderr))
         if " fuzz " in stdout and "Hunk " in stdout:
             # Drop patch fuzz info with header and footer to log file so
             # insane.bbclass can handle to throw error/warning

