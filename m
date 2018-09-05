Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1108978963
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 10:56:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w85Au3U7015682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 5 Sep 2018 11:56:04 +0100
Message-ID: <4e04b73037e3a16f857c9ea49189703a462eb793.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Wed, 05 Sep 2018 11:56:03 +0100
In-Reply-To: <20180905103822.GE1795@jama>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
	<20180905103822.GE1795@jama>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 10:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 12:38 +0200, Martin Jansa wrote:
> On Wed, Sep 05, 2018 at 03:16:17PM +0800, Robert Yang wrote:
> > It can be used to simplify code like:
> > "${@['iffalse', 'iftrue'][var]}"
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  meta/lib/oe/utils.py   | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index faef771..dbadeb3 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-
> > types ${DEBUG_PREFIX_MAP}"
> >  # Disabled until the option works properly -feliminate-dwarf2-dups
> >  FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> >  DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}
> > -pipe"
> > -SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION',
> > 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
> > +SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD
> > ', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> >  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION
> > DEBUG_OPTIMIZATION"
> >  BUILD_OPTIMIZATION = "-O2 -pipe"
> >  
> > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > index f22a6ab..914a6f2 100644
> > --- a/meta/lib/oe/utils.py
> > +++ b/meta/lib/oe/utils.py
> > @@ -464,3 +464,10 @@ class ImageQAFailed(bb.build.FuncFailed):
> >              msg = msg + ' (%s)' % self.description
> >  
> >          return msg
> > +
> > +def vartrue(var, iftrue, iffalse, d):
> > +    import oe.types
> > +    if oe.types.boolean(d.getVar(var)):
> > +        return iftrue
> > +    else:
> > +        return iffalse
> 
> Shouldn't we update bitbake to track var usage like in
> oe.utils.conditional:
> http://git.openembedded.org/bitbake/commit/?id=5156b4bb6876dac636be97
> 26df22c8ee792714dd
> before this gets used more widely?

I think we need to take a step back and make sure we have the right
APIs for this before we go adding more magic to bitbake variable
tracking. There are two sides to it, the conditional expressions and
the variable typing. Something to look at in 2.7. 

I really want to add more OE namespace functions directly into the
bitbake datastore code.

Cheers,

Richard

