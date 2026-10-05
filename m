Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DD5CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 08:39:33 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15642.1791189434105829026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 01:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=C58qELqe;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.12, mailfrom: upstream_ip-sh@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdzeRsmHZ6Ahz+v7FJPuTmhURsjbe+9AwTtdy8Gn5MTfCVw3IFoYwKT/mCs1l80uw4uP9Aw7OZfKokJxNPzVskN31vw2r3BwmX1VueLtG0N+5ezATxEN+mw25AShPEeHBqTJ/rvnLDoyAluZthhYtYFM3LBNcDU0SYugxe4roADNV+DpNZEsZEktiRuBiN1DEu0U5DulYqMhtboJZ1YSMPG9l4U+FdtFqEIRJA7j+z6sdtEkIr0cfyl6jcnvKYHHGTDy8wSB4/epu7Qr0Dne0okdTU4rfgdc3u2H4EoAZCKzLyyROFTOnAwZoMYYl1X1pqCDwm0vxH9DTJ/S7VFkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p9usr8VoNg8zycLFw9y+XwGy40PJ7J21oQdSop0Weo=;
 b=tuJ4sJK0NDoVr80fTgkgWPeTtJrKVijQnlWyfh8YDakRsIR5OEgX9TciKD5ej86IINiLeZ3b7LBqmKhyUFu7kQXVk/NV4QTd8CdaKR0x8m4t8NXIqvnYEyd8K1u/q6z/GpJaxzdUKX7FF19ZjSMaNIt3vnb/WHpHlH+EtCna016um4tXN81zuoQYJuiae1Kqr1cFXZgjvoiC2ZdBT1LpRu5ssZC9U7HZhVbcVdZgiD4HOPOqrnF3cUpb9AdF6EY6dkup+dQOO4mVDB1g2kk51nw2WjfGYLl3G625F7FF5HGAJz5lip7lb2itIdqsrnGO/0Jv+//hUXPZ++rwQVIQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p9usr8VoNg8zycLFw9y+XwGy40PJ7J21oQdSop0Weo=;
 b=C58qELqeWRmFmtiF0gbDhaUMHlnFPkrxma+cvXqVdyvvbkTwqcr/tKtUkubh+xtxmpP6b4zZtD+ZRhCnML9lOn3jA7X97wlizp6rU2W3w6FuCSn6lQjVFfLZKZxbCt7xmBM6I23LWhsT/+T7KmtZhfw8bjQ1YUMjWYIZIL+y/z/7TtmpqJdh/B84rGteX3EWjXG4caegyrwSY5/GZha7XL43S7AzbcEF9YSsHNsa3D/jtehHXn4iNeZgdSwfZZlejEG2cM3FRUdoZHLMa8Pg/SbobmMuSBWCp89SQfeW6by7Jtn7RKnP4uCTPGgw81JKnsR/4geGxNKEPaCMcmwSGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a3::20)
 by PN3P287MB1318.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:22:17 +0000
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14]) by MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 08:22:17 +0000
From: Suresh H A <UpStream_IP-SH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	suresh.ha@bmwtechworks.in
CC: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH v2] systemd: replace a bunch of assert() with friendlier checks
Date: Mon,  5 Oct 2026 13:52:07 +0530
Message-ID: <20261005082207.3387895-1-UpStream_IP-SH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::6) To MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1a3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUP287MB4780:EE_|PN3P287MB1318:EE_
X-MS-Office365-Filtering-Correlation-Id: c291026f-9b88-44e5-bb1c-08df22b9c468
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|11063799006|6133799003|18002099003|55112099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dH1gS5nhzI0OeOSs72LGYcNz6BIdr7mkPyKT5k0BL9eMS3ndVET7HQD0jCFM+VKbetPLM0BKAoAxo/pvSRl/6RErrZ+I5C/AV2xL5GsUAhe3Dr+X5iBNiewxM/OCwfHQ4CNJ/uqHLR8DQVcf2CCqGia1xDOX0YZsbZwH+o8VdnDJbsQc+Vz4mKieYPib8VilNidTyfeNoBeTzOaY/NmknqvHydK1/iSpUq+TFichFzTi1AFFzs+qimuTUIcgzf2xu030vABNlhdfBErTQqiewfrAAtygs/NwWJSkiIiCckrNcDQfKhoPz/lafjeYoQ50EsJACkN5IbElCQRf5MJkgL5G5irU+OezVPpWsv1TrBehL4oyzb/WC7HqNRUd8YhF9T7OaWAIPbAL7nYzfMoWkndPVCNFse25bKlUxjImkIx7cTZGgSUTGNHRg25t5+I9BBlghxISJxnTQPDxMg5YyE+QQIMuADJMzJe2UzwEU7q79pO0vGVAfpyD7eGVD2Zgd2v10EQH0e/g6QT1zCc4oH3qnx/345iKEAVmAt/RRk16R2jGhjQmkxjKZHKBzR9cSBbp4UzUiKcyUY8NlvG7tV4NomDLdIZj+RXiEhNFsZK29WOREVUCqjW7tQmaEmOmmTi7CeAVAzreuaBS6kkbgHFTcsC/YFqtG9LQ/lHE5mI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAUP287MB4780.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(55112099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UF6csfw/Vgoi/9NBxJfqeJmRoZoStPCD4wcukeUKSywVtQGR7A6LvyZP3MUx?=
 =?us-ascii?Q?FSYoAC3WMrmPF5LXs41c2Nu+vUgsbxv98HP33k55pqV9cOtCCh+nHBAy2Ipb?=
 =?us-ascii?Q?KNxQzzVKKJ9OniQ3cWqVGyAopjXEebYoI8PY4tUxo4dWASuhzG0qXv4sdMYl?=
 =?us-ascii?Q?ztzgnX4MW3H7enE/PDwdeb3U9XqgTxKYr8OmkVXvc3RC1bOsYomg8fooPzf5?=
 =?us-ascii?Q?6G86SqGHpxg81kDHaIvUUhphs7lGM9u5QJW1H1ug+fjbkce9yqZGbNCRFdmT?=
 =?us-ascii?Q?TpJWA2g4xwijyPsm9BEKgreNTHT3CZDVrAhlrxK8wYufPYc7XJGaBPF9urws?=
 =?us-ascii?Q?uuZDk/Fzwxl/oTLlySweKr884BNCg6ZW23qqdfBGiRvZrGH5Re/oFq+ywTiI?=
 =?us-ascii?Q?vtJ0U0JT6L2Ebn8pb0D3biJdK1XUePFD19ycPqml7WOQhXe59W+O3PyB46/7?=
 =?us-ascii?Q?4Szm5Haea1sML2v4YWLb97sW0f01DoPTJxevmabniPuBUk03i1fT3F+VIXur?=
 =?us-ascii?Q?UHs0bF7cVgU5IXIOe7Q7SETYh1viq1JPjCsb/PyTk3ND1XtJWAecwk4AGYCc?=
 =?us-ascii?Q?1VGSqL8DXdUQL93Fs1m8zC2n7ILadBTq+TizdhJ4W0vgCPDrRLa5Ar1qk8o7?=
 =?us-ascii?Q?MsqUiXBDBZGy2tqK07uhAQeN9c7fSP1Z22cRyE7O/d6yzCDgZ3kgtgri3M08?=
 =?us-ascii?Q?RLiKgKjs/I51MAlT3RnmbYUa1c5axP6KNsOBtaepXcO0d0/OwCptjSFElfIJ?=
 =?us-ascii?Q?VH9yp7PERG5bWGSWgZoKMjv9LUnsU0lI2ICS35qa6Jh8Om3UIHesoxv34dyK?=
 =?us-ascii?Q?UQOelGY9Z2pA9ULbb/4Gwl8j/T2JBItzdIwQJrjd7x4kiDcIw7UbQlVxKR0o?=
 =?us-ascii?Q?AqO4Q9xZy4GoVcwQILNRCESs3c+1YCMsQoBr8pYG/zyGJUxXRGetPL0kK9t/?=
 =?us-ascii?Q?CiM8OLbTax5ILCgwY68uaZ1YObgmflD+iWBS2rZ+K8vgaZFa1X7N2JLtXQ9n?=
 =?us-ascii?Q?UHhjfFHGDOfUbC0o/JQlr33d91ynq1yltFQ4U4p4lM90LUoEcGZtdBpV/tQ8?=
 =?us-ascii?Q?+u7uEr8Z0nDWMYeLetKr2oz/TrBwqMV9if7X/hjmtepqF/6d1xO0vNnoB2qZ?=
 =?us-ascii?Q?sDC9w5PJa4EcL8co+naFZioAaaIrauqjGXcuos+1Yl9bjHRq3N8KL/4AAAhR?=
 =?us-ascii?Q?NvdkKd3TdFrjX4ulApC95KH2NecH6/2SLCFxq5rNC1HrjMNhV8m1CdeqqaX8?=
 =?us-ascii?Q?lIWuJ3diHEP0HzIxWK6VtTvgc6H1cBxGCkvCVWQzc0InjEKX9G1Clzg3chu6?=
 =?us-ascii?Q?I9NccDYDV9wYWxEnxx2ZgusEH5RAxQYLRzvyf48O1JfMXl+N0KwZHh6LHv3n?=
 =?us-ascii?Q?htU/JiGa66VF/QQhoJLEB6F6wBey1/2+7Vq9H/r7n8G9wDTnXxfFB2chveDk?=
 =?us-ascii?Q?Aw03f2jdDhyPaGkZVnUbltcoZ+DA6kVl4+TgyHqUaW4okRMJXGDfGxJd+JSh?=
 =?us-ascii?Q?EsfjRkuq8PSk6Xbz4MspPliS0+N2laxZ+GoVJoWL7vRqO5m5xmbJ1MYvISxu?=
 =?us-ascii?Q?ZQKl39zQvz0XKsYJlq+lRXTqG0eYSLN2b9i8gF+1qMZ1zhpyZtm2imMsGQBW?=
 =?us-ascii?Q?3Nepj6OMI1jmpgEcXgiRAhzAYcEoLyeWlEsMwAuVDldVZa+tZOb1s/FqHC+v?=
 =?us-ascii?Q?rZypgg+au9Qe3XRqZcQovmEwsOnDspfIBQJSI+QCaYOdkDhLGB0lQmNnRIAr?=
 =?us-ascii?Q?eOxz0yaKBFLATbGzOVUnqjNyUx5TVYc=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: c291026f-9b88-44e5-bb1c-08df22b9c468
X-MS-Exchange-CrossTenant-AuthSource: MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:22:17.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN1plsLjebFWdvNQ9gLus6BSIFyOgNnoYORomcLRGA+J/yBbRqXTcLkZL57pVh0kSIg8wbq+QdKZdC+/Ol5ZA3tV3N7kVZXXTXuOrWRaJ7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1318
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 08:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247222

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a patch that replaces a bunch of assert() with friendlier checks
Fix is already available since systemd v258-rc1.

Journal file contents can change or be inconsistent on disk, so they
must not be checked with assert(). We hit this on systemd 255.21, where
dlt-system aborted in sd-journal:

  dlt-system[1284]: Assertion 'd->object.type =3D=3D OBJECT_DATA' failed at
  src/libsystemd/sd-journal/journal-file.c:3237,
  function generic_array_bisect_for_data(). Aborting.

generic_array_bisect_for_data() received a data object whose object.type
was not OBJECT_DATA, and the assert aborted the whole process.

The patch replaces these asserts with
"if (type !=3D expected) return -EBADMSG;" in bump_entry_array(),
generic_array_bisect_for_data() and the journal_file_move_to_entry_*_for_da=
ta()
functions. A bad object is then reported as an error to the caller instead =
of
aborting it.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
---
 ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |   1 +
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
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-cor=
e/systemd/systemd_255.22.bb
index e5a0fd9170..342d078067 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -37,6 +37,7 @@ SRC_URI +=3D " \
            file://CVE-2026-29111-02.patch \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
+           file://0023-journal-replace-a-bunch-of-assert-with-friendlier-c=
h.patch \
            "
=20
 # patches needed by musl
--=20
2.43.0


