Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Apr 2016 20:06:56 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8090C77211
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 20:06:56 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5F00K68MEUV220@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2016 14:06:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
	a=nglfT_KzynpoNOfHmscA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 603e2952; Sun, 10 Apr 2016 19:06:31 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 57407161F7B; Sun,
	10 Apr 2016 15:06:30 -0400 (EDT)
Date: Sun, 10 Apr 2016 15:06:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Yang <liezhi.yang@windriver.com>
Message-id: <20160410190630.GI16135@denix.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
MIME-version: 1.0
In-reply-to: <86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 10 Apr 2016 20:06:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
> example:
> COMPATIBLE_MACHINE = "(qemux86)"

That will match qemux86 and qemux86-64 and is by design! It's a regular 
expression, not an exact string match! There are plenty of recipes 
(especially outside of oe-core) that depend on this behavior, so please don't 
break it!


> But it treated MACHINE = "qemux86-64" as matched. The similar to others.
> 
> This patch fixes the problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f9697a9..f376478 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -469,7 +469,7 @@ python () {
>          import re
>          compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
>          for m in compat_machines:
> -            if re.match(need_machine, m):
> +            if re.match('^' + need_machine + '$', m):
>                  break
>          else:
>              raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

