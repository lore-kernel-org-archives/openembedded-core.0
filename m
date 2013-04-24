Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUzuO-0000y1-HQ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 15:38:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2013 06:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,542,1363158000"; d="scan'208";a="323802226"
Received: from unknown (HELO helios.localnet) ([10.255.13.249])
	by orsmga002.jf.intel.com with ESMTP; 24 Apr 2013 06:21:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 24 Apr 2013 14:21:07 +0100
Message-ID: <1593024.LqG1OqkOga@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
References: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst questions (was postinst does not finish)
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
X-List-Received-Date: Wed, 24 Apr 2013 13:39:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 24 April 2013 14:04:39 Andreas M=FCller wrote:
> as written before: an 'exit 1' within recipe's postinst causes
> trouble. E.g meta-oe's lxdm does not run systemd.bbclass' code which
> leaves lxdm in unprepared condition causing start too early and endin=
g
> in unfinished postinstall.

I think the way forward with this is to avoid doing this at all - let's=
 try to=20
get as many of these postinstalls working on the host. Looking at the=20=

postinstall in the lxdm recipe in meta-oe, I can't see anything that co=
uldn't=20
work on the host - $D would just be needed in front of ${libdir} and=20=

${localstatedir}.

> A simple workaround for this (we should think of something else later=
)
> would be to prepend postinst code within systemd.bbclass (and maybe
> others too) instead of appending. Hereby we ensure that the code is
> executed independent of recipe's code. First question: Any objections=
?

As long as there's no reliance within systemd.bbclass upon anything tha=
t a=20
recipe's custom postinstall might be doing - this could be problematic =
for=20
example if the custom postinstall were configuring a service which woul=
d be=20
automatically started as a result of the systemd postinstall (not sure =
if this=20
is how this ends up operating without trying it, but you get the idea.)=

=20
Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


