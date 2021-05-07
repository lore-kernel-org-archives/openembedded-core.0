Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.10094.1620393667109113125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 06:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4FcB0b5sRxz5tlD;
	Fri,  7 May 2021 15:21:02 +0200 (CEST)
Date: Fri, 7 May 2021 15:21:01 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
Message-ID: <20210507132101.f37cq2j6yjbe7otb@qschulz>
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

No SDK expert here, so as usual, to be taken with a grain of salt.

On Fri, May 07, 2021 at 09:11:37AM -0400, Robert P. J. Day wrote:
> 
>   almost certainly a silly question as i'm still poring over the
> mechanics of standard SDK creation, but if i define a perfectly normal
> image, then build the corresponding SDK with:
> 
>   $ bitbake -c populate_sdk my_image
> 
> is the resulting SDK populated based on the entire contents of the
> target image? that is, if i subsequently add a new package to the
> target and rebuild the SDK, will the new SDK now contain the
> corresponding content from that newly-added package? (i'm just about
> to test this with a build but that's going to take over an hour on
> this server. *sigh* ...)
> 

I think you're mixing SDK and eSDK. AFAIU so far, you're looking for an
eSDK. An SDK just gives you the minimal toolchain and associated tools,
to be able to compile something. I would go as far as saying it's
basically what a PC distro package for cross-compile with gcc is doing.

Most of headers, shlib and binaries from an image won't make it to the
SDK. A much bigger portion of those will be installed in an SDK, though
not all of them. I have never used an eSDK so can't comment on what's
missing or how to add packages to the eSDK.

>   now, i realize that if i just want to add content to the SDK without
> adding to target, i can use one or both of:
> 
>   TOOLCHAIN_HOST_TASK
>   TOOLCHAIN_TARGET_TASK
> 
> but if someone asks for new content both for the target and the SDK,
> is it sufficient to just add to target?
> 

I'd assume that TOOLCHAIN_HOST_TASK is for native packages and
TOOLCHAIN_TARGET_TASK for target packages, for an SDK,
TOOLCHAIN_HOST_TASK would contain arm-linux-gcc, make, cmake, whatever
common build tools needed and TOOLCHAIN_TARGET_TASK headers/shlib for
compiling binaries to be run on your target, compiled via tools from
TOOLCHAIN_HOST_TASK.

Not sure this is remotely correct, just some thoughts.

Hope this can help/guide a bit?

Cheers,
Quentin
