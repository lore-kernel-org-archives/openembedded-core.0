Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1FC6B015
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 18:03:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2013 11:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1045,1367996400"; d="scan'208";a="368752911"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2013 11:03:12 -0700
Message-ID: <51DEF360.8030509@linux.intel.com>
Date: Thu, 11 Jul 2013 11:03:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Thu, 11 Jul 2013 18:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 12:45 AM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> - Remove dependency on systemd layer
> - Install 'sysv' related files only if distro has this feature
>
Seeing all these changes has me thinking we really need to support this 
correctly in the systemd and maybe a new sysvinit bbclass since you are 
doing the same thing in multiple recipes, seems like the classes should 
have some kind of do_install_append that operates on those files.

I guess this has been mentioned by JaMa on the oe-devel list, and Ross 
might be looking into it, but he could use some help if you have time to 
address the bbclass that would be very helpful.

See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=4309

I am going to hold off taking any more of these systemd patches until we 
get this sorted out.


Thanks
	Sau!


> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   .../openssh/openssh-6.2p2/sshd.socket              |   11 ++++++++
>   .../openssh/openssh-6.2p2/sshd@.service            |    9 ++++++
>   .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 +++++++
>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   29 +++++++++++++++++---
>   4 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> new file mode 100644
> index 0000000..753a33b
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> @@ -0,0 +1,11 @@
> +[Unit]
> +Conflicts=sshd.service
> +
> +[Socket]
> +ExecStartPre=/bin/mkdir -p /var/run/sshd
> +ListenStream=22
> +Accept=yes
> +
> +[Install]
> +WantedBy=sockets.target
> +Also=sshdgenkeys.service
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> new file mode 100644
> index 0000000..d118490
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=OpenSSH Per-Connection Daemon
> +After=sshdgenkeys.service
> +
> +[Service]
> +ExecStart=-/usr/sbin/sshd -i
> +ExecReload=/bin/kill -HUP $MAINPID
> +StandardInput=socket
> +StandardError=syslog
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> new file mode 100644
> index 0000000..c717214
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=SSH Key Generation
> +
> +[Service]
> +ExecStart=/usr/bin/ssh-keygen -A
> +Type=oneshot
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> index ab2eefb..b9657d5 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> @@ -26,14 +26,17 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>              file://init \
>              file://openssh-CVE-2011-4327.patch \
>              file://mac.patch \
> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> +           file://sshd.socket \
> +           file://sshd@.service \
> +           file://sshdgenkeys.service "
>
>   PAM_SRC_URI = "file://sshd"
>
>   SRC_URI[md5sum] = "be46174dcbb77ebb4ea88ef140685de1"
>   SRC_URI[sha256sum] = "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
>
> -inherit useradd update-rc.d update-alternatives
> +inherit useradd update-rc.d update-alternatives systemd
>
>   USERADD_PACKAGES = "${PN}-sshd"
>   USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
> @@ -41,6 +44,10 @@ INITSCRIPT_PACKAGES = "${PN}-sshd"
>   INITSCRIPT_NAME_${PN}-sshd = "sshd"
>   INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
>
> +SYSTEMD_PACKAGES = "${PN}-sshd"
> +SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
> +SYSTEMD_AUTO_ENABLE = "enable"
> +
>   PACKAGECONFIG ??= "tcp-wrappers"
>   PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
>
> @@ -82,8 +89,21 @@ do_install_append () {
>   			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
>   		fi
>   	done
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
> +
> +    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> +	    install -d ${D}${sysconfdir}/init.d
> +	    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
> +    fi
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
> +        sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/sshd@.service
> +        sed -i 's,/usr/bin/,${bindir}/,g' ${D}${systemd_unitdir}/system/sshdgenkeys.service
> +    fi
> +
>   	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
>   	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
>   }
> @@ -95,6 +115,7 @@ FILES_${PN}-scp = "${bindir}/scp.${BPN}"
>   FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
>   FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
>   FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
> +FILES_${PN}-sshd += "${systemd_unitdir}"
>   FILES_${PN}-sftp = "${bindir}/sftp"
>   FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
>   FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
>

