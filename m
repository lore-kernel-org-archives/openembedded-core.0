Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 650B977210
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 02:33:00 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=[10.79.148.125])
	by smtp.twobit.us with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1aZr9g-0003GS-QO; Sun, 28 Feb 2016 02:32:21 +0000
To: Saul Wold <sgw@linux.intel.com>
References: <1455990959-5896-1-git-send-email-flihp@twobit.us>
From: Philip Tricca <flihp@twobit.us>
Message-ID: <56D25C65.4040707@twobit.us>
Date: Sat, 27 Feb 2016 18:33:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1455990959-5896-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysvinit-inittab: Move start_getty scrip to base_bindir.
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
X-List-Received-Date: Sun, 28 Feb 2016 02:33:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping. Any thoughts on this Saul?

Thanks,
Philip

On 02/20/2016 09:55 AM, Philip Tricca wrote:
> When this file is in ${sysconfdir}/init.d, SELinux labels it as a generic
> init script (initrc_t). This causes problms at runtime because SELinux
> doesn't let the login process execute generic init script. Moving this
> helper script to base_bindir results in it being labeled as a generic
> binary (bin_t). Nearly every SELinux domain is allowed to execute
> generic binaries and the login process is one of them.
> 
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index f539da8..c5b8cdc 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -17,9 +17,9 @@ do_compile() {
>  
>  do_install() {
>      install -d ${D}${sysconfdir}
> -    install -d ${D}${sysconfdir}/init.d
>      install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> -    install -m 0755 ${WORKDIR}/start_getty ${D}${sysconfdir}/init.d/start_getty
> +    install -d ${D}${base_bindir}
> +    install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_getty
>  
>      set -x
>      tmp="${SERIAL_CONSOLES}"
> @@ -27,7 +27,7 @@ do_install() {
>      do
>  	j=`echo ${i} | sed s/\;/\ /g`
>  	label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
> -	echo "$label:12345:respawn:${sysconfdir}/init.d/start_getty ${j}" >> ${D}${sysconfdir}/inittab
> +	echo "$label:12345:respawn:${base_bindir}/start_getty ${j}" >> ${D}${sysconfdir}/inittab
>      done
>  
>      if [ "${USE_VT}" = "1" ]; then
> @@ -76,7 +76,7 @@ fi
>  # Set PACKAGE_ARCH appropriately.
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -FILES_${PN} = "${sysconfdir}/inittab ${sysconfdir}/init.d/start_getty"
> +FILES_${PN} = "${sysconfdir}/inittab ${base_bindir}/start_getty"
>  CONFFILES_${PN} = "${sysconfdir}/inittab"
>  
>  USE_VT ?= "1"
> 


