Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rv5GM-00078C-18 for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 12:00:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18AqUX9018673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 10:52:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18383-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 10:52:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18AqLMd018636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 10:52:22 GMT
Message-ID: <1328698348.29471.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 10:52:28 +0000
In-Reply-To: <3aaae21268883e5ebcc5373f99517045613ad102.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
	<3aaae21268883e5ebcc5373f99517045613ad102.1328648562.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Wed, 08 Feb 2012 11:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-07 at 21:09 +0000, Otavio Salvador wrote:
> Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
> recipes.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/cross.bbclass |   39 +++++++++++++++++++++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 5681ab9..a764902 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -55,6 +55,45 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
>  
>  do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
>  
> +python cross_virtclass_handler () {
> +    if not isinstance(e, bb.event.RecipePreFinalise):
> +        return
> +
> +    classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
> +    if "cross" not in classextend:
> +        return
> +
> +    pn = e.data.getVar("PN", True)
> +    if not pn.endswith("-cross"):
> +        return
> +
> +    def map_dependencies(varname, d, suffix = ""):
> +        if suffix:
> +            varname = varname + "_" + suffix
> +        deps = d.getVar(varname, True)
> +        if not deps:
> +            return
> +        deps = bb.utils.explode_deps(deps)
> +        newdeps = []
> +        for dep in deps:
> +            if dep.endswith("-cross"):
> +                newdeps.append(dep)
> +            else:
> +                newdeps.append(dep + "-cross")
> +        bb.data.setVar(varname, " ".join(newdeps), d)
> +
> +    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
> +        map_dependencies("RDEPENDS", e.data, pkg)
> +        map_dependencies("RRECOMMENDS", e.data, pkg)
> +        map_dependencies("RSUGGESTS", e.data, pkg)
> +        map_dependencies("RPROVIDES", e.data, pkg)
> +        map_dependencies("RREPLACES", e.data, pkg)

I want to highlight what this code does and I don't understand when it
would do something that makes sense. If for example we have a recipe
which:

RDEPENDS = "libc zlib"

it will now:

RDEPENDS = "lib-cross zlib-cross"

or a native recipe which had:

RDEPENDS = "pkgconfig-native"

will now:

RDEPENDS = "pkgconfig-native-cross"

Can you point me at the recipe you're using this in? I suspect we should
just remove the map_dependencies() pieces from this class entirely and
handle dependency issues with the override manually. I think at this
point all the BBCLASSEXTEND is going to give you is the removal of the
need to add a separate .bb file with "inherit cross" in it and enable an
override for your to use. I'm not sure we can write generic dependency
mapping code that would work for -cross.

Cheers,

Richard




