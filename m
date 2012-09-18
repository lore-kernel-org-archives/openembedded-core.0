Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TE38S-0000N4-S4
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 21:07:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2012 11:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,444,1344236400"; d="scan'208";a="207243364"
Received: from unknown (HELO [10.252.121.247]) ([10.252.121.247])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2012 11:54:22 -0700
Message-ID: <5058C35D.8070407@intel.com>
Date: Tue, 18 Sep 2012 21:54:21 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Zhang, Jessica" <jessica.zhang@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
	<8ac4de1571d9862bb5cbf558b72b9cecc4751fc4.1347959838.git.laurentiu.palcu@intel.com>
	<C6510F6D410BB64A8C15398EDC6B847C46AF3562@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C46AF3562@ORSMSX101.amr.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] adt-installer: fix package installation issue
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
X-List-Received-Date: Tue, 18 Sep 2012 19:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 09/18/2012 08:34 PM, Zhang, Jessica wrote:
> Hi Laurentiu,
> 
> Why this is only an issue for installation to a directory other than the default e.g. /opt/poky ?
Because of the internal opkg logic. Opkg keeps an internal database of
all packages installed and the files that each package provides. By
default all packages were built to install to /opt/poky/1.2+snapshot (I
took this path as an example). When we provide an offline root directory
(with -o option), let's assume it's /opt/poky/1.2+snapshot, all packages
will be installed to /opt/poky/1.2+snapshot/opt/poky/1.2+snapshot.
However, opkg will detect that the offline root matches the beginning of
the files paths and will record the files without the first part: that
is /opt/poky/1.2+snapshot/file instead of
/opt/poky/1.2+snapshot/opt/poky/1.2+snapshot/file.

When another package is installed, opkg will look into its database and
will try to see if the file to be installed in
/opt/poky/1.2+snapshot/opt/poky/1.2+snapshot will overwrite any files in
/opt/poky/1.2+snapshot. The answer is, of course, NO (since the paths
are different) and the installation will go on.

On the other hand, if we choose another offline directory(different from
the default one), let's say /my/test, the files in it's internal
database will contain the entire paths: that is
/my/test/opt/poky/1.2+snapshot.

When another package is installed to the same /my/test directory, opkg
will now look into its database and see if the files to be installed in
/my/test/opt/poky/1.2+snapshot overwrites any files in the same path.
Since paths are now the same, installing two packages providing the same
files will, of course, be detected and installation stopped.

I hope this answers your question,
Laurentiu

> 
> Thanks,
> Jessica
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Laurentiu Palcu
> Sent: Tuesday, September 18, 2012 2:22 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/4] adt-installer: fix package installation issue
> 
> When the cross canadian toolchains are installed, for different architectures, they might contain common files. This leads to installation failures since the opkg, by default, does not overwrite files. This issue happens, for example, for binutils packages (that contain the same locale files) or gdb (which installs some syscalls xml files). The locale files could be removed from the binutils cross-canadian package but we cannot do the same for the syscalls GDB files which are used by GDB to display user friendly names for the syscall numbers. Hence, the best solution is to force opkg to overwrite these files.
> 
> [YOCTO #3109]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  .../adt-installer/scripts/adt_installer_internal   |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
> index 78ea6d0..f113aa4 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installe
> +++ r_internal
> @@ -112,7 +112,7 @@ check_result
> 
>  #install below must sdk-host packages
>  OPKG_INSTALL_CMD="$OPKG_CMD "
> -OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
> +OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  --force-overwrite -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
> 
>  BASE_HOSTSDK_PKGNAMES="pseudo opkg pkgconfig libtool autoconf automake"
>  for pkg in $BASE_HOSTSDK_PKGNAMES; do
> --
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


