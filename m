Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSLgp-0006AK-4P
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 07:13:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2012 22:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142177665"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2012 22:03:28 -0700
Message-ID: <4FAB4C20.5050804@linux.intel.com>
Date: Wed, 09 May 2012 22:03:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336617615-25713-1-git-send-email-kergoth@gmail.com>
	<1336617615-25713-2-git-send-email-kergoth@gmail.com>
In-Reply-To: <1336617615-25713-2-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/2] archiver.bbclass: leverage variable typing support
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
X-List-Received-Date: Thu, 10 May 2012 05:13:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 07:40 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> This makes use of variable typing to avoid reinventing the wheel in that way
> and adds default values for a couple of said variables. It also changes
> PATCHES_ARCHIVE_WITH_SERIES to use ?= rather than =.
>
> Further, doing this fixes a single bug that occurs in many places:
>
>      if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
>
> This is performing a substring search. It should have done "== 'SRPM'"", or if
> there *were* multiple options for that case (there aren't), it would do "not
> in ['SRPM']" or similar.
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/classes/archiver.bbclass    |   45 +++++++++++++++++--------------------
>   meta/classes/package_rpm.bbclass |   12 +++++-----
>   2 files changed, 27 insertions(+), 30 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 59b58f4..844dbf8 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -2,10 +2,19 @@
>   # It also output building environment to xxx.dump.data and create xxx.diff.gz to record
>   # all content in ${S} to a diff file.
>
> -ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
> -ARCHIVE_TYPE ?= "TAR SRPM"
>   DISTRO ?= "poky"
> -PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
> +ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
> +
> +PATCHES_ARCHIVE_WITH_SERIES ?= "true"
> +PATCHES_ARCHIVE_WITH_SERIES[type] = "boolean"
> +
> +SOURCE_ARCHIVE_PACKAGE_TYPE ?= "tar"
> +SOURCE_ARCHIVE_PACKAGE_TYPE[type] = "choice"
> +SOURCE_ARCHIVE_PACKAGE_TYPE[choices] = "tar srpm"
> +

Great patch! But:

Moving this here results in the following error if archiver.bbclass is 
not inherit'ed by default!

ERROR: SOURCE_ARCHIVE_PACKAGE_TYPE: No type specified. Valid types: 
regex, float, list, choice, boolean, integer

Sau!


> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= "logs_with_scripts"
> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS[type] = "choice"
> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS[choices] = "none logs logs_with_scripts"
>
>   def get_bb_inc(d):
>   	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
> @@ -253,14 +262,6 @@ def move_tarball_deploy(d,tarball_list):
>   				os.remove(os.path.join(tar_sources,source))
>   			shutil.move(os.path.join(work_dir,source),tar_sources)
>
> -def check_archiving_type(d):
> -	'''check the type for archiving package('tar' or 'srpm')'''
> -	try:
> -		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).split():
> -			raise AttributeError	
> -	except AttributeError:
> -			bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no other types")
> -
>   def store_package(d,package_name):
>   	'''store tarbablls name to file "tar-package"'''
>   	try:
> @@ -287,24 +288,21 @@ def archive_sources_patches(d,stage_name):
>   	'''archive sources and patches to tarball. stage_name will append strings ${stage_name} to ${PR} as middle name. for example, zlib-1.4.6-prepatch(stage_name).tar.gz '''
>   	import shutil
>
> -	check_archiving_type(d)	
>   	if not_tarball(d):
>   		return
>   	
>   	source_tar_name = archive_sources(d,stage_name)
>   	if stage_name == "prepatch":
> -		if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'TRUE':
> +		if oe.data.typed_value('PATCHES_ARCHIVE_WITH_SERIES', d):
>   			patch_tar_name = select_archive_patches(d,"all")
> -		elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'FALSE':
> -			patch_tar_name = select_archive_patches(d,"applying")
>   		else:
> -			bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")
> +			patch_tar_name = select_archive_patches(d,"applying")
>   	else:
>   		patch_tar_name = ''
>   	
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'tar':
>   		move_tarball_deploy(d,[source_tar_name,patch_tar_name])
> -	else:
> +	else: # srpm
>   		tarpackage = os.path.join(d.getVar('WORKDIR', True),'tar-package')
>   		if os.path.exists(tarpackage):
>   			os.remove(tarpackage)
> @@ -317,7 +315,7 @@ def archive_scripts_logs(d):
>
>   	work_dir = d.getVar('WORKDIR', True)
>   	temp_dir = os.path.join(work_dir,'temp')
> -	source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
> +	source_archive_log_with_scripts = oe.data.typed_value('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', d)
>   	if source_archive_log_with_scripts == 'logs_with_scripts':
>   		logdir = get_bb_inc(d)
>   		tarlog = archive_logs(d,logdir,True)
> @@ -326,10 +324,9 @@ def archive_scripts_logs(d):
>   			tarlog = archive_logs(d,temp_dir,False)
>   	else:
>   		return
> -		
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
> -		move_tarball_deploy(d,[tarlog])
>
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'tar':
> +		move_tarball_deploy(d,[tarlog])
>   	else:
>   		store_package(d,tarlog)
>
> @@ -427,14 +424,14 @@ python do_archive_linux_yocto(){
>   	s = d.getVar('S', True)
>   	if 'linux-yocto' in s:
>   		source_tar_name = archive_sources(d,'')
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'tar':
>   		move_tarball_deploy(d,[source_tar_name,''])
>   }
>   do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
>
>   # remove tarball for sources, patches and logs after creating srpm.
>   python do_remove_tarball(){
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   		work_dir = d.getVar('WORKDIR', True)
>   		try:
>   			for file in os.listdir(os.getcwd()):
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 623069e..8033a37 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -505,19 +505,19 @@ python write_specfile () {
>
>   	# append information for logs and patches to %prep
>   	def add_prep(d,spec_files_bottom):
> -		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   			spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
>   			spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
>   			spec_files_bottom.append('')
>
>   	# get the name of tarball for sources, patches and logs
>   	def get_tarballs(d):
> -		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   			return get_package(d)
>
>   	# append the name of tarball to key word 'SOURCE' in xxx.spec.
>   	def tail_source(d,source_list=[],patch_list=None):
> -		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   			source_number = 0
>   			patch_number = 0
>   			for source in source_list:
> @@ -956,7 +956,7 @@ python do_package_rpm () {
>   	import os
>   	
>   	def creat_srpm_dir(d):
> -		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   			clean_licenses = get_licenses(d)
>   			pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
>   			pkgwritesrpmdir = pkgwritesrpmdir + '/' + clean_licenses
> @@ -1083,13 +1083,13 @@ python do_package_rpm () {
>   	cmd = cmd + " --define 'debug_package %{nil}'"
>   	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>   	cmd = cmd + " --define '_tmppath " + workdir + "'"
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   		cmdsrpm = cmd + " --define '_sourcedir " + workdir + "' --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
>   		cmdsrpm = 'fakeroot ' + cmdsrpm + " -bs " + outspecfile
>   	cmd = cmd + " -bb " + outspecfile
>
>       # Build the source rpm package !
> -	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +	if oe.data.typed_value('SOURCE_ARCHIVE_PACKAGE_TYPE', d) == 'srpm':
>   		d.setVar('SBUILDSPEC', cmdsrpm + "\n")
>   		d.setVarFlag('SBUILDSPEC', 'func', '1')
>   		bb.build.exec_func('SBUILDSPEC', d)


