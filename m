Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 062B060167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 22:28:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52MSpeY026820; Mon, 2 Jun 2014 23:28:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x5gfqPfAs6hf; Mon,  2 Jun 2014 23:28:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52MSjmA026815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 2 Jun 2014 23:28:46 +0100
Message-ID: <1401748117.12440.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 02 Jun 2014 23:28:37 +0100
In-Reply-To: <20140602214711.GM2426@jama>
References: <1401740101.12440.22.camel@ted> <20140602214711.GM2426@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] autotools: Improve configure dependency code for finding m4 files
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
X-List-Received-Date: Mon, 02 Jun 2014 22:29:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-02 at 23:47 +0200, Martin Jansa wrote:
> On Mon, Jun 02, 2014 at 09:15:01PM +0100, Richard Purdie wrote:
> > We have an open bug about the warnings issues in builds from an sstate
> > cache when something like glib-2.0 gets rebuilt. The issue is that
> > sstate is "clever" and prunes unneeded dependencies out the tree.
> > 
> > For example is X depends on pkgconfig-native but we've already build X
> > and installed it from sstate, it will not get installed when you build Y
> > which depends on X.
> > 
> > This patch changes the logic to match the sstate behaviour and prune out
> > unnecessary dependencies from the scope of aclocal. This in turn removes
> > the warning about missing manifest files.
> > 
> > The issue is that this patch exposes holes in our DEPENDS in recipes,
> > specifically that some native tools are not listed, specifically, and
> > problematically, pkgconfig, gtk-doc and intltool-native in particular.
> > 
> > I've sent out patches against OE-Core that address the bulk of the
> > issues there however I'm conscious this is probably going to a bug issue
> > in other layers and may be too annoying to consider at this point. The
> > other alternative is simply to turn the warning into a debug statement.
> 
> I'm fine with new warning like this, because I would say that fixing
> this has higher priority than e.g. QA warnings we have, so it's
> annoying, but easy to fix.
> 
> If you wait +- a week I can do test run on my world builds and report
> how many warnings it shows.

I think the trouble is going to be that the warning only indicates a
potential problem, some of them will be valid issues and some won't be.

If you include this patch, it will remove those warnings but the cases
of missing dependencies will become hard do_configure fails when it
can't match macros like those from pkg-config.

I can't think of a manageable way of just giving warnings about true
missing dependencies :/.

There isn't any rush with this change, its just something to further
think about I guess. We could do with getting a feel for the scale of
the problem though.

On IRC you asked why your minimal from sstate builds don't show this
issue. That is a good question and one I'll look into as I'd have
expected them to.

Cheers,

Richard




