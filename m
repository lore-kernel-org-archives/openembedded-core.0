Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA55C71A19
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v05AAthn001978; Thu, 5 Jan 2017 10:10:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KIBH8B__Wq2r; Thu,  5 Jan 2017 10:10:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v05AAox8001975
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 5 Jan 2017 10:10:51 GMT
Message-ID: <1483611050.4367.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ed.bartosh@linux.intel.com
Date: Thu, 05 Jan 2017 10:10:50 +0000
In-Reply-To: <20170105094009.GA30427@linux.intel.com>
References: <1483573733-10014-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20170105094009.GA30427@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-selftest: Improve BUILDDIR environment handling
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
X-List-Received-Date: Thu, 05 Jan 2017 10:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-05 at 11:40 +0200, Ed Bartosh wrote:
> On Wed, Jan 04, 2017 at 11:48:53PM +0000, Richard Purdie wrote:
> > 
> > Its possible something (like bitbake/tinfoil2) may mess around with
> > the
> > environment and using the enviroment as a global variable store
> > isn't
> > particularly nice anyway.
> > 
> > This patch changes the BUILDDIR usages so that the environment
> > isn't used
> > as a global store and a global variable is used instead. Whilst
> > that
> > is still not perfect, it does avoid the current double and triple
> > backtraces
> > we're seeing where tinfoil2/bitbake has trampled the enviroment
> > leading
> > to failures of failures making debugging even harder.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  scripts/oe-selftest | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> > index bfcea66..e166521 100755
> > --- a/scripts/oe-selftest
> > +++ b/scripts/oe-selftest
> > @@ -111,9 +111,13 @@ def get_args_parser():
> >                          help='Submit test results to a
> > repository')
> >      return parser
> >  
> > +builddir = None
> > +
> >  
> >  def preflight_check():
> >  
> > +    global builddir
> > +
> >      log.info("Checking that everything is in order before running
> > the tests")
> >  
> >      if not os.environ.get("BUILDDIR"):
> > @@ -135,7 +139,7 @@ def preflight_check():
> >      return True
> >  
> >  def add_include():
> > -    builddir = os.environ.get("BUILDDIR")
> > +    global builddir
> You don't need to use 'global' here. It's only mandatory if
> you change variable value:
> https://docs.python.org/3/reference/simple_stmts.html#the-global-stat
> ement

In this case I did it purely for readability to make it clear how we
were expecting it to work and to match the other uses. It doesn't hurt
anything afaik.

> Would it be more readable to use name in upper case: BUILDDIR?

Not sure, that isn't something we've used as a style anywhere else so
it doesn't really match any other style. Is that a python convention?

Cheers,

Richard


