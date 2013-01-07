Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsBEn-0006eu-Rz for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:51:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BaKWT004045;
	Mon, 7 Jan 2013 11:36:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32506-09; Mon,  7 Jan 2013 11:36:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BaBw3004039
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:36:11 GMT
Message-ID: <1357558573.28649.231.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 07 Jan 2013 11:36:13 +0000
In-Reply-To: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
References: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 11:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 12:15 +0100, Martin Jansa wrote:
> * IMAGE_FEATURES are image specific, but dropbear recipe isn't
> * if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
>   IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
>   to debug as expected, but if you add debug-tweaks only in
>   your-own-debug-image, then dropbear never sees debug-tweaks and
>   your-own-debug-image won't allow empty password login.
> * best way would be to patch dropbear to enable empty password by
>   runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMMAND
>   like openssh_allow_empty_password does, see
>   http://permalink.gmane.org/gmane.network.ssh.dropbear/845
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index aa313df..2c170c6 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
>  HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>  SECTION = "console/network"
>  
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  # some files are from other projects and have others license terms:
>  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> @@ -40,7 +40,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
>  EXTRA_OECONF += "\
>   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
>  
> -DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
> +DISTRO_TYPE ?= "debug"
>  
>  do_install() {
>  	install -d ${D}${sysconfdir} \

How about we ditch DISTRO_TYPE entirely and check for "debug-tweaks" in
DISTRO_FEATURES? This would bring it more into line with the other
places we do things like this.

FWIW I agree this should ideally be runtime configured and we should
really add an enhancement request to the bugzilla for that (or patches
welcome).

Cheers,

Richard




