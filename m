Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrWKI-0000SE-00 for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:33:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BET6Eo031279
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 15:29:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30831-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 15:29:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BESvK8031273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 15:28:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313065783.6733.132.camel@phil-desktop>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313061918.6733.120.camel@phil-desktop>
	<1313064502.14274.418.camel@rex>
	<1313065783.6733.132.camel@phil-desktop>
Date: Thu, 11 Aug 2011 15:28:19 +0100
Message-ID: <1313072899.14274.426.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Thu, 11 Aug 2011 14:33:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 13:29 +0100, Phil Blundell wrote:
> On Thu, 2011-08-11 at 13:08 +0100, Richard Purdie wrote:
> > You sound like you're doing this backwards. Pick a tune that either sets
> > TUNE_FEATURES to either contain or not contain "bigendian". TARGET_ARCH
> > then should get set appropriately and things that look at TARGET_ARCH
> > should work as before.
> > 
> > Ultimately we might want to consider if things like siteconfig should
> > use TUNE_FEATURES rather than TARGET_ARCH but it should work as things
> > stand now...
> 
> Okay.  So, if I let arch-mips.inc set TARGET_ARCH for itself then it
> picks "mipsel", which is the second case I mentioned above and leads to
> the -mips1 failure.  I guess this means that either uclibc's usage of
> overrides needs fixing, or arch-mips ought to be putting "mips" into
> ${OVERRIDES}.
> 
> More generally, it seems as though having TARGET_ARCH in ${OVERRIDES} is
> probably going to be fairly useless if that value now includes all the
> decorations for ABI features, since it is going to be hard/impossible to
> get it to match reliably.

I don't think this is a new problem, its just being brought to the
surface with these changes.

> Does the new tune model provide any variable which represents the
> underlying CPU architecture ("arm", "mips")?  That seems to be what's
> really wanted in almost all the cases where TARGET_ARCH is being used as
> an OVERRIDE.

Not currently but this does sound like a good idea.

The old approach to this was always ugly (was it i586 or i686 or x86? or
i386/i486 for that matter?). The arch/tune files provide a good place to
try and clean this up, cleaning up OVERRIDES for an added bonus.

The problem is we'd traditionally had variables which get overloaded to
many different meanings. We're hopefully getting to grips with that and
this would make another good step in that direction.

Cheers,

Richard





