Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2Ps2-0002fh-6U for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:58:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGk3E0011040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:46:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10094-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:45:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGjtGD011034
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:45:56 +0100
Message-ID: <1345221955.27428.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 17:45:55 +0100
In-Reply-To: <20120816064429.GA5122@mi.fu-berlin.de>
References: <1345086946-3715-1-git-send-email-raj.khem@gmail.com>
	<20120816064429.GA5122@mi.fu-berlin.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] chrpath.bbclass: Account for case when ORIGIN is in RPATH
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
X-List-Received-Date: Fri, 17 Aug 2012 16:58:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 08:44 +0200, Henning Heinold wrote:
> On Wed, Aug 15, 2012 at 08:15:46PM -0700, Khem Raj wrote:
> > This fixes a case when RPATH embedded in program have one of
> > its path already relative to ORIGIN. We were losing that path
> > if such a path existed. This patch appends it to the new edited
> > rpath being created when we see it.
> > 
> > so RPATH like below
> > 
> > (RPATH)              Library rpath:
> > [$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]
> > 
> > would end up being empty
> > 
> > but after this patch its kept intact
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/chrpath.bbclass |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> > index 10b5ca0..861d369 100644
> > --- a/meta/classes/chrpath.bbclass
> > +++ b/meta/classes/chrpath.bbclass
> > @@ -48,8 +48,9 @@ def process_dir (directory, d):
> >              rpaths = curr_rpath.split(":")
> >              new_rpaths = []
> >              for rpath in rpaths:
> > -                # If rpath is already dynamic continue
> > +                # If rpath is already dynamic copy it to new_rpath and continue
> >                  if rpath.find("$ORIGIN") != -1:
> > +                    new_rpaths.append("%s" % (rpath.strip()))
> >                      continue
> >                  # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
> >                  # base_prefix shared root
> > -- 
> > 1.7.9.5
> 
> Hi Khem,
> 
> just notice my solution some months ago
> 
> http://patches.openembedded.org/patch/24461/

I merged a version of this which simply does:

new_rpaths.append(rpath.strip())

since that is neater than using regexps.

Cheers,

Richard



