Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfEj0-0004XJ-Di for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:20:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68HGRXT022315;
	Fri, 8 Jul 2011 18:16:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22113-03; Fri,  8 Jul 2011 18:16:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68HGGbr022309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 18:16:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <1dce46eed7c322d8ada691bc2a61417ea6ffe928.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
	<1dce46eed7c322d8ada691bc2a61417ea6ffe928.1310047266.git.ke.yu@intel.com>
Date: Fri, 08 Jul 2011 18:15:38 +0100
Message-ID: <1310145338.20015.913.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] libc-package.bbclass: fix for non /usr/lib libdir case
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
X-List-Received-Date: Fri, 08 Jul 2011 17:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 22:10 +0800, Yu Ke wrote:
> if libdir is not /usr/lib, e.g. libdir=/usr/lib64, eglibc will
> have build failure:
> "
>  cross-localedef  --uint32-align=4 --little-endian  --force --old-style --no-archive --prefix=/home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree --inputfile=/home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree//usr/share/i18n/locales/es_NI --charmap=UTF-8 /home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree/usr/lib/locale/es_NI
> NOTE: stdout:
> NOTE:
> NOTE: stderr:
> NOTE: cannot write output files to `(null)': No such file or directory
> ERROR: Function 'localedef returned an error' failed
> "
> 
> the reason is that libc-package.bbclass has hard code "/usr/lib". This patch
> fix it by using libdir variable.
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com>
> ---
>  meta/classes/libc-package.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index 55e3d48..2ece9ae 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -300,8 +300,8 @@ python package_do_split_gconvs () {
>  				raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
>  
>  			localedef_opts += " --force --old-style --no-archive --prefix=%s \
> -				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/usr/lib/locale/%s" \
> -				% (treedir, treedir, datadir, locale, encoding, treedir, name)
> +				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s%s/locale/%s" \
> +				% (treedir, treedir, datadir, locale, encoding, treedir, libdir, name)
>  
>  			cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
>  				(path, i18npath, gconvpath, localedef_opts)

This must be against an older tree since Lianhao sent a patch for this
already?

Cheers,

Richard



