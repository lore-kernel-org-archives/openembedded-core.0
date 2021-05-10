Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.34390.1620663709460509401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 09:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93BF840C7B;
	Mon, 10 May 2021 16:21:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quybvJxVYuFe; Mon, 10 May 2021 16:21:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60F4D409E0;
	Mon, 10 May 2021 16:21:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18CB71745DD; Mon, 10 May 2021 12:21:45 -0400 (EDT)
Date: Mon, 10 May 2021 12:21:45 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
Message-ID: <20210510162145.GA1528@denix.org>
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
 <20210507132101.f37cq2j6yjbe7otb@qschulz>
 <9874edc2-b8ff-6b82-4f8d-9f0cfb0ef4c@crashcourse.ca>
 <CAJ86T=VuYu-OaB_SghE6+9KYPOjnKwtVmRjT1j8jBQO+H+6D7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VuYu-OaB_SghE6+9KYPOjnKwtVmRjT1j8jBQO+H+6D7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2021 at 09:49:32AM -0700, Andre McCurdy wrote:
> On Fri, May 7, 2021 at 6:47 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Fri, 7 May 2021, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > No SDK expert here, so as usual, to be taken with a grain of salt.
> > >
> > > On Fri, May 07, 2021 at 09:11:37AM -0400, Robert P. J. Day wrote:
> > > >
> > > >   almost certainly a silly question as i'm still poring over the
> > > > mechanics of standard SDK creation, but if i define a perfectly normal
> > > > image, then build the corresponding SDK with:
> > > >
> > > >   $ bitbake -c populate_sdk my_image
> > > >
> > > > is the resulting SDK populated based on the entire contents of the
> > > > target image? that is, if i subsequently add a new package to the
> > > > target and rebuild the SDK, will the new SDK now contain the
> > > > corresponding content from that newly-added package? (i'm just about
> > > > to test this with a build but that's going to take over an hour on
> > > > this server. *sigh* ...)
> > > >
> > >
> > > I think you're mixing SDK and eSDK. AFAIU so far, you're looking for
> > > an eSDK. An SDK just gives you the minimal toolchain and associated
> > > tools, to be able to compile something. I would go as far as saying
> > > it's basically what a PC distro package for cross-compile with gcc
> > > is doing.
> >
> >    ... snip ...
> >
> > it's slowly coming back to me, as i once examined the recipe
> > meta-toolchain.bb for building a toolchain, whose contents are
> > effectively:
> >
> >   inherit populate_sdk
> >
> > and when you run "bitbake meta-toolchain", you're obviously not
> > supplying a particular image as an argument, so whatever is being done
> > has to be based on fundamental information like MACHINE and so on,
> > with no reference to a particular image so, yes, you'd get a "minimal"
> > toolchain as you describe above independent of any image.
> >
> >   however, as populate_sdk.bbclass inherits populate_sdk_base.bbclass,
> > and that latter class file contains:
> >
> > TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
> > TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
> > TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
> > TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
> > TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
> >
> > it seems clear that you can augment that minimal toolchain with
> > exactly the two variables i mentioned earlier. ok, i think i've
> > refreshed my memory on this. now off to figure out the eSDK.
> 
> Didn't we discuss exactly this (ie the difference between a pure SDK
> recipe such as meta-toolchain and the populate_sdk task of an image
> recipe) a couple of weeks ago?
> 
> Both are valid ways to create an SDK and there are no rules about one
> or the other being specific to creating a "minimal" toolchain.
> Basically a pure SDK recipe gives you full control while the
> populare_sdk task of an image recipe is easier to set up (no new
> recipe to write) at the expense of the final SDK containing extra junk
> such as busybox init scripts, etc which are needed in the image but
> not an SDK.

Exactly! Thanks for this excellent summary!

I've heard so many times before that my meta-toolchain recipe is not the 
"Yocto" way of doing things and I should instead use populate_sdk. I got 
tired arguing with people and explaining that meta-toolchain is quite valid 
and has its merits...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
