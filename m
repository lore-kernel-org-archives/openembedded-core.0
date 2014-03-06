Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E99D6610CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 21:56:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s26LtqWN019552; Thu, 6 Mar 2014 21:55:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xJrYBM-KnXRk; Thu,  6 Mar 2014 21:55:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s26Ltk4o019544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 6 Mar 2014 21:55:48 GMT
Message-ID: <1394142938.12327.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 06 Mar 2014 21:55:38 +0000
In-Reply-To: <9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
	<9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] buildhistory.bbclass: Fix dependency files creation
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
X-List-Received-Date: Thu, 06 Mar 2014 21:56:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-05 at 14:39 +0200, Laurentiu Palcu wrote:
> Call the new python routines.
> 
> [YOCTO #5904]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/buildhistory.bbclass |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index ef4135b..01b0082 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -319,6 +319,12 @@ python buildhistory_list_installed() {
>  
>      with open(pkgs_list_file, 'w') as pkgs_list:
>          pkgs_list.write(list_installed_packages(d, 'file'))
> +
> +    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
> +                                  "bh_installed_pkgs_deps.txt")
> +
> +    with open(pkgs_deps_file, 'w') as pkgs_deps:
> +        pkgs_deps.write(list_installed_packages(d, 'deps'))
>  }
>  
> 
> @@ -338,7 +344,8 @@ buildhistory_get_installed() {
>  
>  	# Produce dependency graph
>  	# First, quote each name to handle characters that cause issues for dot
> -	rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
> +	cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
> +		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
>  	# Change delimiter from pipe to -> and set style for recommend lines
>  	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
>  	# Add header, sorted and de-duped contents and footer and then delete the temp file

With this patch, a bitbake core-image-minimal -c populate_sdk resulted
in:

ERROR: Error executing a python function in /media/build1/poky/meta/recipes-core/images/core-image-minimal.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'buildhistory_list_installed', lineno: 18, function: <module>
     0014:    with open(pkgs_deps_file, 'w') as pkgs_deps:
     0015:        pkgs_deps.write(list_installed_packages(d, 'deps'))
     0016:
     0017:
 *** 0018:buildhistory_list_installed(d)
     0019:
File: 'buildhistory_list_installed', lineno: 9, function: buildhistory_list_installed
     0005:    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
     0006:                                  "bh_installed_pkgs.txt")
     0007:
     0008:    with open(pkgs_list_file, 'w') as pkgs_list:
 *** 0009:        pkgs_list.write(list_installed_packages(d, 'file'))
     0010:
     0011:    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
     0012:                                  "bh_installed_pkgs_deps.txt")
     0013:
File: '/media/build1/poky/meta/lib/oe/rootfs.py', lineno: 721, function: list_installed_packages
     0717:    if img_type == "rpm":
     0718:        return RpmPM(d,
     0719:                     rootfs_dir,
     0720:                     d.getVar('TARGET_VENDOR', True)
 *** 0721:                     ).list_installed(format)
     0722:    elif img_type == "ipk":
     0723:        return OpkgPM(d,
     0724:                      rootfs_dir,
     0725:                      d.getVar("IPKGCONF_TARGET", True),
File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 854, function: list_installed
     0850:            pkg = line.split()[0]
     0851:            arch = line.split()[1]
     0852:            ver = line.split()[2]
     0853:            pkgorigin = line.split()[3]
 *** 0854:            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
     0855:
     0856:            if format == "arch":
     0857:                output.append('%s %s' % (new_pkg, new_arch))
     0858:            elif format == "file":
File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 476, function: _pkg_translate_smart_to_oe
     0472:
     0473:            if found == 1 and fixed_arch == fixed_cmp_arch:
     0474:                break
     0475:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
 *** 0476:        return new_pkg, new_arch
     0477:
     0478:    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
     0479:        for arch in feed_archs:
     0480:            arch = arch.replace('-', '_')
Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment

ERROR: Function failed: buildhistory_list_installed
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.d



