Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsE7l-0008G4-FP for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:24:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KECkM7012721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:12:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:12:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KECael012714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:12:38 +0100
Message-ID: <1342793560.21788.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 15:12:40 +0100
In-Reply-To: <CABcZANkMioYyrY-+eMbkT5Dbsfs5LJEJQaHj31mgv8jd0Z2qiw@mail.gmail.com>
References: <20120720093208.GD3534@jama.jama.net>
	<1342792561.21788.17.camel@ted>
	<CABcZANkMioYyrY-+eMbkT5Dbsfs5LJEJQaHj31mgv8jd0Z2qiw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Yocto style guide change proposal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 14:24:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 06:57 -0700, Chris Larson wrote:
> On Fri, Jul 20, 2012 at 6:56 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
> >> Now we have horrible mixture of whitespaces (tabs and space) only in
> >> recipe files, because yocto style guide recommends tabs in shell
> >> functions. So if recipe has e.g. do_install_append as well as
> >> populate_packages_prepend (not so uncommon combination as tabs fixing
> >> patches show), then according to yocto style guide it should look like
> >> this:
> >>
> >> do_install_append() {
> >>       foo
> >> }
> >> python populate_packages_prepend () {
> >>     libdir = bb.data.expand('${libdir}', d)
> >>     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
> >> }
> >>
> >> especially with default tab width 8 spaces it's ugly and because it
> >> is inconsistent, many devs used spaces in shell functions too. Now when
> >> someone accidentaly use tab also in python function it will show warning
> >> or fail to parse. Some devs are using mix of tabs and spaces even on the
> >> same line (e.g. to indent SRC_URI multiline entries).
> >
> > We've said tabs for shell functions for *years*. I'm sure if I were to
> > look at the mailing list archives, that would be clear.
> >
> > In summary, I agree we need to make the style guides consistent and have
> > one version of them. I disagree with spaces for everything though,m
> > particularly as we have said to use tabs for as long and many of the
> > recipes do this (certainly more than use spaces).
> 
> I don't think history is a particularly good reason to keep our
> metadata inconsistent, especially with bitbake becoming picky about
> it.

I don't see it as inconsistent. I think python needed some special
handling since the language itself uses whitespace for structure and
we're now following standard python practise and have a way to ensure
some kinds of bugs don't creep in in future. It was already the agreed
convention, it just wasn't getting well followed, or we had some issues
migrating old mixed code to any one format without enforcing one.

The shell functions are not whitespace sensitive, its mainly an
atheistic issue. There is no issue with mixing tabs and spaces in the
same file. Sure some editor macro files are slightly harder to write to
handle that but I don't see that as a pressing reason to change what has
been the agreed convention.

What I really don't want is a ton of patches changing 80% of the shell
functions. The python changes at least were limited to a smaller subset
of files, mostly core class ones with the majority being
package.bbclass. If we change the shell convention like this, we're in
for orders of mangitiude more changes for no good reason as far as I can
see. The number of functions out there which are whitespace indented
right now is small as far as I can see.

Cheers,

Richard




