Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2JRC-0000Gg-56 for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:05:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9rhAX007438;
	Fri, 17 Aug 2012 10:53:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06335-07; Fri, 17 Aug 2012 10:53:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9rUV5007432
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 10:53:34 +0100
Message-ID: <1345197209.26132.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 17 Aug 2012 10:53:29 +0100
In-Reply-To: <1566766.76zJMGCy1b@helios>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 10:05:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 18:13 +0100, Paul Eggleton wrote:
> On Wednesday 15 August 2012 17:44:33 Paul Eggleton wrote:
> > If chrpath failed here we were just silently ignoring it.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  meta/classes/chrpath.bbclass |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> > index 10b5ca0..ad61fe0 100644
> > --- a/meta/classes/chrpath.bbclass
> > +++ b/meta/classes/chrpath.bbclass
> > @@ -74,7 +74,9 @@ def process_dir (directory, d):
> >              if len(new_rpaths):
> >                  args = ":".join(new_rpaths)
> >                  #bb.note("Setting rpath for %s to %s" %(fpath, args))
> > -                sub.call([cmd, '-r', args, fpath])
> > +                ret = sub.call([cmd, '-r', args, fpath])
> > +                if ret != 0:
> > +                    bb.error("chrpath command failed with exit code %d" %
> > ret)
> > 
> >              if perms:
> >                  os.chmod(fpath, perms)
> 
> I missed that this does not actually report the output from chrpath when it 
> fails because the task log is suppressed by virtue of calling bb.error. I will 
> send a follow-up patch to address this.
> 
> Incidentally a couple of users are reporting that they are now seeing failures 
> where the rpath size is reported to be too small to contain the path we are 
> applying. I haven't seen this myself - is there some way we can increase the 
> space allowed for storing the path or is there some other issue at work here? 
> I tried to search for some information on how storage of the rpath works but 
> did not really find anything conclusive.

Unfortunately we can't increase the size available without relinking the
binary which isn't feasible at this point. The only way to increase the
size is to run the build in a "deeper" path so that there is more room
in the field. I did some calculations when we originally implemented
this and concluded you'd have to build somewhere like /tmp to have a
short enough path where this would be a problem.

I thought we'd added a sanity test for it too but it sounds like either
we didn't or if we did, it isn't functioning properly. Its good that at
least we're catching the errors now and I'd appreciate more information
about the failing cases.

Cheers,

Richard





