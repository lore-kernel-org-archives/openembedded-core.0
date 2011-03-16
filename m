Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pztuy-0006vB-Ie for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:49:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GGm9I1005803;
	Wed, 16 Mar 2011 16:48:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05543-04; Wed, 16 Mar 2011 16:48:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GGm46g005797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 16 Mar 2011 16:48:04 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <4D80E48C.4010902@windriver.com>
References: <cover.1300291424.git.mark.hatle@windriver.com>
	<2e2980aae580fa0a143e9450596b64c390bbc236.1300291424.git.mark.hatle@windriver.com>
	<1300292546.30423.1891.camel@rex>  <4D80E48C.4010902@windriver.com>
Date: Wed, 16 Mar 2011 16:47:53 +0000
Message-ID: <1300294073.30423.1893.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@lists.pokylinux.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/6] package.bbclass: Fix missing debug src files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 16:49:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 11:25 -0500, Mark Hatle wrote:
> On 3/16/11 11:22 AM, Richard Purdie wrote:
> > On Wed, 2011-03-16 at 11:15 -0500, Mark Hatle wrote:
> >> The previous change used egrep instead of fgrep.  We need to use fgrep because
> >> there are expression like syntaxes in some file names, we need exact matches.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>  meta/classes/package.bbclass |    3 ++-
> >>  1 files changed, 2 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> >> index a7a5894..ac30cbe 100644
> >> --- a/meta/classes/package.bbclass
> >> +++ b/meta/classes/package.bbclass
> >> @@ -233,9 +233,10 @@ def splitfile2(debugsrcdir, d):
> >>         processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
> >>         # We need to ignore files that are not actually ours
> >>         # we do this by only paying attention to items from this package
> >> -       processdebugsrc += "egrep -z '%s' | "
> >> +       processdebugsrc += "fgrep -z '%s' | "
> >>         processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
> >>  
> >> +       bb.note(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
> >>         os.system(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
> >>  
> >>         # The copy by cpio may have resulted in some empty directories!  Remove these
> > 
> > Did you mean to leave the bb.note() in?
> 
> No, that was supposed to be removed.  Should I yank it and re-push the commit?

Since I'd looked through the rest and they were ok, I just tweaked this
one.

Cheers,

Richard




