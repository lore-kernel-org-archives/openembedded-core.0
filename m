Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPXpx-0003FY-M0 for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 14:39:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CXWHu011133; Tue, 9 Apr 2013 13:33:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zrQBGBk01Tvk; Tue,  9 Apr 2013 13:33:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CXQt3011105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 13:33:29 +0100
Message-ID: <1365510134.12407.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 09 Apr 2013 13:22:14 +0100
In-Reply-To: <1365501911.7011.38.camel@phil-desktop.brightsign>
References: <1365457364-3089-1-git-send-email-otavio@ossystems.com.br>
	<1365501911.7011.38.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: OpenEmbedded, Otavio Salvador <otavio@ossystems.com.br>,
	List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 09 Apr 2013 12:40:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 11:05 +0100, Phil Blundell wrote:
> On Mon, 2013-04-08 at 18:42 -0300, Otavio Salvador wrote:
> > When a MACHINEOVERRIDES has more than one value, split by ':' as usual
> > OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
> > matching as we need to iterate over each SoC family and check if it is
> > compatible or not.
> 
> [...]
> 
> >              import re
> > -            this_machine = d.getVar('MACHINE', True)
> > -            if this_machine and not re.match(need_machine, this_machine):
> > -                this_soc_family = d.getVar('SOC_FAMILY', True)
> > -                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
> > -                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
> > +            compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
> > +            for m in compat_machines:
> > +                if re.match(need_machine, m):
> 
> The checkin comment above doesn't really capture the semantic changes
> going on in this patch.  The comment implies that there was previously
> an issue with MACHINEOVERRIDES not being split when it contains multiple
> entries, but this is misleading: prior to this patch, COMPATIBLE_MACHINE
> wasn't being matched against MACHINEOVERRIDES at all.  So, the effect of
> this is that anything in MACHINEOVERRIDES (which could potentially be
> quite a large set of strings) will be considered as a candidate for
> matching COMPATIBLE_MACHINE.
> 
> It's not abundantly clear to me whether this is a good thing or not, but
> it certainly ought to be accurately described in the commit log.

Agreed. We're getting close to the release so in this case I've
rewritten the commit message since I need to get things pulled together
for the -rc build. People do need to think more about commit messages
and how to convey the right information in them...

Cheers,

Richard



