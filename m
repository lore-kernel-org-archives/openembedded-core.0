Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QlJft-0004mB-Jl for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 13:50:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PBk69R017413
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:46:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15214-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:46:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PBjxgW017407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:45:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0c23fefb55154f9a35ec9e942d011728e6c8f6c1.1311574519.git.xiaofeng.yan@windriver.com>
References: <cover.1311574519.git.xiaofeng.yan@windriver.com>
	<0c23fefb55154f9a35ec9e942d011728e6c8f6c1.1311574519.git.xiaofeng.yan@windriver.com>
Date: Mon, 25 Jul 2011 12:45:53 +0100
Message-ID: <1311594353.2344.176.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] openssh: Support PAM
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
X-List-Received-Date: Mon, 25 Jul 2011 11:50:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 16:34 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Change as follows:
> * Adding configuration file "sshd" in /etc/pam.d/ for supporting pam.
> * Using four spaces instead of tab
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../openssh/openssh-5.8p2/sshd                     |   10 +++
>  meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   77 +++++++++++---------
>  2 files changed, 53 insertions(+), 34 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
> new file mode 100644
> index 0000000..4882e58
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
> @@ -0,0 +1,10 @@
> +#%PAM-1.0
> +
> +auth       include      common-auth
> +account    required     pam_nologin.so
> +account    include      common-account
> +password   include      common-password
> +session    optional     pam_keyinit.so force revoke
> +session    include      common-session
> +session    required     pam_loginuid.so
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> index e23069c..d5ccba1 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> @@ -7,13 +7,11 @@ SECTION = "console/network"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  DEPENDS = "zlib openssl"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> -
>  RPROVIDES = "ssh sshd"
> -
>  CONFLICTS_${PN} = "dropbear"
>  RCONFLICTS_${PN}-sshd = "dropbear"
>  RCONFLICTS_${PN}-keygen = "ssh-keygen"
> @@ -23,7 +21,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>             file://sshd_config \
>             file://ssh_config \
>             file://init \
> -          "
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
> +
> +PAM_SRC_URI = "file://sshd"
>  SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
>  SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
>  
> @@ -47,23 +47,32 @@ EXTRA_OECONF = "--with-rand-helper=no \
>  EXTRA_OECONF_append_libc-uclibc=" --without-pam"
>  
>  do_configure_prepend () {
> -	if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
> -		cp aclocal.m4 acinclude.m4
> -	fi
> +
> +    if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
> +        cp aclocal.m4 acinclude.m4
> +    fi
>  }

Please resubmit this without changing the whitespace in the file!

Cheers,

Richard



