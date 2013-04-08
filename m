Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPJvT-0002tw-45 for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:48:33 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38LgFVJ020890; Mon, 8 Apr 2013 22:42:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hnJ5Qvg94zz3; Mon,  8 Apr 2013 22:42:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38LgAjf020804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 22:42:13 +0100
Message-ID: <1365456662.12407.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 08 Apr 2013 22:31:02 +0100
In-Reply-To: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
References: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 21:48:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 17:58 -0300, Otavio Salvador wrote:
> When a MACHINEOVERRIDES has more than one value, split by ':' as usual
> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
> matching as we need to iterate over each SoC family and check if it is
> compatible or not.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes for v3:
> - Stop checking for SOC_FAMILY as it is just for compatibility with
>   old BSPs; we move to MACHINEOVERRIDES for this case (RP)
> 
>  meta/classes/base.bbclass | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index abd6a52..313359c 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -515,11 +515,12 @@ python () {
>          need_machine = d.getVar('COMPATIBLE_MACHINE', True)
>          if need_machine:
>              import re
> -            this_machine = d.getVar('MACHINE', True)
> -            if this_machine and not re.match(need_machine, this_machine):
> -                this_soc_family = d.getVar('SOC_FAMILY', True)
> -                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
> -                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
> +            compat_machines.extend((d.getVar('MACHINEOVERRIDES', True) or "").split(":"))

No variable "compat_machines" exists before this line so this patch
cannot possibly work. What did you test?

We're close to release and I'm getting pushed hard in places like IRC to
take patches like this which clearly don't work :(

I'm not happy.

Cheers,

Richard



