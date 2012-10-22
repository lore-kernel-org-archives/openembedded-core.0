Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQM9Q-00058J-JO
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 19:50:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9MHbVuf028391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 10:37:31 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 22 Oct 2012 10:37:30 -0700
Message-ID: <50858460.3090809@windriver.com>
Date: Mon, 22 Oct 2012 12:37:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
In-Reply-To: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 17:50:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/12 11:35 AM, Burton, Ross wrote:
> Hi,
>
> Now that we've almost got 1.3 out of the door we can go back to
> breaking everything. Hooray!  Let's try to (un)break OpenGL again.
>
> First, I should say that I'm not looking at this from an GenX/Intel
> specific perspective where Mesa is all you need.  meta-intel ships two
> different binary GL drivers (cdt-pvr for Cedar Trail, EMGD for
> everything else Atom that doesn't have i945) so I'm perfectly aware of
> the problems.
>
> For example, Cedar Trail's (SGX545-based) GL stack comprises of GLESv1
> GLESv2 and EGL library blobs, and a DRI driver blob.  This DRI driver
> can be used by Mesa's libGL.  This is actually a more complex problem
> than Beagle has where it just doesn't do GL.
>
> This is my attempt at a simple solution that doesn't involve
> complicated packaging tricks.
>
> Rule 1.  Unambiguous package naming
>
> Debian-style renaming and multiple providers of the same API doesn't
> work as you'll end up with multiple packages in the same feed called
> libgl1, so all GL packages should be named in the style of libgl-foo,
> where foo is the source of the package.  I've got a branch where this
> is implemented for Mesa as a proof of concept[1], and the Python
> fragment could easily be moved into a class and re-used easily.

I can't say I'm a fan of the debian renamining, but in this case I think it's 
very important to do this.  Using the pkgv_<name> = 'libgl-foo' is a good idea.. 
  I'm guessing that is the easiest way to get consistent behavior.

> Rule 2. No dependencies on specific GL implementations
>
> Packages currently depend on the exact GL that they were built with,
> although the GL packages are swappable.  Not very interesting for
> systems where there's only one provider, but still a valid problem for
> systems with swappable hardware or alternative GL stacks.  All linkage
> to the GL stack should be intercepted and replaced by something like
> "virtual/libgl | libgl-mesa".

Moving everything to libgl1, or virtual/libgl or similar is what I would 
suggest.  This is consistent with the rest of the system behavior.

> This means changing the shlib dependency detection code to support
> per-library overrides, there's plenty of prior art in existing
> distributions to help here.

Each of the libgl's should have equivalent provides (i.e. libgl1)

> Rule 3. Only Mesa stages, nothing else
>
> Whilst there are multiple GL implementations that offer various
> subsets of GL, they are all effectively interchangeable.  It's not a
> massive concern what exact GL is present when building because they've
> all got the same API.  We can take advantage of this and remove the
> problems caused by multiple GL implementations staging by only putting
> Mesa into the sysroot.  Any other GL implementation should explicitly
> stop staging itself to avoid sysroot tainting.  This can be
> implemented by making Mesa build all APIs on all platforms (which
> isn't a problem when it comes to image building or feeds, thanks to
> rule 1), and removing the virtual/libgl PROVIDES from the other GL
> implementations.
>
> For systems which don't use Mesa at all (for example, BeagleBoard)
> then this potentially means that Mesa will be built when it shouldn't.
>   GLX support in the X server may already be pulling it in (I made this
> a packageconfig in 1.3 so distros can turn it off), but in any case I
> think this is an acceptable compromise - Mesa isn't slow to build in
> the scheme of things, and per Rule 2 this is purely in sysroot and not
> in the images.

For systems like BeagleBoard, do they use X11, if so what do they use for GL? 
Most of the ARM systems use raw direct PowerVR drivers in my experience, and 
generally don't use X11.

We definitely need a solution for X11 / Mesa based systems.. and a way to 
qualify the other systems with the way their graphics solutions are built.

--Mark

>
> tl;dr: all packages built against a constant GL, all GL
> implementations interchangable, no package conflicts in the feeds.
>
> Any comments before I get my hands dirty with the next incomplete task
> (shlib dependency generation)?
>
> Ross
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mesa&id=784fa1372bb38dbc82e53a49b757c3c02593f2b8
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



