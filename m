Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175B4C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 09:00:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.12942.1719565222990595246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 02:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=NBV6y5dp;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.216.54, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c8dccd0fa9so248648a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1719565222; x=1720170022; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ/AFKf9tfGJFvvn+wJsd6Z06ujY/mAXlCD+X1n5+8M=;
        b=NBV6y5dp8ZnUw7kE/VHaAt/qYrZ9+VRV3NIMM3QofQ0nG3ar/MuTGojQVUIZnx4eBR
         3rd6cTZocyKbTG0yiUUmk3kSCYCbGoJCqKB7oqaHk1saPkHCkfxftueYVagpgaPW/8Cw
         9Upk1B9QkXAs9gX2ZJIKV0JAXWzIwB1d3EUF7hcKNGD5VpkIug/9xO8ghs80j38+EvoO
         r9E8uUfZXZptzl5WlRSDwcT396HcKVvvvV3ajsUUXcY7xDpdbn2pLJBKBnGVDOQlLfIb
         v+T0IWpKlBj4xDistITleFBQ7i4R97Xt/v3aNekYtrH10FRMPoygDRwHD85ncBuN5liM
         Ytag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565222; x=1720170022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ/AFKf9tfGJFvvn+wJsd6Z06ujY/mAXlCD+X1n5+8M=;
        b=gxLd+q49Esq1fpi7w9ytX6Up05jmP52/WJGahLm7VqOC8aR+Rxu7g6n/EYpWGOzynI
         cHY4iZBAt5Y3rWMH42XnS/GqV1ulXSFrQpe7N+E8H2QQdpJbwNCBzhMXlgY3P7loRM7l
         5tJPnzGbukW4kHaxKOnZY6xMpmljUxofs8+d1Q6jVbtGQyqGl8bg7M6G3gpz5pPXbsLP
         ORSIyodfsoPnDDRiemPcAUgIutDOr0BssBmnOPAvLhK81W9eLicBU7Op1xm08G6LaHj/
         Y1hBIn+4HkvcPLJDiTvfaLzCIiZ3Bd095VQ5XdJe/ELwoiet1RNw3dO3U4Jje840kSyD
         lbgg==
X-Gm-Message-State: AOJu0YxHuDjSu0OTZvbEYkH6uDml/C3ulJVED/8CUNe70XKeQuGVrb7k
	YMgtD3cpStMSVLo/eAE41bono9HDCgpyVqvJDddIpczuj+qdTvxrh4izScE8N6+FFTggYfZzkEO
	PyyDLkzO56w09JL9ZSrQuZ7W89bxe2UsVDVjd3w==
X-Google-Smtp-Source: AGHT+IEewjzTNPFhZpmwWx57J6M95ftselSBmO1teda6aPa3lwwrKbiOvgveq4sPd7/0Guuq2Ox8H4+a7dpmjNOyqxk=
X-Received: by 2002:a17:90a:d0c4:b0:2c8:858:812a with SMTP id
 98e67ed59e1d1-2c86146d1f5mr13336846a91.38.1719565222271; Fri, 28 Jun 2024
 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240627131557.2047296-1-mbullock@thegoodpenguin.co.uk>
In-Reply-To: <20240627131557.2047296-1-mbullock@thegoodpenguin.co.uk>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Fri, 28 Jun 2024 10:00:11 +0100
Message-ID: <CALqELGztivwR0eX3+fDKHNMbJzKR2d7LWuUKFK+ySiQXSWUTaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: allow configuration of hostkey type
To: mbullock@thegoodpenguin.co.uk
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 09:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201220

On Thu, 27 Jun 2024 at 14:19, Matthew Bullock via
lists.openembedded.org
<mbullock=thegoodpenguin.co.uk@lists.openembedded.org> wrote:
>
> Allow selection of host key types used by openssh via PACKAGECONFIG.
> Any combination of hostkey-rsa, hostkey-ecdsa and hostkey-ed25519 can be
> specified. Default to just generating ecdsa keys.
>
> The current default generates all three keys. This can take a
> significant amount of time on first boot. Having all three keys does not
> significantly increase compatability. Also RSA keys are being deprecated
> as they are no longer considered secure. Using just an ecdsa key reduces
> key generation time by roughly 75%.
>
> Signed-off-by: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
> ---
>  .../openssh/openssh_9.7p1.bb                  | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> index ab453f7bbe..0bc14c5553 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> @@ -56,7 +56,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
>
>  # systemd-sshd-socket-mode means installing sshd.socket
>  # and systemd-sshd-service-mode corresponding to sshd.service
> -PACKAGECONFIG ??= "systemd-sshd-socket-mode"
> +PACKAGECONFIG ??= "systemd-sshd-socket-mode hostkey-ecdsa"
>  PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
> @@ -64,6 +64,9 @@ PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>  PACKAGECONFIG[systemd-sshd-socket-mode] = ""
>  PACKAGECONFIG[systemd-sshd-service-mode] = ""
> +PACKAGECONFIG[hostkey-rsa] = ""
> +PACKAGECONFIG[hostkey-ecdsa] = ""
> +PACKAGECONFIG[hostkey-ed25519] = ""
>
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>
> @@ -127,13 +130,31 @@ do_install:append () {
>         install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
>         install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
>
> +        # Enable specific ssh host keys
> +       sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
> +           echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
> +           echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
> +           echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +
>         # Create config files for read-only rootfs
>         install -d ${D}${sysconfdir}/ssh
>         install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
>         sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
> -       echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> -       echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> -       echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
> +           echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
> +           echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi
> +       if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
> +           echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi
>
>         install -d ${D}${systemd_system_unitdir}
>         if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
> --
> 2.43.0
>

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Thanks,

Andrew Murray

