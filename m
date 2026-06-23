Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1662CDB480
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20962.1782221729473356181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0b7meMdN;
 spf=pass (domain: est.tech, ip: 40.107.162.45, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsgrQtUcxNWPa7sCSU7OAu1rOzm45jb0c43Pam/d8jImIaDsumc8stnXWTk43ofRWxiqyK1RHP7qoYH6Bx/HUoso218vYjPiivN9GYwg4WCsYDhjwaIwXlCcxU9/5rHnZtin82M90QwXFJ6vbbfXTBvsKGZzXMEwWdMdvAZUa9IAU6uEX+uLiA8K+QAretF1bPHxW/Nnju8sIE0o26jNMVwymj6m+u1RLPOv4twJeMHo78coHv8uXZjQ/7QT4+bxpZ6+QEfz1kj6JalwAsGOAdfg2KHoQebWKTa5dVusWZBTZrTJgZN5mgzHAiSnvnUZw69xFjxbU/DykRQaWrY6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr5xyvAjHrAr/JGTcwEbwEhjXHO4WKUV0tHv08/tb1Q=;
 b=IOeJVrDkPdjzNXYmCloNmLo8p3sSTC6VTTsmfo7xLEhxbSw9j2hM8WBPQ1Ai7tBoUNKh6dixU6PDwTWipbUnDQzTMqm/NYMkZMoi2bbKw3zPk//WbeXkZZdJGtyJD1oNGQPU/LgwWzS0KiyWmhxW+1goxmSoCe2/nW/dFJ2lM7XTJwXUjn3ux4B9ZjRVtZmENciRzX5cyhp4wbDzXUtq5WyjJIr4vqlaM3uUctXK8cuLuXSdvlAby7PpZsBPcg51SGZeAugDlK4lQ8P/F25YuMv+a2DwC17y33O+xXCxHMJArdpNhCh4sitcNGR/AFjWMRiw7bGMWkUrX/yaOTLveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr5xyvAjHrAr/JGTcwEbwEhjXHO4WKUV0tHv08/tb1Q=;
 b=0b7meMdNuKZCcVhgx+rnD2D0uokWxGGrkJptNLj+ZeG6yG/owajK3AwR+A773fksOT177RrDvVBLDb+3o1uy8dMx7wK0NQUOOxux0z6JlPuWyKqao5mqwJD2XzZjLVM6JeNQTdx2ch8kGU+rrEmquZQkgRX+3Sg9dOkFJO0akST67yXGvt+UWMUZs0EKv8G8cCPfsdJqTnigABQUrw/NsS68sNLolslxb2MpNRFspdNL5EbWFbWaSVVQvEoQYawZzGHyKdiXpOgk3Y0vhJfJqEujzNGVPRyIf5WW9SPeNw/BFdYHPoQbUJpsiwL2B9tUlA3ZRMlMYOwMAhfvpxRu/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:27 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:27 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/9] oe/patch: drop shell=True from runcmd
Date: Tue, 23 Jun 2026 15:35:13 +0200
Message-ID: <20260623133521.17053-2-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3bac33-3385-4bb7-89b2-08ded12c4954
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: p7iB8Nqu6ZyaMpNPVfpbOVvTiyX4Ti783betKQr3e858rILatwq0lCcXBRpEcgDNNUqNQ36iqeOsFW6mlhl41cHhXwLdc00VjSILFLIIDuxHiwdbN6m7/ZCsH+0E1v3weEAOn1pQxafcDg35CyYIR88o2+eld9F7WOT1lO52bWdLzab4zq5/upwighPSfYA8Uy0RibmrvCQjY/CLGH8bGvGGV3O332UNrkcGIvW/9BnQMczsKHJTDwgYaLpyXGUBZFrZClIxrKi27VcOsLWVhHPz1nJkrqtYL8P9woSKe8ZtExohK/1CUA55RFppjG4wiN8J1fntFKwpe1PmFPr1Ourv4l9xRKvkaO2MVZW87T4zQCJkK3HRtucVXQifUtXGd4qoD6z0G4Iz9JkoT6TZl2Bo5cg2sF/7+TWqfmcE0nNR4RiMPjuQyrBrxbUFnRrUvQUTLThAf6Kr/A18Xdm5yK3y2/Hjf9LqHG99jwnx2kuw54SHbCmTX39uMSDVAeA2Fi1akuVRQLov6nDwTp8VTHWYsM6bvOKgmw2zma9+/4unwSOMPAhsfmZQvI3qSWzZhMAOZwpzeOIL3vINDRoEkQ+0iv/Bny2YaQAjh7hTL9XhnXCtI/geLHKVeBgP49FHTiOkSZLbjDVNoKRnoqFZ5rboyZBdjNzzZbR9bmKB5q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2p/kmDMBd5wke9Bkn1H3c63ww8Jbi1CnNdv+hzottgWCuSqDt09TApjVPUk?=
 =?us-ascii?Q?A/azn42xU155U8qUu5dcgpUkd2YcUfuAAIYA93MaQaNYGfVs6ufW/gVpJ42w?=
 =?us-ascii?Q?mjDRps7cMUiNsGOM/13z/wZPWw0K2zijUiUWcPhJhJU8N27T+Y5rqYjyRaIE?=
 =?us-ascii?Q?7VicpEBP5Qk0XqxJlD6UmOuMsgxAb8oySSIWhoCB+sIzF+BmJHWiANruIrh9?=
 =?us-ascii?Q?d7EdVewXHK0aGNM8v4nP71i0sB7KwlpRfYE9/qbjPIAzV+yU4+E4PZm/zcvZ?=
 =?us-ascii?Q?ROOtofdL/2MN4s1YIIowQcVh2bKFy1BcdMWXQjfr2qcDMUKIZQbicLto5sO6?=
 =?us-ascii?Q?vEYI7xRGkR+2wRq56K2DNj7MA8Y6gm2PBR0m1zSGylCblvrt8t8SCoHlKgnv?=
 =?us-ascii?Q?N+uOlt0SrHY8pPPJp00jF1W75X2ujKWZHLcPBxGAaURJip/GkY79NZUooqgy?=
 =?us-ascii?Q?WZjsZYVE4jN9TY9jNfL2TFuiHHhkPv7nqbLdrqxa588kW5DO7I2XrL+crR7b?=
 =?us-ascii?Q?ua6wwEblvKGhnXzbt9xknFAY5UORfMolAbdUaCjDtWLqS39478Hp0NrsHjOK?=
 =?us-ascii?Q?WSAQji5vUmvDxZi4AWdNT3SbIvxbQkoQK5tQVSmNFjAH9+llV5nZIFvx848D?=
 =?us-ascii?Q?R1UKN53ixl3+XaSap8UmwHb343j66DB8tutkp4dVbXJrLHGHoBD2Zdz3blfR?=
 =?us-ascii?Q?99D2h4RUthmg21ZZkFuMOIdfHWMzQ5DJBh7ArAj6ebt1zaxsGcxjrn7lzbQ8?=
 =?us-ascii?Q?td/t4OUjMh7e03K55lPju7NlhZoASnQ7twKRGsZv+NETAh0sv5PExqsD8K/X?=
 =?us-ascii?Q?Phta+bMzXVW8xo1BtvN//SMquATPr0IGHe5ytJSTVoCwDWUsJT0NFDlWdmpm?=
 =?us-ascii?Q?KAhhJOq104/ONJ4m+tN1ASj/SKJ1l5v6oih7qt90P8/GJMhcznaBx6lQkXp6?=
 =?us-ascii?Q?C4X4qSfDhHTdUPHxoNs6UU3Td6/wqwyQgpeoJ/YaSD/sZ8Og72BcXrZo6Ng8?=
 =?us-ascii?Q?E94fHDmf4LIhVTGqEO5qHlBH1oiVwQFn8Fx5a26ziU/vDQ9I3WjL13kPAE4X?=
 =?us-ascii?Q?ULqH8uvCRL3YEI82w8fDmK1eddaj7zCyUbJ+p3fU/AI+OcAxt44mJmFQTsRz?=
 =?us-ascii?Q?P1ouT/jB881bwYOhh9g+jMoMAY46NfA/FMDZnq+wtxqgErVCcRZrEZaXIFGg?=
 =?us-ascii?Q?15SPgooEmMGSkyuqZcgH/IWsU5ELC+RM+3F/gVbcUvsB4bZ3f3AiGFfWPe5p?=
 =?us-ascii?Q?w6cVJy4UtUGfcSNB5ZSt715BPWmFNNFqDW9FXs12T94WbFpm6rFcF5HD8agN?=
 =?us-ascii?Q?M5VB8W7dQY1tNO9uUUDZLyQVZe2E0U8sgFG1d+Ia1WFZwBWTKdKWA3sK8IrR?=
 =?us-ascii?Q?9H+6X4St/TNlSEkDs0Tq0e7NNgHI4J2qv91oMIOMmdC61SkdBGanA9vFmWjX?=
 =?us-ascii?Q?ALgf+FcM5brVBYqZQQoZ7B4Ej88HWor19nsqGgvb+pTogvUolPiiwe7QXPce?=
 =?us-ascii?Q?7kVt/ZXDcsqVUS8gT3fCN76zfgEtDlBvzlQ1fA3MiPfLQYwKOf2wGVYOpnA+?=
 =?us-ascii?Q?4qbebhFC94aE6Pdn+ZdKZMtkxaHE6YxgS7zkFBOEYRST7vM3K2hfwn1kpjaJ?=
 =?us-ascii?Q?fU6JQ70KW7Kko4EOmAUIQjF7FVz5V7UuU8TtWN9IFuNwkscyaM6YypRCxuyj?=
 =?us-ascii?Q?ECxdyM6hUKBjZIwLOq8CCRr9XtdVniiSskGf5Bdkec78deCSs/Jj8UWisZVN?=
 =?us-ascii?Q?ZTRmeec2Hg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3bac33-3385-4bb7-89b2-08ded12c4954
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:27.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA8qk4xcAqGnvJO/CAIzjhRavcc5i5nZPM6nD2vuWrHe6eLlQNrQtfVmLsNS5V63K7Yz12h894vUQlsi7kUW+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239394

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

