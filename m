Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RkI4g-0005Rs-1V
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 17:27:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q09GKPHp028344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jan 2012 08:20:25 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Jan 2012 08:20:25 -0800
Message-ID: <4F0B13C9.6090703@windriver.com>
Date: Mon, 9 Jan 2012 10:20:25 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
	<6161b957ee773a9a5b293ac9373ca0be07bb5665.1326003199.git.xiaofeng.yan@windriver.com>
In-Reply-To: <6161b957ee773a9a5b293ac9373ca0be07bb5665.1326003199.git.xiaofeng.yan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tar_archive.bbclass: Package source codes and log files to tar package
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
X-List-Received-Date: Mon, 09 Jan 2012 16:27:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/12 1:11 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Source rpm package needs tar package as its source codes. log files \
> are required as a part of source (description in bug 1655).
> So log files need be packaged as tar package too.
> User can select two types of package, the first is tar package and the second is src.rpm package.
> The option item is defined in conf/local.conf.(ARCHIVE_TYPE ?= "SRPM"(default) or ARCHIVE_TYPE ?= "TARGZ")
> if the option is the first type, then tar_archive.bbclass should be inherited in an suitable position.
> The tar packages(sources.tar.gz and log.tar.gz) will be created in workdir.
> if the option is the second type, then tar_archive.bbclass shoud be inherited in package_rpm.bbclass.
> The sources rpm packages will be created in workdir/deploy-srpm when building.
> The following command can ship all of source packages(src.rpm or tar.gz) to build/tmp/deploy/sources
> $bitbake core-image-sato -c copysources
>
> [YOCTO #1655]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/classes/tar_archive.bbclass |  216 ++++++++++++++++++++++++++++++++++++++
>   1 files changed, 216 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/tar_archive.bbclass
>

...

> +addtask do_logarchive after do_install before do_package
> +
> +# This is used for fixing the "Bad owner/group: ..."
> +# Set owner and group for patches, log.tar.gz and ${PF}.tar.gz to "root"
> +do_setowngroup[dirs] = "${WORKDIR}"
> +fakeroot python do_setowngroup(){
> +	import os
> +	
> +	if not d.getVar('ARCHIVE_TYPE', True):
> +		return
> +	bb.build.exec_func('not_srpm', d)	
> +	if d.getVar('NOTSRPM', True):
> +		return
> +	bb.build.exec_func('get_patches', d)
> +        srcpatches = d.getVar('PLIST',True)
> +	for patch in srcpatches:
> +		os.system('chown root.root' + ' ' + patch)
> +	os.system('chown root.root' + ' ' + "log.tar.gz")
> +	os.system('chown root.root' + ' ' + d.getVar('PF', True) + ".tar.gz")
> +}

Instead of the above during the creation of the tar archive, you should be able 
to pass in --owner=root  --group=root and tar will ignore the on-disk 
permissions and set it based on the arguments.

> +addtask do_setowngroup after do_logarchive before do_package
> +
> +# Copy source package to build/tmp/deploy/sources
> +do_copysources[dirs] = "${PWD}/tmp/work"
> +python do_copysources (){
> +	import os
> +	
> +	archive_type = d.getVar('ARCHIVE_TYPE', True)
> +	pwd = d.getVar('PWD', True)
> +	machine = d.getVar('MACHINE', True)
> +	target_sys = d.getVar('TARGET_SYS', True)
> +	target_os = d.getVar('TARGET_OS', True)
> +	target_vendor = d.getVar('TARGET_VENDOR', True)
> +	tune_pkgarch = d.getVar('TUNE_PKGARCH', True)
> +	multimach_host_sys = d.getVar('MULTIMACH_HOST_SYS', True)
> +	all = 'all' + target_vendor + '-' + 'linux'
> +	target = tune_pkgarch + target_vendor + '-' + target_os
> +	srpmdir=pwd + '/tmp/deploy/' + 'sources' + '/' + machine
> +	
> +	if not os.path.exists(srpmdir):
> +		os.makedirs(srpmdir)
> +	global_work = pwd + '/tmp' + '/work'
> +	os.chdir(global_work)
> +	for dirs in multimach_host_sys, all, target:
> +		localdir = srpmdir + '/' + dirs
> +		if not os.path.exists(localdir):
> +			os.mkdir(localdir)
> +		os.chdir(dirs)
> +		if archive_type == 'SRPM':
> +			os.system('cp */deploy-srpm/*/*.src.rpm ' + localdir)
> +		elif archive_type == 'TARGZ':
> +			for dir in os.listdir('.'):
> +				if os.path.isdir(dir):
> +					os.chdir(dir)
> +					if not os.path.exists(dir):
> +						os.mkdir(localdir + '/' + dir)
> +					os.system('cp *.gz ' + localdir + '/' + dir)
> +					os.chdir('../')
> +		else:
> +			return
> +		os.chdir(global_work)
> +}
> +addtask do_copysources  after do_rootfs
> +
> +EXPORT_FUNCTIONS do_archive do_logarchive do_setowngroup do_copysources



