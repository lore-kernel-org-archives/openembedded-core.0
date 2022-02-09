Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3909a8bd81a99f80cbcafa66b68c2601b4a2235e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable exporting more recipe and package data
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 09 Feb 2022 13:40:22 +0000
In-Reply-To: <YgPBUKU8qutnuI8I@korppu>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
	 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
	 <YgPBUKU8qutnuI8I@korppu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Mikko.Rapeli@bmw.de
Cc: sanakazisk19@gmail.com, openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com

On Wed, 2022-02-09 at 13:27 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Wed, Feb 09, 2022 at 12:23:39PM +0000, Richard Purdie wrote:
> > People have requested changes like this before and I rejected it as I'm worried
> > that allowing people to customise this code will just fork the project into many
> > different directions. 
> 
> It's the other way round. There are a lot of needs to extract metadata from
> build system into something where reports can be generated.

I don't doubt that however buildhistory was written for a specific purpose and
if we start adding the ability to customise it heavily we lose the ability for
comparisions to be made, or sstate reuse and so on.

I'm partly channelling the original author's views on this since they had some
very specific thoughts on this change. I do sometimes wonder if I should
continue doing that though :/.

>  I'd prefer this to be buildhistory as it also tracks progress across releases and 
> versions and custom builds if the setup has been done correctly. If this change isn't 
> going to be accepted, projects need to continue with their custom patches on top of 
> current buildhistory bbclass in poky.
> 
> > The elif block above illustrates part of my concern since it still isn't scaling
> > well and just potentially makes every buildhistory output difference (even with
> > different ordering). There are reasons the data is taken from pkginfo rather
> > than getVar too and I think this could introduce subtle bugs in the future.
> 
> The elif block is just for backwards compatibility. Changing the order of fields would
> be annoying in buildhistory. The new ones will be in alphabetical order so I don't
> think this is so bad. It is possibly to completely rewrite and simplify buildhistory
> but this would be annoying for users who actually track the changes.
>
> > Which variables are you actually interested in when changing this?
> 
> LICENSE, CVE_PRODUCT, SRC_URI, MAINTAINER and some project specific variables too.
> It is very useful to have these tracked in buildhistory git repo where differences
> between releases can easily be seen.

The trouble is this turns it into a "metadata difference" tool rather than a
build output difference tool which is different to the design. It also makes it
much harder to write the buildhistory analysis tool since all of a sudden we're
dealing with any variable rather than package specific ones and we can no longer
assume any particular output would be present (and it is no longer just based
upon packagedata).

I guess we can see what others think, but I am concerned about letting people
remove existing output from it too.

Cheers,

Richard







