Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2403ACDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6143.1782305064769723551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CKydfU1G;
 spf=pass (domain: est.tech, ip: 52.101.84.65, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCH5FMBa6HsYDEqQL7TbrfqCQEK6XyZD/Rwznstu0NMfUkRavAdGAmaD0ZRulkUQtZKy7eWWqm+bvkwX69TnSksg3uBuxPUD52SulfWilflbr6C22NHEDsg+t1ORDvksmzreyDOq814ERazfC8tiQXSwOQtTj3089PGwXUNtGuBa+Kn92c8aupctsT8Jzry7xaF5VatGtO6mx1L16qJhoMXkgSDFSQaGWQrKly51oOFibyXaFAFwfFvlZn9Gu8dl9QrVmKXvuc2WsJ/R1Yu+regZqFxyglp/ch7Mwk6MsAsZMwD5KtIRHo2gobp7PXzz7z07PMwlgb4do4gxWDmQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GFTOwDyBInlTXPQszvo4LHoOOXML5jEsVn7lyhaYl4=;
 b=s7vR7fvRrLue7bwd2TDLxnaCZ5+i/LLQst0hs41nJhhc0y9OLGAHJWARXpmzFO5uMb6EqTPxCsbbdZiUU1J9nifDTWCKEZeUVGgFoYP6CZZJ6EP9OK85ve9IWr2Glf3D89Y6cpYsNSVIPbEWLpFyptFiNZoTAFgdUOKH6L1utb56y8kQHpjePrKiw+icTnKh6H1+6kZufD/gwQZ+DdDNxsOsLOqETq6XZ8P+VIGj6JhYTqPR1xrT0sJLV2nNn+wqgtugeP+wvMKKipGL3/xlL8YbCHigcn/dVMqd4CWAho+dbIoArcILZY63x6+OQiFfpNZOPaSmMfGt2+aKfUydBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GFTOwDyBInlTXPQszvo4LHoOOXML5jEsVn7lyhaYl4=;
 b=CKydfU1GvGzj4fxQLe7LSPvbvUL13ZJ3ScOEvhjj5pvi3EzQVT2wYLpxSPuk0oHVLeYyqlL7E/cJTNn+xi4RSKdkTdXCvSay+8p3GZOzpNkR8lP12oIO4yIO/m0i/pDPbmcaC4jhJCKqjhwJX7MRE3JSBpleUQRxEa6Pp9Igh556nkbkd1H7BaL+1NVb7ybg8w1vTJRakv0iioZgqTb6yjJQOrmNWKXsX7nh+dah7ADBcIvDBI7dj05OnWwSij+crU+K70Q7XYd4spS+8EpHPAkNcGDk+EDUSNVdm4u7szEdST3kuxdLCzb8IlCaEdhsvrPbi3ujiXfv1Ls1IF5PPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI6PPF1CF26DBE8.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::18c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 12:44:21 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:21 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 8/9] oe/patch: return manual-resolution commands as argv lists
Date: Wed, 24 Jun 2026 14:44:06 +0200
Message-ID: <db1d7ba101566da29e56d6a5e4cadb172579c4c7.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0336.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::15) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI6PPF1CF26DBE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 3439f4b6-b25e-45d4-a6ac-08ded1ee5049
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: M0IeQvDxAyLGqmOGLURyCjaKlXU+igMgMWNnC6l2F+blGr2aouMj+jMkhyWyp/unslqpnCiaWKJ/I89IyGch5etkLJ7HLnf6XO6U2eYXzxaVl6qHc2oK1rymp7kInleX8VvYan2Y2C5fDmo1UuevaYilZCa0Aq/MBTxPQPzgYs8c3QZc8W4T3StcZwg5e7I42K7aWw0oQvEiXsHnbhlNQjKvcoMj9kz7QAT1BzbA3gJxZaxtTlZALeQC9nGS/YvK1hOlOv+3Wjoh4Ls4NJOjsaMbKpiuXZ4yUEEkL2FyOwTcgE3pqyD2oJiEzBmqKlbDGQKayMlhyWRj9JB8gLdnEvb89rXOzWqhcH6oHisBWF950hUcuC6zNB9Ruoc62dfhXabaaVZ/fe4bdIYZm3ztsXumijhen2wlZlwLtPyGJ4TyKo+qFLdTjlS1XqokRVl0/X5gvxeh1JSuqf2MiIOqPjsZxTNebLE/9E8SN2NrPhhuMgkhGwcb7IkukAfbglC/2wTFWh0nCKngyJAYYM23VtwY8MgSQZCoho6La5mGKeGkdC5O5eotwhl8aIyv67gXvS8usHhZ4Whwc8VoM9ESTXPKibQCFUz6IrBA38/iHAq7V6xEZKoW8ewmjRvor3ENVkk8wFWCORAeRNHlqgiXrqbnXdUbm+2x4uts99QoEhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EVe7m7HmNJgLodLIbVjppm2BXY61k2cYZ7VlTHGnLJmGzrcOJbwRwipXMcQy?=
 =?us-ascii?Q?QSolRkmDZPb7U0gn3UMKiVRNdrFuai7HEG9+hJljZU00cdbm8qVx8hUfFdIS?=
 =?us-ascii?Q?M5tYu+YT5ulzQsTf0QkIzBbyv0yf6W+29xUPYmw2qZQ5CKOJSEj5Y4GMrlWo?=
 =?us-ascii?Q?6GQbf75uQimGfvhInGm15wkPaAMdiHMFIQYI09nNjiSsZ+kCajg+marK3KVP?=
 =?us-ascii?Q?DdmfJJ3nARcOGCx6VOVOj4Txr4KdB5lrvfmjuhoI3FSPYK8QL28RApd5ELLZ?=
 =?us-ascii?Q?nmsy/g7YNBuKzrmyLPOmwP5udPUXo+FvVUQ4PC5tUZAHGSXV63TxOUt+rk6z?=
 =?us-ascii?Q?C4WJheFxKtPlbxnQ/UluITpTveVEjRDEpned0YSf33w+B2MDtqonE+J3BRqq?=
 =?us-ascii?Q?vBxCvj6/TYuS7tBf3wtXmFG0VcqZNIXEfXRRz79Q49e1YGnQMRIZ2xzdLwS+?=
 =?us-ascii?Q?juOOSgVkUedv2H8eBpqFpwaOZR/Uh0Wbq6I9OxIYy1HPrluMMkOVUl5iFGEe?=
 =?us-ascii?Q?dtzNw8V6L4xLesouJ3T4juGMKnZsL5b2+MQc4r8oWUIOgYU6F0WyCd7MnGxi?=
 =?us-ascii?Q?z/G5WN6BhCo59AFgs8/mOaM+j8EQ1D8rJHAtSX/VnCH/LJ17CF0VGNYu/907?=
 =?us-ascii?Q?0PaEbw1Q6Y0MeLYLkMye5XIpTGLaZkgw9GU2T0zcO31prDgf2Vw1jZUUhySZ?=
 =?us-ascii?Q?m7X0QYSo8i4UQpQp7RH5eCIOt0ChcqJ0wKkfjO5FfGAxuZh/P0fSvPrC4L+5?=
 =?us-ascii?Q?eR/SoTrVjPlro4JbdVxo12Q69FJxEjE667PKkg4TB2jV9zwLaWIuZzpYxkzH?=
 =?us-ascii?Q?8sQHJXyX3mh94Tmh6NizQKbbI+a9gs7hIy/Let1UgF6/ojO7DA6WAlr4slV5?=
 =?us-ascii?Q?r8cD4C46pPi43Jnbhs+R7fCbtb3pMWzb/253msbP7Xuv4pKyl2xAwER1UXjE?=
 =?us-ascii?Q?31hxt/JQb8K+YM9d382pWoxuDaAQcdqJC+kVfe5hCxBTysgt3FPMcTi8BuLj?=
 =?us-ascii?Q?AASOVzI+k0Vfxm/mCR9TlDvpj1kYxsqjZ3Os7eegkbwiYFZKSPcYEn9YqAN2?=
 =?us-ascii?Q?MVvTx0F8/MNGvWWENTqG4mGvPLoBqxwgbJw/Ob6nGISaUX/08fI7wBMWvVOP?=
 =?us-ascii?Q?+6nxG3oUMN8GSB663/3S8Zdv8BzfWVs0X/wLaWt1Ervi4OPuwdb5J4KhFftA?=
 =?us-ascii?Q?97aIFeC/7vuM8el7lzbcn1LKJpsiUHWDSvM6iP/lbOi+IVot3V7WJu+sURs6?=
 =?us-ascii?Q?dUoktLRikbdnB28trkIzD5H9cdmXUcCfomPoBdCcagyZerZLTWPpQYOgQESX?=
 =?us-ascii?Q?SeYA0sK+UZALi6TrQSNltW/5GmBBzHw9AoWXCkODCEX2kTrb1ZKQhKcV0J0X?=
 =?us-ascii?Q?EZz1ev0F1qeN5yxGku8YS9lz+PA9ssAkLssC+u5Cp5IAZXVhf+nQUAY6hN7h?=
 =?us-ascii?Q?Tq7naiZu3ufVe9d147K7EgcVqAo7NIwsJD3lZ8jd5OxjovyGlrBy97hoV+AR?=
 =?us-ascii?Q?szgMjv5OW9ZAJ2YNfRlyBDnh9UoNDZg7elYGV7GI9ZJeUhg0uplXmtoUoOxY?=
 =?us-ascii?Q?5h6x0H2t4xkyUHzr7+KlqsyLke1YGUWg8E46hR9S94vTwYoWhsC1AnKD6WRH?=
 =?us-ascii?Q?KkG4zZhkvJgcxyssKwp0w7CkolSrv/ViXZXXzblGKFQNeM4DpTr8srk3F3N5?=
 =?us-ascii?Q?KZEDTLmBwQ3KBCNyrp2kFt431usPWNMSxHFD5C9LDSIZDvgBY2UZW2TunhqD?=
 =?us-ascii?Q?mmfHqVW0zw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3439f4b6-b25e-45d4-a6ac-08ded1ee5049
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:21.3342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OcrZuBFxnFySJ26SWcuBElSKrV+gUMMd4RTXlAQWwSY0o8izd1socDlrTp4nSXPkmbI8WrgElGExCuYPFv0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF1CF26DBE8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239500

PatchTree and GitApplyTree now generate patch commands as argv lists
when run=3DFalse.

Pass run through when pushing one patch and return the command without
advancing the current patch state. Use shlex.join() when writing the
command to the manual resolver's shell startup file.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index c76b78fcac..1d50e83ab7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -277,7 +277,10 @@ class PatchTree(PatchSet):
                 next =3D 0
=20
             bb.note("applying patch %s" % self.patches[next])
-            ret =3D self._applypatch(self.patches[next], force)
+            ret =3D self._applypatch(self.patches[next], force, run=3Drun)
+
+            if not run:
+                return ret
=20
             self._current =3D next
             return ret
@@ -868,7 +871,7 @@ class UserResolver(Resolver):
                 f.write("echo 'Dropping to a shell, so patch rejects can b=
e fixed manually.'\n")
                 f.write("echo 'Run \"quilt refresh\" when patch is correct=
ed, press CTRL+D to exit.'\n")
                 f.write("echo ''\n")
-                f.write(" ".join(patchcmd) + "\n")
+                f.write(shlex.join(patchcmd) + "\n")
             os.chmod(rcfile, 0o775)
=20
             self.terminal("bash --rcfile " + rcfile, 'Patch Rejects: Pleas=
e fix patch rejects manually', self.patchset.d)

