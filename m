Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 5466278124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 16:37:47 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id Qgdl1v0010BmcFC01gdmb9; Thu, 25 May 2017 17:37:48 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Iav3YSia c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=8nJEP1OIZ-IA:10 a=tJ8p9aeEuA8A:10 a=-An2I_7KAAAA:8
	a=3yVqv-UoVgkp1kgFw5cA:9
	a=wPNLvfGTeEIA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1dDvlh-0004LA-3y; Thu, 25 May 2017 17:37:45 +0100
Date: Thu, 25 May 2017 17:37:45 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170525163745.GA16458@mcrowe.com>
References: <20170524132336.4259-1-mac@mcrowe.com>
	<CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
	<20170524135232.GA13067@mcrowe.com>
	<CAJTo0LZCojNChLhaBsAqNouue3JEX9b7gfF5AQOiyhTedW_ByQ@mail.gmail.com>
	<1495665889.25229.32.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1495665889.25229.32.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Revert to inheriting from binconfig
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
X-List-Received-Date: Thu, 25 May 2017 16:37:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wednesday 24 May 2017 at 23:44:49 +0100, Richard Purdie wrote:
> On Wed, 2017-05-24 at 17:25 +0100, Burton, Ross wrote:
> > 
> > On 24 May 2017 at 14:52, Mike Crowe <mac@mcrowe.com> wrote:
> > > Oh, I thought that binconfig.bbclass swung through hoops in order
> > > to make
> > > the scripts work well enough. Is that not true?
> > > 
> > > Many other recipes are still inheriting binconfig rather than
> > > binconfig-disabled: apr, curl, gnutls, libtasn1.
> > > 
> > binconfig goes through hoops that are just not required with
> > pkgconfig, and the hoops are hacks which may not be reliable.  I
> > can't remember the details but I do remember that libgcrypt/gnupg was
> > a worst offender here.
> > 
> > CCing Richard to see if he can remember why.
> > 
> > In the glorious future removing all binconfig scripts would be the
> > ideal, in my opinion.  Alternatively replacing them with glorified
> > pkgconfig wrappers.
> 
> We made a choice back then to go ahead and migrate these pieces to pkg-
> config regardless of upstream's views since its so much cleaner and
> less error prone than -config shell scripts which need hacking. We do
> also patch the autoconf macros those pieces of software ship so that
> pkg-config is used by the standard macros which covers most users
> (since we reautoconf software).

[snip]

> I appreciate that does cause some pain as we're doing something
> differently but I also believe it is justified. I would suggest
> reminding these upstreams who won't at least allow pkg-config in
> parallel that this does cause pain in the hope that if multiple people
> report it, they may rethink things.

I was unaware that oe-core's libgcrypt recipe provides a modified
libgcrypt.m4 in share/aclocal/ that uses pkg-config.

Inspired by the oe-core gnupg recipe, I deleted m4/libgcrypt.m4 from the
libmicrohttpd source directory in a do_configure_prepend and everything now
seems happy.

Thanks, and sorry for the unnecessary diversion.

Mike.

