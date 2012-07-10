Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sod4Q-0006mr-Fn for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:13:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AG2d62018803
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 17:02:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18303-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 17:02:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AG2Wfn018797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 17:02:33 +0100
Message-ID: <1341936154.1294.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 17:02:34 +0100
In-Reply-To: <d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
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
X-List-Received-Date: Tue, 10 Jul 2012 16:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 17:59 +0300, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-core/busybox/busybox.inc |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 82137a3..17ff442 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -180,9 +180,13 @@ do_install () {
>  	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
>  		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
>  	fi
> -	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> -		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
> -	fi
> +	case "${MACHINE_FEATURES}" in
> +	*rtc*)
> +		if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> +			install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
> +		fi
> +		;;
> +	esac
>  	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
>  		install -d ${D}${sysconfdir}/udhcpc.d
>  		install -d ${D}${datadir}/udhcpc

This makes busybox machine specific? Is that really what you want to do?

Cheers,

Richard



