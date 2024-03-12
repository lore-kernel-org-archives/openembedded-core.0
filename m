Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE30C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:10:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8682.1710249024184091480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCoCkVX/;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513c1434283so557456e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710249022; x=1710853822; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=73FCMsHWy295HLG5cI3A8aRCtcunnjoKB7/xjVmbc2I=;
        b=lCoCkVX/S0JBI2sGlL0QIfkDh0jDw09CSAA/XkSWonmTohEDc+alqLoqX0uJVyF6bw
         uhEzvOifqtSXA51v7zFImMw94aIbePTFjPao2keeMCi5tPLF6K742uLDQpmbN/N94Uh3
         PkNaNnyjsEHgNPGjP1vL7y4WAdr1J8FU6xOF3hIQ9NW+gBjZxAjYa3lRnbNCDaRvvnOQ
         CQpKRI+0REh0E1x0izzy4q4pe5wt29KNS1/CcTpphZb5PnVuFVWQ/TvZIFIDzCBoUkzD
         JP/vliYq+cE8iBHPSsRduveUFQdiqBhOqEs29TbWW5I3LvjAZWi2RZMgvst4Hy7FDVDV
         UvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249022; x=1710853822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73FCMsHWy295HLG5cI3A8aRCtcunnjoKB7/xjVmbc2I=;
        b=YdUtP+FL/0Gn5Sl4Nant+BCNu4Eapip+i3KLZD/Twq0R2fixzlsczweh9d3nTGSpkl
         aobptKQL+X6BATVcbjEqN2d4HMpXrTmTnnnHIhGdN9vy6uiwwAPvxSxWyHJ7Qoi1AeYx
         7z/ZMVWXq1EBMrg9Q5AEDZPg8AMxpLhcNlixtXOij9EZLEWILnTFradjL5xhA2J2WrYH
         KdaQ/FMxXVjST31WIG3nTjFhd7QyeReSBFTvBSMvW9xUWK7xXzc6hyM0s0tG9DqEe2Ob
         kqiRNDt89QNTbOTmZD1p6QP+JyWl+piz83rgTdjNkfvb2IF3gfGgvCMYQfhaZnxPKkGB
         I75A==
X-Gm-Message-State: AOJu0Yzff/LpOQXo1wLNwC2p+W3Ko9thXqRrjL0lPtBA5xS/3FEv1ClE
	VM61xn09tmAni1IcSAlmmjjFltWeouHHlIghUxWkXzjVD4bpkKvWfxCZ4H+8OEXUlSbJsgCmceJ
	UIoEbcuMEqne9sLgfT9WizPwhoaY=
X-Google-Smtp-Source: AGHT+IFd1hMgqBx6Stxedwh5qd2sK+RvXr2UWiIoMD1YFgfvMbm9ZE/niAuwE9ahP87HbB0IUBTHsxt50c9bAIFVYNs=
X-Received: by 2002:a19:e00d:0:b0:513:c1a8:2959 with SMTP id
 x13-20020a19e00d000000b00513c1a82959mr1067520lfg.30.1710249021814; Tue, 12
 Mar 2024 06:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710241040.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710241040.git.enrico.scholz@sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Mar 2024 14:10:09 +0100
Message-ID: <CANNYZj9NGCR8-R5+9LaE-etEBmx2VnYE+ecQY_Jtq4DbT4mFYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7, v3] openssh: replace complete configuration
 files by patch
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196978

Why is the patch inappropriate for upstream submission? To me it looks
like it should be at least proposed.

Alex

On Tue, 12 Mar 2024 at 12:00, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
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
> -#      $OpenBSD: ssh_config,v 1.35 2020/07/17 03:43:42 dtucker Exp $
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
> -#      $OpenBSD: sshd_config,v 1.104 2021/07/02 05:11:21 dtucker Exp $
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
> -AuthorizedKeysFile     .ssh/authorized_keys
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
> -Subsystem      sftp    /usr/libexec/sftp-server
> -
> -# Example of overriding settings on a per-user basis
> -#Match User anoncvs
> -#      X11Forwarding no
> -#      AllowTcpForwarding no
> -#      PermitTTY no
> -#      ForceCommand cvs server
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
>         export LD="${CC}"
> -       install -m 0644 ${WORKDIR}/sshd_config ${B}/
> -       install -m 0644 ${WORKDIR}/ssh_config ${B}/
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
> Mute This Topic: https://lists.openembedded.org/mt/104882201/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

