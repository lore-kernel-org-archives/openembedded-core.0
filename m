Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMGRm-0006kL-5n for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:20:10 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMFzh-0004U1-DB
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 10:51:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305591231.3424.152.camel@rex>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 10:17:17 +0100
Message-ID: <1305623837.2429.126.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Tue, 17 May 2011 09:20:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 01:13 +0100, Richard Purdie wrote:
> The more I looked at that patch, the more holes I could see in what we
> were doing (and what Angstrom currently does). I started playing around
> with the patch below which tried to improve on that idea.
> 
> I then concluded that we might be able to do something like:
> 
> MACHINEOVERRIDES := "${MACHINE}"
> MACHINE_append = "-uclibc"
> 
> since what we're really trying to do in the uclibc case is replace
> anything MACHINE specific with something containing uclibc?

I think that particular change would be a bad idea for several reasons.
Firstly, and perhaps most importantly, MACHINE is a primary
configuration variable and having it magically change under the hood
seems like it would violate the principle of least surprise.  Secondly,
at a practical level, this would make it hard to use MACHINE for
anything other than overrides.  And thirdly, at a conceptual level, the
choice of libc is really nothing to do with the MACHINE.

> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 553c6a2..354668f 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass

This patch looks good to me (and I would definitely prefer this to the
solution above).  The lines that you have deleted from tclibc-uclibc.inc
were causing my uclibc builds to fail so I would certainly be glad to
have them removed.

p.



