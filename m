Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qe52f-0004bn-8h for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 14:47:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qe4z0-000258-AJ; Tue, 05 Jul 2011 14:44:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jul 2011 13:44:05 +0100
In-Reply-To: <406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309869846.2410.3.camel@phil-desktop>
Mime-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
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
X-List-Received-Date: Tue, 05 Jul 2011 12:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:01 +0200, Anders Darander wrote:
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 943252a..26ee416 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -149,7 +149,6 @@ kernel_do_install() {

        #
        # We don't want to leave host-arch binaries in /sysroots, so
        # we clean the scripts dir while leaving the generated config

>  	# and include files.
>  	#
>  	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> -	make -C $kerneldir _mrproper_scripts
>  	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>  	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;

Did you verify that this doesn't introduce any new QA warnings during
packaging?  Presumably that line was originally added for a reason and
it seems a bit surprising that just deleting it without any replacement
is the right thing to do.

Also, if the scripts dir isn't being cleaned anymore, I guess the
preceding comment should be adjusted to match the new reality.

p.




