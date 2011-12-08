Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYmGG-00019w-8D for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:16:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8M9R9N007123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 22:09:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02430-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 22:09:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8M9Iwg007111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 22:09:18 GMT
Message-ID: <1323382168.5309.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 22:09:28 +0000
In-Reply-To: <ce8ae4f8f6647b3b81e1346d43f0f785a9098425.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<ce8ae4f8f6647b3b81e1346d43f0f785a9098425.1323358819.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Thu, 08 Dec 2011 22:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 15:40 +0000, Otavio Salvador wrote:
> Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
> recipes.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/cross.bbclass |   50 ++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 50 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 5681ab9..a3b8e10 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -55,6 +55,56 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
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
> +                newdeps.append(dep.replace("-cross", "-cross"))

I know you did a copy, search, replace and paste from native.bbclass but
you could at least sanity check the result :)

> +            elif not dep.endswith("-cross"):
> +                newdeps.append(dep + "-cross")
> +            else:
> +                newdeps.append(dep)
> +        bb.data.setVar(varname, " ".join(newdeps), d)

The logic here is just totally wrong. You can't ever hit the else case
and the paths you do hit are nonsensical.

> +
> +    map_dependencies("DEPENDS", e.data)
> +    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
> +        map_dependencies("RDEPENDS", e.data, pkg)
> +        map_dependencies("RRECOMMENDS", e.data, pkg)
> +        map_dependencies("RSUGGESTS", e.data, pkg)
> +        map_dependencies("RPROVIDES", e.data, pkg)
> +        map_dependencies("RREPLACES", e.data, pkg)
> +
> +    provides = e.data.getVar("PROVIDES", True)
> +    for prov in provides.split():
> +        if prov.find(pn) != -1:
> +            continue
> +        if not prov.endswith("-cross"):
> +            provides = provides.replace(prov, prov + "-cross")
> +    e.data.setVar("PROVIDES", provides)

My suggestion is that you should just remove the DEPENDS and PROVIDES
mapping code above and do it manually using the virtclass-cross override
in the recipe. The above code can't have been doing much that is
sensible anyway.

Cheers,

Richard

> +    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-cross", e.data)
> +}
> +
> +addhandler cross_virtclass_handler
> +
>  do_install () {
>  	oe_runmake 'DESTDIR=${D}' install
>  }




