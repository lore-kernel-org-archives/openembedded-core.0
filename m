Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fef673ddc40d0ec2159fa01ad968aa4950121e06.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/3] kernel.bbclass: remove do_strip() method
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Jan 2022 11:27:20 +0000
In-Reply-To: <3af9de80-884d-41e0-59a4-ea700c9b6656@windriver.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
	 <20220107212446.132386-3-saul.wold@windriver.com>
	 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
	 <CADkTA4NYGboThC2b5=R6vw13HeGKOu93raMbgUk9iPUmwPSX+Q@mail.gmail.com>
	 <3af9de80-884d-41e0-59a4-ea700c9b6656@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Saul Wold <Saul.Wold@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Joshua Watt <JPEWhacker@gmail.com>

On Mon, 2022-01-10 at 16:42 -0800, Saul Wold wrote:
> 
> On 1/8/22 11:27, Bruce Ashfield wrote:
> > 
> > 
> > On Fri, Jan 7, 2022 at 6:19 PM Richard Purdie 
> > <richard.purdie@linuxfoundation.org 
> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> > 
> >     On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:
> >      > Move the do_strip() functionality to a more common location in the
> >      > package split_and_strip_files() flow. This makes it possible for the
> >      > extended packaging data to be generated correctly for the kernel and
> >      > kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused in
> >      > the runstrip() part of package stripping.
> >      >
> >      > Signed-off-by: Saul Wold <saul.wold@windriver.com
> >     <mailto:saul.wold@windriver.com>>
> >      > ---
> >      >  meta/classes/kernel.bbclass | 35 +++--------------------------------
> >      >  1 file changed, 3 insertions(+), 32 deletions(-)
> > 
> >     As I mentioned in previous mails, I think this will mean the
> >     do_deploy output
> >     will change and become unstripped which may cause a problem for some
> >     platforms.
> > 
> >     We likely need to keep a strip task but call the new strip function
> >     from it?
> > 
> >     I personally think this is a reasonable direction apart from that
> >     though, at
> >     least in principle.
> > 
> > 
> > Agreed. It looks ok to me as well, with us making sure that do_deploy 
> > can remain as it was.
> > 
> I have been looking into this and realized it's maybe a little more 
> complex since the do_sizecheck() needs to run also before do_deploy.
> 
> Currently, I believe the ordering is:
> 
> do_compile()
> do_compile_kernelmodules()
> do_kernel_linux_images()
> do_strip()
> do_sizecheck()
> do_install
> do_package()
> do_packagedata()
> do_deploy()
> 
> If I move the strip() process to package, I also have to move when 
> do_sizecheck() runs. As you mention we need to keep what gets deployed 
> to be the same with and without the package split_and_strip_files().
> 
> I understand what your talking about having the vmlinux image (which is 
> the one getting stripped) is the same before and after this changeset, I 
> don't think it's an issue of the deployed vmlinux being un-stripped but 
> the vmlinux being stripped in the deploy dir.
> 
> We can't really call the package.bbclass strip from the kernel bbclass 
> since it's part of the package process and called in a multiprocess() way.

This bit puzzles me. Why can't we manually call the function from kernel
bbclass? It might not be particularly nice given the multiprocess bits but I'm
sure it can be done and likely the lesser of several evils. If it works in a
multiprocess context, it should work without? (the other way around is much
harder).

Cheers,

Richard

