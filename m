Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 8DED171AD6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 19:11:23 +0000 (UTC)
Received: from seebsdell (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id DBC162ADC8B;
	Thu,  2 Feb 2017 13:11:23 -0600 (CST)
Date: Thu, 2 Feb 2017 13:11:23 -0600
From: Seebs <seebs@seebs.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170202131123.038be11f@seebsdell>
In-Reply-To: <1486055849.14889.52.camel@intel.com>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
	<1486053547.14889.50.camel@intel.com>
	<20170202111201.3fcee3fa@seebsdell>
	<1486055849.14889.52.camel@intel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 19:11:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Feb 2017 18:17:29 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Thu, 2017-02-02 at 11:12 -0600, Seebs wrote:
> > > But I find mapping to root:root more attractive because it makes
> > > packaging simpler (less worries about accidentally copying the
> > > original uid) and the builds faster (no need to run the QA check).

> > Hmm. I think I would rather have the QA check, because if a file's
> > supposed to be non-root, and ends up root instead, that could cause
> > subtle problems, but we'd no longer have a way to *detect* those
> > problems.

> But that's not the kind of the problem detected by the QA check, is
> it?
> 
> It warns when the owner of the file is the same as the user who did
> the build, but because root isn't (normally) used for building, files
> accidentally owned by root on the target won't trigger the warning.

Right. But the purpose of that is to detect files which didn't get
their ownership correctly set. If we change to a default which we can't
detect, then we can't detect "files which were supposed to have an
ownership but didn't get it".

The idea here is that, although there's some performance cost, we
*intend* to require that every file installed have its ownership
determined in some way by the recipe, and if you don't do this but copy
in files you didn't set ownership on somehow, we want to detect that.

("Created under pseudo" is enough to count as "ownership determined by
recipe", it doesn't have to be an explicit chown.)

I think that, if we default to root:root, we'll end up with recipe
errors going unnoticed, when they could have been caught. And if we
default to -3:-3 or something similar, I think we'll catch errors we're
currently missing. For instance, what happens if a recipe copies host
/etc/services in, preserving ownership? Right now, we get a plausible
answer, but that's still actually host contamination!

-s

