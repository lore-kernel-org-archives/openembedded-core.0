Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9C36E791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 11:00:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0TB05kY027488; Wed, 29 Jan 2014 11:00:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yJt7B2AQtg7Y; Wed, 29 Jan 2014 11:00:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0TB01lj027464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 11:00:03 GMT
Message-ID: <1390993195.24655.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 29 Jan 2014 10:59:55 +0000
In-Reply-To: <52E8D497.1080708@dresearch-fe.de>
References: <1390833588.17424.254.camel@ted> <52E8D497.1080708@dresearch-fe.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 11:00:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 11:14 +0100, Steffen Sledz wrote:
> On 27.01.2014 15:39, Richard Purdie wrote:
> > Its rather sad that people don't appear to read local.conf and then complain
> > about slow builds when they're just using a single thread. Most systems have
> > more than one core now so we might as well use a more automatic default
> > for these values. This may lead to better experiences for new users.
> > 
> > [YOCTO #2528]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> > index 71856b8..36d33e1 100644
> > --- a/meta/conf/local.conf.sample
> > +++ b/meta/conf/local.conf.sample
> > @@ -18,12 +18,18 @@
> >  # option determines how many tasks bitbake should run in parallel:
> >  #
> >  #BB_NUMBER_THREADS ?= "4"
> > +#
> > +# Default to setting automatically based on cpu count
> > +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> >  # 
> >  # The second option controls how many processes make should run in parallel when
> >  # running compile tasks:
> >  #
> >  #PARALLEL_MAKE ?= "-j 4"
> >  #
> > +# Default to setting automatically based on cpu count
> > +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> > +#
> >  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
> >  # be appropriate for example.
> 
> On our Fedora-18 build host this change leads to the following exception. :(

Do you have:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=721773072da08cf0f5e1206961ada3083b6722b4

?

Cheers,

Richard


