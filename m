Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE1662134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 18:34:06 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4F5405C3A6D;
	Wed, 13 Dec 2017 19:28:06 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 13 Dec 2017 19:29:12 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20171213180624.30839-1-stefan@agner.ch>
References: <20171213180624.30839-1-stefan@agner.ch>
Message-ID: <cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513189686; bh=Fhp6ZmicZDSFUYPeCtbXsvt3YHjUTw5zqUmfZLVLl9E=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=C1ZEqZzfoV459CSbPnbaZ1QCVVao7Od3ORUKrbVvV5GJwFKhNhXRYQTkZJMeK7euF4pF7IshworIWcjp4J/Qbg2U8TuYqSEDG5oQKaUwDwzCxJ1dJtEvjx5x5FWDA9N06Nbt2LacqG/stO/vxURrwVk7HhncBkbvm2vgQTVnCME=
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Wed, 13 Dec 2017 18:34:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-13 19:06, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> OpenEmbedded has a built-in mechanism to run postinst scripts offline
> at build time or, if necessary, on first boot (delayed execution). If
> the latter is the case and systemd is in use, two services end up
> doing the same thing:
> - opkg-configure.service starts "opkg configure" which in turn parses
>   /var/lib/opkg/status and runs the postinst scripts stored in
>   /var/lib/opkg/info/.
> - run-postinsts.service starts "/usr/sbin/run-postinsts" which runs
>   postinst scripts stored in /etc/ipk-postinsts/. Those scripts get
>   prepared by meta/lib/oe/rootfs.py (see also _save_postinsts of the
>   OpkgRootfs class)
> 
> This can be seen when using a distro using ipk and systemd, then
> installing opkg-keyrings and enable package management. The resulting
> rootfs has both services and will run opkg-keyrings.postinst twice.
> 
> Moreover, because the two services have similar dependency, they
> typically get executed almost at the same time:
>   Dec 13 14:47:25 colibri-imx6 systemd[1]: Starting Opkg first boot configure...
>   ...
>   Dec 13 14:47:25 colibri-imx6 systemd[1]: Starting Run pending postinsts...
> 
> This leads to executions of the same postinst scripts racing with each
> other! In practise update-alternative has been proven to be suspectable
> to such races.
> 
> Get rid of the opkg service to avoid dupplicate postinst execution.

With this applied there is one problem though: opkg status file still
shows the packages as just "unpacked". When running the package manager
(e.g. to install an unrelated package) opkg starts to handle the
postinst nonetheless.

So there is another issue basically. Looking at /usr/sbin/run-postinsts
I see that "opkg configure" is actually triggered if there are no
scripts in /etc/ipk-postinsts. However, meta/lib/oe/rootfs.py calls
_save_postinsts() no matter whether there is package management or no:


...
        if delayed_postinsts:
            self._save_postinsts()
            if image_rorfs:
                bb.warn("There are post install scripts "
                        "in a read-only rootfs")
...


Maybe it needs something like this?


        runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES",
"package-management",
                                              True, False, self.d)
        if delayed_postinsts and not runtime_pkgmanage:
            self._save_postinsts()
            if image_rorfs:
                bb.warn("There are post install scripts "
                        "in a read-only rootfs")



But then, this is common code for all supported package formats. It
seems that /usr/sbin/run-postinsts only supports package manager
postinst processing for deb and ipk...

Comments appreciated.

--
Stefan

> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-devtools/opkg/opkg/opkg-configure.service | 17 -----------------
>  meta/recipes-devtools/opkg/opkg_0.3.5.bb               | 13 -------------
>  2 files changed, 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.service
> 
> diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> deleted file mode 100644
> index 432c3ddc28..0000000000
> --- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -[Unit]
> -Description=Opkg first boot configure
> -DefaultDependencies=no
> -After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
> -Before=sysinit.target
> -
> -[Service]
> -Type=oneshot
> -EnvironmentFile=-@SYSCONFDIR@/default/postinst
> -ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then
> @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure;
> fi"
> -ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable
> opkg-configure.service
> -StandardOutput=syslog
> -RemainAfterExit=No
> -
> -[Install]
> -WantedBy=basic.target
> -WantedBy=sysinit.target
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> index 3e511b6bb6..fb36e8b866 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> @@ -22,8 +22,6 @@ SRC_URI[sha256sum] =
> "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d
>  
>  inherit autotools pkgconfig systemd
>  
> -SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
> -
>  target_localstatedir := "${localstatedir}"
>  OPKGLIBDIR = "${target_localstatedir}/lib"
>  
> @@ -46,16 +44,6 @@ do_install_append () {
>  
>  	# We need to create the lock directory
>  	install -d ${D}${OPKGLIBDIR}/opkg
> -
> -	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
> -		install -d ${D}${systemd_unitdir}/system
> -		install -m 0644 ${WORKDIR}/opkg-configure.service
> ${D}${systemd_unitdir}/system/
> -		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> -			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -			-e 's,@BINDIR@,${bindir},g' \
> -			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
> -			${D}${systemd_unitdir}/system/opkg-configure.service
> -	fi
>  }
>  
>  RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}
> opkg-arch-config libarchive"
> @@ -68,7 +56,6 @@ RPROVIDES_${PN} = "opkg-collateral"
>  PACKAGES =+ "libopkg"
>  
>  FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
> -FILES_${PN} += "${systemd_unitdir}/system/"
>  
>  BBCLASSEXTEND = "native nativesdk"

