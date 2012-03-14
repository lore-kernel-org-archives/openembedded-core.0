Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7nQp-00043W-Ps
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:35:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2ECR87x014761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2012 05:27:08 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 14 Mar 2012 05:27:08 -0700
Message-ID: <4F608EA4.3070708@windriver.com>
Date: Wed, 14 Mar 2012 20:27:16 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
	<de0b611934064b68e5eccec92a8e76eba7bb30ba.1331642569.git.xiaofeng.yan@windriver.com>
	<4F5FD730.6060705@linux.intel.com>
In-Reply-To: <4F5FD730.6060705@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2ECR87x014761
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 14 Mar 2012 12:35:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Thanks for your detailed comment
On 2012=E5=B9=B403=E6=9C=8814=E6=97=A5 07:24, Saul Wold wrote:
> On 03/13/2012 05:52 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Add a new function to archive source, patches and logs to a source rpm
>> package. Every source rpm package will be deployed to
>> ${DEPLOY_DIR}/sources/deploy-srpm.
>>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/classes/package_rpm.bbclass | 63=20
>> ++++++++++++++++++++++++++++++++++++++
>> 1 files changed, 63 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass=20
>> b/meta/classes/package_rpm.bbclass
>> index 68313ec..b261a0e 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -6,6 +6,7 @@ RPM=3D"rpm"
>> RPMBUILD=3D"rpmbuild"
>>
>> PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
>> +PKGWRITEDIRSRPM =3D "${DEPLOY_DIR}/sources/deploy-srpm"
>>
>> python package_rpm_fn () {
>> d.setVar('PKGFN', d.getVar('PKG'))
>> @@ -475,6 +476,37 @@ python write_specfile () {
>> import textwrap
>> import oe.packagedata
>>
>> + # append information for logs and patches to %prep
>> + def add_prep(d,spec_files_bottom):
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
>> + spec_files_bottom.append('%s' % "echo \"include logs and patches,=20
>> Please check them in SOURCES\"")
>> + spec_files_bottom.append('')
>> +
>> + # get the name of tarball for sources, patches and logs
>> + def get_tarballs(d):
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + sourcelist=3D[]
>> + workdir =3D d.getVar('WORKDIR',True)
>> + print os.listdir(workdir)
>> + for source in os.listdir(workdir):
>> + if 'tar.gz' in source:
>> + sourcelist.append(source)
>> + return sourcelist
>
> What happens here is there are some other tar.gz file in the WORKDIR?=20
> Is there a way to ensure you just get the tarballs you are looking for?
It is reasonable for your query. I need add more information to select=20
the tarballs srpm wants instead of all.
>> +
>> + # append the name of tarball to key word 'SOURCE' in xxx.spec.
>> + def tail_source(d,source_list=3D[],patch_list=3DNone):
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + source_number =3D 0
>> + patch_number =3D 0
>> + for source in source_list:
>> + spec_preamble_top.append('Source' + str(source_number) + ': %s' %=20
>> source)
>> + source_number +=3D 1
>> + if patch_list:
>> + for patch in patch_list:
>> + print_deps(patch, "Patch" + str(patch_number), spec_preamble_top, d)
>> + patch_number +=3D 1
>> +
>> # We need a simple way to remove the MLPREFIX from the package name,
>> # and dependency information...
>> def strip_multilib(name, d):
>> @@ -707,6 +739,8 @@ python write_specfile () {
>> spec_preamble_bottom.append('License: %s' % splitlicense)
>> spec_preamble_bottom.append('Group: %s' % splitsection)
>>
>> + source_list =3D get_tarballs(d)
>> + tail_source(d,source_list,None)
>> # Replaces =3D=3D Obsoletes&& Provides
>> if splitrreplaces and splitrreplaces.strip() !=3D "":
>> for dep in splitrreplaces.split(','):
>> @@ -786,6 +820,7 @@ python write_specfile () {
>> del localdata
>> bb.utils.unlockfile(lf)
>>
>> + add_prep(d,spec_files_bottom)
>> spec_preamble_top.append('Summary: %s' % srcsummary)
>> spec_preamble_top.append('Name: %s' % srcname)
>> spec_preamble_top.append('Version: %s' % srcversion)
>> @@ -900,6 +935,25 @@ python write_specfile () {
>> python do_package_rpm () {
>> import os
>>
>> + def creat_srpm_dir(d):
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + licenses =3D d.getVar('LICENSE', 1).replace('&', '|')
>> + licenses =3D licenses.replace('(', '').replace(')', '')
>> + clean_licenses =3D ""
>> + for x in licenses.split():
>> + if x.strip() =3D=3D '' or x =3D=3D 'CLOSED':
> What about "Proprietary"
the purpose of doing this is for using licenses as a directory. So I=20
think x =3D=3D 'CLOSED' should be removed instead of adding this case. So=
=20
Proprietary does.
>> + continue
>> + if x !=3D "|":
>> + clean_licenses +=3D x
>> + if '|' in clean_licenses:
>> + clean_licenses =3D clean_licenses.replace('|','')
>> +
> Maybe this spinet should be a function in license.bbclass? Maybe it's=20
> there already, or is this too RPM specific?
>
if 'I' is a part of words from licenses, we should replace it. for=20
example, this case happen in LICENSE =3D "Artistic|GPL" from perl_5.14.2.=
bb
>> + pkgwritesrpmdir =3D=20
>> bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
>> + pkgwritesrpmdir =3D pkgwritesrpmdir + '/' + clean_licenses
>> + bb.mkdirhier(pkgwritesrpmdir)
>> + os.chmod(pkgwritesrpmdir, 0755)
>> + return pkgwritesrpmdir
>> +
>> # We need a simple way to remove the MLPREFIX from the package name,
>> # and dependency information...
>> def strip_multilib(name, d):
>> @@ -1015,8 +1069,17 @@ python do_package_rpm () {
>> cmd =3D cmd + " --define 'debug_package %{nil}'"
>> cmd =3D cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>> cmd =3D cmd + " --define '_tmppath " + workdir + "'"
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + cmdsrpm =3D cmd + " --define '_sourcedir " + workdir + "' --define=20
>> '_srcrpmdir " + creat_srpm_dir(d) + "'"
>> + cmdsrpm =3D 'fakeroot ' + cmdsrpm + " -bs " + outspecfile
>> cmd =3D cmd + " -bb " + outspecfile
>>
>> + # Build the source rpm package !
>> + if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and=20
>> d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() =3D=3D 'SRPM':
>> + d.setVar('SBUILDSPEC', cmdsrpm + "\n")
>> + d.setVarFlag('SBUILDSPEC', 'func', '1')
>> + bb.build.exec_func('SBUILDSPEC', d)
>> +
>> # Build the rpm package!
>> d.setVar('BUILDSPEC', cmd + "\n")
>> d.setVarFlag('BUILDSPEC', 'func', '1')
>



