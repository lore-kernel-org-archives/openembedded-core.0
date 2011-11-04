Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RMRVh-0007m3-3u
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:41:13 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RMRPl-0004mU-EF
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:35:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1320441941-30850-1-git-send-email-msm@freescale.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
Date: Fri, 04 Nov 2011 21:34:59 +0000
Message-ID: <1320442499.3296.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Fri, 04 Nov 2011 21:41:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-04 at 16:25 -0500, Matthew McClintock wrote:
> v2: handle case where SERIAL_CONSOLES is not defined
> 
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index ba60c74..adab262 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -25,6 +25,18 @@ do_install() {
>      if [ ! -z "${SERIAL_CONSOLE}" ]; then
>          echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
>      fi
> +
> +    idx=0
> +    tmp="${SERIAL_CONSOLES}"
> +    if [ "x" != "x$tmp" ]; then
> +	for i in $tmp
> +	do
> +	    j=`echo ${i} | sed s/\;/\ /g`
> +	    echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +	    idx=`expr $idx + 1`
> +	done
> +    fi
> +

Did you test that this actually solves the problem?  It looks to me as
though it will still do the wrong thing if the variable is not defined
at all (as opposed to being defined to the empty string).  The added
"if" statement doesn't actually achieve much since, if $tmp is the empty
string, the for-loop wouldn't have executed anyway and there is no need
for an extra guard.

Also, for what it's worth, the "x$tmp" idiom is unnecessary if you're
going to quote the strings.

p.




