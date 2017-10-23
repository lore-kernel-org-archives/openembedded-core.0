Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94D3C6FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 03:07:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9N37wVf007488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 20:07:58 -0700 (PDT)
Received: from [128.224.163.169] (128.224.163.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 22 Oct 2017 20:07:57 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1508206889-55145-1-git-send-email-wenlin.kang@windriver.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <1308e9a8-fb1b-4e2a-1233-e22a4f6300e5@windriver.com>
Date: Mon, 23 Oct 2017 11:09:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508206889-55145-1-git-send-email-wenlin.kang@windriver.com>
X-Originating-IP: [128.224.163.169]
Subject: Re: [PATCH] kexec-tools: add systemd support for kdump
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
X-List-Received-Date: Mon, 23 Oct 2017 03:07:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年10月17日 10:21, Wenlin Kang wrote:
> Add file kdump.service to support kdump in systemd.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   meta/recipes-kernel/kexec/kexec-tools.inc          |  1 +
>   .../recipes-kernel/kexec/kexec-tools/kdump.service | 12 +++++++++++
>   meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    | 23 +++++++++++++++++-----
>   3 files changed, 31 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kdump.service
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
> index bdfe024..c689bec 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools.inc
> +++ b/meta/recipes-kernel/kexec/kexec-tools.inc
> @@ -11,6 +11,7 @@ DEPENDS = "zlib xz"
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
>              file://kdump \
>              file://kdump.conf \
> +           file://kdump.service \
>   "
>   
>   PR = "r1"
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump.service b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
> new file mode 100644
> index 0000000..4e65a46
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=Reboot and dump vmcore via kexec
> +DefaultDependencies=no
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +ExecStart=@LIBEXECDIR@/kdump-helper start
> +ExecStop=@LIBEXECDIR@/kdump-helper stop
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> index bd89720..0f6398f1 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> @@ -34,19 +34,32 @@ ALLOW_EMPTY_${PN} = "1"
>   RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
>   
>   FILES_kexec = "${sbindir}/kexec"
> -FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
> -               ${sysconfdir}/sysconfig/kdump.conf"
> +FILES_kdump = "${sbindir}/kdump \
> +               ${sysconfdir}/sysconfig/kdump.conf \
> +               ${sysconfdir}/init.d/kdump \
> +               ${libexecdir}/kdump-helper \
> +               ${systemd_unitdir}/system/kdump.service \
> +"
> +
>   FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
>   
> -inherit update-rc.d
> +inherit update-rc.d systemd
>   
>   INITSCRIPT_PACKAGES = "kdump"
>   INITSCRIPT_NAME_kdump = "kdump"
>   INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
>   
>   do_install_append () {
> -        install -d ${D}${sysconfdir}/init.d
> -        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
>           install -d ${D}${sysconfdir}/sysconfig
>           install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +                install -D -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
> +        fi
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +                install -D -m 0755 ${WORKDIR}/kdump ${D}${libexecdir}/kdump-helper
> +                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_unitdir}/system/kdump.service
> +                sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_unitdir}/system/kdump.service
> +        fi
>   }


ping ......

-- 
Thanks,
Wenlin Kang


