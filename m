Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U0hsl-00075O-Hm
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 01:20:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Jan 2013 16:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,572,1355126400"; d="scan'208";a="250510752"
Received: from unknown (HELO envy.home) ([10.255.12.120])
	by azsmga001.ch.intel.com with ESMTP; 30 Jan 2013 16:03:10 -0800
Message-ID: <5109B4BD.3000307@linux.intel.com>
Date: Wed, 30 Jan 2013 16:03:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1359587149-27928-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1359587149-27928-1-git-send-email-sgw@linux.intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module.bbclass: Allow for modules to be packaged seperate from ${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 00:20:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/30/2013 03:05 PM, Saul Wold wrote:
> This patch will allow recipes that provide kernel modules to package
> the module or modules in specific packages. That list is contained in
> MODULE_PACKAGES, this defaults to  to preserve the current behavior.

s/to to preserve/to preserving/

> The package can also define MODULE_FILES to specify files.

So, for example, the hello-mod recipe in meta-skeleton can remain unchanged?
It will then get /lib/modules/*/hello.ko in FILES_hello-mod and
MODULE_PACKAGES will be set to hello-mod. If I wanted to, hello-mod
could create to modules, and package them separately by specifying two
values in MODULE_PACKAGES and creating the appropriate
MODULE_FILES_foo|bar entries?

Right, seems to make sense to me. What testing has this seen? Have you
verified it with hello-mod?

--
Darren

> 
> [YOCTO #3803]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/module.bbclass | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index c933d32..e2174a1 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,4 +1,3 @@
> -RDEPENDS_${PN} += "kernel-image"
>  DEPENDS += "virtual/kernel"
>  
>  inherit module-base
> @@ -25,7 +24,7 @@ module_do_install() {
>  	           modules_install
>  }
>  
> -pkg_postinst_${PN}_append () {
> +module_pkg_postinst () {
>  if [ -z "$D" ]; then
>  	depmod -a ${KERNEL_VERSION}
>  else
> @@ -33,7 +32,7 @@ else
>  fi
>  }
>  
> -pkg_postrm_${PN}_append () {
> +module_pkg_postrm () {
>  if [ -z "$D" ]; then
>  	depmod -a ${KERNEL_VERSION}
>  else
> @@ -43,4 +42,16 @@ fi
>  
>  EXPORT_FUNCTIONS do_compile do_install
>  
> -FILES_${PN} = "/etc /lib/modules"
> +MODULE_PACKAGES ?= "${PN}"
> +
> +python __anonymous() {
> +    for package in d.getVar("MODULE_PACKAGES", True).split():
> +        d.appendVar("RDEPENDS_%s" % package, " kernel-image")
> +        files = d.getVar("MODULE_FILES_%s" % package, True) or "/etc /lib/modules"
> +        d.appendVar("FILES_%s" % package, " " + files)
> +        d.appendVar('pkg_postinst_%s' %  package, " " + d.getVar('module_pkg_postinst', True))
> +        d.appendVar('pkg_postrm_%s' %  package, " " + d.getVar('module_pkg_postrm', True))
> +        if not package in d.getVar("PACKAGES", True):
> +            d.prependVar("PACKAGES", package + " ")
> +}
> +         	
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


