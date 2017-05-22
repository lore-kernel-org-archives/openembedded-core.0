Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C120760110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 13:08:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id e127so37742306wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GSUIg0tjRLfwmNAuFapY1eSjgKJY7VCCd/cXV8SrPf4=;
	b=Om350eQrN9RHisd1Fb/zvTNmXmMVFhDB2CKrlbzCS73eHqZUgPV3+CAwnLLOlzX27o
	WdUJpyiPlXqE63suK9X/zqMXiDQcOQvuujQzJYkJfKE1wDfMKHzSFhXzbsw1Cb5le5ep
	Hz3maZCvT8Rfxrt1XgCwHqD6l/Rq+vysmQ86utxM/0aTh2mMTBqUv2BaUIv0VRFVeL8P
	fpDg+0zszCUXnuYuYUAUUqmtNL0f60xAhFBipx+R0/bnaC26TkcuRq+OY9mmOW23Ag9I
	FtmK0HGHAkzprS9DP2D15+1CQOe1HnWKA7SluLGqIw1MHggd5BaJSgb+YHwWNnKeN0GU
	dm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GSUIg0tjRLfwmNAuFapY1eSjgKJY7VCCd/cXV8SrPf4=;
	b=SEGRNmjM4f/qQi7OUb70HPfazPGrBnjMfcXbHxSvu5Tv8kEQkHWTNMbJNLiA842kV2
	WX4LbDMFWyjXmoKEQoH5Lj/tDudmSSCgQFxfSwvOMeyM627qzHqkU2FLuIZ3wfdynGOe
	B+h2j73ZCwOaue6b8qGYGc0Fwtmwgd74bZpbZgLO7vPXfIw9/JSYVWqObUIB0pgeAlux
	LzONxByAoCqjUcU73ZJg4GUD4aKghv45JeWVGPhkNKcxOUdDncaX9FxvQ4zTZyesrEGq
	PQ6PfbiHpf7uoNpezTx+5DstzJ3K0/5ZB6moXew4uvsOkzVK//pKbFIHGt1Zusk0Gct8
	8q1Q==
X-Gm-Message-State: AODbwcAMrdGbULcYzkaicsyUjR0dulVDDeqXM3UIJP3aS8WdNhobFJZc
	PdAGWq+TC8DKvyZsbeAfpMY1VMPc0w==
X-Received: by 10.28.207.207 with SMTP id f198mr27711172wmg.85.1495458502033; 
	Mon, 22 May 2017 06:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.65 with HTTP; Mon, 22 May 2017 06:08:21 -0700 (PDT)
In-Reply-To: <20170507013304.30165-1-JPEWhacker@gmail.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 22 May 2017 08:08:21 -0500
Message-ID: <CAJdd5GboaT=3LqSREjaP1ECXgrbG9c8sADBSPhZN+i7t3jcVAA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Mon, 22 May 2017 13:08:22 -0000
Content-Type: text/plain; charset="UTF-8"

Could I get a review of this? I'm somewhat new to submitting patches,
so if I'm missing something I probably don't realize it, any feedback
is appreciated.

Thanks,
Joshua Watt

On Sat, May 6, 2017 at 8:33 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> Generating the host keys atomically prevents power interruptions during
> the first boot from leaving the key files incomplete, which often
> prevents users from being able to ssh into the device.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/init     | 21 ++++------------
>  .../openssh/openssh/sshd-check-key                 | 28 ++++++++++++++++++++++
>  .../openssh/openssh/sshdgenkeys.service            | 16 ++++---------
>  meta/recipes-connectivity/openssh/openssh_7.4p1.bb |  8 +++++++
>  4 files changed, 44 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
> index 1f63725..22124a9 100644
> --- a/meta/recipes-connectivity/openssh/openssh/init
> +++ b/meta/recipes-connectivity/openssh/openssh/init
> @@ -45,23 +45,10 @@ check_config() {
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
>  }
>
>  export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> new file mode 100644
> index 0000000..3495d98
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> @@ -0,0 +1,28 @@
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
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> index c8093d4..ccd7a02 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
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
> +       install -d 644 ${D}${libexecdir}/${BPN}
> +       install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
>  }
>
>  do_install_ptest () {
> --
> 2.9.3
>

