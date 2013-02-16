Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U6hWC-0003WU-Nt for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 14:09:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GCxbut011377; Sat, 16 Feb 2013 12:59:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VLGM0d1Znm8y; Sat, 16 Feb 2013 12:59:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GCxRwi011370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 16 Feb 2013 12:59:30 GMT
Message-ID: <1361019187.31795.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 16 Feb 2013 12:53:07 +0000
In-Reply-To: <CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 13:09:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-02-16 at 08:47 -0200, Otavio Salvador wrote:
> On Sat, Feb 16, 2013 at 7:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2013-02-15 at 19:19 +0100, Enrico Scholz wrote:
> >> it would be nice when the decision to make the init manager a distribution
> >> feature will be reverted to the old oe-meta mechanism.
> >>
> >> Being a distribution feature means, that packages are created in such a
> >> way that it is impossible to split off unwanted and heavy weighted
> >> functionality at image creation time.
> >>
> >> E.g. on most of my systems, I create two kinds of images: a full
> >> featured, systemd based one and a very minimal rescue system with
> >> busybox and some filesystem utilities.  With recent systemd packaging
> >> change, the rescue image size grow up from 5.9 MiB to 27 MiB because
> >> systemd dependencies are hardcoded in mandatory packages.
> >>
> >> Formerly, systemd dependencies could be avoided by adding the -systemd
> >> packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
> >> busybox-syslog-systemd rrecommend).
> >>
> >> I am aware that initscripts were always part of the main package.  But
> >> sysvinit was very lightweighted and the extra space either negligible or
> >> easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
> >>
> >> Hence my recommendation: make the init manager an image feature again
> >> and create -systemd and -sysv packages with the corresponding scripts.
> >> OpenEmbedded is still for embedded devices where size matters.
> >>
> >> Of course, systemd can be still a distribution feature to enable things
> >> like socket activation as part of PACKAGE_CONFIG.  But dependencies on
> >> init system packages should be RRECOMMENDS which can be overridden
> >> easily at image creation time.
> >
> > The trouble is that by making it an "image feature", people will expect
> > *everything* to work properly and to be able to have fully functional
> > sysvinit and systemd variants of images. We already see this
> > expectation. Trying to explain to people what the limitations are, what
> > is expected to work and what isn't will be difficult. I know you
> > understand this but going forward most people will simply not and I
> > think it will be a nightmare for usability.
> 
> You said you already see it so what is the change? For me less
> flexibility is more problem and the result are more ugly hacks. I've
> been using the systemd system in meta-oe in product for long time and
> it works fine. In same distro I build other product with is sysvinit
> based and it also works fine.
> 
> Now I have a nightmare in upgrade path, a change in the way my
> customer work and as a plus the need to make two different
> distributions for same product. No sense to me.
> 
> Final result? This product won't go out of danny as I won't be able to
> provide an usable upgrade path without forking OE or having an insane
> amount of bbappend hacks.

When systemd was added to meta-oe, it was clearly mentioned that it was
a proof of concept to experiment with integrating it and subject to
change until it made it into OE-Core. The fact is is changing is
therefore not a surprise. We do need to think about making sure we have
equivalent functionality, we also need to think about migration but the
fact changes happened with some experimental work should not surprise
people. I appreciate that isn't ideal but it is the way it is.

> > For that reason I'd rather see this done in a different way, for example
> > blacklisting the problematic systemd dependencies at image generation
> > time with some kind of stronger BAD_RECOMMENDS code. Yes, this means
> > there would be some systemd config files lying around but you'd stop the
> > main bulk of it coming in (and as you said, some small config files
> > aren't an issue).
> 
> Check the amount of changes for do_install_append has sent today. This
> was all not need with the code we had and which works fine. This is
> just duplicated code all over recipes. Seriously the systemd
> integration was done in complete wrong way in my POV. It broght up
> problems we have fixed and do major improvements in meta-oe ... at no
> profit.

Sorry you feel that way. I'm equally frustrated with the way systemd was
added to meta-oe and the damage it did to the overall usability of the
OE ecosystem. I'm trying to take positive actions from that such as
ensuring we never do something like it again. 

As for the integration into the core, I haven't been too involved with
that and perhaps I should be. The trouble is I alone don't scale and I'm
trying to ensure we have more people taking on this kind of work. This
means letting others take it on and learn. There is a requirement from
the community to ensure people working on improvements like this have
all the needed data and that is something which I don't think happened
well here. My point is that I think there have been failings in various
places and the community needs to take some responsibility too.

On the specifics of the do_install_append, you've seen my comments about
how we're not learning from past mistakes with the way the do_install in
the class was written. I note Phil also agreed with them, both of us
remembering some of the horrors we've dealt with in the past (and
binconfig.bbclass is still around, sadly).

One of the goals of OE-Core is to improve quality. I appreciate in this
case you disagree about the "quality" of those bbappends but I still
believe that approach will be better in the long term as upstream
software starts shipping systemd support. Short term its uglier, I
totally agree. Part of my role in things is to look beyond the short
term, even if people don't want to hear that.

> I know it is not the better thing to read but I think it is nice when
> we receive feedback as it allows for rethink of our path of work.

See above as there is some feedback there too ;-)

I'd also note that its ELC next week and I'll be travelling. Lack of
response doesn't mean I don't care about this, I do. There are only so
many hours in the day though and whilst at ELC, I will need to focus
primarily on that.

Cheers,

Richard




