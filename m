Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F68E78216
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:38:07 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v104so35520615wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bpqDbPjYAYekO0haeKfA1sATcmz7LM+Qwc4krBowk/o=;
	b=G1Vo3QZf5iTjmxInm8miOZQtTHgEWc5kJPy8LKrlKm2n2QDOg5NtRY24dAPdX1Kwp5
	zLMkty8HAqItSIKW16yeTpauBSJ2dEh2rz8KLqAPvM0Y6qKiSW71yxP0Vn5XXsICMUIN
	JhImRNkDDdzQb51S+rzzUZQq0BxFcxt0uvPY7VsiP5f+RIzvrCBs6nHq6vjLRgW0Wstd
	6ejA0MC1wqgouWlgzuMjoJMWG70KPBKYV4MgmQP327fUbTAFxLJPF6pXqn2JIMKSDsPw
	IzpxeeA0IOYUHO0+hsUZ2S03JCubEbWarppQ/0CCdIVjcXvNd4SZ7ilO9tl9+0VRbD9U
	WTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bpqDbPjYAYekO0haeKfA1sATcmz7LM+Qwc4krBowk/o=;
	b=t0s0TXvV8Ps2O1RD6pL0pv4egAOCGPF3u5zvY/+7ZXKXcu3YglfEdv6H6vYWs/1p6n
	ioHswP+gDQ40lSCOpLZcdjph3BicFVIKVsGb9HBK0TvM1/5T20ptA1w2zPnzBqjhPfcP
	LTjs6vTbT9GrZVTPRBJYryVF6Mbuj6R494XMLgeC/AycPW/h/S6NyKO8QCdytipku5Kd
	jrxSQSt5LU+Uu8JwSEOnt/0Wg3xe6zAOffudI2e5O56zfC2rOxqBNYxafUFWoXzuRRmu
	UUun8aTM2CqkrcR/qAiUkrdFyy3s6iv40oF3JPaqS9Mdh3jgjVzpLz2ShO+yNVFVgPgh
	F3tA==
X-Gm-Message-State: AKS2vOxK3n+Q/La2Ok9tWzqMJ4aI0Xnxb9ptR3pPNdiqt+AmhBliPylH
	N9bqzUon/AtlF6j5x3KfAekEUADsWsPq
X-Received: by 10.223.129.47 with SMTP id 44mr4778925wrm.179.1497411488703;
	Tue, 13 Jun 2017 20:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.206 with HTTP; Tue, 13 Jun 2017 20:38:07 -0700 (PDT)
In-Reply-To: <20170614033134.4733-1-JPEWhacker@gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170614033134.4733-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 13 Jun 2017 22:38:07 -0500
Message-ID: <CAJdd5GYTmmSBiFbY9Hn9=vqchABf66y6KcVQOQKgU_bRh_21PA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 14 Jun 2017 03:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 10:31 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> Generating the host keys atomically prevents power interruptions during
> the first boot from leaving the key files incomplete, which often
> prevents users from being able to ssh into the device.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/init     | 24 +++--------------
>  .../openssh/openssh/sshd-check-key                 | 30 ++++++++++++++++++++++
>  .../openssh/openssh/sshdgenkeys.service            | 16 +++---------
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 ++++++
>  4 files changed, 46 insertions(+), 32 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
> index 386628a..acb35c3 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -80,26 +80,10 @@ check_keys() {
>         [ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
>
>         # create keys if necessary
> -       if [ ! -f $HOST_KEY_RSA ]; then
> -               echo "  generating ssh RSA key..."
> -               mkdir -p $(dirname $HOST_KEY_RSA)
> -               ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> -       fi
> -       if [ ! -f $HOST_KEY_ECDSA ]; then
> -               echo "  generating ssh ECDSA key..."
> -               mkdir -p $(dirname $HOST_KEY_ECDSA)
> -               ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> -       fi
> -       if [ ! -f $HOST_KEY_DSA ]; then
> -               echo "  generating ssh DSA key..."
> -               mkdir -p $(dirname $HOST_KEY_DSA)
> -               ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> -       fi
> -       if [ ! -f $HOST_KEY_ED25519 ]; then
> -               echo "  generating ssh ED25519 key..."
> -               mkdir -p $(dirname $HOST_KEY_ED25519)
> -               ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> -       fi
> +       @LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
> +       @LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
> +       @LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
> +       @LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
>  }
>
>  export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> new file mode 100644
> index 0000000..4999af2
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> @@ -0,0 +1,30 @@
> +#! /bin/sh
> +set -e
> +
> +NAME="$1"
> +TYPE="$2"
> +
> +if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
> +    echo "Usage: $0 NAME TYPE"
> +    exit 1;
> +fi
> +
> +if [ ! -f "$NAME" ]; then
> +    mkdir -p "$(dirname "$NAME")"
> +
> +    echo "  generating ssh $TYPE key..."
> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> +
> +    # Sync to ensure data is written to temp file before renaming
> +    sync
> +
> +    # Move (Atomically rename) files
> +    # Rename the .pub file first, since the check that triggers a
> +    # key generation is based on the private file.
> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> +    sync
> +
> +    mv -f "${NAME}.tmp" "${NAME}"
> +    sync
> +fi
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> index 148e6ad..af56404 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> @@ -1,22 +1,14 @@
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
>  Type=oneshot
>  RemainAfterExit=yes
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index 5b96745..ede8823 100644
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
> @@ -124,7 +125,14 @@ do_install_append () {
>         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>                 -e 's,@SBINDIR@,${sbindir},g' \
>                 -e 's,@BINDIR@,${bindir},g' \
> +               -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>                 ${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
> +
> +       sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +               ${D}${sysconfdir}/init.d/sshd
> +
> +       install -d ${D}${libexecdir}/${BPN}
> +       install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
>  }
>
>  do_install_ptest () {
> --
> 2.9.4
>

Argh. Nevermind. This was a rebase of the wrong patch version. I
shouldn't be trying this so late.

