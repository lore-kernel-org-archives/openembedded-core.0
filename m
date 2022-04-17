Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <b12f88e43a70b06208b3f0424a098b7ce39fca49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/2] sstate: use the python3 ThreadPoolExecutor instead of the OE ThreadedPool
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 17 Apr 2022 08:57:03 +0100
In-Reply-To: <CANPvuR=mh73YEdu2=OZMu8Z-cPO+qa1E-VVywezi4wwZJZh7HA@mail.gmail.com>
References: <20220416202401.179351-1-quaresma.jose@gmail.com>
	 <3040f0d6eaabad9a0ec2632e49336af0ff189533.camel@linuxfoundation.org>
	 <CANPvuR=mh73YEdu2=OZMu8Z-cPO+qa1E-VVywezi4wwZJZh7HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Sat, 2022-04-16 at 23:27 +0100, Jose Quaresma wrote:
> 
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sábado,
> 16/04/2022 à(s) 22:57:
> > On Sat, 2022-04-16 at 21:24 +0100, Jose Quaresma wrote:
> > > for the FetchConnectionCache use a queue where each thread can
> > > get an unsed connection_cache that is properly initialized before
> > > we fireup the ThreadPoolExecutor.
> > > 
> > > for the progress bar we need an adictional task counter
> > > that is protected with thread lock as it runs inside the
> > > ThreadPoolExecutor.
> > > 
> > > Fixes [YOCTO #14775] --
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> > > 
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >   meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------------
> > >   1 file changed, 28 insertions(+), 16 deletions(-)
> > 
> > Are there specific issues you see with oe.utils.ThreadedPool that this
> > change
> > addresses? Were you able to reproduce the issue in 14775?
> > 
> 
> 
> Looking deeper while testing the patch I think I found another bug in the
> sstate mirror handling.
> The python set() is not thread safe and we use it inside the thread pool, I
> added a new python set class for that in my V2 

That might explain things.

> I don't know if it is related to 14775 but it can be, I can't reproduce the
> 14775 on my side, maybe it's better to remove the 14775 mention from my
> commits, what do you think?

I think you shouldn't say it fixes it as we simply don't know that. It may be
related to so perhaps say that instead.

> > I'm a little concerned we swap one implementation where we know roughly what
> > the issues are for another where we dont :/.
> > 
> 
> I think there some issues on ThreadedPool in the worker_init and worker_end,
> this functions is called in all workers and it seems to me that the
> right thing to do is calling and reuse the previous ones connection_cache
> otherwise the connection_cache does nothing.

It creates a connection_cache in each thread that is created. Once created in a
given thread, that connection cache is reused there? I'm not sure you can say it
does nothing?

>  
> > 
> > I notice that ThreadPoolExecutor can take an initializer but you're doing
> > this
> > using the queue instead. Is that because you suspect some issue with those
> > being
> > setup in the separate threads?
> > 
> 
> 
> I am using a queue as it is the easy way I find for reusing the
> FetchConnectionCache.

I think that piece of code was working already?

>  
> > 
> > You also mentioned the debug messages not showing. That suggests something
> > is
> > wrong with the event handlers in the new threading model and that errors
> > wouldn't propagate either so we need to check into that.
> > 
> 
> 
> This is fixed in V2


What was the issue out of interest?

>  
> > 
> > This is definitely an interesting idea but I'm nervous about it :/.
> > 
> 
> 
> It would be interesting if you could test it in the autobuilder.
> On my side it is working well now, I will send a V2

The challenge with autobuilder testing of this is that there is only a small
portion of the autobuilder tests which exercise this code (testsdkext for
images). The current issues only occur intermittently so it is hard to know if
any given change fixes anything (or introduces a new race).

One more interesting test which may more quickly find issues would be to make
everything use the http mirror on the autobuilder I guess. We'd need to figure
out the configuration for that though.

Cheers,

Richard



