Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UPVh8-0000VE-3c for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:22:32 +0200
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UPVQO-0000Ib-B5; Tue, 09 Apr 2013 12:05:12 +0200
Message-ID: <1365501911.7011.38.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 09 Apr 2013 11:05:11 +0100
In-Reply-To: <1365457364-3089-1-git-send-email-otavio@ossystems.com.br>
References: <1365457364-3089-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 09 Apr 2013 10:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 18:42 -0300, Otavio Salvador wrote:
> When a MACHINEOVERRIDES has more than one value, split by ':' as usual
> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
> matching as we need to iterate over each SoC family and check if it is
> compatible or not.

[...]

>              import re
> -            this_machine = d.getVar('MACHINE', True)
> -            if this_machine and not re.match(need_machine, this_machine):
> -                this_soc_family = d.getVar('SOC_FAMILY', True)
> -                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
> -                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
> +            compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
> +            for m in compat_machines:
> +                if re.match(need_machine, m):

The checkin comment above doesn't really capture the semantic changes
going on in this patch.  The comment implies that there was previously
an issue with MACHINEOVERRIDES not being split when it contains multiple
entries, but this is misleading: prior to this patch, COMPATIBLE_MACHINE
wasn't being matched against MACHINEOVERRIDES at all.  So, the effect of
this is that anything in MACHINEOVERRIDES (which could potentially be
quite a large set of strings) will be considered as a candidate for
matching COMPATIBLE_MACHINE.

It's not abundantly clear to me whether this is a good thing or not, but
it certainly ought to be accurately described in the commit log.

p.




