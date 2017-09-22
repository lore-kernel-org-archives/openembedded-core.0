Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 344C871BFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:43:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8M6h0Qc007490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 22 Sep 2017 07:43:02 +0100
Message-ID: <1506062580.18640.184.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 22 Sep 2017 07:43:00 +0100
In-Reply-To: <CAP9ODKphgL7Dndk8PcpLnE0me_O9AyMhYkjhYbE_HCM+sYMNZg@mail.gmail.com>
References: <20170921140819.21292-1-otavio@ossystems.com.br>
	<1506033277.18640.172.camel@linuxfoundation.org>
	<CAP9ODKphgL7Dndk8PcpLnE0me_O9AyMhYkjhYbE_HCM+sYMNZg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Fri, 22 Sep 2017 06:43:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-21 at 21:43 -0300, Otavio Salvador wrote:
> Hello Richard,
> 
> On Thu, Sep 21, 2017 at 7:34 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Thu, 2017-09-21 at 11:08 -0300, Otavio Salvador wrote:
> > > 
> > > Upgrade to a new stable release and drop patches applied on
> > > upstream.
> > > 
> > > For a full release notes, please see:
> > > https://mesa3d.org/relnotes/17.2.0.html
> > > https://mesa3d.org/relnotes/17.2.1.html
> > > 
> > > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > > 
> > > Changes in v2:
> > >  - update to 17.2.1
> > The trouble is this isn't just a "stable release", I didn't check
> > the
> > patch fully enough initially but now I see this was a 17.1.X ->
> > 17.2.X
> > change.
> The commit log mentions the two release notes. The 17.1 is at 17.1.9
> release but should not receive more fixes. It is advised to move to
> 17.2.1 as it is the current release but it is up to you if we will
> take this one or 17.1.9.

Its not clear from the commit message that we're on 17.1.7, that 17.1.9
(and maybe .8?) exist and that in going to 17.2.X, we're actually
changing stable series. Release notes for 17.1.X are not mentioned.

Every upstream out there will advise moving to their latest version but
that doesn't mean it will work. In fact here it doesn't.

> > When I tried building it locally I get:
> > 
> > > 
> > > checking for x11 xext xdamage >= 1.1 xfixes x11-xcb xcb xcb-glx
> > > >= 1.8.1 xcb-dri2 >= 1.8 xxf86vm... yes
> > > checking for wayland-scanner...
> > > /media/build1/poky/build/tmp/work/core2-64-poky-
> > > linux/mesa/2_17.2.1-r0/recipe-sysroot-native/usr/bin/wayland-
> > > scanner
> > > checking for wayland-client >= 1.11 wayland-server >= 1.11... yes
> > > configure: error: wayland-protocols >= 1.8 is needed to compile
> > > the wayland platform
> > > NOTE: The following config.log files may provide further
> > > information.
> > and basically I just wiped out a round of autobuilder testing of a
> > larger patchset due to this.
> That's the reason for autobuilder, right? I do not spawn all
> configurations here as I don't own such build monster ...

The autobuilder is a last final sanity check so we can test the
proposed changes, Ross and I are not here just to queue and test and
report back on people's patches.

In this case *any* poky build of mesa is failing. That is likely
because poky has wayland in distro features and your local
configuration does not.

> > If people want us to be more flexible about taking "point version"
> > changes later into the release cycle, we really need to start
> > getting
> > better about how these things get tested and how we refer to them
> > in
> > the commit messages.
> See the commit log above. You are frustrated, and I get that, but
> commit log mentions BOTH!

The commit message implies we're upgrading along a stable release path.
Now, I agree had I thought more carefully I'd have realised that to
mention release notes of a .0, we must not be. You do call it a stable
update though and it really isn't.

> > [and yes, the fix is trivial and included below, that isn't really
> > the
> > point though]
> Do you want a v3? or a 17.1.9? Let me know what I can help.

I left it building locally overnight and the first fix I mentioned
isn't enough, it eventually fails with:

| make[4]: *** No rule to make target '/usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by 'drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.

so a v3 would need to figure out and fix that. Who knows what else
might then fail. I suspect we might have more success with 17.1.9 but
it sounds like I'll be the one who you want to test this...

Cheers,

Richard




