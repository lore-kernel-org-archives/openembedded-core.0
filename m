Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3746CF6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 13:42:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IDgVSR028585; Fri, 18 Oct 2013 14:42:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Lo3vuxtLIRyo; Fri, 18 Oct 2013 14:42:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IDgSdS028577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 18 Oct 2013 14:42:30 +0100
Message-ID: <1382103745.29912.545.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 18 Oct 2013 14:42:25 +0100
In-Reply-To: <alpine.DEB.2.02.1310180909160.18187@oneiric>
References: <alpine.DEB.2.02.1310170803260.23524@oneiric>
	<1382089284.29912.528.camel@ted>
	<alpine.DEB.2.02.1310180909160.18187@oneiric>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: diff between defining a "no-op" task and using [noexec]?
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
X-List-Received-Date: Fri, 18 Oct 2013 13:42:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-18 at 09:13 -0400, Robert P. J. Day wrote:
> On Fri, 18 Oct 2013, Richard Purdie wrote:
> 
> > On Thu, 2013-10-17 at 08:07 -0400, Robert P. J. Day wrote:
> > >   using a concrete example, there's this from oe core's
> > > linux-dummy.bb:
> > >
> > > do_configure() {
> > >         :
> > > }
> > >
> > > do_compile () {
> > >         :
> > > }
> > >
> > > do_install() {
> > >         :
> > > }
> > >
> > >   what is the difference between the above and writing:
> > >
> > > do_configure[noexec] = "1"
> > > do_compile[noexec] = "1"
> > > do_install[noexec] = "1"
> > >
> > >   *is* there a difference? if so, does it have to do with the
> > > processing of other flags for that task?
> > >
> > >   i can see that, technically, the first variation still defines a
> > > task to be run, while the second specifies that the task *not* be run,
> > > so i can appreciate that those two operations have different results.
> >
> > The difference is just that, with the first case bitbake will run
> > the task, it will do nothing. In the second case, bitbake will not
> > bother running it at all.
> 
>   i figured as much, but is there any important (pragmatic)
> distinction between the two if one simply wants to nullify an existing
> task?

One is slightly more efficient since bitbake doesn't run it at all.

>   if there's a defined task dependency of some kind, i can certainly
> see how having a defined task consisting of a no-op would behave
> differently from specifying to not run that task at all, in terms of
> subsequent dependencies. does that distinction come into play
> anywhere? is there an example in the OE source that recognizes this?

No, the way we use noexec tasks, we still have to ensure dependencies
are recognised and built before the noexec task is skipped.

>   and WRT to how developers should code, is one of these approaches
> considered better than the other? i've seen both approaches used in
> recipe files, and i'm wondering simply about coding style. thanks.

noexec is newer, slightly more efficient and not used everywhere. The
":" notation is slightly more readable in some circumstances.

You're looking for a "use X" type answer but I'm not giving one since
sometimes one can make slightly more sense that the other and I don't
want patches doing wholesale conversion from one to the other. I
appreciate that is frustrating but like any things, hard and fast rules
don't make sense, you should think about it.

Cheers,

Richard



