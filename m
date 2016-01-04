Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC422731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 22:59:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u04Mx6a5014059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jan 2016 14:59:06 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 14:59:06 -0800
To: <openembedded-core@lists.openembedded.org>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <568AF939.7070700@windriver.com>
Date: Mon, 4 Jan 2016 16:59:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
Subject: Re: [PATCH v2 3/3] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 22:59:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/2/16 5:53 PM, Matthias Schiffer wrote:
> The typical symlinks are:
> 
> * /bin -> usr/bin
> * /sbin -> usr/sbin
> * /lib -> usr/lib
> * /usr/sbin -> bin
> 
> It is checked that only sane symlinks are created, so a half-merged /usr
> (e.g, merging bin and sbin, but not lib) is feasible as well.
> 
> The following options in a distro configuration create a full Fedora-style
> merged /usr:
> 
>   DISTRO_FEATURES_DEFAULT += "merged-usr"
>   base_bindir = "${exec_prefix}/bin"
>   base_sbindir = "${exec_prefix}/bin"
>   sbindir = "${exec_prefix}/bin"
>   base_libdir = "${exec_prefix}/${baselib}"
>   nonarch_base_libdir = "${exec_prefix}/lib"
> 
> [YOCTO #7040]
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
> v2:
> * add the merged-usr symlinks in a separate task, so do_install can be
>   overridden independently of the merged-usr feature.
> * add PACKAGECONFIG for merged-usr, so the package is rebuilt when the
>   distro feature is changed.
> 
> 
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 2af7ecd..21a740f 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -30,6 +30,13 @@ S = "${WORKDIR}"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> +PACKAGECONFIG ??= " \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'merged-usr','merged-usr', '', d)} \
> +"
> +
> +PACKAGECONFIG[merged-usr] = ",,"
> +
> +
>  docdir_append = "/${P}"
>  dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>  dirs2775 = ""
> @@ -136,6 +143,35 @@ do_install () {
>  	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>  }
>  
> +do_install_merged_usr () {
> +	if ${@bb.utils.contains('PACKAGECONFIG','merged-usr','false','true',d)}; then
> +		return
> +	fi
> +
> +	if [ "${base_bindir}" != "/bin" ]; then
> +		ln -snf "${@d.getVar('base_bindir', True)[1:]}" ${D}/bin
> +	fi
> +
> +	if [ "${base_sbindir}" != "/sbin"  ]; then
> +		ln -snf "${@d.getVar('base_sbindir', True)[1:]}" ${D}/sbin
> +	fi
> +
> +	if [ "${nonarch_base_libdir}" != "/lib" ]; then
> +		ln -snf "${@d.getVar('nonarch_base_libdir', True)[1:]}" ${D}/lib
> +	fi
> +
> +	if [ "${base_libdir}" != "/${baselib}" ]; then
> +		ln -snf "${@d.getVar('base_libdir', True)[1:]}" ${D}/${baselib}
> +	fi
> +
> +	if [ "${bindir}" = "${exec_prefix}/bin" -a "${sbindir}" = "${exec_prefix}/bin" ]; then
> +		ln -snf bin ${D}${exec_prefix}/sbin
> +	fi
> +}

The stuff above really seems to me that it should be done by the fs-perms setup.
 Is the real problem here that people don't understand the fs-perms and how to
configure it for these alternative filesystem configurations?

(or if the code in the packaging isn't working, we should fix it.)

--Mark

> +
> +addtask install_merged_usr after do_install before do_package do_populate_sysroot
> +
> +
>  DISTRO_VERSION[vardepsexclude] += "DATE"
>  do_install_basefilesissue () {
>  	if [ "${hostname}" ]; then
> 


