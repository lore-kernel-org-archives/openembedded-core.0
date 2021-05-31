Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.41862.1622451421132894561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 01:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4Ftq0n4ZKlz5tlH;
	Mon, 31 May 2021 10:56:56 +0200 (CEST)
Date: Mon, 31 May 2021 10:56:55 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
Message-ID: <20210531085655.tdj73iny3mxhz22a@qschulz>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca>
 <20210528130557.zr762og6uvyv577b@qschulz>
 <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca>
 <20210528141615.klk5hwfmo4gwqfbg@qschulz>
 <3c62eb6a-ed4c-881f-ded6-625cc4b726da@crashcourse.ca>
 <20210528150703.mueernohsx4wlgry@qschulz>
 <57954bd8-dd61-ded9-83b1-61cbbc129d8b@crashcourse.ca>
 <20210528152626.aihuhwh5p5jbfl2d@qschulz>
 <8fbd5dac-a514-48b-bc14-54b3db5411b6@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <8fbd5dac-a514-48b-bc14-54b3db5411b6@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Fri, May 28, 2021 at 05:02:13PM -0400, Robert P. J. Day wrote:
> On Fri, 28 May 2021, Quentin Schulz wrote:
> 
> ... big snip ...
> 
> > ${B} = ${S} by default, so that might explain why it works without
> > externalsrc being inherited.
> >
> > You can see in the makefile that this is assumed. Only the install tasks
> > are installing somewhere else (DESTDIR), c.f.
> > https://git.savannah.nongnu.org/cgit/dmidecode.git/tree/Makefile
> >
> > So yes, except if you patch the Makefile to support out-of-tree build,
> > you would need both EXTERNALSRC and EXTERNALSRC_BUILD set to the same
> > value.
> >
> > Maybe a Cmake example would suit better since B is set to "${WORKDIR}/build"
> > by default?
> >
> > Otherwise, write a proper Makefile that allows out-of-tree builds for
> > the example :)
> 
>   in the end, i suspect i was overthinking it, thinking somehow there
> was some magic to "externalsrc", only to finally realize it was
> totally inappropriate for source that had to be built in-tree. so i
> just switched over to using SRC_URI and, for various recipes like
> dmidecode, i created a recipe that started with some variation of:
> 
>   LICENSE = "CLOSED"
>   LIC_FILES_CHKSUM = ""
>   FILESEXTRAPATHS_prepend := "${THISDIR}:"
>   SRC_URI := "file://src"

No need for := here, a simple = should suffice?

>   S = "${WORKDIR}/src"
> 

Why not put the sources in:
meta-mylayer/recipes-test/test/my-test-0.1/src/
meta-mylayer/recipes-test/test/my-test_0.1.bb

and have SRC_URI = "file://src/" without needing to add
FILESEXTRAPATHS_prepend := "${THISDIR}:" so that it follows what almost
every recipe does?

S will be as you wrote above.

I thought you were trying to find an example with externalsrc for our
docs, but it seems you have a different thing in mind, can you tell us
so we are able to help you with your actual issue/question :) ?

Cheers,
Quentin
