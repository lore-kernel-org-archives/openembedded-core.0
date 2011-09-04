Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R03pA-0006ib-Oo
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 05:56:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2011 20:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="13857115"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Sep 2011 20:51:47 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 4 Sep 2011 11:51:46 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 4 Sep 2011 11:51:46 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Sun, 4 Sep 2011
	11:51:45 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Richard Purdie
	(richard.purdie@linuxfoundation.org)" <richard.purdie@linuxfoundation.org>
Date: Sun, 4 Sep 2011 11:51:44 +0800
Thread-Topic: [OE-core] multilib: Only build one kernel
Thread-Index: AcxpcH9qOe4AfLw8RcS10LfnNftwCwBRBvOQ
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D73C62AA@shsmsx501.ccr.corp.intel.com>
References: <1314968473.5939.577.camel@rex>
In-Reply-To: <1314968473.5939.577.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: multilib: Only build one kernel
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
X-List-Received-Date: Sun, 04 Sep 2011 03:56:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, September 02, 2011 9:01 PM
> To: openembedded-core
> Subject: [OE-core] multilib: Only build one kernel
>=20
> For a given system we only want one kernel to be built. This change makes=
 the
> main kernel recipe provide all of the provides of the various enabled mul=
tilibs
> hence allowing it to fulfil all the appropriate dependencies.
>=20
> To make this work a global multilib class file needed to be created.
>=20
> This patch also enables this multi provider functionality for "allarch"
> packages.
>=20
> [YOCTO #1361]

When testing multilib with latest master, I found bitbake would report fail=
ed dependency of kernel-module-*. As we know, kernel-module-* will be recom=
mended by some other recipes, while it is defined in kernel related recipe =
in PACKAGES_DYNAMIC. I think we need the following patch to make it work:

commit bc04de64057a17ae93be466e32249f9505321f59
Author: Dongxiao Xu <dongxiao.xu@intel.com>
Date:   Sun Sep 4 11:49:33 2011 +0800

    multilib_global.bbclass: handle kernel-module-* for multilib

    bitbake would report failed dependency of kernel-module-* when testing
    multilib. kernel-module-* are recommended by some other recipes.

    Do not extend name for kernel-module-* related packages.

    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_g=
lobal.bbclass
index 217349b..1263e4e 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -17,6 +17,8 @@ python multilib_virtclass_handler_global () {
 addhandler multilib_virtclass_handler_global

 def multilib_extend_name(variant, name):
+    if name.startswith("kernel-module"):
+        return name
     if name.startswith("virtual/"):
         subs =3D name.split("/", 1)[1]
         if not subs.startswith(variant):

Thanks,
Dongxiao

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclas=
s index
> 5d975fd..583d76b 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -6,12 +6,17 @@ python multilib_virtclass_handler () {
>      variant =3D e.data.getVar("BBEXTENDVARIANT", True)
>      if cls !=3D "multilib" or not variant:
>          return
> +
> +    # There should only be one kernel in multilib configs
> +    if bb.data.inherits_class('kernel', e.data) or
> bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('=
allarch',
> e.data):
> +        raise bb.parse.SkipPackage("We shouldn't have multilib variants
> + for the kernel")
> +
>      save_var_name=3De.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
>      for name in save_var_name.split():
>          val=3De.data.getVar(name, True)
>          if val:
>              e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
> -
> +
>      override =3D ":virtclass-multilib-" + variant
>=20
>      e.data.setVar("MLPREFIX", variant + "-") @@ -28,16 +33,6 @@
> STAGINGCC_prepend =3D "${BBEXTENDVARIANT}-"
>  python __anonymous () {
>      variant =3D d.getVar("BBEXTENDVARIANT", True)
>=20
> -    def extend_name(name):
> -        if name.startswith("virtual/"):
> -            subs =3D name.split("/", 1)[1]
> -            if not subs.startswith(variant):
> -                return "virtual/" + variant + "-" + subs
> -            return name
> -        if not name.startswith(variant):
> -            return variant + "-" + name
> -        return name
> -
>      def map_dependencies(varname, d, suffix =3D ""):
>          if suffix:
>              varname =3D varname + "_" + suffix @@ -50,25 +45,15 @@
> python __anonymous () {
>              if dep.endswith(("-native", "-native-runtime")):
>                  newdeps.append(dep)
>              else:
> -                newdeps.append(extend_name(dep))
> +                newdeps.append(multilib_extend_name(variant, dep))
>          d.setVar(varname, " ".join(newdeps))
>=20
> -    def map_variable(varname, d):
> -        var =3D d.getVar(varname, True)
> -        if not var:
> -            return
> -        var =3D var.split()
> -        newvar =3D []
> -        for v in var:
> -            newvar.append(extend_name(v))
> -        d.setVar(varname, " ".join(newvar))
> -
>      pkgs_mapping =3D []
>      for pkg in (d.getVar("PACKAGES", True) or "").split():
>          if pkg.startswith(variant):
>              pkgs_mapping.append([pkg.split(variant + "-")[1], pkg])
>              continue
> -        pkgs_mapping.append([pkg, extend_name(pkg)])
> +        pkgs_mapping.append([pkg, multilib_extend_name(variant, pkg)])
>=20
>      d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
>=20
> @@ -87,8 +72,8 @@ python __anonymous () {
>          map_dependencies("RCONFLICTS", d, pkg)
>          map_dependencies("PKG", d, pkg)
>=20
> -    map_variable("PROVIDES", d)
> -    map_variable("PACKAGES_DYNAMIC", d)
> -    map_variable("PACKAGE_INSTALL", d)
> -    map_variable("INITSCRIPT_PACKAGES", d)
> +    multilib_map_variable("PROVIDES", variant, d)
> +    multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
> +    multilib_map_variable("PACKAGE_INSTALL", variant, d)
> +    multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
>  }
> diff --git a/meta/classes/multilib_global.bbclass
> b/meta/classes/multilib_global.bbclass
> new file mode 100644
> index 0000000..217349b
> --- a/dev/null
> +++ b/meta/classes/multilib_global.bbclass
> @@ -0,0 +1,39 @@
> +python multilib_virtclass_handler_global () {
> +    if not e.data:
> +        return
> +
> +    variant =3D e.data.getVar("BBEXTENDVARIANT", True)
> +
> +    if isinstance(e, bb.event.RecipeParsed) and not variant:
> +        if bb.data.inherits_class('kernel', e.data) or
> bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('=
allarch',
> e.data):
> +            origprovs =3D provs =3D e.data.getVar("PROVIDES", True)
> +            variants =3D (e.data.getVar("MULTILIB_VARIANTS", True) or
> "").split()
> +            for variant in variants:
> +                provs =3D provs + " " + multilib_map_variable("PROVIDES"=
,
> variant, e.data)
> +                e.data.setVar("PROVIDES", origprovs)
> +            e.data.setVar("PROVIDES", provs) }
> +
> +addhandler multilib_virtclass_handler_global
> +
> +def multilib_extend_name(variant, name):
> +    if name.startswith("virtual/"):
> +        subs =3D name.split("/", 1)[1]
> +        if not subs.startswith(variant):
> +            return "virtual/" + variant + "-" + subs
> +        return name
> +    if not name.startswith(variant):
> +        return variant + "-" + name
> +    return name
> +
> +def multilib_map_variable(varname, variant, d):
> +    var =3D d.getVar(varname, True)
> +    if not var:
> +        return
> +    var =3D var.split()
> +    newvar =3D []
> +    for v in var:
> +        newvar.append(multilib_extend_name(variant, v))
> +    newdata =3D  " ".join(newvar)
> +    d.setVar(varname, newdata)
> +    return newdata
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf index
> 36793d2..7424b8f 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -6,6 +6,8 @@ MULTILIB_SAVE_VARNAME =3D "DEFAULTTUNE"
>=20
>  MULTILIBS ??=3D "multilib:lib32"
>=20
> +INHERIT +=3D "multilib_global"
> +
>  BBCLASSEXTEND_append_pn-acl =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-alsa-lib =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-alsa-utils =3D " ${MULTILIBS}"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


