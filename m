Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SCfCM-00020q-7o
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:49:07 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Mar 2012 15:38:57 -0700
Received: by lahi5 with SMTP id i5so215437lah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 15:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=lu/2cfEJcesPU4PuDZWBiirkUEQmQHH2KLPBqNwadZ0=;
	b=dJhMcj5PbGj7ysvQjoQa2KY5QqkrIQR0d8VquI0HkxCN3BAopMojOYtSF7YhOcDdbT
	PxsYKRuEF+KdqEc9W049v08iN1etKMjEHdLEM9G7kU1l4HpBEiEC+VsP3+Mp+aL8Rftk
	EUIJ5nFqYMtZdFtFM+79rsnn+vKkgoHncY+EtEAZ/d4Os5NY3Tbsv0nT6fcgi4yn7myq
	eUx5p13NThWd0+DtREFYCK2rTVvCmPEY/fjcPpncLwqehyRYWVze2ZvWN8xs4X6v7FEi
	78V9t/+oXCsFK66SWbJ4iLU7Obg/cbqDWBx3Zlz0CCUv5fLYHS03Tnl9frFQ9NwT0yGg
	bc3Q==
MIME-Version: 1.0
Received: by 10.152.132.6 with SMTP id oq6mr20599942lab.44.1332887933347; Tue,
	27 Mar 2012 15:38:53 -0700 (PDT)
Received: by 10.112.112.99 with HTTP; Tue, 27 Mar 2012 15:38:53 -0700 (PDT)
In-Reply-To: <3af1340dbc4b0d234532a63de88aed8e203bc09a.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
	<3af1340dbc4b0d234532a63de88aed8e203bc09a.1332814325.git.xiaofeng.yan@windriver.com>
Date: Tue, 27 Mar 2012 15:38:53 -0700
Message-ID: <CAPhnLPCRh72JkwNVJQ5grfDu_jd20YJ=eu9iyaLmc=V31+waAQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmM/XORH9naaPnX0XVcb0WGUhus80w3sYkN+Had0NVPiEzTNcyoDLIVXVZkksLpujJaFBW3
Subject: Re: [PATCH 5/9] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 27 Mar 2012 22:49:07 -0000
Content-Type: multipart/alternative; boundary=f46d0433a0facae93604bc4127a0

--f46d0433a0facae93604bc4127a0
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 26, 2012 at 7:24 PM, Xiaofeng Yan <xiaofeng.yan@windriver.com>wrote:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> 1 Archive sources in ${S} in the different stage
>  (do_unpack,do_patch,do_configure).
> 2 Archive patches including series
> 3 Archive logs including scripts (.bb and .inc files)
> 4 dump environment resources which show all variable and functions
>  used to xxx.showdata.dump when running a task
> 5 dump all content in 's' including patches to file xxx.diff.gz
>
> All archiving packages  will be deployed to ${DEPLOY_DIR}/sources/
>
> [YOCTO #1977]
>
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/classes/archiver.bbclass |  460
> +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 460 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/archiver.bbclass
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> new file mode 100644
> index 0000000..471430e
> --- /dev/null
> +++ b/meta/classes/archiver.bbclass
> @@ -0,0 +1,460 @@
> +# This file is used for archiving sources ,patches,and logs to tarball.
> +# It also output building environment to xxx.dump.data and create
> xxx.diff.gz to record
> +# all content in ${S} to a diff file.
> +
> +EXCLUDE_FROM ?= ".pc autom4te.cache"
> +ARCHIVE_TYPE ?= "TAR SRPM"
> +DISTRO ?= "poky"
> +PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
> +
> +def parse_var(d,var):
> +       ''' parse variable like ${PV}  in "require xxx_${PV}.inc"  to a
> real value. for example, change "require xxx_${PV}.inc" to "require
> xxx_1.2.inc" '''
> +       import re
> +       pat = re.compile('.*\$({(.*)}).*')
> +       if '$' not in var and '/' not in var:
> +               return var
> +       else:
> +               if '/' in var:
> +                       return [i for i in var.split('/') if
> i.endswith('.inc')][0]
> +               elif '$' in  var:
> +                       m = pat.match(var)
> +                       patstr = '\$' + m.group(1)
> +                       var_str = m.group(2)
> +                       return re.sub(patstr,d.getVar(var_str,True),var)
> +               else:
> +                       return var
> +
> +def get_bb_inc(d):
> +       '''create a directory "script-logs" including .bb and .inc file in
> ${WORKDIR}'''
> +       import re
> +       import os
> +       import shutil
> +
> +       bbinc = []
> +       pat=re.compile('require\s*([^\s]*\.*)(.*)')
> +       file_dir = d.getVar('FILE', True)
> +       bbdir = os.path.dirname(file_dir)
> +       work_dir = d.getVar('WORKDIR', True)
> +       os.chdir(work_dir)
> +       bb.mkdirhier("script-logs")
> +       os.chdir(bbdir)
> +       bbfile = os.path.basename(file_dir)
> +       bbinc.append(bbfile)
> +
> +       def get_inc (file):
> +               f = open(file,'r')
> +               for line in f.readlines():
> +                       if 'require' not  in line:
> +                               bbinc.append(file)
> +                       else:
> +                               try:
> +                                       incfile = pat.match(line).group(1)
> +                                       incfile = parse_var(d,incfile)
> +                                       bbinc.append(incfile)
> +                                       get_inc(incfile)
> +                               except (IOError,AttributeError):
> +                                       pass
> +       get_inc(bbfile)
> +       os.chdir(work_dir)
> +       for root, dirs, files in os.walk(bbdir):
> +               for file in bbinc:
> +                       if file in files:
> +                               shutil.copy(root + '/' +
> file,'script-logs')
> +       oe.path.copytree('temp', 'script-logs')
> +       return work_dir + '/script-logs'
> +
> +def get_all_patches(d):
> +       '''copy patches and series file to a pointed directory which will
> be archived to tarball in ${WORKDIR}'''
> +       import shutil
> +
> +       src_patches=[]
> +       pf = d.getVar('PF', True)
> +       work_dir = d.getVar('WORKDIR', True)
> +       s = d.getVar('S',True)
> +       dest = os.path.join(work_dir, pf + '-patches')
> +       shutil.rmtree(dest, ignore_errors=True)
> +       bb.mkdirhier(dest)
> +
> +       src_uri = d.getVar('SRC_URI', 1).split()
> +       fetch = bb.fetch2.Fetch(src_uri, d)
> +       locals = (fetch.localpath(url) for url in fetch.urls)
> +       for local in locals:
> +               src_patches.append(local)
> +       if not cmp(work_dir,s):
> +               tmp_list = src_patches
> +       else:
> +               tmp_list = src_patches[1:]
> +
> +       for patch in tmp_list:
> +               try:
> +                       shutil.copy(patch,dest)
> +               except IOError:
> +                       if os.path.isdir(patch):
> +                               oe.path.copytree(patch,dest)
> +       return dest
> +
> +def get_applying_patches(d):
> +       """only copy applying patches to a pointed directory which will be
> archived to tarball"""
> +       import os
> +       import shutil
> +
> +
> +       pf = d.getVar('PF', True)
> +       work_dir = d.getVar('WORKDIR', True)
> +       dest = os.path.join(work_dir, pf + '-patches')
> +       shutil.rmtree(dest, ignore_errors=True)
> +       bb.mkdirhier(dest)
> +
> +
> +       patches = src_patches(d)
> +       for patch in patches:
> +               _, _, local, _, _, parm = bb.decodeurl(patch)
> +               if local:
> +                        shutil.copy(local,dest)
> +       return dest
> +
> +def not_tarball(d):
> +       '''packages including key words 'work-shared','native', 'task-'
> will be passed'''
> +       import os
> +
> +       workdir = d.getVar('WORKDIR',True)
> +       s = d.getVar('S',True)
> +       if 'work-shared' in s or 'task-' in workdir or 'native' in workdir:
> +               return True
> +       else:
> +               return False
> +
> +def get_source_from_downloads(d,middle_name):
> +       '''copy tarball of $P to $WORKDIR when this tarball exists in
> $DL_DIR'''
> +       if middle_name in 'patched' 'configured':
> +               return
> +       pf = d.getVar('PF', True)
> +       dl_dir = d.getVar('DL_DIR',True)
> +       try:
> +               source = os.path.basename(d.getVar('SRC_URI',
> 1).split()[0])
> +               os.chdir(dl_dir)
> +               if os.path.exists(source) and not os.path.isdir(source):
> +                       return source
> +       except (IndexError, OSError):
> +               pass
> +
> +def archive_sources_from_directory(d,middle_name):
> +       '''archive sources codes tree to tarball when tarball of $P
> doesn't exist in $DL_DIR'''
> +       import tarfile
> +       import shutil
> +
> +       s = d.getVar('S',True)
> +       workdir=d.getVar('WORKDIR', True)
> +       PF = d.getVar('PF',True)
> +       tarname = PF + '-' + middle_name + ".tar.gz"
> +
> +       if os.path.exists(s) and s is not workdir:
> +               sourcedir = os.path.basename(s)
> +               tarbase = os.path.dirname(s)
> +               if not sourcedir or os.path.dirname(tarbase) == workdir:
> +                       sourcedir = os.path.basename(os.path.dirname(s))
> +                       tarbase = os.path.dirname(os.path.dirname(s))
> +               os.chdir(tarbase)
> +       else:
> +               sourcedir = os.path.basename(s)
> +               if not os.path.exists(sourcedir):
> +                       os.mkdir(sourcedir)
> +               try:
> +                       for file in os.listdir(s):
> +                               if file is not 'temp' and file is not
> sourcedir:
> +                                       shutil.copy(file,sourcedir)
> +               except (IOError,OSError):
> +                       pass
> +
> +       if (len(os.listdir(sourcedir))) != 0:
> +               tar = tarfile.open( tarname, "w:gz")
> +               tar.add(sourcedir)
> +               tar.close()
> +               if cmp(workdir,os.path.dirname(s)) and not
> os.path.exists(workdir + '/' + tarname):
> +                       shutil.move(os.path.dirname(s) + '/' +
> tarname,workdir)
> +       else:
> +               return
> +       return tarname
> +
> +def archive_sources(d,middle_name):
> +       '''copy tarball from $DL_DIR to $WORKDIR if have tarball, archive
> source codes tree in $WORKDIR if $P is directory instead of tarball'''
> +       import shutil
> +       work_dir = d.getVar('WORKDIR',True)
> +       file = get_source_from_downloads(d,middle_name)
> +       if file:
> +               shutil.copy(file,work_dir)
> +       else:
> +               file = archive_sources_from_directory(d,middle_name)
> +       return file
> +
> +
> +def archive_patches(d,patchdir,series):
> +       '''archive patches to tarball and also include series files if
> 'series' is True'''
> +       import tarfile
> +       import shutil
> +
> +       s = d.getVar('S',True)
> +       work_dir = d.getVar('WORKDIR', True)
> +       os.chdir(work_dir)
> +       patch_dir = os.path.basename(patchdir)
> +       tarname = patch_dir + ".tar.gz"
> +       if series  == 'all' and os.path.exists(s + '/patches/series'):
> +                       shutil.copy(s + '/patches/series',patch_dir)
> +       tar = tarfile.open(tarname, "w:gz")
> +       tar.add(patch_dir)
> +       tar.close()
> +       shutil.rmtree(patch_dir, ignore_errors=True)
> +       return tarname
> +
> +def select_archive_patches(d,option):
> +       '''select to archive all patches including non-applying and series
> or applying patches '''
> +       if option == "all":
> +               patchdir = get_all_patches(d)
> +       elif option == "applying":
> +               patchdir = get_applying_patches(d)
> +       try:
> +               os.rmdir(patchdir)
> +       except OSError:
> +                       tarpatch = archive_patches(d,patchdir,option)
> +                       return tarpatch
> +       return
> +
> +def archive_logs(d,logdir,bbinc=False):
> +       '''archive logs in temp to tarball and .bb and .inc files if bbinc
> is True '''
> +       import tarfile
> +       import shutil
> +
> +       log_dir = os.path.basename(logdir)
> +       pf = d.getVar('PF',True)
> +       tarname = pf + '-' + log_dir + ".tar.gz"
> +       tar = tarfile.open(tarname, "w:gz")
> +       tar.add(log_dir)
> +       tar.close()
> +       if bbinc:
> +               shutil.rmtree(log_dir, ignore_errors=True)
> +       return tarname
> +
> +def get_licenses(d):
> +       '''get licenses for running .bb file'''
> +       licenses = d.getVar('LICENSE', 1).replace('&', '|')
> +       licenses = licenses.replace('(', '').replace(')', '')
> +       clean_licenses = ""
> +       for x in licenses.split():
> +               if x.strip() == '' or x == 'CLOSED':
> +                       continue
> +               if x != "|":
> +                       clean_licenses += x
>

ACKing what Chris said, please look at the license parser for this. Also of
note, please look at how we also handle naming variations within LICENSE
via SPDXLICENSEMAP (look at license.bbclass).

+       if '|' in clean_licenses:
> +               clean_licenses = clean_licenses.replace('|','')
> +       return clean_licenses
> +
> +
> +def move_tarball_deploy(d,tarball_list):
> +       '''move tarball in location to ${DEPLOY_DIR}/sources'''
> +       import shutil
> +
> +       if tarball_list is []:
> +               return
> +       target_sys = d.getVar('TARGET_SYS', True)
> +       pf = d.getVar('PF', True)
> +       licenses = get_licenses(d)
> +       tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' +
> target_sys + '/' + licenses + '/' + pf
>

What happens here when LICENSE = "GPLv2.0+ & LGPLv2.0"? get_licenses will
return GPLv2.0+LGPLv2.0 and you'll end up with:

DEPLOY_DIR/sources/<target_sys>/GPLv2.0+LGPLv2.0

What I wouldn't mind seeing here is something like:
${DEPLOY_DIR}/sources/${PN}/tarball

and for each in LICENSE:
${DEPLOY_DIR}/sources/SPDXLICENSEMAP[${LICENSE}]/<symlink to
DEPLOY_DIR/sources/${PN}>

+       if not os.path.exists(tar_sources):
> +               bb.mkdirhier(tar_sources)
> +       for source in tarball_list:
> +               if source:
> +                       if os.path.exists(tar_sources + '/' + source):
> +                               os.remove(tar_sources + '/' + source)
> +                       shutil.move(source,tar_sources)
> +
> +def verify_var(d):
> +       '''check the type for archiving package('tar' or 'srpm')'''
> +       try:
> +               if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper()
> not in d.getVar('ARCHIVE_TYPE', True).split():
> +                       raise AttributeError
> +       except AttributeError:
> +                       bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is
> \'tar\' or \'srpm\', no other types")
> +
> +def store_package(d,package_name):
> +       '''store tarbablls name to file "tar-package"'''
> +       try:
> +               f = open(d.getVar('WORKDIR',True )+ '/tar-package','a')
> +               f.write(package_name + ' ')
> +               f.close()
> +       except IOError:
> +               pass
> +
> +def get_package(d):
> +       '''get tarballs name from "tar-package"'''
> +       try:
> +               os.chdir(d.getVar('WORKDIR', True))
> +               f = open('tar-package','r')
> +               line = list(set(f.readline().replace('\n','').split()))
> +               f.close()
> +               return line
> +       except IOError:
> +               pass
> +
> +
> +def archive_sources_patches(d,middle_name):
> +       '''archive sources and patches to tarball. middle_name will append
> strings ${middle_name} to ${PR} as middle name. for example,
> zlib-1.4.6-prepatch(middle_name).tar.gz '''
> +       import shutil
> +       verify_var(d)
> +       if not_tarball(d):
> +               return
> +
> +       source_tar_name = archive_sources(d,middle_name)
> +       if middle_name == "prepatch":
> +               if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() ==
> 'TRUE':
> +                       patch_tar_name = select_archive_patches(d,"all")
> +               elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper()
> == 'FALSE':
> +                       patch_tar_name =
> select_archive_patches(d,"applying")
> +               else:
> +                       bb.fatal("Please define
> 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")
> +       else:
> +               patch_tar_name = ''
> +
> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in
> 'SRPM':
> +               move_tarball_deploy(d,[source_tar_name,patch_tar_name])
> +       else:
> +               tarpackage = d.getVar('WORKDIR', True) + '/tar-package'
> +               if os.path.exists(tarpackage):
> +                       os.remove(tarpackage)
> +               for package in source_tar_name, patch_tar_name:
> +                       if package:
> +                               store_package(d,str(package) + ' ')
> +
> +def archive_scripts_logs(d):
> +       '''archive scripts and logs. scripts include .bb and .inc files
> and logs include stuff in "temp".'''
> +
> +       work_dir = d.getVar('WORKDIR', True)
> +       os.chdir(work_dir)
> +       source_archive_log_with_scripts =
> d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
> +       if source_archive_log_with_scripts == 'logs_with_scripts':
> +               logdir = get_bb_inc(d)
> +               tarlog = archive_logs(d,logdir,True)
> +       elif source_archive_log_with_scripts == 'logs':
> +               if os.path.exists('temp'):
> +                       tarlog = archive_logs(d,'temp',False)
> +       else:
> +               return
> +
> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in
> 'SRPM':
> +               move_tarball_deploy(d,[tarlog])
> +
> +       else:
> +               store_package(d,tarlog)
> +
> +def dumpdata(d):
> +       '''dump environment to "${P}-${PR}.showdata.dump" including all
> kinds of variables and functions when running a task'''
> +       workdir = bb.data.getVar('WORKDIR', d, 1)
> +       distro = bb.data.getVar('DISTRO', d, 1)
> +       s = d.getVar('S', True)
> +       pf = d.getVar('PF', True)
> +       target_sys = d.getVar('TARGET_SYS', True)
> +       licenses = get_licenses(d)
> +       dumpdir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys
> + '/' + licenses + '/' + pf
> +       if not os.path.exists(dumpdir):
> +               bb.mkdirhier(dumpdir)
> +
> +       dumpfile = os.path.join(dumpdir,
> bb.data.expand("${P}-${PR}.showdata.dump",d))
> +
> +       bb.note("Dumping metadata into '%s'" % dumpfile)
> +       f = open(dumpfile, "w")
> +       # emit variables and shell functions
> +        bb.data.emit_env(f, d, True)
> +       # emit the metadata which isnt valid shell
> +       for e in d.keys():
> +               if bb.data.getVarFlag(e, 'python', d):
> +                       f.write("\npython %s () {\n%s}\n" % (e,
> bb.data.getVar(e, d, 1)))
> +       f.close()
> +
> +def create_diff_gz(d):
> +       '''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for
> mapping all content in 's' including patches to  xxx.diff.gz'''
> +       import shutil
> +
> +       work_dir = d.getVar('WORKDIR', True)
> +       exclude_from = d.getVar('EXCLUDE_FROM', True).split()
> +       pf = d.getVar('PF', True)
> +       licenses = get_licenses(d)
> +       target_sys = d.getVar('TARGET_SYS', True)
> +       diff_dir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys
> + '/' + licenses + '/' + pf
> +       diff_file = os.path.join(diff_dir,
> bb.data.expand("${P}-${PR}.diff.gz",d))
> +       os.chdir(work_dir)
> +       f = open('temp/exclude-from-file', 'a')
> +       for i in exclude_from:
> +               f.write(i)
> +               f.write("\n")
> +       f.close()
> +
> +       s=d.getVar('S', True)
> +       distro = d.getVar('DISTRO',True)
> +       dest = s + '/' + distro + '/files'
> +       if not os.path.exists(dest):
> +               bb.mkdirhier(dest)
> +       for i in os.listdir(os.getcwd()):
> +               if os.path.isfile(i):
> +                       shutil.copy(i, dest)
> +
> +       bb.note("Creating .diff.gz in
> ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
> +       cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir +
> "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > "
> + diff_file
> +       d.setVar('DIFF', cmd + "\n")
> +       d.setVarFlag('DIFF', 'func', '1')
> +       bb.build.exec_func('DIFF', d)
> +       shutil.rmtree(s + '.org', ignore_errors=True)
> +
> +# This function will run when user want to get tarball for sources and
> patches after do_unpack
> +python do_archive_original_sources_patches(){
> +       archive_sources_patches(d,'prepatch')
> +}
> +
> +# This function will run when user want to get tarball for patched
> sources after do_patch
> +python do_archive_patched_sources(){
> +       archive_sources_patches(d,'patched')
> +}
> +
> +# This function will run when user want to get tarball for configured
> sources after do_configure
> +python do_archive_configured_sources(){
> +       archive_sources_patches(d,'configured')
> +}
> +
> +# This function will run when user want to get tarball for logs or both
> logs and scripts(.bb and .inc files)
> +python do_archive_scripts_logs(){
> +       archive_scripts_logs(d)
> +}
> +
> +# This function will run when user want to know what variable and
> functions in a running task are and also can get a diff file including
> +# all content a package should include.
> +python do_dumpdata_create_diff_gz(){
> +       dumpdata(d)
> +       create_diff_gz(d)
> +}
> +
> +# This functions prepare for archiving "linux-yocto" because this package
> create directory 's' before do_patch instead of after do_unpack.
> +# This is special control for archiving linux-yocto only.
> +python do_archive_linux_yocto(){
> +       s = d.getVar('S', True)
> +       if 'linux-yocto' in s:
> +               source_tar_name = archive_sources(d,'')
> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in
> 'SRPM':
> +               move_tarball_deploy(d,[source_tar_name,''])
> +}
> +do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
> +
> +# remove tarball for sources, patches and logs after creating srpm.
> +python do_remove_tarball(){
> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
> +               work_dir = d.getVar('WORKDIR', True)
> +               os.chdir(work_dir)
> +               try:
> +                       for file in os.listdir(os.getcwd()):
> +                               if file in get_package(d):
> +                                       os.remove(file)
> +                       os.remove('tar-package')
> +               except (TypeError,OSError):
> +                               pass
> +}
> +do_remove_taball[deptask] = "do_archive_scripts_logs"
> +do_package_write_rpm[postfuncs] += "do_remove_tarball "
> +export get_licenses
> +export get_package
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

--f46d0433a0facae93604bc4127a0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Mar 26, 2012 at 7:24 PM, Xiaofen=
g Yan <span dir=3D"ltr">&lt;<a href=3D"mailto:xiaofeng.yan@windriver.com">x=
iaofeng.yan@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
From: Xiaofeng Yan &lt;<a href=3D"mailto:xiaofeng.yan@windriver.com">xiaofe=
ng.yan@windriver.com</a>&gt;<br>
<br>
1 Archive sources in ${S} in the different stage<br>
 =A0(do_unpack,do_patch,do_configure).<br>
2 Archive patches including series<br>
3 Archive logs including scripts (.bb and .inc files)<br>
4 dump environment resources which show all variable and functions<br>
 =A0used to xxx.showdata.dump when running a task<br>
5 dump all content in &#39;s&#39; including patches to file xxx.diff.gz<br>
<br>
All archiving packages =A0will be deployed to ${DEPLOY_DIR}/sources/<br>
<br>
[YOCTO #1977]<br>
<br>
Signed-off-by: Xiaofeng Yan &lt;<a href=3D"mailto:xiaofeng.yan@windriver.co=
m">xiaofeng.yan@windriver.com</a>&gt;<br>
---<br>
=A0meta/classes/archiver.bbclass | =A0460 +++++++++++++++++++++++++++++++++=
++++++++<br>
=A01 files changed, 460 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 meta/classes/archiver.bbclass<br>
<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass<=
br>
new file mode 100644<br>
index 0000000..471430e<br>
--- /dev/null<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -0,0 +1,460 @@<br>
+# This file is used for archiving sources ,patches,and logs to tarball.<br=
>
+# It also output building environment to xxx.dump.data and create xxx.diff=
.gz to record<br>
+# all content in ${S} to a diff file.<br>
+<br>
+EXCLUDE_FROM ?=3D &quot;.pc autom4te.cache&quot;<br>
+ARCHIVE_TYPE ?=3D &quot;TAR SRPM&quot;<br>
+DISTRO ?=3D &quot;poky&quot;<br>
+PATCHES_ARCHIVE_WITH_SERIES =3D &#39;TRUE&#39;<br>
+<br>
+def parse_var(d,var):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39; parse variable like ${PV} =A0in &quot;require=
 xxx_${PV}.inc&quot; =A0to a real value. for example, change &quot;require =
xxx_${PV}.inc&quot; to &quot;require xxx_1.2.inc&quot; &#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import re<br>
+ =A0 =A0 =A0 pat =3D re.compile(&#39;.*\$({(.*)}).*&#39;)<br>
+ =A0 =A0 =A0 if &#39;$&#39; not in var and &#39;/&#39; not in var:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return var<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if &#39;/&#39; in var:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return [i for i in var.split(=
&#39;/&#39;) if i.endswith(&#39;.inc&#39;)][0]<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif &#39;$&#39; in =A0var:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m =3D pat.match(var)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patstr =3D &#39;\$&#39; + m.g=
roup(1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 var_str =3D m.group(2)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return re.sub(patstr,d.getVar=
(var_str,True),var)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return var<br>
+<br>
+def get_bb_inc(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;create a directory &quot;script-logs&quot; inc=
luding .bb and .inc file in ${WORKDIR}&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import re<br>
+ =A0 =A0 =A0 import os<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 bbinc =3D []<br>
+ =A0 =A0 =A0 pat=3Dre.compile(&#39;require\s*([^\s]*\.*)(.*)&#39;)<br>
+ =A0 =A0 =A0 file_dir =3D d.getVar(&#39;FILE&#39;, True)<br>
+ =A0 =A0 =A0 bbdir =3D os.path.dirname(file_dir)<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 bb.mkdirhier(&quot;script-logs&quot;)<br>
+ =A0 =A0 =A0 os.chdir(bbdir)<br>
+ =A0 =A0 =A0 bbfile =3D os.path.basename(file_dir)<br>
+ =A0 =A0 =A0 bbinc.append(bbfile)<br>
+<br>
+ =A0 =A0 =A0 def get_inc (file):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f =3D open(file,&#39;r&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for line in f.readlines():<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if &#39;require&#39; not =A0i=
n line:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bbinc.append(=
file)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 incfile =3D pat.match(line).group(1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 incfile =3D parse_var(d,incfile)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 bbinc.append(incfile)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 get_inc(incfile)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 except (IOErr=
or,AttributeError):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pass<br>
+ =A0 =A0 =A0 get_inc(bbfile)<br>
+ =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 for root, dirs, files in os.walk(bbdir):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for file in bbinc:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if file in files:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.copy(r=
oot + &#39;/&#39; + file,&#39;script-logs&#39;)<br>
+ =A0 =A0 =A0 oe.path.copytree(&#39;temp&#39;, &#39;script-logs&#39;)<br>
+ =A0 =A0 =A0 return work_dir + &#39;/script-logs&#39;<br>
+<br>
+def get_all_patches(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;copy patches and series file to a pointed dire=
ctory which will be archived to tarball in ${WORKDIR}&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 src_patches=3D[]<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;,True)<br>
+ =A0 =A0 =A0 dest =3D os.path.join(work_dir, pf + &#39;-patches&#39;)<br>
+ =A0 =A0 =A0 shutil.rmtree(dest, ignore_errors=3DTrue)<br>
+ =A0 =A0 =A0 bb.mkdirhier(dest)<br>
+<br>
+ =A0 =A0 =A0 src_uri =3D d.getVar(&#39;SRC_URI&#39;, 1).split()<br>
+ =A0 =A0 =A0 fetch =3D bb.fetch2.Fetch(src_uri, d)<br>
+ =A0 =A0 =A0 locals =3D (fetch.localpath(url) for url in fetch.urls)<br>
+ =A0 =A0 =A0 for local in locals:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 src_patches.append(local)<br>
+ =A0 =A0 =A0 if not cmp(work_dir,s):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp_list =3D src_patches<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp_list =3D src_patches[1:]<br>
+<br>
+ =A0 =A0 =A0 for patch in tmp_list:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.copy(patch,dest)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 except IOError:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.isdir(patch):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oe.path.copyt=
ree(patch,dest)<br>
+ =A0 =A0 =A0 return dest<br>
+<br>
+def get_applying_patches(d):<br>
+ =A0 =A0 =A0 &quot;&quot;&quot;only copy applying patches to a pointed dir=
ectory which will be archived to tarball&quot;&quot;&quot;<br>
+ =A0 =A0 =A0 import os<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 dest =3D os.path.join(work_dir, pf + &#39;-patches&#39;)<br>
+ =A0 =A0 =A0 shutil.rmtree(dest, ignore_errors=3DTrue)<br>
+ =A0 =A0 =A0 bb.mkdirhier(dest)<br>
+<br>
+<br>
+ =A0 =A0 =A0 patches =3D src_patches(d)<br>
+ =A0 =A0 =A0 for patch in patches:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 _, _, local, _, _, parm =3D bb.decodeurl(patc=
h)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if local:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shutil.copy(local,dest)<br=
>
+ =A0 =A0 =A0 return dest<br>
+<br>
+def not_tarball(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;packages including key words &#39;work-shared&=
#39;,&#39;native&#39;, &#39;task-&#39; will be passed&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import os<br>
+<br>
+ =A0 =A0 =A0 workdir =3D d.getVar(&#39;WORKDIR&#39;,True)<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;,True)<br>
+ =A0 =A0 =A0 if &#39;work-shared&#39; in s or &#39;task-&#39; in workdir o=
r &#39;native&#39; in workdir:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return True<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False<br>
+<br>
+def get_source_from_downloads(d,middle_name):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;copy tarball of $P to $WORKDIR when this tarba=
ll exists in $DL_DIR&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 if middle_name in &#39;patched&#39; &#39;configured&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 dl_dir =3D d.getVar(&#39;DL_DIR&#39;,True)<br>
+ =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 source =3D os.path.basename(d.getVar(&#39;SRC=
_URI&#39;, 1).split()[0])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(dl_dir)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.exists(source) and not os.path.isd=
ir(source):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return source<br>
+ =A0 =A0 =A0 except (IndexError, OSError):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pass<br>
+<br>
+def archive_sources_from_directory(d,middle_name):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;archive sources codes tree to tarball when tar=
ball of $P doesn&#39;t exist in $DL_DIR&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import tarfile<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;,True)<br>
+ =A0 =A0 =A0 workdir=3Dd.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 PF =3D d.getVar(&#39;PF&#39;,True)<br>
+ =A0 =A0 =A0 tarname =3D PF + &#39;-&#39; + middle_name + &quot;.tar.gz&qu=
ot;<br>
+<br>
+ =A0 =A0 =A0 if os.path.exists(s) and s is not workdir:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 sourcedir =3D os.path.basename(s)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarbase =3D os.path.dirname(s)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not sourcedir or os.path.dirname(tarbase) =
=3D=3D workdir:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sourcedir =3D os.path.basenam=
e(os.path.dirname(s))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarbase =3D os.path.dirname(o=
s.path.dirname(s))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(tarbase)<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 sourcedir =3D os.path.basename(s)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not os.path.exists(sourcedir):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.mkdir(sourcedir)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for file in os.listdir(s):<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if file is no=
t &#39;temp&#39; and file is not sourcedir:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 shutil.copy(file,sourcedir)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 except (IOError,OSError):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pass<br>
+<br>
+ =A0 =A0 =A0 if (len(os.listdir(sourcedir))) !=3D 0:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar =3D tarfile.open( tarname, &quot;w:gz&quo=
t;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar.add(sourcedir)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar.close()<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if cmp(workdir,os.path.dirname(s)) and not os=
.path.exists(workdir + &#39;/&#39; + tarname):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.move(os.path.dirname(s=
) + &#39;/&#39; + tarname,workdir)<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return<br>
+ =A0 =A0 =A0 return tarname<br>
+<br>
+def archive_sources(d,middle_name):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;copy tarball from $DL_DIR to $WORKDIR if have =
tarball, archive source codes tree in $WORKDIR if $P is directory instead o=
f tarball&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import shutil<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;,True)<br>
+ =A0 =A0 =A0 file =3D get_source_from_downloads(d,middle_name)<br>
+ =A0 =A0 =A0 if file:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.copy(file,work_dir)<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 file =3D archive_sources_from_directory(d,mid=
dle_name)<br>
+ =A0 =A0 =A0 return file<br>
+<br>
+<br>
+def archive_patches(d,patchdir,series):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;archive patches to tarball and also include se=
ries files if &#39;series&#39; is True&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import tarfile<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;,True)<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 patch_dir =3D os.path.basename(patchdir)<br>
+ =A0 =A0 =A0 tarname =3D patch_dir + &quot;.tar.gz&quot;<br>
+ =A0 =A0 =A0 if series =A0=3D=3D &#39;all&#39; and os.path.exists(s + &#39=
;/patches/series&#39;):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.copy(s + &#39;/patches=
/series&#39;,patch_dir)<br>
+ =A0 =A0 =A0 tar =3D tarfile.open(tarname, &quot;w:gz&quot;)<br>
+ =A0 =A0 =A0 tar.add(patch_dir)<br>
+ =A0 =A0 =A0 tar.close()<br>
+ =A0 =A0 =A0 shutil.rmtree(patch_dir, ignore_errors=3DTrue)<br>
+ =A0 =A0 =A0 return tarname<br>
+<br>
+def select_archive_patches(d,option):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;select to archive all patches including non-ap=
plying and series or applying patches &#39;&#39;&#39;<br>
+ =A0 =A0 =A0 if option =3D=3D &quot;all&quot;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchdir =3D get_all_patches(d)<br>
+ =A0 =A0 =A0 elif option =3D=3D &quot;applying&quot;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchdir =3D get_applying_patches(d)<br>
+ =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.rmdir(patchdir)<br>
+ =A0 =A0 =A0 except OSError:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarpatch =3D archive_patches(=
d,patchdir,option)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return tarpatch<br>
+ =A0 =A0 =A0 return<br>
+<br>
+def archive_logs(d,logdir,bbinc=3DFalse):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;archive logs in temp to tarball and .bb and .i=
nc files if bbinc is True &#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import tarfile<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 log_dir =3D os.path.basename(logdir)<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;,True)<br>
+ =A0 =A0 =A0 tarname =3D pf + &#39;-&#39; + log_dir + &quot;.tar.gz&quot;<=
br>
+ =A0 =A0 =A0 tar =3D tarfile.open(tarname, &quot;w:gz&quot;)<br>
+ =A0 =A0 =A0 tar.add(log_dir)<br>
+ =A0 =A0 =A0 tar.close()<br>
+ =A0 =A0 =A0 if bbinc:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.rmtree(log_dir, ignore_errors=3DTrue)<=
br>
+ =A0 =A0 =A0 return tarname<br>
+<br>
+def get_licenses(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;get licenses for running .bb file&#39;&#39;&#3=
9;<br>
+ =A0 =A0 =A0 licenses =3D d.getVar(&#39;LICENSE&#39;, 1).replace(&#39;&amp=
;&#39;, &#39;|&#39;)<br>
+ =A0 =A0 =A0 licenses =3D licenses.replace(&#39;(&#39;, &#39;&#39;).replac=
e(&#39;)&#39;, &#39;&#39;)<br>
+ =A0 =A0 =A0 clean_licenses =3D &quot;&quot;<br>
+ =A0 =A0 =A0 for x in licenses.split():<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if x.strip() =3D=3D &#39;&#39; or x =3D=3D &#=
39;CLOSED&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if x !=3D &quot;|&quot;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clean_licenses +=3D x<br></bl=
ockquote><div><br>ACKing what Chris said, please look at the license parser=
 for this. Also of note, please look at how we also handle naming variation=
s within LICENSE via SPDXLICENSEMAP (look at license.bbclass).<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ =A0 =A0 =A0 if &#39;|&#39; in clean_licenses:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clean_licenses =3D clean_licenses.replace(&#3=
9;|&#39;,&#39;&#39;)<br>
+ =A0 =A0 =A0 return clean_licenses<br>
+<br>
+<br>
+def move_tarball_deploy(d,tarball_list):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;move tarball in location to ${DEPLOY_DIR}/sour=
ces&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 if tarball_list is []:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return<br>
+ =A0 =A0 =A0 target_sys =3D d.getVar(&#39;TARGET_SYS&#39;, True)<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 licenses =3D get_licenses(d)<br>
+ =A0 =A0 =A0 tar_sources =3D d.getVar(&#39;DEPLOY_DIR&#39;, True) + &#39;/=
sources/&#39; + target_sys + &#39;/&#39; + licenses + &#39;/&#39; + pf<br><=
/blockquote><div><br>What happens here when LICENSE =3D &quot;GPLv2.0+ &amp=
; LGPLv2.0&quot;? get_licenses will return GPLv2.0+LGPLv2.0 and you&#39;ll =
end up with:<br>
<br>DEPLOY_DIR/sources/&lt;target_sys&gt;/GPLv2.0+LGPLv2.0<br><br>What I wo=
uldn&#39;t mind seeing here is something like:<br>${DEPLOY_DIR}/sources/${P=
N}/tarball<br><br>and for each in LICENSE:<br>${DEPLOY_DIR}/sources/SPDXLIC=
ENSEMAP[${LICENSE}]/&lt;symlink to DEPLOY_DIR/sources/${PN}&gt;<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ =A0 =A0 =A0 if not os.path.exists(tar_sources):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.mkdirhier(tar_sources)<br>
+ =A0 =A0 =A0 for source in tarball_list:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if source:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.exists(tar_sources=
 + &#39;/&#39; + source):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.remove(tar=
_sources + &#39;/&#39; + source)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.move(source,tar_source=
s)<br>
+<br>
+def verify_var(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;check the type for archiving package(&#39;tar&=
#39; or &#39;srpm&#39;)&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar(&#39;SOURCE_ARCHIVE_PACKAGE_TYPE&=
#39;, True).upper() not in d.getVar(&#39;ARCHIVE_TYPE&#39;, True).split():<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise AttributeError<br>
+ =A0 =A0 =A0 except AttributeError:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.fatal(&quot;\&quot;SOURCE_=
ARCHIVE_PACKAGE_TYPE\&quot; is \&#39;tar\&#39; or \&#39;srpm\&#39;, no othe=
r types&quot;)<br>
+<br>
+def store_package(d,package_name):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;store tarbablls name to file &quot;tar-package=
&quot;&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f =3D open(d.getVar(&#39;WORKDIR&#39;,True )+=
 &#39;/tar-package&#39;,&#39;a&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.write(package_name + &#39; &#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.close()<br>
+ =A0 =A0 =A0 except IOError:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pass<br>
+<br>
+def get_package(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;get tarballs name from &quot;tar-package&quot;=
&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(d.getVar(&#39;WORKDIR&#39;, True))<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f =3D open(&#39;tar-package&#39;,&#39;r&#39;)=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 line =3D list(set(f.readline().replace(&#39;\=
n&#39;,&#39;&#39;).split()))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.close()<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return line<br>
+ =A0 =A0 =A0 except IOError:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pass<br>
+<br>
+<br>
+def archive_sources_patches(d,middle_name):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;archive sources and patches to tarball. middle=
_name will append strings ${middle_name} to ${PR} as middle name. for examp=
le, zlib-1.4.6-prepatch(middle_name).tar.gz &#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import shutil<br>
+ =A0 =A0 =A0 verify_var(d)<br>
+ =A0 =A0 =A0 if not_tarball(d):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return<br>
+<br>
+ =A0 =A0 =A0 source_tar_name =3D archive_sources(d,middle_name)<br>
+ =A0 =A0 =A0 if middle_name =3D=3D &quot;prepatch&quot;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar(&#39;PATCHES_ARCHIVE_WITH_SERIES&=
#39;,True).upper() =3D=3D &#39;TRUE&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patch_tar_name =3D select_arc=
hive_patches(d,&quot;all&quot;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif d.getVar(&#39;PATCHES_ARCHIVE_WITH_SERIE=
S&#39;,True).upper() =3D=3D &#39;FALSE&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patch_tar_name =3D select_arc=
hive_patches(d,&quot;applying&quot;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.fatal(&quot;Please define =
&#39;PATCHES_ARCHIVE_WITH_SERIES&#39; is strings &#39;True&#39; or &#39;Fal=
se&#39; &quot;)<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 patch_tar_name =3D &#39;&#39;<br>
+<br>
+ =A0 =A0 =A0 if d.getVar(&#39;SOURCE_ARCHIVE_PACKAGE_TYPE&#39;, True).uppe=
r() not in &#39;SRPM&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 move_tarball_deploy(d,[source_tar_name,patch_=
tar_name])<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarpackage =3D d.getVar(&#39;WORKDIR&#39;, Tr=
ue) + &#39;/tar-package&#39;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.exists(tarpackage):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.remove(tarpackage)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for package in source_tar_name, patch_tar_nam=
e:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if package:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 store_package=
(d,str(package) + &#39; &#39;)<br>
+<br>
+def archive_scripts_logs(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;archive scripts and logs. scripts include .bb =
and .inc files and logs include stuff in &quot;temp&quot;.&#39;&#39;&#39;<b=
r>
+<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 source_archive_log_with_scripts =3D d.getVar(&#39;SOURCE_ARCH=
IVE_LOG_WITH_SCRIPTS&#39;, True)<br>
+ =A0 =A0 =A0 if source_archive_log_with_scripts =3D=3D &#39;logs_with_scri=
pts&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 logdir =3D get_bb_inc(d)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarlog =3D archive_logs(d,logdir,True)<br>
+ =A0 =A0 =A0 elif source_archive_log_with_scripts =3D=3D &#39;logs&#39;:<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.exists(&#39;temp&#39;):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tarlog =3D archive_logs(d,&#3=
9;temp&#39;,False)<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return<br>
+<br>
+ =A0 =A0 =A0 if d.getVar(&#39;SOURCE_ARCHIVE_PACKAGE_TYPE&#39;, True).uppe=
r() not in &#39;SRPM&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 move_tarball_deploy(d,[tarlog])<br>
+<br>
+ =A0 =A0 =A0 else:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 store_package(d,tarlog)<br>
+<br>
+def dumpdata(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;dump environment to &quot;${P}-${PR}.showdata.=
dump&quot; including all kinds of variables and functions when running a ta=
sk&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 workdir =3D bb.data.getVar(&#39;WORKDIR&#39;, d, 1)<br>
+ =A0 =A0 =A0 distro =3D bb.data.getVar(&#39;DISTRO&#39;, d, 1)<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;, True)<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 target_sys =3D d.getVar(&#39;TARGET_SYS&#39;, True)<br>
+ =A0 =A0 =A0 licenses =3D get_licenses(d)<br>
+ =A0 =A0 =A0 dumpdir =3D d.getVar(&#39;DEPLOY_DIR&#39;, True) + &#39;/sour=
ces/&#39; + target_sys + &#39;/&#39; + licenses + &#39;/&#39; + pf<br>
+ =A0 =A0 =A0 if not os.path.exists(dumpdir):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.mkdirhier(dumpdir)<br>
+<br>
+ =A0 =A0 =A0 dumpfile =3D os.path.join(dumpdir, bb.data.expand(&quot;${P}-=
${PR}.showdata.dump&quot;,d))<br>
+<br>
+ =A0 =A0 =A0 bb.note(&quot;Dumping metadata into &#39;%s&#39;&quot; % dump=
file)<br>
+ =A0 =A0 =A0 f =3D open(dumpfile, &quot;w&quot;)<br>
+ =A0 =A0 =A0 # emit variables and shell functions<br>
+ =A0 =A0 =A0 =A0bb.data.emit_env(f, d, True)<br>
+ =A0 =A0 =A0 # emit the metadata which isnt valid shell<br>
+ =A0 =A0 =A0 for e in d.keys():<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if bb.data.getVarFlag(e, &#39;python&#39;, d)=
:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.write(&quot;\npython %s () =
{\n%s}\n&quot; % (e, bb.data.getVar(e, d, 1)))<br>
+ =A0 =A0 =A0 f.close()<br>
+<br>
+def create_diff_gz(d):<br>
+ =A0 =A0 =A0 &#39;&#39;&#39;creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${=
PR}.diff.g gz for mapping all content in &#39;s&#39; including patches to =
=A0xxx.diff.gz&#39;&#39;&#39;<br>
+ =A0 =A0 =A0 import shutil<br>
+<br>
+ =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True)<br>
+ =A0 =A0 =A0 exclude_from =3D d.getVar(&#39;EXCLUDE_FROM&#39;, True).split=
()<br>
+ =A0 =A0 =A0 pf =3D d.getVar(&#39;PF&#39;, True)<br>
+ =A0 =A0 =A0 licenses =3D get_licenses(d)<br>
+ =A0 =A0 =A0 target_sys =3D d.getVar(&#39;TARGET_SYS&#39;, True)<br>
+ =A0 =A0 =A0 diff_dir =3D d.getVar(&#39;DEPLOY_DIR&#39;, True) + &#39;/sou=
rces/&#39; + target_sys + &#39;/&#39; + licenses + &#39;/&#39; + pf<br>
+ =A0 =A0 =A0 diff_file =3D os.path.join(diff_dir, bb.data.expand(&quot;${P=
}-${PR}.diff.gz&quot;,d))<br>
+ =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 f =3D open(&#39;temp/exclude-from-file&#39;, &#39;a&#39;)<br>
+ =A0 =A0 =A0 for i in exclude_from:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.write(i)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 f.write(&quot;\n&quot;)<br>
+ =A0 =A0 =A0 f.close()<br>
+<br>
+ =A0 =A0 =A0 s=3Dd.getVar(&#39;S&#39;, True)<br>
+ =A0 =A0 =A0 distro =3D d.getVar(&#39;DISTRO&#39;,True)<br>
+ =A0 =A0 =A0 dest =3D s + &#39;/&#39; + distro + &#39;/files&#39;<br>
+ =A0 =A0 =A0 if not os.path.exists(dest):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.mkdirhier(dest)<br>
+ =A0 =A0 =A0 for i in os.listdir(os.getcwd()):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if os.path.isfile(i):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutil.copy(i, dest)<br>
+<br>
+ =A0 =A0 =A0 bb.note(&quot;Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${P=
R}.diff.gz&quot;)<br>
+ =A0 =A0 =A0 cmd =3D &quot;LC_ALL=3DC TZ=3DUTC0 diff --exclude-from=3D&quo=
t; + work_dir + &quot;/temp/exclude-from-file -Naur &quot; + s + &#39;.org&=
#39; + &#39; &#39; + =A0s + &quot; | gzip -c &gt; &quot; + diff_file<br>
+ =A0 =A0 =A0 d.setVar(&#39;DIFF&#39;, cmd + &quot;\n&quot;)<br>
+ =A0 =A0 =A0 d.setVarFlag(&#39;DIFF&#39;, &#39;func&#39;, &#39;1&#39;)<br>
+ =A0 =A0 =A0 bb.build.exec_func(&#39;DIFF&#39;, d)<br>
+ =A0 =A0 =A0 shutil.rmtree(s + &#39;.org&#39;, ignore_errors=3DTrue)<br>
+<br>
+# This function will run when user want to get tarball for sources and pat=
ches after do_unpack<br>
+python do_archive_original_sources_patches(){<br>
+ =A0 =A0 =A0 archive_sources_patches(d,&#39;prepatch&#39;)<br>
+}<br>
+<br>
+# This function will run when user want to get tarball for patched sources=
 after do_patch<br>
+python do_archive_patched_sources(){<br>
+ =A0 =A0 =A0 archive_sources_patches(d,&#39;patched&#39;)<br>
+}<br>
+<br>
+# This function will run when user want to get tarball for configured sour=
ces after do_configure<br>
+python do_archive_configured_sources(){<br>
+ =A0 =A0 =A0 archive_sources_patches(d,&#39;configured&#39;)<br>
+}<br>
+<br>
+# This function will run when user want to get tarball for logs or both lo=
gs and scripts(.bb and .inc files)<br>
+python do_archive_scripts_logs(){<br>
+ =A0 =A0 =A0 archive_scripts_logs(d)<br>
+}<br>
+<br>
+# This function will run when user want to know what variable and function=
s in a running task are and also can get a diff file including<br>
+# all content a package should include.<br>
+python do_dumpdata_create_diff_gz(){<br>
+ =A0 =A0 =A0 dumpdata(d)<br>
+ =A0 =A0 =A0 create_diff_gz(d)<br>
+}<br>
+<br>
+# This functions prepare for archiving &quot;linux-yocto&quot; because thi=
s package create directory &#39;s&#39; before do_patch instead of after do_=
unpack.<br>
+# This is special control for archiving linux-yocto only.<br>
+python do_archive_linux_yocto(){<br>
+ =A0 =A0 =A0 s =3D d.getVar(&#39;S&#39;, True)<br>
+ =A0 =A0 =A0 if &#39;linux-yocto&#39; in s:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 source_tar_name =3D archive_sources(d,&#39;&#=
39;)<br>
+ =A0 =A0 =A0 if d.getVar(&#39;SOURCE_ARCHIVE_PACKAGE_TYPE&#39;, True).uppe=
r() not in &#39;SRPM&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 move_tarball_deploy(d,[source_tar_name,&#39;&=
#39;])<br>
+}<br>
+do_kernel_checkout[postfuncs] +=3D &quot;do_archive_linux_yocto &quot;<br>
+<br>
+# remove tarball for sources, patches and logs after creating srpm.<br>
+python do_remove_tarball(){<br>
+ =A0 =A0 =A0 if d.getVar(&#39;SOURCE_ARCHIVE_PACKAGE_TYPE&#39;, True).uppe=
r() =3D=3D &#39;SRPM&#39;:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 work_dir =3D d.getVar(&#39;WORKDIR&#39;, True=
)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(work_dir)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 try:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for file in os.listdir(os.get=
cwd()):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if file in ge=
t_package(d):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 os.remove(file)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.remove(&#39;tar-package&#3=
9;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 except (TypeError,OSError):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pass<br>
+}<br>
+do_remove_taball[deptask] =3D &quot;do_archive_scripts_logs&quot;<br>
+do_package_write_rpm[postfuncs] +=3D &quot;do_remove_tarball &quot;<br>
+export get_licenses<br>
+export get_package<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.0.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Elizabeth=
 Flanagan<br>Yocto Project<br>Build and Release<br>

--f46d0433a0facae93604bc4127a0--
