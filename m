Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 77629608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 17:14:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2013 10:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="363240145"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2013 10:15:59 -0700
Message-ID: <51DD9690.7080201@linux.intel.com>
Date: Wed, 10 Jul 2013 10:14:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
References: <1373453593-13957-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1373453593-13957-1-git-send-email-muhammad_shakeel@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpcbind: Add systemd support
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
X-List-Received-Date: Wed, 10 Jul 2013 17:14:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2013 03:53 AM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> - Adds systemd support in rpcbind
> - Install 'sysv' related files only if distro has this feature
> - Set PR to 'r0'
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   .../rpcbind/rpcbind/rpcbind.service                |   13 ++++++++++
>   meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   26 ++++++++++++++------
>   2 files changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> new file mode 100644
> index 0000000..a028ace
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=RPC Bind
> +After=network.target
> +Wants=rpcbind.target
> +Before=rpcbind.target
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/rpcbind
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> index f4a0367..ab25edf 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>              file://fix_host_path.patch \
>              file://obsolete_automake_macros.patch \
>              ${UCLIBCPATCHES} \
> +           file://rpcbind.service \
>             "
>
>   UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
> @@ -25,9 +26,9 @@ UCLIBCPATCHES ?= ""
>   SRC_URI[md5sum] = "1a77ddb1aaea8099ab19c351eeb26316"
>   SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497a00de3"
>
> -PR = "r4"
> +PR = "r0"
>
Since your not changing the version, you need to keep the PR as is, 
there is no need to do a PR bump though. Next time this recipe is 
updated, the PR entry can be removed.

Sau!

> -inherit autotools update-rc.d
> +inherit autotools update-rc.d systemd
>
>   PACKAGECONFIG ??= "tcp-wrappers"
>   PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> @@ -35,12 +36,23 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
>   INITSCRIPT_NAME = "rpcbind"
>   INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
>
> +SYSTEMD_SERVICE_${PN} = "rpcbind.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
>   do_install_append () {
>       mv ${D}${bindir} ${D}${sbindir}
>
> -    install -d ${D}${sysconfdir}/init.d
> -    sed -e 's,/etc/,${sysconfdir}/,g' \
> -        -e 's,/sbin/,${sbindir}/,g' \
> -        ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
> -    chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
> +    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> +        install -d ${D}${sysconfdir}/init.d
> +        sed -e 's,/etc/,${sysconfdir}/,g' \
> +            -e 's,/sbin/,${sbindir}/,g' \
> +            ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
> +        chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
> +    fi
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
> +        sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/rpcbind.service
> +    fi
>   }
>

