Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UBVuL-0001bz-Gu
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 20:46:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Mar 2013 11:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="263257644"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by azsmga001.ch.intel.com with ESMTP; 01 Mar 2013 11:29:36 -0800
Message-ID: <5131019F.8030805@linux.intel.com>
Date: Fri, 01 Mar 2013 11:29:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1361979444-1244-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1361979444-1244-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: add support for SRCREV logging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 19:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2013 07:37 AM, Constantin Musca wrote:
> - create "latest_srcrev" for each recipe with the following format:
> ${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}
>
> [YOCTO #3041]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/buildhistory.bbclass | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index a20d03d..fa13ef5 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -44,6 +44,11 @@ python buildhistory_emit_pkghistory() {
>               self.pr = "r0"
>               self.depends = ""
>               self.packages = ""
> +            self.bbfile = ""
> +            self.src_uri = ""
> +            self.srcrev = ""
> +            self.srcrev_autorev = ""
> +
>
>       class PackageInfo:
>           def __init__(self, name):
> @@ -151,6 +156,12 @@ python buildhistory_emit_pkghistory() {
>       pe = d.getVar('PE', True) or "0"
>       pv = d.getVar('PV', True)
>       pr = d.getVar('PR', True)
> +
> +    bbfile = d.getVar('BB_FILENAME', True)
> +    src_uri = d.getVar('SRC_URI', True)
> +    srcrev = d.getVar('SRCREV', True)
> +    srcrev_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
> +
>       packages = squashspaces(d.getVar('PACKAGES', True))
>
>       packagelist = packages.split()
> @@ -159,7 +170,7 @@ python buildhistory_emit_pkghistory() {
>       else:
>           # Remove files for packages that no longer exist
>           for item in os.listdir(pkghistdir):
> -            if item != "latest":
> +            if item != "latest" and item != "latest_srcrev":
>                   if item not in packagelist:
>                       subdir = os.path.join(pkghistdir, item)
>                       for subfile in os.listdir(subdir):
> @@ -171,6 +182,10 @@ python buildhistory_emit_pkghistory() {
>       rcpinfo.pv = pv
>       rcpinfo.pr = pr
>       rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
> +    rcpinfo.bbfile = bbfile
> +    rcpinfo.src_uri = src_uri
> +    rcpinfo.srcrev = srcrev
> +    rcpinfo.srcrev_autorev = srcrev_autorev
>       rcpinfo.packages = packages
>       write_recipehistory(rcpinfo, d)
>
> @@ -241,6 +256,12 @@ def write_recipehistory(rcpinfo, d):
>           f.write("DEPENDS = %s\n" %  rcpinfo.depends)
>           f.write("PACKAGES = %s\n" %  rcpinfo.packages)
>
> +    if rcpinfo.srcrev:
> +        srcrevfile = os.path.join(pkghistdir, "latest_srcrev")
> +        with open(srcrevfile, "w") as f:
> +            f.write(','.join([rcpinfo.bbfile, rcpinfo.src_uri, rcpinfo.srcrev,
> +                        rcpinfo.srcrev_autorev]))
> +
>
>   def write_pkghistory(pkginfo, d):
>       bb.debug(2, "Writing package history for package %s" % pkginfo.name)
>

I found the following problem with multiple builds:

> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "buildhistory_emit_pkghistory", line 200, in <module>
> ERROR:
> ERROR:   File "buildhistory_emit_pkghistory", line 136, in buildhistory_emit_pkghistory
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0196:
> ERROR:      0197:        write_pkghistory(pkginfo, d)
> ERROR:      0198:
> ERROR:      0199:
> ERROR:  *** 0200:buildhistory_emit_pkghistory(d)
> ERROR:      0201:
> ERROR: [From file: 'buildhistory_emit_pkghistory', lineno: 200, function: <module>]
> ERROR:      0132:        for item in os.listdir(pkghistdir):
> ERROR:      0133:            if item != "latest":
> ERROR:      0134:                if item not in packagelist:
> ERROR:      0135:                    subdir = os.path.join(pkghistdir, item)
> ERROR:  *** 0136:                    for subfile in os.listdir(subdir):
> ERROR:      0137:                        os.unlink(os.path.join(subdir, subfile))
> ERROR:      0138:                    os.rmdir(subdir)
> ERROR:      0139:
> ERROR:      0140:    rcpinfo = RecipeInfo(pn)
> ERROR: [From file: 'buildhistory_emit_pkghistory', lineno: 136, function: buildhistory_emit_pkghistory]
> ERROR: Function failed: buildhistory_emit_pkghistory
> ERROR: Logfile of failure stored in: /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/libgcc/4.7.2-r19/temp/log.do_package.24155
> ERROR: Task 953 (/home/sgw/yocto/poky/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package) failed with exit code '1'

It occurs with base-files also.


