Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1ShMac-0000tl-PN
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:13:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KF2D0T027205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jun 2012 08:02:13 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 20 Jun 2012 08:02:13 -0700
Message-ID: <4FE1E5E8.9090904@windriver.com>
Date: Wed, 20 Jun 2012 11:02:00 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
	<6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
	<4FE1E57D.8050803@intel.com>
In-Reply-To: <4FE1E57D.8050803@intel.com>
Cc: liang.li@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Wed, 20 Jun 2012 15:13:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-20 11:00 AM, Saul Wold wrote:
> On 06/20/2012 07:31 AM, Bruce Ashfield wrote:
>> From: Liang Li<liang.li@windriver.com>
>>
>> perf has been coupled to the kernel packages via kernel.bbclass.
>> While maintaining the build of perf out of the kernel source tree
>> is desired the package coupling has proved to be awkward in
>> several situations such as:
>>
>> - when a kernel recipe doesn't want to build/provide perf
>> - when licensing of dependencies would prohibit perf and hence
>> the kernel from being built.
>>
>> To solve some of these problems, this recipe is the extraction of
>> the linux-tools.inc provided perf compilation into a standalone
>> perf recipe that builds out of the kernel source, but is otherwise
>> independent.
>>
>> No new functionality is provided above what the linux-tools.inc
>> variant provided, but the separate recipe provides baseline for
>> adding new functionality.
>>
>> Signed-off-by: Liang Li<liang.li@windriver.com>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>> meta/classes/kernel.bbclass | 7 +----
>> meta/recipes-kernel/perf/perf_3.4.bb | 50
>> ++++++++++++++++++++++++++++++++++
>> 2 files changed, 51 insertions(+), 6 deletions(-)
>> create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 690de96..8d52d74 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -469,7 +469,7 @@ python populate_packages_prepend () {
>> metapkg = "kernel-modules"
>> d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>> d.setVar('FILES_' + metapkg, "")
>> - blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
>> 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
>> + blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
>> 'kernel-vmlinux', 'kernel-misc' ]
>> for l in module_deps.values():
>> for i in l:
>> pkg = module_pattern % legitimize_package_name(re.match(module_regex,
>> os.path.basename(i)).group(1))
>> @@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
>>
>> EXPORT_FUNCTIONS do_deploy
>>
>> -# perf must be enabled in individual kernel recipes
>> -PACKAGES =+ "perf-dbg perf"
>> -FILES_perf = "${bindir}/* \
>> - ${libexecdir}"
>> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb
>> b/meta/recipes-kernel/perf/perf_3.4.bb
>> new file mode 100644
>> index 0000000..997beb4
>> --- /dev/null
>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>> @@ -0,0 +1,50 @@
>> +SUMMARY = "Performance analysis tools for Linux"
>> +DESCRIPTION = "Performance counters for Linux are a new kernel-based \
>> +subsystem that provide a framework for all things \
>> +performance analysis. It covers hardware level \
>> +(CPU/PMU, Performance Monitoring Unit) features \
>> +and software features (software counters, tracepoints) \
>> +as well."
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>> +
>> +PR = "r0"
>> +
>> +BUILDPERF_libc-uclibc = "no"
>> +
>> +DEPENDS = "virtual/kernel \
>> + virtual/${MLPREFIX}libc \
>> + ${MLPREFIX}elfutils \
>> + ${MLPREFIX}binutils \
>> + "
>> +RDEPENDS_${PN} += "elfutils perl python"
>> +
> Do you need to duplicated elfutils here?

AFAIK yes. Since perf uses them on the target.

>
> And are both perl and python required on the runtime to use perf?

Yes. With all the perf bindings, which is the plan, and one of the
main points in pulling this out from the kernel itself.

>
> Can we package the perl and python bits independently? Does it make
> sense to do that? I have not used the kernel perf tools.

That's down the road, TomZ is waiting for this to work on exactly
that.

Bruce

>
> Sau!
>
>
>> +PROVIDES = "virtual/perf"
>> +
>> +inherit kernel-arch
>> +
>> +S = "${STAGING_KERNEL_DIR}"
>> +B = "${WORKDIR}/${BPN}-${PV}"
>> +
>> +EXTRA_OEMAKE = \
>> + '-C ${S}/tools/perf \
>> + O=${B} \
>> + CROSS_COMPILE=${TARGET_PREFIX} \
>> + ARCH=${ARCH} \
>> + CC="${CC}" \
>> + AR="${AR}" \
>> + prefix=/usr \
>> + NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
>> + '
>> +
>> +do_compile() {
>> + oe_runmake all
>> +}
>> +
>> +do_install() {
>> + oe_runmake DESTDIR=${D} install
>> +}
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>



