Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 360B578353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 18:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1681920ABA;
	Fri, 21 Jul 2017 18:34:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lImztbvKkyNH; Fri, 21 Jul 2017 18:34:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3A2D208AE;
	Fri, 21 Jul 2017 18:34:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 70C1616253D; Fri, 21 Jul 2017 14:34:09 -0400 (EDT)
Date: Fri, 21 Jul 2017 14:34:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170721183409.GS26405@denix.org>
References: <20170721124740.11866-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170721124740.11866-1-twoerner@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/machine-overrides-extended.bbclass: add
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
X-List-Received-Date: Fri, 21 Jul 2017 18:34:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I haven't seen any conclusions on the Architecture list here:

http://lists.openembedded.org/pipermail/openembedded-architecture/2017-July/000662.html


On Fri, Jul 21, 2017 at 08:47:40AM -0400, Trevor Woerner wrote:
> Copy this class from meta-freescale so all BSPs can use it.
> 
> This class makes it easy for a BSP to specify multiple sets of configurations
> for a given MACHINE. In some cases there are multiple choices for the user.
> For example: for the kernel, the user could choose either the vendor kernel or
> the upstream kernel. However, sometimes these decisions are "locked" together:
> i.e. if you want to use the vendor's binary blob for (say) graphics, then
> you have to use their vendor kernel as well. It's not possible for a user to
> choose, say, the graphics binary blob but want to use the upstream kernel too.
> Therefore the BSP ends up with "sets" of configurations which need to be taken
> collectively instead of piecemeal.
> 
> In the example of meta-freescale, if the user does nothing special,
> they get the vendor options. If they add the following line to their
> configuration, they get the upstream pieces:
> 
> 	MACHINEOVERRIDES .= ":use-mainline-bsp"
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/machine-overrides-extender.bbclass | 48 +++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta/classes/machine-overrides-extender.bbclass
> 
> diff --git a/meta/classes/machine-overrides-extender.bbclass b/meta/classes/machine-overrides-extender.bbclass
> new file mode 100644
> index 0000000000..f333a0fcb7
> --- /dev/null
> +++ b/meta/classes/machine-overrides-extender.bbclass
> @@ -0,0 +1,48 @@
> +# -*- python -*-
> +# Automatically set extend the MACHINEOVERRIDES
> +#
> +# This allow to grouping of different settings for similar platforms.
> +#
> +# To indicate that a SoC contains following set of overrides, you can use:
> +#
> +# MACHINEOVERRIDES_EXTENDER_soc = "group1:group2"
> +#
> +# However to indicate that an override replaces a set of other
> +# overrides, you can use:
> +#
> +# MACHINEOVERRIDES_EXTENDER_FILTER_OUT_override = "group1 group2"
> +#
> +# Copyright 2016-2017 (C) O.S. Systems Software LTDA.
> +
> +def machine_overrides_extender(d):
> +    machine_overrides = (d.getVar('MACHINEOVERRIDES', True) or '').split(':')
> +
> +    # Gather the list of overrides to filter out
> +    machine_overrides_filter_out = []
> +    for override in machine_overrides:
> +        machine_overrides_filter_out += (d.getVar('MACHINEOVERRIDES_EXTENDER_FILTER_OUT_%s' % override, True) or '').split()
> +
> +    # Drop any overrides of filter_out prior extending
> +    machine_overrides = [o for o in machine_overrides if o not in machine_overrides_filter_out]
> +
> +    for override in machine_overrides:
> +        extender = d.getVar('MACHINEOVERRIDES_EXTENDER_%s' % override, True)
> +
> +        if extender:
> +            extender = extender.split(':')
> +
> +            # Drop any extension if in filter_out
> +            extender = [e for e in extender if e not in machine_overrides_filter_out]
> +
> +            extender.reverse()
> +            if not set(extender).issubset(set(machine_overrides)):
> +                index = machine_overrides.index(override)
> +                for e in extender:
> +                    machine_overrides.insert(index, e)
> +    d.setVar('MACHINEOVERRIDES', ':'.join(machine_overrides))
> +
> +python machine_overrides_extender_handler() {
> +    machine_overrides_extender(e.data)
> +}
> +machine_overrides_extender_handler[eventmask] = "bb.event.ConfigParsed"
> +addhandler machine_overrides_extender_handler
> -- 
> 2.13.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

