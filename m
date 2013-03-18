Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHb1s-0005TN-BK for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 15:27:26 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IEIGj3007133; Mon, 18 Mar 2013 14:19:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YcbNkw0xEBSX; Mon, 18 Mar 2013 14:19:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IEJ1QU007185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Mar 2013 14:19:04 GMT
Message-ID: <1363615788.16482.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date: Mon, 18 Mar 2013 14:09:48 +0000
In-Reply-To: <1363613908-20116-2-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1363613908-20116-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] connman-conf: Move the setup script into /usr/lib/connman
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
X-List-Received-Date: Mon, 18 Mar 2013 14:27:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-18 at 15:38 +0200, Jukka Rissanen wrote:
> The /etc/connman is not suitable for the setup script.
> There are other connman related scripts in /usr/lib/connman
> so moving the wired setup script there.
> 
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
> index 7b99953..6ecfbfb 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -6,16 +6,18 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
>  SRC_URI_append_qemuall = "file://wired.config \
>                            file://wired-setup \
>                           "
> -PR = "r1"
> +PR = "r2"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> +FILES_${PN} = "${localstatedir}/* ${libdir}/*"
> +
>  do_install() {
>      #Configure Wired network interface in case of qemu* machines
>      if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
>          install -d ${D}${localstatedir}/lib/connman
>          install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
> -        install -d ${D}${sysconfdir}/connman
> -        install -m 0755 ${WORKDIR}/wired-setup ${D}${sysconfdir}/connman
> +        install -d ${D}${libdir}/connman
> +        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
>      fi
>  }

You've moved the files, fine, but what uses them and do we need to
update the caller?

Cheers,

Richard




