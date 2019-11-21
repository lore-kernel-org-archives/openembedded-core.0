Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 348897F7CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:09:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JmJb0xnwz4c;
	Thu, 21 Nov 2019 18:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574356191;
	bh=9vhqDi72EY8FxfFpqtnGTqQmJL8NGPj+JLXryvUBCqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSVhnbTdbbquQlUpqDiU3OCiM4+vD8QQQq3nJffb52dTMtaE9wRjUUbC+Iw+nJnUq
	CATRce+yOz+4N1KofjeyIJtyZpqMkOS0KuBSh9ibi1eC77ZAw09OVUh+BA+jnK8y7/
	Hh2Ztto68uagFwtq+2GfzXYNxmT5n1OqDZmWKg6fZd/nCAFNFJErCRYoHtvxrz9EvR
	PlRuTSIcBGD8TDeFJEcy0TFoQvrPSDkxVICehalePm9F3Jf6ya3ceevpzmCxAfOEXj
	JErWIVMR6ouWpvC0XzJ4gCnHhfZOYJ/HGMZ6if9WNXVjuiUmMm7+bibC64C4B9Kyjy
	EDWJhhjGEpyrdpB3f35EwBr+1fLVQi5q0vj5lr05jKSeo4cZrpvzLHezuez/ocq5Dd
	VWS8YNPaNxh2r8gaHv+QKhIi2bbJrObzNqgBtfaoh0H7ppujbupPwqNGrMeFaXhCFk
	BNEQQF4zT171voytl3YP4s8+O60vax9nWy+4X68GBA3ps434971Iz9JdLaOy3KGFlf
	MKwsmo25bT/Npuz23u0K9zFOc3/esM7nM00BFA9HgxAr0ObX+AUyfKQw6kJb1+9fp3
	bGYIxqZB7YrWYgHTktjZHLHdNIf2e4GoQuKrqTR6OsJyA3zaImts/XOBkBk2VYh5OY
	AjxXsBtgbJFmN/hz3rJ63C5g=
Date: Thu, 21 Nov 2019 19:09:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191121170948.GC28013@localhost>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
	<ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 17:09:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 21, 2019 at 04:54:12PM +0000, Richard Purdie wrote:
> On Thu, 2019-11-21 at 17:50 +0200, Adrian Bunk wrote:
> > On Thu, Nov 21, 2019 at 03:02:07PM +0000, Richard Purdie wrote:
> > > Older versions break opkg-build when reproducible builds are
> > > enabled.
> > > Rather than trying to be selective based on which features are
> > > enabled,
> > > lets just make this a minimum version.
> > > ...
> > > +    if LooseVersion(version) < LooseVersion("1.28"):
> > > +        return "Your version of tar is older than 1.28 and does
> > > not have the support needed to enable reproducible builds. Please
> > > install a newer version of tar.\n"
> > > ...
> > 
> > How does "Please install a newer version of tar" work in practice
> > on a supported host distribution like CentOS 7 ?
> > 
> > As user I would expect such things to just work when using
> > a distribution that is documented as supported.
> 
> We're going to have to solve this issue on our autobuilder. Centos7
> already causes problems and there is documetation in the manual about
> it:
> 
> https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#centos-packages
> 
> (and the need to use EPEL)
> 
> Unfortunately a newer tar isn't in EPEL.

EPEL does not contain more recent versions of packages already
in RHEL/CentOS.

> I don't have a solution yet, I do know that silently creating empty
> packages is much worst than telling a user something won't work though.
> 
> Any suggestions on how we fix it?

My preferred solution would be to replace CentOS 7 with CentOS 8
as supported distribution, which would also allow to drop hacks
for two major releases of gcc in various places.

If all other supported distribution already ship 1.28 this would
solve your problem.

> (We could make opkg-utils-native depend on tar-native but for most
> people that isn't necessary so it seems a shame).

Building tar-native is not something that would strike me as 
problematic.

Add a comment why it was added, and that it can be removed again
whenever the oldest supported distribution is recent enough.

> Cheers,
> 
> Richard

cu
Adrian

