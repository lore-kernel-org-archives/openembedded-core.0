Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDDD70381
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 08:27:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6B8RHBP020884; Fri, 11 Jul 2014 09:27:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZchXnShx27kt; Fri, 11 Jul 2014 09:27:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6B8RBqA020872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 11 Jul 2014 09:27:12 +0100
Message-ID: <1405067225.15985.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 11 Jul 2014 09:27:05 +0100
In-Reply-To: <CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 08:27:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-10 at 23:43 -0300, Otavio Salvador wrote:
> On Wed, Jul 9, 2014 at 5:15 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Its possible to run the package QA checks as a separate task rather than
> > as part of the do_package task. This offers more parallelism but the
> > fact that made me propose this is that ideally we'd like to access
> > pkgdata to help add new tests and to do that, we need to run later in
> > the task list. We also need to add in RDEPENDS to the task which apply
> > to do_package_write_* but not do_package. See the subsequent patches
> > for why this is desireable.
> >
> > If we split into a separate task, we need to add in calls to read
> > the sub package data, build the cache structure used by do_package and
> > cover the task with sstate (which is empty and just acts as a stamp
> > saying it passed package QA). We also need to handle our own
> > dependencies.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I've just seen this email. I did see the failure from the overnight
build and already sent a reply suggesting how this can be fixed, it
should be a simple change.

> When I see a RFC serie I expect people to wait some days /for
> comments/. I learned today those are already merged and /no comment
> time/ has been given.

The whole RFC was not merged. The previous RFC was and when that
happened, to avoid more rebuilds, I chose to merge some parts of the
second one since there appeared low risk.

I send out a lot of patches, in general I get zero replies to most of
them so its hard to know when I've waited "long enough". I did seek out
and talk to some people about those RFCs and the feedback was positive,
we all agree that the improvements to the dependency checking outweigh
any downsides, including to be this issue.

> The problem I found is that running the QA checks in another task
> seems to break some use-cases.

I think in this case the usage is rather horrid and not something I'd
say we've ever suggested or supported.

> In the libfslcodec (it is a binary blob provided by Freescale for
> multimedia) we have:
> 
> ...
> python populate_packages_prepend() {
>     ...
>     # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
>     # the source we cannot fix it. Disable the insane check for now.
>     for p in d.getVar('PACKAGES', True).split():
>         d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")
> 
>         if p == 'libfslcodec-test-bin':
>             # FIXME: includes the DUT .so files so we need to deploy those
>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel libdir")
>         else:
>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel")
>     ...
> }
> 
> In this case the INSANE_SKIP var is not being set on time. If we check
> the value it is being set but it seems to be too late.
> 
> How we can address it?

Should be as simple as s/populate_packages_prepend//. The
DEBIAN_NOAUTONAME doesn't really fit the description of the code there
FWIW, I know why you're doing it but its not what the comment says. 

I would not recommend setting variables in function prepends like this,
its ugly and error prone, as you've just found out.

Cheers,

Richard


