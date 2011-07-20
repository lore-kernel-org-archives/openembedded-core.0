Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjYQs-00027R-9T for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:11:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KF7Ns2023889
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 16:07:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23724-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 16:07:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KF7JuT023883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 16:07:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <001723a8c18e29a218edc42517968d190b08915d.1310583666.git.tom_rini@mentor.com>
References: <ea6f9e7c8e2fd03d3c1ca9fc83f149dd696ac40b.1310583666.git.tom_rini@mentor.com>
	<001723a8c18e29a218edc42517968d190b08915d.1310583666.git.tom_rini@mentor.com>
Date: Wed, 20 Jul 2011 16:07:16 +0100
Message-ID: <1311174436.2344.62.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] siteinfo.bbclass: Port over oe.dev logic for site files
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
X-List-Received-Date: Wed, 20 Jul 2011 15:11:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Tom,

I had a chance to look at this in more detail now, I just have a couple
of things to look at...

On Wed, 2011-07-13 at 12:06 -0700, Tom Rini wrote:
> In oe.dev we have a sets to pick out hostos/hostarch/etc site
> files out of and include things like a common-linux site file.
> This should also help out with adding multilib-specific site files
> (ie x32).  This requires a smallish change to autotools.bbclass to
> find the files now and changes to toolchain-scripts.bbclass,
> meta-toolchain.bb and meta-environment.bb to deal with how CONFIG_SITE
> is now.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/classes/autotools.bbclass             |    2 +-
>  meta/classes/siteinfo.bbclass              |  202 +++++++++++++---------------
>  meta/classes/toolchain-scripts.bbclass     |    2 +-
>  meta/recipes-core/meta/meta-environment.bb |    2 +-
>  meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
>  5 files changed, 100 insertions(+), 110 deletions(-)
>  create mode 100644 meta/site/common-linux
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 98c871a..5e8799a 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -26,7 +26,7 @@ inherit siteinfo
>  
>  # Space separated list of shell scripts with variables defined to supply test
>  # results for autoconf tests we cannot run at build time.
> -export CONFIG_SITE = "${@siteinfo_get_files(d)}"
> +export CONFIG_SITE = "${@' '.join(siteinfo_get_files(d))}"

I'm not sure we have to change the return value of the function to
become an iterator/list, or that it actually buys us much?

>  acpaths = "default"
>  EXTRA_AUTORECONF = "--exclude=autopoint"
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 78b7008..283ef42 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -15,121 +15,111 @@
>  # It is an error for the target not to exist.
>  # If 'what' doesn't exist then an empty value is returned
>  #
> -def get_siteinfo_list(d):
> -       target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
> +def siteinfo_data(d):
> +    archinfo = {
> +        "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
> +        "arm": "endian-little bit-32 arm-common",
> +        "armeb": "endian-big bit-32 arm-common",
> +        "avr32": "endian-big bit-32 avr32-common",
> +        "bfin": "endian-little bit-32 bfin-common",
> +        "i386": "endian-little bit-32 ix86-common",
> +        "i486": "endian-little bit-32 ix86-common",
> +        "i586": "endian-little bit-32 ix86-common",
> +        "i686": "endian-little bit-32 ix86-common",
> +        "ia64": "endian-little bit-64",
> +        "microblaze": "endian-big bit-32 microblaze-common",
> +        "microblazeel": "endian-little bit-32 microblaze-common",
> +        "mips": "endian-big bit-32 mips-common",
> +        "mips64": "endian-big bit-64 mips64-common",
> +        "mips64el": "endian-little bit-64 mips64-common",
> +        "mipsel": "endian-little bit-32 mips-common",
> +        "powerpc": "endian-big bit-32 powerpc-common",
> +        "nios2": "endian-little bit-32 nios2-common",
> +        "powerpc64": "endian-big bit-64 powerpc-common powerpc64-linux",
> +        "ppc": "endian-big bit-32 powerpc-common",
> +        "ppc64": "endian-big bit-64 powerpc-common powerpc64-linux",
> +        "sh3": "endian-little bit-32 sh-common",
> +        "sh4": "endian-little bit-32 sh-common",
> +        "sparc": "endian-big bit-32",
> +        "viac3": "endian-little bit-32 ix86-common",
> +        "x86_64": "endian-little bit-64",
> +    }
> +    osinfo = {
> +        "darwin": "common-darwin",
> +        "darwin9": "common-darwin",
> +        "linux": "common-linux common-glibc",
> +        "linux-gnueabi": "common-linux common-glibc",
> +        "linux-gnuspe": "common-linux common-glibc",
> +        "linux-uclibc": "common-linux common-uclibc",
> +        "linux-uclibceabi": "common-linux common-uclibc",
> +        "linux-uclibcspe": "common-linux common-uclibc",
> +        "uclinux-uclibc": "common-uclibc",
> +        "cygwin": "common-cygwin",
> +        "mingw32": "common-mingw",
> +    }
> +    targetinfo = {
> +        "arm-linux-gnueabi": "arm-linux",
> +        "arm-linux-uclibceabi": "arm-linux-uclibc",
> +        "armeb-linux-gnueabi": "armeb-linux",
> +        "armeb-linux-uclibceabi": "armeb-linux-uclibc",
> +        "powerpc-linux-gnuspe": "powerpc-linux",
> +        "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
> +    }
>  
> -       targetinfo = {\
> -               "allarch-linux":           "",\
> -               "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
> -               "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
> -               "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
> -               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
> -               "arm-darwin":              "endian-little bit-32 common-darwin",\
> -               "arm-darwin8":              "endian-little bit-32 common-darwin",\
> -               "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
> -               "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
> -               "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
> -               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
> -               "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
> -               "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
> -               "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
> -               "i386-linux":              "endian-little bit-32 common-glibc ix86-common",\
> -               "i486-linux":              "endian-little bit-32 common-glibc ix86-common",\
> -               "i586-linux":              "endian-little bit-32 common-glibc ix86-common",\
> -               "i686-linux":              "endian-little bit-32 common-glibc ix86-common",\
> -               "i386-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
> -               "i486-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
> -               "i586-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
> -               "i686-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
> -               "microblaze-linux-gnu":    "endian-big bit-32 common-glibc microblaze-common",\
> -               "microblazeel-linux-gnu":  "endian-little bit-32 common-glibc microblaze-common",\
> -               "mipsel-linux":            "endian-little bit-32 common-glibc mips-common",\
> -               "mipsel-linux-uclibc":     "endian-little bit-32 common-uclibc mips-common",\
> -               "mips-linux":              "endian-big bit-32 common-glibc mips-common",\
> -               "mips-linux-uclibc":       "endian-big bit-32 common-uclibc mips-common",\
> -               "powerpc-darwin":          "endian-big bit-32 common-darwin",\
> -               "ppc-linux":               "endian-big bit-32 common-glibc powerpc-common",\ 
> -	       "powerpc-linux":           "endian-big bit-32 common-glibc powerpc-common",\
> -               "powerpc-linux-gnuspe":    "endian-big bit-32 common-glibc powerpc-common",\
> -               "powerpc-linux-uclibc":    "endian-big bit-32 common-uclibc powerpc-common",\
> -               "sh3-linux":               "endian-little bit-32 common-glibc sh-common",\
> -               "sh4-linux":               "endian-little bit-32 common-glibc sh-common",\
> -               "sh4-linux-uclibc":        "endian-little bit-32 common-uclibc sh-common",\
> -               "sparc-linux":             "endian-big bit-32 common-glibc",\
> -               "x86_64-linux":            "endian-little bit-64 common-glibc",\
> -               "x86_64-linux-uclibc":     "endian-little bit-64 common-uclibc"}
> -       if target in targetinfo:
> -               info = targetinfo[target].split()
> -               info.append(target)
> -               info.append("common")
> -               return info
> -       else:
> -               bb.error("Information not available for target '%s'" % target)
> +    hostarch = d.getVar("HOST_ARCH", True)
> +    hostos = d.getVar("HOST_OS", True)
> +    target = "%s-%s" % (hostarch, hostos)
>  
> +    sitedata = []
> +    if hostarch in archinfo:
> +        sitedata.extend(archinfo[hostarch].split())
> +    if hostos in osinfo:
> +        sitedata.extend(osinfo[hostos].split())
> +    if target in targetinfo:
> +        sitedata.extend(targetinfo[target].split())
> +    sitedata.append(target)
> +    sitedata.append("common")
>  
> -#
> -# Define which site files to use. We check for several site files and
> -# use each one that is found, based on the list returned by get_siteinfo_list()
> -#
> -# Search for the files in the following directories:
> -# 1) ${BBPATH}/site (in reverse) - app specific, then site wide
> -# 2) ${FILE_DIRNAME}/site-${PV}         - app version specific
> -#
> -def siteinfo_get_files(d):
> -       sitefiles = ""
> -
> -       # Determine which site files to look for
> -       sites = get_siteinfo_list(d)
> +    bb.debug(1, "SITE files %s" % sitedata);
> +    return sitedata
>  
> -       # Check along bbpath for site files and append in reverse order so
> -       # the application specific sites files are last and system site
> -       # files first.
> -       path_bb = bb.data.getVar('BBPATH', d, 1)
> -       for p in (path_bb or "").split(':'):
> -               tmp = ""
> -               for i in sites:
> -                       fname = os.path.join(p, 'site', i)
> -                       if os.path.exists(fname):
> -                               tmp += fname + " "
> -               sitefiles = tmp + sitefiles;
> +python () {
> +    sitedata = set(siteinfo_data(d))

If we're going to do this in anonymous python, why not save out the list
in a variable at this point? See below for why that might be a bad idea
on the other hand... :)

> +    if "endian-little" in sitedata:
> +        d.setVar("SITEINFO_ENDIANESS", "le")
> +    elif "endian-big" in sitedata:
> +        d.setVar("SITEINFO_ENDIANESS", "be")
> +    else:
> +        bb.error("Unable to determine endianness for architecture '%s'" %
> +                 d.getVar("HOST_ARCH", True))
> +        bb.fatal("Please add your architecture to siteinfo.bbclass")
>  
> -       # Now check for the applications version specific site files
> -       path_pkgv = os.path.join(bb.data.getVar('FILE_DIRNAME', d, 1), "site-" + bb.data.getVar('PV', d, 1))
> -       for i in sites:
> -               fname = os.path.join(path_pkgv, i)
> -               if os.path.exists(fname):
> -                       sitefiles += fname + " "
> +    if "bit-32" in sitedata:
> +        d.setVar("SITEINFO_BITS", "32")
> +    elif "bit-64" in sitedata:
> +        d.setVar("SITEINFO_BITS", "64")
> +    else:
> +        bb.error("Unable to determine bit size for architecture '%s'" %
> +                 d.getVar("HOST_ARCH", True))
> +        bb.fatal("Please add your architecture to siteinfo.bbclass")
> +}
>  
> -       # Now check for siteconfig cache files
> -       path_siteconfig = bb.data.getVar('SITECONFIG_SYSROOTCACHE', d, 1)
> -       if os.path.isdir(path_siteconfig):
> -               for i in os.listdir(path_siteconfig):
> -                       fname = os.path.join(path_siteconfig, i)
> -                       sitefiles += fname + " "
> -
> -       bb.debug(1, "SITE files " + sitefiles);
> -       return sitefiles
> -
> -def siteinfo_get_endianess(d):
> -       info = get_siteinfo_list(d)
> -       if 'endian-little' in info:
> -              return "le"
> -       elif 'endian-big' in info:
> -              return "be"
> -       bb.error("Site info could not determine endianess for target")
> +def siteinfo_get_files(d):
> +    sitedata = siteinfo_data(d)

and then here we could just retrieve it?

> +    for path in d.getVar("BBPATH", True).split(":"):
> +        for element in sitedata:
> +            filename = os.path.join(path, "site", element)
> +            if os.path.exists(filename):
> +                yield filename
>  
> -def siteinfo_get_bits(d):
> -       info = get_siteinfo_list(d)
> -       if 'bit-32' in info:
> -              return "32"
> -       elif 'bit-64' in info:
> -              return "64"
> -       bb.error("Site info could not determine bit size for target")
> +    # Now check for siteconfig cache files
> +    path_siteconfig = bb.data.getVar('SITECONFIG_SYSROOTCACHE', d, 1)
> +    if os.path.isdir(path_siteconfig):
> +        for i in os.listdir(path_siteconfig):
> +            filename = os.path.join(path_siteconfig, i)
> +            yield filename
>  
>  #
>  # Make some information available via variables
>  #
> -SITEINFO_ENDIANESS  = "${@siteinfo_get_endianess(d)}"
> -SITEINFO_BITS       = "${@siteinfo_get_bits(d)}"
>  SITECONFIG_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
> -
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 3301319..751a47e 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -42,7 +42,7 @@ toolchain_create_tree_env_script () {
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>  	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>  
> -	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
> +	echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script

This is the thing that really caught my eye when combined with the code
below...

>  	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
>  	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
> index 351cbf0..865dd00 100644
> --- a/meta/recipes-core/meta/meta-environment.bb
> +++ b/meta/recipes-core/meta/meta-environment.bb
> @@ -8,7 +8,7 @@ EXCLUDE_FROM_WORLD = "1"
>  
>  inherit toolchain-scripts
>  # get target config site before inheritting cross-canadian
> -TARGET_CONFIG_SITE := "${@siteinfo_get_files(d)}"
> +TARGET_CONFIG_SITE := "${@' '.join(siteinfo_get_files(d))}"
>
>  SDK_DIR = "${WORKDIR}/sdk"
>  SDK_OUTPUT = "${SDK_DIR}/image"
> diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
> index ab98bf9..3abba42 100644
> --- a/meta/recipes-core/meta/meta-toolchain.bb
> +++ b/meta/recipes-core/meta/meta-toolchain.bb
> @@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>  IMAGETEST ?= "dummy"
>  inherit populate_sdk imagetest-${IMAGETEST}
>  
> -CONFIG_SITE := "${@siteinfo_get_files(d)}"
> +CONFIG_SITE := "${@' '.join(siteinfo_get_files(d))}"

What I'm worried about is that here, CONFIG_SITE is expanded to
something using := but if this was combined with
toolchain-scripts.bbclass, the value of CONFIG_SITE in that code might
change.

The safest thing to do would be to leave the ' '.join(....) syntax in
the .bbclass since I think it was deliberate for some ordering issue.

Of course my comment about caching the results in a variable are
defeated by the fact we do change HOST_ARCH and other variables and
expect the list we get back to update accordingly...

So if we can fix these details I think this is good to go in.

Cheers,

Richard




