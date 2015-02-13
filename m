Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 284FE733DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:56:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D6u83r010970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Feb 2015 22:56:08 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 22:56:08 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 46FFAE1D48F; Fri,
	13 Feb 2015 01:56:22 -0500 (EST)
Date: Fri, 13 Feb 2015 01:56:22 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Message-ID: <20150213065621.GA7102@windriver.com>
References: <1423699224-19243-1-git-send-email-paul.gortmaker@windriver.com>
	<54DC2479.7050507@urbanec.net>
MIME-Version: 1.0
In-Reply-To: <54DC2479.7050507@urbanec.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mozjs: fix build failure due to missing dependency on libxt
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
X-List-Received-Date: Fri, 13 Feb 2015 06:56:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] mozjs: fix build failure due to missing dependency on libxt] On 12/02/2015 (Thu 14:56) Peter Urbanec wrote:

> On 12/02/15 11:00, Paul Gortmaker wrote:
> >Looking at the configure script, we see these invalid values are output
> >when the autoconf test for X11 fails.  That test fails in the following
> >fashion:
> ...
> >Since the package clearly has never been built in a no-X11 OE environment,
> >we assume that all OE users to date are X11 users and hence simply add a
> >dependency on libxt.
> 
> I've run into this problem quite a while ago. My fix for this was a
> .bbappend file that passes --without-x to configure, since my target
> has no X11.
> 

Since it isn't a run time dependency, your local tweak to select a non-X
build of the package should still give you that even with the libxt
build dependency added.  My point still stands that in its current
state, the only successful builds have been X11-enabled ones;  so my
patch fixes the random build failures without changing the build output.

If we want to come at mozjs and enhance it at the same time to support
non-x11 without the need for an append like  you are using, we'd need
to do something like:

DEPENDS_append = "${@bb.utils.contains('DISTRO_FEATURES','x11','libxt','',d)}"

...or perhaps:

EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"

I've not tested either of the above; I've just found them in existing
recipes; I'll wait to see if the maintainers have any preference for one
of the three possible solutions (the original and now the above two) as
doing one of the above two now implies we are supporting non-x11 builds
of it, when clearly we were not up to this point.

Paul.

