Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEC36D544
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:53:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALDrVWU007916; Thu, 21 Nov 2013 13:53:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id phci4O1mUYQP; Thu, 21 Nov 2013 13:53:31 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALDrN76007853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Nov 2013 13:53:25 GMT
Message-ID: <1385042000.16887.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com
Date: Thu, 21 Nov 2013 13:53:20 +0000
In-Reply-To: <528DBE98.3080309@emagii.com>
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
	<528DBE98.3080309@emagii.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Thu, 21 Nov 2013 13:53:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 09:04 +0100, Ulf Samuelsson wrote:
> >>       Why restrict PARALLEL_MAKE to anything less than the number of H/W
> >> threads in the machine?
> >>
> >>       Came up with a construct PARALLEL_HIGH which is defined alongside
> >> PARALLEL_MAKE in conf/local.conf
> >>
> >>       PARALLEL_MAKE = "-j8"
> >>       PARALLEL_HIGH = "-j24"
> >>
> >>       In the appropriate recipes, which seems to be processed by bitbake
> >> in solitude I do:
> >>
> >>       PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
> >>       PARALLEL_MAKE  = "${PARALLEL_HIGH}"
> >>
> >>       This means that they will try to use each H/W thread.
> > Please benchmark the difference. I suspect we can just set the high
> > number of make for everything. Note that few makefiles are well enough
> > written to benefit from high levels of make (webkit being an notable
> > exception).
> >
> It looks like it is shaving off  ~2 minutes from a build which normally 
> takes ~84 minutes.
> 
> First build
> PARALLEL_MAKE = "-j12"
> PARALLEL_HIGH = "-j24"
> BB_NUMBER_THREADS = "24"
> real    83m24.093s
> 
> Second build
> PARALLEL_MAKE = "-j12"
> PARALLEL_HIGH = "-j12"
> BB_NUMBER_THREADS = "24"
> real    85m12.007s

but what if you set both to -j24?

What I'm trying to understand is if we really need two different
variables?

Note you can also do:

PARALLEL_MAKE = "-j12"
PARALLEL_MAKE_pn-webkit-gtk = "-j24"

so I'm still not convinced we want to start having PARALLEL_HIGH as it
will just confuse users IMO.

Cheers,

Richard


