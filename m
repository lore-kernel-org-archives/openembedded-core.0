Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 90FD87709E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:21:58 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aRRLh-00025C-Me; Thu, 04 Feb 2016 22:21:58 +0100
Message-ID: <1454620911.7421.79.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Date: Thu, 04 Feb 2016 21:21:51 +0000
In-Reply-To: <CAEGpDuafdyYh84k-Odja=iR0iGna9KSCt6d14ui8DD7Vs_1RvQ@mail.gmail.com>
References: <1454386797-1807-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAEGpDuafdyYh84k-Odja=iR0iGna9KSCt6d14ui8DD7Vs_1RvQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iptables: Add systemd support
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
X-List-Received-Date: Thu, 04 Feb 2016 21:21:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Also, please don't hardcode /usr/libexec/iptables
or /etc/default/iptables in the service files.

p.

On Thu, 2016-02-04 at 22:14 +0100, Pau Espin Pedrol wrote:
> Please use ${systemd_system_unitdir} instead of
> ${systemd_unitdir}/system
> 
> Pau Espin Pedrol
> mail/jabber: pespin.shar@gmail.com
> http://blog.espeweb.net
> 
> 
> 2016-02-02 5:19 GMT+01:00 Li Xin <lixin.fnst@cn.fujitsu.com>:
>         Add iptables.service & ip6tables.service to support systemd
>         systems.
>         
>         Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>         ---
>          .../iptables/iptables/ip6tables.service                 | 17
>         +++++++++++++++++
>          .../recipes-extended/iptables/iptables/iptables.service | 17
>         +++++++++++++++++
>          meta/recipes-extended/iptables/iptables_1.4.21.bb       | 16
>         +++++++++++++++-
>          3 files changed, 49 insertions(+), 1 deletion(-)
>          create mode 100644
>         meta/recipes-extended/iptables/iptables/ip6tables.service
>          create mode 100644
>         meta/recipes-extended/iptables/iptables/iptables.service
>         
>         diff --git
>         a/meta/recipes-extended/iptables/iptables/ip6tables.service
>         b/meta/recipes-extended/iptables/iptables/ip6tables.service
>         new file mode 100644
>         index 0000000..148a1b9
>         --- /dev/null
>         +++
>         b/meta/recipes-extended/iptables/iptables/ip6tables.service
>         @@ -0,0 +1,17 @@
>         +[Unit]
>         +Description=IPv6 firewall with ip6tables
>         +After=syslog.target
>         +ConditionPathExists=/etc/default/iptables
>         +
>         +[Service]
>         +Type=oneshot
>         +RemainAfterExit=yes
>         +ExecStart=/usr/libexec/iptables/ip6tables.init start
>         +ExecStop=/usr/libexec/iptables/ip6tables.init stop
>         +Environment=BOOTUP=serial
>         +Environment=CONSOLETYPE=serial
>         +StandardOutput=syslog
>         +StandardError=syslog
>         +
>         +[Install]
>         +WantedBy=basic.target
>         diff --git
>         a/meta/recipes-extended/iptables/iptables/iptables.service
>         b/meta/recipes-extended/iptables/iptables/iptables.service
>         new file mode 100644
>         index 0000000..9745c71
>         --- /dev/null
>         +++ b/meta/recipes-extended/iptables/iptables/iptables.service
>         @@ -0,0 +1,17 @@
>         +[Unit]
>         +Description=IPv4 firewall with iptables
>         +After=syslog.target
>         +ConditionPathExists=/etc/default/iptables
>         +
>         +[Service]
>         +Type=oneshot
>         +RemainAfterExit=yes
>         +ExecStart=/usr/libexec/iptables/iptables.init start
>         +ExecStop=/usr/libexec/iptables/iptables.init stop
>         +Environment=BOOTUP=serial
>         +Environment=CONSOLETYPE=serial
>         +StandardOutput=syslog
>         +StandardError=syslog
>         +
>         +[Install]
>         +WantedBy=basic.target
>         diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb
>         b/meta/recipes-extended/iptables/iptables_1.4.21.bb
>         index deea5e5..84c95ea 100644
>         --- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
>         +++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
>         @@ -24,12 +24,14 @@ SRC_URI =
>         "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>         
>         file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>                     file://0001-fix-build-with-musl.patch \
>         
>         file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
>         +           file://iptables.service \
>         +           file://ip6tables.service \
>                    "
>         
>          SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
>          SRC_URI[sha256sum] =
>         "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
>         
>         -inherit autotools pkgconfig
>         +inherit autotools pkgconfig systemd
>         
>          EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
>                         "
>         @@ -46,3 +48,15 @@ do_configure_prepend() {
>                 # Keep ax_check_linker_flags.m4 which belongs to
>         autoconf-archive.
>                 rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4
>         ltsugar.m4 ltversion.m4
>          }
>         +
>         +do_install_append() {
>         +    install -d ${D}${systemd_unitdir}/system
>         +    install -m 0644 ${WORKDIR}/ip6tables.service
>         ${D}${systemd_unitdir}/system/
>         +    install -m 0644 ${WORKDIR}/iptables.service
>         ${D}${systemd_unitdir}/system/
>         +    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
>         +               ${D}${systemd_unitdir}/system/iptables.service
>         +    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
>         +
>          ${D}${systemd_unitdir}/system/ip6tables.service
>         +}
>         +
>         +SYSTEMD_SERVICE_${PN} = "iptables.service ip6tables.service"
>         --
>         1.8.4.2
>         
>         
>         
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



