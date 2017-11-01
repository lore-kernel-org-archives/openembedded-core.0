Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9F7A65C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:04:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA1M4eE0025080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 1 Nov 2017 22:04:42 GMT
Message-ID: <1509573880.28159.39.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, "Burton, Ross"
	<ross.burton@intel.com>, Chris Larson <kergoth@gmail.com>
Date: Wed, 01 Nov 2017 22:04:40 +0000
In-Reply-To: <CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
	<CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Wed, 01 Nov 2017 22:04:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-10-31 at 21:25 -0200, Otavio Salvador wrote:
> On Tue, Oct 31, 2017 at 9:16 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 21 October 2017 at 13:06, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-
> > > internal
> > > index e6cd141..abc5aff 100755
> > > --- a/scripts/oe-buildenv-internal
> > > +++ b/scripts/oe-buildenv-internal
> > > @@ -105,6 +105,11 @@ fi
> > > 
> > >  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
> > >  BUILDDIR=$(readlink -f "$BUILDDIR")
> > > +if [ -z "$BBPATH" ]; then
> > > +    BBPATH=$BUILDDIR
> > > +fi
> > > +
> > > +export BBPATH
> > 
> > This breaks the use-case of the user switching between build
> > directories as
> > re-executing oe-init-build-env doesn't change BBPATH.
> I know and that's why I asked for a warning! ;-)

My patch as it stands clearly can't go in.

Our options are:

a) make that codepath unconditional (which may be no bad thing) and 
   use BBPATH
b) use a specific variable for bitbake, the script sets BUILDDIR
c) start allowing the external code to set TOPDIR directly

I think I'm leaning towards a) or possibly c). I don't really like b).
I tried c) locally and its behaving oddly. a) is known to work.

Chris, any thoughts on the original intentions or what we should do
here?

Cheers,

Richard

