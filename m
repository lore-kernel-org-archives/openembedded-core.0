Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMirX-0003uC-Ob for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 17:40:39 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMiol-0006rb-Cj
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 17:37:47 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305649331.3424.259.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
Date: Wed, 18 May 2011 16:37:41 +0100
Message-ID: <1305733061.18415.98.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Wed, 18 May 2011 15:40:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 17:22 +0100, Richard Purdie wrote:
> On Tue, 2011-05-17 at 15:50 +0100, Phil Blundell wrote:
> > I guess I could teach remove_packaging_data_files() to not create the
> > empty directory if O_P_M=="none".  Would you be happier with that?
> 
> Mostly. The question remains what happens if there are postinstalls that
> are expecting to run on the device. I'm guessing that is why the mkdir
> is there since at present we don't want to break the postinstalls.

The comment says something about ensuring that the lock directory
exists, presumably for future invocations of opkg.  I guess this is to
support O_P_M="add" kind of semantics.  

As far as I know there's no other reason that postinsts should
expect/require the opkg directory to exist.  So I think it should
probably be safe just to delete it if O_P_M="none".

p.



