Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EC9AA7E720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:29:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Tw2h5Trqz1n;
	Thu, 20 Jun 2019 10:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561019341;
	bh=pX5ix9/XG+W1Iw3Br0h+RBYBvXepwykshcDF0T39kyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLyj5NEPByFL3/RnU3en0TQ6lAUUcnoA7mQQKjxUn8VyU3nxnjxNlzj9KSfA3RQJ1
	g4LmImugTqMfgVS2YApFZaPb6igCBKrxqzSr6yqQpy7CBAxRHtutt7hQl9twnvBqvw
	OZUqS4p7ZBCpk1BAZNrtdRbE7XNWUX4D+F/3JvN+Wos1J1KytbnXY++ROyso21ijzr
	bdA6bbFVnBvKb94djPsLKv/+xg2p/9heXQGK9ZwUwx1nlxzt7fz39we2MG7MjVaPXO
	j61Br51YRzW31177aHbtRwXRJHoXuQGtKZxhw+GJz2lc8QebIEXPKgMmcecYPks0LC
	nQBctl2MgB5iY+TJD/DHf1dxFUNy5fkiL1lnGs1i+xRY1ahYRNJClRRKi0GzemPhqh
	+2mU7Aga86iE8nxb2lYEQc8guWuafj9HVKMs2Jx4VI50lisVD3uQabi10kdkueKl3W
	t7rv+IuE0OzFm/HTPJQTzOIGV0VFg6HagzPKVBbNC/lJ3mjxpwxvkT/rWJ4BLhLmNa
	jZMh6uZN23ODIUtFWy+yqhsV9huzWoo18oxQsBcttbG/M9LY4bWHHCloW2VXWmArq0
	/GRyXhR3570a6boLKgrI6ptYKB+dB3Li6K3XoSRkLPXDGi8dEJz0kIJIkvrqTdxe7P
	a+bs9QnlqxGdqoiMvg1d5PL0=
Date: Thu, 20 Jun 2019 11:28:58 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20190620082858.GC27107@localhost>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 08:29:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 20, 2019 at 04:15:26PM +0800, Robert Yang wrote:
> The gtk-update-icon-cache and gdk-pixbuf-query-loaders are provided by gtk+3.

gdk-pixbuf-query-loaders is provided by gdk-pixbuf,
which is not tied to a specific GTK version.

gtk-update-icon-cache is provided by both GTK 2 and GTK 3,
I haven't checked whether it will also be in GTK 4.

>...
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -4,6 +4,11 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
>  
>  PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>  
> +inherit distro_features_check
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +
> +DEPENDS += "gtk+3"
>...

This looks OK.

> @@ -45,10 +50,11 @@ python populate_packages_append () {
>          if not os.path.exists(icon_dir):
>              continue
>  
> -        bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
> -        rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
> -        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
> -    
> +        for dep in ('hicolor-icon-theme', 'gtk+3'):
> +            bb.note("Adding %s dependency to %s" % (dep, pkg))
> +            rdepends = ' ' + d.getVar('MLPREFIX', False) + dep
> +            d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>...

Why is this necessary?

I would expect there to always be a generated RDEPENDS on either
gtk+ or gtk+3 (or soon gtk4) that already covers this.
Anything I miss here?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


