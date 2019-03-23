Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF4E46D56C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 17:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44RSGG14Ccz6m;
	Sat, 23 Mar 2019 18:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553362214;
	bh=YWcMj5Ua9d0aUV9RdWZRtiOwnzY1y4bURuIm2JnUMMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBQIel4kG+c1JNPnQFxj1/g8RT+V6QAopwMc8Fvf14WGOBEgGjcsEA3ScuWcipeuG
	Ep/XgpKuR41Xz3ciVjSUVbXcs6uY6r8OWwZzKtn5qOfQLbbpV1MGI7WKUyW6ol4Ia6
	6Pw9DwMnqCq2cesspdNM7O0EL1x8aeayjuQm6SGWl3EGTxkMR1JIg0cz7hZjI9LSLK
	dnVteCSRplqJbvpNBqIfvg7wcNBl5iDvbj09FOAexuGLpjo1cm4wH+gNCbQtKpl4/p
	Cif+ZJliTpLaqGtLMTAIEyd+smABkbTUbFBQsv2/D7j3IXO16cajRZktKJBHb+d37X
	/Tc4Myh+moyjVj/ivHQVgqvuCzrRDaJF5WISa/RikaLLnCbhy0ce+3JxNd10MnGb2M
	27b5+vtQa3tudRSoHLne4Hhu1uF4LLYGlyFNmCshr4LdTkjI/r8YbtR516pgK33R9e
	f1UbSpNJXCLv6WfCJg8POL/yplUilRlABRhbJ7FCjDJ31C+oTTVAGZ30813EbuSlbh
	b8wm0oK4qWcVKbQjt46ulOq9YfTsrULi0gaWWrks2vQQDTBnh84ljc1zfyJeQP9Jhk
	nHBSu2QC/zSV6w4VA+H0OOkhBVgOLKlGUYc/Z+WuVPTAm6g39KTeMmaqDjB9uUj1Eh
	dS5nKuY1ztBvi8TdnQEsBuaU=
Date: Sat, 23 Mar 2019 19:30:11 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190323173011.GA10315@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<20190322200306.GB14099@localhost>
	<CAMKF1sqJe3G3rC4U8S-gZHDCrjuBgBPpXh-hohWJH2PL_+i-ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqJe3G3rC4U8S-gZHDCrjuBgBPpXh-hohWJH2PL_+i-ww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Sat, 23 Mar 2019 17:30:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 22, 2019 at 03:20:19PM -0700, Khem Raj wrote:
> On Fri, Mar 22, 2019 at 1:03 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, Mar 22, 2019 at 02:11:35AM +0100, Andreas Müller wrote:
> > >...
> > > 3. Change our musl slightly: Many patches we currently have are
> > > trivial. Missing headers or #defines for missing functions... So if we
> > > add few headers
> > >   * Empty chunks for e.g <net/ethernet.h>
> > >...
> > > Some other ideas?
> >
> > Not upstreamable hacks aren't a long-term sustainable way,
> > no matter where you do the patching.
> >
> > net/ethernet.h header problems are requiring 2 patches in NM.
> >
> > It would be good to get whatever is the actual root cause fixed properly,
> > and that fix upstreamed.
> >
> > E.g. I wonder whether this was supposed to be fixed by
> > 0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
> >
> > Or is this patch in linux-libc-headers even the cause of the problem?
> >
> > linux-libc-headers applying 6 patches just for musl is not a good sign
> > in any case.
> > Is that much patching also done by other distributions that use musl?
> > Why are these patches Upstream-Status: Pending/Submitted for a  long
> > time without having been applied upstream?
> >
> > Long-term it would be less work if everything would get fixed properly
> > with fixes reviewed and applied by upstream.
> 
> agreed, meanwhile we have to also ensure that musl users keep going and make it
> possible, if OE devs are fixing musl related issues in upstream
> packages then it is also good reputation for the project.
>...

Some of the NM patches are obviously just quick hacks to workaround bugs 
that are elsewhere. Trying to push such stuff upstream would not exactly
improve the reputation.

A problem with a "keep going" approach is that you might end up spending 
much work on working around symptoms, or even working around OE-specific 
bugs without noticing that they are OE-specific.

Building an image (with things like NM included) for musl builds for me, 
and it also builds for me with all 6 musl patches not applied to the 
kernel headers.

Are these patches still required at all?
Could they be the cause of other musl related issues in OE?

Patching leaf packages can create a huge mess if the core packages are 
not in a good state.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


