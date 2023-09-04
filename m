Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE2AC83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 13:40:53 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.91])
 by mx.groups.io with SMTP id smtpd.web10.47889.1693834852886775245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 06:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=XMCdhs+0;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.13.91, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCYJh2LkKl2+ukPHMueKjK22vJIcl7hAGqIHrd0wFrXi8GzqyOjNKDNLBCQZk/RQhq0H+tRc29k7ZZ2bx0ku22bSN1oh3KfaoUjXINz6j78+bqY4wSzeVBQbjQcwMxwHJeO++dUAY143jND23Lou/rsqspgGpaobC4odYKRdw0nwE16zqhQHmhiaytKcbS63cf2+Gtujo2wsyem6IvHYpSjJCkcm3SCtsLC0MAVfwApcHdOy98/KazjBU9IDL1yOxTi55BSrfMGaSk3tnIyKp++2shPD+MzhqM9EAr8uLeWqtfJ0lFCeCobQBZgeO13Fk3DLaaTWEgNXUlu+OFJ2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUy77B2o6DifwbBtEehWI/qahuCrb9ZxZnaR5JE0VJc=;
 b=Gt73vTgHI5d2hVUGby0iOdt/ks7CzvTykl0HRWJYLbkiOobmPAmirKVq0SNGZ2W37zUiJ4cvuKkxnvlC/FxKCzmAnmQJksN3fTEq2vL3eXOeYRwBzd40s+AxVXJ2AbzvfgqfG0HyMXIXzxcJUPquSuBTeXjWlJTCrvfm2OlTHPvwjNzoKBH5Hr4kC9/TCemyRmILTnEdL5Vf8HfEObdQn5T1CWhUfWQNmwFWVfj25x2WxK0OtdxkByCYW74PfOgxadNEJ4WLCMQC36Jb74Ig2k3ekO5sWEzZZX8s/QFRkQwZARicBn1dGAn6iBciaHi5MeXJpb9VhAxp8wCtEObtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUy77B2o6DifwbBtEehWI/qahuCrb9ZxZnaR5JE0VJc=;
 b=XMCdhs+0joiUpojVf7Sr9rhYm8FM8+891BjBSZKDs0unFCXIEFYqn8KsZ+EdeEulREcpH5PHSHQB+uzbuIFIKG6xGxXPINJb7c0TCIKNm+BBMJk7AQIC/r9izQCQbGDZ5z7ozcDbtIa/DAqQbcGgSAFlNkBijNyXMBM8C4nNxXo=
Received: from DB8PR09CA0004.eurprd09.prod.outlook.com (2603:10a6:10:a0::17)
 by DBBP122MB0203.EURP122.PROD.OUTLOOK.COM (2603:10a6:10:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.38; Mon, 4 Sep
 2023 13:40:49 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::3f) by DB8PR09CA0004.outlook.office365.com
 (2603:10a6:10:a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 13:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 13:40:49 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id czp7qdlIYxYR8d9ovqusGB; Mon, 04 Sep 2023 15:40:49 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id d9ovq1BT1YxEZd9ovq7qOw; Mon, 04 Sep 2023 15:40:49 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 0E743181D0A
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Sep 2023 15:40:49 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 0B03E2A00ED; Mon,  4 Sep 2023 15:40:49 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dbus: Backport fix for CVE-2023-34969
Date: Mon,  4 Sep 2023 15:40:48 +0200
Message-ID: <20230904134049.229892-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|DBBP122MB0203:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7b65ed13-8632-49c0-5a81-08dbad4c8cc0
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cw/Yb2QWhbFc0F/IyoOGPEBltd3LA09xYwQWlWW4981AWBLZlIivGDBCg7NcNF4UYlZleHweusxRs79VbcIUeWXsJs7APHpiqa0P/Nuy+jqJJbLNhVbYuTZUUZqZ2AJ8DUrS310cw8H4RCcX0gB2BGxzTtOYLY8za6b9kR0bxsfBDU2BbqsJ5FGt3fwLcDcwzU3Mbg12hUb8gIXtdwqUDWgtzshWDUHU1ZGeQPp84I/MCQrtZxi1aUzORv37KVot2/EOju9PPl5CwiiFdN5ROWJH+Q6zBiS3QTrons8L5E7bCuNWPPFE2Lp92twZKqZ45MCb/21aVWWU5kRZtIy69HWbh/jILVdDzqfndJbkm4vW5yhDt6+ezPRVN6lq4x273WzPbi5KpJItU7xm+mMS04oJaKjwSgBuJwOCelLcRXr7MyEQ/2Vw0W+u474850qaPjmtBVtbWfQ4Cp0CbCRFaK1uk7VsGZK9cpy5aukOZ7gGKRZwip2arMi6Wvdwvix2z1PmJ5RGH+RJuDOSR5WXSn1Yo/Ljvuod/9JPoDxEa87YfLcu7+2aXi4n5Kee7TSRNZ42ZFwsI9Mefx5gS+V6LeiWlVy5Ckh3vDJTZdD5htJaTbBqLp5NNzjGXDS0S6PB+gghqrx5bAdkBbASGdZezMHhg/DMr6l6jeDswSjqHX3C08axNU1XxXyzrDKNRpSBiunQu9ufQDmfAvhiDw/ECJkdHzps6LdpMFb7Lr38G/xzs4aXY86Q4GZrF45lRG/RbWZx8AKC/QLm3XLM6WC8JLzNoFMnRepTgnhqTu10eaw7wT1JoVpxVzrxl8igf4M2
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(61400799006)(82310400011)(451199024)(186009)(48200799006)(40470700004)(36840700001)(46966006)(966005)(356005)(478600001)(82202003)(1076003)(2616005)(7636003)(7596003)(82740400003)(42186006)(76482006)(36860700001)(47076005)(336012)(42882007)(6266002)(73392003)(83380400001)(26005)(9686003)(70586007)(70206006)(82960400001)(83170400001)(6916009)(2906002)(5660300002)(8676002)(40460700003)(41300700001)(316002)(40480700001)(8936002)(36756003)(55446002)(590914001)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:40:49.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b65ed13-8632-49c0-5a81-08dbad4c8cc0
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP122MB0203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 13:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187176

From: Julian Haller <julian.haller@philips.com>

Upstream commit https://gitlab.freedesktop.org/dbus/dbus/-/commit/37a4dc583=
5731a1f7a81f1b67c45b8dfb556dd1c

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta/recipes-core/dbus/dbus.inc               |  1 +
 .../dbus/dbus/CVE-2023-34969.patch            | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2023-34969.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc
index 82e91c7b13..948aaf2e24 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,6 +8,7 @@ SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus/dbu=
s-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://CVE-2023-34969.patch \
 "
=20
 SRC_URI[sha256sum] =3D "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a=
6091abf51dca38"
diff --git a/meta/recipes-core/dbus/dbus/CVE-2023-34969.patch b/meta/recipe=
s-core/dbus/dbus/CVE-2023-34969.patch
new file mode 100644
index 0000000000..8f29185cf6
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2023-34969.patch
@@ -0,0 +1,96 @@
+From 37a4dc5835731a1f7a81f1b67c45b8dfb556dd1c Mon Sep 17 00:00:00 2001
+From: hongjinghao <q1204531485@163.com>
+Date: Mon, 5 Jun 2023 18:17:06 +0100
+Subject: [PATCH] bus: Assign a serial number for messages from the driver
+
+Normally, it's enough to rely on a message being given a serial number
+by the DBusConnection just before it is actually sent. However, in the
+rare case where the policy blocks the driver from sending a message
+(due to a deny rule or the outgoing message quota being full), we need
+to get a valid serial number sooner, so that we can copy it into the
+DBUS_HEADER_FIELD_REPLY_SERIAL field (which is mandatory) in the error
+message sent to monitors. Otherwise, the dbus-daemon will crash with
+an assertion failure if at least one Monitoring client is attached,
+because zero is not a valid serial number to copy.
+
+This fixes a denial-of-service vulnerability: if a privileged user is
+monitoring the well-known system bus using a Monitoring client like
+dbus-monitor or `busctl monitor`, then an unprivileged user can cause
+denial-of-service by triggering this crash. A mitigation for this
+vulnerability is to avoid attaching Monitoring clients to the system
+bus when they are not needed. If there are no Monitoring clients, then
+the vulnerable code is not reached.
+
+Co-authored-by: Simon McVittie <smcv@collabora.com>
+Resolves: dbus/dbus#457
+(cherry picked from commit b159849e031000d1dbc1ab876b5fc78a3ce9b534)
+---
+ bus/connection.c                | 15 +++++++++++++++
+ dbus/dbus-connection-internal.h |  2 ++
+ dbus/dbus-connection.c          | 11 ++++++++++-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/bus/connection.c b/bus/connection.c
+index b3583433..215f0230 100644
+--- a/bus/connection.c
++++ b/bus/connection.c
+@@ -2350,6 +2350,21 @@ bus_transaction_send_from_driver (BusTransaction *t=
ransaction,
+   if (!dbus_message_set_sender (message, DBUS_SERVICE_DBUS))
+     return FALSE;
+=20
++  /* Make sure the message has a non-zero serial number, otherwise
++   * bus_transaction_capture_error_reply() will not be able to mock up
++   * a corresponding reply for it. Normally this would be delayed until
++   * the first time we actually send the message out from a
++   * connection, when the transaction is committed, but that's too late
++   * in this case.
++   */
++  if (dbus_message_get_serial (message) =3D=3D 0)
++    {
++      dbus_uint32_t next_serial;
++
++      next_serial =3D _dbus_connection_get_next_client_serial (connection=
);
++      dbus_message_set_serial (message, next_serial);
++    }
++
+   if (bus_connection_is_active (connection))
+     {
+       if (!dbus_message_set_destination (message,
+diff --git a/dbus/dbus-connection-internal.h b/dbus/dbus-connection-intern=
al.h
+index 48357321..ba79b192 100644
+--- a/dbus/dbus-connection-internal.h
++++ b/dbus/dbus-connection-internal.h
+@@ -54,6 +54,8 @@ DBUS_PRIVATE_EXPORT
+ DBusConnection *  _dbus_connection_ref_unlocked                (DBusConne=
ction     *connection);
+ DBUS_PRIVATE_EXPORT
+ void              _dbus_connection_unref_unlocked              (DBusConne=
ction     *connection);
++DBUS_PRIVATE_EXPORT
++dbus_uint32_t     _dbus_connection_get_next_client_serial      (DBusConne=
ction *connection);
+ void              _dbus_connection_queue_received_message_link (DBusConne=
ction     *connection,
+                                                                 DBusList =
          *link);
+ dbus_bool_t       _dbus_connection_has_messages_to_send_unlocked (DBusCon=
nection     *connection);
+diff --git a/dbus/dbus-connection.c b/dbus/dbus-connection.c
+index c525b6dc..09cef278 100644
+--- a/dbus/dbus-connection.c
++++ b/dbus/dbus-connection.c
+@@ -1456,7 +1456,16 @@ _dbus_connection_unref_unlocked (DBusConnection *co=
nnection)
+     _dbus_connection_last_unref (connection);
+ }
+=20
+-static dbus_uint32_t
++/**
++ * Allocate and return the next non-zero serial number for outgoing messa=
ges.
++ *
++ * This method is only valid to call from single-threaded code, such as
++ * the dbus-daemon, or with the connection lock held.
++ *
++ * @param connection the connection
++ * @returns A suitable serial number for the next message to be sent on t=
he connection.
++ */
++dbus_uint32_t
+ _dbus_connection_get_next_client_serial (DBusConnection *connection)
+ {
+   dbus_uint32_t serial;
+--=20
+2.25.1
+
--=20
2.25.1


