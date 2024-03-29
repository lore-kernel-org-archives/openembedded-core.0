Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B180C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 15:24:39 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.1231.1711725871685635256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 08:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 86680D3B5
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 16:24:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.79]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqE5j-0OtkZ70; Fri, 29 Mar 2024 16:24:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: disable mdns feature in resolved for zeroconf
Date: Fri, 29 Mar 2024 16:24:48 +0100
Message-ID: <20240329152448.2218-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711725868-83D879D7-A9DE46BA/0/0 CLEAN NORMAL
X-TOI-MSGID: 55ef46f3-4a28-4941-b6ad-cdb7f10cdf45
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 15:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197637

DISTRO_FEATURE zeroconf installs avahi. If additionally resolved mdns
implementation is running they will fight each other:

Mar 29 13:31:51 intel-corei7-64 avahi-daemon[752]: *** WARNING: Detected =
another IPv4 mDNS stack running on this host. This makes mDNS unreliable =
and is thus not recommended. ***
Mar 29 13:31:51 intel-corei7-64 avahi-daemon[752]: *** WARNING: Detected =
another IPv6 mDNS stack running on this host. This makes mDNS unreliable =
and is thus not recommended. ***

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-co=
re/systemd/systemd_255.4.bb
index b02e44d9c0..8a816c4bc1 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -249,6 +249,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dsystem-alloc-gid-min=3D101 \
                   -Dsystem-gid-max=3D999 \
                   -Dcreate-log-dirs=3Dfalse \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
--=20
2.44.0


