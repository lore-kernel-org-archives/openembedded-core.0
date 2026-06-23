Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E44CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20964.1782221738840881784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=L11VX8B5;
 spf=pass (domain: est.tech, ip: 40.107.162.56, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCm8jiAtIX0jm71mVgbaAvCrCIXSXPDlM25MgtDWYdjltpukXZQ5+vH+99MkWjuU2KIIsK1WUJom4db6oZmLlvsTHVUcqqyakpBvAYwEebZB74FJS9ic/FtF6xp+t7RrusdkTG5MzDYgnMDo8DBrT1ozjQPoHLKvKIJ8Y9wLIjVYQnEgDTdQIEcQPbxT04fcHL8fdLEHfKbA4nPe3gw7lVxzTKNa8kY1Hei3KjD/cYw3rmUsxLPvqNbEtdZ4rdug/epmvfzZVbDA8FIvnGPvrp1Gi+rRP1mNOgfE98wx6g92OTauN1q/HlYha9HKICNnJac9rfXDPdXEm0xv4DLqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GFTOwDyBInlTXPQszvo4LHoOOXML5jEsVn7lyhaYl4=;
 b=YgKDqTj2THj7YjohTpzdYQy/od9xgunodQW83f/RspaB+mHAONBlhaQwcv1uoEIVYN5ZuGsBHiaAp+teSiVZL4qoR/ZRiM10phJvA1wsWuGWGW4HQ9GqIBkfcBj9F9aBP2SzRFzR2JeWIXH8jg61luR/Lyw0hu9jjBAYdQG+X4w+nrT422glilUAeULNia8G7BSB/UUhUaQRfYEsW90S6tn3f2hXppx3S26nAtYfxngDk0wG8BSteR98C+TA9kPeoMphgex7Jpu9Ona7tiyFUxTg0GUI0gWEunfi3jMfioKnlDFR7tj40RjcPBwrl/vr45ATNPUnBDt0S1BWpHE/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GFTOwDyBInlTXPQszvo4LHoOOXML5jEsVn7lyhaYl4=;
 b=L11VX8B5ok06Sh3e9WaD6Dy0BpEfkpBblHctV+OMjADr7vMqmENwIBNbmCU6+NlZNf2uq/EUAcHR7iLmZcEEH8epDvhD4R+PX4asLH7cBFd4CUQRE1S1jSsqzVwdOQ76sKeVNaw/T/ejAX3lcJ8e3FIMQ3x/mEDq7VLFKIc5hX5m8A+L2YiegrXU/vYuxzIbWwQWtXKAcm36qDpN9eITw3oSCukWhF8uazQQIv3UNnv65hvFQqG0MSJqgdnbI8VJ5uPx7zfkg55tgfVrolTgP0xmOZdOSkZRK/9XupsqV/m6AVql6s4hZgBc+YinZN2t1PDBc1UWCGvN7lkppSgjsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.19; Tue, 23 Jun 2026 13:35:36 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:36 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 8/9] oe/patch: return manual-resolution commands as argv lists
Date: Tue, 23 Jun 2026 15:35:20 +0200
Message-ID: <20260623133521.17053-9-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0255.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::27) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3639:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aafbc96-34f2-4f4f-80d5-08ded12c4f07
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: gdtQBUFDh/Qffah3NYfjwkvaxxnQUzH27I10IZSpxXb4NmTxj+ilesRXqXqXeFA2FhnBSToedfReBmaivBTSca8uqMfUeSa+3/ifssj7dbpUHXsTd4sHJ8GRQKm3niV8/evfeO6BtA75SZuVDIX2Dtl2xSFBVhR3vc2/oChamg9FAyHPuLQAQZwyCBU18l/2uDMjX+jZ9n+dQrOuGlPVMMWfuW4OlFgYbs9w14G45+jWYche4hUwMyeJsWY5flUku7yARZHG8+8uIpIqNxTsk6VHEnpK26YcKZYOhZLBmXKIgZDAzUurlFu7zOPzRqkxW24m2w3UiT7pBXXtdWvl6hxrezRAGJeDYE/B+gzmt42ebWTDP9JprEKdbOfpeL7ip6HypvhdTCc1IH2O0oiTiiVbKWZfBI8rmAxkDn4hIvX6StTJiT7m1kUBQIyEj/L4KsRjl82uvcc5dy6Emi2Mrua4R0MJBaFxaiz417NUd/ruPHYkNexICU1lPuTKlTOwpE5/gBDiV06dMemjnC3ynKlB2eTqaV1NiPrBT1tMlXjfdbks9G5T5YgSsMdzEf9KIgGj+tIuUiyh1+uXYlpxbQ+MvlqiH0koQ8Om2qxIqSE0N3DoEWTiOn1KfJDrz5OSWZ4OsaemRJo9rQ1ImGPH+B0JCGLpr+2y6d5sAqrcy38=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+cSyluv5qaX6jtH5CHQpc2hAXPTHp3+hvRu5HFKvctyC3zYNrQqXVdc1t4Bi?=
 =?us-ascii?Q?EkmZ/GvdaKtqCgjA+FqEchsq90LJ/sQIIAC4aTtbRbDutBvmavNIyKWIZDH9?=
 =?us-ascii?Q?Nwsg0jgwoL78qmUOnP+yOKirKlk55sNH7AhtDso7R95DlDAmC/asR3u4Rrun?=
 =?us-ascii?Q?4Mk6iMpnKkOSSo21fVVh5/Rr5fcnJOZv6+dsj0ixFbSpb4BmoB3R1Xih3dUB?=
 =?us-ascii?Q?RDf5TOKD3Gr6cJVdMTjII6sINSteqU2CkvL4hs18ZP3h1DGpZSf6ZhW5nldu?=
 =?us-ascii?Q?froupKtZKo7DRz1Fr0WPVt1ptwQy+frMFrdj/v1PTQxiimunOR/diI5mRCmm?=
 =?us-ascii?Q?qRrbeFSzFTsVyNNyq6qF3eR598ajqJI5qp3/SoMGV4DhDhYvGTkBwN8BbnGJ?=
 =?us-ascii?Q?RRyRGqHqdAcg1UJWlEn2YvNAJqanjpTcux3UarhfBoQJI18QYPniAEESs4v8?=
 =?us-ascii?Q?lkJ4DlmzxgUdFVf/NquAifzw1K0TsH3/v3Djz/NL0kAcDDdfk61pC40arGAy?=
 =?us-ascii?Q?KeM/5FuV5YDefaUHgPDtqcoAYBrz7D4JXZFW+oZcUIg1oO4Mj5/wXi3cQZfx?=
 =?us-ascii?Q?fjO5wYUSF6tLwlbSMimJxPcKJDpQon9hZ++07bhWQgPO3uMpr92pkNtBEAh6?=
 =?us-ascii?Q?ed9/ifPKF0Rpx8/CEWwbJnVPy4fl83M8TnxFccMc45W4ZrVuyAiyNFE/1Qld?=
 =?us-ascii?Q?xzwwhgzJuOlvuTP8csuzMJwa/I+lSVXaQiFGvGRvPrEDdQQmCFK7K1QuMpsk?=
 =?us-ascii?Q?+R9blrhgDDtKBVa9GmoaFyBLac6bW37OPqXIJToSBXHUcr7TugRLwoQjaaUs?=
 =?us-ascii?Q?LZXKiNF5D9I9YcIvpK7IVBkQY3rltzmZvRWvS8OdLPPIaXn4HugEfeWwDvvV?=
 =?us-ascii?Q?eykpJx/bvZmvYtqKRA5ayO2ywwEapZPeCDVzEDdF3l5IipXPwr/ud7S5Wv/G?=
 =?us-ascii?Q?NocQaMOQrNeD0Mql/5r2+sbOHRDchiN9L2KVnHlCeIWhWOnYGgUiJnHg8yMb?=
 =?us-ascii?Q?td9aDExvrIYWl6OAt6qA4F3bzGCoadh98v8UP+X8M/vDpP/F8FKnAKbp/Yl5?=
 =?us-ascii?Q?dFQoJESIqtVxIMZtd06elMHSFl6ASvWOsjz8+Y7tdf9VtEJCtLULZin2q0v0?=
 =?us-ascii?Q?ArBLxjZCcUly4/hAumT1TqVc7U1akXMybT4VFTGVxb4s3Pz7SQ0CTdqQ1pFz?=
 =?us-ascii?Q?rosF1eYQIcw0b0a7RIDs+gaCuGdBW/E2rpmiBBw4YudLc6WzWzmfbU6jFZPo?=
 =?us-ascii?Q?KL2VhB0uxTeL52+WXr928DiRGR66KuSpCYjrR8aQVbFf/cqGzCLqtTH4tH1s?=
 =?us-ascii?Q?96PJl66IOMjaoMrR8MsjgV2pGUO2NB7eYRF5KqVWQui7QM96D7Rf+AKAHKav?=
 =?us-ascii?Q?79q3bf5cqLFt5NK/JGhEeG0JfcQSQe6o3q/mPrQKQxN0ymzk2+F9m7iyg393?=
 =?us-ascii?Q?dnpZOK4+OhwKPJyB3uqpcRtl/RFubJVVfW6fsWik+VjIPigndysvi9IEyStY?=
 =?us-ascii?Q?SFCDAPuJ0v5HAPAPKhmFkdAdJO0jl3HDKgK6SsvmQhObKg3gJtX0ESX0qakL?=
 =?us-ascii?Q?JQR5zYjCWRFO2uFaFRGACNPPMdu8pix2GZFSNoS8VHW3vUDSql8gNXxLiv6x?=
 =?us-ascii?Q?vuPjjBP2h+MH+++vgWN8gxgxV7vit3YTKY/10M5ymMnlel9edUM3CH4+7Qcj?=
 =?us-ascii?Q?SVJdXFuXtXSqQVDLjAIn+DM8xo5wSLwcgcG+IoXTiSw7mVSiJXK0HrXTpqRM?=
 =?us-ascii?Q?SEpIeAlzgg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aafbc96-34f2-4f4f-80d5-08ded12c4f07
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:36.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxPRwyjb9CfnoWQHR68LCjJgHn6SToeGfw2o/tcgV2UuC82PeE8WntDIYAd03YTqeb3GS+o0VF/M9n3zaqIbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239401

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

