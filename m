Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SD9qt-0001at-Ti
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:33:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2T7Nue3029191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 00:23:56 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 29 Mar 2012 00:23:56 -0700
Message-ID: <4F740E05.3050207@windriver.com>
Date: Thu, 29 Mar 2012 15:23:49 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>	<3af1340dbc4b0d234532a63de88aed8e203bc09a.1332814325.git.xiaofeng.yan@windriver.com>
	<CABcZANkC-_qmJB9G47EeU5o3FKCM2+=B+h054Pb9M2cvwtWmsw@mail.gmail.com>
In-Reply-To: <CABcZANkC-_qmJB9G47EeU5o3FKCM2+=B+h054Pb9M2cvwtWmsw@mail.gmail.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2T7Nue3029191
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
X-List-Received-Date: Thu, 29 Mar 2012 07:33:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for your suggestion very much. I think I understand what you=20
said.  The new patches will be pushed to OE-core this week according to=20
your suggestion.

On 2012=E5=B9=B403=E6=9C=8828=E6=97=A5 05:27, Chris Larson wrote:
> On Mon, Mar 26, 2012 at 7:24 PM, Xiaofeng Yan
> <xiaofeng.yan@windriver.com>  wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> 1 Archive sources in ${S} in the different stage
>>   (do_unpack,do_patch,do_configure).
>> 2 Archive patches including series
>> 3 Archive logs including scripts (.bb and .inc files)
>> 4 dump environment resources which show all variable and functions
>>   used to xxx.showdata.dump when running a task
>> 5 dump all content in 's' including patches to file xxx.diff.gz
>>
>> All archiving packages  will be deployed to ${DEPLOY_DIR}/sources/
>>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta/classes/archiver.bbclass |  460 +++++++++++++++++++++++++++++++=
++++++++++
>>   1 files changed, 460 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/classes/archiver.bbclass
>>
>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbc=
lass
>> new file mode 100644
>> index 0000000..471430e
>> --- /dev/null
>> +++ b/meta/classes/archiver.bbclass
>> @@ -0,0 +1,460 @@
>> +# This file is used for archiving sources ,patches,and logs to tarbal=
l.
>> +# It also output building environment to xxx.dump.data and create xxx=
.diff.gz to record
>> +# all content in ${S} to a diff file.
>> +
>> +EXCLUDE_FROM ?=3D ".pc autom4te.cache"
>> +ARCHIVE_TYPE ?=3D "TAR SRPM"
>> +DISTRO ?=3D "poky"
>> +PATCHES_ARCHIVE_WITH_SERIES =3D 'TRUE'
> I'm a bit concerned about the variable names here. Perhaps we should
> prefix them with ARCHIVER_? "EXCLUDE_FROM" is a bit generic.
>
>> +def parse_var(d,var):
>> +       ''' parse variable like ${PV}  in "require xxx_${PV}.inc"  to =
a real value. for example, change "require xxx_${PV}.inc" to "require xxx=
_1.2.inc" '''
>> +       import re
>> +       pat =3D re.compile('.*\$({(.*)}).*')
>> +       if '$' not in var and '/' not in var:
>> +               return var
>> +       else:
>> +               if '/' in var:
>> +                       return [i for i in var.split('/') if i.endswit=
h('.inc')][0]
>> +               elif '$' in  var:
>> +                       m =3D pat.match(var)
>> +                       patstr =3D '\$' + m.group(1)
>> +                       var_str =3D m.group(2)
>> +                       return re.sub(patstr,d.getVar(var_str,True),va=
r)
>> +               else:
>> +                       return var
> Why not using bb.data.expand(), which is designed for this? I see one
> usage of parse_var here which has access to 'd', so I see no reason
> not to use the standard mechanisms.
>
>> +def get_bb_inc(d):
>> +       '''create a directory "script-logs" including .bb and .inc fil=
e in ${WORKDIR}'''
>> +       import re
>> +       import os
>> +       import shutil
>> +
>> +       bbinc =3D []
>> +       pat=3Dre.compile('require\s*([^\s]*\.*)(.*)')
>> +       file_dir =3D d.getVar('FILE', True)
>> +       bbdir =3D os.path.dirname(file_dir)
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       os.chdir(work_dir)
> I'd recommend against using chdir() unless there's no way around it.
> I'd suggest working with the absolute paths instead.
>
>> +       bb.mkdirhier("script-logs")
>> +       os.chdir(bbdir)
>> +       bbfile =3D os.path.basename(file_dir)
>> +       bbinc.append(bbfile)
>> +
>> +       def get_inc (file):
>> +               f =3D open(file,'r')
>> +               for line in f.readlines():
>> +                       if 'require' not  in line:
>> +                               bbinc.append(file)
>> +                       else:
>> +                               try:
>> +                                       incfile =3D pat.match(line).gr=
oup(1)
>> +                                       incfile =3D parse_var(d,incfil=
e)
>> +                                       bbinc.append(incfile)
>> +                                       get_inc(incfile)
>> +                               except (IOError,AttributeError):
>> +                                       pass
>> +       get_inc(bbfile)
>> +       os.chdir(work_dir)
>> +       for root, dirs, files in os.walk(bbdir):
>> +               for file in bbinc:
>> +                       if file in files:
>> +                               shutil.copy(root + '/' + file,'script-=
logs')
>> +       oe.path.copytree('temp', 'script-logs')
>> +       return work_dir + '/script-logs'
>> +
>> +def get_all_patches(d):
>> +       '''copy patches and series file to a pointed directory which w=
ill be archived to tarball in ${WORKDIR}'''
> This claims to be working with a series file, but I don't see anything
> here which does anything of the sort. Further, as you aren't
> determining what is and is not a patch, this will capture more than
> just patches, also config files, etc, which makes either the function
> name or its implementation wrong, depending on which is correct.
>
>> +       import shutil
>> +
>> +       src_patches=3D[]
>> +       pf =3D d.getVar('PF', True)
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       s =3D d.getVar('S',True)
>> +       dest =3D os.path.join(work_dir, pf + '-patches')
>> +       shutil.rmtree(dest, ignore_errors=3DTrue)
>> +       bb.mkdirhier(dest)
>> +
>> +       src_uri =3D d.getVar('SRC_URI', 1).split()
>> +       fetch =3D bb.fetch2.Fetch(src_uri, d)
>> +       locals =3D (fetch.localpath(url) for url in fetch.urls)
>> +       for local in locals:
>> +               src_patches.append(local)
>> +       if not cmp(work_dir,s):
>> +               tmp_list =3D src_patches
>> +       else:
>> +               tmp_list =3D src_patches[1:]
>> +
>> +       for patch in tmp_list:
>> +               try:
>> +                       shutil.copy(patch,dest)
>> +               except IOError:
>> +                       if os.path.isdir(patch):
>> +                               oe.path.copytree(patch,dest)
>> +       return dest
>> +
>> +def get_applying_patches(d):
>> +       """only copy applying patches to a pointed directory which wil=
l be archived to tarball"""
>> +       import os
>> +       import shutil
>> +
>> +
>> +       pf =3D d.getVar('PF', True)
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       dest =3D os.path.join(work_dir, pf + '-patches')
>> +       shutil.rmtree(dest, ignore_errors=3DTrue)
>> +       bb.mkdirhier(dest)
>> +
>> +
>> +       patches =3D src_patches(d)
>> +       for patch in patches:
>> +               _, _, local, _, _, parm =3D bb.decodeurl(patch)
>> +               if local:
>> +                        shutil.copy(local,dest)
>> +       return dest
>> +
>> +def not_tarball(d):
>> +       '''packages including key words 'work-shared','native', 'task-=
' will be passed'''
>> +       import os
>> +
>> +       workdir =3D d.getVar('WORKDIR',True)
>> +       s =3D d.getVar('S',True)
>> +       if 'work-shared' in s or 'task-' in workdir or 'native' in wor=
kdir:
>> +               return True
>> +       else:
>> +               return False
>> +
>> +def get_source_from_downloads(d,middle_name):
> I'd encourage you to find a better variable name than "middle_name".
> It's vague at best, confusing at worst.
>
>> +       '''copy tarball of $P to $WORKDIR when this tarball exists in =
$DL_DIR'''
>> +       if middle_name in 'patched' 'configured':
>> +               return
>> +       pf =3D d.getVar('PF', True)
>> +       dl_dir =3D d.getVar('DL_DIR',True)
>> +       try:
>> +               source =3D os.path.basename(d.getVar('SRC_URI', 1).spl=
it()[0])
> Incorrect getVar call, use True.
>
>> +               os.chdir(dl_dir)
> You do a chdir here, but don't return it to the previous path afterward=
s.
>
>> +               if os.path.exists(source) and not os.path.isdir(source=
):
>> +                       return source
>> +       except (IndexError, OSError):
>> +               pass
>> +
>> +def archive_sources_from_directory(d,middle_name):
>> +       '''archive sources codes tree to tarball when tarball of $P do=
esn't exist in $DL_DIR'''
>> +       import tarfile
>> +       import shutil
>> +
>> +       s =3D d.getVar('S',True)
>> +       workdir=3Dd.getVar('WORKDIR', True)
>> +       PF =3D d.getVar('PF',True)
>> +       tarname =3D PF + '-' + middle_name + ".tar.gz"
>> +
>> +       if os.path.exists(s) and s is not workdir:
>> +               sourcedir =3D os.path.basename(s)
>> +               tarbase =3D os.path.dirname(s)
>> +               if not sourcedir or os.path.dirname(tarbase) =3D=3D wo=
rkdir:
>> +                       sourcedir =3D os.path.basename(os.path.dirname=
(s))
>> +                       tarbase =3D os.path.dirname(os.path.dirname(s)=
)
>> +               os.chdir(tarbase)
>> +       else:
>> +               sourcedir =3D os.path.basename(s)
>> +               if not os.path.exists(sourcedir):
>> +                       os.mkdir(sourcedir)
>> +               try:
>> +                       for file in os.listdir(s):
>> +                               if file is not 'temp' and file is not =
sourcedir:
>> +                                       shutil.copy(file,sourcedir)
>> +               except (IOError,OSError):
>> +                       pass
>> +
>> +       if (len(os.listdir(sourcedir))) !=3D 0:
>> +               tar =3D tarfile.open( tarname, "w:gz")
>> +               tar.add(sourcedir)
>> +               tar.close()
>> +               if cmp(workdir,os.path.dirname(s)) and not os.path.exi=
sts(workdir + '/' + tarname):
> Use os.path.join, not + '/'.
>
>> +                       shutil.move(os.path.dirname(s) + '/' + tarname=
,workdir)
> Same as above.
>
>> +       else:
>> +               return
>> +       return tarname
>> +
>> +def archive_sources(d,middle_name):
>> +       '''copy tarball from $DL_DIR to $WORKDIR if have tarball, arch=
ive source codes tree in $WORKDIR if $P is directory instead of tarball''=
'
>> +       import shutil
>> +       work_dir =3D d.getVar('WORKDIR',True)
>> +       file =3D get_source_from_downloads(d,middle_name)
>> +       if file:
>> +               shutil.copy(file,work_dir)
>> +       else:
>> +               file =3D archive_sources_from_directory(d,middle_name)
>> +       return file
>> +
>> +
>> +def archive_patches(d,patchdir,series):
>> +       '''archive patches to tarball and also include series files if=
 'series' is True'''
>> +       import tarfile
>> +       import shutil
>> +
>> +       s =3D d.getVar('S',True)
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       os.chdir(work_dir)
>> +       patch_dir =3D os.path.basename(patchdir)
>> +       tarname =3D patch_dir + ".tar.gz"
>> +       if series  =3D=3D 'all' and os.path.exists(s + '/patches/serie=
s'):
>> +                       shutil.copy(s + '/patches/series',patch_dir)
>> +       tar =3D tarfile.open(tarname, "w:gz")
>> +       tar.add(patch_dir)
>> +       tar.close()
>> +       shutil.rmtree(patch_dir, ignore_errors=3DTrue)
>> +       return tarname
>> +
>> +def select_archive_patches(d,option):
>> +       '''select to archive all patches including non-applying and se=
ries or applying patches '''
>> +       if option =3D=3D "all":
>> +               patchdir =3D get_all_patches(d)
>> +       elif option =3D=3D "applying":
>> +               patchdir =3D get_applying_patches(d)
>> +       try:
>> +               os.rmdir(patchdir)
>> +       except OSError:
>> +                       tarpatch =3D archive_patches(d,patchdir,option=
)
>> +                       return tarpatch
>> +       return
>> +
>> +def archive_logs(d,logdir,bbinc=3DFalse):
>> +       '''archive logs in temp to tarball and .bb and .inc files if b=
binc is True '''
>> +       import tarfile
>> +       import shutil
>> +
>> +       log_dir =3D os.path.basename(logdir)
>> +       pf =3D d.getVar('PF',True)
>> +       tarname =3D pf + '-' + log_dir + ".tar.gz"
>> +       tar =3D tarfile.open(tarname, "w:gz")
>> +       tar.add(log_dir)
>> +       tar.close()
>> +       if bbinc:
>> +               shutil.rmtree(log_dir, ignore_errors=3DTrue)
>> +       return tarname
>> +
>> +def get_licenses(d):
>> +       '''get licenses for running .bb file'''
>> +       licenses =3D d.getVar('LICENSE', 1).replace('&', '|')
>> +       licenses =3D licenses.replace('(', '').replace(')', '')
>> +       clean_licenses =3D ""
>> +       for x in licenses.split():
>> +               if x.strip() =3D=3D '' or x =3D=3D 'CLOSED':
>> +                       continue
>> +               if x !=3D "|":
>> +                       clean_licenses +=3D x
>> +       if '|' in clean_licenses:
>> +               clean_licenses =3D clean_licenses.replace('|','')
>> +       return clean_licenses
> We have a license parser for a reason, is there a reason behind not
> using it here? If it's potential performance benefit, I'd encourage
> you to do the right thing, profile, *then* optimize.
>
>> +def move_tarball_deploy(d,tarball_list):
>> +       '''move tarball in location to ${DEPLOY_DIR}/sources'''
> "in location" is extremely vague here. Please improve the function
> documentation.
>
>> +       import shutil
>> +
>> +       if tarball_list is []:
>> +               return
>> +       target_sys =3D d.getVar('TARGET_SYS', True)
>> +       pf =3D d.getVar('PF', True)
>> +       licenses =3D get_licenses(d)
>> +       tar_sources =3D d.getVar('DEPLOY_DIR', True) + '/sources/' + t=
arget_sys + '/' + licenses + '/' + pf
>> +       if not os.path.exists(tar_sources):
>> +               bb.mkdirhier(tar_sources)
>> +       for source in tarball_list:
>> +               if source:
>> +                       if os.path.exists(tar_sources + '/' + source):
>> +                               os.remove(tar_sources + '/' + source)
>> +                       shutil.move(source,tar_sources)
>> +
>> +def verify_var(d):
> This function name doesn't correspond to what it does. Please make it
> more clear.
>
>> +       '''check the type for archiving package('tar' or 'srpm')'''
>> +       try:
>> +               if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper=
() not in d.getVar('ARCHIVE_TYPE', True).split():
>> +                       raise AttributeError
>> +       except AttributeError:
>> +                       bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \=
'tar\' or \'srpm\', no other types")
>> +
>> +def store_package(d,package_name):
>> +       '''store tarbablls name to file "tar-package"'''
> Typo in docstring.
>
>> +       try:
>> +               f =3D open(d.getVar('WORKDIR',True )+ '/tar-package','=
a')
> More use of string concatenation rather than os.path.join.
>
>> +               f.write(package_name + ' ')
>> +               f.close()
>> +       except IOError:
>> +               pass
>> +
>> +def get_package(d):
>> +       '''get tarballs name from "tar-package"'''
>> +       try:
>> +               os.chdir(d.getVar('WORKDIR', True))
> Another chdir without returning to the previous path. Functions
> shouldn't have process-wide side effects like this, in my opinion.
> Either work with the absolute paths (preferred) or return to the old
> path.
>
>> +               f =3D open('tar-package','r')
>> +               line =3D list(set(f.readline().replace('\n','').split(=
)))
>> +               f.close()
>> +               return line
>> +       except IOError:
>> +               pass
>> +
>> +
>> +def archive_sources_patches(d,middle_name):
>> +       '''archive sources and patches to tarball. middle_name will ap=
pend strings ${middle_name} to ${PR} as middle name. for example, zlib-1.=
4.6-prepatch(middle_name).tar.gz '''
>> +       import shutil
>> +       verify_var(d)
>> +       if not_tarball(d):
>> +               return
>> +
>> +       source_tar_name =3D archive_sources(d,middle_name)
>> +       if middle_name =3D=3D "prepatch":
>> +               if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper(=
) =3D=3D 'TRUE':
>> +                       patch_tar_name =3D select_archive_patches(d,"a=
ll")
>> +               elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).uppe=
r() =3D=3D 'FALSE':
>> +                       patch_tar_name =3D select_archive_patches(d,"a=
pplying")
>> +               else:
>> +                       bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_=
SERIES' is strings 'True' or 'False' ")
>> +       else:
>> +               patch_tar_name =3D ''
>> +
>> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not i=
n 'SRPM':
>> +               move_tarball_deploy(d,[source_tar_name,patch_tar_name]=
)
>> +       else:
>> +               tarpackage =3D d.getVar('WORKDIR', True) + '/tar-packa=
ge'
>> +               if os.path.exists(tarpackage):
>> +                       os.remove(tarpackage)
>> +               for package in source_tar_name, patch_tar_name:
>> +                       if package:
>> +                               store_package(d,str(package) + ' ')
>> +
>> +def archive_scripts_logs(d):
>> +       '''archive scripts and logs. scripts include .bb and .inc file=
s and logs include stuff in "temp".'''
>> +
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       os.chdir(work_dir)
>> +       source_archive_log_with_scripts =3D d.getVar('SOURCE_ARCHIVE_L=
OG_WITH_SCRIPTS', True)
>> +       if source_archive_log_with_scripts =3D=3D 'logs_with_scripts':
>> +               logdir =3D get_bb_inc(d)
>> +               tarlog =3D archive_logs(d,logdir,True)
>> +       elif source_archive_log_with_scripts =3D=3D 'logs':
>> +               if os.path.exists('temp'):
>> +                       tarlog =3D archive_logs(d,'temp',False)
>> +       else:
>> +               return
>> +
>> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not i=
n 'SRPM':
>> +               move_tarball_deploy(d,[tarlog])
>> +
>> +       else:
>> +               store_package(d,tarlog)
>> +
>> +def dumpdata(d):
>> +       '''dump environment to "${P}-${PR}.showdata.dump" including al=
l kinds of variables and functions when running a task'''
>> +       workdir =3D bb.data.getVar('WORKDIR', d, 1)
>> +       distro =3D bb.data.getVar('DISTRO', d, 1)
>> +       s =3D d.getVar('S', True)
>> +       pf =3D d.getVar('PF', True)
>> +       target_sys =3D d.getVar('TARGET_SYS', True)
>> +       licenses =3D get_licenses(d)
>> +       dumpdir =3D d.getVar('DEPLOY_DIR', True) + '/sources/' + targe=
t_sys + '/' + licenses + '/' + pf
>> +       if not os.path.exists(dumpdir):
>> +               bb.mkdirhier(dumpdir)
>> +
>> +       dumpfile =3D os.path.join(dumpdir, bb.data.expand("${P}-${PR}.=
showdata.dump",d))
>> +
>> +       bb.note("Dumping metadata into '%s'" % dumpfile)
>> +       f =3D open(dumpfile, "w")
>> +       # emit variables and shell functions
>> +        bb.data.emit_env(f, d, True)
>> +       # emit the metadata which isnt valid shell
>> +       for e in d.keys():
>> +               if bb.data.getVarFlag(e, 'python', d):
>> +                       f.write("\npython %s () {\n%s}\n" % (e, bb.dat=
a.getVar(e, d, 1)))
>> +       f.close()
>> +
>> +def create_diff_gz(d):
>> +       '''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz=
 for mapping all content in 's' including patches to  xxx.diff.gz'''
>> +       import shutil
>> +
>> +       work_dir =3D d.getVar('WORKDIR', True)
>> +       exclude_from =3D d.getVar('EXCLUDE_FROM', True).split()
>> +       pf =3D d.getVar('PF', True)
>> +       licenses =3D get_licenses(d)
>> +       target_sys =3D d.getVar('TARGET_SYS', True)
>> +       diff_dir =3D d.getVar('DEPLOY_DIR', True) + '/sources/' + targ=
et_sys + '/' + licenses + '/' + pf
>> +       diff_file =3D os.path.join(diff_dir, bb.data.expand("${P}-${PR=
}.diff.gz",d))
>> +       os.chdir(work_dir)
>> +       f =3D open('temp/exclude-from-file', 'a')
>> +       for i in exclude_from:
>> +               f.write(i)
>> +               f.write("\n")
>> +       f.close()
>> +
>> +       s=3Dd.getVar('S', True)
>> +       distro =3D d.getVar('DISTRO',True)
>> +       dest =3D s + '/' + distro + '/files'
>> +       if not os.path.exists(dest):
>> +               bb.mkdirhier(dest)
>> +       for i in os.listdir(os.getcwd()):
>> +               if os.path.isfile(i):
>> +                       shutil.copy(i, dest)
>> +
>> +       bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.dif=
f.gz")
>> +       cmd =3D "LC_ALL=3DC TZ=3DUTC0 diff --exclude-from=3D" + work_d=
ir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip =
-c>  " + diff_file
>> +       d.setVar('DIFF', cmd + "\n")
>> +       d.setVarFlag('DIFF', 'func', '1')
>> +       bb.build.exec_func('DIFF', d)
>> +       shutil.rmtree(s + '.org', ignore_errors=3DTrue)
>> +
>> +# This function will run when user want to get tarball for sources an=
d patches after do_unpack
>> +python do_archive_original_sources_patches(){
>> +       archive_sources_patches(d,'prepatch')
>> +}
>> +
>> +# This function will run when user want to get tarball for patched so=
urces after do_patch
>> +python do_archive_patched_sources(){
>> +       archive_sources_patches(d,'patched')
>> +}
>> +
>> +# This function will run when user want to get tarball for configured=
 sources after do_configure
>> +python do_archive_configured_sources(){
>> +       archive_sources_patches(d,'configured')
>> +}
>> +
>> +# This function will run when user want to get tarball for logs or bo=
th logs and scripts(.bb and .inc files)
>> +python do_archive_scripts_logs(){
>> +       archive_scripts_logs(d)
>> +}
>> +
>> +# This function will run when user want to know what variable and fun=
ctions in a running task are and also can get a diff file including
>> +# all content a package should include.
>> +python do_dumpdata_create_diff_gz(){
>> +       dumpdata(d)
>> +       create_diff_gz(d)
>> +}
>> +
>> +# This functions prepare for archiving "linux-yocto" because this pac=
kage create directory 's' before do_patch instead of after do_unpack.
>> +# This is special control for archiving linux-yocto only.
>> +python do_archive_linux_yocto(){
>> +       s =3D d.getVar('S', True)
>> +       if 'linux-yocto' in s:
>> +               source_tar_name =3D archive_sources(d,'')
>> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not i=
n 'SRPM':
>> +               move_tarball_deploy(d,[source_tar_name,''])
>> +}
>> +do_kernel_checkout[postfuncs] +=3D "do_archive_linux_yocto "
>> +
>> +# remove tarball for sources, patches and logs after creating srpm.
>> +python do_remove_tarball(){
>> +       if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D=
 'SRPM':
>> +               work_dir =3D d.getVar('WORKDIR', True)
>> +               os.chdir(work_dir)
>> +               try:
>> +                       for file in os.listdir(os.getcwd()):
>> +                               if file in get_package(d):
>> +                                       os.remove(file)
>> +                       os.remove('tar-package')
>> +               except (TypeError,OSError):
>> +                               pass
>> +}
>> +do_remove_taball[deptask] =3D "do_archive_scripts_logs"
>> +do_package_write_rpm[postfuncs] +=3D "do_remove_tarball "
>> +export get_licenses
>> +export get_package
> export? This isn't making any sense to me. Why are you exporting these
> functions to shell tasks?



