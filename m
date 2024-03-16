Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5317DC54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 23:59:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9443.1710633537421003828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Mar 2024 16:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eZUiApQx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38BA91BF203;
	Sat, 16 Mar 2024 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710633535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dWE42M2yQbUTE6WgH6WzDnVBWuIKkudQy/VcOdXJ9HE=;
	b=eZUiApQxUUrFGzA+kM1liDskMGMjlNnwoIF7VtG6hYez40hRDr+Z6davna5Fog0R/MgsZz
	M49e4+xqgfXHcwik6HK545sjSAYsW5fclO7KtFC8kZ+GH7MnEgC7qW7rMZhFIpu2Z5AO0b
	itw7bN8XbUV0S3SQtUgpbLXMSKpZg2JHB1pelEGGdNmCSh9nhVa38nlnIbu2MShn+q4bxq
	3K0+hfG5RN01Ee+0T0LStR88EhKSAnKDPS3VZKu9fPBFVByRGqysksXyMAL5CqZsNVSkSx
	7CXpz1mJ8fPpvET0Ji2j7easwWC1aYmjEXH+ua2ZL20jK7n7xZVqVYhEGJ+mag==
Date: Sun, 17 Mar 2024 00:58:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/7, v3] openssh: replace complete
 configuration files by patch
Message-ID: <20240316235854139fc1b5@mail.local>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710241040.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710241040.git.enrico.scholz@sigma-chemnitz.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 23:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197257

Please always resend the whole series, the maintainer should have to go
and cherry pick patches from various versions once the series has been
dropped.

On 12/03/2024 12:00:21+0100, Enrico Scholz via lists.openembedded.org wrote:
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> 
> Instead of shipping the whole configuration files for openssh, add
> small patch includes configuration snippets from subdirectories.
> 
> This allows us to keep the original upstream configuration which is
> mainly useful for documentation purposes.  It makes it more easy to
> identify OE specific setup.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  .../openssh/openssh/include-conf.patch        |  34 +++++
>  .../openssh/openssh/ssh_config                |  48 -------
>  .../openssh/openssh/sshd_config               | 119 ------------------
>  .../openssh/openssh_9.6p1.bb                  |   5 +-
>  4 files changed, 35 insertions(+), 171 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/include-conf.patch
>  delete mode 100644 meta/recipes-connectivity/openssh/openssh/ssh_config
>  delete mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_config
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/include-conf.patch b/meta/recipes-connectivity/openssh/openssh/include-conf.patch
> new file mode 100644
> index 000000000000..0a3f6839f838
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/include-conf.patch
> @@ -0,0 +1,34 @@
> +Include configuration snippets from subdirectory.
> +
> +NOTE: first configuration option wins.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> +
> +Index: openssh-9.5p1/ssh_config
> +===================================================================
> +--- openssh-9.5p1.orig/ssh_config
> ++++ openssh-9.5p1/ssh_config
> +@@ -5,6 +5,8 @@
> + # users, and the values can be changed in per-user configuration files
> + # or on the command line.
> +
> ++Include /etc/ssh/ssh_config.d/*.conf
> ++
> + # Configuration data is parsed as follows:
> + #  1. command line options
> + #  2. user-specific file
> +Index: openssh-9.5p1/sshd_config
> +===================================================================
> +--- openssh-9.5p1.orig/sshd_config
> ++++ openssh-9.5p1/sshd_config
> +@@ -10,6 +10,8 @@
> + # possible, but leave them commented.  Uncommented options override the
> + # default value.
> +
> ++Include /etc/ssh/sshd_config.d/*.conf
> ++
> + #Port 22
> + #AddressFamily any
> + #ListenAddress 0.0.0.0
> diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
> deleted file mode 100644
> index cb2774a163ed..000000000000
> --- a/meta/recipes-connectivity/openssh/openssh/ssh_config
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -#	$OpenBSD: ssh_config,v 1.35 2020/07/17 03:43:42 dtucker Exp $
> -
> -# This is the ssh client system-wide configuration file.  See
> -# ssh_config(5) for more information.  This file provides defaults for
> -# users, and the values can be changed in per-user configuration files
> -# or on the command line.
> -
> -# Configuration data is parsed as follows:
> -#  1. command line options
> -#  2. user-specific file
> -#  3. system-wide file
> -# Any configuration value is only changed the first time it is set.
> -# Thus, host-specific definitions should be at the beginning of the
> -# configuration file, and defaults at the end.
> -
> -# Site-wide defaults for some commonly used options.  For a comprehensive
> -# list of available options, their meanings and defaults, please see the
> -# ssh_config(5) man page.
> -
> -Include /etc/ssh/ssh_config.d/*.conf
> -
> -# Host *
> -#   ForwardAgent no
> -#   ForwardX11 no
> -#   PasswordAuthentication yes
> -#   HostbasedAuthentication no
> -#   GSSAPIAuthentication no
> -#   GSSAPIDelegateCredentials no
> -#   BatchMode no
> -#   CheckHostIP yes
> -#   AddressFamily any
> -#   ConnectTimeout 0
> -#   StrictHostKeyChecking ask
> -#   IdentityFile ~/.ssh/id_rsa
> -#   IdentityFile ~/.ssh/id_dsa
> -#   IdentityFile ~/.ssh/id_ecdsa
> -#   IdentityFile ~/.ssh/id_ed25519
> -#   Port 22
> -#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
> -#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com
> -#   EscapeChar ~
> -#   Tunnel no
> -#   TunnelDevice any:any
> -#   PermitLocalCommand no
> -#   VisualHostKey no
> -#   ProxyCommand ssh -q -W %h:%p gateway.example.com
> -#   RekeyLimit 1G 1h
> -#   UserKnownHostsFile ~/.ssh/known_hosts.d/%k
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
> deleted file mode 100644
> index e9eaf9315775..000000000000
> --- a/meta/recipes-connectivity/openssh/openssh/sshd_config
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -#	$OpenBSD: sshd_config,v 1.104 2021/07/02 05:11:21 dtucker Exp $
> -
> -# This is the sshd server system-wide configuration file.  See
> -# sshd_config(5) for more information.
> -
> -# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin
> -
> -# The strategy used for options in the default sshd_config shipped with
> -# OpenSSH is to specify options with their default value where
> -# possible, but leave them commented.  Uncommented options override the
> -# default value.
> -
> -Include /etc/ssh/sshd_config.d/*.conf
> -
> -#Port 22
> -#AddressFamily any
> -#ListenAddress 0.0.0.0
> -#ListenAddress ::
> -
> -#HostKey /etc/ssh/ssh_host_rsa_key
> -#HostKey /etc/ssh/ssh_host_ecdsa_key
> -#HostKey /etc/ssh/ssh_host_ed25519_key
> -
> -# Ciphers and keying
> -#RekeyLimit default none
> -
> -# Logging
> -#SyslogFacility AUTH
> -#LogLevel INFO
> -
> -# Authentication:
> -
> -#LoginGraceTime 2m
> -#PermitRootLogin prohibit-password
> -#StrictModes yes
> -#MaxAuthTries 6
> -#MaxSessions 10
> -
> -#PubkeyAuthentication yes
> -
> -# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
> -# but this is overridden so installations will only check .ssh/authorized_keys
> -AuthorizedKeysFile	.ssh/authorized_keys
> -
> -#AuthorizedPrincipalsFile none
> -
> -#AuthorizedKeysCommand none
> -#AuthorizedKeysCommandUser nobody
> -
> -# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
> -#HostbasedAuthentication no
> -# Change to yes if you don't trust ~/.ssh/known_hosts for
> -# HostbasedAuthentication
> -#IgnoreUserKnownHosts no
> -# Don't read the user's ~/.rhosts and ~/.shosts files
> -#IgnoreRhosts yes
> -
> -# To disable tunneled clear text passwords, change to no here!
> -#PasswordAuthentication yes
> -#PermitEmptyPasswords no
> -
> -# Change to yes to enable keyboard-interactive authentication (beware issues
> -# with some PAM modules and threads)
> -KbdInteractiveAuthentication no
> -
> -# Kerberos options
> -#KerberosAuthentication no
> -#KerberosOrLocalPasswd yes
> -#KerberosTicketCleanup yes
> -#KerberosGetAFSToken no
> -
> -# GSSAPI options
> -#GSSAPIAuthentication no
> -#GSSAPICleanupCredentials yes
> -
> -# Set this to 'yes' to enable PAM authentication, account processing,
> -# and session processing. If this is enabled, PAM authentication will
> -# be allowed through the KbdInteractiveAuthentication and
> -# PasswordAuthentication.  Depending on your PAM configuration,
> -# PAM authentication via KbdInteractiveAuthentication may bypass
> -# the setting of "PermitRootLogin without-password".
> -# If you just want the PAM account and session checks to run without
> -# PAM authentication, then enable this but set PasswordAuthentication
> -# and KbdInteractiveAuthentication to 'no'.
> -#UsePAM no
> -
> -#AllowAgentForwarding yes
> -#AllowTcpForwarding yes
> -#GatewayPorts no
> -#X11Forwarding no
> -#X11DisplayOffset 10
> -#X11UseLocalhost yes
> -#PermitTTY yes
> -#PrintMotd yes
> -#PrintLastLog yes
> -#TCPKeepAlive yes
> -#PermitUserEnvironment no
> -Compression no
> -ClientAliveInterval 15
> -ClientAliveCountMax 4
> -#UseDNS no
> -#PidFile /var/run/sshd.pid
> -#MaxStartups 10:30:100
> -#PermitTunnel no
> -#ChrootDirectory none
> -#VersionAddendum none
> -
> -# no default banner path
> -#Banner none
> -
> -# override default of no subsystems
> -Subsystem	sftp	/usr/libexec/sftp-server
> -
> -# Example of overriding settings on a per-user basis
> -#Match User anoncvs
> -#	X11Forwarding no
> -#	AllowTcpForwarding no
> -#	PermitTTY no
> -#	ForceCommand cvs server
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> index edd8e8c2d18f..d500ca6019fe 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -12,8 +12,6 @@ DEPENDS = "zlib openssl virtual/crypt"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
>  SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
> -           file://sshd_config \
> -           file://ssh_config \
>             file://init \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
>             file://sshd.service \
> @@ -23,6 +21,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://volatiles.99_sshd \
>             file://run-ptest \
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
> +           file://include-conf.patch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
>             file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> @@ -101,8 +100,6 @@ CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
>  
>  do_configure:prepend () {
>  	export LD="${CC}"
> -	install -m 0644 ${WORKDIR}/sshd_config ${B}/
> -	install -m 0644 ${WORKDIR}/ssh_config ${B}/
>  }
>  
>  do_compile_ptest() {
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196975): https://lists.openembedded.org/g/openembedded-core/message/196975
> Mute This Topic: https://lists.openembedded.org/mt/104882201/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

