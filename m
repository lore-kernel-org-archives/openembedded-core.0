Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0B360616;
	Wed,  2 Dec 2015 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB28j9KT003766; Wed, 2 Dec 2015 08:45:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uQGpxQZElg3v; Wed,  2 Dec 2015 08:45:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB28itsQ003755
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Dec 2015 08:45:07 GMT
Message-ID: <1449045895.14864.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 02 Dec 2015 08:44:55 +0000
In-Reply-To: <565C6907.3020501@gmail.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<565C6907.3020501@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 08:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-11-30 at 10:19 -0500, Trevor Woerner wrote:
> On 11/26/15 16:00, Paul Eggleton wrote:
> > I'm also 
> > trying to ensure that the patch validation is generic enough so it can live in 
> > OE-Core, and thus we can easily update and refine it over time in line with the 
> > code itself as well as encourage submitters to use the script on their own 
> > changes before sending.
> 
> This all sounds like an improvement and is therefore a step in the right
> direction :-)
> 
> A while back I had the idea of "porting" the kernel's "checkpatch.pl" to
> The Yocto Project (it was around the same time that I was trying to
> float the whole "Maintainers File" idea too, since I was also trying to
> re-purpose "get-maintainer.pl" as well). About one minute into that
> effort I realized the existing *.bb files were all over the place in
> terms of the order of statements and the order of the blocks of
> statements. At that time I found one recipe style guide from OE, and
> another one from The Yocto Project, each of which described a slightly
> different preference. So I asked on the mailing list and quickly
> discovered that both groups prefer a different style.
> 
> I'm not saying this job isn't worth doing, but I am pointing out there's
> the potential for feathers to be ruffled on both sides if someone tries
> to produce a definitive style guide for recipe files and then enforces
> it in an automated way. Since it is the OpenEmbedded Project's job to
> provide the recipes for The Yocto Project, I'm guessing this question
> needs to be decided by them? If that sounds reasonable, then maybe The
> Yocto Project needs to acquiesce to OE's decision?
> 
> Instead of cross-posting, maybe this would be a good email for the new
> architecture list (CC'ed)?

I think the areas where there are disagreements are comparatively small,
really just on shell whitespace. Where they do exist, they are
problematic, not least as some layers effectively ignored an agreement
made by the TSC simply because they didn't agree with it. It basically
means the OE TSC only applies to OE-Core as far as I can tell, which is
sad but is the decision that was made. This also means the TSC has no
real influence over any proposed coding style being used outside
OE-Core.

I do still believe shell whitespace changes would cause significant
patch compatibility issues, I know I disagree on Martin over that. I
still don't like the idea of people blindly running a formatting script
since we'll than start seeing patches every time there is a single space
in the wrong place. We simply don't want that amount of churn on the
metadata.

I can imagine several people replying and saying that patch churn is not
an issue but having seen the things people send patches for, I believe
it will be. I don't want to encourage such things as I believe there are
better things to do with our time (mine included as I'd have to review
them, even to just say 'no').

The maintainers file is a different problem and its one of maintenance,
and more specifically what being listed means, who can be listed, how
that listing can be changed and so on. The Yocto Project has some notion
of maintainer and there its easy, Ross and I can made decisions on who
is listed and what those people are expected to do and we can make it
work (its how we ensure things get upgraded with some regularity). For
OE, who would do this and what would the maintainer file mean? If
someone patches something, are they required to cc the maintainer on
patches for example? (that would imply workflow overhead) What if they
don't cc a maintainer? Should we be forced to revert such a patch?

In many ways its like the "what is a stable branch?" question. Some
people want to use a maintainers file as a way of having a veto on
certain patches. Others want to use it as a way of finding people to fix
bugs. Others again want it to help review patches. The uses vary and you
need a clear definition about what its being used for to make it work.

If someone wants to put together a proposal about which problem this
solves, with clear definitions/charter about how it would all work,
great, but I've seen a lot of problems with such files and I worry it
creates more problems than it would solve.

Cheers,

Richard



