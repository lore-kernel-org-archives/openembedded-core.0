Return-Path: <pazhukov@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C4DC77B76
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 13:29:23 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by mx.groups.io with SMTP id smtpd.web11.8803.1681824561971746426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 06:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@suse.de header.s=susede2_rsa header.b=rrXMcPJd;
 spf=pass (domain: suse.de, ip: 195.135.220.29, mailfrom: pazhukov@suse.de)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E89CB1F8D5;
	Tue, 18 Apr 2023 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681824559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rTbRrP7dvujzFWQgNfr/Beh15H7FnUjQ0WsoODPITfQ=;
	b=rrXMcPJdte9YhjCp9k3fUdFW4xXpnOJiY7yPpWcDMws76WIlMc9G2u2FJnk6FcFy7ocuNv
	XzZXZtrBe/2d+i6ikVXx5DcwzR7YK4e0bCnv99mk+u/VJFGqORQf/35efWEEt3Uo1jZh+3
	5F1hJbbP0Y5aMgLRaMMgUFNMpOxZjXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681824559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rTbRrP7dvujzFWQgNfr/Beh15H7FnUjQ0WsoODPITfQ=;
	b=Dz7LKm6hTg6bObHfauZlshjwbO7RfBMrGKROmLnztRdvA+8Dod4UadS35kuJYg0J7wA+io
	+vA11vJgwtMnIPCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1B0413581;
	Tue, 18 Apr 2023 13:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Kp8RKS+bPmRPOAAAMHmgww
	(envelope-from <pazhukov@suse.de>); Tue, 18 Apr 2023 13:29:19 +0000
From: Pavel Zhukov <pazhukov@suse.de>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pazhukov@suse.de>,
	pavel@zhukoff.net
Subject: [PATCH] scripts/runqemu: Add possibility to disable network
Date: Tue, 18 Apr 2023 15:29:36 +0200
Message-Id: <20230418132936.3860394-1-pazhukov@suse.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 13:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180188

Default network configuration requires tun/tap module and while being
usable it conflicts with tap devices created by VPN clients sometimes
and requires root permissions to use . While it's possible to work
this around it's not always feasible if network is not required
Add nonetwork option which can be specified if the network connectivity i=
s
not needed and SDL/serial is enough to communicate with the image.

Signed-off-by: Pavel Zhukov <pazhukov@suse.de>
---
 scripts/runqemu | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4c06cefbff..f953891c9d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -66,6 +66,7 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filenam=
e if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    nonetwork - disable network connectivity
     novga - Disable VGA emulation completely
     sdl - choose the SDL UI frontend
     gtk - choose the Gtk UI frontend
@@ -178,6 +179,7 @@ class BaseConfig(object):
         self.serialconsole =3D False
         self.serialstdio =3D False
         self.nographic =3D False
+        self.nonetwork =3D False
         self.sdl =3D False
         self.gtk =3D False
         self.gl =3D False
@@ -495,6 +497,8 @@ to your build configuration.
                 self.check_arg_fstype(arg)
             elif arg =3D=3D 'nographic':
                 self.nographic =3D True
+            elif arg =3D=3D "nonetwork":
+                self.nonetwork =3D True
             elif arg =3D=3D 'sdl':
                 self.sdl =3D True
             elif arg =3D=3D 'gtk':
@@ -1223,6 +1227,10 @@ to your build configuration.
=20
         self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('=
@MAC@', mac), qemu_tap_opt))
=20
+    def setup_nonetwork(self):
+        self.set('NETWORK_CMD', '-nic none')
+        return
+
     def setup_network(self):
         if self.get('QB_NET') =3D=3D 'none':
             return
@@ -1717,7 +1725,10 @@ def main():
         # Check whether the combos is valid or not
         config.validate_combos()
         config.print_config()
-        config.setup_network()
+        if config.nonetwork:
+            config.setup_nonetwork()
+        else:
+            config.setup_network()
         config.setup_rootfs()
         config.setup_final()
         config.setup_cmd()
--=20
2.39.2


