Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 737D0600FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 06:53:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jul 2013 23:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,992,1363158000"; d="scan'208";a="263964381"
Received: from unknown (HELO [10.255.13.183]) ([10.255.13.183])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2013 23:53:06 -0700
Message-ID: <51D51BD2.20505@linux.intel.com>
Date: Wed, 03 Jul 2013 23:53:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1372556176-25711-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1372556176-25711-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Thu, 04 Jul 2013 06:53:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2013 06:36 PM, Martin Jansa wrote:
> * usually it's more important to know how much space will each
>    package take on target device then size of compressed package
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/buildhistory.bbclass | 11 ++++----
>   scripts/oe-pkgdata-util           | 59 ++++++++++++++++++++++++++++++++++++---
>   2 files changed, 61 insertions(+), 9 deletions(-)
>

I am not sure how, but this patch is causing some failures in poky with
core-image-sato build, it seems that that the args coming from the 
rootfs_install_complementary get goofed up somehow, not sure but I 
bisected down to this patch.

the -poky seems to have a space added so it gets -poky -linux on the 
command line for oe-pkgdata-utils.

Sau!

> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 36e7fe1..1ebe68e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -317,6 +317,8 @@ buildhistory_get_installed() {
>   	# Get list of installed packages
>   	pkgcache="$1/installed-packages.tmp"
>   	list_installed_packages file | sort > $pkgcache
> +	pkgcachearch="$1/installed-packages-arch.tmp"
> +	list_installed_packages arch | sort > $pkgcachearch
>
>   	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
>   	if [ -s $pkgcache ] ; then
> @@ -338,18 +340,17 @@ buildhistory_get_installed() {
>
>   	# Produce installed package sizes list
>   	printf "" > $1/installed-package-sizes.tmp
> -	cat $pkgcache | while read pkg pkgfile
> +	cat $pkgcachearch | while read pkg arch
>   	do
> -		if [ -f $pkgfile ] ; then
> -			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
> -			echo $pkgsize $pkg >> $1/installed-package-sizes.tmp
> -		fi
> +		size=`oe-pkgdata-util read_values ${TMPDIR}/pkgdata ${TARGET_VENDOR}-${TARGET_OS} "PKGSIZE" ${pkg}_${arch}`
> +		echo "$size $pkg" >> $1/installed-package-sizes.tmp
>   	done
>   	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
>   	rm $1/installed-package-sizes.tmp
>
>   	# We're now done with the cache, delete it
>   	rm $pkgcache
> +	rm $pkgcachearch
>
>   	if [ "$2" != "sdk" ] ; then
>   		# Produce some cut-down graphs (for readability)
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 629b2d5..88b8122 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -20,9 +20,12 @@
>   # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   #
>   #
> -# Currently only has one function - mapping of packages to their dev/dbg/doc/locale etc.
> -# counterparts ("glob" command). Could be extended in future to perform other useful querying
> -# functions on the pkgdata though.
> +# Currently only has two functions
> +# 1) glob - mapping of packages to their dev/dbg/doc/locale etc. counterparts.
> +# 2) read_values - mapping of packagenames to their location in
> +#    pkgdata and then returns value of selected variable (e.g. PKGSIZE)
> +# Could be extended in future to perform other useful querying functions on the
> +# pkgdata though.
>   #
>
>   import sys
> @@ -32,7 +35,8 @@ import fnmatch
>   import re
>
>   def usage():
> -    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"");
> +    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"\n \
> +                    read_values [-d] <pkgdatadir> <vendor-os> <variable-name> \"<ipk filenames>\"");
>
>
>
> @@ -151,7 +155,52 @@ def glob(args):
>
>       print("\n".join(mappedpkgs))
>
> +def read_values(args):
> +    if len(args) < 4:
> +        usage()
> +        sys.exit(1)
> +
> +    pkgdata_dir = args[0]
> +    target_suffix = args[1]
> +    var = args[2]
> +    packages = args[3].split()
>
> +    if target_suffix.startswith("-"):
> +        target_suffix = target_suffix[1:]
> +
> +    def readvar(pkgdata_file, var):
> +        val = ""
> +        with open(pkgdata_file, 'r') as f:
> +            for line in f:
> +                if line.startswith(var + ":"):
> +                    val = line.split(': ')[1].rstrip()
> +        return val
> +
> +    if debug:
> +        print "read_values('%s', '%s', '%s' '%s'" % (pkgdata_dir, target_suffix, var, packages)
> +    for package in packages:
> +        pkg_split = package.split('_')
> +        pkg_name = pkg_split[0]
> +        pkg_arch = '_'.join(pkg_split[1:])
> +        if debug:
> +            print "package: name: '%s', arch: '%s'" % (pkg_name, pkg_arch)
> +        multimach_target_sys = "%s-%s" % (pkg_arch, target_suffix)
> +        revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
> +        if debug:
> +            print(revlink)
> +        if not os.path.exists(revlink):
> +            # [YOCTO #4227] try to drop -gnueabi from TARGET_OS
> +            multimach_target_sys = '-'.join(multimach_target_sys.split('-')[:-1])
> +            revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
> +            if debug:
> +                print(revlink)
> +        if os.path.exists(revlink):
> +            mappedpkg = os.path.basename(os.readlink(revlink))
> +            qvar = var
> +            if qvar == "PKGSIZE":
> +                # append packagename
> +                qvar = "%s_%s" % (var, mappedpkg)
> +            print(readvar(revlink, qvar))
>
>   # Too lazy to use getopt
>   debug = False
> @@ -173,6 +222,8 @@ if len(args) < 1:
>
>   if args[0] == "glob":
>       glob(args[1:])
> +if args[0] == "read_values":
> +    read_values(args[1:])
>   else:
>       usage()
>       sys.exit(1)
>

