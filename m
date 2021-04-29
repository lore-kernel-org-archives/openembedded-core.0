Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.4128.1619736894565367228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1D4E320004;
	Thu, 29 Apr 2021 22:54:51 +0000 (UTC)
Date: Fri, 30 Apr 2021 00:54:51 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	wangmy <wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
Message-ID: <YIs5OwIrre2Nyj4w@piout.net>
References: <20210410013005.2232041-1-raj.khem@gmail.com>
 <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
 <eec642ef8f5e4bb79194c384092181e7@intel.com>
 <20210419075121.c3f43vbrqudy26pt@jama>
 <CAMKF1spNc_skUcvZKquR+i+LbfmNKQSDe+JHUrWKrKDZuqpnWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spNc_skUcvZKquR+i+LbfmNKQSDe+JHUrWKrKDZuqpnWQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 19/04/2021 08:38:09-0700, Khem Raj wrote:
> On Mon, Apr 19, 2021 at 12:51 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Mon, Apr 19, 2021 at 04:25:26AM +0000, Naveen Saini wrote:
> > > [SWAT]
> > > Fetching error:
> > > recipe go-runtime-1.16.3-r0: task do_fetch: Failed
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2053/steps/23/logs/stdio
> >
> > That seems related to
> > https://git.openembedded.org/openembedded-core/commit/?id=2a1eb731ed3bcb049192550e362b771c3a9ea6eb
> > not this go upgrade.
> >
> 
> that change came after upgrade to see if it will help this issue :)
> 
> > Also locally I can fetch this over http:// as well as https:// without
> > any issues with wget, but it's true that with chrome I see valid
> > certificate on https://golang.org/dl but not on
> > https://golang.org/dl/go1.16.3.src.tar.gz
> > or
> > https://golang.org/dl/go1.16.2.src.tar.gz
> >
> > and curl downloads just the link to dl.google.com/go
> > $ curl https://golang.org/dl/go1.16.3.src.tar.gz
> > <a href="https://dl.google.com/go/go1.16.3.src.tar.gz">Found</a>.
> >
> > Maybe we should just use https://dl.google.com/go directly to fetch
> > go.
> 
> yes perhaps that's a better option.
> 

This is still an issue on the autobuilder:

ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/temp/log.do_fetch.525
ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/temp/log.do_fetch.544

This is fairly reproducible:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/steps/23/logs/stdio


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
