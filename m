Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <public@plane.gmane.org>) id 1QbZ73-0007ac-UT
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:18:01 +0200
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <public@plane.gmane.org>) id 1QbYec-0005I2-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 15:48:38 +0200
Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by plane.gmane.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>)
	id 1QbYeY-0005DF-2r; Tue, 28 Jun 2011 15:48:34 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:45297)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1QbYeU-0000lo-FR (Exim 4.72)
	(return-path <jic23@cam.ac.uk>); Tue, 28 Jun 2011 14:48:30 +0100
Message-ID: <4E09DD94.60004@cam.ac.uk>
Date: Tue, 28 Jun 2011 14:56:36 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110509 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org>
References: <cover.1309203545.git.anders@chargestorm.se>
	<19f9cd53099a185415ba765f70f8d9982ce0675a.1309203545.git.anders@chargestorm.se>
In-Reply-To: <19f9cd53099a185415ba765f70f8d9982ce0675a.1309203545.git.anders@chargestorm.se>
X-Mailman-Approved-At: Tue, 28 Jun 2011 16:28:43 +0200
Cc: Anders Darander <public-anders-7UjN0b3lYz2SbKU13Z4Etw@plane.gmane.org>
Subject: Re: [RFC v2 PATCH 1/9] Remove support for building 2.4 kernels
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
X-List-Received-Date: Tue, 28 Jun 2011 14:18:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



Hi Anders,

All seems to work for me.  For anyone just dropping these on OE, note there is
a local variable of kernel.bbclass that also needs updating as per this file
in meta-openembedded/meta-oe/

> Signed-off-by: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
> ---
>  meta/classes/kernel.bbclass      |   12 ++----------
>  meta/classes/module-base.bbclass |    2 +-
>  2 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index fd27832..6bdfd3e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -73,9 +73,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
>  kernel_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> -	if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
> -		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> -	fi
>  	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  }
>  
> @@ -111,9 +108,7 @@ kernel_do_install() {
>  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>  	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>  	install -d ${D}/etc/modutils
> -	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
> -		install -d ${D}/etc/modprobe.d
> -	fi
> +	install -d ${D}/etc/modprobe.d
>  
>  	#
>  	# Support for external module building - create a minimal copy of the
> @@ -397,10 +392,7 @@ python populate_packages_prepend () {
>  		# Write out any modconf fragment
>  		modconf = bb.data.getVar('module_conf_%s' % basename, d, 1)
>  		if modconf:
> -			if bb.data.getVar("KERNEL_MAJOR_VERSION", d, 1) == "2.6":
> -				name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
> -			else:
> -				name = '%s/etc/modutils/%s.conf' % (dvar, basename)
> +			name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>  			f = open(name, 'w')
>  			f.write("%s\n" % modconf)
>  			f.close()
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index c98bace..a7cf233 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -7,7 +7,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>  
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>  export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
> -KERNEL_OBJECT_SUFFIX = "${@[".o", ".ko"][base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion') > "2.6.0"]}"
> +KERNEL_OBJECT_SUFFIX = ".ko"
>  KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
>  KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
>  KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"




