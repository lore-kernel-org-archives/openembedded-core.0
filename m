Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 14F036CEED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 11:12:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9ABCuW2028014; Thu, 10 Oct 2013 12:12:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aAgOlE27TfkD; Thu, 10 Oct 2013 12:12:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9ABCrVC028010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 10 Oct 2013 12:12:54 +0100
Message-ID: <1381403569.29912.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 10 Oct 2013 12:12:49 +0100
In-Reply-To: <1381402804.11000.61.camel@phil-desktop.brightsign>
References: <1381356715.29912.48.camel@ted>
	<1381402804.11000.61.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Thu, 10 Oct 2013 11:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-10 at 12:00 +0100, Phil Blundell wrote:
> On Wed, 2013-10-09 at 23:11 +0100, Richard Purdie wrote:
> > +++ b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
> > @@ -0,0 +1,46 @@
> > +When compiling a project using -frepo, .rpo files are written alongside
> > +the .o file, the symbols either have O or C against them. During final linking,
> > +the objects can be recompiled with some of the entries tweaked/chosen by the 
> > +tlink.c code (visible with TLINK_VERBOSE=3).
> > +
> > +My tests showed that init_repo (cp/repo.c) was correcting calling 
> > +IDENTIFIER_REPO_CHOSEN against the right identifers.
> > +
> > +By the time finish_repo() or emit_repo_p() were called, the pointer returned
> > +by get_identifier() for the symbol marked during init_repo had changed and
> > +the chosen bit was no longer set. This lead to linking bugs like:
> > +
> > +collect: relinking
> > +collect2: error: '_ZNK6sudoku5ClearINS_8SequenceEEclERS1_' was assigned to 'board.rpo', but was not defined during recompilation, or vice versa
> > +
> > +The problem is that the garbage collection is getting called before
> > +finish_repo() is called and ggc_protect_identifiers is set to false 
> > +so the identifiers are not preserved. They are recreated but the 
> > +chosen bits get wiped out.
> > +
> > +The fix is to change ggc_protect_identifiers *after* the finish_repo 
> > +calls are made.
> > +
> > +Reproduction is tricky since you need to trigger the garbage collector at
> > +just the right moment.
> > +
> > +RP 2013/10/9
> > +
> > +Index: gcc-4.8.1/gcc/toplev.c
> 
> This patch header seems to lack an Upstream-Status.

Thanks, I've already fixed that in the version in the master-next
branch, along with tweaking the explanation a little more.

Cheers,

Richard


