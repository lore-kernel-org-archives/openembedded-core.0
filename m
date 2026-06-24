Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D08CDE006
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KeZBgQyW;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9Z0VHa7P5IoHuzHfL3WjPFOFg1jzIweoQNUadoO8k0d+8uaC/7o6wjYMNrkX+/D5KDiXi/eHDrQ6wcpkjuzz+F0V9tUjw1X4ph3WD17iArOa9tnG+JU87vrIKkoU6DICkGkvhsLy0EX0LPods2pqzlgV7FC1m3yXrYh7wnV0lZpnjChPqZ2sS76BzAxi5UtkCQ1vXAk4fNekx8WymCWC6NMV2QXKRrIK+xjA3U+GVmILdKVTZMljrx/z7HWtzTZSLrkaYIv7rzKcStyhFSFpeKOy1MS68Nmwy03dmf2nXFzvIf2iA2ozWHNxeVEBhUrK9jTphhi1AhAuvcQtiFdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3aNbZD9yqBs2QmY2M+rzdRbHVVQJHdwQyD1YSHPK2E=;
 b=NGJIUriB65Jro4ezRFLseEB7QQXB5kcHQN9dGp7ufX3dFRWVNsW9cDwWuHVuFf7olwoVigpWsjX4100j5QJVkueK4K0/HKAnT77SvxmCgV6c36bFM3Z3JKU4MiSa0b0iA21SQX3k/Myz6u1NscFxoZETXftdLtM5+d34k6ExYkErA1UJSN/ayGye11P/M3M2cRXpAX0P95YBER1YUxr1u0vc0eQVDd1S9e9nM7VEbxkXYad1yYJOqLOAcFrazbEMiFQ0RPS748r5atNM6H1VLk8+o5ZgYTdPb4l7wXq4OXuVrNnXCVC9UGJfe6hVLFEvbJzTGxzaf/1vy+As0MR71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3aNbZD9yqBs2QmY2M+rzdRbHVVQJHdwQyD1YSHPK2E=;
 b=KeZBgQyWKcn+IfzPMKD83doogUkD6mytA+crg9KEBVQnGDF40h6f7v1+bHcIwrcp5h8VfO+u+hfiNSk7qgNGpUxZjtjjtCPk6KYoIhNHzB9DE+emOb647zymWp0pMf/n40zfKrbQbBmrBenfY/aVDxgeaDCK3z9p6FPsAJo6faGjPFPAJJbDKRFY96SNbXxAxf8unhK5j8p/a7Z6D7YDOJ6YHdjRtCoWMEhp87eKdq+oHbk/iqT5kYYXsyqtB5rhippH7mPOAAejjw+Tx6ewTE7a+YMyS9OpK63Ym0RVJWHWj22g//uelgrdyzyFiEUmReyiUYvGuZEultJst/OVRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:16 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:16 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 4/9] oe/patch: avoid shell pipeline in _applypatch
Date: Wed, 24 Jun 2026 14:44:02 +0200
Message-ID: <9c9d9071154791e6ff82763893d0aba9aab38544.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::7) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: abfd0775-6841-431a-3669-08ded1ee4d47
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9Py2jJRpXFpye6gfn1AQvKHRK61/rH/Hcu/0iLmIFvCZCVeo/hd7YWCeXrnO710s8QCNjTyyQPRZe+I69n0eL834wKZ1d79yGIlOIWWwQzkeqcIk3VzreIkyVPaHN+t+437QyimcgIe2VZ9O5AaatTBn7HiDAfiscApNOMou5OnFr0MRsvgmd+VVm8r4w9Tw9a8kM0+bT0rhwUG++kPLs8DNppyhYbwUUVE7LbuxNJcU+cyeX0iDA4CNCXrH5QUVs5IiZ3aJaRgVxkPUFpH68+s1GHSynuolhrqwEt4L3FZ5VxeeJ6RfxM+lPktVePClh8YquAkK2pFyNtPkmERNcWk1S/2ZW2zkaM0tBjjoHqGDqa1e5RkMcc65AUsqlrcOqY3Epg+2uVY/wnkvJHZItMXnbIezcbts6ghdlXu8z8/Alv2g/knuKZ/vVUpCavMBiO1HBB3rOCqEwEfv3TZLLOaGpnvgusiyTF/zWbtsILmAT4DmKD7FDHt2joTGbYrHTZIwBDdb4OUTECEaMIOIie7HsGGW/KC22CMI2NxtgNFkiwgMrb4SveTs4ot7VaJMYETWwdPR93JVaOY7jyj4W8gCCeRggWaPbR/HGjo/ZXpEsFci10ic4NE30KYCFtkPDYR4la7/dIyzR/Egk80ZCoyWMesqEfgWZhYunnInXGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nMbovH7RmzuaEDNTYJ0KEDn5DEw/quUz6dEogmiVEXnzRD7/jAmk514cDVAP?=
 =?us-ascii?Q?E3tBDxYcRYGZq3svj7AO8rCqa7NDr7x6S+4TysgWdd4Xk6oePcG4cs2Boc+z?=
 =?us-ascii?Q?8xD2aiVANuOqqJIOOEP8ytgNJ/MKCtaPjKzULEn28wG99e+qvH6qKWEsFGeF?=
 =?us-ascii?Q?EkStd4c5CJWEtV3MGRj796z2W/BgsqXpBorj24qeg2gtkW2fDalumAwJrR60?=
 =?us-ascii?Q?iUe8bhRxn/jRo2K3DAkoiKh2X8oALDTT+KC9z3RdK3HGPYOt8aegoKBsHkfZ?=
 =?us-ascii?Q?CU87gyuxgwJGS9ZQYiap2m44clQICjhi2tGKZ+igWCI43La3uFSbDLRhmlwH?=
 =?us-ascii?Q?eTW157mN+Q/cqY9Hw4aFjzNPx4aZ3RhQqfju/SlH9Ji/rFi9OZJrpUCW3se7?=
 =?us-ascii?Q?gwOXvgLGcSYygVgYCmjsqJYUF+yG0vHV0omGGgzGmt/G0Eqi89UWR5HZ6VT/?=
 =?us-ascii?Q?dCdkvdePbldYjnrFEdppGPkuIUfoPCD1mZmMloXu+KQHbHOWd8WVuiz0TyPE?=
 =?us-ascii?Q?XX2K9bvRHXMAcJBo9HAFEdjA0rNB8WDedxnq1e/cLOHRKF0x3nTOIPezZuFD?=
 =?us-ascii?Q?c2moRvnAZVfLng+6rW+edgDC1lcWYg7muhZAi/ZQJ2oc8I0gQDQ+1JEELMXs?=
 =?us-ascii?Q?EbrV33RD/AexH/6OqexILaO/6ss6t4LW5VXUgkFt7Sgvixx13RGi8gPUpC7g?=
 =?us-ascii?Q?eAk6ZLv1aDg3/a3yOKbBgM1kfv0BGXcGb7y3zAsAksWmVARztWPMlb4xvZrm?=
 =?us-ascii?Q?NEPkj0ilW4UOZc4yt1C5yex3mh62LOPzQvUdnFJT52/x3ji6uBmbrchiBXag?=
 =?us-ascii?Q?YA5+xXCf9/5j2qY8Dna+dd1nnQq9Ogjq0Cpv55LJk4n5Zru4olqdLKdmXTQQ?=
 =?us-ascii?Q?QONvnWYoqpR7lTm7CQO00/YrBr/qBxPh8wBlNbPEobBdGJLCXFoHQ15nG0eJ?=
 =?us-ascii?Q?qKZ3WvmXRRsB5Gc8us1kimDR0NDZ5Vza2fNcPEpsXFlo/5KW4eWPqRf2EzS6?=
 =?us-ascii?Q?6YCyW4pmQeu9kmIcuO4WUZtC0X+YSuF0XgqC36O0S815xbxLWXkyAYInZmh4?=
 =?us-ascii?Q?2IcQXvTaVf+1h9m2QZ6/l+dOYC48M78aCDZKuF5U6HkwUlFPLSMcWhD5m9p2?=
 =?us-ascii?Q?WRoRLGFo+H/JmjOhdTf27V5Y1ozlUhr8bVmpA0DyDlw6hz0qoe+m5KbUXhAu?=
 =?us-ascii?Q?d4k98Hrw995d+tdS/cyYwUPisG/8Y3VvHn8y3Z7smQpwltf0cCgGjufqtMos?=
 =?us-ascii?Q?33mY1LhElg/QJnXHBTzZT7kuy181YiLqDGhgPFGBn/DJoGYVSZSoVg3hTEeF?=
 =?us-ascii?Q?JNh2vXfLFC/DfA2o6hMjr2ooQ4JtKkbkkdQaxKj4EBkc7Y5BRA+Cu7jtEwon?=
 =?us-ascii?Q?Ha7zPEKqGVfJMh8Q8nzoEzdSgFbLb0Jluq++7Lz28Hvt18wPFQ9pQzFU62HF?=
 =?us-ascii?Q?gNkKZGsD5uav0PgbtI5765o8SsqdMlnax/3+XlW5sJ1CAtlWLfgHchLwW0oN?=
 =?us-ascii?Q?ZPNlsIxMpDj0NlOW2cBl6OoWbK5r39x45kAmZcPRbSyYaPQrlU0IBhTOQSzs?=
 =?us-ascii?Q?OisutRxkhmTJp2weOI24PzMTdyZ8qIOaRMhbuEcbg9XkbPs5eglOPYgltFfQ?=
 =?us-ascii?Q?cRoiiPRD0fs+6nN9fX0EUiHf18Od0fDZDUvQuIVjgbElVpLFh30KHh2rgoJa?=
 =?us-ascii?Q?EaAZWAS1T1uwtESvl4Zso1BASCazBDbD07zfKkS0Ey7h04CdwjNxQC+kTnOZ?=
 =?us-ascii?Q?7QhM+LItxg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: abfd0775-6841-431a-3669-08ded1ee4d47
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:16.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFhr9Fw7SqnJkpF7kZz3faLRvG1Oh4VnhSn6iHHTYLBgtWufEifU2YnNMRU0J7xlnnO0S6VUgpr3rDaGgE8L2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239498

Use patch -i to read the patch file directly instead of running
cat through a shell pipeline.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 290eb990f1..1ff57a9f8a 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -235,24 +235,24 @@ class PatchTree(PatchSet):
         self.patches.insert(i, patch)
=20
     def _applypatch(self, patch, force =3D False, reverse =3D False, run =
=3D True):
-        shellcmd =3D ["cat", patch['file'], "|", "patch", "--no-backup-if-=
mismatch", "-p", patch['strippath']]
+        cmd =3D ["patch", "--no-backup-if-mismatch", "-p", str(patch['stri=
ppath']), "-i", patch['file']]
         if reverse:
-            shellcmd.append('-R')
+            cmd.append('-R')
=20
         if not run:
-            return "sh" + "-c" + " ".join(shellcmd)
+            return cmd
=20
         if not force:
-            shellcmd.append('--dry-run')
+            cmd.append('--dry-run')
=20
         try:
-            output =3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            output =3D runcmd(cmd, self.dir)
=20
             if force:
                 return
=20
-            shellcmd.pop(len(shellcmd) - 1)
-            output =3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            cmd.pop(len(cmd) - 1)
+            output =3D runcmd(cmd, self.dir)
         except CmdError as err:
             raise bb.BBHandledException("Applying '%s' failed:\n%s" %
                                         (os.path.basename(patch['file']), =
err.output))

