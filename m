Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 07A8A774FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 22:44:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4OMiovr029714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 24 May 2017 23:44:54 +0100
Message-ID: <1495665889.25229.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Mike Crowe <mac@mcrowe.com>
Date: Wed, 24 May 2017 23:44:49 +0100
In-Reply-To: <CAJTo0LZCojNChLhaBsAqNouue3JEX9b7gfF5AQOiyhTedW_ByQ@mail.gmail.com>
References: <20170524132336.4259-1-mac@mcrowe.com>
	<CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
	<20170524135232.GA13067@mcrowe.com>
	<CAJTo0LZCojNChLhaBsAqNouue3JEX9b7gfF5AQOiyhTedW_ByQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 24 May 2017 23:44:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Wed, 24 May 2017 22:45:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-05-24 at 17:25 +0100, Burton, Ross wrote:
> 
> On 24 May 2017 at 14:52, Mike Crowe <mac@mcrowe.com> wrote:
> > Oh, I thought that binconfig.bbclass swung through hoops in order
> > to make
> > the scripts work well enough. Is that not true?
> > 
> > Many other recipes are still inheriting binconfig rather than
> > binconfig-disabled: apr, curl, gnutls, libtasn1.
> > 
> binconfig goes through hoops that are just not required with
> pkgconfig, and the hoops are hacks which may not be reliable.  I
> can't remember the details but I do remember that libgcrypt/gnupg was
> a worst offender here.
> 
> CCing Richard to see if he can remember why.
> 
> In the glorious future removing all binconfig scripts would be the
> ideal, in my opinion.  Alternatively replacing them with glorified
> pkgconfig wrappers.

We made a choice back then to go ahead and migrate these pieces to pkg-
config regardless of upstream's views since its so much cleaner and
less error prone than -config shell scripts which need hacking. We do
also patch the autoconf macros those pieces of software ship so that
pkg-config is used by the standard macros which covers most users
(since we reautoconf software).

Yes, binconfig.bbclass does have code which goes through hoops but I
don't think anyone would argue that code is pleasant or even scalable.
You can't easily change any of the sed expressions since you can't
easily know what set of file content they operate on and what side
effects any given change might have. The upstreams do change the
contents of the files over time and we can't really know if any given
replacements are still needed or if a new replacement may break other
files. Its also bad in that the on target versions need to differ to
the version used during cross building so you can't even have one
version of the file. I've seen these problems happen, my patches in the
past were after being burnt by that code.

For those reasons I believe we should be removing usage of
binconfig.bbclass from the system where we can if at all possible and
replacing it, even if it increases our custom patch load a little. I
know its used in a few places and I never did completely get rid of all
the config files but I still believe doing so would in fact be a
worthwhile effort.

I appreciate that does cause some pain as we're doing something
differently but I also believe it is justified. I would suggest
reminding these upstreams who won't at least allow pkg-config in
parallel that this does cause pain in the hope that if multiple people
report it, they may rethink things.

Cheers,

Richard



