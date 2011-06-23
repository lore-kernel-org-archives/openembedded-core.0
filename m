Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZj8H-0007c1-Qu for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:35:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NCW7dD016796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 13:32:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16300-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 13:32:03 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NCW2Z5016790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 13:32:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8a1cd7c84d12ad10df0de5a84f7d54128e6e38bf.1308827218.git.lianhao.lu@intel.com>
References: <cover.1308827218.git.lianhao.lu@intel.com>
	<8a1cd7c84d12ad10df0de5a84f7d54128e6e38bf.1308827218.git.lianhao.lu@intel.com>
Date: Thu, 23 Jun 2011 13:32:00 +0100
Message-ID: <1308832320.20015.119.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libc-package.bbclass: Replace hard coded libdir.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 12:35:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 19:33 +0800, Lianhao Lu wrote:
> Replace the hard coded libdir for locale generating to meet the multilib
> requirement.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/libc-package.bbclass |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index 55e3d48..84bac5d 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -277,10 +277,11 @@ python package_do_split_gconvs () {
>  
>  	def output_locale_binary(name, pkgname, locale, encoding):
>  		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> -		ldlibdir = "%s/lib" % treedir
> +		ldlibdir = base_path_join(treedir,libdir)

I think this should be base_libdir, not libdir.

>  		path = bb.data.getVar("PATH", d, 1)
>  		i18npath = base_path_join(treedir, datadir, "i18n")
>  		gconvpath = base_path_join(treedir, "iconvdata")
> +		outputpath = base_path_join(treedir, libdir, "locale")
>  
>  		use_cross_localedef = bb.data.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", d, 1) or "0"
>  		if use_cross_localedef == "1":
> @@ -300,8 +301,8 @@ python package_do_split_gconvs () {
>  				raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
>  
>  			localedef_opts += " --force --old-style --no-archive --prefix=%s \
> -				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/usr/lib/locale/%s" \
> -				% (treedir, treedir, datadir, locale, encoding, treedir, name)
> +				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
> +				% (treedir, treedir, datadir, locale, encoding, outputpath, name)
>  
>  			cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
>  				(path, i18npath, gconvpath, localedef_opts)

But otherwise this looks like a sensible change to me!

Cheers,

Richard



