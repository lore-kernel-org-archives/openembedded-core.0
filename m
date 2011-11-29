Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RVQwu-0001mU-Dt
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:54:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pATGllR4004095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 08:47:47 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 29 Nov 2011 08:47:47 -0800
Message-ID: <4ED50CB2.4060409@windriver.com>
Date: Tue, 29 Nov 2011 10:47:46 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1322070364.15626.17.camel@ted>
	<1322515367-22100-1-git-send-email-msm@freescale.com>
	<4ED502CA.7070505@linux.intel.com>
In-Reply-To: <4ED502CA.7070505@linux.intel.com>
Subject: Re: [PATCH] rpm_5.4.0.bb: Build rpm without xz
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
X-List-Received-Date: Tue, 29 Nov 2011 16:54:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, I didn't see this earlier.  We may need XZ support, externally, to work 
with packages from folks like Red Hat.

I'm not asking to revert this change.. just pointing out that people who are 
using RPM functionality should watch and see if this causes any negative impacts 
on their systems.

--Mark

On 11/29/11 10:05 AM, Saul Wold wrote:
> On 11/28/2011 01:22 PM, Matthew McClintock wrote:
>> This fixes the following issue:
>>
>> Log data follows:
>> | NOTE: Creating RPM package for perf-dbg
>> | NOTE: Creating RPM package for perf
>> | NOTE: Creating EMPTY RPM Package for kernel
>> | NOTE: Creating EMPTY RPM Package for kernel-3.0.9-00348-gec4b357
>> | NOTE: Creating RPM package for kernel-image-3.0.9-00348-gec4b357
>> | NOTE: Creating RPM package for kernel-dev
>> | NOTE: Creating RPM package for kernel-vmlinux
>> | NOTE: Not creating empty RPM package for kernel-misc
>> | NOTE: Creating RPM package for kernel-devicetree
>> | NOTE: Creating RPM package for kernel-module-libcrc32c
>> | NOTE: Creating RPM package for kernel-module-crc-itu-t
>> | NOTE: Creating RPM package for kernel-module-sctp
>> | NOTE: Creating RPM package for kernel-module-pcbc
>> | NOTE: Creating RPM package for kernel-module-crc32c
>> | NOTE: Creating RPM package for kernel-module-binfmt-misc
>> | NOTE: Creating RPM package for kernel-module-nfsd
>> | NOTE: Creating RPM package for kernel-module-exportfs
>> | NOTE: Creating RPM package for kernel-module-msdos
>> | NOTE: Creating RPM package for kernel-module-nls-utf8
>> | NOTE: Creating RPM package for kernel-module-udf
>> | NOTE: Creating RPM package for kernel-module-isofs
>> | NOTE: Creating RPM package for kernel-module-usbhid
>> | NOTE: Creating RPM package for kernel-module-scsi-wait-scan
>> | NOTE: Creating EMPTY RPM Package for kernel-modules
>> | /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/sysroots/x86_64-linux/usr/bin/rpmbuild.real: error while loading shared libraries: liblzma.so.5: cannot open shared object file: No such file or directory
>> | ERROR: Function 'BUILDSPEC' failed (see /local/home/mattsm/git/fsl-local-sdk/build_p4080ds_release/tmp/work/p4080ds-fsl-linux/linux-qoriq-sdk-3.0.6-r2/temp/log.do_package_write_rpm.18943 for further information)
>>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> ---
>> v2: changed from having xz in deps to just disabling xz
>>
>>    meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
>>    1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>> index f8fe836..77f0aba 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>> @@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>    DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
>>    extrarpmdeps = "python perl"
>>    extrarpmdeps_virtclass-native = "file-native"
>> -PR = "r23"
>> +PR = "r24"
>>
>>    # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>>    # in order to extract the distribution SRPM into a format we can extract...
>> @@ -156,6 +156,7 @@ EXTRA_OECONF = "--verbose \
>>    		--with-build-extlibdep \
>>    		--with-build-maxextlibdep \
>>    		--without-valgrind \
>> +		--without-xz \
>>    		--disable-openmp \
>>    		--enable-build-pic \
>>    		--enable-build-versionscript \
>
> Merged this into OE-Core
>
> Thanks
> 	Sau!
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



