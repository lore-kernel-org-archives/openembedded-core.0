Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RHHt7-0000f7-5f
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:24:05 +0200
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Oct 2011 09:18:10 -0700
Received: by qaea17 with SMTP id a17so6595361qae.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:18:10 -0700 (PDT)
Received: by 10.68.20.226 with SMTP id q2mr28526542pbe.115.1319213889041;
	Fri, 21 Oct 2011 09:18:09 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id g1sm19304490pbv.2.2011.10.21.09.18.07
	(version=SSLv3 cipher=OTHER); Fri, 21 Oct 2011 09:18:07 -0700 (PDT)
Message-ID: <4EA19B3E.2020302@intel.com>
Date: Fri, 21 Oct 2011 09:18:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319028214-27568-1-git-send-email-cliff.brake@gmail.com>
	<20111019212659.GA30050@sakrah.homelinux.org>
In-Reply-To: <20111019212659.GA30050@sakrah.homelinux.org>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH] squashfs-tools: add recipe (2nd try)
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
X-List-Received-Date: Fri, 21 Oct 2011 16:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 02:26 PM, Khem Raj wrote:
> On (19/10/11 08:43), Cliff Brake wrote:
>> From: Cliff Brake<cbrake@bec-systems.com>
>>
>> added xz compression option, general cleanup
>> ---
>>   .../squashfs-tools/squashfs-tools_4.2.bb           |   38 ++++++++++++++++++++
>>   1 files changed, 38 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
>>
>
> IIRC they did not work with thumb mode so you might have to add option
> to always build for arm mode when building for arm architectures.
> Add ARM_INSTRUCTION_SET = "arm" to the recipe
>
>> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
>> new file mode 100644
>> index 0000000..3a9f12a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
>> @@ -0,0 +1,38 @@
>> +# Note, we can probably remove the lzma option as it has be replaced with xz,
>> +# and I don't think the kernel supports it any more.
>> +DESCRIPTION = "Squashfs is a highly compressed read-only filesystem for Linux."
>
> I think this description is for the filesystem but the recipe is for
> tools. So probably saying something like "Tools for manipulate squashfs,
> ..." would be nice.
>
>> +SECTION = "base"
>> +LICENSE = "GPLv2&  Public Domain"
>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>> +                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
>> +                   "
>> +DEPENDS = "attr zlib xz"
>> +PR = "0"
>> +
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
>> +           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
>> +          "
>> +SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
>> +SRC_URI[squashfs.sha256sum] = "d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
>> +SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
>> +SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
>> +
>> +S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
>> +
>> +# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
>> +# the -e causes problems as CFLAGS is modified in the Makefile, so
>> +# we redefine EXTRA_OEMAKE here
>> +EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
>> +
>> +do_compile() {
>> +        oe_runmake mksquashfs
>> +}
>> +do_install () {
>> +        install -d ${D}${sbindir}
>> +        install -m 0755 mksquashfs ${D}${sbindir}/
>> +}
>> +
>> +# required to share same place with -lzma specific packages
>> +FILESPATHPKG =. "squashfs-tools-${PV}:"
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 1.7.1
>>
>>
This one is on hold pending an update from Cliff based on Khem's comments.

Sau!

>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



