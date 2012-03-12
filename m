Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S7AX3-0008GZ-Gx
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 20:03:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2CIt0iY014826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 11:55:01 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 12 Mar 2012 11:55:00 -0700
Message-ID: <4F5E4682.1030208@windriver.com>
Date: Mon, 12 Mar 2012 13:54:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
	<0a62458fb91efc29de71daaf0feef58baa1e7f54.1330771239.git.xiaofeng.yan@windriver.com>
In-Reply-To: <0a62458fb91efc29de71daaf0feef58baa1e7f54.1330771239.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 2/3] archiver.bbclass: archive sources, patches, logs to tarball
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
X-List-Received-Date: Mon, 12 Mar 2012 19:03:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Apologies for the very late review...  see comments below.  All in all it looks 
good.  But I have not applied it and tried it yet.

On 3/3/12 4:54 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Support the following functions in this bbclass:
>
> 1 Archive sources in ${S} in the different stage to tarball (do_unpack,do_patch,do_configure).
> 2 Archive patches including series to tarball
> 3 Archive logs including scripts (.bb and .inc files) to tarball
> 4 dump environment resources which show all variable and functions to be
>    used to xxx.showdata.dump when running a task
> 5 dump all content in 's' including patches to file xxx.diff.gz
>
> All of tarballs will be deployed to ${DEPLOY_DIR}/sources/
>
> [#YOCTO 1977]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/classes/archiver.bbclass |  393 +++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 393 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/archiver.bbclass
>
...

> +def verify_var(d):
> +	'''check the type for archiving package('tar' or 'srpm')'''
> +	try:
> +		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).split():
> +			raise AttributeError	
> +	except AttributeError:
> +			bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no other types")

Error message should be something like:

bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" should be \'tar\' or '\srpm\'")

...

> +def archive_sources_patches(d,middle_name):
> +	'''archive sources and patches to tarball. middle_name will append strings ${middle_name} to ${PR} as middle name. for example, zlib-1.4.6-prepatch(middle_name).tar.gz '''
> +	verify_var(d)	
> +	if not_tarball(d):
> +		return
> +	
> +	source_tar_name = archive_sources(d,middle_name)
> +	if middle_name == "prepatch":
> +		if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'TRUE':
> +			patch_tar_name = select_archive_patches(d,"all")
> +		elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'FALSE':
> +			patch_tar_name = select_archive_patches(d,"applying")
> +		else:
> +			bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")

Instead of an explicit TRUE/FALSE setting, does it make sense for one to be the 
default?  I'd suspect in this case "True" is the better default, but I'm not 
completely sure.

> +	else:
> +		patch_tar_name = ''
> +
> +	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
> +		move_tarball_deploy(d,[source_tar_name,patch_tar_name])
> +
> +def archive_sources_patches_logs_copyleft(d,middle_name):
> +	'''archive source, patches and logs according to the variable "COPYLEFT_COMPLIANCE", If this variable is 'True', then archive the packages for copy-left, or else archive all packages'''
> +	verify_var(d)	
> +	if not_tarball(d):
> +		return
> +	copyleft_compliance = d.getVar('COPYLEFT_COMPLIANCE', True)
> +	if copyleft_compliance is None:
> +		archive_sources_patches(d,middle_name)
> +	elif copyleft_compliance.upper() == 'TRUE' and archive_copyleft(d):
> +		archive_sources_patches(d,middle_name)

I'm not sure I understand what is happening in this patch.  The way I read it:

If COPYLEFT_COMPLIANCE is -not- set, then we archive..  otherwise if it is set 
(true), and the copyleft item was inherited we also archive?

But I'm not sure I understand why this set of checks.


...

> +def dumpdata(d):
> +	'''dump environment to "${P}-${PR}.showdata.dump" including all kinds of varibale and functions when running a task'''

Simple typo above, should be "variable".

...

> +# This functions prepare for archiving "linux-yocto" because this package create directory 's' before do_patch instead of after do_unpack.
> +# This is special control for archiving linux-yocto only.
> +python do_archive_linux_yocto(){
> +	s = d.getVar('S', True)
> +	if 'linux-yocto' in s:
> +		source_tar_name = archive_sources(d,'')
> +	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
> +		move_tarball_deploy(d,[source_tar_name,''])
> +}

Is there something we can change in linux-yocto to make the standard methods 
work?  I'm hesitant to put special logic in the archiver class for a single 
package.  (Note, I'm more likely to think it's reasonable for the kernel's 
package then a random userspace package!)

> +do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
> +

Is the real issue that we want to run something just before do_patch, but we 
also want to let any arbitrary tasks between do_unpack and do_patch to run 
first?  Is there an alternative way to state this?  [or at least detect a 
situation where we haven't waited?]

> +# remove tarball for sources, patches and logs after creating srpm.
> +python do_remove_tarball(){
> +	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +		work_dir = d.getVar('WORKDIR', True)
> +		os.chdir(work_dir)
> +		for file in os.listdir(os.getcwd()):
> +			if '.tar.gz' in file:
> +				os.remove(file)
> +}
> +do_remove_taball[deptask] = "do_archive_scripts_logs"
> +do_package_write_rpm[postfuncs] += "do_remove_tarball "

Finally do we really need to remove the tarball?  It can likely just stay 
around, when the user wipes out/cleans the WORKDIR it will go away on it's own?

--Mark


