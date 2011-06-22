Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZSZH-00037g-4M for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:54:27 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZSVq-0003WT-PH
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:50:54 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d841fe05df49bcc07373ab510be5ddeb9f97324c.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
	<d841fe05df49bcc07373ab510be5ddeb9f97324c.1308763995.git.mark.hatle@windriver.com>
Date: Wed, 22 Jun 2011 19:50:48 +0100
Message-ID: <1308768648.3049.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 08/40] perf: Fix linux-tools to ensure perf is installed under "fakeroot"
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
X-List-Received-Date: Wed, 22 Jun 2011 18:54:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 12:36 -0500, Mark Hatle wrote:
> If perf isn't installed under "fakeroot" (pseudo) control, all of the files
> are given the build user's uid/gid.

The bit about do_install_perf() seems reasonable, but why does
do_compile_perf() need to run under fakeroot?

> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> index ef81650..88a1c5b 100644
> --- a/meta/recipes-kernel/linux/linux-tools.inc
> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> @@ -6,11 +6,11 @@ do_compile_perf_libc-uclibc () {
>  do_install_perf_libc-uclibc () {
>  	:
>  }
> -do_compile_perf() {
> +fakeroot do_compile_perf() {
>  	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
>  }
>  
> -do_install_perf() {
> +fakeroot do_install_perf() {
>  	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} DESTDIR=${D} install NO_NEWT=1 NO_DWARF=1
>  }
>  

p.




