Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA9CC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 08:36:55 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7675.1788338033463710210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=kVJoAFPP;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.53, mailfrom: upstream_ip-sh@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYBQhXOXUtEv/l7F1SYKeGzzKT77yfy0ya3HZY4oaXimBofri9uqUS1Kt90waOwhy3mLruoHI5CvV0qJxzAR9UpQuS03vsUo+YjL41ydOH5z9fet4wxR2r1iW0k/tPEtcSf0jOdL+tOE3Yel3UORiqmIMlQYLdOO+72/HlbR+WvMlyp8Y4TfRTDdKW/r4OKqWOOakrZ4WlMw/xfyqhfSoo5Q+aCcOwpIczXKIbpJ9bq8gmt8dkL7odN26BsmW2yK09cG7HmdjgZxnAGyDNy87D2oz3iCt7u52ZMD8Y2/PnRJG6xwV5XXorYLfpEx2ggODoXTk9eIIqknRmlhoDORWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4z9NzszvF1KBSSPpt3/NRw2Lwr4wpov+xpQD4dqeyw=;
 b=MepBvVXEjBewn8ReAHN4rqi5wrr9vqJLXoCFcQGK550yTKbw6zc1Dcjh47KcY6R1icF1ZtEzrVgCPWDTWfM1Y6qmH44bt4W6xk093KbE96od/QsxfiiN9iHJgT5MeD0Udbq7g8/ovuk1kOgLep++ciitHziU/cn3wRvj4G3bh+nHIZQk3mcM5hntBx0z9ycWXGkLM7nENYUw4Nus0pvZSqXV+cXLMC2DdHejQots8gThxGECynWUhVxOaSOoWkUr+vmuPisernVDGNtfJsbMt7oJVl2xlzZ6daYRtfuuwajSkJ8uZExyDGn3yOLMk5WFMy0iV8rdcUARLvZV8qsJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4z9NzszvF1KBSSPpt3/NRw2Lwr4wpov+xpQD4dqeyw=;
 b=kVJoAFPP+JYAlL64GUg981caOo082VXV/TUTLmptxeMJ9bL3L9RdM28QD4ShdMLjgTlmThIlQKvSJUidHHU23M8vkXeQdGr7r8857MlTQ+kdalwOFhAHp8ELC1LBUpko5NtJWAq7nxZwKEGcP0OPqslhRviMr8Y2dx5kFZSqsN6g/HVxYDJPoRiWus8sv2XmtlKwQ4e2HcQmf9J5WYC+TItUi6oXzaIb1dONhqxEKrCDjso+rqa5kZYYNRN2CizAkHkAD+BCQ+CSA577uM5ZVPj03K7nEhaOO/COX3GGjUqYKraYWaUr9Km7ad+Pkuamh/WoGuv1HFNiFaH6goJTlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a3::20)
 by PN0P287MB0932.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 08:17:42 +0000
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14]) by MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14%4]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 08:17:42 +0000
From: Suresh H A <UpStream_IP-SH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	suresh.ha@bmwtechworks.in
CC: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH] systemd: replace a bunch of assert() with friendlier checks
Date: Wed,  2 Sep 2026 13:47:33 +0530
Message-ID: <20260902081733.3136152-1-UpStream_IP-SH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::7) To MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1a3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUP287MB4780:EE_|PN0P287MB0932:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c8000-e3ce-4ebe-05e3-08df08caa937
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|11063799006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	z3MQNvkcw7R/2Og0KTU70G8bkkjoK1j8wzVi6cvahzBK8/Z/p5FYLo8Q1NaHlKs3w0dknC0ALDQocegmUiGhcfh8ObUq+OtePPjw/ATnCY4MyQJfKi44qXqhzoSJRt3Bq+MQYvDdTD7I0jecX/Gxbm2MuOVwnFsT4UqcrOukpL8tHXPw5XymlTb8C2/5RDBOza9yg/fJ4fe+EyZcf+LBURvlBk/AkJYqMev4ACQTdUD9b/IEcWQkuCijotfmvdz0KvDLKQbBLv4ergnIsjDQeobTylf8LRsnWiT5sM3rWK6Xx9hfQFUHsoBBiI6W6wAO6csrT9brwqAzKof0+6/95nRncrScPL6y4f/IhmCs5pPxN1VnUxaKiBtQ/Cgvx51lEOPr0hEnEUgQfhu78+bZMZuBaJZLNrlyY/x9Y50tXwKT3cgkITdbjzTgJfWBqpGN3CyYk8Uyol43EcqAP+i3rfea8nib3xAgy4Gw039HPCw6z4szjxvaItEfm5LZAR218OWkO0wyMqXLiRMthawJegpoa3ABUBT2BN9A22UH+L1EVEilxbXN02tKT6sn0Ij+g1sKMYSxD/IU2sspRhg7iMUHBmpG2tEykAOs/iA4TN23cwOwSt88RGHQ6AG7LHrXXqVTykltxt3/C39Uzt/wKMo3dsC432L/0qu6wBZstXU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAUP287MB4780.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WIiiNtziWjL5DIUpWbBYlPU4rxE8HvgrU7JZGmbXGQxtft8z2Hrbhm2/VoiQ?=
 =?us-ascii?Q?Sv6W+R0tcTaQW/Re3EuQiFMiR5BpmwF2nN7IjFjT1ygtXESUjKkVSq6zUHSG?=
 =?us-ascii?Q?1sJ1pi8/N8n2Kf8v03rb0u6q/MxZsqpNJ7uv2JwgwtxiqpsFlUXFs0pKl3PX?=
 =?us-ascii?Q?tAipIeNkAiz7ydyXmwfs8F88fTIumjTHsNvlGE0oVyt6lhc6eF1ZARXRTUzV?=
 =?us-ascii?Q?60qVH7gMXjWo281wp9Ik3vKYPMAlN5FAdu0v2ezkVYWBg7KN9PCARdtnZr12?=
 =?us-ascii?Q?qLwz+fSuJAFY55gglUx8f72py6dZ/NtvUNHnuhgOsQHOKdOlmeDRj6iJOXo9?=
 =?us-ascii?Q?fFIKkB4K2TxEPJmlrIQe0j2xb1DUfZGpD/ttKqI3s+YhJXWtcU/wyGbQR9Ou?=
 =?us-ascii?Q?EtRUu6V93vOyMUlTfljFnPA6mKkbTmoRW5cVeT96rq/W9yHGUUDINJU37Q+L?=
 =?us-ascii?Q?MGVI0F0WaB09hYknbjZnXotJ410d1OtYjLi7+xGELUbsbP+VD7PkgimcjFbx?=
 =?us-ascii?Q?pVzUikUagjNXzbA7WGw/65k5ZuV4lVrYUzd1mLTc7hD+AzpO1m1c1BWOIg3V?=
 =?us-ascii?Q?Q1cw5kY/5wN4TF5dcECpIn6L9aEcHvAxtKpVvhxvsgLBJO6turkbJdCMLzXi?=
 =?us-ascii?Q?BkDlmfbezodqwp5MkMesfEC6YHP5PbxDnmp4oc1BP0ysaL9+gdKjF7U6K7qk?=
 =?us-ascii?Q?I8THR0u9ob3pz2gLmuD5gtkQBhuBAVyPrjhOO0bcXJbLM5D/Cik6HxNL6XPV?=
 =?us-ascii?Q?/YarV64qXQ/wAbk0OUsx1SCChjzv7sFH4TUUQY0VgBvUJXcoLZPG1j/g0pKk?=
 =?us-ascii?Q?qhlbX6nDQbG+jYPHkO2Nn5pHGLAcj0cm7yCLPj2k0L1ONlmUtT6aD0idOd+f?=
 =?us-ascii?Q?TIh+eF490VW7aQR4D6o9svdI5oc7sz/cUbxLh5xJ1urWhchc9urjrItigKed?=
 =?us-ascii?Q?JR0O3Xsm78LQ6AGOZJk0asTIb3LoHbGn/v3scbORVgvcm7h/7YKcm2OpvVOT?=
 =?us-ascii?Q?8QAsF2RzD6BUmlSxYcSp1NS5pu7e3Z7M6Pde7K1z8n8jD7kn6YpiAmaY4drD?=
 =?us-ascii?Q?k5hoxydDQe1cyzsodu43CtUXvC6mN4bE6xxJsgibrKYcQOtZAiMay4rDTNsp?=
 =?us-ascii?Q?5eddGA88MQyqABF55x8u1b4mBZNRImbVkhI2gZZsEFDrGWDR65ef5WxVH2bb?=
 =?us-ascii?Q?E7118dKEd139i+/PigECHuBOxJPON6FAUXTywC9nWS0XUvgfWFUumBv+H2cH?=
 =?us-ascii?Q?s2cHFc1eLWzMm1T2RbdX/zOyEniItg3b+79uRTJ8jhYuqorIznqLKsEIFNDC?=
 =?us-ascii?Q?smxizEHYn+esASj094Qb7ogwS5pkw3J5scaanJ/2SRnCgaju9cNgVOPncTAZ?=
 =?us-ascii?Q?p3hMTgPVLWphKLuV1o3lxZPlnoMHb3Ah/mdehHIESuzAiI63o9FstQNcfQTy?=
 =?us-ascii?Q?p9/oUP8mhGG4aiOoD77LI2qwhnWt542VQYKqiizlzwoyURQQ9+nxSg8LP3D/?=
 =?us-ascii?Q?ox3Vlo9ZiKpdIFdx8adeQA3yil2Pjm9CIpfEmhZ0Qcbm3DuexwD/3ME+tUI3?=
 =?us-ascii?Q?8Iva1Gj3c+jpeABQN00o/nUNbpiZstdvCBRVtCQeZYoYi8Z9Lpp2XHCGlBN9?=
 =?us-ascii?Q?/eneLwYUVbNpweZQ4RXISNbRNyGRs8vFeAOo92W2sgz8ZodqRfY5hQXo8V6J?=
 =?us-ascii?Q?iBZtB2GOTTsAoDNUBtaIowPCOrSF8qhAfF/nzEBZ3+6iYENDfoMrgJOEaTgn?=
 =?us-ascii?Q?lGCg+ZOmsqJfm2oUXIQqS54PMBzbxdw=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c8000-e3ce-4ebe-05e3-08df08caa937
X-MS-Exchange-CrossTenant-AuthSource: MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:17:42.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrWeejF/1muoqF84aKNZre69LorGsy70FF3UYs2RZmbV7gKUTHJlKZPvUfAIk9T3lwU3dZv3HT2wm36vIHIr05VMBZV7Zwfxl4CHTaOcD2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0932
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244902

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a patch that replaces a bunch of assert() with friendlier checks
Fix is already available since systemd v258-rc1.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
---
 ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replace-=
a-bunch-of-assert-with-friendlier-ch.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch=
-of-assert-with-friendlier-ch.patch b/meta/recipes-core/systemd/systemd/002=
3-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch
new file mode 100644
index 0000000000..aa78f4d797
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-ass=
ert-with-friendlier-ch.patch
@@ -0,0 +1,108 @@
+From 5ee8b3edb385b216eb4f3316323ae1287824971a Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 5 Jun 2025 22:26:03 +0200
+Subject: [PATCH] journal: replace a bunch of assert() with friendlier chec=
ks
+
+We should not rely that data stored in the journal files remains
+entirely untouched at all times. Because we unallocate files, data might
+go away any time. Hence, never assert() on any expectations on what the
+file contains. Instead, handle it more gracefully as a corruption issue,
+and return EBADMSG.
+
+Fixes: #35229 #32436
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/37757/c=
ommits/5ee8b3edb385b216eb4f3316323ae1287824971a]
+
+Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 28 ++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index fecddb932f..acceea7770 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -2740,7 +2740,9 @@ static int bump_entry_array(
+=20
+         if (direction =3D=3D DIRECTION_DOWN) {
+                 assert(o);
+-                assert(o->object.type =3D=3D OBJECT_ENTRY_ARRAY);
++
++                if (o->object.type !=3D OBJECT_ENTRY_ARRAY)
++                        return -EBADMSG;
+=20
+                 *ret =3D le64toh(o->entry_array.next_entry_array_offset);
+         } else {
+@@ -3241,9 +3243,11 @@ static int generic_array_bisect_for_data(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
+         assert(test_object);
+=20
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
++
+         n =3D le64toh(d->data.n_entries);
+         if (n <=3D 0)
+                 return 0;
+@@ -3609,9 +3613,11 @@ int journal_file_move_to_entry_for_data(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
+         assert(IN_SET(direction, DIRECTION_DOWN, DIRECTION_UP));
+=20
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
++
+         /* FIXME: fix return value assignment. */
+=20
+         /* This returns the first (when the direction is down, otherwise =
the last) entry linked to the
+@@ -3671,7 +3677,9 @@ int journal_file_move_to_entry_by_offset_for_data(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
++
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
+=20
+         return generic_array_bisect_for_data(
+                         f,
+@@ -3697,7 +3705,9 @@ int journal_file_move_to_entry_by_monotonic_for_data=
(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
++
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
+=20
+         /* First, pin the given data object, before reading the _BOOT_ID=
=3D data object below. */
+         r =3D journal_file_pin_object(f, d);
+@@ -3763,7 +3773,9 @@ int journal_file_move_to_entry_by_seqnum_for_data(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
++
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
+=20
+         return generic_array_bisect_for_data(
+                         f,
+@@ -3783,7 +3795,9 @@ int journal_file_move_to_entry_by_realtime_for_data(
+=20
+         assert(f);
+         assert(d);
+-        assert(d->object.type =3D=3D OBJECT_DATA);
++
++        if (d->object.type !=3D OBJECT_DATA)
++                return -EBADMSG;
+=20
+         return generic_array_bisect_for_data(
+                         f,
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 9c5f8af240..f9d0719d5e 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,7 @@ SRC_URI +=3D " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://0023-journal-replace-a-bunch-of-assert-with-friendlier-c=
h.patch \
            "
=20
 # patches needed by musl
--=20
2.43.0


