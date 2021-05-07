Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.13189.1620406186376688979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 09:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PopZ/cEb;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id c11so13614978lfi.9
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zG+zjO25Q9G0HDZoyj/0D1cyksARLP7DlnwrM8P/O24=;
        b=PopZ/cEbFGkwecJZnguKN7mkUDA0mWy51ZKSnMayzQ4VTRp4nY0lPKXU8o9hf63pX/
         K/nZduoBZ30ooJSAIGzIkVfAKFP7LL9sYnNaydavOSaz5mx6HXewBX3iXaEMGdamXQhO
         mVQC8jiG7qtliG/7HWDh9X4ckUxLhIwtpCsjNZ9z+pJ8RUJHG7KJi+KoVAZpZIBYMwo6
         kqalXG70ULDqPuvzZA36m6IHcs5DhIhjkKGI1UTFUFBqOziJvBbqoXtq6ETyIAwOkHRm
         F+nEQ6TNiObbOJc2UbxsWyKuyIjQjKQF+1z/maMdQziefWS2kf5venoSyT2sofrrZ1Q6
         6UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zG+zjO25Q9G0HDZoyj/0D1cyksARLP7DlnwrM8P/O24=;
        b=LlvxSWuuf+FgUJhA/4YNP8rCg0BDDk0ZASMA4m2jOELuZ2ewxgfj7frHw2DyLLpYnM
         n8JakXmI2+wId0LEAcDnSeBGFbuj1w0TsFgeAeW8UDr5+b3jyibRtUOqhTgLdogfEKLU
         1GHFCaeBGp1pe/2Cst9aXMHl6AF2SDo1xpMSlRgsQNj9F8QoqIKoPXAQ7W+A1j9bOHn8
         1d/LTbkzFDE07pKkiIOyMybpaAtHsIksGvmBPuYJKwknNhvh2xGUz6z3Mv7hk0yAXPYl
         2E0LixRcxvJ9Zp26o2AI7N01WiiWTVb2Jl18xF7ovVAP0ot9epfe6jJdFrfgzNuC2N5r
         d1MA==
X-Gm-Message-State: AOAM5302Q3elIaTO+KM90sdEmFtQrH9IzSAUNRxfa5Nf8TtSA0hxFT6J
	bD+vEv6N+HAP+Ku0s2PV4K1ocqZUlZSxdLCCtsY=
X-Google-Smtp-Source: ABdhPJwnS1BxZZ5uhYBs3UCs/hyexunTCTDsuP7fltkAY30z2zmZ6N/udIVJJ8CrJddueXwgY9MYCMEH5MESw83Y+bI=
X-Received: by 2002:a05:6512:3d11:: with SMTP id d17mr4736362lfv.568.1620406184213;
 Fri, 07 May 2021 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
 <20210507132101.f37cq2j6yjbe7otb@qschulz> <9874edc2-b8ff-6b82-4f8d-9f0cfb0ef4c@crashcourse.ca>
In-Reply-To: <9874edc2-b8ff-6b82-4f8d-9f0cfb0ef4c@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 7 May 2021 09:49:32 -0700
Message-ID: <CAJ86T=VuYu-OaB_SghE6+9KYPOjnKwtVmRjT1j8jBQO+H+6D7w@mail.gmail.com>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 7, 2021 at 6:47 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Fri, 7 May 2021, Quentin Schulz wrote:
>
> > Hi Robert,
> >
> > No SDK expert here, so as usual, to be taken with a grain of salt.
> >
> > On Fri, May 07, 2021 at 09:11:37AM -0400, Robert P. J. Day wrote:
> > >
> > >   almost certainly a silly question as i'm still poring over the
> > > mechanics of standard SDK creation, but if i define a perfectly normal
> > > image, then build the corresponding SDK with:
> > >
> > >   $ bitbake -c populate_sdk my_image
> > >
> > > is the resulting SDK populated based on the entire contents of the
> > > target image? that is, if i subsequently add a new package to the
> > > target and rebuild the SDK, will the new SDK now contain the
> > > corresponding content from that newly-added package? (i'm just about
> > > to test this with a build but that's going to take over an hour on
> > > this server. *sigh* ...)
> > >
> >
> > I think you're mixing SDK and eSDK. AFAIU so far, you're looking for
> > an eSDK. An SDK just gives you the minimal toolchain and associated
> > tools, to be able to compile something. I would go as far as saying
> > it's basically what a PC distro package for cross-compile with gcc
> > is doing.
>
>    ... snip ...
>
> it's slowly coming back to me, as i once examined the recipe
> meta-toolchain.bb for building a toolchain, whose contents are
> effectively:
>
>   inherit populate_sdk
>
> and when you run "bitbake meta-toolchain", you're obviously not
> supplying a particular image as an argument, so whatever is being done
> has to be based on fundamental information like MACHINE and so on,
> with no reference to a particular image so, yes, you'd get a "minimal"
> toolchain as you describe above independent of any image.
>
>   however, as populate_sdk.bbclass inherits populate_sdk_base.bbclass,
> and that latter class file contains:
>
> TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
> TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
> TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
> TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
> TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>
> it seems clear that you can augment that minimal toolchain with
> exactly the two variables i mentioned earlier. ok, i think i've
> refreshed my memory on this. now off to figure out the eSDK.

Didn't we discuss exactly this (ie the difference between a pure SDK
recipe such as meta-toolchain and the populate_sdk task of an image
recipe) a couple of weeks ago?

Both are valid ways to create an SDK and there are no rules about one
or the other being specific to creating a "minimal" toolchain.
Basically a pure SDK recipe gives you full control while the
populare_sdk task of an image recipe is easier to set up (no new
recipe to write) at the expense of the final SDK containing extra junk
such as busybox init scripts, etc which are needed in the image but
not an SDK.
