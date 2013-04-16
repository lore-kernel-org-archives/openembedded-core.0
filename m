Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USDX1-0007K8-3L for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 23:35:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GLI5nI021952; Tue, 16 Apr 2013 22:18:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7YxXxiMhm6Q9; Tue, 16 Apr 2013 22:18:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GLHwoA021941
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 22:17:59 +0100
Message-ID: <1366147047.8670.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 16 Apr 2013 22:17:27 +0100
In-Reply-To: <CALbNGRQM15TSn5M52Bk0SuadUOEMN2f8qM0RHV3rBTL4jRbUQA@mail.gmail.com>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
	<CALbNGRQM15TSn5M52Bk0SuadUOEMN2f8qM0RHV3rBTL4jRbUQA@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r3GLI5nI021952
Cc: openembedded-core@lists.openembedded.org
Subject: Re: experiences with images based on current layer heads
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
X-List-Received-Date: Tue, 16 Apr 2013 21:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-04-16 at 14:17 +0200, Andreas M=C3=BCller wrote:
> On Wed, Apr 3, 2013 at 4:02 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Hi,
> >
> > when migration of systemd to oe-core turned to unbuildable I decided
> > to freeze my images and stopped further tests. Now that many issues
> > were fixed and we are close to another release I built my standard
> > xfce-based image based on latest layer HEADs. With this I face some
> > issues which I would like to share:
> >
> > 1. X sessions crash with OOM. This is reproducible by opening
> > google-maps with midori and changing to satellite view. In
> > Xorg.0.log.old I see only
> >
> > | (EE)
> > | (EE) Backtrace:
> > | (EE)
> > | (EE) Segmentation fault at address 0x9
> > | (EE) BUG: triggered 'if (inSignalContext)'
> > | (EE) BUG: log.c:502 in LogVMessageVerb()
> > | (EE) Warning: attempting to log data in a signal unsafe manner whil=
e
> > in signal context.
> > | Please update to check inSignalContext and/or use
> > LogMessageVerbSigSafe() or ErrorFSigSafe().
> > | The offending log format message is:
> > |
> > | Fatal server error:
> > |
> > | (EE)
> > | (EE) Backtrace:
> > | (EE)
>=20
> Seems I found this one: it is caused by undefined signedness for char.
> ARM uses unsigned by default but in the code we find
>=20
> if (pClient->smart_priority < 0)
>=20
> After final tests and sending upstream I'll send a patch here.

Nice work in tracking that down! :)

Cheers,

Richard



