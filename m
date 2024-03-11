Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B81C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.669.1710177550574426040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=qQrvZS6m;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ8ib107338
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177549;
	bh=TZOCIo2HtQHcx0cH7h7khJDa7zS/0r0dXOBR64mXZzI=; l=9117;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qQrvZS6mKNFqMcTN4KRnt6ytIQcnGBm+nSlGD3qURbsZaSwnK8aRTK49tYX96dxYm
	 mt0uBXQY0Rnfixv0TllDchHtYJxiX/d+bfXo1eaD4xbQNHHIUXU0nS1shfl/dyVYdg
	 l+ajtRWZIKX43INW/LhPUIlDy5U9RjSRXI3n96KaH9nmf3nxYUAF5C2luE7HamVZDy
	 krUx3RjYfg1TlGtVpU9NAynfbWXOW4lynLZuNuxEignQq3g6+UvJMzGRiuP3HoE2/C
	 3BHMnLCESqzGjjbBJ5VZNu42B81K+hsXeBzSHWTKBLbeeqqXpSC02Lrnn4LoldMFH1
	 piBpQ3qktwtUA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0Vx279268
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:02 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id E65WEYYM0G; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHIxUb164811
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuJ-0n9u;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/7] openssh: replace complete configuration files by patch
Date: Mon, 11 Mar 2024 18:18:42 +0100
Message-ID: <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef71
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196957

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Instead of shipping the whole configuration files for openssh, add
small patch includes configuration snippets from subdirectories.

This allows us to keep the original upstream configuration which is
mainly useful for documentation purposes.  It makes it more easy to
identify OE specific setup.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../openssh/openssh/include-conf.patch        |  32 +++++
 .../openssh/openssh/ssh_config                |  48 -------
 .../openssh/openssh/sshd_config               | 119 ------------------
 .../openssh/openssh_9.6p1.bb                  |   5 +-
 4 files changed, 33 insertions(+), 171 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/include-conf.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/ssh_config
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_config

diff --git a/meta/recipes-connectivity/openssh/openssh/include-conf.patch b/meta/recipes-connectivity/openssh/openssh/include-conf.patch
new file mode 100644
index 000000000000..3e0bd2957e25
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/include-conf.patch
@@ -0,0 +1,32 @@
+Include configuration snippets from subdirectory.
+
+NOTE: first configuration option wins.
+
+Upstream-Status: Inappropriate
+
+Index: openssh-9.5p1/ssh_config
+===================================================================
+--- openssh-9.5p1.orig/ssh_config
++++ openssh-9.5p1/ssh_config
+@@ -5,6 +5,8 @@
+ # users, and the values can be changed in per-user configuration files
+ # or on the command line.
+ 
++Include /etc/ssh/ssh_config.d/*.conf
++
+ # Configuration data is parsed as follows:
+ #  1. command line options
+ #  2. user-specific file
+Index: openssh-9.5p1/sshd_config
+===================================================================
+--- openssh-9.5p1.orig/sshd_config
++++ openssh-9.5p1/sshd_config
+@@ -10,6 +10,8 @@
+ # possible, but leave them commented.  Uncommented options override the
+ # default value.
+ 
++Include /etc/ssh/sshd_config.d/*.conf
++
+ #Port 22
+ #AddressFamily any
+ #ListenAddress 0.0.0.0
diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
deleted file mode 100644
index cb2774a163ed..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ /dev/null
@@ -1,48 +0,0 @@
-#	$OpenBSD: ssh_config,v 1.35 2020/07/17 03:43:42 dtucker Exp $
-
-# This is the ssh client system-wide configuration file.  See
-# ssh_config(5) for more information.  This file provides defaults for
-# users, and the values can be changed in per-user configuration files
-# or on the command line.
-
-# Configuration data is parsed as follows:
-#  1. command line options
-#  2. user-specific file
-#  3. system-wide file
-# Any configuration value is only changed the first time it is set.
-# Thus, host-specific definitions should be at the beginning of the
-# configuration file, and defaults at the end.
-
-# Site-wide defaults for some commonly used options.  For a comprehensive
-# list of available options, their meanings and defaults, please see the
-# ssh_config(5) man page.
-
-Include /etc/ssh/ssh_config.d/*.conf
-
-# Host *
-#   ForwardAgent no
-#   ForwardX11 no
-#   PasswordAuthentication yes
-#   HostbasedAuthentication no
-#   GSSAPIAuthentication no
-#   GSSAPIDelegateCredentials no
-#   BatchMode no
-#   CheckHostIP yes
-#   AddressFamily any
-#   ConnectTimeout 0
-#   StrictHostKeyChecking ask
-#   IdentityFile ~/.ssh/id_rsa
-#   IdentityFile ~/.ssh/id_dsa
-#   IdentityFile ~/.ssh/id_ecdsa
-#   IdentityFile ~/.ssh/id_ed25519
-#   Port 22
-#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
-#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com
-#   EscapeChar ~
-#   Tunnel no
-#   TunnelDevice any:any
-#   PermitLocalCommand no
-#   VisualHostKey no
-#   ProxyCommand ssh -q -W %h:%p gateway.example.com
-#   RekeyLimit 1G 1h
-#   UserKnownHostsFile ~/.ssh/known_hosts.d/%k
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
deleted file mode 100644
index e9eaf9315775..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ /dev/null
@@ -1,119 +0,0 @@
-#	$OpenBSD: sshd_config,v 1.104 2021/07/02 05:11:21 dtucker Exp $
-
-# This is the sshd server system-wide configuration file.  See
-# sshd_config(5) for more information.
-
-# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin
-
-# The strategy used for options in the default sshd_config shipped with
-# OpenSSH is to specify options with their default value where
-# possible, but leave them commented.  Uncommented options override the
-# default value.
-
-Include /etc/ssh/sshd_config.d/*.conf
-
-#Port 22
-#AddressFamily any
-#ListenAddress 0.0.0.0
-#ListenAddress ::
-
-#HostKey /etc/ssh/ssh_host_rsa_key
-#HostKey /etc/ssh/ssh_host_ecdsa_key
-#HostKey /etc/ssh/ssh_host_ed25519_key
-
-# Ciphers and keying
-#RekeyLimit default none
-
-# Logging
-#SyslogFacility AUTH
-#LogLevel INFO
-
-# Authentication:
-
-#LoginGraceTime 2m
-#PermitRootLogin prohibit-password
-#StrictModes yes
-#MaxAuthTries 6
-#MaxSessions 10
-
-#PubkeyAuthentication yes
-
-# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
-# but this is overridden so installations will only check .ssh/authorized_keys
-AuthorizedKeysFile	.ssh/authorized_keys
-
-#AuthorizedPrincipalsFile none
-
-#AuthorizedKeysCommand none
-#AuthorizedKeysCommandUser nobody
-
-# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
-#HostbasedAuthentication no
-# Change to yes if you don't trust ~/.ssh/known_hosts for
-# HostbasedAuthentication
-#IgnoreUserKnownHosts no
-# Don't read the user's ~/.rhosts and ~/.shosts files
-#IgnoreRhosts yes
-
-# To disable tunneled clear text passwords, change to no here!
-#PasswordAuthentication yes
-#PermitEmptyPasswords no
-
-# Change to yes to enable keyboard-interactive authentication (beware issues
-# with some PAM modules and threads)
-KbdInteractiveAuthentication no
-
-# Kerberos options
-#KerberosAuthentication no
-#KerberosOrLocalPasswd yes
-#KerberosTicketCleanup yes
-#KerberosGetAFSToken no
-
-# GSSAPI options
-#GSSAPIAuthentication no
-#GSSAPICleanupCredentials yes
-
-# Set this to 'yes' to enable PAM authentication, account processing,
-# and session processing. If this is enabled, PAM authentication will
-# be allowed through the KbdInteractiveAuthentication and
-# PasswordAuthentication.  Depending on your PAM configuration,
-# PAM authentication via KbdInteractiveAuthentication may bypass
-# the setting of "PermitRootLogin without-password".
-# If you just want the PAM account and session checks to run without
-# PAM authentication, then enable this but set PasswordAuthentication
-# and KbdInteractiveAuthentication to 'no'.
-#UsePAM no
-
-#AllowAgentForwarding yes
-#AllowTcpForwarding yes
-#GatewayPorts no
-#X11Forwarding no
-#X11DisplayOffset 10
-#X11UseLocalhost yes
-#PermitTTY yes
-#PrintMotd yes
-#PrintLastLog yes
-#TCPKeepAlive yes
-#PermitUserEnvironment no
-Compression no
-ClientAliveInterval 15
-ClientAliveCountMax 4
-#UseDNS no
-#PidFile /var/run/sshd.pid
-#MaxStartups 10:30:100
-#PermitTunnel no
-#ChrootDirectory none
-#VersionAddendum none
-
-# no default banner path
-#Banner none
-
-# override default of no subsystems
-Subsystem	sftp	/usr/libexec/sftp-server
-
-# Example of overriding settings on a per-user basis
-#Match User anoncvs
-#	X11Forwarding no
-#	AllowTcpForwarding no
-#	PermitTTY no
-#	ForceCommand cvs server
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index edd8e8c2d18f..d500ca6019fe 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -12,8 +12,6 @@ DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
-           file://sshd_config \
-           file://ssh_config \
            file://init \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://sshd.service \
@@ -23,6 +21,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://volatiles.99_sshd \
            file://run-ptest \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://include-conf.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
@@ -101,8 +100,6 @@ CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
 do_configure:prepend () {
 	export LD="${CC}"
-	install -m 0644 ${WORKDIR}/sshd_config ${B}/
-	install -m 0644 ${WORKDIR}/ssh_config ${B}/
 }
 
 do_compile_ptest() {
-- 
2.44.0


