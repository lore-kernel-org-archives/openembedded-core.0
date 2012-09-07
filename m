Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TA61k-0005jb-3b
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 23:23:48 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TA5pj-0006RS-Ro; Fri, 07 Sep 2012 23:11:24 +0200
Message-ID: <1347052157.4396.225.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 07 Sep 2012 22:09:17 +0100
In-Reply-To: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Marc Ferland <marc.ferland@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Fri, 07 Sep 2012 21:23:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 11:17 -0700, Saul Wold wrote:
> +	for i in ${IMAGE_FEATURES};
> +	do
> +		if [ ${i} = "debug-tweaks" ]; then

Using ${IMAGE_FEATURES} in a package postinst is pretty unwholesome.  If
you do:

$ IMAGE_FEATURES=debug-tweaks bitbake openssh
$ sleep $[21*86400]
$ IMAGE_FEATURES=no-debug-tweaks bitbake my-production-image

then there is a significant risk that you will accidentally get the
insecure openssh in your image without realising it.

I know dropbear does this sort of thing already but we should really try
not to add more of that stuff.  If it's an IMAGE_FEATURE then it should
really be getting handled at the rootfs level, not burned into the
packages in the feed.

p.



