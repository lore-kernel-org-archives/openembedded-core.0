Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnwQi-0000Zz-GG
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:37:28 +0200
Received: by gyd12 with SMTP id 12so3733718gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rpr1ARMK11GyQoWrBLmhkPUgyOdRTj6xQ05qqP+Sci0=;
	b=Ru6zF04tS5jMccj4YVipkXSEY5aypO4royEYOL2iymLQ9+PsmCln/KPTVYtyTlMiQF
	wVyfwJNyAE63TqHVfUU9NB90+DN4nIB+EBIxMaT9W6FcCKnNRrs612cOd5retZJklivy
	B2o1+5e15Et/IVttq928hLNnG+CS17KzKAJVc=
Received: by 10.68.29.200 with SMTP id m8mr8727821pbh.278.1312219986588;
	Mon, 01 Aug 2011 10:33:06 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e6sm609602pbm.87.2011.08.01.10.33.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 10:33:05 -0700 (PDT)
Date: Mon, 1 Aug 2011 10:34:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110801173429.GC7798@sakrah.homelinux.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
	<1312203836.2344.431.camel@rex>
	<BD97115A-63EB-467F-AA18-3ECAEBA017E3@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <BD97115A-63EB-467F-AA18-3ECAEBA017E3@kernel.crashing.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 13/22] sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS twice
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
X-List-Received-Date: Mon, 01 Aug 2011 17:37:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/08/11 09:11), Kumar Gala wrote:
> 
> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
> 
> > On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> ---
> >> meta/classes/sanity.bbclass |    8 +++++---
> >> 1 files changed, 5 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >> index 999e15d..dc11c9e 100644
> >> --- a/meta/classes/sanity.bbclass
> >> +++ b/meta/classes/sanity.bbclass
> >> @@ -383,12 +383,14 @@ def check_sanity(e):
> >>     dups = []
> >> 
> >>     for pa in pkgarchs.split():
> >> -    	if seen.get(pa, 0) == 1:
> >> +	if pa == tunepkg:
> >> +	    tunefound = True
> >> +            if seen.get(pa, 0) == 1:
> >> +               pkgarchs.remove(pa)
> >> +    	elif seen.get(pa, 0) == 1:
> >> 	    dups.append(pa)
> >> 	else:
> >> 	    seen[pa] = 1
> >> -	if pa == tunepkg:
> >> -	    tunefound = True
> >> 
> >>     if len(dups):
> >>        messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
> > 
> > How about we don't put duplicates in there in the first place?
> > 
> > Which board/tune files is this occurring with?
> 
> Yeah, not sure about this one, I added the sanity check to find this early.  Ran into issues with my PPC patch set and took a while to find (thus figured a sanity check made sense to check early on).

I think the issue is when TUNE_PKGARCH does not end up in the
PACKAGE_ARCHS and then package managers dont pick the ipks/rpms/debs
which are under that dir in deploy/ipk.
Usually we have been doing += to PACKAGE_EXTRA_ARCH
variable in layers but with latest tune overhaul += does not work
and we have to do _append/_prepend. I dont know if that is Kumar's
original problem 

> 
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


