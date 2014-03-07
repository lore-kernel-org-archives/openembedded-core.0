Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE9F6F641
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:35:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 22:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,606,1389772800"; d="scan'208";a="493980632"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2014 22:35:58 -0800
Date: Fri, 7 Mar 2014 08:35:57 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140307063553.GA21125@lpalcu-linux>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
	<9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
	<1394142938.12327.18.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1394142938.12327.18.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Fri, 07 Mar 2014 06:36:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2014 at 09:55:38PM +0000, Richard Purdie wrote:
> On Wed, 2014-03-05 at 14:39 +0200, Laurentiu Palcu wrote:
> > Call the new python routines.
> > 
> > [YOCTO #5904]
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/classes/buildhistory.bbclass |    9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> > index ef4135b..01b0082 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -319,6 +319,12 @@ python buildhistory_list_installed() {
> >  
> >      with open(pkgs_list_file, 'w') as pkgs_list:
> >          pkgs_list.write(list_installed_packages(d, 'file'))
> > +
> > +    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
> > +                                  "bh_installed_pkgs_deps.txt")
> > +
> > +    with open(pkgs_deps_file, 'w') as pkgs_deps:
> > +        pkgs_deps.write(list_installed_packages(d, 'deps'))
> >  }
> >  
> > 
> > @@ -338,7 +344,8 @@ buildhistory_get_installed() {
> >  
> >  	# Produce dependency graph
> >  	# First, quote each name to handle characters that cause issues for dot
> > -	rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
> > +	cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
> > +		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
> >  	# Change delimiter from pipe to -> and set style for recommend lines
> >  	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
> >  	# Add header, sorted and de-duped contents and footer and then delete the temp file
> 
> With this patch, a bitbake core-image-minimal -c populate_sdk resulted
No, not quite. The bug appears to be in
RpmPM._pkg_translate_smart_to_oe(), which none of my patches touched.

CCing Hongxu.

laurentiu

> in:
> 
> ERROR: Error executing a python function in /media/build1/poky/meta/recipes-core/images/core-image-minimal.bb:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'buildhistory_list_installed', lineno: 18, function: <module>
>      0014:    with open(pkgs_deps_file, 'w') as pkgs_deps:
>      0015:        pkgs_deps.write(list_installed_packages(d, 'deps'))
>      0016:
>      0017:
>  *** 0018:buildhistory_list_installed(d)
>      0019:
> File: 'buildhistory_list_installed', lineno: 9, function: buildhistory_list_installed
>      0005:    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
>      0006:                                  "bh_installed_pkgs.txt")
>      0007:
>      0008:    with open(pkgs_list_file, 'w') as pkgs_list:
>  *** 0009:        pkgs_list.write(list_installed_packages(d, 'file'))
>      0010:
>      0011:    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
>      0012:                                  "bh_installed_pkgs_deps.txt")
>      0013:
> File: '/media/build1/poky/meta/lib/oe/rootfs.py', lineno: 721, function: list_installed_packages
>      0717:    if img_type == "rpm":
>      0718:        return RpmPM(d,
>      0719:                     rootfs_dir,
>      0720:                     d.getVar('TARGET_VENDOR', True)
>  *** 0721:                     ).list_installed(format)
>      0722:    elif img_type == "ipk":
>      0723:        return OpkgPM(d,
>      0724:                      rootfs_dir,
>      0725:                      d.getVar("IPKGCONF_TARGET", True),
> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 854, function: list_installed
>      0850:            pkg = line.split()[0]
>      0851:            arch = line.split()[1]
>      0852:            ver = line.split()[2]
>      0853:            pkgorigin = line.split()[3]
>  *** 0854:            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
>      0855:
>      0856:            if format == "arch":
>      0857:                output.append('%s %s' % (new_pkg, new_arch))
>      0858:            elif format == "file":
> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 476, function: _pkg_translate_smart_to_oe
>      0472:
>      0473:            if found == 1 and fixed_arch == fixed_cmp_arch:
>      0474:                break
>      0475:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
>  *** 0476:        return new_pkg, new_arch
>      0477:
>      0478:    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
>      0479:        for arch in feed_archs:
>      0480:            arch = arch.replace('-', '_')
> Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment
> 
> ERROR: Function failed: buildhistory_list_installed
> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.d
> 
> 

