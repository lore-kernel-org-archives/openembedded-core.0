Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 89B1A73120
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 22:28:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4OMSOoF029013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 24 May 2017 23:28:28 +0100
Message-ID: <1495664903.25229.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 24 May 2017 23:28:23 +0100
In-Reply-To: <2e2982504b9f46819b0c90ad11fdde7b@XBOX02.axis.com>
References: <cover.1494932131.git.pkj@axis.com>
	<1494940489.27342.30.camel@linuxfoundation.org>
	<2e2982504b9f46819b0c90ad11fdde7b@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 24 May 2017 23:28:29 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Allow oe-pkgdata-util package-info to display more info
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
X-List-Received-Date: Wed, 24 May 2017 22:28:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-16 at 16:29 +0000, Peter Kjellerstedt wrote:
> > 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: den 16 maj 2017 15:15
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 0/2] Allow oe-pkgdata-util package-
> > info
> > to display more info
> > 
> > On Tue, 2017-05-16 at 12:56 +0200, Peter Kjellerstedt wrote:
> > > 
> > > After a build in our autobuilder, we use `oe-pkgdata-util
> > > package-
> > > info
> > > -f package.manifest` to store a file with information about each
> > > installed package. This is typically used to compare builds later
> > > on. Since not every difference to a package is explained by its
> > > version, we have found it beneficial to also include the SRC_URI
> > > in
> > > the generated file.
> > > 
> > > This patch set adds SRC_URI to the pkgdata that is stored for
> > > each
> > > package, and adds a new option to oe-pkgdata-util package-info,
> > > -e <var>, that can be used to display extra variables from the
> > > pkgdata.
> > I'm going to say no to this.
> > 
> > The reason is that pkgdata is not really about collecting up all
> > build
> > information. If you want to know how two different builds differ,
> > you'd
> > use the sigdata files. If I take this patch, more will follow where
> > you
> > find some new difference you want to track and there are other
> > mechanisms I'd suggest (buildhistory and siginfo for starters). I
> > don't
> > want to turn the pkgdata files into something they're not.
> > 
> As you may have expected, that was not the response I had hoped for.
> However, I will see if we can come to a working solution that you can
> accept.
> 
> Since I hope that the change to oe-pkgdata-util is acceptable to you,
> I will focus on the change in package.bbclass.

That change is ok in principle but I don't like the usage of SRC_URI in
the help text or src_uri as a variable name in the code. I could read
that as you're not even making an effort to think bout the bigger
picture or generic patches with a variable name like that :(.

> Regarding siginfo: I assume it has the information in there
> somewhere. However, I have been working with OE for five years now,
> and it is still basically a black hole to me. I have no idea how to
> do anything useful with it.

The siginfo files are pickled python data. You can look at the code in
siggen.py (called from bitbake-dumpsig) so an example of how to view
it. They contain all the information about what went into a given task.

If two siginfo files differ, they'll have different checksums. You can
then see from bitbake-diffsigs exactly what those differences were. On
a per variable basis. They therefore offer the ultimate in build
different analysis.

> Regarding buildhistory: AFAICT there is nothing in there about
> neither recipe names nor SRC_URI. I guess that can be added, though,
> if really needed.

buildhistory is about output comparison so it probably doesn't make
sense there. I do believe it would offer more generic mechanisms than
we can afford with pkgdata though. Your best bet for generic build
comparison is still the siginfo files.

> On the other hand, we have a tool, oe-pkgdata-util, that provides a 
> simple interface to access the package information, and can produce a
> simple information file (oe-pkgdata-util package-info) with one line 
> per package. This file is simple enough that I can give it to our 
> maintenance team and they can look at it to see if there are any 
> differences they need to know about. An additional benefit here is
> that we can run oe-pkgdata-util from within a bitbake task to
> generate the file together with the other artefacts we produce for a
> release.

SRC_URI is not a piece of metadata associated with a package, its
associated with a recipe. Yes, there is recipe metadata that feeds into
packages but we really do need to have data in the right places. We
could list every possible recipe variable in that list, for the reasons
you argue. For example, perhaps S should be listed (and B) since we
might want to locate the source or the built artefacts (and so on). I
believe pkgdata should be limited to package variables though. I
appreciate that isn't what you want to hear.

> That said, I can understand that you do not want to add information
> to the pkgdata that is not really needed to build. However, would you
> accept a way to add to this data, e.g., by specifying a BitBake
> variable such as EXTRA_PKGDATA_VARS with the names of the extra
> variables that should be stored in pkgdata? That way it would not
> affect anyone unless they actually need this extra data, and I would
> not have the burden of carrying a backported version of
> package.bbclass forever in our layers with all the extra maintenance
> that incurs.

The data from pkgdata is really meant to be used by the package_write_*
tasks as a mechanism to transfer data from the do_package task. oe-
pkgdata-util was created to solve problems of visibility into the same
*generated* data. We are planning to add a visualiser of that data too.

What I don't like is adding data that is:
  a) not package specific
  b) not generated
  c) available elsewhere

There are only a very specific set of variables which contain
appropriate data, so no, I don't think we do want to support usecases
which "abuse" this data.

I'm travelling, distracted and tired but you're pushing me for a reply
so there you have it, no, we're not doing this, sorry. 

Cheers,

Richard


