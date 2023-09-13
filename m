Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E06EE01F5
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:32:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3267.1694626370597626012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C5F1FB;
	Wed, 13 Sep 2023 10:33:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B87A3F5A1;
	Wed, 13 Sep 2023 10:32:49 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] testimage: respect target/server IPs when using slirp
Date: Wed, 13 Sep 2023 18:32:41 +0100
Message-Id: <20230913173241.1253965-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187618

From: Ross Burton <ross.burton@arm.com>

We can't hardcode these IPs when using slirp.

The target IP will need a port to be specified as this controls what port
the SSH connection uses, and when slirp is used it can't bind to port
22. The qemu runner (OEQemuTarget) assumes that the first port forward
is the SSH forward, but this may be wrong or a different target may be
used.

The server IP depends on how the virtual networking is configured.
runqemu defaults to 10.0.2.x for the guests so that is a wise default,
but that may be configured differently.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testimage.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 73409967887..8a944f58098 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -370,9 +370,12 @@ def testimage_main(d):
     export_proxies(d)
=20
     if slirp:
-        target_ip =3D "127.0.0.1"
-        # from qemu target to host with default DHCP server
-        server_ip =3D "10.0.2.2"
+        # Default to 127.0.0.1 and let the runner identify the port forw=
arding
+        # (as OEQemuTarget does), but allow overriding.
+        target_ip =3D d.getVar("TEST_TARGET_IP") or "127.0.0.1"
+        # Default to 10.0.2.2 as this is the IP that the guest has with =
the
+        # default qemu slirp networking configuration, but allow overrid=
ing.
+        server_ip =3D d.getVar("TEST_SERVER_IP") or "10.0.2.2"
     else:
         target_ip =3D d.getVar("TEST_TARGET_IP")
         server_ip =3D d.getVar("TEST_SERVER_IP")
--=20
2.34.1


