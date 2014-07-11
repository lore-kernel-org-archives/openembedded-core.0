Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 985687024B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 13:22:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6BDMNuo001115; Fri, 11 Jul 2014 14:22:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1qXHKpZckNJe; Fri, 11 Jul 2014 14:22:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6BDMGWu001109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 11 Jul 2014 14:22:17 +0100
Message-ID: <1405084930.21289.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 11 Jul 2014 14:22:10 +0100
In-Reply-To: <CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Jul 2014 13:22:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-11 at 09:14 -0300, Otavio Salvador wrote:
> >> When I see a RFC serie I expect people to wait some days /for
> >> comments/. I learned today those are already merged and /no comment
> >> time/ has been given.
> >
> > The whole RFC was not merged. The previous RFC was and when that
> > happened, to avoid more rebuilds, I chose to merge some parts of the
> > second one since there appeared low risk.
> >
> > I send out a lot of patches, in general I get zero replies to most of
> > them so its hard to know when I've waited "long enough". I did seek out
> > and talk to some people about those RFCs and the feedback was positive,
> > we all agree that the improvements to the dependency checking outweigh
> > any downsides, including to be this issue.
> 
> Right but we could have it tried in AB and, as other times we did, do
> the fixes to avoid master breakage.

I was under the impression that we did run some tests but I think it was
hidden by other failures. We tend to test patches in batches and then
have to make a best guess as to what is ready to merge.

> I liked the patches and I did look at them. I was going to test the
> stuff when I noticed it were merged. For RFC patches to be sincere I
> expect them to be send /again/ without being RFC prior merging.
> 
> When you intend to give a short time for review/comment please comment
> this in the series; so if someone wants more time can comment.
> 
> >> The problem I found is that running the QA checks in another task
> >> seems to break some use-cases.
> >
> > I think in this case the usage is rather horrid and not something I'd
> > say we've ever suggested or supported.
> 
> Well ... I'd prefer Freescale to fix their binaries for sure but I
> cannot do it myself ;-)

What I mean specifically is that the populate_packages_prepend is
horrid. populate packages is for what it says, populating the packages,
not for package QA testing. Setting this there happened to work but I
don't think anyone ever intended that to work. Even touching
populate_packages itself is not recommended, there are lists of
functions you can append your own to now.

The right level to set this data is at the recipe level which is what an
anonymous python fragment will do.

> >> In the libfslcodec (it is a binary blob provided by Freescale for
> >> multimedia) we have:
> >>
> >> ...
> >> python populate_packages_prepend() {
> >>     ...
> >>     # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
> >>     # the source we cannot fix it. Disable the insane check for now.
> >>     for p in d.getVar('PACKAGES', True).split():
> >>         d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")
> >>
> >>         if p == 'libfslcodec-test-bin':
> >>             # FIXME: includes the DUT .so files so we need to deploy those
> >>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel libdir")
> >>         else:
> >>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel")
> >>     ...
> >> }
> >>
> >> In this case the INSANE_SKIP var is not being set on time. If we check
> >> the value it is being set but it seems to be too late.
> >>
> >> How we can address it?
> >
> > Should be as simple as s/populate_packages_prepend//. The
> > DEBIAN_NOAUTONAME doesn't really fit the description of the code there
> > FWIW, I know why you're doing it but its not what the comment says.
> 
> I will review it.
> 
> > I would not recommend setting variables in function prepends like this,
> > its ugly and error prone, as you've just found out.
> 
> Any suggested better way of to do it?

The anonymous python fragment should be fine, it sets the data at the
right level, the global recipe level rather than burying it in some
task.

Cheers,

Richard



