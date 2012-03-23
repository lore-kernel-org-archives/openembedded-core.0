Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SBDbY-0007zj-VR
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:09:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 90E99315A482;
	Sat, 24 Mar 2012 00:00:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OTE1Vcjw7HAw; Sat, 24 Mar 2012 00:00:06 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec3b4.pool.mediaWays.net
	[89.14.195.180])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 12B08315A478;
	Sat, 24 Mar 2012 00:00:06 +0100 (CET)
Message-ID: <4F6D0074.8020708@opendreambox.org>
Date: Sat, 24 Mar 2012 00:00:04 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Mar 2012 23:09:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23.03.2012 13:56, Martin Jansa wrote:
> * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit

Martin,

the man-page[1] for modules-load.d says that packages should install
.conf files to /usr/lib/modules-load.d, because /etc/modules-load.d is
reserved for the system administrator. Did you take this into account
when you decided to support /etc/modules-load.d?

Regards,
Andreas

[1] http://0pointer.de/public/systemd-man/modules-load.d.html

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



