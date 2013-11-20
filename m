Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 62FB06D59C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:54:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGrvQ9005581; Wed, 20 Nov 2013 16:53:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gvBGsbFpLDrR; Wed, 20 Nov 2013 16:53:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGrqH0005567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 16:53:53 GMT
Message-ID: <1384966428.16887.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yevhen Kyriukha <kirgene@gmail.com>
Date: Wed, 20 Nov 2013 16:53:48 +0000
In-Reply-To: <CADV-EXFfYuisF20mV5tuSLFeqxVTBVsOJPsP6n_gJ4uufUEQUA@mail.gmail.com>
References: <CADV-EXGySaHof6gBdnVmZBDOw2yWB3YT804aHJPGuqE7WLo2Bw@mail.gmail.com>
	<1384810440.6460.272.camel@ted>
	<CADV-EXFfYuisF20mV5tuSLFeqxVTBVsOJPsP6n_gJ4uufUEQUA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel recompile if "rm_work" defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2013 16:54:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-20 at 13:54 +0200, Yevhen Kyriukha wrote:
> 2013/11/18 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > On Mon, 2013-11-18 at 21:43 +0200, Yevhen Kyriukha wrote:
> >> Hi,
> >>
> >> When I set
> >> INHERIT += "rm_work"
> >> in my local.conf to save some space my kernel now recompiles each time
> >> I run bitbake.
> >>
> >> How to fix this without removing "rm_work" from config?
> >
> > Like this. I keep suggesting someone send me the patch but it never
> > seems to happen...
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 383043e..ff99c76 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -146,7 +146,6 @@ do_bundle_initramfs () {
> >                 fi
> >         fi
> >  }
> > -do_bundle_initramfs[nostamp] = "1"
> >
> >  python do_devshell_prepend () {
> >      os.environ["LDFLAGS"] = ''
> >
> 
> Thanks for the answer but it didn't help.
> Kernel still rebuilds.

Right, the above is the first step in solving this but there is another
issue, the do_bundle_initramfs task is not covered by sstate. We need to
fix the second issue too.

Cheers,

Richard



