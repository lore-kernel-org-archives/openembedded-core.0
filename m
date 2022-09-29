Return-Path: <philippe.coval@astrolabe.coop>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E805C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 09:58:25 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by mx.groups.io with SMTP id smtpd.web08.8694.1664445503151878505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: hua.lan.rzr.cloudns.org,
 ip: 212.27.42.6, mailfrom: rzr@hua.lan.rzr.cloudns.org)
Received: from hua (unknown [IPv6:2a01:e34:ec57:d710::e6ad:1a43])
	(Authenticated sender: philippe.coval@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id D55AA7802E5;
	Thu, 29 Sep 2022 11:58:15 +0200 (CEST)
Received: by hua (Postfix, from userid 10000)
	id 495E22262F5; Thu, 29 Sep 2022 11:58:15 +0200 (CEST)
From: philippe.coval@astrolabe.coop
To: openembedded-core@lists.openembedded.org
Cc: philippe.coval.pro+openembedded-core-lists.yoctoproject.org@gmail.com,
	Philippe Coval <philippe.coval@astrolabe.coop>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [openembedded-core][PATCH] graphics: Hotfix for eGalax Touchscreen
Date: Thu, 29 Sep 2022 11:58:13 +0200
Message-Id: <20220929095813.3207562-1-philippe.coval@astrolabe.coop>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 09:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171179

From: Philippe Coval <philippe.coval@astrolabe.coop>

For unsupported screens (which X axis is inverted)

For the record issue was observed with this CVL1010 device:

http://www.cartft.com/en/catalog/il/1589#

For more details check related links:

Forwarded: https://lists.openembedded.org/g/openembedded-core/search?q=3D=
philippe.coval
Relate-to: https://gitlab.freedesktop.org/libinput/libinput/-/issues/665
Relate-to: https://at.projects.genivi.org/jira/si/jira.issueviews:issue-h=
tml/GDP-19/GDP-19.html
Relate-to: https://git.ostc-eu.org/OSTC/planning/blueprints/-/issues/22
Origin: https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge_requests/288
Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
Signed-off-by: Philippe Coval <philippe.coval@astrolabe.coop>
---
 .../wayland/libinput/90-usb-0eef-0001.rules         |  1 +
 meta/recipes-graphics/wayland/libinput_%.bbappend   | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/90-usb-0eef-00=
01.rules
 create mode 100644 meta/recipes-graphics/wayland/libinput_%.bbappend

diff --git a/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rule=
s b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
new file mode 100644
index 0000000000..354629dbbb
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
@@ -0,0 +1 @@
+ACTION=3D=3D"add|change", KERNEL=3D=3D"event[0-9]*", ENV{ID_VENDOR_ID}=3D=
=3D"0eef", ENV{ID_MODEL_ID}=3D=3D"0001", ENV{ID_INPUT_TOUCHSCREEN}=3D"1",=
 ENV{ID_INPUT_TABLET}=3D"0", ENV{ID_INPUT_MOUSE}=3D"0", ENV{LIBINPUT_CALI=
BRATION_MATRIX}=3D"-1 0 1 0 1 0"
diff --git a/meta/recipes-graphics/wayland/libinput_%.bbappend b/meta/rec=
ipes-graphics/wayland/libinput_%.bbappend
new file mode 100644
index 0000000000..281b499624
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput_%.bbappend
@@ -0,0 +1,13 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI +=3D "file://90-usb-0eef-0001.rules"
+
+do_install_append() {
+    install -d  "${D}/${sysconfdir}/udev/rules.d"
+    install -m444 "${WORKDIR}/90-usb-0eef-0001.rules" "${D}/${sysconfdir=
}/udev/rules.d/"
+}
+
+FILES_${PN} +=3D "${sysconfdir}/udev/rules.d/90-usb-0eef-0001.rules"
--=20
2.34.1


