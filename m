Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sungy-0003Hx-RX
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 18:47:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Jul 2012 09:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127637072"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Jul 2012 09:35:35 -0700
Message-ID: <5012C356.6090100@linux.intel.com>
Date: Fri, 27 Jul 2012 09:35:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120727152454.GA5706@windriver.com>
In-Reply-To: <20120727152454.GA5706@windriver.com>
Subject: Re: [PATCH] openssh: package testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 16:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2012 08:24 AM, Amy Fong wrote:
> openssh: package testing
>
> Package openssh's regression tests
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>   openssh-5.9p1/runtests.sh |   29 +++++++++++++++++++++++++++++
>   openssh_5.9p1.bb          |    9 +++++++++
>   2 files changed, 38 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh b/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh
> new file mode 100755
> index 0000000..bb99a05
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-5.9p1/runtests.sh
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +
> +cd regress
> +
> +make \
> +	.OBJDIR=`pwd` \
> +	.CURDIR=`pwd` \
> +	BUILDDIR=`pwd` \
> +	OBJ=`pwd` \
> +	PATH=$PATH:. \
> +	TEST_SHELL=sh \
> +	TEST_SSH_SSH=`which ssh` \
> +	TEST_SSH_SSHD=`which sshd` \
> +	TEST_SSH_SSHAGENT=`which ssh-agent` \
> +	TEST_SSH_SSHADD=`which ssh-add` \
> +	TEST_SSH_SSHKEYGEN=`which ssh-keygen` \
> +	TEST_SSH_SSHPKCS11HELPER="/usr/libexec/ssh-pkcs11-helper" \
> +	TEST_SSH_SSHKEYSCAN=`which ssh-keyscan` \
> +	TEST_SSH_SFTP=`which sftp` \
> +	TEST_SSH_SFTPSERVER="/usr/libexec/sftp-server" \
> +	TEST_SSH_PLINK="plink" \
> +	TEST_SSH_PUTTYGEN="puttygen" \
> +	TEST_SSH_CONCH="conch" \
> +	TEST_SSH_IPV6="yes" \
> +	TEST_SSH_ECC="yes" \
> +	TEST_SSH_SHA256="yes" \
> +	EXEEXT="" \
> +	tests
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> index 749f89e..f0880c0 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
> @@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>              file://sshd_config \
>              file://ssh_config \
>              file://init \
> +           file://runtests.sh \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
>
>   PAM_SRC_URI = "file://sshd"
> @@ -81,6 +82,9 @@ do_install_append () {
>   	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
>   	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
>   	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
> +	if [ ! -d ${D}/opt/${PN}-tests/ ]; then mkdir -p ${D}/opt/${PN}-tests/; fi
> +	install -m 755 ${WORKDIR}/runtests.sh ${D}/opt/${PN}-tests/
> +	cp -ra ${S}/regress ${D}/opt/${PN}-tests/
>   }
>
I think these needs to be conditional on PACKAGECONFIG having "tests" to 
include tests and test scripts.  Also, I am not sure we should be 
putting them in opt, probably better to have them in ${datadir}/${PN}/tests


>   ALLOW_EMPTY_${PN} = "1"
> @@ -95,6 +99,11 @@ FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
>   FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
>   FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>
> +PACKAGES += "${PN}-testing"
This should also be triggered by a PACKAGECONFIG check.

> +DEPENDS_${PN}-testing += "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
> +FILES_${PN}-testing += "/opt/${PN}-tests/*"
> +FILES_${PN}-dbg += "/opt/${PN}-tests/.debug/*"
> +
>   RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>   DEPENDS_${PN}-sshd += "update-rc.d"
>   RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


