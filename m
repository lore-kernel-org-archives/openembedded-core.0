Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0507873119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A91F20BD4;
	Wed, 21 Jun 2017 05:23:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0bsB_9gSL-zo; Wed, 21 Jun 2017 05:23:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D8F6207A3;
	Wed, 21 Jun 2017 05:22:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AE2AB16250F; Wed, 21 Jun 2017 01:22:58 -0400 (EDT)
Date: Wed, 21 Jun 2017 01:22:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Brad Mouring <brad.mouring@ni.com>
Message-ID: <20170621052258.GP28053@denix.org>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
	<89778545-bbd2-56d0-a636-b0c182079b05@denx.de>
	<20170621023324.GA20875@zardoz.amer.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20170621023324.GA20875@zardoz.amer.corp.natinst.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 05:23:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 20, 2017 at 09:33:24PM -0500, Brad Mouring wrote:
> On Tue, Jun 20, 2017 at 10:59:55PM +0200, Marek Vasut wrote:
> > On 06/20/2017 10:53 PM, Brad Mouring wrote:
> > > On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
> > >> On 06/20/2017 10:40 PM, Brad Mouring wrote:
> > >>> As implemented currently, the fw-utils recipe does not allow for
> > >>> ...
> > >>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
> > >>> +# By default, use the default included in the U-Boot source
> > >>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
> > >>> +
> > >>>  inherit uboot-config
> > >>>  
> > >>>  do_compile () {
> > >>> @@ -19,7 +24,7 @@ do_install () {
> > >>>  	install -d ${D}${sysconfdir}
> > >>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> > >>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> > >>> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> > >>> +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
> > >>
> > >> Do we really need yet another variable ? Wouldn't it make more sense to
> > >> add do_install_append_yourmachine() {} in your meta-whatever to
> > >> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
> > > 
> > > This is (kinda) what we were doing, there was some discussion as to
> > > whether or not this made sense upstream.
> > 
> > Link?
> 
> I know it's not a great answer, but we've not pushed the version of the
> branch where these changes are going in. Eventually, they'll end up in
> this repo:
> 
> https://github.com/ni/meta-nilrt
> 
> > > I was unsure of the
> > > acceptability of a do_install_append.*() clobbering a file of the
> > > original do_install().
> > 
> > That's probably what really needs to be discussed.
> > 
> > We can probably add some task which by default installs the
> > fw_env.config example and can be overridden in meta-whatever . Maybe the
> > others can jump into here and explain how to handle overriding the
> > default config file best.
> 
> That sounds like a solution that would certainly work for this
> use-case, if no one pipes up with objections or a currently-unseen
> silver bullet solution, I'll try to whip something together tomorrow
> and post. Thanks for the idea.
> 
> Denys, I know you keep pushing the "shove it in a do_install_append()",
> but to me and my under-informed sensibilities, this seems weird and
> unclean to clobber a file in a _append(), would it cause some QA failure?

Hmm, I mentioned it only once... To a patch that does already mention 
appending stuff...

-- 
Denys

