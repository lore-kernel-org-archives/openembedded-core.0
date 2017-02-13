Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A46074197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1DI5Urr007678; Mon, 13 Feb 2017 18:05:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DYntSeDz1aQE; Mon, 13 Feb 2017 18:05:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1DI5Iip007612
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Feb 2017 18:05:24 GMT
Message-ID: <1487009117.27753.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 13 Feb 2017 10:05:17 -0800
In-Reply-To: <CALbNGRQns-G9XOtS8wGetnAAYVv7Z+F+2h3rLQ2XxgSiSBwHWQ@mail.gmail.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<CALbNGRQns-G9XOtS8wGetnAAYVv7Z+F+2h3rLQ2XxgSiSBwHWQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 18:05:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-13 at 16:45 +0100, Andreas Müller wrote:
> On Mon, Feb 13, 2017 at 4:24 PM, Patrick Ohly <patrick.ohly@intel.com
> > wrote:
> > On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> > > I think it's feature which was already there, but almost never
> > > triggered (even in test-dependencies.sh tests), but with RSS it
> > > fails
> > > reliably.
> > > 
> > > See:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-Ju
> > > ly/124435.html
> Richard wrote
> > 
> > What it does mean is that any recipe needing a -native recipe to
> > build
> > should list it in DEPENDS directly, not rely on other dependencies
> > to
> > pull it in for them. This applies to pkgconfig-native, intltool-
> > native
> > and also to wayland-native.
> This answers my question and leaves me unhappy - I am out for a
> while..

To be clear, you can't depend on the build dependencies of some other
recipe to be available to your recipe just because you DEPEND on it.

The RDEPENDS issue that Patrick mentions is a different one, its a
valid recipe markup problem we have processing RDEPENDS information in
the native case.

The kind of indirection that Andreas sounds like he's been relying on
may have happened to work most of the time but I'd bet there were ways
that a semi populated sstate cache could break it.

With RSS, we encoded the sstate behaviour in a deterministic way so the
races that might have happened now do happen all the time.

The simple solution for repetitive dependencies and shortcuts is just
to create a class, list all the things you need in there and then
inherit the class in the recipes as appropriate. I'd hope that isn't
too hard to sort out...

Cheers,

Richard

