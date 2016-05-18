Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id D9FA26072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 15:26:20 +0000 (UTC)
Received: from nbhjo (111-250-207-159.dynamic.hinet.net [111.250.207.159])
	by msfrf2625.sfr.fr (SMTP Server) with ESMTP id BC4441C000800;
	Wed, 18 May 2016 17:26:20 +0200 (CEST)
Received: from nbhjo (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2625.sfr.fr (SMTP Server) with ESMTPSA;
	Wed, 18 May 2016 17:26:19 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Martin Jansa' <martin.jansa@gmail.com>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama>
In-Reply-To: <20160518141444.GC2579@jama>
Date: Wed, 18 May 2016 17:26:16 +0200
Message-ID: <01a701d1b119$a0f58a00$e2e09e00$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQLYdDKO/rPVA7GZYCVJGv2RqZGd5wImRrj8ApN0G/ydi3uCMA==
X-sfr-mailing: LEGIT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 15:26:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi Martin,

Even though the line just below uses "+"? Or shall I modify both?

Herve

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com] 
Sent: mercredi 18 mai 2016 16:15
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [mesa][PATCH v2 1/1] Fix mesa_populate_packages()
when dri is disabled

On Wed, May 18, 2016 at 08:33:37PM +0800, Herve Jourdain wrote:
> When compiling mesa, if dri is disabled in PACKAGECONFIG, or if the list
of DRI drivers is empty, it will cause populate_package to fail, because it
can't find - rightfully - the directory for the DRI drivers.
> This patch checks that the directory indeed exists before trying to get a
list of the files in it
> 
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
b/meta/recipes-graphics/mesa/mesa.inc
> index a4e5351..0e46092 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -143,15 +143,16 @@ python mesa_populate_packages() {
>  
>      import re
>      dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
> -    dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
> -    lib_name = d.expand("${MLPREFIX}mesa-megadriver")
> -    for p in dri_pkgs:
> -        m = re.match('^(.*)_dri\.so$', p)
> -        if m:
> -            pkg_name = " ${MLPREFIX}mesa-driver-%s" %
legitimize_package_name(m.group(1))
> -            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> -            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> -            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> +    if os.path.isdir(d.getVar('PKGD', True) + dri_drivers_root):

Use os.path.join instead of +

> +        dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
> +        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
> +        for p in dri_pkgs:
> +            m = re.match('^(.*)_dri\.so$', p)
> +            if m:
> +                pkg_name = " ${MLPREFIX}mesa-driver-%s" %
legitimize_package_name(m.group(1))
> +                d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> +                d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> +                d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
>  
>      pipe_drivers_root = os.path.join(d.getVar('libdir', True),
"gallium-pipe")
>      do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$',
'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


