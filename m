Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA71608C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 15:54:50 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01BFsl2D017726
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Tue, 11 Feb 2020 09:54:48 -0600
To: Alexander Kanavin <alex.kanavin@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <4375c8dd-fdad-087d-7ef8-7a845c6ea7da@kernel.crashing.org>
Date: Tue, 11 Feb 2020 09:54:46 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 15:54:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/11/20 8:01 AM, Alexander Kanavin wrote:
> Specifically (sorry for the rapid-followup), I think the main value proposition
> of core is integration and testing of various language toolchains and core
> libraries. UIs in embedded space can mean pretty much anything, and so I'd leave
> that to specialised layers.
> 
> Alex
> 
> On Tue, 11 Feb 2020 at 14:57, Alexander Kanavin <alex.kanavin@gmail.com
> <mailto:alex.kanavin@gmail.com>> wrote:
> 
>     The question is: what are the use cases for an 'example/reference UI'? Why
>     have one at all at this point? Remember, the core project is severely
>     under-staffed and we need to commit our limited resources wisely.

I don't think an example/reference UI is useful -- OTHER THEN -- we need a way
to test that the framework(s) that are provided are functional.  So lets, assume
Wayland/Weston combo..  we still need something that can use the mouse, show
that the cursor is being drawn properly, clicks are registered, etc etc etc..

I do think that we need to include a graphical framework (X.org, wayland/weston
combo, etc..) as well as a basic set of examples that can be used to verify that
they are working properly.

There is a secondary 'problem' which I see more as a business issue then a
technical one, everyone wants to have a way to 'demo the OpenEmbedded'.  It's
pretty hard to demo a build system, so they like to have a device that boots
quickly and goes to something graphical that shows it's "working".

--Mark

>     Alex
> 
>     On Tue, 11 Feb 2020 at 14:53, Adrian Bunk <bunk@stusta.de
>     <mailto:bunk@stusta.de>> wrote:
> 
>         On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:
>         >...
>         > - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and
>         does
>         > not have a Wayland compositor. Yocto project does not have the
>         resources to
>         > do the gtk4 port, or add a compositor.
>         >
>         > - no 'lightweight Wayland compositor with a desktop/launcher experience"
>         > has emerged in the open source space; I think the only realistic choice at
>         > the moment is the reference compositor Weston which provides a blank
>         > desktop with ability to open terminal windows.
>         >
>         > So the way I think things should be going (seeking opinions/inputs of
>         > course):
>         >...
>         > - oe-core continues to support and runtime-test X for as long as possible;
>         > for this a new image (say, 'core-image-sato-xorg') is created which will
>         > provide matchbox under X. However, once upstream bitrot sets in, and pain
>         > threshold is exceeded, this will be removed and/or relegated to a legacy
>         > layer.
>         >
>         > Thoughts?
> 
>         matchbox made sense at a time when you could go into a shop and buy an
>         internet tablet with Linux running on 256 MB flash with 256 MB RAM.
> 
>         Part of the problem is that the only remaining usage of this branch
>         of matchbox development seems to be as example UI for Yocto.
> 
>         For matchbox/sato I am wondering whether replacing it with parts of
>         meta-xfce from meta-openembedded would be a good way forward.
> 
>         Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland
>         support, but at the point where supporting X might become a problem
>         this should be available.
> 
>         Xfce was my first thought as replacement since it appears to be
>         well-maintained in meta-openembedded, no strong opinion whether
>         it is actually the best option.
> 
>         > Regards,
>         > Alex
> 
>         cu
>         Adrian
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 

