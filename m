Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 92BF761013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 14:16:58 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so8089003wes.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 07:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=onxv7N8Gk0rtzJO/t+IsNVeACcrk814B4UzUQEWbF8o=;
	b=cfqVBxPRx3IKBjo0sPSj3qq5NVvkGHW4W1+X40bo2WZU7wjYgLxh1TpcvSApi5m1Ew
	lUGGB6jWq0l7B+yamNbHYppXssy3YmMuHm8/pZzQc+tsujujhsgSlj00iinZmFeZ91/5
	J4EWenyBqqmN9h9VOg537P/yhnqK9uod0mqtNtusNcZOnS6F3lTTtZXb5xIzEW9ZwfJ9
	+YR7tDLsvv48L1lMBIiEx/MbReZmXeXEqQ81PSD3XmFN9lTCJvr/ljkH7fLZvi3d74D4
	+BhSC8rrqhP3WBzGusCshV+sRKxPK6QBUSR4wHgp8oh6xgdy5MF1zGWQ9qPMxWxvrWzE
	YTfw==
X-Gm-Message-State: ALoCoQnsWOTzo/iW4pourqWiITl+0DLFEq1jV4ii1UjwGEyoKyhvMbvOe/KoeSQ2k74pgp31biDr
X-Received: by 10.194.94.10 with SMTP id cy10mr520043wjb.66.1379600219723;
	Thu, 19 Sep 2013 07:16:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	iz19sm10146315wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 07:16:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 15:16:55 +0100
Message-Id: <1379600215-31559-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] x11vnc: respect zeroconf DISTRO_FEATURE to enable Avahi support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2013 14:16:58 -0000

There's a standard way of announcing VNC services over mDNS that x11vnc
supports, so respect the feature and enable/disable it.

Also re-order the statements and drop the redundant PR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 0abc84a..24c42d1 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -7,10 +7,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
                     file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
 
-DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib libxfixes libxrandr libxdamage libxtst"
-
-PR = "r0"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
            file://starting-fix.patch \
            file://endian-fix.patch "
@@ -18,5 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
+DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
+
 inherit autotools
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
-- 
1.7.10.4


