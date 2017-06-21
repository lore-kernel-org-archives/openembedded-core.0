Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B91E57199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 15:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 65CC020ABA;
	Wed, 21 Jun 2017 15:50:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KIKPPmpltVs6; Wed, 21 Jun 2017 15:50:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 280DE204E0;
	Wed, 21 Jun 2017 15:50:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AE86316250E; Wed, 21 Jun 2017 11:50:23 -0400 (EDT)
Date: Wed, 21 Jun 2017 11:50:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170621155023.GQ28053@denix.org>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
	<20170621120317.GG27196@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170621120317.GG27196@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, brad.mouring@ni.com,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 15:50:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2017 at 08:03:17AM -0400, Tom Rini wrote:
> On Tue, Jun 20, 2017 at 07:55:44PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 20, 2017 at 07:15:12PM -0300, Otavio Salvador wrote:
> > > If a fw_env.config file is found in workdir, this is preferred over
> > > the U-Boot example.
> > > 
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > > 
> > >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > index c2e8f0fb84..0682f9274b 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > @@ -19,7 +19,14 @@ do_install () {
> > >  	install -d ${D}${sysconfdir}
> > >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> > >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> > > -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> > > +
> > > +	# If a specific file is added in a .bbappend, this is used instead
> > > +	# of the generic one
> > > +	if [ -e ${WORKDIR}/fw_env.config ]; then
> > > +		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
> > 
> > I don't get it - if it's expected that a .bbappend will be adding a more 
> > specific version of fw_env.config, why that .bbappend can't simply install 
> > it with do_install_append()?
> 
> Well, this is a lot more user friendly, and it's quite likely that if a
> platform intends to ship u-boot-fw-utils they intend to provide a
> functional one as well.  It would be a best-practices to provide one
> that works for a machine.conf that supports U-Boot, even (and has env
> stored somewhere, I mean it even supports env as a file).

Why don't we go all the way there? If we say machine.conf is meant to define a 
machine-specific env config, let's do it generically.

What I'm arguing against here is some partial solution - modifying the global 
recipe in oe-core, but still require .bbappend to provide a file. It's should 
either be "do everything in .bbappend, like we all do now" or "do everything 
in main oe-core recipe and let machine.conf define it".

-- 
Denys


