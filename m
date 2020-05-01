Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2591.1588296375327785705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 18:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0411P7sH013825
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 30 Apr 2020 18:25:18 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 30 Apr
 2020 18:24:56 -0700
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Rahul Kumar
	<rahulk@mvista.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        OE-core
	<openembedded-core@lists.openembedded.org>,
        Trevor Gamblin
	<trevor.gamblin@windriver.com>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
Date: Thu, 30 Apr 2020 21:24:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> You need to first see from the failure page which configuration is 
> failing, for example non-gpl3 is one such.
> 
> Then you find that configuration in config.json. The below should 
> hopefully be self-explanatory in how you should set up the build?
> 
> |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"], "MACHINE" : 
> "qemux86", "BBTARGETS" : "core-image-minimal core-image-full-cmdline", 
> "extravars" : [ "INCOMPATIBLE_LICENSE = '*GPLv3'", "WARN_QA_remove = 
> 'incompatible-license'" ], "EXTRACMDS" : [ 
> "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> 
> |
> 
> |
> |
> 
> |Alex

Hi Rahul,

Sorry for my late reply.

The commit log for v2 is very good now!
Thanks for incorporating my --pedantic suggestions. ;-)

It seems that you need a perl dependency for something (docs?
    $ cd .../bzip2.git
    $ grep -r "perl " *
    format.pl:#!/usr/bin/perl -w
    README.XML.STUFF:It uses format.pl, a perl script...

Then we need to figure out how to deal with the GPLv3 issue.

The buildbot output can be tedious to figure out. I haven't really
spent enough time plugging away at it to be proficient yet either.
Have you been able to reproduce the problems that Richard reported?
If not, and you've tried for a bit, then just say so and I'll try to
help tomorrow or early next week.

It looks like you are packaging the test code/data with the main package 
not in bzip2-ptest. Have a look at:
    meta/recipes-support/libpcre/libpcre_8.44.bb
for an example. There are many more.
Also, if you look at oe-core.git:
    $ rgrep LICENSE_ *  | grep PN
you can see many examples of sub-packages with different licenses
than the main package. One example is:
    meta/recipes-support/gnutls/gnutls_3.6.13.bb
I hope that can address the buildbot problem but I haven't tried it
myself yet.

BTW, Trevor has gotten the YP autobuilder going at Wind River and
he'll be sending a few documentation updates next week or so.
That may help in case you want to reproduce the YP AB test
infrastructure. I expect that you don't _have_ to do so but
I think it would be good if more contributing organizations did
have an instance with only limited builders of the YP AB so that
we can do more testing before Richard runs our changes through
the main system. Richard has cautioned that the YP AB has lots of
builders each of which has many cores but I hope that we can at least
do some AB checking ourselves.

../Randy


> |
> 
> 
> On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com 
> <mailto:rahulk@mvista.com>> wrote:
> 
>     Hi Richard/Alexander,
> 
>     I am not able to understand how I can use the below file.
>     http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> 
>     did you mean to say that i have to set MACRO in local.conf based on
>     this file.
> 
>     *Thanks & Regards,*
>     Rahul Kumar
>     Software Engineer,Linux Solutions Engineering
>     Group,Montavista Software LLC
>     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
>     <https://plus.google.com/+CodeTwoSoftware>
> 
> 
>     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
>     <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>         On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
>          > You need to look at configurations defined here:
>          >
>         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
>          > and replicate them locally. Then you can reproduce the
>         failures that
>          > the AB gets in those configurations.
> 
>         That start of the failing logs on the autobuilder also list out the
>         configuration options for that build.
> 
>         Cheers,
> 
>         Richard
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
