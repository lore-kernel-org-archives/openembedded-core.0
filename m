Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id E086E61C42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:42:28 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48dWkr57lyz5tlH;
	Thu, 12 Mar 2020 15:42:27 +0100 (CET)
Date: Thu, 12 Mar 2020 15:42:26 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: rpjday@crashcourse.ca
Message-ID: <20200312144226.7adjcwooxip2rj3d@qschulz>
References: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
	<CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
	<20200312103003.Horde.-mn1W9NE8YAc6sk0SRLY8bj@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <20200312103003.Horde.-mn1W9NE8YAc6sk0SRLY8bj@crashcourse.ca>
User-Agent: NeoMutt/20180716
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: simplest command to display which layers are applying the same patch?
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
X-List-Received-Date: Thu, 12 Mar 2020 14:42:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Mar 12, 2020 at 10:30:03AM -0400, rpjday@crashcourse.ca wrote:
> 
> Quoting Alexander Kanavin <alex.kanavin@gmail.com>:
> 
> > I think 'bitbake -e recipe', and then searching for SRC_URI in it should
> > show which layer applies which patch.
> 
>   ... snip ...
> 
> I *think* I know what might be happening here, and I'd like to verify
> some suspicions about how recipes are selected and patches are applied.
> (Writing this in real time so I hope I don't screw up.)
> 
> Imagine I've checked out oe-core, which supplies recipe file fubar_1.0.bb,
> but it becomes obvious that there is a bug, for which there is an obvious
> patch I can apply internally. So I fire up a fubar bbappend file, which
> does nothing but extend SRC_URI to apply the patch, call it fubar.patch.
> (Remember, this patching is all internal, in my vendor layer.)
> 
> *However*, being a bit lazy, rather than create fubar_1.0.bbappend, I
> slack off and create simply fubar_1.%.bbappend. (I suspect you see
> where I'm going with this.)
> 
> Now the good folks at OE get around to updating oe-core, and part of
> that update is to add that patch to SRC_URI of fubar_1.1.bb (along
> with the patch file fubar.patch, of course). Now, because that is
> a more recent version of fubar, that is the recipe file that should
> be selected.
> 
> *However*, if I interpret this correctly, first, I have fubar_1.1.bb
> applying fubar.patch, but because I am also defining a layer which
> contains the append file fubar_1.%.bbappend, that append file will
> also try to apply the same patch, which of course should not work
> properly. (Am I correct in my thinking so far?)
> 

AFAIK, yes.

> If I'm explaining this correctly, then the fault naturally lies with
> me for being sloppily ambiguous with my append file and not locking
> it to fubar_1.0, but allowing it to be applied against all fubar_1.x
> recipes. In short, when I inevitably get the error of "Patch already
> applied," it is entirely my fault for being sloppy.
> 
> I'm trying to verify this as I am now aware that a *lot* of append
> files in the vendor layer in question are similarly ambiguous.
> Does this make sense?
> 

AFAIK, yes.

I think you can check on which recipe a bbappend applies with:
bitbake-layers show-appends <recipe>. Don't forget to set the machine
correctly because if your recipe has a MACHINE_COMPATIBLE which does not
contain your machine, your recipe is "silently" omitted.

If you ommit the recipe from the aforementioned command, you'll get all
appends for all recipes (and you can see some are marked as "skipped"
even though they are listed).

Hope this helps.

Quentin

