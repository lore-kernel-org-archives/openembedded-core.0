Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Slo0I-0005mL-3u
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 23:17:54 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Slnpf-0000ja-9e
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 23:06:55 +0200
Message-ID: <1341263124.2886.44.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 22:05:24 +0100
In-Reply-To: <4FF20578.9030109@windriver.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
	<28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
	<1341259953.2886.29.camel@x121e.pbcl.net>
	<4FF20578.9030109@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 6/6] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Mon, 02 Jul 2012 21:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 15:32 -0500, Mark Hatle wrote:
> On 7/2/12 3:12 PM, Phil Blundell wrote:
> > On Sat, 2012-06-30 at 00:07 -0500, Mark Hatle wrote:
> >> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >> index 4f50376..7e41982 100644
> >> --- a/meta/classes/image.bbclass
> >> +++ b/meta/classes/image.bbclass
> >> @@ -3,6 +3,11 @@ inherit rootfs_${IMAGE_PKGTYPE}
> >>   IMAGETEST ?= "dummy"
> >>   inherit imagetest-${IMAGETEST}
> >>
> >> +inherit populate_sdk_base
> >
> > This seems to haul a vast amount of stuff into image.bbclass.  Is it
> > really necessary to have all that in there by default?
> 
> Yes, in order to build an SDK that matches an image, it is.
> 
> We need to have all of the code that is needed for both IMAGE and SDK 
> generation.  The SDK code is only active if and only if you call the 
> populate_sdk task.

Can the SDK bits not live in another class which is applied on top of
the images via BBCLASSEXTEND or some such?  I don't entirely understand
why this all needs to be in image.bbclass if, as you say, it's inactive
by default.  

The code itself looks harmless enough to a casual inspection, but the
increased number of nested "inherits" does make it rather more difficult
to understand what's going on, since you have to inspect all of the
inherited files to understand whether or not they are doing anything.

If we really are going to have this included in image.bbclass, though,
then it might be worth trying to eliminate the duplicate definitions
between image.bbclass and populate_sdk{_base}.bbclass.  I think PID and
EXCLUDE_FROM_WORLD, at least, are defined in both places and I suspect
there are probably some more. 

p.




