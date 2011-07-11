Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgCPX-0003TH-Te for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 11:04:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgCLm-0001j3-6w; Mon, 11 Jul 2011 11:00:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: celston@katalix.com
Date: Mon, 11 Jul 2011 10:00:18 +0100
In-Reply-To: <1310374426.10512.3.camel@desktop.home>
References: <1309432228.7987.14.camel@desktop.home>
	<4E0D0333.8080706@linux.intel.com>	<1309511209.7987.42.camel@desktop.home>
	<1309512008.2633.14.camel@phil-desktop>
	<4E14E0C7.6040604@linux.intel.com>
	<1310374426.10512.3.camel@desktop.home>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310374822.6337.150.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
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
X-List-Received-Date: Mon, 11 Jul 2011 09:04:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 09:53 +0100, Chris Elston wrote:
> +       STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
> +       mkdir -p `dirname ${STATUS}`

Not that it's a massive deal, but this call to "dirname" is redundant
since dirname ${STATUS} is ${IMAGE_ROOTFS}${opkglibdir} by definition.

> +       # prime the status file with bits that we don't want
> +       for i in ${BAD_RECOMMENDATIONS}; do
> +               infln="`opkg-cl ${IPKG_ARGS} info $i | grep -e
> '^Package:' -e '^Architecture:' -e '^Version:'`"
> +               if [ ! -z "$infln" ]; then
> +                       echo "$infln" >> $STATUS

Reading this again I wonder what would happen if one of the packages
named in BAD_RECOMMENDATIONS doesn't actually exist.  Can you verify
that this code does something sensible in that case?

p.




