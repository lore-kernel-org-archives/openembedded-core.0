Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 367D777109
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:11:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u11IBd5n030872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 1 Feb 2016 10:11:40 -0800
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Feb 2016 10:11:39 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 46DA02800BD; Mon,
	1 Feb 2016 13:11:39 -0500 (EST)
Date: Mon, 1 Feb 2016 13:11:39 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20160201181138.GF8889@windriver.com>
References: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
	<1454276439.7421.28.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1454276439.7421.28.camel@pbcl.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] git: add site_perl to packaged files to fix QA install error
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
X-List-Received-Date: Mon, 01 Feb 2016 18:11:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] git: add site_perl to packaged files to fix QA install error] On 31/01/2016 (Sun 21:40) Phil Blundell wrote:

> On Sun, 2016-01-31 at 13:27 -0500, Paul Gortmaker wrote:
> >  FILES_${PN}-perltools += " \
> >      ${PERLTOOLS} \
> >      ${libdir}/perl \
> > +    ${libdir}/site_perl \
> >      ${datadir}/perl \
> 
> It seems a bit wrong for git (or any other package) to be installing
> itself into site-perl.  That path is meant to be for stuff installed
> locally via cpan, right?

I'm not up to speed on perl/cpan specs, but yeah off the cuff it does
seem rather odd for it to be sprawling out into any perl dir IMHO.

Even the perl bb itself seems to actively clobber site_perl for the
non native case.

> 
> So, rather than patching the FILES to accept site-perl I think it would
> be better to find out why git is suddenly putting stuff there and stop

Interestingly enough, you won't find site_perl mentioned anywhere in a
checkout of git 2.7 itself.  Nor does it appear here:

paul@yow-cube1:~/poky/meta/recipes-devtools/git$ git grep site_perl ./
paul@yow-cube1:~/poky/meta/recipes-devtools/git$ 

I'd reverted the git uprev, no change.  There was a perl uprev that was
recent and I reverted that too as a test but no change.  Unfortunately
I'm not exactly sure when it got broke, so I'd probably just have to
guess and go back a week or two, if I wanted to try and bisect it.

> it.  For what it's worth, I just built git from oe-core master and
> didn't see this problem so it's possible that the breakage is being
> caused by something outside oe-core itself.

Interesting.  I've not got any local bbappends for git so I don't know
what is the trigger.  I'm guessing SVN is perhaps involved, since all
the "extra" files are related to git-svn.  And I'm loosely based on the
self-hosting build appliance here, which IIRC has svn in the pkglist.
So maybe that triggers git to do additional svn import features?

I'm going to locally bbappend do_install to clobber that crap, and in
the meantime if I get a chance to investigate in more detail, I'll
follow up with what I find.  At least we've primed google for the next
guy who runs into this and searches...

P.
--


> 
> p.
> 
> 

