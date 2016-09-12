Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id CB627731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 09:22:20 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <20160908112942.8459-1-ml@embed.me.uk>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <d5e2d6fb-009b-df8b-92f3-e6ced3f8c2bb@embed.me.uk>
Date: Mon, 12 Sep 2016 10:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160908112942.8459-1-ml@embed.me.uk>
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
X-List-Received-Date: Mon, 12 Sep 2016 09:22:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/09/16 12:29, Jack Mitchell wrote:
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
>  	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
>  	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
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
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/iptables.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "iptables.service"
>

If there are no comments on this then I suggest we take it as it is. Not 
having a way to auto load iptables rules is just asking for 
layer/application specific hacks.

