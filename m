Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6F32F70D50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F9jckh019790; Fri, 15 Aug 2014 10:45:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OPvwfp4OGfh1; Fri, 15 Aug 2014 10:45:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F9jYXm019786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 15 Aug 2014 10:45:35 +0100
Message-ID: <1408095935.21596.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 15 Aug 2014 10:45:35 +0100
In-Reply-To: <1407788504-27417-3-git-send-email-otavio@ossystems.com.br>
References: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
	<1407788504-27417-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] libpam: Allow use during build and in SDK
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
X-List-Received-Date: Fri, 15 Aug 2014 09:45:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-11 at 17:21 -0300, Otavio Salvador wrote:
> The recipe had libpam hardcoded in some places which were causing
> failures as the metadata renaming hooks does not change those,
> generating a broken dependencies list.
> 
> This patch fixes those and add the native and nativesdk support.

Well, it doesn't as far as I can tell.

Firstly, the autobuilder blew up since nativesdk-coreutils isn't
available, which in turn shows nativesdk-libcap isn't either. I pushed
patches into master-next for those, next I see:

WARNING: QA Issue: nativesdk-pam-plugin-xauth rdepends on nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency? [build-deps]

So I'd love to know what testing this had?

Cheers,

Richard

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-extended/pam/libpam_1.1.6.bb |   19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
> index 3190aaf..c06709f 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
> @@ -61,7 +61,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libd
>  FILES_${PN}-runtime = "${sysconfdir}"
>  FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
>  
> -PACKAGES_DYNAMIC += "^pam-plugin-.*"
> +PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
>  
>  def get_multilib_bit(d):
>      baselib = d.getVar('baselib', True) or ''
> @@ -69,12 +69,12 @@ def get_multilib_bit(d):
>  
>  libpam_suffix = "suffix${@get_multilib_bit(d)}"
>  
> -RPROVIDES_${PN} += "libpam-${libpam_suffix}"
> -RPROVIDES_${PN}-runtime += "libpam-runtime-${libpam_suffix}"
> +RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
> +RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
>  
> -RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
> -RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
> -RRECOMMENDS_${PN} = "libpam-runtime-${libpam_suffix}"
> +RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
> +RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
> +#RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
>  
>  python populate_packages_prepend () {
>      def pam_plugin_append_file(pn, dir, file):
> @@ -85,14 +85,15 @@ python populate_packages_prepend () {
>          d.setVar('FILES_' + pn, nf)
>  
>      def pam_plugin_hook(file, pkg, pattern, format, basename):
> +        pn = d.getVar('PN', True)
>          libpam_suffix = d.getVar('libpam_suffix', True)
>          mlprefix = d.getVar('MLPREFIX', True) or ''
>  
>          rdeps = d.getVar('RDEPENDS_' + pkg, True)
>          if rdeps:
> -            rdeps = rdeps + " " + mlprefix + "libpam-" + libpam_suffix
> +            rdeps = rdeps + " " + mlprefix + pn + "-" + libpam_suffix
>          else:
> -            rdeps = mlprefix + "libpam-" + libpam_suffix
> +            rdeps = mlprefix + pn + "-" + libpam_suffix
>          d.setVar('RDEPENDS_' + pkg, rdeps)
>  
>          provides = d.getVar('RPROVIDES_' + pkg, True)
> @@ -142,3 +143,5 @@ python do_pam_sanity () {
>          bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
>  }
>  addtask pam_sanity before do_configure
> +
> +BBCLASSEXTEND = "nativesdk native"
> -- 
> 1.7.10.4
> 



