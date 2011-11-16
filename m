Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQpE3-0006ce-Iz for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 00:49:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGNgeYV009534
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 23:42:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09233-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 23:42:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGNgVTa009528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 23:42:32 GMT
Message-ID: <1321486956.18905.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 23:42:36 +0000
In-Reply-To: <CABcZAN=EfT=jtKRBgfuvMWyipDRxWiac+kSxm8qoBZxjjcej=g@mail.gmail.com>
References: <CABcZAN=EfT=jtKRBgfuvMWyipDRxWiac+kSxm8qoBZxjjcej=g@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] Add some (mostly packaging) vardeps
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
X-List-Received-Date: Wed, 16 Nov 2011 23:49:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 14:17 -0700, Chris Larson wrote:
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/package.bbclass       |   17 ++++++++++++++++-
>  meta/classes/package_deb.bbclass   |    1 +
>  meta/classes/package_ipk.bbclass   |    1 +
>  meta/classes/package_rpm.bbclass   |    1 +
>  meta/classes/sstate.bbclass        |    2 ++
>  meta/classes/utility-tasks.bbclass |    1 +
>  6 files changed, 22 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d01275f..11de0e3 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1102,6 +1102,7 @@ python emit_pkgdata() {
> 
>  	bb.utils.unlockfile(lf)
>  }
> +emit_pkgdata[vardeps] += "${@gen_package_filedep_var(d)}"
>  emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"
> 
>  ldconfig_postinst_fragment() {
> @@ -1182,6 +1183,7 @@ python package_do_filedeps() {
>  		bb.data.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files), d)
>  		bb.data.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files), d)
>  }
> +package_do_filedeps[vardeps] += "${@gen_package_filedep_var(d)}"
> 
>  SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
>  SHLIBSWORKDIR = "${WORKDIR}/shlibs"
> @@ -1646,7 +1648,7 @@ python package_depchains() {
> 
>  # Since bitbake can't determine which variables are accessed during package
>  # iteration, we need to list them here:
> -PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION
> RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm
> INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME"
> +PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION
> RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst
> pkg_preinst pkg_postrm pkg_prerm INITSCRIPT_NAME INITSCRIPT_PARAMS
> DEBIAN_NOAUTONAME PKGV PKGR"
> 
>  def gen_packagevar(d):
>      ret = []
> @@ -1657,6 +1659,19 @@ def gen_packagevar(d):
>              ret.append(v + "_" + p)
>      return " ".join(ret)
> 
> +def gen_package_filedep_var(d):
> +    ret = []
> +    pkgs = (d.getVar("PACKAGES", True) or "").split()
> +    for pkg in pkgs:
> +        ret.append('FILERPROVIDESFLIST_' + pkg)
> +        for rpfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or
> "").split():
> +            ret.append('FILERPROVIDES_%s_%s' % (rpfile, pkg))
> +
> +        ret.append('FILERDEPENDSFLIST_' + pkg)
> +        for rpfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or
> "").split():
> +            ret.append('FILERDEPENDS_%s_%s' % (rpfile, pkg))
> +    return ret
> +
>  PACKAGE_PREPROCESS_FUNCS ?= ""
>  PACKAGEFUNCS ?= "package_get_auto_pr \	
>                  perform_packagecopy \
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 71e46a8..4a5c6b6 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -393,6 +393,7 @@ python do_package_deb () {
>          bb.utils.prunedir(controldir)
>          bb.utils.unlockfile(lf)
>  }
> +do_package_deb[vardeps] += "${@gen_packagevar(d)}"

For these functions, can we assume that since they depend on
do_package's signature as a task they depend on, they'd pull in changes
to the packaging variables that way?

Cheers,

Richard




