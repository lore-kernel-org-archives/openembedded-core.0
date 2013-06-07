Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0792761EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 15:12:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57FHnRt026475; Fri, 7 Jun 2013 16:17:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wd906IomCwHh; Fri,  7 Jun 2013 16:17:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57FHhcI026467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 7 Jun 2013 16:17:45 +0100
Message-ID: <1370617949.6864.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 07 Jun 2013 16:12:29 +0100
In-Reply-To: <51B1F6E1.8050901@windriver.com>
References: <1370602058.6864.24.camel@ted> <51B1F6E1.8050901@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE-Core and Bitbake wrapper changes (min 2.7.3 python version)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jun 2013 15:12:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-07 at 10:06 -0500, Mark Hatle wrote:
> On 6/7/13 5:47 AM, Richard Purdie wrote:
> > Its not secret that I hate the current bitbake wrapper script and want
> > to remove it for 101 different reasons.
> >
> > I now have code which removes the need for the double execution of
> > bitbake which was the only fundamental reason we had it. The question
> > therefore remains, what to do with the other pieces of the wrapper,
> > specifically the tar and git versions checks.
> >
> > As a reminder for those who don't remember the problem here, the git
> > version is checked since we use certain parameters in the git fetcher
> > which need certain versions of git and git is in ASSUME_PROVIDED these
> > days. Its possible to trigger git operations at part time to resolve
> > revisions. tar is even more ugly since the wrong version has issues
> > extracting sstate archives. These issues mean injecting building them
> > into the dependency chain at the right point is hard.
> >
> > Personally, I think we carry around a bit too much legacy these days and
> > its starting to hurt us. I would therefore like to propose that we take
> > this opportunity to do some spring cleaning and simply error on:
> >
> > * broken tar versions
> > * too old versions of git
> > * python < 2.7.3
> >
> > The python version check would move to the oe-init-build-env script, the
> > git/tar versions to sanity.bbclass.
> 
> Can we also add the python check to bitbake as well?  My concern is not everyone 
> uses the oe-init-build-env script, so ensuring that bitbake stops immediately 
> and tells the user what's wrong is important.

We do have checks in there and these will move to the new versions. The
issue we've had before is that you get a syntax error from python trying
to *parse* bin/bitbake. We obviously try and avoid that but it can slip
in for older python versions.

> > The recommendation for anyone with these older versions would be to
> > install our standalone tools tarball which would have python 2.7.3 and
> > working versions of tar/git.
> >
> > The reason for the python version change is so we can embrace the
> > unittest improvements in 2.7 and drop all of the workarounds for pre
> > 2.7.3 bugs in bitbake. This starts to move us towards python 3, if this
> > tarball works well, we'd use the same approach to move to python 3.
> >
> > Any objections?
> 
> No objection, this seems fine.  It would be nice if there was a simple way (for 
> the tar and git cases) to be able to build them as a user step and then be able 
> to use them, but that "nice experience" can easily be handled by documentation 
> as well.

"bitbake tar-native-replacement git-native-replacement" will still be
available as things stand but you'd have to put something into the
sanity check to look at the recipes being targeted and skip the sanity
tests. Its complexity I'd prefer not to have and will suck from a
usability perspective since the user would have to remember to do this
each time. The question "can't bitbake do this itself" then comes back
but you really do need a wrapper as there is too much version specific
knowledge. So in summary, I don't want to go here for the rapidly
reducing number of users this affects.

Cheers,

Richard






