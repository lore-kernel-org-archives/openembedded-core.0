Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RkWmK-00080x-Qp
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 09:09:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0A82QS9021500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 00:02:27 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 10 Jan 2012 00:02:26 -0800
Message-ID: <4F0BF0A0.1060301@windriver.com>
Date: Tue, 10 Jan 2012 16:02:40 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
	<8e1e0bb2a8e876e37c2de9d84eb747c66d0ec750.1326003199.git.xiaofeng.yan@windriver.com>
	<4F0B1302.9020901@windriver.com>
In-Reply-To: <4F0B1302.9020901@windriver.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q0A82QS9021500
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] package_rpm.bbclass: add srpm function in spec file
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
X-List-Received-Date: Tue, 10 Jan 2012 08:09:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8810=E6=97=A5 00:17, Mark Hatle wrote:
> On 1/8/12 1:11 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> For packaging source codes to source rpm package, adding Sources,\
>> Patches and prep stage in spec file.
>> "Sources" include source codes (type of tar.gz) and \
>> log files including log.do_patch and log.do_configure (type of tar.gz)
>> "Patches" include all patches called in bb file.
>> "prep" is for user viewing the result in the stage of doing patch and=20
>> configuration
>> for example:
>> User can use the following command to run the stage of prep.
>> $rpmbuild -bp package.spec
>> <show the result of log.do_patch and log.configure>
>>
>> [YOCTO #1655]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/classes/package_rpm.bbclass | 65=20
>> ++++++++++++++++++++++++++++++++------
>> 1 files changed, 55 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass=20
>> b/meta/classes/package_rpm.bbclass
>> index d03dc3f..3e0ca15 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -6,6 +6,7 @@ RPM=3D"rpm"
>> RPMBUILD=3D"rpmbuild"
>>
>> PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
>> +PKGWRITEDIRSRPM =3D "${WORKDIR}/deploy-srpm"
>>
>> python package_rpm_fn () {
>> d.setVar('PKGFN', d.getVar('PKG'))
>> @@ -422,6 +423,19 @@ python write_specfile () {
>> import textwrap
>> import oe.packagedata
>>
>> + def add_prep(spec_files_bottom):
>> + bb.build.exec_func('not_srpm', d)
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
>> + spec_files_bottom.append('%s' % "set +x")
>> + spec_files_bottom.append('%s' % "cd $RPM_SOURCE_BUILD")
>> + spec_files_bottom.append('%s' % "tar zxvf $RPM_SOURCE_DIR/log.tar.gz=
")
>> + spec_files_bottom.append('%s' % "echo \"=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D do patch=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\"")
>> + spec_files_bottom.append('%s' % "cat log.do_patch*")
>> + spec_files_bottom.append('%s' % "echo \"=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D do configure=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\"")
>> + spec_files_bottom.append('%s' % "cat log.do_configure*")
>> + spec_files_bottom.append('')
>
> The above will simply print the output of the do_patch and=20
> do_configure steps. It would probably be better to simply include the=20
> steps themselves... but with the python based steps I'm not sure that=20
> is possible.=20
The stage of prep can work with command "rpmbuild -bp xxx.spec" on=20
target platform. I have also a query. if I plus "%prep" between=20
"%package" and "%file", then "prep" can't work but if plussing "%prep=20
after "%file"", then "%prep" can work. I don't know why about that.

> So returning the log entries is likely the next best thing.
>
I should modify codes like the following.

def add_prep(spec_files_bottom):
bb.build.exec_func('not_srpm', d)
if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) =3D=3D=
=20
'SRPM':
spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
spec_files_bottom.append('%s' % "set +x")
spec_files_bottom.append('%s' % "echo \"include log.do_unpack and=20
log.do_patch, Please check them in log.tar.gz from SOURCES\"")
spec_files_bottom.append('')

only tell user to find log files in detailed place. right?

> Note, you don't need the wild cards in this, you should simply cat out=20
> the version log.do_patch instead of log.do_patch* -- bitbake ensures=20
> that the last log file is always the one with the symbolic link.
>
> --Mark
>
>> +
>> # We need a simple way to remove the MLPREFIX from the package name,
>> # and dependency information...
>> def strip_multilib(name, d):
>> @@ -533,6 +547,13 @@ python write_specfile () {
>> srcmaintainer =3D d.getVar('MAINTAINER', True)
>> srchomepage =3D d.getVar('HOMEPAGE', True)
>> srcdescription =3D d.getVar('DESCRIPTION', True) or "."
>> +
>> + bb.build.exec_func('not_srpm', d)
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + tpkg_name =3D d.getVar('PF',True)
>> + srctargz =3D tpkg_name + ".tar.gz"
>> + logtargz =3D "log.tar.gz"
>> +
>>
>> srcdepends =3D strip_multilib(d.getVar('DEPENDS', True), d)
>> srcrdepends =3D []
>> @@ -557,6 +578,11 @@ python write_specfile () {
>> spec_files_top =3D []
>> spec_files_bottom =3D []
>>
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + srcpatches =3D []
>> + bb.build.exec_func('get_patches', d)
>> + srcpatches =3D d.getVar('PLIST',True)
>> +
>> for pkg in packages.split():
>> localdata =3D bb.data.createCopy(d)
>>
>> @@ -637,7 +663,7 @@ python write_specfile () {
>> else:
>> bb.note("Creating EMPTY RPM Package for %s" % splitname)
>> spec_files_top.append('')
>> -
>> +
>> bb.utils.unlockfile(lf)
>> continue
>>
>> @@ -714,7 +740,7 @@ python write_specfile () {
>> spec_scriptlets_bottom.append('# %s - %s' % (splitname, script))
>> spec_scriptlets_bottom.append(scriptvar)
>> spec_scriptlets_bottom.append('')
>> -
>> +
>> # Now process files
>> file_list =3D []
>> walk_files(root, file_list, conffiles)
>> @@ -732,7 +758,8 @@ python write_specfile () {
>>
>> del localdata
>> bb.utils.unlockfile(lf)
>> -
>> +
>> + add_prep(spec_files_bottom)
>> spec_preamble_top.append('Summary: %s' % srcsummary)
>> spec_preamble_top.append('Name: %s' % srcname)
>> spec_preamble_top.append('Version: %s' % srcversion)
>> @@ -743,6 +770,11 @@ python write_specfile () {
>> spec_preamble_top.append('Group: %s' % srcsection)
>> spec_preamble_top.append('Packager: %s' % srcmaintainer)
>> spec_preamble_top.append('URL: %s' % srchomepage)
>> +
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + spec_preamble_top.append('Source: %s' % srctargz)
>> + spec_preamble_top.append('Source1: %s' % logtargz)
>> +
>>
>> # Replaces =3D=3D Obsoletes&& Provides
>> if srcrreplaces and srcrreplaces.strip() !=3D "":
>> @@ -764,6 +796,11 @@ python write_specfile () {
>> print_deps(srcrsuggests, "Recommends", spec_preamble_top, d)
>> print_deps(srcrprovides, "Provides", spec_preamble_top, d)
>> print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + numid =3D 1
>> + for patch in srcpatches:
>> + print_deps(patch, "Patch" + str(numid), spec_preamble_top, d)
>> + numid +=3D 1
>>
>> # conflicts can not be in a provide! We will need to filter it.
>> if srcrconflicts:
>> @@ -817,12 +854,6 @@ python write_specfile () {
>> except OSError:
>> raise bb.build.FuncFailed("unable to open spec file for writing.")
>>
>> - # RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
>> - # of the generated spec file
>> - external_preamble =3D d.getVar("RPMSPEC_PREAMBLE", True)
>> - if external_preamble:
>> - specfile.write(external_preamble + "\n")
>> -
>> for line in spec_preamble_top:
>> specfile.write(line + "\n")
>>
>> @@ -947,9 +978,14 @@ python do_package_rpm () {
>> d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
>> pkgwritedir =3D=20
>> bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}', d)
>> pkgarch =3D=20
>> bb.data.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}', =
d)
>> - magicfile =3D=20
>> bb.data.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc'=
,=20
>> d)
>> + magicfile =3D=20
>> bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
>> bb.mkdirhier(pkgwritedir)
>> os.chmod(pkgwritedir, 0755)
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True):
>> + pkgwritesrpmdir =3D=20
>> bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
>> + bb.mkdirhier(pkgwritesrpmdir)
>> + os.chmod(pkgwritesrpmdir, 0755)
>> +
>>
>> cmd =3D rpmbuild
>> cmd =3D cmd + " --nodeps --short-circuit --target " + pkgarch + "=20
>> --buildroot " + pkgd
>> @@ -962,8 +998,17 @@ python do_package_rpm () {
>> cmd =3D cmd + " --define 'debug_package %{nil}'"
>> cmd =3D cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>> cmd =3D cmd + " --define '_tmppath " + workdir + "'"
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + cmdsrpm =3D cmd + " --define '_sourcedir " + workdir + "' --define=20
>> '_srcrpmdir " + pkgwritesrpmdir + "'"
>> + cmdsrpm =3D cmdsrpm + " -bs " + outspecfile
>> cmd =3D cmd + " -bb " + outspecfile
>>
>> + # Build the source rpm package !
>> + if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True)=20
>> =3D=3D 'SRPM':
>> + d.setVar('SBUILDSPEC', cmdsrpm + "\n")
>> + d.setVarFlag('SBUILDSPEC', 'func', '1')
>> + bb.build.exec_func('SBUILDSPEC', d)
>> +
>> # Build the rpm package!
>> d.setVar('BUILDSPEC', cmd + "\n")
>> d.setVarFlag('BUILDSPEC', 'func', '1')
>
>



