Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKSdZ-0005A3-U2 for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 13:06:06 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QBwcts031115; Tue, 26 Mar 2013 11:58:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v6jHPYNg4uT6; Tue, 26 Mar 2013 11:58:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QBwSpD031094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Mar 2013 11:58:31 GMT
Message-ID: <1364298513.3097.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 26 Mar 2013 11:48:33 +0000
In-Reply-To: <CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
	<CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r2QBwcts031115
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
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
X-List-Received-Date: Tue, 26 Mar 2013 12:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-03-26 at 12:40 +0100, Andreas M=C3=BCller wrote:
> On Tue, Mar 26, 2013 at 11:32 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
> > On 25 March 2013 23:47, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com> wrote:
> >> fixes:
> >> | ERROR: Multiple .bb files are due to be built which each provide v=
irtual/gtk-update-icon-cache-native
> >> | (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recip=
es-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> >> | virtual:native:/home/Superandy/data/oe-core/sources/openembedded-c=
ore/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
> >> | This usually means one provides something the other doesn't and sh=
ould.
> >
> > NACK.
> >
> > The only way this can happen is if something is depending on
> > gtk+-native, as everything in oe-core (should) depends on
> > virtual/gtk-update-icon-cache:
> >
> > commit f07515096ea39e267cd3ebeea08cffbba1af07e0
> > Author: Ross Burton <ross.burton@intel.com>
> > Date:   Mon Mar 4 12:52:45 2013 +0000
> >
> >     default-providers: add default virtual provider for gtk-update-ic=
on-cache
> >
> >     Use a virtual provider instead of a hard dependency so that if
> > gtk+-native is
> >     required in some configuration, this provider can be changed and =
then
> >     gtk+-native and gtk-update-icon-cache-native won't be both built
> > and conflict in
> >     the sysroot.
> >
> > Presumably some application you've got is explicitly depending on
> > gtk+-native, probably for the icon cache handling.  It should drop
> > that build dependency and use the class instead.
> >
> > Your fix "works" but will cause file overwrite warnings in sysroot
> > when you actually do want a gtk+-native, for example if you do want t=
o
> > build a native gtk+ application or some reason.
> >
> > Ross
> Why do we need two providers which need pinning doing exactly the same?

I'd love to remove gtk+-native.

The icon-cache-native gives about a 5% build speedup as it has a lot
less dependencies than gtk+-native so it is a good thing. We could fix
things to coexist however unless there is a good reason to keep gtk
+-native around, we should switch things over. Things were therefore
left like this to provide gentle pressure to layers that are still using
gtk+-native.

If there are valid cases where gtk+-native is still necessary we can
revisit this but we're not aware of any right now.

Cheers,

Richard



