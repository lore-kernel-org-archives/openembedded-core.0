Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EEC906EC6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:12:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2HBCTB4030696; Mon, 17 Mar 2014 11:12:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ebvH0vPTQKTo; Mon, 17 Mar 2014 11:12:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2HBCQMt030689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 17 Mar 2014 11:12:27 GMT
Message-ID: <1395054740.3808.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Detlev Zundel <dzu@denx.de>
Date: Mon, 17 Mar 2014 11:12:20 +0000
In-Reply-To: <m27g7tqeoi.fsf@lamuella.denx.de>
References: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
	<1387795367.11527.1.camel@ted> <m2ob19robv.fsf@lamuella.denx.de>
	<1395010710.3808.15.camel@ted> <m27g7tqeoi.fsf@lamuella.denx.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Mon, 17 Mar 2014 11:12:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-17 at 11:53 +0100, Detlev Zundel wrote:
> Hi Richard,
> 
> thanks for your answer.
> 
> > Imagine you set your recipe to some invalid SRCREV. It was possible that
> > the fetcher would notice it was missing and attempt to fetch it from
> > upstream (so far so good), then silently continue the build even though
> > it had been unable to find the revision.
> 
> But isn't that the real problem that there was no error in this case?

Yes, that is the real error. The change you pointed to adds in such a
check and raises an error.

> > I think we can agree that is bad, if it can't find something specified,
> > it should error. This is why we added the extra checks to ensure that
> > the revision really does exist after we fetch from upstream.
> 
> Of course I agree that this is bad, but isn't it possible to fix the
> "original problem", i.e. not erroring out after not finding a SRCREV
> even after fetching from upstream?  It is still unclear to me why we
> need to add another check (and another input data) if we agree on this
> error condition.  But maybe this isn't easy to implement?

This is exactly what the patch you pointed at does.

There were other changes to the git fetcher around this time and perhaps
your real issue is with one of the other changes rather than the one you
linked to?

I suspect you're more concerned that the branch name needs to be
specified correctly, i.e. this change:

http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/fetch2/git.py?id=2354250a95eab484459f41f8715ae112295c2174

We have recipes that care quite deeply that the branch structure being
fetched matches what is in the remote tree. This includes branches that
may over time be merged with different names, we needed those updates
but they were not always being detected. The check for the revision
therefore wasn't enough, we needed to ensure it matched the branch/tag
being requested, not just that it was present.

I understand this change is a little disruptive but deterministic builds
are extremely important and we uncovered real issues with this fix.

If you are having a problem adapting a recipe please explain what the
problem is and we'll see if we can help figure out a solution.

Cheers,

Richard


