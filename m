Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43B05736BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 15:12:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t33FCYFI011240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Apr 2015 08:12:34 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Fri, 3 Apr 2015 08:12:33 -0700
Message-ID: <551EADE1.4010805@windriver.com>
Date: Fri, 3 Apr 2015 10:12:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1428000427-31985-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>,
	<8A26CDB0-D56F-4FBD-8F92-4EF3D4B664F1@gmail.com>
	<1428073036712.25265@caviumnetworks.com>
In-Reply-To: <1428073036712.25265@caviumnetworks.com>
Subject: Re: [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind and valgrind-dbg
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
X-List-Received-Date: Fri, 03 Apr 2015 15:12:34 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 4/3/15 9:57 AM, Krishnanjanappa, Jagadeesh wrote:
>> what is the point of packaging files for which there won’t be any runtime >environment. You are just better of removing them.
>> IMO unless you have multilib environment working
>> this patch is just relaxing the QA
> 
> With compilers supporting generation of multilib and yocto framework supporting generation of multilib rootfs, one can have this environment often. Instead of removing them, as said we can disable them from generation using configure options. Also the valgrind rpm package do include this files in its package.
> Link: http://www.rpmfind.net//linux/RPM/opensuse/13.2/x86_64/valgrind-3.10.0-1.1.x86_64.html

With a multilib configuration, these things should be packaged per-multilib and
then only the installed multilib components are available on the device.  It
saves space and preserves the checking in place to catch situations where you
may accidentally provide software that isn't runnable.

The other problem with permitting the system to query the compiler is the output
of the build is no longer deterministic.  If the toolchain configuration
changes, then the output of valgrind changes.  That should not happen.

--Mark

> Regards,
> Jagadeesh
> 
> 
> 
> ________________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, April 3, 2015 8:28 AM
> To: Krishnanjanappa, Jagadeesh
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind and valgrind-dbg
> 
>> On Apr 2, 2015, at 11:47 AM, Krishnanjanappa, Jagadeesh <Jagadeesh.Krishnanjanappa@caviumnetworks.com> wrote:
>>
>> From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>
>>
>> If a complier supports generating 32-bit and 64-bit binaries, then
>> while building valgrind we have two sets of binaries (32-bit and 64-bit)
>> being generated.
>>
>> Example: With compiler supporting generation of both 32-bit and 64-bit
>> binaries, and building valgrind in 64-bit mode, we come across following
>> QA Issue (listing only few of them),
>>
>> (snip)
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_exp-sgcheck-x86-linux.so
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/getoff-x86-linux
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_core-x86-linux.so
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_memcheck-x86-linux.so
>> -- CUT --
>>
>> However, we can build only 64-bit or 32-bit binaries in valgrind using
>> "--enable-only64bit" and "--enable-only32bit" configure options respectively.
>> And the required configure option can be selected based on SITEINFO_BITS, but
>> feel that if a compiler supports generation of both type of binaries and it
>> may be useful for users to have/execute both type of binaries on multilib
>> environment. So choosing to pack both types of binaries and skip errors if the
>> architecture type are different using INSANE_SKIP.
>>
> 
> what is the point of packaging files for which there won’t be any runtime environment. You are just better of removing them.
> IMO unless you have multilib environment working
> this patch is just relaxing the QA
> 
> 
>> Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
>> ---
>> meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> index bf80b16..eaa64c4 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> @@ -32,6 +32,8 @@ SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1d
>> COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>>
>> +PR = "r1"
>> +
>> inherit autotools ptest
>>
>> EXTRA_OECONF = "--enable-tls --without-mpicc"
>> @@ -52,6 +54,13 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
>>
>> RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
>>
>> +# skip checking of the Executable and Linkable Format (ELF) type, bit
>> +# size, and endianness of any binaries. If a compiler supports
>> +# generating 32-bit, 64-bit binaries, then we have two sets of
>> +# binaries i.e 32-bit and 64-bit.
>> +INSANE_SKIP_${PN} += "arch"
>> +INSANE_SKIP_${PN}-dbg += "arch"
>> +
>> do_compile_ptest() {
>>     oe_runmake check
>> }
>> --
>> 1.8.2.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


