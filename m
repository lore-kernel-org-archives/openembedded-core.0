Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMGj5-00075l-Rs for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:38:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9ZBlS004794
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:35:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31622-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:35:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9Z2Za004763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:35:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305623837.2429.126.camel@phil-desktop>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<1305623837.2429.126.camel@phil-desktop>
Date: Tue, 17 May 2011 10:34:59 +0100
Message-ID: <1305624899.3424.209.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Tue, 17 May 2011 09:38:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 10:17 +0100, Phil Blundell wrote:
> On Tue, 2011-05-17 at 01:13 +0100, Richard Purdie wrote:
> > The more I looked at that patch, the more holes I could see in what we
> > were doing (and what Angstrom currently does). I started playing around
> > with the patch below which tried to improve on that idea.
> > 
> > I then concluded that we might be able to do something like:
> > 
> > MACHINEOVERRIDES := "${MACHINE}"
> > MACHINE_append = "-uclibc"
> > 
> > since what we're really trying to do in the uclibc case is replace
> > anything MACHINE specific with something containing uclibc?
> 
> I think that particular change would be a bad idea for several reasons.
> Firstly, and perhaps most importantly, MACHINE is a primary
> configuration variable and having it magically change under the hood
> seems like it would violate the principle of least surprise.  Secondly,
> at a practical level, this would make it hard to use MACHINE for
> anything other than overrides.  And thirdly, at a conceptual level, the
> choice of libc is really nothing to do with the MACHINE.
> 
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 553c6a2..354668f 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> 
> This patch looks good to me (and I would definitely prefer this to the
> solution above).  The lines that you have deleted from tclibc-uclibc.inc
> were causing my uclibc builds to fail so I would certainly be glad to
> have them removed.

No question those lines are "wrong" but the solutions various people are
using out there are "wrong" in various ways too (including what is
'working' in ansgtrom at the moment).

A solution where you replace 80% of uses of a variable with a new
variable as per my proposed patch doesn't quite feel right either.

How about this idea:

TMPDIR_append = "-uclibc"

since sstate cache is deliberately outside TMPDIR so anything that can
be reused between builds will automatically.

Simple, effective and addresses a lot of the bugs I can see in the other
approaches...

Cheers,

Richard



