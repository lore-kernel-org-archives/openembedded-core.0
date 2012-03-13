Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7MIe-00044j-Qb
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 08:37:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2D7Std6018415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:28:55 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Mar 2012 00:28:54 -0700
Message-ID: <4F5EF73C.8060105@windriver.com>
Date: Tue, 13 Mar 2012 15:29:00 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>	<0a62458fb91efc29de71daaf0feef58baa1e7f54.1330771239.git.xiaofeng.yan@windriver.com>
	<4F5E4682.1030208@windriver.com>
In-Reply-To: <4F5E4682.1030208@windriver.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2D7Std6018415
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
X-List-Received-Date: Tue, 13 Mar 2012 07:37:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thanks for your detailed comment.
On 2012=E5=B9=B403=E6=9C=8813=E6=97=A5 02:54, Mark Hatle wrote:
> Apologies for the very late review... see comments below. All in all=20
> it looks good. But I have not applied it and tried it yet.
>
> On 3/3/12 4:54 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Support the following functions in this bbclass:
>>
>> 1 Archive sources in ${S} in the different stage to tarball=20
>> (do_unpack,do_patch,do_configure).
>> 2 Archive patches including series to tarball
>> 3 Archive logs including scripts (.bb and .inc files) to tarball
>> 4 dump environment resources which show all variable and functions to =
be
>> used to xxx.showdata.dump when running a task
>> 5 dump all content in 's' including patches to file xxx.diff.gz
>>
>> All of tarballs will be deployed to ${DEPLOY_DIR}/sources/
>>
>> [#YOCTO 1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/classes/archiver.bbclass | 393=20
>> +++++++++++++++++++++++++++++++++++++++++
>> 1 files changed, 393 insertions(+), 0 deletions(-)
>> create mode 100644 meta/classes/archiver.bbclass
>>
> ...
>
>> +def verify_var(d):
>> + '''check the type for archiving package('tar' or 'srpm')'''
>> + try:
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> d.getVar('ARCHIVE_TYPE', True).split():
>> + raise AttributeError
>> + except AttributeError:
>> + bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\',=20
>> no other types")
>
> Error message should be something like:
>
> bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" should be \'tar\' or '\srpm\'=
")
>
Thanks for correcting my grammar.

> ...
>
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
>
> Instead of an explicit TRUE/FALSE setting, does it make sense for one=20
> to be the default? I'd suspect in this case "True" is the better=20
> default, but I'm not completely sure.
>
I can move this setting to local.conf.sample and TRUE is default setting.
>> + else:
>> + patch_tar_name =3D ''
>> +
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in=20
>> 'SRPM':
>> + move_tarball_deploy(d,[source_tar_name,patch_tar_name])
>> +
>> +def archive_sources_patches_logs_copyleft(d,middle_name):
>> + '''archive source, patches and logs according to the variable=20
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
>
> I'm not sure I understand what is happening in this patch. The way I=20
> read it:
>
> If COPYLEFT_COMPLIANCE is -not- set, then we archive.. otherwise if it=20
> is set (true), and the copyleft item was inherited we also archive?
>
If COPYLEFT_COMPLIANCE is -not- set, then we archive all resources=20
without considering copyrights problem which is typed in=20
copyleft_compliance.bbclass.
otherwise if it is set (true), and the copyleft item was inherited we=20
only archive packages which be allowed by copyleft.
> But I'm not sure I understand why this set of checks.
>
>
> ...
>
>> +def dumpdata(d):
>> + '''dump environment to "${P}-${PR}.showdata.dump" including all=20
>> kinds of varibale and functions when running a task'''
>
> Simple typo above, should be "variable".
>
Thanks for your detailed reviewing.
> ...
>
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
>
> Is there something we can change in linux-yocto to make the standard=20
> methods work? I'm hesitant to put special logic in the archiver class=20
> for a single package. (Note, I'm more likely to think it's reasonable=20
> for the kernel's package then a random userspace package!)
>
because the 's' is created after do_kernel_checkout (after do_unpack=20
before do_patch), so we will not get original sources for kernel if we=20
archive 's' after do_unpack.
Some bb files do some changes after do_unpack before do_patch actually .=20
The following bb files are the case. Perhaps some other bb files could=20
also change some stuff before do_patch in future. So I archive sources=20
codes in do_unpack[postfuncs] instead of do_patch[prefuncs].

meta$ grep "do_unpack_append" . -nr
./recipes-core/eglibc/eglibc_2.15.bb:76:do_unpack_append() {
./recipes-core/eglibc/eglibc_2.13.bb:73:do_unpack_append() {
./recipes-sato/web/web_git.bb:19:do_unpack_append () {
./recipes-extended/ltp/ltp_20120104.bb:46:do_unpack_append() {

>> +do_kernel_checkout[postfuncs] +=3D "do_archive_linux_yocto "
>> +
>
> Is the real issue that we want to run something just before do_patch,=20
> but we also want to let any arbitrary tasks between do_unpack and=20
> do_patch to run first? Is there an alternative way to state this? [or=20
> at least detect a situation where we haven't waited?]
>
My reasons why doing this is same as above
>> +# remove tarball for sources, patches and logs after creating srpm.
>> +python do_remove_tarball(){
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRP=
M':
>> + work_dir =3D d.getVar('WORKDIR', True)
>> + os.chdir(work_dir)
>> + for file in os.listdir(os.getcwd()):
>> + if '.tar.gz' in file:
>> + os.remove(file)
>> +}
>> +do_remove_taball[deptask] =3D "do_archive_scripts_logs"
>> +do_package_write_rpm[postfuncs] +=3D "do_remove_tarball "
>
> Finally do we really need to remove the tarball? It can likely just=20
> stay around, when the user wipes out/cleans the WORKDIR it will go=20
> away on it's own?
>
These archiving packages will waste much disk space, so I will remove=20
them after srpm package generating. but that just seemed excessive, right=
?

Thanks for your comment again.
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



