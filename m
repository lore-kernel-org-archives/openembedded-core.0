Return-Path: <daniel.ottiger@schindler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3059C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 16:10:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.87])
 by mx.groups.io with SMTP id smtpd.web10.19887.1710864641839712725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 09:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schindler.com header.s=selector1 header.b=Hd9FjhsI;
 spf=pass (domain: schindler.com, ip: 40.107.7.87, mailfrom: daniel.ottiger@schindler.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGGwXCdIF63ocLOx0mImFWvHCSaS3rOeNjbHmE7o6/6M7d2swrLyY9BM40ARbXUOuVDXMomB8QAF4bRTdbCgwKq8qArot/R7C777mphqvPWMiNtUjTfB9NcAhMztNcG+rPT4woXFd2xuzk9m/yo6n+/nLbRZsWb4RZZRAKn+DYgxQpE80IJv9dY+f+4f1ADn9r69S13OYuLwrnP/j9RsaqYy4XyibdmQ5mVxOPsc0iTmQ4sKZ/eQNVRhZbN7pqZLn8COJJnSd+oKoyCZb00FznI5Ngro7+Ye2KjmHU8/v8bYFOIWgvPxRmgqcTdqeOmNMRyVaZc+wgx56SYoIZNJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDbQym7H4kyxhs4mtHnwNuxsoUc8Okcc/1ZTNNRf3ro=;
 b=HDHJR9f/M8K/wqj2NN/+OKI6qN5/HwcPWF/poVBpyX8HXSJXUI+unpkuovpYzyI2n8CbtuLmUSHR/JNheeTTwh+hYCW0Dkvuc1nh9TemGp7mYqcXu4bWIwnRuu7QsOP1IuM+jUOqpBxfyL2z4/2d8lLLCS3rTcueh/YFUMdEqNfaZCpqdnnqkiV1O74dye581RKX3vJvo0gzafOsX8F6rLsMisA5o9u64Cn9VbnhaIqjYS53A+uNN8qL4i+vq4U3N4Ow2elJokG3dYJ11C+MfLCBEKyeNkFtefmxdyqzB8sqg4n60C6eth1mudLx40BhJpKR040mrUWQGK6rxHpliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 40.127.209.13) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=schindler.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=schindler.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schindler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDbQym7H4kyxhs4mtHnwNuxsoUc8Okcc/1ZTNNRf3ro=;
 b=Hd9FjhsI8pGzQTTr/bPv2aNYL146VOucw+7r6hqmu51FhFLqOBz2aKyE8RiIfs6I1y39KZC/oCRxzXbWwwl9ImD+D7HLbVEXO59n2CF7BbDpiJf5VWX185CKfaykgW1eVmgOhzkXQo7b32EW31MM04FtntJLN6I3KBzG7VPAVN877u2rst0fD46ss1GfuO43zETzUYa8PTMlOfSiqLLUftm56zLanSgEGOyiWPV8d3acCXIr+L5sUz+kH3cQC+Il1CLQXpxosvOdJauMysPsJkGeYStnajeYjUigndbVmR5NtVyivtci/7wCH9GWJxd0VqOdndRBxNTlIuluxutvsg==
Received: from AS9P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::17)
 by AS8PR01MB7511.eurprd01.prod.exchangelabs.com (2603:10a6:20b:2a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Tue, 19 Mar
 2024 16:10:38 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::34) by AS9P194CA0013.outlook.office365.com
 (2603:10a6:20b:46d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 16:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 40.127.209.13)
 smtp.mailfrom=schindler.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=schindler.com;
Received-SPF: Fail (protection.outlook.com: domain of schindler.com does not
 designate 40.127.209.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.127.209.13; helo=chinfnn16.dmz2.schindler.com;
Received: from chinfnn16.dmz2.schindler.com (40.127.209.13) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 16:10:37 +0000
From: Daniel Ottiger <daniel.ottiger@schindler.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Ottiger <daniel.ottiger@schindler.com>
Subject: [PATCH] pulseaudio: replace "pulseaudio-" with "${PN}-"
Date: Tue, 19 Mar 2024 17:10:26 +0100
Message-Id: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AS8PR01MB7511:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a69dbf5e-83a3-4577-b8b3-08dc482f1dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8EBhAyPh/+Q3eTOK33XBpBBI1lMjfhEegmUZBBPpjblqa6ikZQBf4NpJUvLcBcjPOuGwpDXLOlpwqYSFYVcyI7mnz5pL6i9e+ChVNbQF+vzZs6cag8Uqa1TH8uhwAtxzZ+/NSFK6L2dmDPn11hTDQDlS5ZZIPFXriBOf9PvLZvqPC3SPupAioivNNv3i4QzYrWx4GW2+BQpU7Zc/VeAmqbMPEDgPmaO3mQ04ID4Y8x67EZrrffLlC3A9sI8PlU28sn/y1W+am2+HnVCqKpHsSRFlTYcaTocCQ4O+ZsTe2NQ8dGapTz5yaXdbYU48fsUIXxp/9Ms6186iCE7BGDR0Oi4v1EwE+Nk4SMue1RJ9RGHsY2SqLt20n0j2apdEAJjtuFE3pb2uP0gGPt/hyh1UkBZJJnWIlB2wCPqSvu1V/Za2QlXV7frGcJ+FmUd19lxpjy3MZg0O6j8Wuy4HgJYfaIrpsk+B7yjqaY21EoUR/DbWE+EzAAkV0b3fbQ7WydiHlbubh6l6SqXyaljarj6o8h85ZJTJju13tV44Xkgw/6ggQfUaZkIG8rgNKE99QbAiCfTwrwIv7KTkxf1I6PVAuBiYR4PJQ7J/U1trS2cYdfkEWykWVxQ3MzwUpnw+RWgSFQSorRiAuleAfUzvhIw3DlWDOfmwq+e2uyqHBRFBKf1ccgTPlRtAysIrF5RbscXaaO7nIe5pHI4JX1/zS8kV3ho9GNc+H0AStYaRf+dvnTTVIeoFnvoYEnDp+xxIolPO
X-Forefront-Antispam-Report: 
	CIP:40.127.209.13;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:chinfnn16.dmz2.schindler.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: schindler.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 16:10:37.9398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69dbf5e-83a3-4577-b8b3-08dc482f1dd0
X-MS-Exchange-CrossTenant-Id: aa06dce7-99d7-403b-8a08-0c5f50471e64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=aa06dce7-99d7-403b-8a08-0c5f50471e64;Ip=[40.127.209.13];Helo=[chinfnn16.dmz2.schindler.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197324

avoid preferred provider warnings when compiling pulseaudio natively.

Enabling native compilation was done in a separate bbappend file for pulsea=
dio:
----
BBCLASSEXTEND +=3D "native"
----

pulseaudio is a dependency of vorbis-tools,
from which we like to use the native version of oggenc
in order to convert wav to ogg files as part of the yocto build.

Signed-off-by: Daniel Ottiger <daniel.ottiger@schindler.com>
---
 .../pulseaudio/pulseaudio.inc                 | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index ae16056d243..85515b3581f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -145,9 +145,9 @@ do_install:append() {
        install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/de=
fault/volatiles/04_pulse
 }

-USERADD_PACKAGES =3D "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server =3D "--system pulse"
-USERADD_PARAM:pulseaudio-server =3D "--system --home /var/run/pulse \
+USERADD_PACKAGES =3D "${PN}-server"
+GROUPADD_PARAM:${PN}-server =3D "--system pulse"
+USERADD_PARAM:${PN}-server =3D "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

@@ -166,12 +166,12 @@ PACKAGES =3D+ "\
 # RDEPENDS we define for it in this recipe, and thereby ensure that when
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
-PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-m=
odule-console-kit', '', d)}"
+PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-module=
-console-kit', '', d)}"

 #upgrade path:
-RREPLACES:pulseaudio-server =3D "libpulse-bin libpulse-conf"
+RREPLACES:${PN}-server =3D "libpulse-bin libpulse-conf"

-PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
+PACKAGES_DYNAMIC +=3D "^${PN}-lib-.* ^${PN}-module-.*"

 FILES:libpulsecore =3D "${libdir}/pulseaudio/libpulsecore*.so"
 FILES:libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D "1"

 CONFFILES:libpulse =3D "${sysconfdir}/pulse/client.conf"

-CONFFILES:pulseaudio-server =3D "\
+CONFFILES:${PN}-server =3D "\
   ${sysconfdir}/pulse/default.pa \
   ${sysconfdir}/pulse/daemon.conf \
   ${sysconfdir}/pulse/system.pa \
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D "\
                           ${PN}-server \
                           "

-RDEPENDS:pulseaudio-server =3D " \
-    pulseaudio-module-filter-apply \
-    pulseaudio-module-filter-heuristics \
-    pulseaudio-module-udev-detect \
-    pulseaudio-module-null-sink \
-    pulseaudio-module-device-restore \
-    pulseaudio-module-stream-restore \
-    pulseaudio-module-card-restore \
-    pulseaudio-module-augment-properties \
-    pulseaudio-module-detect \
-    pulseaudio-module-alsa-sink \
-    pulseaudio-module-alsa-source \
-    pulseaudio-module-alsa-card \
-    pulseaudio-module-native-protocol-unix \
-    pulseaudio-module-default-device-restore \
-    pulseaudio-module-intended-roles \
-    pulseaudio-module-rescue-streams \
-    pulseaudio-module-always-sink \
-    pulseaudio-module-suspend-on-idle \
-    pulseaudio-module-position-event-sounds \
-    pulseaudio-module-role-cork \
-    pulseaudio-module-switch-on-port-available"
+RDEPENDS:${PN}-server =3D " \
+    ${PN}-module-filter-apply \
+    ${PN}-module-filter-heuristics \
+    ${PN}-module-udev-detect \
+    ${PN}-module-null-sink \
+    ${PN}-module-device-restore \
+    ${PN}-module-stream-restore \
+    ${PN}-module-card-restore \
+    ${PN}-module-augment-properties \
+    ${PN}-module-detect \
+    ${PN}-module-alsa-sink \
+    ${PN}-module-alsa-source \
+    ${PN}-module-alsa-card \
+    ${PN}-module-native-protocol-unix \
+    ${PN}-module-default-device-restore \
+    ${PN}-module-intended-roles \
+    ${PN}-module-rescue-streams \
+    ${PN}-module-always-sink \
+    ${PN}-module-suspend-on-idle \
+    ${PN}-module-position-event-sounds \
+    ${PN}-module-role-cork \
+    ${PN}-module-switch-on-port-available"

 # If the server is installed, it's usually desirable to make ALSA applicat=
ions
 # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configurat=
ion
 # that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pulse=
audio', 'alsa-plugins-pulseaudio-conf', '', d)}"

 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKA=
GECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with x=
11 in DISTRO_FEATURES
-RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_=
FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
-RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
+RDEPENDS:${PN}-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_FEATU=
RES', 'sysvinit x11', 'consolekit', '', d)}"
+RDEPENDS:${PN}-misc +=3D "${PN}-module-cli-protocol-unix"

 FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"

@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D "${libexecdir}/puls=
e/gsettings-helper ${datadir}
 # running for the duration of the user login session). The device-manager =
and
 # x11-* modules are referenced from the start-pulseaudio-x11 script, so th=
ose
 # modules must be installed when X11 is enabled.
-RDEPENDS:pulseaudio-server +=3D "\
+RDEPENDS:${PN}-server +=3D "\
         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
-                pulseaudio-module-device-manager \
-                pulseaudio-module-x11-cork-request \
-                pulseaudio-module-x11-publish \
-                pulseaudio-module-x11-xsmp \
+                ${PN}-module-device-manager \
+                ${PN}-module-x11-cork-request \
+                ${PN}-module-x11-publish \
+                ${PN}-module-x11-xsmp \
         ', '', d)}"

-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', \
-                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit',=
 d), \
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',=
 \
+                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', '${PN}-module-systemd-login', '${PN}-module-console-kit', d), \
                                   '', d)}"
--
2.39.2


*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

