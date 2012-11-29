Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Te8Qo-0000Ls-55
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 19:01:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2012 09:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,186,1355126400"; d="scan'208";a="255152601"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2012 09:47:30 -0800
Message-ID: <50B79FB1.30705@linux.intel.com>
Date: Thu, 29 Nov 2012 09:47:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Li Wang <li.wang@windriver.com>
References: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
In-Reply-To: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: CVE-2011-4327
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 18:01:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2012 10:13 PM, Li Wang wrote:
> A security flaw was found in the way ssh-keysign,
> a ssh helper program for host based authentication,
> attempted to retrieve enough entropy information on configurations that
> lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
> be executed to retrieve the entropy from the system environment).
> A local attacker could use this flaw to obtain unauthorized access to host keys
> via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
> http://www.openssh.com/txt/portable-keysign-rand-helper.adv
>
> [YOCTO #3493]
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>   .../openssh-6.0p1/openssh-CVE-2011-4327.patch      | 27 ++++++++++++++++++++++
>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |  3 ++-
>   2 files changed, 29 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch
> new file mode 100644
> index 0000000..8489edc
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch

This has already been merged, but can you please send a patch to add the 
Upstream-Status

Thanks
	Sau!

> @@ -0,0 +1,27 @@
> +openssh-CVE-2011-4327
> +
> +A security flaw was found in the way ssh-keysign,
> +a ssh helper program for host based authentication,
> +attempted to retrieve enough entropy information on configurations that
> +lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
> +be executed to retrieve the entropy from the system environment).
> +A local attacker could use this flaw to obtain unauthorized access to host keys
> +via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
> +http://www.openssh.com/txt/portable-keysign-rand-helper.adv
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +--- a/ssh-keysign.c
> ++++ b/ssh-keysign.c
> +@@ -170,6 +170,10 @@
> + 	key_fd[i++] = open(_PATH_HOST_DSA_KEY_FILE, O_RDONLY);
> + 	key_fd[i++] = open(_PATH_HOST_ECDSA_KEY_FILE, O_RDONLY);
> + 	key_fd[i++] = open(_PATH_HOST_RSA_KEY_FILE, O_RDONLY);
> ++	if (fcntl(key_fd[0], F_SETFD, FD_CLOEXEC) != 0 ||
> ++	    fcntl(key_fd[1], F_SETFD, FD_CLOEXEC) != 0 ||
> ++	    fcntl(key_fd[2], F_SETFD, FD_CLOEXEC) != 0)
> ++		fatal("fcntl failed");
> +
> + 	original_real_uid = getuid();	/* XXX readconf.c needs this */
> + 	if ((pw = getpwuid(original_real_uid)) == NULL)
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> index 31202d4..df77040 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> @@ -7,7 +7,7 @@ SECTION = "console/network"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
>
> -PR = "r3"
> +PR = "r4"
>
>   DEPENDS = "zlib openssl"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> @@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>              file://sshd_config \
>              file://ssh_config \
>              file://init \
> +           file://openssh-CVE-2011-4327.patch \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
>
>   PAM_SRC_URI = "file://sshd"
>


