Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwA9z-0000F6-Eh for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:58:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAl6Jf019985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:47:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19675-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:47:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAkxiZ019957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:47:01 +0100
Message-ID: <1343731620.3360.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 11:47:00 +0100
In-Reply-To: <CALbNGRQCETb5Q9WpoJDzmGwmUB7YPYhgjD21ZUUOmjwkBNGC8g@mail.gmail.com>
References: <20120722104353.A204B1032B@opal>
	<CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>
	<CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
	<CALbNGRQCETb5Q9WpoJDzmGwmUB7YPYhgjD21ZUUOmjwkBNGC8g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6VAl6Jf019985
Subject: Re: [oe-commits] Morgan Little : python-native: Put binaries in seperate directory
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
X-List-Received-Date: Tue, 31 Jul 2012 10:58:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-30 at 16:08 +0200, Andreas M=C3=BCller wrote:
> > Could somebody enlighten me please: What is the benefit in moving
> > python-native into a subdirectory and causing tons of recipe changes?

People were running into a problem where python-native might be
installed or uninstalled from the sysroot whilst it was being executed.

The trouble is not everything using python-native actually lists it as a
dependency. Its complicated by the fact we have the system provided
python to consider.

In general most things can use the system python. There are some which
need "our" python since they need our python libraries or deal with
their own python modules.

The best way to deal with these issue is to disentangle the python from
the system from that in sysroot and the only way I'm aware of is to
change the paths. We're unfortunately having to figure out which pieces
need the sysroot python and this is causing a few bumps. I'm sorry about
that and we're all doing our best to sort that out.

If you want stability, please use the stable release branch. We do our
best with master but we accept changes there and there is a risk that
things can break. We've always been clear about this.

> > The commit message does not help me much.

There was significant mailing list discussion about this and perlnative
which shares a similar problem.

> > To me it is just another build breaker after gobject-introspection &
> > gtk-doc. Please tell me how many further weeks we have to suffer for
> > innovations like this so I can come back then.
> >
> I forgot webkit-gtk PARALLEL_MAKE in my list

Well, gtk-doc is a sensible cleanup to make the metadata easier and most
sustainable, likewise the introspection change. We've adopting an
approach to building them endorsed by the upstream project.

The webkit-gtk parallel make issues are a pain. It takes an age to
build, parallel make speeds it up but something is broken, probably make
3.82. I'm at a loss as to how to deal with it. You can easily disable
parallel make for that recipe in your local.conf as a workaround for now
if its causing a problem (PARALLEL_MAKE_pn-webkit-gtk =3D "").

I'm sorry there has been some disruption, this is unfortunate but a
consequence of trying to develop things and we're all doing our best to
resolve the issues.

Cheers,

Richard




