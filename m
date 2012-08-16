Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T1u0H-0006rC-KL
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 08:56:25 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T1tok-0003No-J9>; Thu, 16 Aug 2012 08:44:30 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T1tok-0004AN-Cw>; Thu, 16 Aug 2012 08:44:30 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1T1toj-0001N2-AP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 08:44:29 +0200
Date: Thu, 16 Aug 2012 08:44:29 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120816064429.GA5122@mi.fu-berlin.de>
References: <1345086946-3715-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1345086946-3715-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
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
X-List-Received-Date: Thu, 16 Aug 2012 06:56:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 15, 2012 at 08:15:46PM -0700, Khem Raj wrote:
> This fixes a case when RPATH embedded in program have one of
> its path already relative to ORIGIN. We were losing that path
> if such a path existed. This patch appends it to the new edited
> rpath being created when we see it.
> 
> so RPATH like below
> 
> (RPATH)              Library rpath:
> [$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]
> 
> would end up being empty
> 
> but after this patch its kept intact
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/chrpath.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 10b5ca0..861d369 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -48,8 +48,9 @@ def process_dir (directory, d):
>              rpaths = curr_rpath.split(":")
>              new_rpaths = []
>              for rpath in rpaths:
> -                # If rpath is already dynamic continue
> +                # If rpath is already dynamic copy it to new_rpath and continue
>                  if rpath.find("$ORIGIN") != -1:
> +                    new_rpaths.append("%s" % (rpath.strip()))
>                      continue
>                  # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
>                  # base_prefix shared root
> -- 
> 1.7.9.5

Hi Khem,

just notice my solution some months ago

http://patches.openembedded.org/patch/24461/

Bye Henning


