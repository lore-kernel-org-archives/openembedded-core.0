Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E463E7B5E5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 10:04:19 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.118])
 by mx.groups.io with SMTP id smtpd.web11.14841.1696413855213631631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 03:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=NsDvcdaJ;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.14.118, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTgrxW6d1ulZcSMQmYenq4Qad3t7mjKBN2gSY5hxiEqEDu8fYGL+7T564jpOX67/sB+LHbcUjC5oMKSQnTtcIdE4aZG/q287+d3jCKVuYZtlzMsURDGpehqShSxwFLLcJgc4MeKJn8Q/G4OFcXv55vPs8KdtnKt8WStuKHLeBwwuwSQuaSWwqMWZagiRKA2kLYhG6wJ6iZ2qXBeK5eOC5JABfAKxrhsdJakgpmeB0mKEnP68s8gj81a0mpGQvfJbqa6Qs41oAy+UP1OJXzo4VUEoM74iYlV9MzRsQ37sC/cBkcsAv77XViud8PbBs3tHgQnhdTI3Ni4po1vNi0dXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUy77B2o6DifwbBtEehWI/qahuCrb9ZxZnaR5JE0VJc=;
 b=lpbjJjM0RKZFr2lqeXh7hHEpZOVHVmA91uqH/9UHHhi4i3vVpukDAhJiMeDkORFOFdElknRdk3ltadEzJooMekCiULxINtczTGJEtJu3foAcD6jgbD1Krf3iOto3imsJlwJ1QVCJtzHC76ZuFCEg2PXVEC7f+sR9TpiYfWylGLMnegl/BSCVZXWYlrP1kT3GXYPRXuNl96odJEzPrArgDKKBxr+8gm+W9xBZnkIDIft0Uxk2pDTGr3BDsxDOqbeLHQqa2qMm/LtI9VJfNSLHMX9EW5t80BMe3K3tvST9NL8fxCEqRpAl03u7XTucOESYoqpR+dqJ2COzYAIkUcfZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUy77B2o6DifwbBtEehWI/qahuCrb9ZxZnaR5JE0VJc=;
 b=NsDvcdaJ+4Z8K3TXLoGVkvpHcOs5HlnaWBM9xzMj2xtRYCyh20jQnGbc7zjrrBhdSTB/u6I0flKgGyGncr/5UgrJur/LfcHRq373Dyw+C5SeH9T3Y1VWWbPxnc9LPJ+d0hxksd+CWddaafHHEuwHQgVslEr/87pWJhEEHLD0Pno=
Received: from DU6P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::15)
 by AM7P122MB0247.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 10:04:11 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::19) by DU6P191CA0040.outlook.office365.com
 (2603:10a6:10:53f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 10:04:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 10:04:11 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id nu4IqwGUnxYR8nyjjqfBit; Wed, 04 Oct 2023 12:04:11 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id nyjiqgBmnVjBvnyjiqefFd; Wed, 04 Oct 2023 12:04:11 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id DCE9A184785
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Oct 2023 12:04:10 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id D67042A141D; Wed,  4 Oct 2023 12:04:10 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] dbus: Backport fix for CVE-2023-34969
Date: Wed,  4 Oct 2023 12:04:09 +0200
Message-ID: <20231004100410.1609317-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AM7P122MB0247:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afb3f3d1-b4d3-4bb5-9f63-08dbc4c14198
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YUGuMZa6eWv22aWmPnEwzEyu1yq5TFOtHBcerfmycExMMFhUhxYWhdWGdQ+KLMdHpI0V1ESHq0wt37BfJSbTGKvg9KWxlCrsBEgcXvXtoA/rsmNxmHhtFI162xFH0Xm9/v4ocAqogVb9mluZcvsAsU3hgjLKEH9wdjZwe8l9B1VwdiwfjsDD4+Tynf1lnSM5xAxD40pYjkPT7vqhmiCBJkJuh0j9vsq3OvpJbYJqdM3tIX7/eWhV9XSgCqM+kLImMPSze+pXBIkcBRkM2shwQDsbL1jSsjWVobPlmlZQaJw0WaXW2FlJOq+E57zZjSgm17HZJ44Qz5UPMi1pw2vTrmHmeH7pAXF3gzaruEEvL7+MxPTCOq8DmyJjJkn+TfVGiDA5m+7ig+fpZkudHhURtRH4RmChGJp5lVKObFM3Ukz5c2S2ZUb24lPspxMlA/NyEnNpQo3EN7lCxoGF5elVllKSj8rRxbwDtPuBjXA7QVFyatnGieDsTenyfaLXE1A7PeCg6BuwoWf4fna/pMWeKSe1DcGtaE5jrE/3L/U0zhz/CE6iGd5pjiLjzJTCSX6/mjmBk38d80CEw3XmvHm0h4AXiQ2RBthwB1Qb42qyFCE5OCrsYnu8vEQdjxatsUyYSOdwCYoBTKiNMj5SKMWro/XMw/+P+gteHnyllqPg2pGr3aw3k93bl+GdLlp/8ACcUd0Y8vaGlRzX5mthdAQQbwpafCQJyi6xMjMUzyVlBYDgOx0NEkwju+hs0P7tnx1KlvBQdTQ80Mpsmz0ePfq7Q2odI3vfFtiF6Kb58aI9ohhaZC7jaYSSzOZ3YorZ/F3K
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(48200799006)(186009)(61400799006)(64100799003)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(47076005)(2906002)(83380400001)(40460700003)(82740400003)(83170400001)(55446002)(7636003)(7596003)(82960400001)(36756003)(356005)(36860700001)(40480700001)(6916009)(316002)(42186006)(70206006)(70586007)(76482006)(82202003)(1076003)(41300700001)(9686003)(2616005)(966005)(336012)(478600001)(73392003)(42882007)(6266002)(8676002)(5660300002)(8936002)(26005)(590914001)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:04:11.0529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb3f3d1-b4d3-4bb5-9f63-08dbc4c14198
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P122MB0247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 10:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188670

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


