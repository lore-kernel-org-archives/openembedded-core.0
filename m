Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.2420.1587978898521073824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 02:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jSzqp-0006ha-FT; Mon, 27 Apr 2020 11:14:55 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jSzqn-0004N9-ER; Mon, 27 Apr 2020 11:14:53 +0200
Message-ID: <dc816a1b237aa6292d503658b6236b416cc4e02a.camel@pengutronix.de>
Subject: [OE-core][zeus] Re: [PATCH] apt-native: don't let dpkg overwrite files by default
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>
Date: Mon, 27 Apr 2020 11:14:53 +0200
In-Reply-To: <16033DCD2E7B280F.1684@lists.openembedded.org>
References: <16033DCD2E7B280F.1684@lists.openembedded.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Armin and Anuj,

this fix has landed in master as
4292387ef6c4e80428bad6a07c844a288b27d9a1 and I'd like to request it to
be cherry-picked for zeus. The cherry-pick should simply work without
conflicts.

Thanks,
Jan

On Mon, 2020-04-06 at 15:23 +0200, Jan Luebbe wrote:
> With --force-overwrite (implied by --force-all), dpkg will not abort
> when a package overwrites files from different packages. As this can
> also lead to "The following package disappeared from your system as
> all files have been overwritten by other packages: <package>" and
> subsequently broken dependencies, this makes the simple case of
> conflicting files hard to debug.
> 
> Instead of finding all possibly required force options, only disable
> overwrite for now.
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/recipes-devtools/apt/files/apt.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-
> devtools/apt/files/apt.conf
> index 03351356bc01..c95a5b07af54 100644
> --- a/meta/recipes-devtools/apt/files/apt.conf
> +++ b/meta/recipes-devtools/apt/files/apt.conf
> @@ -39,4 +39,4 @@ APT
>    };
>  };
>  
> -DPkg::Options {"--root=#ROOTFS#";"
> --admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
> +DPkg::Options {"--root=#ROOTFS#";"
> --admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-force-
> overwrite";"--no-debsig"};
> 

