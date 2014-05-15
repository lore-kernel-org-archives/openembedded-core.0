Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D5660660CC;
	Thu, 15 May 2014 13:26:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2014 06:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1059,1389772800"; d="scan'208";a="432556323"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2014 06:26:09 -0700
Message-ID: <5374C05E.9060305@intel.com>
Date: Thu, 15 May 2014 16:25:50 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <20140506170105.9D101503BF@opal.openembedded.org>
	<20140515111302.GC2433@jama>
In-Reply-To: <20140515111302.GC2433@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Valentin Popa : nettle: add nettle to oe-core
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
X-List-Received-Date: Thu, 15 May 2014 13:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2014 02:13 PM, Martin Jansa wrote:
> On Tue, May 06, 2014 at 05:01:05PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: e0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
>>
>> Author: Valentin Popa <valentin.popa@intel.com>
>> Date:   Mon Apr 28 17:28:19 2014 +0300
>>
>> nettle: add nettle to oe-core
>>
>> Newer versions of gnutls depends on nettle.
> Any idea why it fails in some builds like this:
>
> | checking whether ln -s works... yes
> | checking build system compiler gcc ... no
> | configure: error: Specified CC_FOR_BUILD doesn't seem to work
> | Configure failed. The contents of all config.log files follows to aid debugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
>
> config.log:
> configure:4412: checking build system compiler gcc
> configure:4425: gcc  conftest.c
> conftest.c: In function 'main':
> conftest.c:4:3: warning: incompatible implicit declaration of built-in function 'exit' [enabled by default]
>     exit(0);
>     ^
> configure:4428: $? = 0
> /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.out: cannot execute binary file
> /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./b.out: No such file or directory
> /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.exe: No such file or directory
> /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a_out.exe: No such file or directory
> /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./conftest: No such file or directory
> configure:4435: result: no
> configure:4440: error: Specified CC_FOR_BUILD doesn't seem to work
>
> export CC_FOR_BUILD="gcc "
>

I suspect the crosscompiler; for what arch&machine does this fail?

>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> new file mode 100644
>> index 0000000..87f1639
>> --- /dev/null
>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "A low level cryptographic library"
>> +HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>> +SECTION = "libs"
>> +LICENSE = "LGPLv2.1 & GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>> +                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>> +                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>> +
>> +DEPENDS += "gmp"
>> +
>> +SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
>> +SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
>> +
>> +do_configure_prepend() {
>> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
>> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> +       fi
>> +}
>> +
>> +inherit autotools
>> +
>> +BBCLASSEXTEND = "native"
>>
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


