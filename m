Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QL0pJ-0001UB-V4
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 00:27:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 15:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,366,1301900400"; d="scan'208";a="747018385"
Received: from unknown (HELO [10.255.12.119]) ([10.255.12.119])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2011 15:23:50 -0700
Message-ID: <4DCDAF76.7020701@linux.intel.com>
Date: Fri, 13 May 2011 15:23:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305279161.git.dexuan.cui@intel.com>
	<abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
In-Reply-To: <abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
Subject: Re: [RFC][v2] [PATCH 1/1] package-index.bb: add support for	deb and rpm.
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
X-List-Received-Date: Fri, 13 May 2011 22:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2011 02:53 AM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> [YOCTO #1024]
> Currently package-index.bb only supports ipk. This commit addes the support
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
> /etc/apt/sources.list, for deb/apt are missing. So we can't install/remove package
> in target at present.
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   meta/classes/package_deb.bbclass        |    9 +++++++++
>   meta/classes/package_ipk.bbclass        |   12 ++++++++++++
>   meta/classes/package_rpm.bbclass        |    7 +++++++
>   meta/recipes-core/meta/package-index.bb |    8 --------
>   4 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 4faeb4a..4cc0b69 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -431,3 +431,12 @@ python do_package_write_deb () {
>   do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
>   addtask package_write_deb before do_package_write after do_package
>
> +
> +do_package_index[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
> +do_package_index[recrdeptask] += "package_update_index_deb"
> +
> +do_package_index() {
> +   set -ex
> +   package_update_index_deb
> +   set +ex
> +}

Why do you continue to include the do_package_index here, it's no longer 
needed with the setting of do_package_index[recrdeptask], this is true 
below also.

> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 3c2472b..2a2d9c3 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -386,3 +386,15 @@ python do_package_write_ipk () {
>   }
>   do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
>   addtask package_write_ipk before do_package_write after do_package
> +
> +
> +do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
> +do_package_index[depends] += "opkg-native:do_populate_sysroot"
> +do_package_index[recrdeptask] += "package_update_index_ipk"
> +
> +do_package_index() {
> +   set -ex
> +   package_update_index_ipk
> +   set +ex
> +}

The do_package_index() function is not needed any longer here

> +
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 70170d1..d9470d6 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -814,3 +814,10 @@ python do_package_write_rpm () {
>   do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
>   addtask package_write_rpm before do_package_write after do_package
>
> +do_package_index[depends] += "createrepo-native:do_populate_sysroot"
> +do_package_index() {
> +    set -ex
> +    package_update_index_rpm
> +    createrepo "${DEPLOY_DIR_RPM}"
> +    set +ex
> +}

Nor this do_package_index() function, why no 
do_package_index[recrdeptask] setting in RPM?  If you need a special 
function here them call it do_package_index_rpm() and set the 
do_package_index[recrdeptask] to that function.



> diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
> index 3c642cb..3f1caea 100644
> --- a/meta/recipes-core/meta/package-index.bb
> +++ b/meta/recipes-core/meta/package-index.bb
> @@ -19,14 +19,6 @@ do_package_write_deb[noexec] = "1"
>   do_populate_sysroot[noexec] = "1"
>
>   do_package_index[nostamp] = "1"
> -do_package_index[dirs] = "${DEPLOY_DIR_IPK}"
Does the dirs need to be saved or moved to the packagers?

> -do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
> -do_package_index[depends] += "opkg-native:do_populate_sysroot"
>
> -do_package_index() {
> -	set -ex
> -	package_update_index_ipk
> -	set +ex
> -}
>   addtask do_package_index before do_build
>   EXCLUDE_FROM_WORLD = "1"



