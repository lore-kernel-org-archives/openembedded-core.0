Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.5830.1632221005771184379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 03:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4CF58C0002;
	Tue, 21 Sep 2021 10:43:23 +0000 (UTC)
Date: Tue, 21 Sep 2021 12:43:23 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] sstate.bbclass: track found files on mirrors with a counter
Message-ID: <YUm3SyaxRMR/JMwZ@piout.net>
References: <20210919205112.183447-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210919205112.183447-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jose,

On 19/09/2021 21:51:11+0100, Jose Quaresma wrote:
> We don't need extra python collections to count the found files
> on the sstate cache and sstate mirrors.
> The main found collections provides all the files that were found,
> then we only need to count the files on sstate mirror
> 

I believe this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3999
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4039
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4019
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3338
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/4012
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/4004
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/4009
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4004

I removed both patches and all the builds passed


> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 29679e6a5e..fc156ac81a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
>  
>  def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
>      found = set()
> -    foundLocal = set()
> -    foundNet = set()
>      missed = set()
>  
>      def gethash(task):
> @@ -927,12 +925,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>          if os.path.exists(sstatefile):
>              bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
>              found.add(tid)
> -            foundLocal.add(tid)
>              continue
>          else:
> -            missed.add(tid)
>              bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
> +            missed.add(tid)
>  
> +    foundMirrors = 0
>      mirrors = d.getVar("SSTATE_MIRRORS")
>      if mirrors:
>          # Copy the data object and override DL_DIR and SRC_URI
> @@ -972,8 +970,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>                              connection_cache=thread_worker.connection_cache)
>                  fetcher.checkstatus()
>                  bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
> +                foundMirrors += 1
>                  found.add(tid)
> -                foundNet.add(tid)
>                  if tid in missed:
>                      missed.remove(tid)
>              except:
> @@ -1034,7 +1032,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>          match = 0
>          if total:
>              match = len(found) / total * 100
> -        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
> +        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)" %
> +            (total, len(found)-foundMirrors, foundMirrors, len(missed), currentcount, match, complete))
>  
>      if hasattr(bb.parse.siggen, "checkhashes"):
>          bb.parse.siggen.checkhashes(sq_data, missed, found, d)
> -- 
> 2.33.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
