Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ4D2-0006rr-QX for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 18:53:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LGoKMV023592
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 17:50:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23173-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 17:50:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LGoADq023583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 17:50:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308668047.21613.30.camel@phil-desktop>
References: <20110621140419.GA8589@raven.pace.internal>
	<1308668047.21613.30.camel@phil-desktop>
Date: Tue, 21 Jun 2011 17:49:54 +0100
Message-ID: <1308674994.20015.33.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Tue, 21 Jun 2011 16:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 15:54 +0100, Phil Blundell wrote:
> On Tue, 2011-06-21 at 15:04 +0100, Tom Parkin wrote:
> > The attached patch allows me to (at least) assemble the bitbake task
> > list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
> > approach, though.
> 
> Do you know why glib-2.0.inc is doing this crazy thing in the first
> place?  If we're going to have code in the config files to effectively
> make it think that USE_NLS is always on, maybe that check should just be
> removed.
> 
> You're right though that the current line in tclibc-uclibc.inc is
> clearly just wrong and should be either fixed or deleted.

It does appear to work due to code in base.bbclass which does:

    use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
    if use_nls != None:
        bb.data.setVar('USE_NLS', use_nls, d)

where this code predates the use of pn-${PN} in overrides.

Nowadays it makes sense just to use the pn- override and we should drop
this legacy stuff IMO.

Cheers,

Richard



