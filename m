Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6772260766
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 18:02:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id d127so1101556wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97wiMuxwbXECF4YiURblHim8J1AnaqhjPwO9lPhb5bw=;
	b=qTyX3pewxbRxpsi7NFZGjUB8Odg9J/46lLFLWv2yAJYOheAW/2zQTQKb5C8tw4mRSc
	FSWZrTCdf4P5XoUFkCwFkdP4QHP75RCQeL6uU3WAWAMMdtis3Z02T0TjmKURXS2xldaG
	BZ1SC9cNTCSWy7FBFfdqUy+6giOJFf7Pra3CZLpCv55FAB/+50agM2pdH2iSdPUPOy15
	7O6aexod0iP0cJEIwGWvhgdpMFU7LRW8oZQKP0yHOjAygoi8oEzhqzyrixUPa/hDGqaW
	QZgZn2zry/mKo7OVrbMKozfHhOe3A2stXiPJWT77KzGhoLBaQxvpfRAw938wxfYbbH/R
	H/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97wiMuxwbXECF4YiURblHim8J1AnaqhjPwO9lPhb5bw=;
	b=CNxwUyKs2MySHnfqMIDuG0Z2vF6vkgx1oy/mu3rIsTiuvrwXCh9EN414utCw/eU0Ph
	yvnA4Nc1kHucvZtzPp+qO9mT8NwlpKRbOBOZ+Z4GTCg4S0wTS1n0uhOLichEFAXe8F8y
	FfS5UEJ8ew4L/INiZ1tuO6SB9TMcM/1h6wdxNO/7nOyEJ9OPUL6vjjz1FH3N4lCtYvdE
	s8Dg05YM32HYMajJtAYgXn7vS6UT6ewfsUZbO1x9xnedaKzgLaXuxha8S0QFfX1intQq
	HvLDywjYVrxe5HCpCI8heC2oc0G87TVTScEP8vrKfa/aHa7Lz7FPmW/NALj9R1DBw0M6
	R3ng==
X-Gm-Message-State: AODbwcCTJ7Urkp2gzmEalXdLBL/lgx+aft61tapeTE5UXz8s74FNLRpr
	jFv8nFkqduB1x0ASm+KL9YPSrHllTQ==
X-Received: by 10.28.30.199 with SMTP id e190mr13482879wme.96.1495821772744;
	Fri, 26 May 2017 11:02:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.18 with HTTP; Fri, 26 May 2017 11:02:52 -0700 (PDT)
In-Reply-To: <20170526015202.13469-1-JPEWhacker@gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170526015202.13469-1-JPEWhacker@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 26 May 2017 11:02:52 -0700
Message-ID: <CAJ86T=UEeMp_tjo4Nd3Jt5MxWcYmL7dRCHmEAamJdWjH5r6h2g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] openssh: Atomically generate host keys
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
X-List-Received-Date: Fri, 26 May 2017 18:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

 On Thu, May 25, 2017 at 6:52 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> Generating the host keys atomically prevents power interruptions during
> the first boot from leaving the key files incomplete, which often
> prevents users from being able to ssh into the device.
> ---
>  meta/recipes-connectivity/openssh/openssh/init     | 22 +++----------
>  .../openssh/openssh/sshd-check-key                 | 36 ++++++++++++++++++++++
>  .../openssh/openssh/sshdgenkeys.service            | 25 +++++++--------
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  9 ++++++
>  4 files changed, 63 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
> index 1f63725..e02c479 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -45,23 +45,11 @@ check_config() {
>  }
>
>  check_keys() {
> -       # create keys if necessary
> -       if [ ! -f $HOST_KEY_RSA ]; then
> -               echo "  generating ssh RSA key..."
> -               ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> -       fi
> -       if [ ! -f $HOST_KEY_ECDSA ]; then
> -               echo "  generating ssh ECDSA key..."
> -               ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> -       fi
> -       if [ ! -f $HOST_KEY_DSA ]; then
> -               echo "  generating ssh DSA key..."
> -               ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> -       fi
> -       if [ ! -f $HOST_KEY_ED25519 ]; then
> -               echo "  generating ssh ED25519 key..."
> -               ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> -       fi
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
> +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
> +    @BASE_BINDIR@/sync
>  }
>
>  export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> new file mode 100644
> index 0000000..d2613af
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> @@ -0,0 +1,36 @@
> +#! /bin/sh
> +set -e

Is this appropriate for an init script? Aborting on unforeseen errors
may be worse than continuing.

> +NAME="$1"
> +TYPE="$2"
> +
> +if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
> +    echo "Usage: $0 NAME TYPE"
> +    exit 1;

Remove the stray ";"

> +fi
> +
> +DIR="$(dirname "$NAME")"

This could be moved down so dirname is only called if DIR is going to be used.

> +if [ ! -f "$NAME" ]; then
> +    echo "  generating ssh $TYPE key..."
> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> +
> +    # Move (Atomically rename) files
> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> +
> +    # This sync does double duty: Ensuring that the data in the temporary
> +    # private key file is on disk before the rename, and ensuring that the
> +    # public key rename is completed before the private key rename, since we
> +    # switch on the existence of the private key to trigger key generation.
> +    # This does mean it is possible for the public key to exist, but be garbage
> +    # but this is OK because in that case the private key won't exist and the
> +    # keys will be regenerated.
> +    #
> +    # In the event that sync understands arguments that limit what it tries to
> +    # fsync(), we provided them. If it does not, it will simply call sync()
> +    # which is just as well
> +    sync "${NAME}.pub" "$DIR" "${NAME}.tmp"
> +
> +    mv -f "${NAME}.tmp" "${NAME}"

No need for "-f" here as ${NAME} is known not to exist.

> +fi
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> index 148e6ad..23fd351 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> @@ -1,22 +1,23 @@
>  [Unit]
>  Description=OpenSSH Key Generation
>  RequiresMountsFor=/var /run
> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_rsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_dsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_ecdsa_key
> +ConditionPathExists=|!/var/run/ssh/ssh_host_ed25519_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
>
>  [Service]
>  Environment="SYSCONFDIR=/etc/ssh"
>  EnvironmentFile=-/etc/default/ssh
>  ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key -N '' -t rsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key -N '' -t dsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
> -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_rsa_key rsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_dsa_key dsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ecdsa_key ecdsa
> +ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ed25519_key ed25519
> +ExecStart=@BASE_BINDIR@/sync
>  Type=oneshot
>  RemainAfterExit=yes
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index 5b96745..c1fcda4 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
>             file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
> +           file://sshd-check-key \
>             "
>
>  PAM_SRC_URI = "file://sshd"
> @@ -124,7 +125,15 @@ do_install_append () {
>         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>                 -e 's,@SBINDIR@,${sbindir},g' \
>                 -e 's,@BINDIR@,${bindir},g' \
> +               -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>                 ${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
> +
> +       sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +               -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +               ${D}${sysconfdir}/init.d/sshd
> +
> +       install -d ${D}${libexecdir}/${BPN}
> +       install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
>  }
>
>  do_install_ptest () {
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

