Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1UE6vv-0005n8-W0
	for Openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 00:42:40 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1UE6fv-00053m-7P; Sat, 09 Mar 2013 00:26:07 +0100
Message-ID: <1362785133.19943.9.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Rich Dubielzig <rich.dubielzig@windriver.com>
Date: Fri, 08 Mar 2013 23:25:33 +0000
In-Reply-To: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
References: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Handle QA warnings in nativesdk (denzil)
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
X-List-Received-Date: Fri, 08 Mar 2013 23:42:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-08 at 14:07 -0800, Rich Dubielzig wrote:
> -FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
> +FILES_${PN}-utils = "${bindir}/* ${sbindir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"

Is that really correct?  There seem to be several slightly dubious
things about this patch:

1. In the version of oe-core I'm looking at, both ldconfig and
ld.so.conf go into ${PN} if USE_LDCONFIG=1, which is the default.
(Arguably this ought really to be a DISTRO_FEATURE nowadays.)  So,
adding them unconditionally to PN-utils seems like it is confusing at
best.

2. ld.so.conf isn't a utility and it isn't entirely obvious that it
belongs in PN-utils at all.

3. Your commit message didn't mention the change to ldconfig, and also
didn't give any details of what exactly the QA warnings were that it was
fixing.

thanks

p.




