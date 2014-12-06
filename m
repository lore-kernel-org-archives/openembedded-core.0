Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BADC360673
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 14:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB6EbprA024288; Sat, 6 Dec 2014 14:37:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Onr9aZ1zrLR5; Sat,  6 Dec 2014 14:37:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB6Ebd35024272
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 6 Dec 2014 14:37:50 GMT
Message-ID: <1417876633.5102.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 06 Dec 2014 14:37:13 +0000
In-Reply-To: <CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 14:38:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-12-06 at 11:01 -0200, Otavio Salvador wrote:
> On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
> >> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
> >>
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > Since the split out of git-perltools, some git tools (such as "git am",
> >> > "git send-email" and "git-submodule") have no longer been part of the
> >> > buildtools. We need these, so add them back in.
> >> >
> >> > However, adding git-perltools to buildtools triggers perl itself being
> >> > brought into buildtools as well, and we don't want that; but we also
> >> > don't want to have to hack the git recipe or indeed anything else that
> >> > starts depending on perl. Thus, add a dummy package which gets installed
> >> > in its place, in a separate package architecture that is only enabled
> >> > for buildtools to ensure it doesn't start appearing in place of
> >> > nativesdk-perl anywhere else.
> >> >
> >> > Fixes [YOCTO #7033].
> >> >
> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>
> >> This dummy thing looks like a hack to me :-(
> >
> > Perhaps - I'm all ears for an alternative solution, but it absolutely has to
> > be fixed, and soon. Shipping an incomplete git (or incomplete perl) in
> > buildtools basically defeats a major part of having the thing in the first
> > place.
> 
> We should split out the tools we really want (so we skip the perl
> runtime dependency) or include perl. Use a dummy package for it is
> wrong in my opinion. You cannot guarantee host perl will work as
> expected for our git release.

There needs to be a mechanism where we draw the line on which
dependencies a given thing has. Perl is arguable both ways. In all cases
I'm aware of, the host perl is generally API stable and works fine with
buildtools.

If you don't buy the perl argument, think about bash. Should we ship
bash in case anything in the buildtools tarball? Should we alter all
script paths to point at our own "sh"?

At some point you have to depend on the host system, be it perl, sh or
other things. The exact line should be configurable, Paul is simply
adding a mechanism here that allows us to control that. He's needed a
default and I think perl is API stable enough that we should be ok here.

Cheers,

Richard






