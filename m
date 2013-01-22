Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Txhqq-0007Dp-6v
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 18:41:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2013 09:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="250777657"
Received: from unknown (HELO [10.255.15.40]) ([10.255.15.40])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2013 09:26:04 -0800
Message-ID: <50FECBAC.90307@linux.intel.com>
Date: Tue, 22 Jan 2013 09:26:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Kevin Strasser <kevin.strasser@linux.intel.com>
References: <cover.1358463028.git.kevin.strasser@linux.intel.com>
	<5a984e485eb1b568d4fdaa82675dbc5d5e77d8a9.1358463028.git.kevin.strasser@linux.intel.com>
In-Reply-To: <5a984e485eb1b568d4fdaa82675dbc5d5e77d8a9.1358463028.git.kevin.strasser@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver: remove create_diff_gz
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
X-List-Received-Date: Tue, 22 Jan 2013 17:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2013 02:55 PM, Kevin Strasser wrote:
> create_diff_gz creates a diff file of the entire 'S' directory.
> This file isn't needed and is bloating the archiver output directory.

Why is the diff file not needed?  This was requested by the community at 
some point, is the diff including object and binaries?  Can we exclude 
those instead?

Have you been talking with muhammad_shakeel@mentor.com, who is also 
doing work in the archiver?

Sau!

> Also, cleaning up some comments.
>
> Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
> ---
>   meta/classes/archive-configured-source.bbclass |   17 +++----
>   meta/classes/archive-original-source.bbclass   |   17 +++----
>   meta/classes/archive-patched-source.bbclass    |   17 +++----
>   meta/classes/archiver.bbclass                  |   62 ++----------------------
>   4 files changed, 25 insertions(+), 88 deletions(-)
>
> diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
> index 1eaaf4c..415d9c1 100644
> --- a/meta/classes/archive-configured-source.bbclass
> +++ b/meta/classes/archive-configured-source.bbclass
> @@ -1,17 +1,14 @@
> -# This file is for getting archiving packages with configured
> -# sources(archive ${S} after configure stage), logs(archive 'temp' after
> -# package_write_rpm), dump data and creating diff file(get all
> -# environment variables and functions in building and mapping all
> -# content in ${S} including patches to xxx.diff.gz. All archived
> -# packages will be deployed in ${DEPLOY_DIR}/sources
> +# Archive configured sources (${S} after do_configure), patches, dump data,
> +# scripts (.bb and .inc files), logs ('temp' before do_package_write_rpm).
> +# All archived packages will be deployed in ${DEPLOY_DIR}/sources.
>
>   inherit archiver
>
> -# Get archiving package with configured sources including patches
> +# Archive configured sources and patches
>   do_configure[postfuncs] += "do_archive_configured_sources "
>
> -# Get archiving package with temp(logs) and scripts(.bb and inc files)
> +# Archive scripts (.bb and .inc files) and logs (temp)
>   do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
>
> -# Get dump date and create diff file
> -do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
> +# Get dump data
> +do_package_write_rpm[postfuncs] += "do_dumpdata "
> diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
> index 1b3f8d0..a42a508 100644
> --- a/meta/classes/archive-original-source.bbclass
> +++ b/meta/classes/archive-original-source.bbclass
> @@ -1,17 +1,14 @@
> -# This file is for getting archiving packages with original
> -# sources(archive ${S} after unpack stage), patches, logs(archive 'temp'
> -# after package_write_rpm), dump data and creating diff file(get all
> -# environment variables and functions in building and mapping all
> -# content in ${S} including patches to xxx.diff.gz. All archived packages
> -# will be deployed in ${DEPLOY_DIR}/sources
> +# Archive original sources (${S} after do_unpack), patches, dump data
> +# scripts (.bb and .inc files), and logs ('temp' before do_package_write_rpm).
> +# All archived packages will be deployed in ${DEPLOY_DIR}/sources.
>
>   inherit archiver
>
> -# Get original sources archiving package with patches
> +# Archive original sources and patches
>   do_unpack[postfuncs] += "do_archive_original_sources_patches "
>
> -# Get archiving package with temp(logs) and scripts(.bb and inc files)
> +# Archive scripts (.bb and .inc files) and logs (temp)
>   do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
>
> -# Get dump date and create diff file
> -do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
> +# Get dump data
> +do_package_write_rpm[postfuncs] += "do_dumpdata "
> diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
> index 40b2dcb..36598c0 100644
> --- a/meta/classes/archive-patched-source.bbclass
> +++ b/meta/classes/archive-patched-source.bbclass
> @@ -1,17 +1,14 @@
> -# This file is for getting archiving packages with patched
> -# sources(archive ${S} before do_patch stage), logs(archive 'temp' after
> -# package_write_rpm), dump data and creating diff file(get all
> -# environment variables and functions in building and mapping all
> -# content in ${S} including patches to xxx.diff.gz. All archived
> -# packages will be deployed in ${DEPLOY_DIR}/sources
> +# Archive patched sources (${S} after do_patch), patches, dump data,
> +# scripts (.bb and .inc files), and logs ('temp' before do_package_write_rpm).
> +# All archived packages will be deployed in ${DEPLOY_DIR}/sources.
>
>   inherit archiver
>
> -# Get archiving package with patched sources including patches
> +# Archive patched sources and patches
>   do_patch[postfuncs] += "do_archive_patched_sources "
>
> -# Get archiving package with logs(temp) and scripts(.bb and .inc files)
> +# Archive scripts (.bb and .inc files) and logs (temp)
>   do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
>
> -# Get dump date and create diff file
> -do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
> +# Get dump data
> +do_package_write_rpm[postfuncs] += "do_dumpdata "
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index a4a2158..611c8f2 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -1,10 +1,5 @@
> -# ex:ts=4:sw=4:sts=4:et
> -# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> -#
> -# This file is used for archiving sources, patches, and logs to a
> -# tarball.  It also output building environment to xxx.dump.data and
> -# create xxx.diff.gz to record all content in ${S} to a diff file.
> -#
> +# This file is used for archiving sources, patches, scripts, and logs
> +# to a tarball. It also outputs the build environment to xxx.dump.data.
>
>   ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
>   ARCHIVE_TYPE ?= "tar srpm"
> @@ -435,7 +430,7 @@ def archive_scripts_logs(d):
>       else:
>           store_package(d, tarlog)
>
> -def dumpdata(d):
> +python do_dumpdata(){
>       """
>       dump environment to "${P}-${PR}.showdata.dump" including all
>       kinds of variables and functions when running a task
> @@ -464,49 +459,7 @@ def dumpdata(d):
>           if bb.data.getVarFlag(e, 'python', d):
>               f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
>       f.close()
> -
> -def create_diff_gz(d):
> -    """
> -    creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for
> -    mapping all content in 's' including patches to  xxx.diff.gz
> -    """
> -    import shutil
> -    import subprocess
> -
> -    if tar_filter(d):
> -        return
> -    work_dir = d.getVar('WORKDIR', True)
> -    exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
> -    pf = d.getVar('PF', True)
> -    licenses = get_licenses(d)
> -    target_sys = d.getVar('TARGET_SYS', True)
> -    diff_dir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
> -    diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
> -
> -    f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
> -    for i in exclude_from:
> -        f.write(i)
> -        f.write("\n")
> -    f.close()
> -
> -    s=d.getVar('S', True)
> -    distro = d.getVar('DISTRO',True) or ""
> -    dest = s + '/' + distro + '/files'
> -    if not os.path.exists(dest):
> -        bb.mkdirhier(dest)
> -    for i in os.listdir(os.getcwd()):
> -        if os.path.isfile(i):
> -            try:
> -                shutil.copy(i, dest)
> -            except IOError:
> -                subprocess.call('fakeroot cp -rf ' + i + " " + dest, shell=True)
> -
> -    bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
> -    cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
> -    d.setVar('DIFF', cmd + "\n")
> -    d.setVarFlag('DIFF', 'func', '1')
> -    bb.build.exec_func('DIFF', d)
> -    shutil.rmtree(s + '.org', ignore_errors=True)
> +}
>
>   # This function will run when user want to get tarball for sources and
>   # patches after do_unpack
> @@ -532,13 +485,6 @@ python do_archive_scripts_logs(){
>       archive_scripts_logs(d)
>   }
>
> -# This function will run when user want to know what variable and
> -# functions in a running task are and also can get a diff file including
> -# all content a package should include.
> -python do_dumpdata_create_diff_gz(){
> -    dumpdata(d)
> -    create_diff_gz(d)
> -}
>
>   # This functions prepare for archiving "linux-yocto" because this
>   # package create directory 's' before do_patch instead of after
>


