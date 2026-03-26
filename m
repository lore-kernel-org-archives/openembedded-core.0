Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F8C106F2EA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:57:50 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42472.1774511684955004136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 00:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=nZcj+4p4;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.43, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbZYr3ENEzhs1WNNIaN9WSH5FP6QQ6lJLZPi0ZyiXTNeLjjDN4IlAM/ZEeQIUKce6q4kGQR6Cs22JbKw39ze25W8TEgrZyM/S7MqxzDLTxZ3+NJsQHVUOoOQeRvBlLuC4V8UfYcQ9k/IcgzElWau8MvdIdElk6wwbMrIsnw0cKEqz2KWoj1nFYpDQn77pWHt1GC0Y7A9CIWMFlVubDBG140IsLxI4TYJmaFiSCI+PXaEsfjHhafwoPZu4IxdMzpU6XeVvY0qyj43qz5rIGml1NQeuCILHSUGZKsBd5qlBJfoMT12KAqUWWEaFlUwUWcYf2ecFyadCEkr2VfkZ5HI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d11z/doRooBn/vhUVwd19xj/YtkIasCeV1rxVH87zzQ=;
 b=sfGfZI812lWZqxWpf5yzTuNNIvka9XqSmQz54/aoZ3H6W/5u+xPSu4YGoWtgGN9d7tk7QKFOIDaAsMw0vaT2HMAKmm6ZVM3VJBztvIXVVLprrfJLfWrBnf6uJjLVjMlag4MVio63d1uU0vcnfqNW6Mh7rLD3PsIFcJGdKnAj4QUZVjE55njf1Vks4o/HdC8gTvWUU2p5qD/FCe07gxIOIQ1SqyBW6Ve6dRk0Y5pYH2QuZ8CiCdfDqIbWKJiXOGwHQsjSVwF5gw6zqIBGoO8NeHD6P0pc4UecjgM6NkATFgUc/t+8YtEuXExgXhZCEMF6cUo35RlXjP1W55rctULwxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d11z/doRooBn/vhUVwd19xj/YtkIasCeV1rxVH87zzQ=;
 b=nZcj+4p4mJfHIpDKmdEtNjAguU30fo3itx976caMlOQwz4tnH2L+U9DKvyfoPOE7JSXfDPvR7mCX0ynGMyuqmBj7f8nMhMvX11nlD3Lcn/WDXjGx85+mrL0xd7nZsmjfEjVAFr3rTgtJnt/Mfuroy6lDY+grLZe9A2BVJdEYYhOoEOt0/J9s6kWedH3aInzeHUtGGnjHhlrrPElKpnP+w4aL/hKVc4tN7IvZs3Gy7r07s2r++fV3mC25r6Lm6L+KDFJq+ATkMZsWVPjwUTikr8Mj4+5lAPdR+bxCIBQYHrwZUHDllhS89Gou5ZBl7YjrD3rdrqMJmifHNnAwqwsX/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PNXP287MB4084.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 07:39:16 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 07:39:16 +0000
From: Suresh H A <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: sureshha <suresh.ha@bti.bmwgroup.com>,
	sureshha <suresh.ha@bmwtechworks.in>
Subject: [OE-core][scarthgap][PATCH] systemd: backport patch to fix journal-file issue
Date: Thu, 26 Mar 2026 13:08:55 +0530
Message-ID: <20260326073855.2075702-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN4P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::8) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PNXP287MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 947bff6a-eee7-4cfe-091c-08de8b0ac83f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|55112099003|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	v2WxHH170+C4WykcKKyE09uKLXVetvAOjqE5E9wuUyUloInChiSjXITxwRLGHYaRyPOW0u0VjWPMuZA4zyM0n5g/o8cvMO4NAKfnE976gNh4ldTZGcudlC4F2OXffD0vfikfoZrkzcT3Hau7q7BjGYafo+uWyH00EmqzB0DM7KxxFhr3ohB8VdtdyuC0Q8jj08RmrfctvgAdTn91hx+hfLUYfuSrOlO2W+Q+5fReLxVW+bDPSCKvqpqixUO7II2OI7Ej2MuZJRYiL9T6HfdMGQg0qKg9bq5obhCQrCrHJSfDtUBWBoulE6LYN7X9we/tiG0Qwso/XAi38ZQ4uqNu73DAZW4vZgV/8PFWCo3U9c/JTNg54FnaBWi3aIXdBR4L/7z8HcHsLuW9CNPsu9hayY/g7eaM/T2CBOfGA5Zx6sknqhERl3mgLTHr0yh+CBvZZMrHYLlGMnZjpRf9DOSjCCMCmdvaOSAnjjaJEz3NMq4jiXNl13nGl2DjaEb04HJuVHf8Q5Xl5YQdHdoRYb/nIMEXgvgd28SOedmD+1uB6K9PHGNpYuqHHxGFgKwWqzumgyDDDdTiwEaTflxgZZ7sacZSkzYbhrEJ47mvr3nEmLHnCHVkocR24Lowh2cdR2JwslaW/i2tMqjtDkVmNORmDjoNudOcSwaOHeZ5rW9RP6vIaqh/XL7Yapr+2pjegxfmkzi8Arg3DXKwfg2zk8EOnILF8blsSv+B4UFcBmFrPWE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(55112099003)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OU/cleDWhT6hNIUlDNZF1Onc/51SziTxaR6eFJLCMpqeCsupz1aF9UK0Qcor?=
 =?us-ascii?Q?9H+VKm3gyAAiwpMEwKV7JFQ7cLIW/S7HQzoizlyJ5l2JJvMPvU8kJZtODduS?=
 =?us-ascii?Q?0dbnwIHj2K3DCqAJEYeeeXkzR3We/M7BOzTXVltsLvZ+9PBvIzAjdXdZv6TY?=
 =?us-ascii?Q?d7eEAn0763zYYUPQ90/XqpC6fcYqPEZNoN2c50knvCK7D0+aGbQUsElwpokv?=
 =?us-ascii?Q?bim/N0DzUY/njHzXnxfNiX6nT6yevSYz5KUa+ErH+ooA5OmW3oeeakB7ZHBz?=
 =?us-ascii?Q?qEjZxc+y1L1oN5VuRuZnHSrvSv6oMZDRrGBI+7bUXNNeXeIoXu+zmMEiBcgg?=
 =?us-ascii?Q?xt5RE/crO2CCzV3/Zd3Fw9/l0I3smc+DYnfj3oJN32Ux0F9N8OQjN/rurkm5?=
 =?us-ascii?Q?ZI+LWKIfbRvY0OVF9CloDKAwUZZJKMgvx2bFf8lMawd3MQVbICE53/c5Wk2c?=
 =?us-ascii?Q?jL9qTF8EF64eUtBogD8T/G97Xo25Is47FH8QBGiaSzDsTTt4xR/R3SEGyjMf?=
 =?us-ascii?Q?NDgSgIIOMc+Y5ytwyu7bnNz7jmx+t/2c6klDglyFqmUpT7cGiGyYo9NM9qBo?=
 =?us-ascii?Q?SaacmRebFtbnWJ383xATfvCUpxg56ATQWYVf60+42Xwt0xcG3Ec0zy2CSAAq?=
 =?us-ascii?Q?SaOw0tPE3HF6qKWcCCygHR+D6wXCYMGP5HcpB0NEbe9f7CzaSH83KjM80kTC?=
 =?us-ascii?Q?TVQBDneTWLpwOjuvyrEVa04Lg8v0GruzSLbAjUwsI4XM1k7K07NILuPXbrks?=
 =?us-ascii?Q?YT7bn5hGpX6NrW4pGTE7W9kK/IWdlXV79LG5KYzDKKD56C6G0UsO/Q2k8DyW?=
 =?us-ascii?Q?Ja5l2knCotpyQwGS9NK3DSASthK27edRbPeIvoKAofx2IKcibbFDAuaG1LFM?=
 =?us-ascii?Q?rrSdftJgmXrnz4NVsrnKyyAyY5kfxU0DZ4ENVbHvHIWykC5Rgi3V8jzcVAzE?=
 =?us-ascii?Q?GOR5MkoQjbcFVmUlASIa26kIpT73AMcotPExHfjELvWNzr3t/EXoitVibOvR?=
 =?us-ascii?Q?4f2J4nxzqjwOQm7qKV2ezC8JFceLz8rfnMOgeMlVE0JJbspJ1/qOyte2VXaz?=
 =?us-ascii?Q?sUD79qtjyuhpoSgc+mtZdPDqdBxErGjdsVdhGj6y5IjKDbKTQcgloZq28t3/?=
 =?us-ascii?Q?B9LeWkxo6+ke8ej4qo/gPpcA7LqYOaZtHwK2hexQUZdxGS6tDd6zkGuoWpve?=
 =?us-ascii?Q?iwG9FXnzFo/YyJ2eoAz2L3EOl6Nt56jS9PO7YzEKNTICPE2ELCuzNf99fjXD?=
 =?us-ascii?Q?3mQOSFuY3iR1BEgwHVM8n76i/n2qWLLRmi/NgwPcv2SFbBpJGqniNTIl6Njy?=
 =?us-ascii?Q?MIbiMGdhRTCS9hXmPKSYC+MXEzZYPAe6pE09rCSEzdp+CDDXOuyMsJevASdu?=
 =?us-ascii?Q?Bf1ZxnSqBNzvlc3RlGtt4DyiX6PHKAdKW3adABX1rdljTF0PtdKIX8gNa5OU?=
 =?us-ascii?Q?05wmvTr7IfStVL00cL2dIlvil+Ew6/ki6SWexLMOxhLjrwTGaMj4hSJLa7h+?=
 =?us-ascii?Q?GZLOFOLrutWS9cN5q2P2g7RZrCMZyWZRQpR7NRzR3rxBpOPKX63VqXyle2IK?=
 =?us-ascii?Q?j0hpcdcERnoVSwn4sCU29K8ALgeh204K9le7DuOp4FHBn05ESzTdu6/fghuS?=
 =?us-ascii?Q?o7hxlqnIfSZxOCrCzUKxNI98ejEXG4tf8QzCG3jYK4HSeOypq6K+MatGzKng?=
 =?us-ascii?Q?EUgneASkkSI+/MUxAke+Sj1f68G0VoHQrPxE+JpqWsYckwW3mT7vmelEWuLs?=
 =?us-ascii?Q?6Dboj2Dbqg=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 947bff6a-eee7-4cfe-091c-08de8b0ac83f
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:39:16.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP0Os35gI7mVz1OZTEjyds9YsxTj1scvKDbW3ecb1G8OG1XX5GsrkMEVmK11D3pG5ZYW/FAe2upj4v1vq7LAA9gyt6DHiGPUn63Z5k2wEPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4084
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233955

From: sureshha <suresh.ha@bti.bmwgroup.com>

Backport patch to fix systemd journal-file assertion on removed or corrupte=
d files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-=
not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-tri=
gger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/002=
3-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..5f5551870a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-as=
sertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/2185c=
30de333b09f46ef28b743b123f45e774738]
+
+Comment: Patch is refreshed as per codebase of v255
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index 08f3b82..633de5b 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -3305,7 +3305,9 @@ use_extra:
+
+ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle=
) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <=3D 0)
++                return -EBADMSG;
+
+         if (p =3D=3D needle)
+                 return TEST_FOUND;
+@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint64=
_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, uint=
64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, uin=
t64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 87e186bbfa..504d6cbef6 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -29,6 +29,7 @@ SRC_URI +=3D " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetN=
T.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-journal-file-do-not-trigger-assertion-on-removed-or=
-.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


