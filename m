Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7nTg-00048v-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:38:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2ECU6ZL014797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2012 05:30:06 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 14 Mar 2012 05:30:06 -0700
Message-ID: <4F608F56.9030602@windriver.com>
Date: Wed, 14 Mar 2012 20:30:14 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
	<ca015bef2cddea0610500a7ba0a6c27c73a77fbf.1331642569.git.xiaofeng.yan@windriver.com>
	<4F6008FD.1020306@linux.intel.com>
In-Reply-To: <4F6008FD.1020306@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2ECU6ZL014797
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Wed, 14 Mar 2012 12:38:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8814=E6=97=A5 10:57, Saul Wold wrote:
> On 03/13/2012 05:52 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> 1 Archive sources in ${S} in the different stage=20
>> (do_unpack,do_patch,do_configure).
>> 2 Archive patches including series
>> 3 Archive logs including scripts (.bb and .inc files)
>> 4 dump environment resources which show all variable and
>> functions used to xxx.showdata.dump when running a task
>> 5 dump all content in 's' including patches to file xxx.diff.gz
>>
>> All archiving packages will be deployed to ${DEPLOY_DIR}/sources/
>>
>> [#YOCTO 1977]
>>
> Xiaofeng,
>
> I am making a first pass on this, there might be more, after I use it=20
> to create archives.
>
> Sau!
>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/classes/archiver.bbclass | 421=20
>> +++++++++++++++++++++++++++++++++++++++++
>> 1 files changed, 421 insertions(+), 0 deletions(-)
>> create mode 100644 meta/classes/archiver.bbclass
>>
>> diff --git a/meta/classes/archiver.bbclass=20
>> b/meta/classes/archiver.bbclass
>> new file mode 100644
>> index 0000000..95e870d
>> --- /dev/null
>> +++ b/meta/classes/archiver.bbclass
>> @@ -0,0 +1,421 @@
>> +# This file is used for archiving sources ,patches,and logs to tarbal=
l.
>> +# It also output building environment to xxx.dump.data and create=20
>> xxx.diff.gz to record
>> +# all content in ${S} to a diff file.
>> +
>> +EXCLUDE_FROM ?=3D ".pc autom4te.cache"
>> +ARCHIVE_TYPE ?=3D "TAR SRPM"
>> +DISTRO ?=3D "poky"
>> +
>> +def parse_var(d,var):
>> + ''' parse variable like ${PV} in "require xxx_${PV}.inc" to a real=20
>> value. for example, change "require xxx_${PV}.inc" to "require=20
>> xxx_1.2.inc" '''
>> + import re
>> + pat =3D re.compile('.*\$({(.*)}).*')
>> + if '$' not in var and '/' not in var:
>> + return var
>> + else:
>> + if '/' in var:
>> + return [i for i in var.split('/') if i.endswith('.inc')][0]
>> + elif '$' in var:
>> + m =3D pat.match(var)
>> + patstr =3D '\$' + m.group(1)
>> + var_str =3D m.group(2)
>> + return re.sub(patstr,d.getVar(var_str,True),var)
>> + else:
>> + return var
>> +
>> +
>> +def get_bb_inc(d):
>> + '''create a directory "script-logs" including .bb and .inc file in=20
>> ${WORKDIR}'''
>> + import re
>> + import os
>> + import shutil
>> +
>> + bbinc =3D []
>> + pat=3Dre.compile('require\s*([^\s]*\.*)(.*)')
>> + file_dir =3D d.getVar('FILE', True)
>> + bbdir =3D os.path.dirname(file_dir)
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + os.chdir(work_dir)
>> + bb.mkdirhier("script-logs")
>> + os.chdir(bbdir)
>> + bbfile =3D os.path.basename(file_dir)
>> + bbinc.append(bbfile)
>> +
>> + def get_inc (file):
>> + f =3D open(file,'r')
>> + for line in f.readlines():
>> + if 'require' not in line:
>> + bbinc.append(file)
>> + else:
>> + try:
>> + incfile =3D pat.match(line).group(1)
>> + incfile =3D parse_var(d,incfile)
>> + bbinc.append(incfile)
>> + get_inc(incfile)
>> + except AttributeError:
>> + pass
>> + get_inc(bbfile)
>> + os.chdir(work_dir)
>> + for root, dirs, files in os.walk(bbdir):
>> + for file in bbinc:
>> + if file in files:
>> + shutil.copy(root + '/' + file,'script-logs')
>> + oe.path.copytree('temp', 'script-logs')
>> + return work_dir + '/script-logs'
>> +
>> +def get_all_patches(d):
>> + '''copy patches and series file to a pointed directory which will=20
>> be archived to tarball in ${WORKDIR}'''
>> + import shutil
>> +
>> + src_patches=3D[]
>> + pf =3D d.getVar('PF', True)
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + dest =3D os.path.join(work_dir, pf + '-patches')
>> + shutil.rmtree(dest, ignore_errors=3DTrue)
>> + bb.mkdirhier(dest)
>> +
>> + src_uri =3D d.getVar('SRC_URI', 1).split()
>> + fetch =3D bb.fetch2.Fetch(src_uri, d)
>> + locals =3D (fetch.localpath(url) for url in fetch.urls)
>> + for local in locals:
>> + src_patches.append(local)
>> + for patch in src_patches[1:]:
>> + shutil.copy(patch,dest)
>> + return dest
>> +
>> +def get_applying_patches(d):
>> + """only copy applying patches to a pointed directory which will be=20
>> archived to tarball"""
>> + import os
>> + import shutil
>> +
>> +
>> + pf =3D d.getVar('PF', True)
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + dest =3D os.path.join(work_dir, pf + '-patches')
>> + shutil.rmtree(dest, ignore_errors=3DTrue)
>> + bb.mkdirhier(dest)
>> +
>> +
>> + patches =3D src_patches(d)
>> + for patch in patches:
>> + _, _, local, _, _, parm =3D bb.decodeurl(patch)
>> + if local:
>> + shutil.copy(local,dest)
>> + return dest
>> +
>> +def not_tarball(d):
>> + '''packages including key words 'work-shared','native', 'task-'=20
>> will be passed'''
>> + import os
>> +
>> + workdir =3D d.getVar('WORKDIR',True)
>> + s =3D d.getVar('S',True)
>> + if 'work-shared' in s or 'task-' in workdir or 'native' in workdir:
>> + return True
>> + else:
>> + return False
>> +
>> +def archive_sources(d,middle_name):
>> + '''archive sources codes tree to tarball'''
>> + import tarfile
>> + import shutil
>> +
>> + s =3D d.getVar('S',True)
>> + workdir=3Dd.getVar('WORKDIR', True)
>> + PF =3D d.getVar('PF',True)
>> + tarname =3D PF + '-' + middle_name + ".tar.gz"
>> +
>> + if os.path.exists(s) and s is not workdir:
>> + sourcedir =3D os.path.basename(s)
>> + tarbase =3D os.path.dirname(s)
>> + if not sourcedir or os.path.dirname(tarbase) =3D=3D workdir:
>> + sourcedir =3D os.path.basename(os.path.dirname(s))
>> + tarbase =3D os.path.dirname(os.path.dirname(s))
>> + os.chdir(tarbase)
>> + else:
>> + sourcedir =3D os.path.basename(s)
>> + if not os.path.exists(sourcedir):
>> + os.mkdir(sourcedir)
>> + try:
>> + for file in os.listdir(s):
>> + if file is not 'temp' and file is not sourcedir:
>> + shutil.copy(file,sourcedir)
>> + except (IOError,OSError):
>> + pass
>> +
>> +
>> + if (len(os.listdir(sourcedir))) !=3D 0:
>> + tar =3D tarfile.open( tarname, "w:gz")
>> + tar.add(sourcedir)
>> + tar.close()
>> + if cmp(workdir,os.path.dirname(s)) and not os.path.exists(workdir +=20
>> '/' + tarname):
>> + shutil.move(os.path.dirname(s) + '/' + tarname,workdir)
>> + else:
>> + return
>> + return tarname
>> +
>> +def archive_patches(d,patchdir,series):
>> + '''archive patches to tarball and also include series files if=20
>> 'series' is True'''
>> + import tarfile
>> + import shutil
>> +
>> + s =3D d.getVar('S',True)
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + os.chdir(work_dir)
>> + patch_dir =3D os.path.basename(patchdir)
>> + tarname =3D patch_dir + ".tar.gz"
>> + if series =3D=3D 'all' and os.path.exists(s + '/patches/series'):
>> + shutil.copy(s + '/patches/series',patch_dir)
>> + tar =3D tarfile.open(tarname, "w:gz")
>> + tar.add(patch_dir)
>> + tar.close()
>> + shutil.rmtree(patch_dir, ignore_errors=3DTrue)
>> + return tarname
>> +
>> +def select_archive_patches(d,option):
>> + '''select to archive all patches including non-applying and series=20
>> or applying patches '''
>> + if option =3D=3D "all":
>> + patchdir =3D get_all_patches(d)
>> + elif option =3D=3D "applying":
>> + patchdir =3D get_applying_patches(d)
>> + try:
>> + os.rmdir(patchdir)
>> + except OSError:
>> + tarpatch =3D archive_patches(d,patchdir,option)
>> + return tarpatch
>> + return
>> +
>> +def archive_logs(d,logdir,bbinc=3DFalse):
>> + '''archive logs in temp to tarball and .bb and .inc files if bbinc=20
>> is True '''
>> + import tarfile
>> + import shutil
>> +
>> + log_dir =3D os.path.basename(logdir)
>> + pf =3D d.getVar('PF',True)
>> + tarname =3D pf + '-' + log_dir + ".tar.gz"
>> + tar =3D tarfile.open(tarname, "w:gz")
>> + tar.add(log_dir)
>> + tar.close()
>> + if bbinc:
>> + shutil.rmtree(log_dir, ignore_errors=3DTrue)
>> + return tarname
>> +
>> +def get_licenses(d):
>> + '''get licenses for running .bb file'''
>> + licenses =3D d.getVar('LICENSE', 1).replace('&', '|')
>> + licenses =3D licenses.replace('(', '').replace(')', '')
>> + clean_licenses =3D ""
>> + for x in licenses.split():
>> + if x.strip() =3D=3D '' or x =3D=3D 'CLOSED':
>> + continue
>> + if x !=3D "|":
>> + clean_licenses +=3D x
>> + if '|' in clean_licenses:
>> + clean_licenses =3D clean_licenses.replace('|','')
>> + return clean_licenses
>> +
> This seems to be duplicated in your RPM code also? Move to=20
> licenses.bbclass maybe?
I will export this function in archiver.bbclass and reference this here.
>
>> +
>> +def move_tarball_deploy(d,tarball_list):
>> + '''move tarball in location to ${DEPLOY_DIR}/sources'''
>> + import shutil
>> +
>> + if tarball_list is []:
>> + return
>> + target_sys =3D d.getVar('TARGET_SYS', True)
>> + pf =3D d.getVar('PF', True)
>> + licenses =3D get_licenses(d)
>> + tar_sources =3D d.getVar('DEPLOY_DIR', True) + '/sources/' +=20
>> target_sys + '/' + licenses + '/' + pf
>> + if not os.path.exists(tar_sources):
>> + bb.mkdirhier(tar_sources)
>> + for source in tarball_list:
>> + if source:
>> + if os.path.exists(tar_sources + '/' + source):
>> + os.remove(tar_sources + '/' + source)
>> + shutil.move(source,tar_sources)
>> +
>> +def verify_var(d):
>> + '''check the type for archiving package('tar' or 'srpm')'''
>> + try:
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> d.getVar('ARCHIVE_TYPE', True).split():
>> + raise AttributeError
>> + except AttributeError:
>> + bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\',=20
>> no other types")
>> +
>> +def archive_copyleft(d):
>> + '''check if a package to archive is copy-left'''
>> + if bb.data.inherits_class('copyleft_compliance', d):
>> + included, reason =3D copyleft_should_include(d)
>> + if not included:
>> + return False
>> + return True
>> +def archive_sources_patches(d,middle_name):
>> + '''archive sources and patches to tarball. middle_name will append=20
>> strings ${middle_name} to ${PR} as middle name. for example,=20
>> zlib-1.4.6-prepatch(middle_name).tar.gz '''
>> + verify_var(d)
>> + if not_tarball(d):
>> + return
>> +
>> + source_tar_name =3D archive_sources(d,middle_name)
>> + if middle_name =3D=3D "prepatch":
>> + if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() =3D=3D 'TRUE=
':
>> + patch_tar_name =3D select_archive_patches(d,"all")
>> + elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() =3D=3D 'FA=
LSE':
>> + patch_tar_name =3D select_archive_patches(d,"applying")
>> + else:
>> + bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings=20
>> 'True' or 'False' ")
>> + else:
>> + patch_tar_name =3D ''
>> +
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> 'SRPM':
>> + move_tarball_deploy(d,[source_tar_name,patch_tar_name])
>> +
>> +def archive_sources_patches_logs_copyleft(d,middle_name):
>> + '''archive source, patches and according to the variable=20
>> "COPYLEFT_COMPLIANCE", If this variable is 'True', then archive the=20
>> packages for copy-left, or else archive all packages'''
>> + verify_var(d)
>> + if not_tarball(d):
>> + return
>> + copyleft_compliance =3D d.getVar('COPYLEFT_COMPLIANCE', True)
>> + if copyleft_compliance is None:
>> + archive_sources_patches(d,middle_name)
>> + elif copyleft_compliance.upper() =3D=3D 'TRUE' and archive_copyleft(=
d):
>> + archive_sources_patches(d,middle_name)
>> +
>> +
>> +def archive_scripts_logs(d):
>> + '''archive scripts and logs. scripts include .bb and .inc files and=20
>> logs include stuff in "temp".'''
>> +
>> + s =3D d.getVar('WORKDIR', True)
>> + os.chdir(s)
>> + source_archive_log_with_scripts =3D=20
>> d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
>> + if source_archive_log_with_scripts =3D=3D 'logs_with_scripts':
>> + logdir =3D get_bb_inc(d)
>> + tarlog =3D archive_logs(d,logdir,True)
>> + elif source_archive_log_with_scripts =3D=3D 'logs':
>> + if os.path.exists('temp'):
>> + archive_logs(d,'temp',False)
>> + else:
>> + return
>> +
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> 'SRPM':
>> + move_tarball_deploy(d,[tarlog])
>> +
>> +def archive_scripts_logs_copyleft(d):
>> + '''archive logs according to the variable "COPYLEFT_COMPLIANCE", If=20
>> this variable is 'True', then archive the packages for copy-left, or=20
>> else archive all packages'''
>> + verify_var(d)
>> + if not d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) or=20
>> not_tarball(d):
>> + return
>> + copyleft_compliance =3D d.getVar('COPYLEFT_COMPLIANCE', True)
>> + if copyleft_compliance is None:
>> + archive_scripts_logs(d)
>> + elif copyleft_compliance.upper() =3D=3D 'TRUE' and archive_copyleft(=
d):
>> + archive_scripts_logs(d)
>> +
>> +
>> +def dumpdata(d):
>> + '''dump environment to "${P}-${PR}.showdata.dump" including all=20
>> kinds of variables and functions when running a task'''
>> + workdir =3D bb.data.getVar('WORKDIR', d, 1)
>> + distro =3D bb.data.getVar('DISTRO', d, 1)
>> + s =3D d.getVar('S', True)
>> + pf =3D d.getVar('PF', True)
>> + target_sys =3D d.getVar('TARGET_SYS', True)
>> + licenses =3D get_licenses(d)
>> + dumpdir =3D d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys =
+=20
>> '/' + licenses + '/' + pf
>> + if not os.path.exists(dumpdir):
>> + bb.mkdirhier(dumpdir)
>> +
>> + dumpfile =3D os.path.join(dumpdir,=20
>> bb.data.expand("${P}-${PR}.showdata.dump",d))
>> +
>> + bb.note("Dumping metadata into '%s'" % dumpfile)
>> + f =3D open(dumpfile, "w")
>> + # emit variables and shell functions
>> + bb.data.emit_env(f, d, True)
>> + # emit the metadata which isnt valid shell
>> + for e in d.keys():
>> + if bb.data.getVarFlag(e, 'python', d):
>> + f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
>> + f.close()
>> +
>> +
>> +
>> +def create_diff_gz(d):
>> + '''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for=20
>> mapping all content in 's' including patches to xxx.diff.gz'''
>> + import shutil
>> +
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + exclude_from =3D d.getVar('EXCLUDE_FROM', True).split()
>> + pf =3D d.getVar('PF', True)
>> + licenses =3D get_licenses(d)
>> + target_sys =3D d.getVar('TARGET_SYS', True)
>> + diff_dir =3D d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys=
=20
>> + '/' + licenses + '/' + pf
>> + diff_file =3D os.path.join(diff_dir,=20
>> bb.data.expand("${P}-${PR}.diff.gz",d))
>> + os.chdir(work_dir)
>> + f =3D open('temp/exclude-from-file', 'a')
>> + for i in exclude_from:
>> + f.write(i)
>> + f.write("\n")
>> + f.close()
>> +
>> +
>> + s=3Dd.getVar('S', True)
>> + distro =3D d.getVar('DISTRO',True)
>> + dest =3D s + '/' + distro + '/files'
>> + if not os.path.exists(dest):
>> + bb.mkdirhier(dest)
>> + for i in os.listdir(os.getcwd()):
>> + if os.path.isfile(i):
>> + shutil.copy(i, dest)
>> +
>> + bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
>> + cmd =3D "LC_ALL=3DC TZ=3DUTC0 diff --exclude-from=3D" + work_dir +=20
>> "/temp/exclude-from-file -Naur " + s + '.org' + ' ' + s + " | gzip=20
>> -c> " + diff_file
>> + d.setVar('DIFF', cmd + "\n")
>> + d.setVarFlag('DIFF', 'func', '1')
>> + bb.build.exec_func('DIFF', d)
>> + shutil.rmtree(s + '.org', ignore_errors=3DTrue)
>> +
>> +# This function will run when user want to get tarball for sources=20
>> and patches after do_unpack
>> +python do_archive_original_sources_patches(){
>> + archive_sources_patches_logs_copyleft(d,'prepatch')
>> +}
>> +
>> +# This function will run when user want to get tarball for patched=20
>> sources after do_patch
>> +python do_archive_patched_sources(){
>> + archive_sources_patches_logs_copyleft(d,'patched')
>> +}
>> +
>> +# This function will run when user want to get tarball for=20
>> configured sources after do_configure
>> +python do_archive_configured_sources(){
>> + archive_sources_patches_logs_copyleft(d,'configured')
>> +}
>> +
>> +# This function will run when user want to get tarball for logs or=20
>> both logs and scripts(.bb and .inc files)
>> +python do_archive_scripts_logs_copyleft(){
>> + archive_scripts_logs_copyleft(d)
>> +}
>> +
>> +# This function will run when user want to know what variable and=20
>> functions in a running task are and also can get a diff file including
>> +# all content a package should include.
>> +python do_dumpdata_create_diff_gz(){
>> + dumpdata(d)
>> + create_diff_gz(d)
>> +}
>> +
>> +# This functions prepare for archiving "linux-yocto" because this=20
>> package create directory 's' before do_patch instead of after do_unpac=
k.
>> +# This is special control for archiving linux-yocto only.
>> +python do_archive_linux_yocto(){
>> + s =3D d.getVar('S', True)
>> + if 'linux-yocto' in s:
>> + source_tar_name =3D archive_sources(d,'')
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> 'SRPM':
>> + move_tarball_deploy(d,[source_tar_name,''])
>> +}
>> +do_kernel_checkout[postfuncs] +=3D "do_archive_linux_yocto "
>> +
>> +# remove tarball for sources, patches and logs after creating srpm.
>> +python do_remove_tarball(){
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRP=
M':
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + os.chdir(work_dir)
>> + for file in os.listdir(os.getcwd()):
>> + if '.tar.gz' in file:
>> + os.remove(file)
> As I mentioned in the RPM code, this might not be the best way to do=20
> this, and it could break builds if you remove a tarball that's=20
> expected to be there.
>
> Maybe store the tarballs in a ${WORKDIR}/.. directory (same level as=20
> temp).
>
This is a problem.
I will use other method instead of this method.
>> +}
>> +do_remove_taball[deptask] =3D "do_archive_scripts_logs"
>> +do_package_write_rpm[postfuncs] +=3D "do_remove_tarball "
>



