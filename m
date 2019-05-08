Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2C07DEA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:19:14 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m20so59630lji.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f7Cfi2DkyAH6B031HUD8/xXNWgaLar6gr1XOop73oI0=;
	b=ufHNN7RhyaDzNLXIIz3T5twjfC2ORMG+OFGQd/8WTXJOX3HPNRJXnzah3pHc4uiemp
	92IztJ6C+dsz4J/Kk/W/sOmzrFQoluhwk5KHg9BoIufgmeW4schl+4BWfJQJfQzcWnRa
	3hBj/93j0l8d1kVw6inDmAeYuwgwUou4LqQQBnC4pQyEIflZVwivIKYzlhoIOa+Wnwqm
	XGPIhXbODTBKU8Ro9SuwK4gZqOfaOCtgRa/3nOVkLZU5rBeRh0ctpuiQw/tw8zfACCKs
	0OsARPV8F35Y2POBUn91Q0H8WGvzM/W6pX4LYZPzHaGn4JEMsGloHIcaEKIgPIhZ+gu1
	LSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f7Cfi2DkyAH6B031HUD8/xXNWgaLar6gr1XOop73oI0=;
	b=WfeGR6L5fgc25mOGoyOmg0ghMzH8bod3Wo0o3/fLaawLH9nlZfboNamvCUjKCHp7IH
	0cn41v0kGZ4mDK3mq4tJazdoEPQ2jyq9gn18w4GvZxbrFK40fmxaW5lfLcZIuMtvLc6f
	LpvT/TTnpEwGZvAc6c9d2fdio9RBPghBnHwv6s2MC8f8GmBNu+BrWFVtlru/7xjopvCs
	6GEZheTmJfG2B+0qn/QjmXvDV3uZSoYTUyJMfXkZ08qql+RHJ5mAT9x6C1CddZaoi+28
	UEWjllDCkiyO9AvbtYlRihGUGryCylAni7SBd0cGMF3nwWH3WwXY4S+gLx2mUjPfbgCF
	KVXA==
X-Gm-Message-State: APjAAAVuZdbVD64pj2eUF0j5c8v1/WMn/7Ne7G3Mart2Z0MhbQkOuFsb
	khMtIMBLHYCr1nomY/OjQPgvQEyMeg8ZLTkAy6c=
X-Google-Smtp-Source: APXvYqwYgJOx6lTk0VwZ4lKVbZ8APPSM9F0tj8MqUhG4FEZySl2s/o0zWZgWW4GtF3AYUjYnjjLigdmNaXHb5vUkQFY=
X-Received: by 2002:a2e:3c06:: with SMTP id j6mr20154399lja.99.1557346755666; 
	Wed, 08 May 2019 13:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<20190502210944.62696-3-alex.kiernan@gmail.com>
In-Reply-To: <20190502210944.62696-3-alex.kiernan@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 May 2019 13:17:10 -0700
Message-ID: <CAKmqyKMDa1gW4ib+3TdJ5v6-58bNjQWmo6GV_6LxkcxpitZNaA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 2/6] systemd: do not create machine-id
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
X-List-Received-Date: Wed, 08 May 2019 20:19:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 2, 2019 at 2:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> From: Jonas Bonn <jonas@norrbonn.se>
>
> There is no reason to have an emtpy machine-id as part of the systemd
> package.  Either:
>
> i)  the filesystem is writable and the file will be created
> automatically; or
> ii) the filesystem is read-only, in which case the empty machine-id file
> should be created as part of the read-only-rootfs tweaks.
>
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

This patch now results in no "/etc/machine-id" being created which
breaks systemd-networkd WiFi connections.

I now always see this error when trying to connect to WiFi with
wpa_supplicant: "DHCP4 CLIENT: Failed to set IAID+DUID"

Alistair

> ---
>
> Changes in v6: None
> Changes in v5:
> - install default preset distribution policy of "enable nothing"
>
>  meta/classes/rootfs-postcommands.bbclass            | 6 ++++++
>  meta/recipes-core/systemd/systemd-conf_242.bb       | 9 ++-------
>  meta/recipes-core/systemd/systemd/99-default.preset | 1 +
>  meta/recipes-core/systemd/systemd_242.bb            | 6 +++++-
>  4 files changed, 14 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index bde58ad6cd36..89f8efd32363 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -126,6 +126,12 @@ read_only_rootfs_hook () {
>                         ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>                 fi
>         fi
> +
> +       if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
> +       # Create machine-id
> +       # 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
> +               touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
> +       fi
>  }
>
>  #
> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
> index 9bb27fd96d9c..7fe2e1105bef 100644
> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
> @@ -7,14 +7,13 @@ DefaultTimeoutStartSec setting."
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -CONFFILES_${PN} = "${sysconfdir}/machine-id \
> -${sysconfdir}/systemd/coredump.conf \
> +CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
>  ${sysconfdir}/systemd/journald.conf \
>  ${sysconfdir}/systemd/logind.conf \
>  ${sysconfdir}/systemd/system.conf \
>  ${sysconfdir}/systemd/user.conf"
>
> -FILES_${PN} = "${sysconfdir}/machine-id ${sysconfdir}/systemd"
> +FILES_${PN} = "${sysconfdir}/systemd"
>
>  do_configure[noexec] = '1'
>  do_compile[noexec] = '1'
> @@ -23,10 +22,6 @@ do_install() {
>         rm -rf ${D}/${sysconfdir}/systemd
>         install -d ${D}/${sysconfdir}/systemd
>
> -       # Create machine-id
> -       # 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
> -       touch ${D}${sysconfdir}/machine-id
> -
>         install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
>
>         install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
> diff --git a/meta/recipes-core/systemd/systemd/99-default.preset b/meta/recipes-core/systemd/systemd/99-default.preset
> new file mode 100644
> index 000000000000..1f29b50597f0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/99-default.preset
> @@ -0,0 +1 @@
> +disable *
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 9f194f2b6ca1..7d1b0ec13a44 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
>             file://0004-rules-whitelist-hd-devices.patch \
>             file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
> +           file://99-default.preset \
>             "
>
>  # patches needed by musl
> @@ -277,7 +278,6 @@ do_install() {
>         fi
>
>         # conf files are handled by systemd-conf
> -       rm -f ${D}${sysconfdir}/machine-id
>         rm -f ${D}${sysconfdir}/systemd/coredump.conf
>         rm -f ${D}${sysconfdir}/systemd/journald.conf
>         rm -f ${D}${sysconfdir}/systemd/logind.conf
> @@ -287,6 +287,10 @@ do_install() {
>         # duplicate udevadm for postinst script
>         install -d ${D}${libexecdir}
>         ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
> +
> +       # install default policy for presets
> +       # https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> +       install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
>  }
>
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

