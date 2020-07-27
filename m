Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.52894.1595847403354966655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 03:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUeOjBPC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 9so13733003wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NJDJhK4rqVjmTKgA7mTuNmdnDu+4ULwOxnnV5SrJ+G4=;
        b=VUeOjBPCd0KCFUOELVAKn+lSVzTqL3sZWUNJFOP/hEosbla/iqoJNsb4/b8KO9iCu2
         2VxExmBxyvQ6V7/v9GRQOHLI9JAOU04OFX2mrKxQeL8sIcTG0q4rvvHyl7lXndtDjMh5
         l6+AWZOj//1wElJBdq97rRUWYdZegs5khfieg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NJDJhK4rqVjmTKgA7mTuNmdnDu+4ULwOxnnV5SrJ+G4=;
        b=NJtk7mEDjAHxQ0r63GFQTKfV+JPmImYZtv9b3RmPEhlRqLdppccu2gsVI0QZNAhwFw
         W43aRjxBmqIDtI2Sd/0YvLZ44APHM8ybmHMfHUOto9E6DOgnsDkYKkHVkbiiEFw4nNFR
         2LRbs+MMO9X7dOMaykmHox8PyXQ93MqG9h2aOraMo1nn/cSfVLtXjw+WgcTRQvMGvr6Z
         1ZMnt6X3a1CHGsDZe3PTISdCl0Ov66eoEFNlUY7uNq1IxR2JdvWEjqNwBPKQulsKr+pm
         hgfuY8lFB2+Hjz5EL6YXi/q1Qrsw3MrbITgN/or0FpHnWgf+Firm++pGX1wnpv09QzOH
         FnpA==
X-Gm-Message-State: AOAM533a2azvOOarqGwZ3Wg8FngqPwh1RPpxkKKDKg9y6Rg8UAs+6OeK
	JeUhUJKFrHMgg6IMQo6o91fSuA==
X-Google-Smtp-Source: ABdhPJy+1bdy4+vS6W9dTxb1QL28AlWp6jEaqoMaIiFEPXM/Ef4T8gr+jEiFuT+9efM8iE0VzQHmjA==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr3789276wmi.63.1595847401766;
        Mon, 27 Jul 2020 03:56:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id 68sm17457236wmz.40.2020.07.27.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 03:56:39 -0700 (PDT)
Message-ID: <bdd76203978c7ff7bed205268a52a043b05447b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 27 Jul 2020 11:56:36 +0100
In-Reply-To: <28f469d4-6333-d1e7-0224-25d4c20eefcd@arm.com>
References: <20200717141936.9689-1-usama.arif@arm.com>
	 <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
	 <28f469d4-6333-d1e7-0224-25d4c20eefcd@arm.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 18:21 +0100, Usama Arif wrote:
> On 20/07/2020 08:41, Richard Purdie via lists.openembedded.org wrote:
> > On Fri, 2020-07-17 at 15:19 +0100, Usama Arif wrote:
> > > This patch adds support for adding default config node even
> > > when dtb is not part of the FIT image. The conf options are
> > > therefore changed to point to kernel ID rather than dtb
> > > ID when dtb does not exist.
> > > 
> > > Signed-off-by: Usama Arif <usama.arif@arm.com>
> > > ---
> > >   meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
> > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > I keep asking someone to start providing tests for kernel-fitimage
> > but nobody does. Its near impossible to tell whether this is a good
> > change or one that could cause someone else problems as we have
> > little documented behaviour and no tests.
> > 
> > Could someone please start looking at adding some (and
> > documentation)?
> 
> There are different components that can be added to a FIT image.
> This include kernel, ramdisk, dtb, etc. However, it is not necessary
> for any individual component to be part of the FIT image. In reality,
> you can have 0-N (0 to N) kernels and/or 0-N ramdisks and/or 0-N
> dtbs.
> 
> However, kernel-fitimage.bbclass currently only supports limited 
> usescases: adding 1 (no more or less) kernel with 1-N dtbs and 0-1 
> ramdisks.
> 
> Before support was added for multiple dtbs, the configuration of FIT 
> image without any dtbs was supported.
> 
> This patchset adds back the original support to kernel-
> fitimage.bbclass 
> for building a FIT image when no dtbs are present. i.e. adds support
> for 
> 1 kernel with 0-N dtbs. It doesnot affect the existing usecases, but 
> adds back support for a usecase (0 dtb) that originally existed and
> was 
> removed as a mistake.
> 
> I have submitted a v2 of this patch which better documents the code I
> have submitted so that hopefully its not blocked on the testing and 
> documentation of the entire kernel-fitimage. It also always creates a
> configuration for FIT image.
> 
> I guess i have spent some time debugging kernel-fitimage so am happy
> to help with the documentation. I guess you would like a high level 
> description of kernel-fitimage at the top of this file as a seperate
> patch?
> 
> I havent worked with the test framework for oe-core so not sure how 
> helpful i could be on that. I tried to look for example test cases
> that 
> would test any of the existing meta/classes/kernel*.bbclass but
> couldnt 
> find any.
> 
> Hopefully the extra documentation in v2 and the explanation would be 
> useful in understanding and progressing this patch.

Sorry for the delayed reply. Thanks for adding the extra info, it does
help.

By documentation, I mean that kernel-fitimage.bbclass has no
information in the reference manual:

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-classes-kernel-fitimage

generated from:
http://git.yoctoproject.org/cgit.cgi/yocto-docs/tree/documentation/ref-manual/ref-classes.xml

and also there is also no header at the start of the class saying what
it does or how to use it.

Could we add something to these locations to give more information
about the class?

For testing, have a look at
meta/lib/oeqa/selftest/cases/imagefeatures.py. Its testing target image
rootfs settings but I believe the concept is similar to how you'd test
something like the kernel-fitimage class.

You can run these tests individually with "oe-selftest -r
imagefeatures" to run that file or "oe-selftest -r
imagefeatures.ImageFeatures.test_bmap" as an example of a specific
test.

Cheers,

Richard

