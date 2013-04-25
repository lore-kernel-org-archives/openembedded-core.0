Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVKNo-0004ia-4j for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:30:40 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVK6h-00043P-34
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:12:55 +0200
Message-ID: <1366888374.14512.78.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 12:12:54 +0100
In-Reply-To: <1349177925.15753.140.camel@ted>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Thu, 25 Apr 2013 11:30:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 12:38 +0100, Richard Purdie wrote:
> On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
> > On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
> > > Hasn't Paul added a general mechanism for doing this so we could add
> > > this feature a level higher so that it could be used by all packaging
> > > formats?
> > 
> > Ah, possibly.  I'll have a look.  Can you give me a pointer to the
> > mechanism you were thinking of?
> 
> Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
> of dbg packages.

I've somewhat belatedly gotten around to using this and encountered a
couple of issuettes:

1. There was a spurious-looking RRECOMMENDS_${PN}-dbg in bitbake.conf
which was causing ${PN} to be dragged into the image whenever ${PN}-dbg
was installed.  This is undesirable because it means that, for example,
any image which includes sysvinit-pidof will end up installing sysvinit
and this might cause quite drastic changes to the behaviour of the
resulting image.

2. Having fixed the above I'm now left with a couple of file conflicts
in the -dbg packages.  For example, sysvinit and util-linux both
ship /sbin/sulogin and so sysvinit-dbg and util-linux-dbg both want to
install /sbin/.debug/sulogin.  This is unfortunate if you have an image
which uses, say, sysvinit-pidof and util-linux-blkid.

I'm not quite sure what the right way to fix (2) is.  I suppose in an
ideal world the -dbg packages would be separated in the same way the
parent binary packages are, but that doesn't look entirely
straightforward to arrange.

p.




