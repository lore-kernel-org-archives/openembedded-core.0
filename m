Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.10446.1620395250824547500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 06:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60688 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lf0pF-0000JE-Bd; Fri, 07 May 2021 09:47:29 -0400
Date: Fri, 7 May 2021 09:47:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
In-Reply-To: <20210507132101.f37cq2j6yjbe7otb@qschulz>
Message-ID: <9874edc2-b8ff-6b82-4f8d-9f0cfb0ef4c@crashcourse.ca>
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca> <20210507132101.f37cq2j6yjbe7otb@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 May 2021, Quentin Schulz wrote:

> Hi Robert,
>
> No SDK expert here, so as usual, to be taken with a grain of salt.
>
> On Fri, May 07, 2021 at 09:11:37AM -0400, Robert P. J. Day wrote:
> >
> >   almost certainly a silly question as i'm still poring over the
> > mechanics of standard SDK creation, but if i define a perfectly normal
> > image, then build the corresponding SDK with:
> >
> >   $ bitbake -c populate_sdk my_image
> >
> > is the resulting SDK populated based on the entire contents of the
> > target image? that is, if i subsequently add a new package to the
> > target and rebuild the SDK, will the new SDK now contain the
> > corresponding content from that newly-added package? (i'm just about
> > to test this with a build but that's going to take over an hour on
> > this server. *sigh* ...)
> >
>
> I think you're mixing SDK and eSDK. AFAIU so far, you're looking for
> an eSDK. An SDK just gives you the minimal toolchain and associated
> tools, to be able to compile something. I would go as far as saying
> it's basically what a PC distro package for cross-compile with gcc
> is doing.

   ... snip ...

it's slowly coming back to me, as i once examined the recipe
meta-toolchain.bb for building a toolchain, whose contents are
effectively:

  inherit populate_sdk

and when you run "bitbake meta-toolchain", you're obviously not
supplying a particular image as an argument, so whatever is being done
has to be based on fundamental information like MACHINE and so on,
with no reference to a particular image so, yes, you'd get a "minimal"
toolchain as you describe above independent of any image.

  however, as populate_sdk.bbclass inherits populate_sdk_base.bbclass,
and that latter class file contains:

TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"

it seems clear that you can augment that minimal toolchain with
exactly the two variables i mentioned earlier. ok, i think i've
refreshed my memory on this. now off to figure out the eSDK.

rday
