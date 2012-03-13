Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7bDS-0005aJ-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 00:33:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2012 16:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128649958"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 16:24:32 -0700
Message-ID: <4F5FD730.6060705@linux.intel.com>
Date: Tue, 13 Mar 2012 16:24:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
	<de0b611934064b68e5eccec92a8e76eba7bb30ba.1331642569.git.xiaofeng.yan@windriver.com>
In-Reply-To: <de0b611934064b68e5eccec92a8e76eba7bb30ba.1331642569.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/7] package_rpm: Add srpm function to this bbclass
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
X-List-Received-Date: Tue, 13 Mar 2012 23:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 05:52 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Add a new function to archive source, patches and logs to a source rpm
> package. Every source rpm package will be deployed to
> ${DEPLOY_DIR}/sources/deploy-srpm.
>
> [YOCTO #1977]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/classes/package_rpm.bbclass |   63 ++++++++++++++++++++++++++++++++++++++
>   1 files changed, 63 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 68313ec..b261a0e 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -6,6 +6,7 @@ RPM="rpm"
>   RPMBUILD="rpmbuild"
>
>   PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
> +PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
>
>   python package_rpm_fn () {
>   	d.setVar('PKGFN', d.getVar('PKG'))
> @@ -475,6 +476,37 @@ python write_specfile () {
>   	import textwrap
>   	import oe.packagedata
>
> +	# append information for logs and patches to %prep
> +	def add_prep(d,spec_files_bottom):
> +		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +			spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
> +			spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
> +			spec_files_bottom.append('')
> +
> +	# get the name of tarball for sources, patches and logs
> +	def get_tarballs(d):
> +		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +			sourcelist=[]
> +			workdir = d.getVar('WORKDIR',True)
> +			print os.listdir(workdir)
> +			for source in os.listdir(workdir):
> +				if 'tar.gz' in source:
> +					sourcelist.append(source)
> +			return sourcelist

What happens here is there are some other tar.gz file in the WORKDIR? 
Is there a way to ensure you just get the tarballs you are looking for?
> +
> +	# append the name of tarball to key word 'SOURCE' in xxx.spec.
> +	def tail_source(d,source_list=[],patch_list=None):
> +		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +			source_number = 0
> +			patch_number = 0
> +			for source in source_list:
> +				spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
> +				source_number += 1
> +			if patch_list:
> +				for patch in patch_list:
> +					print_deps(patch, "Patch" + str(patch_number), spec_preamble_top, d)
> +					patch_number += 1
> +
>   	# We need a simple way to remove the MLPREFIX from the package name,
>   	# and dependency information...
>   	def strip_multilib(name, d):
> @@ -707,6 +739,8 @@ python write_specfile () {
>   			spec_preamble_bottom.append('License: %s' % splitlicense)
>   		spec_preamble_bottom.append('Group: %s' % splitsection)
>
> +		source_list = get_tarballs(d)
> +		tail_source(d,source_list,None)
>   		# Replaces == Obsoletes&&  Provides
>   		if splitrreplaces and splitrreplaces.strip() != "":
>   			for dep in splitrreplaces.split(','):
> @@ -786,6 +820,7 @@ python write_specfile () {
>   		del localdata
>   		bb.utils.unlockfile(lf)
>
> +	add_prep(d,spec_files_bottom)
>   	spec_preamble_top.append('Summary: %s' % srcsummary)
>   	spec_preamble_top.append('Name: %s' % srcname)
>   	spec_preamble_top.append('Version: %s' % srcversion)
> @@ -900,6 +935,25 @@ python write_specfile () {
>   python do_package_rpm () {
>   	import os
>
> +	def creat_srpm_dir(d):
> +		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +			licenses = d.getVar('LICENSE', 1).replace('&', '|')
> +			licenses = licenses.replace('(', '').replace(')', '')
> +			clean_licenses = ""
> +			for x in licenses.split():
> +				if x.strip() == '' or x == 'CLOSED':
What about "Proprietary"
> +					continue
> +				if x != "|":
> +					clean_licenses += x
> +				if '|' in clean_licenses:
> +					clean_licenses = clean_licenses.replace('|','')
> +
Maybe this spinet should be a function in license.bbclass? Maybe it's 
there already, or is this too RPM specific?

> +			pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
> +			pkgwritesrpmdir = pkgwritesrpmdir + '/' + clean_licenses
> +			bb.mkdirhier(pkgwritesrpmdir)
> +			os.chmod(pkgwritesrpmdir, 0755)
> +			return pkgwritesrpmdir
> +
>   	# We need a simple way to remove the MLPREFIX from the package name,
>   	# and dependency information...
>   	def strip_multilib(name, d):
> @@ -1015,8 +1069,17 @@ python do_package_rpm () {
>   	cmd = cmd + " --define 'debug_package %{nil}'"
>   	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>   	cmd = cmd + " --define '_tmppath " + workdir + "'"
> +	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		cmdsrpm = cmd + " --define '_sourcedir " + workdir + "' --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
> +		cmdsrpm = 'fakeroot ' + cmdsrpm + " -bs " + outspecfile
>   	cmd = cmd + " -bb " + outspecfile
>
> +	# Build the source rpm package !
> +	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		d.setVar('SBUILDSPEC', cmdsrpm + "\n")
> +		d.setVarFlag('SBUILDSPEC', 'func', '1')
> +		bb.build.exec_func('SBUILDSPEC', d)
> +
>   	# Build the rpm package!
>   	d.setVar('BUILDSPEC', cmd + "\n")
>   	d.setVarFlag('BUILDSPEC', 'func', '1')


