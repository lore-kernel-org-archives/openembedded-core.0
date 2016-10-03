Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6C223719D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 17:22:44 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b81so43640277lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FPOI5nlSkaN4nnjoS0E52PIlYyPRW0m8t8bpnOFG6Uo=;
	b=IPFzA02UfPpMNvGa9TWUSe/y5eBBeql7i1wGzU+tCEIU3GPAYMkAxsxjw3Kwivlk+c
	GzY/z3JsiOireu78vMeZ7mkgDhB9/PrI+2SA54dIWDHjz6WzFNY3FOEAbNaB46IKUU2N
	xZKLjZL74jcKTYc36trI8hocr8Siu4DVFF3m58T5e9Isbx+zc9Jp0k0myEkWFCnnqrSZ
	SwSBirjXmKBXqu31Ix6oeVcRyr+JUJSN5V3pwV+8bVjx65Vhaq783v7ygcjc1tuyybBK
	cpi2eJ/+Ntw9eRc8Fq0hRYpCfRGrjJsaIHrRzEGaX2YNBM1pEypATDj8WYJL2WpM8n4q
	bYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FPOI5nlSkaN4nnjoS0E52PIlYyPRW0m8t8bpnOFG6Uo=;
	b=IAorz1JmjsVw9Xy//6P6cr5IgeLcnodnrNe6fMnxYqhSzkoOuNmK28lv5BLq2Wv4xI
	pSav6qJYUgz315H0cEkEHxkaVzr7ZbQSFz9MR0xLAT51u+jALzUESIW7oL/qGHdtixn/
	9/ppwvvSMjiNSzc6AKmMSCZ2fdpm8COA2pbu5U4YJYqwHpPQsC9mfWgBiiquoAza5Dm7
	OjGVG1sli81NvCFEAYCfJ3TVJ1EyXsYSDXjaM54a9mkFvpTEJb3y5bO3pAg1MOpPkics
	XU3EU2O802YP7JsQu1I4PbGyN/y451qyOr3xMlqR17HORi/40U+Yk3FUYRIbiRbkwVXe
	vA6w==
X-Gm-Message-State: AA6/9RlUSfOLwSxzKQZfx9iRIl46gT6+CQ41O+K5wvp69HMonjYztiGIVuRcWz7v5x+BZdxHhSc+03T4Iwh7gA==
X-Received: by 10.25.26.203 with SMTP id a194mr1741774lfa.30.1475515364877;
	Mon, 03 Oct 2016 10:22:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.24.217 with HTTP; Mon, 3 Oct 2016 10:22:44 -0700 (PDT)
In-Reply-To: <20160908112942.8459-1-ml@embed.me.uk>
References: <20160908112942.8459-1-ml@embed.me.uk>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Mon, 3 Oct 2016 19:22:44 +0200
Message-ID: <CAEGpDuaTbzsa7qWWe1hNY9xQMRFPOK0y6TWzWJQqn38LfJ2VqA@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Jack Mitchell <jack@embed.me.uk>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] iptables: add systemd helper unit to load/restore rules
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
X-List-Received-Date: Mon, 03 Oct 2016 17:22:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

can you please use ${systemd_system_unitdir} instead of
${systemd_unitdir}/system?
Pau Espin Pedrol


2016-09-08 13:29 GMT+02:00 Jack Mitchell <ml@embed.me.uk>:
> From: Jack Mitchell <jack@embed.me.uk>
>
> there is currently no way to automatically load iptable rules
> in OE. Add a systemd unit file to automatically load rules on
> network connection. This is cribbed from the way ArchLinux
> handles iptables with some minor modifications for OE. New rules
> can be generated using 'iptables-save > iptables.rules'
> ---
>  .../iptables/iptables/iptables.rules                 |  0
>  .../iptables/iptables/iptables.service               | 13 +++++++++++++
>  meta/recipes-extended/iptables/iptables_1.6.0.bb     | 20 ++++++++++++++++++--
>  3 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/iptables/iptables/iptables.rules
>  create mode 100644 meta/recipes-extended/iptables/iptables/iptables.service
>
> diff --git a/meta/recipes-extended/iptables/iptables/iptables.rules b/meta/recipes-extended/iptables/iptables/iptables.rules
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
> new file mode 100644
> index 0000000..041316e
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/iptables.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Packet Filtering Framework
> +Before=network-pre.target
> +Wants=network-pre.target
> +
> +[Service]
> +Type=oneshot
> +ExecStart=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
> +ExecReload=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/iptables/iptables_1.6.0.bb b/meta/recipes-extended/iptables/iptables_1.6.0.bb
> index fbbe418..65430a1 100644
> --- a/meta/recipes-extended/iptables/iptables_1.6.0.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.6.0.bb
> @@ -22,13 +22,16 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>             file://types.h-add-defines-that-are-required-for-if_packet.patch \
>             file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>             file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
> -          "
> +           file://iptables.service \
> +           file://iptables.rules \
> +"
> +
>  SRC_URI_append_libc-musl = " file://0001-fix-build-with-musl.patch"
>
>  SRC_URI[md5sum] = "27ba3451cb622467fc9267a176f19a31"
>  SRC_URI[sha256sum] = "4bb72a0a0b18b5a9e79e87631ddc4084528e5df236bc7624472dcaa8480f1c60"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig systemd
>
>  EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
>                 "
> @@ -48,3 +51,16 @@ do_configure_prepend() {
>         # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
>         rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
>  }
> +
> +do_install_append() {
> +
> +        install -d ${D}${sysconfdir}/iptables
> +        install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
> +
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_unitdir}/system
> +
> +       sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/iptables.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "iptables.service"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

