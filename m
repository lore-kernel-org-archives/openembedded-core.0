Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3B77226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:11:00 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i8so5584646qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 13:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+05Dhosisn31fHtSt8tELAj0bgtVivctSGyYumG+2PQ=;
	b=00Pbf2Wym+I7cy/BVBo/lAOW9QchFbc3ogwi82emHzzQvjSSW0ysversb7R+gkTqUa
	i0Mi8WNolLdRlex/GjZQG8bPsLbb462kyTom+6vyKjZYi/tj9eKbtZjSG+7mqBu7UwWx
	0pkgxkuqNqIWu3IGRKeVAAL2aagGpzU5cNszNbD1Y6LK9zCUEeTY2RV8xFTkIOO2Cvgo
	nKxXwKeXpq28lcZ3pAIdYHvV5B6UU6lr+xbLg9h8stgpul8WF2NJWuD9CxL4k0ggMMLe
	XhPoxfEK/7Hxu/6URai37rnflBgcRxEgxD/TFt15+filT1hjD3H1iIplbg5ovU1xdGYh
	bl7g==
MIME-Version: 1.0
X-Received: by 10.224.114.81 with SMTP id d17mr19565902qaq.27.1421356260596;
	Thu, 15 Jan 2015 13:11:00 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Thu, 15 Jan 2015 13:11:00 -0800 (PST)
Date: Thu, 15 Jan 2015 15:11:00 -0600
Message-ID: <CACS+7ZRh2fq0ot_u6U0B+SGq6uCORnj9_B2shfSEunrwhPnH+g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssh: configuration updates
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
X-List-Received-Date: Thu, 15 Jan 2015 21:11:09 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Rebase sshd_config and ssh_config with openssh upstream.
Check for the ed25519 key in the systemd keygen service.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../openssh/openssh/ssh_config                     |  4 ++-
 .../openssh/openssh/sshd_config                    | 30 ++++++++++++++++------
 .../openssh/openssh/sshdgenkeys.service            |  1 +
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config
b/meta/recipes-connectivity/openssh/openssh/ssh_config
index 4a4a649..9e91915 100644
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
@@ -1,4 +1,4 @@
-# $OpenBSD: ssh_config,v 1.25 2009/02/17 01:28:32 djm Exp $
+# $OpenBSD: ssh_config,v 1.28 2013/09/16 11:35:43 sthen Exp $

 # This is the ssh client system-wide configuration file.  See
 # ssh_config(5) for more information.  This file provides defaults for
@@ -44,3 +44,5 @@ Host *
 #   TunnelDevice any:any
 #   PermitLocalCommand no
 #   VisualHostKey no
+#   ProxyCommand ssh -q -W %h:%p gateway.example.com
+#   RekeyLimit 1G 1h
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config
b/meta/recipes-connectivity/openssh/openssh/sshd_config
index 4f9b626..2a45c2b 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -15,9 +15,7 @@
 #ListenAddress 0.0.0.0
 #ListenAddress ::

-# Disable legacy (protocol version 1) support in the server for new
-# installations. In future the default will change to require explicit
-# activation of protocol 1
+# The default requires explicit activation of protocol 1
 Protocol 2

 # HostKey for protocol version 1
@@ -25,11 +23,16 @@ Protocol 2
 # HostKeys for protocol version 2
 #HostKey /etc/ssh/ssh_host_rsa_key
 #HostKey /etc/ssh/ssh_host_dsa_key
+#HostKey /etc/ssh/ssh_host_ecdsa_key
+#HostKey /etc/ssh/ssh_host_ed25519_key

 # Lifetime and size of ephemeral version 1 server key
 #KeyRegenerationInterval 1h
 #ServerKeyBits 1024

+# Ciphers and keying
+#RekeyLimit default none
+
 # Logging
 # obsoletes QuietMode and FascistLogging
 #SyslogFacility AUTH
@@ -45,7 +48,15 @@ Protocol 2

 #RSAAuthentication yes
 #PubkeyAuthentication yes
-#AuthorizedKeysFile .ssh/authorized_keys
+
+# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
+# but this is overridden so installations will only check .ssh/authorized_keys
+AuthorizedKeysFile .ssh/authorized_keys
+
+#AuthorizedPrincipalsFile none
+
+#AuthorizedKeysCommand none
+#AuthorizedKeysCommandUser nobody

 # For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
 #RhostsRSAAuthentication no
@@ -74,8 +85,8 @@ Protocol 2
 #GSSAPIAuthentication no
 #GSSAPICleanupCredentials yes

-# Set this to 'yes' to enable PAM authentication, account processing,
-# and session processing. If this is enabled, PAM authentication will
+# Set this to 'yes' to enable PAM authentication, account processing,
+# and session processing. If this is enabled, PAM authentication will
 # be allowed through the ChallengeResponseAuthentication and
 # PasswordAuthentication.  Depending on your PAM configuration,
 # PAM authentication via ChallengeResponseAuthentication may bypass
@@ -91,20 +102,22 @@ Protocol 2
 #X11Forwarding no
 #X11DisplayOffset 10
 #X11UseLocalhost yes
+#PermitTTY yes
 #PrintMotd yes
 #PrintLastLog yes
 #TCPKeepAlive yes
 #UseLogin no
-UsePrivilegeSeparation yes
+UsePrivilegeSeparation sandbox # Default for new installations.
 #PermitUserEnvironment no
 Compression no
 ClientAliveInterval 15
 ClientAliveCountMax 4
 #UseDNS yes
 #PidFile /var/run/sshd.pid
-#MaxStartups 10
+#MaxStartups 10:30:100
 #PermitTunnel no
 #ChrootDirectory none
+#VersionAddendum none

 # no default banner path
 #Banner none
@@ -116,4 +129,5 @@ Subsystem sftp /usr/libexec/sftp-server
 #Match User anoncvs
 # X11Forwarding no
 # AllowTcpForwarding no
+# PermitTTY no
 # ForceCommand cvs server
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index c21d70b..d65086f 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -3,6 +3,7 @@ Description=OpenSSH Key Generation
 ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
 ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
 ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key

 [Service]
 ExecStart=@BINDIR@/ssh-keygen -A
-- 
2.1.0

