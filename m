Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable exporting more recipe and package data
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 09 Feb 2022 12:23:39 +0000
In-Reply-To: <20220209092947.25677-1-sanakazisk19@gmail.com>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: sana kazi <sanakazisk19@gmail.com>, openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com

On Wed, 2022-02-09 at 14:59 +0530, sana kazi wrote:
> Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
> data to the latest file of buildhistory and sorted it alphabetically.
> 
> This makes extending data in buildhistory git tree simple and avoids
> patches to it for users who care about things like SRC_URI and like
> to track it in buildhistory git tree.
> 
> Now we can add additional information as per our requirement to the
> buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
> by appending them in a recipe or distro specific conf file as follows:
> 
> BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"
> 
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 111 ++++++++++++++++++++----------
>  1 file changed, 73 insertions(+), 38 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index daa96f3b63..377b325518 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -69,6 +69,11 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
>  PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
>  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>  
> +# Set BUILDHISTORY_EXPORT_RECIPE_VARIABLES and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES
> +# to export recipe and package data to the latest file of buildhistory
> +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES SRC_URI LICENSE CONFIG"
> +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
> +
>  #
>  # Write out the contents of the sysroot
>  #
> @@ -264,12 +269,11 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe = pe
>      rcpinfo.pv = pv
>      rcpinfo.pr = pr
> -    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
>      rcpinfo.packages = packages
>      rcpinfo.layer = layer
> -    rcpinfo.license = license
>      rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
> -    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
> +    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
> +    rcpinfo.export_recipe_variables = export_recipe_variables
>      write_recipehistory(rcpinfo, d)
>  
>      bb.build.exec_func("read_subpackage_metadata", d)
> @@ -323,6 +327,9 @@ python buildhistory_emit_pkghistory() {
>  
>          pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
>  
> +        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
> +        pkginfo.export_package_variables = export_package_variables
> +
>          write_pkghistory(pkginfo, d)
>  
>      oe.qa.exit_if_errors(d)
> @@ -370,17 +377,22 @@ def write_recipehistory(rcpinfo, d):
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
>  
>      infofile = os.path.join(pkghistdir, "latest")
> +    export_recipe_variables = set(rcpinfo.export_recipe_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if rcpinfo.pe != "0":
> -            f.write(u"PE = %s\n" %  rcpinfo.pe)
> -        f.write(u"PV = %s\n" %  rcpinfo.pv)
> -        f.write(u"PR = %s\n" %  rcpinfo.pr)
> -        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
> -        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
> -        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
> -        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
> -        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
> -        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
> +        for var in export_recipe_variables:
> +            if var == "PE":
> +                if rcpinfo.pe != "0":
> +                    ret.append("%s = %s" % (var, rcpinfo.pe))
> +            elif var == "LAYER":
> +                ret.append("%s = %s" % (var, rcpinfo.layer))
> +            elif var == "CONFIG":
> +                ret.append("%s = %s" % (var, rcpinfo.config))
> +            else:
> +                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>  
>      write_latest_srcrev(d, pkghistdir)
>  
> @@ -394,32 +406,55 @@ def write_pkghistory(pkginfo, d):
>          bb.utils.mkdirhier(pkgpath)
>  
>      infofile = os.path.join(pkgpath, "latest")
> +    export_package_variables = set(pkginfo.export_package_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if pkginfo.pe != "0":
> -            f.write(u"PE = %s\n" %  pkginfo.pe)
> -        f.write(u"PV = %s\n" %  pkginfo.pv)
> -        f.write(u"PR = %s\n" %  pkginfo.pr)
> -
> -        if pkginfo.pkg != pkginfo.name:
> -            f.write(u"PKG = %s\n" % pkginfo.pkg)
> -        if pkginfo.pkge != pkginfo.pe:
> -            f.write(u"PKGE = %s\n" % pkginfo.pkge)
> -        if pkginfo.pkgv != pkginfo.pv:
> -            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
> -        if pkginfo.pkgr != pkginfo.pr:
> -            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
> -        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
> -        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
> -        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
> -        if pkginfo.rsuggests:
> -            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
> -        if pkginfo.rreplaces:
> -            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
> -        if pkginfo.rconflicts:
> -            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
> -        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
> -        f.write(u"FILES = %s\n" %  pkginfo.files)
> -        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
> +        for var in export_package_variables:
> +            if var == "PE":
> +                if pkginfo.pe != "0":
> +                    ret.append("%s = %s" % (var, pkginfo.pe))
> +            elif var == "PV":
> +                ret.append("%s = %s" % (var, pkginfo.pv))
> +            elif var == "PR":
> +                ret.append("%s = %s" % (var, pkginfo.pr))
> +            elif var == "RPROVIDES":
> +                ret.append("%s = %s" % (var, pkginfo.rprovides))
> +            elif var == "RDEPENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rdepends))
> +            elif var == "RRECOMMENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rrecommends))
> +            elif var == "PKGSIZE":
> +                ret.append("%s = %s" % (var, pkginfo.size))
> +            elif var == "FILES":
> +                ret.append("%s = %s" % (var, pkginfo.files))
> +            elif var == "FILELIST":
> +                ret.append("%s = %s" % (var, pkginfo.filelist))
> +            elif var == "RSUGGESTS":
> +                if pkginfo.rsuggests:
> +                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
> +            elif var == "RREPLACES":
> +                if pkginfo.rreplaces:
> +                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
> +            elif var == "RCONFLICTS":
> +                if pkginfo.rconflicts:
> +                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
> +            elif var == "PKG":
> +                if pkginfo.pkg != pkginfo.name:
> +                    ret.append(u"PKG = %s" % pkginfo.pkg)
> +            elif var == "PKGE":
> +                if pkginfo.pkge != pkginfo.pe :
> +                    ret.append(u"PKGE = %s" % pkginfo.pkge)
> +            elif var == "PKGV":
> +                if pkginfo.pkgv != pkginfo.pv:
> +                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
> +            elif var == "PKGR":
> +                if pkginfo.pkgr != pkginfo.pr:
> +                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
> +            else:
> +                ret.append("%s = %s" % (var, d.getVar(var)))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")


People have requested changes like this before and I rejected it as I'm worried
that allowing people to customise this code will just fork the project into many
different directions. 

The elif block above illustrates part of my concern since it still isn't scaling
well and just potentially makes every buildhistory output difference (even with
different ordering). There are reasons the data is taken from pkginfo rather
than getVar too and I think this could introduce subtle bugs in the future.

Which variables are you actually interested in when changing this?

Cheers,

Richard







