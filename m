Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNRPI-00010Q-HO
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 17:14:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 May 2011 08:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,242,1304319600"; 
   d="scan'208";a="4572336"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2011 08:11:30 -0700
Message-ID: <4DD684A2.6020904@linux.intel.com>
Date: Fri, 20 May 2011 08:11:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305722976.git.dexuan.cui@intel.com>
	<453ff1af4dd55d6542f72cc8c1d017d6a1b033b1.1305722976.git.dexuan.cui@intel.com>
In-Reply-To: <453ff1af4dd55d6542f72cc8c1d017d6a1b033b1.1305722976.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 1/1][RFC][v3] package-index.bb: add support for	rpm and deb.
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
X-List-Received-Date: Fri, 20 May 2011 15:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 06:10 AM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> [YOCTO #1024]
> Currently package-index.bb only supports ipk. This commit adds the support
> for rpm and deb, too.
>
> ------------------------------
> How to generate and use repos:
>
> 1) run "bitbake package-index" after building some target,
> e.g., core-image-sato-sdk;
>
> 2) export ${DEPLOY_DIR_RPM}, ${DEPLOY_DIR_IPK} and ${DEPLOY_DIR_DEB} by a
> webserver on the host, assuming the host IP is 192.168.7.1, at
> http://192.168.7.1/rpm
> http://192.168.7.1/ipk
> http://192.168.7.1/deb
>
> 3) inside the target, according to the packaging system (rpm, ipk or deb) used
> when we generate the target image, we can use different ways to manage
> packages:
>
> 3.1) RPM
>      run "zypper addrepo http://192.168.7.1/rpm main; zypper refresh"
>      to retrieve info about the repo; next, we can use "zypper install/remove"
>      to manage packages.
>
> 3.2) IPK
>      add the repo info into opkg config file, i.e., in
>      /etc/opkg/arch.conf, we can add something like
>      "src i586 http://192.168.7.1/ipk/i586", and next, we run "opkg update" to
>      make opkg update the list of available packages. And later, we can use
>      "opkg install/remove" to manage packages.
>
> 3.3) DEB
>      Currently in target, some important config files, like
> /var/lib/dpkg/status and /etc/apt/sources.list, for deb/apt are missing. So
> we can't install/remove package in target at present.
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   meta/classes/package_deb.bbclass        |    9 +++++++++
>   meta/classes/package_ipk.bbclass        |    9 +++++++++
>   meta/classes/package_rpm.bbclass        |    9 +++++++++
>   meta/recipes-core/meta/package-index.bb |    6 ++----
>   4 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 4faeb4a..f9ef32c 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -431,3 +431,12 @@ python do_package_write_deb () {
>   do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
>   addtask package_write_deb before do_package_write after do_package
>
> +
> +PACKAGEINDEXES += "package_index_deb;"
> +PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> +PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> +
> +package_index_deb() {
> +    package_update_index_deb
> +}
> +
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 3c2472b..97de17a 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -386,3 +386,12 @@ python do_package_write_ipk () {
>   }
>   do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
>   addtask package_write_ipk before do_package_write after do_package
> +
> +PACKAGEINDEXES += "package_index_ipk;"
> +PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> +PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> +
> +package_index_ipk() {
> +    package_update_index_ipk
> +}
> +
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 1cf9f79..390d17c 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -815,3 +815,12 @@ python do_package_write_rpm () {
>   do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
>   addtask package_write_rpm before do_package_write after do_package
>
> +PACKAGEINDEXES += "package_index_rpm;"
> +PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> +PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
> +
> +package_index_rpm() {
> +    package_update_index_rpm
> +    createrepo "${DEPLOY_DIR_RPM}"
> +}
> +
> diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
> index 3c642cb..bf3922f 100644
> --- a/meta/recipes-core/meta/package-index.bb
> +++ b/meta/recipes-core/meta/package-index.bb
> @@ -19,13 +19,11 @@ do_package_write_deb[noexec] = "1"
>   do_populate_sysroot[noexec] = "1"
>
>   do_package_index[nostamp] = "1"
> -do_package_index[dirs] = "${DEPLOY_DIR_IPK}"
> -do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
> -do_package_index[depends] += "opkg-native:do_populate_sysroot"
> +do_package_index[depends] += "${PACKAGEINDEXDEPS}"
>
>   do_package_index() {
>   	set -ex
> -	package_update_index_ipk
> +	${PACKAGEINDEXES}
>   	set +ex
>   }
>   addtask do_package_index before do_build

Updated version of this with direct PACKAGEINDEXDEP was pulled into oe-core

Thanks for working through this.

Sau!



