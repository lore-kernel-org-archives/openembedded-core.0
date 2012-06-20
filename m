Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1ShMa0-0000qY-HW
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:12:24 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga02.intel.com with ESMTP/TLS/RC4-MD5; 20 Jun 2012 08:00:19 -0700
Received: by dano14 with SMTP id o14so9897580dan.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=VKgfU85pnNKGwEfb/uKuHT6WW2CKyW/r99gQPXrGSvM=;
	b=fVXmDrdJNVC9GctcDoqUb+BKkOxzAn/wKGtY0O0yaeXbjOqFbowUtOr59osOsn38kO
	WL+1bhkr8wV94JpjWv+swHRcamrt9MZeNkfSLtZ2mHUPBmTfYIMoB2PKj/VZbwTNZmVn
	xO+3Cv63A52MK4TcBrI9uM/TrCkCbxyvPn43MWY8/gNGUC6bpVB45d4mpTzUXZBis1/t
	QvJZzT42K8zH486M/TLkaXeyqL8Vs7WWZgtvjlC5m1gHJJNxc3GT0e7ZaGoK0yFv26CK
	YKn6x7Tw1m6Ycr4jBIhP0LhBdIW59qMYIYHopLABD/juOOSdL4Zt9iPCo7Ubeuf6T2mH
	dowg==
Received: by 10.68.195.102 with SMTP id id6mr76952004pbc.120.1340204419035;
	Wed, 20 Jun 2012 08:00:19 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id tj4sm32191206pbc.33.2012.06.20.08.00.16
	(version=SSLv3 cipher=OTHER); Wed, 20 Jun 2012 08:00:17 -0700 (PDT)
Message-ID: <4FE1E57D.8050803@intel.com>
Date: Wed, 20 Jun 2012 08:00:13 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
	<6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
In-Reply-To: <6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkS6uivBL1nzsQqwpwHCgWYM4PTX7P2qYN03+6Gtj92cihaYql3smsJxmVEmtwh93DfI3T/
Cc: liang.li@windriver.com
Subject: Re: [PATCH 2/3] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Wed, 20 Jun 2012 15:12:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 07:31 AM, Bruce Ashfield wrote:
> From: Liang Li<liang.li@windriver.com>
>
> perf has been coupled to the kernel packages via kernel.bbclass.
> While maintaining the build of perf out of the kernel source tree
> is desired the package coupling has proved to be awkward in
> several situations such as:
>
>    - when a kernel recipe doesn't want to build/provide perf
>    - when licensing of dependencies would prohibit perf and hence
>      the kernel from being built.
>
> To solve some of these problems, this recipe is the extraction of
> the linux-tools.inc provided perf compilation into a standalone
> perf recipe that builds out of the kernel source, but is otherwise
> independent.
>
> No new functionality is provided above what the linux-tools.inc
> variant provided, but the separate recipe provides baseline for
> adding new functionality.
>
> Signed-off-by: Liang Li<liang.li@windriver.com>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel.bbclass          |    7 +----
>   meta/recipes-kernel/perf/perf_3.4.bb |   50 ++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 690de96..8d52d74 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -469,7 +469,7 @@ python populate_packages_prepend () {
>   	metapkg = "kernel-modules"
>   	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>   	d.setVar('FILES_' + metapkg, "")
> -	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
> +	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
>   	for l in module_deps.values():
>   		for i in l:
>   			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
> @@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
>
>   EXPORT_FUNCTIONS do_deploy
>
> -# perf must be enabled in individual kernel recipes
> -PACKAGES =+ "perf-dbg perf"
> -FILES_perf = "${bindir}/* \
> -              ${libexecdir}"
> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> new file mode 100644
> index 0000000..997beb4
> --- /dev/null
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "Performance analysis tools for Linux"
> +DESCRIPTION = "Performance counters for Linux are a new kernel-based \
> +subsystem that provide a framework for all things \
> +performance analysis. It covers hardware level \
> +(CPU/PMU, Performance Monitoring Unit) features \
> +and software features (software counters, tracepoints) \
> +as well."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +PR = "r0"
> +
> +BUILDPERF_libc-uclibc = "no"
> +
> +DEPENDS = "virtual/kernel \
> +           virtual/${MLPREFIX}libc \
> +           ${MLPREFIX}elfutils \
> +           ${MLPREFIX}binutils \
> +          "
> +RDEPENDS_${PN} += "elfutils perl python"
> +
Do you need to duplicated elfutils here?

And are both perl and python required on the runtime to use perf?

Can we package the perl and python bits independently?  Does it make 
sense to do that?  I have not used the kernel perf tools.

Sau!


> +PROVIDES = "virtual/perf"
> +
> +inherit kernel-arch
> +
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE = \
> +		'-C ${S}/tools/perf \
> +		O=${B} \
> +		CROSS_COMPILE=${TARGET_PREFIX} \
> +		ARCH=${ARCH} \
> +		CC="${CC}" \
> +		AR="${AR}" \
> +		prefix=/usr \
> +		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
> +		'
> +
> +do_compile() {
> +	oe_runmake all
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=${D} install
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +



