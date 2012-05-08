Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SRegP-0006ms-87
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 09:18:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4878ClN025795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2012 00:08:12 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 00:08:11 -0700
Date: Tue, 8 May 2012 02:07:38 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120508020738.46574fa5@wrlaptop>
In-Reply-To: <4FA8611B.8060609@intel.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<4FA8611B.8060609@intel.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: scott.a.garman@intel.com
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Tue, 08 May 2012 07:18:05 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 May 2012 16:56:11 -0700
Scott Garman <scott.a.garman@intel.com> wrote:

>  From what I can tell, the =3D~ regex operator is a bashism. It's also
> one that helps a lot with the code readability. So now that we're
> faced with re-writing the script to avoid using that operator, I'm
> having second thoughts about whether the runqemu script really needs
> to be shell-agnostic. The alternative of invoking grep or other
> commands to process the name patterns does not appeal to me.
>=20
> I can understand why we're trying to ensure our build system doesn't=20
> require /bin/sh to be bash, but I think support scripts like runqemu=20
> might be a special case.
>=20
> What do other people in the community think of this? The runqemu
> script isn't trivial, and it has to run in a lot of different
> contexts. Should we put the time in to make it shell-agnostic, or
> allow it to require bash?

Hmm.  I am honestly not a big fan of the =3D~, simply because I almost
never remember it, and I can never think whether it's like perl's ~=3D
or Lua's ~=3D.  (One is "matches", the other is "is not".)

I tend to write stuff like this as

case $name in
*pat1* | *pat2* | ... )
  # code goes here
  ;;
esac

because that's the natural shell idiom.  It can't do full regex
processing, but we really don't need that here; we just want an
unanchored pattern match.  (And I'm not even sure we *want* a
fully-unanchored match.)  I think the bash [[ ]] thing is one of the
kshisms, but "bash or ksh" is not much better.  :P

=46rom a maintenance standpoint, I like the case construct better
than [[]].  My interest in reading the bash man page to figure out what
some unfamiliar bit of punctuation means this week has declined over
the years.

-s
--=20
Listen, get this.  Nobody with a good compiler needs to be justified.


