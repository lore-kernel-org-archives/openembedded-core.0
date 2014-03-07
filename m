Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 422C66F694
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 07:51:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s277pf9L017534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Mar 2014 23:51:42 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 6 Mar 2014 23:51:40 -0800
Message-ID: <53197A88.9050307@windriver.com>
Date: Fri, 7 Mar 2014 15:51:36 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1394014083-9969-1-git-send-email-ming.liu@windriver.com>
	<1394177219.12327.25.camel@ted>
In-Reply-To: <1394177219.12327.25.camel@ted>
X-Originating-IP: [128.224.162.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package: let dependency on a package name to be architecture specific
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 07:51:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2014 03:26 PM, Richard Purdie wrote:
> On Wed, 2014-03-05 at 18:08 +0800, Ming Liu wrote:
>> For multilib builds that rpm is the first package backend, it would be
>> often desireable to express that a package of compatible architecture
>> is needed to satisfy a dependency. In most of the cases this is already
>> handled by the automatically extracted soname dependencies, but this is
>> not always the case: sometimes it's necessary to disable the automatic
>> dependency generation, and then there are cases where the information
>> cannot be automatically generated, such as: -dev package dependencies
>> on other -dev packages or plugins are dynamically loaded via dlopen,
>> leading to obscure build failure that a 32bit package would incorrectly
>> satisfy the dependency for a 64bit package and similarly vice versa.
>>
>> The patch mainly aims to resolve this problem, the basic idea is adding
>> a ARCH_SPECIFIC variable for packages satisfying following scenarios:
>>    * when rpm is being set as the first package backend
> I don't like this idea at all. It shouldn't matter whether rpm is set
> first or last, it should behave the same.
>
> I'm also rather dubious about this patch in general. It seems wrong to
> have to put this into generic code for what amounts to an rpm backend
> issue.
I was so thoughtless. Yes, you are correct, I should move them into 
pakcage_rpm.bbclass.

>
> Finally, this patch causes build failures in do_package_write_deb:
>
> eg:
>
> http://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/61/steps/BuildImages_1/logs/stdio
> http://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/82/steps/BuildImages/logs/stdio
>
> and many more. I'm trying to get the tree stablised and having build
> failures like this is extremely frustrating as once again I'm blocked on
> merging patches until I remove this patch and run another build :(
Sorry about that, I only test it with rpm and ipk, then I thought it 
should not impact deb, I will try to figure out the V2 patch and give it 
a full test.

//Ming Liu
>
> Cheers,
>
> Richard
>
>
>
>>    * it's not a allarch package
>>    * it only provides libs without bins meanwhile
>>
>> Every satisfied package would be set with
>> "ARCH_SPECIFIC_pkgname = 1:${TARGET_ARCH}" and it's gonna be written into
>> pkgdata if it exists, to mark the package as architecture specific, and
>> it will be checked during runtime_mapping_rename, all architecture
>> specific dependencies would be expanded with a ${TARGET_ARCH} suffix,
>> that declares a dependency on a package name architecture specific and
>> permits differentiating between 32-bit and 64-bit versions.
>>
>> Off course, the user could set "ARCH_SPECIFIC_pkgname = 0" in recipes to
>> disable this feature.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/classes/image.bbclass             |    6 +-
>>   meta/classes/package.bbclass           |   78 ++++++++++++++++++++++++++------
>>   meta/classes/populate_sdk_base.bbclass |    2 +-
>>   3 files changed, 68 insertions(+), 18 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 28b68f9..670f173 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -225,9 +225,9 @@ do_rootfs[prefuncs] += "rootfs_process_ignore"
>>   # may have occurred.
>>   python rootfs_runtime_mapping() {
>>       pn = d.getVar('PN', True)
>> -    runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
>> -    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
>> -    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
>> +    runtime_mapping_rename("PACKAGE_INSTALL", pn, False, d)
>> +    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, False, d)
>> +    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, False, d)
>>   }
>>   do_rootfs[prefuncs] += "rootfs_runtime_mapping"
>>   
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 0018a62..3e0ca30 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -346,19 +346,29 @@ def copydebugsources(debugsrcdir, d):
>>   # Package data handling routines
>>   #
>>   
>> -def get_package_mapping (pkg, basepkg, d):
>> +def get_package_mapping (pkg, basepkg, check_arch, d):
>>       import oe.packagedata
>>   
>> +    ret = pkg
>>       data = oe.packagedata.read_subpkgdata(pkg, d)
>> -    key = "PKG_%s" % pkg
>> +    pkg_key = "PKG_%s" % pkg
>> +    arch_key = "ARCH_SPECIFIC_%s" % pkg
>> +    arch_specific = '0'
>>   
>> -    if key in data:
>> +    if pkg_key in data:
>>           # Have to avoid undoing the write_extra_pkgs(global_variants...)
>> -        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
>> +        if bb.data.inherits_class('allarch', d) and data[pkg_key] == basepkg:
>>               return pkg
>> -        return data[key]
>> +        ret = data[pkg_key]
>>   
>> -    return pkg
>> +    if arch_key in data:
>> +        arch_specific = data[arch_key]
>> +
>> +    items = arch_specific.split(':')
>> +    if len(items) > 1 and items[0] == '1' and check_arch == True:
>> +        ret += '(' + items[1] + ')'
>> +
>> +    return ret
>>   
>>   def get_package_additional_metadata (pkg_type, d):
>>       base_key = "PACKAGE_ADD_METADATA"
>> @@ -371,13 +381,13 @@ def get_package_additional_metadata (pkg_type, d):
>>           metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
>>           return "\n".join(metadata_fields).strip()
>>   
>> -def runtime_mapping_rename (varname, pkg, d):
>> +def runtime_mapping_rename (varname, pkg, check_arch, d):
>>       #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
>>   
>>       new_depends = {}
>>       deps = bb.utils.explode_dep_versions2(d.getVar(varname, True) or "")
>>       for depend in deps:
>> -        new_depend = get_package_mapping(depend, pkg, d)
>> +        new_depend = get_package_mapping(depend, pkg, check_arch, d)
>>           new_depends[new_depend] = deps[depend]
>>   
>>       d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
>> @@ -1119,6 +1129,34 @@ python package_fixsymlinks () {
>>           d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
>>   }
>>   
>> +python package_check_arch () {
>> +    import glob, re
>> +
>> +    def check_arch_specific(pkg):
>> +        bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir", True)) + "$")
>> +        lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir", True)) + "($|/.*$)")
>> +        has_bins = 0
>> +        has_libs = 0
>> +
>> +        for file in pkgfiles[pkg]:
>> +            root = os.path.dirname(file)
>> +            if bin_re.match(root):
>> +                has_bins = 1
>> +            if lib_re.match(root):
>> +                has_libs = 1
>> +
>> +        if not bb.data.inherits_class('allarch', d) and not has_bins and has_libs:
>> +            if not d.getVar('ARCH_SPECIFIC_' + pkg):
>> +                d.setVar('ARCH_SPECIFIC_' + pkg, "%s:%s" % ('1', d.getVar('TARGET_ARCH', True)))
>> +
>> +    # Do nothing if rpm is not the first package backend
>> +    if d.getVar('PACKAGE_CLASSES', True).split()[0] != "package_rpm":
>> +        return
>> +
>> +    for pkg in sorted((d.getVar('PACKAGES', True) or "").split()):
>> +        check_arch_specific(pkg)
>> +}
>> +
>>   PKGDESTWORK = "${WORKDIR}/pkgdata"
>>   
>>   python emit_pkgdata() {
>> @@ -1184,6 +1222,16 @@ python emit_pkgdata() {
>>               pkgval = pkg
>>               d.setVar('PKG_%s' % pkg, pkg)
>>   
>> +        arch_specific = d.getVar('ARCH_SPECIFIC_%s' % pkg, True) or ""
>> +        items = arch_specific.split(':')
>> +        if len(items) > 1 and items[0] == '1':
>> +            rprovides = d.getVar('RPROVIDES_%s' % pkg, True)
>> +            if rprovides == None:
>> +                rprovides = pkg + ' (=' + d.getVar('EXTENDPKGV', True) + ')'
>> +            else:
>> +                rprovides += ' ' + pkg + ' (=' + d.getVar('EXTENDPKGV', True) + ')'
>> +            d.setVar('RPROVIDES_%s' % pkg, rprovides)
>> +
>>           pkgdestpkg = os.path.join(pkgdest, pkg)
>>           files = {}
>>           total_size = 0
>> @@ -1215,6 +1263,7 @@ python emit_pkgdata() {
>>           write_if_exists(sf, pkg, 'SECTION')
>>           write_if_exists(sf, pkg, 'PKG')
>>           write_if_exists(sf, pkg, 'ALLOW_EMPTY')
>> +        write_if_exists(sf, pkg, 'ARCH_SPECIFIC')
>>           write_if_exists(sf, pkg, 'FILES')
>>           write_if_exists(sf, pkg, 'pkg_postinst')
>>           write_if_exists(sf, pkg, 'pkg_postrm')
>> @@ -1878,6 +1927,7 @@ PACKAGESPLITFUNCS ?= " \
>>   PACKAGEFUNCS += " \
>>                   package_fixsymlinks \
>>                   package_name_hook \
>> +                package_check_arch \
>>                   package_do_filedeps \
>>                   package_do_shlibs \
>>                   package_do_pkgconfig \
>> @@ -2010,10 +2060,10 @@ def mapping_rename_hook(d):
>>       like debian.bbclass or manual PKG variable name changes
>>       """
>>       pkg = d.getVar("PKG", True)
>> -    runtime_mapping_rename("RDEPENDS", pkg, d)
>> -    runtime_mapping_rename("RRECOMMENDS", pkg, d)
>> -    runtime_mapping_rename("RSUGGESTS", pkg, d)
>> -    runtime_mapping_rename("RPROVIDES", pkg, d)
>> -    runtime_mapping_rename("RREPLACES", pkg, d)
>> -    runtime_mapping_rename("RCONFLICTS", pkg, d)
>> +    runtime_mapping_rename("RDEPENDS", pkg, True, d)
>> +    runtime_mapping_rename("RRECOMMENDS", pkg, True, d)
>> +    runtime_mapping_rename("RSUGGESTS", pkg, True, d)
>> +    runtime_mapping_rename("RPROVIDES", pkg, True, d)
>> +    runtime_mapping_rename("RREPLACES", pkg, True, d)
>> +    runtime_mapping_rename("RCONFLICTS", pkg, True, d)
>>   
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 235d672..3a7927a 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -54,7 +54,7 @@ fakeroot python do_populate_sdk() {
>>       from oe.manifest import create_manifest, Manifest
>>   
>>       pn = d.getVar('PN', True)
>> -    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
>> +    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, False, d)
>>   
>>       # create target/host SDK manifests
>>       create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
>
>
>


