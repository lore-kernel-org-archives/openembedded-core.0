Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TANPx-0002Dk-4s
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 17:57:57 +0200
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 106B820F80;
	Sat,  8 Sep 2012 11:45:32 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute4.internal (MEProxy); Sat, 08 Sep 2012 11:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=XygH4fAVxIPVYNmYKZnHun
	H+3cU=; b=IOH1DnQXC6XPV0DR4ICOcrlqbplCvCBZXtgTKmVvi+fYe4P9eAKKKp
	j17sm8E3eMh2rl1gLaKnbOCaMCK+NF/M3gjctSQAcpV8nZfI1S6hig6vVIEOqcmJ
	+XGqqBETJ6HyeEQhBWdo/+pBU5RF9A0j0s4BQpZecPqOaXhPBSNpo=
X-Sasl-enc: ev+VQGQ8yf5nPKCIxn/EKm/OTEs7RiLFg4/9jZKqCgTA 1347119131
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id AF4668E0206;
	Sat,  8 Sep 2012 11:45:31 -0400 (EDT)
Message-ID: <1347119094.2583.20.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 08 Sep 2012 11:44:54 -0400
In-Reply-To: <1347033943.8619.0.camel@ted>
References: <1347033943.8619.0.camel@ted>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Sat, 08 Sep 2012 15:57:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 17:05 +0100, Richard Purdie wrote:
> Unfortunately whilst reruning configure and make against a project will mostly
> work there are situations where it does not correctly do the right thing.
> 
> In particular, eglibc and gcc will fail out with errors where settings
> do not match a previously built configuration. It could be argued they are
> broken but the situation is what it is. There is the possibility of more subtle
> errors too.
> 
> This patch adds a "make distclean" call to recipes where configure is
> rerunning and the sstate checksum for do_configure has changed. We could
> simply use a stamp but saving out the previous configuration checksum
> adds some data at no real overhead.

The major problem with distclean is that it completely falls over in the
scenario where the source code has changed; the new distclean won't know
about *old* object files it no longer builds, files renamed, etc.

In GNOME we just this cycle landed this patch to use "git clean -dfx"
instead of "make distclean" if possible:
https://bugzilla.gnome.org/show_bug.cgi?id=656081

It might be interesting to have an option to run:
"git init; git add .; git commit -a -m auto-import" on each tarball
build in OE.  I've been considering doing this for jhbuild.

(My latest build system *only* builds from git repositories, so
 it works there =) )




