Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCF3b-0004UN-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:54:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 11:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125299594"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 11:45:18 -0700
Message-ID: <4F70B913.6020807@linux.intel.com>
Date: Mon, 26 Mar 2012 11:44:35 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/6] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Mon, 26 Mar 2012 18:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/23/2012 05:56 AM, Martin Jansa wrote:
> * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel.bbclass |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 169df33..975ae13 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -122,6 +122,7 @@ kernel_do_install() {
>  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>  	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>  	install -d ${D}/etc/modutils
> +	install -d ${D}/etc/modules-load.d
>  	install -d ${D}/etc/modprobe.d
>  
>  	#
> @@ -411,6 +412,11 @@ python populate_packages_prepend () {
>  			for m in autoload.split():
>  				f.write('%s\n' % m)
>  			f.close()
> +			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> +			f = open(name, 'w')
> +			for m in autoload.split():
> +				f.write('%s\n' % m)
> +			f.close()

Seems to me we should do either or, depending on if systemd is supported
in the image. Is there a way to check here?

Also, we have variables for system paths like "etc", any reason we
aren't using those here?

>  			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
>  			if not postinst:
>  				bb.fatal("pkg_postinst_%s not defined" % pkg)
> @@ -426,7 +432,7 @@ python populate_packages_prepend () {
>  			f.close()
>  
>  		files = d.getVar('FILES_%s' % pkg, True)
> -		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
> +		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename, basename)
>  		d.setVar('FILES_%s' % pkg, files)
>  
>  		if vals.has_key("description"):
> @@ -456,7 +462,7 @@ python populate_packages_prepend () {
>  	# avoid warnings. removedirs only raises an OSError if an empty
>  	# directory cannot be removed.
>  	dvar = d.getVar('PKGD', True)
> -	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
> +	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
>  		if len(os.listdir(dir)) == 0:
>  			os.rmdir(dir)
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


