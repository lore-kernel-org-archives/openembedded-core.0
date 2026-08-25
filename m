Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA344C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:21:34 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15335.1787635287787011865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 22:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Oacsngzw;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2202; q=dns/txt;
  s=iport01; t=1787635287; x=1788844887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eFECTAYGtPJCzMLlBcUA3t0ZrwjdNCBnhXg7x2S2Kok=;
  b=Oacsngzw5ZCpQyuadxw30JvdtpCYRy2bzSJqH5ha62rVRU/C0HvnMdfE
   CP+hynkRYsyD/S0Pp5w2JjYvUsJLweFW4LkUFrKwFud0+dj7PmoNrU9ft
   4Gr/0ib4RY1GIkMVV2psP5j/ZY9uuGYXGnObkaaCq06mLsx9sx2HDBb1j
   3qz3dqo6u6am43K+W38NmYrsp2i8jlYzVr8Ew9PqE5DRpjSHacQD2WqE2
   nuDAva57gR7LfN3T20sVwvMCZNvr3Oq9Hg2WPhV/sokR0FG/kaG6l/7OK
   Q8wDo+xNG6a7PiUA5JrEJ8EkkZeVc2YWIZUY10WsFwZG7dCjsFEUimYY7
   w==;
X-CSE-ConnectionGUID: lLYAOew8QvaCcx5ExaGa1Q==
X-CSE-MsgGUID: 3Tlx0YDFQEGPMTPtbmR5Yw==
X-IPAS-Result: =?us-ascii?q?A0A/AgCQJY1q/4wQJK1aHgEBCxIMggULgld0X0JJlkqeH?=
 =?us-ascii?q?oF+DwEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXTYBRoEMRIMCAYJ0AgG+VYIsgQHeR4FmAQsUAQWBM4Vxh?=
 =?us-ascii?q?3CFcicbgUlEhH6FEIV4BIMugXhQgRqPc0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQ?=
 =?us-ascii?q?w4HRyILGA1IESw3FBkEPm4Hjl0fgkwBgQ6CAgMQHJM3OJItoQ+EKIFmijyVO?=
 =?us-ascii?q?hozhVulEZkIpFqEaYFoPIFZTSMVgyIJShkPjl+KFMVpJDU9AgcCBw4DC5NmA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:A4oTWq++x2sRfCV41GRVDrUD/H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GIZXD/QbPuOZmXzfd8jbNixoEkAvMLTzNNjSlFtrStEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kyGbwx3etoUVhQ/
 NcTOG0gfhmsjruPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tPyoh3/ieD1RgFmUvqEwpWPUyWSd1ZC9aYWIII3WG5s9ckCw/
 V7C7zzILj8jGfOn7Aa97nipvLL+gnauMG4VPPjinhJwu3WJx2cTAQcaE0Omu/W4h2a6WtRCO
 0IT5ywipLQz80rtScPyNzW/uHOCsxsWVtZcHuF/4waXx4LQ4h2FHS4DVjNHZdksucM6SDBs0
 UWG9+4FHhRmtLmTDHbY/bCOoHbqYm4eLHQJYmkPSg5tD8TfnbzfRynnFr5LeJNZRPWuR2GYL
 +yixMTmu4gusA==
IronPort-HdrOrdr: A9a23:FafhlaFD2s2mAidnpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Ai4YI9GkTZg/6lHD4GiTqHDZdFxTXOXn5/V73LlD?=
 =?us-ascii?q?oMHhgY7aFFHKA8YxtyvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A8/uypA4zcAdJfrMTCythhEF5xowz36C+UHEhv6w?=
 =?us-ascii?q?rlPGhCRRsMTKn0QWoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="817529466"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 05:20:55 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id CF48618000420;
	Tue, 25 Aug 2026 05:20:54 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 6F45BCCD9AB; Mon, 24 Aug 2026 22:20:54 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [scarthgap] [PATCH] initscripts: avoid service dependency in mountnfs.sh
Date: Mon, 24 Aug 2026 22:20:51 -0700
Message-Id: <20260825052051.2023677-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244191

mountnfs.sh uses "service rpcbind status" only to avoid
starting rpcbind twice before mounting remote filesystems. That
pulls init-system-helpers-service into images solely to provide
/usr/sbin/service.

Use start-stop-daemon test mode for the rpcbind status check
instead. The script already uses start-stop-daemon to start rpcbind,
so this keeps the duplicate-start protection without requiring the
Debian service wrapper.

With mountnfs.sh no longer invoking service, drop
init-system-helpers-service from the initscripts runtime dependencies.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 3 +--
 meta/recipes-core/initscripts/initscripts_1.0.bb          | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index c08597e725..53c6cfd457 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -71,8 +71,7 @@ if test "$rpcbind" = yes
 then
 	if test -x /usr/sbin/rpcbind
 	then
-		service rpcbind status > /dev/null
-		if [ $? != 0 ]; then
+		if ! start-stop-daemon --stop --test --quiet --exec /usr/sbin/rpcbind; then
 			echo -n "Starting rpcbind..."
 			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
 			sleep 2
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 56ee65ac5b..fbaf7d51cd 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -48,7 +48,6 @@ PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
-                  init-system-helpers-service \
 		 "
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
-- 
2.35.6


