Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 645146F91A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 01:40:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s381elAM026373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Apr 2014 18:40:47 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 7 Apr 2014 18:40:46 -0700
Message-ID: <5343539B.3030808@windriver.com>
Date: Tue, 8 Apr 2014 09:40:43 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1396600342.git.Chong.Lu@windriver.com>	
	<946d60db486d1ac1c5b3aecf64b029e8a15d42de.1396600342.git.Chong.Lu@windriver.com>
	<1396608067.2910.110.camel@ted>
In-Reply-To: <1396608067.2910.110.camel@ted>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Tue, 08 Apr 2014 01:40:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/04/2014 06:41 PM, Richard Purdie wrote:
> On Fri, 2014-04-04 at 16:33 +0800, Chong Lu wrote:
>> Delete "<<<" syntax of bash in Makefile, else we would get following error:
>>
>>          Syntax error: redirection unexpected
>>
>> [YOCTO #6112]
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
>>   .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ++++++++++++++++++++++
>>   .../trace-cmd-fix-syntax-error-of-shell.patch      | 30 ++++++++++++++++++++++
>>   meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
>>   4 files changed, 63 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>>   create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>>
>> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> index 9268a50..d61097d 100644
>> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> @@ -15,7 +15,8 @@ inherit pkgconfig pythonnative
>>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>>              file://addldflags.patch \
>>              file://make-docs-optional.patch \
>> -           file://blktrace-api-compatibility.patch"
>> +           file://blktrace-api-compatibility.patch \
>> +           file://kernelshark-fix-syntax-error-of-shell.patch"
>>   S = "${WORKDIR}/git"
>>   
>>   EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>> new file mode 100644
>> index 0000000..994a9fa
>> --- /dev/null
>> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>> @@ -0,0 +1,30 @@
>> +kernelshark: fix syntax error of shell
>> +
>> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
>> +
>> +	Syntax error: redirection unexpected
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
> How is this embedded specific?
>
> Cheers,
>
> Richard
This issue only produced in yocto.
It is not problem for kernelshark and trace-cmd itself.
So I think this is embedded specific.

Best Regards
Chong
>> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> +---
>> + Makefile |    3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index c1fa906..be84415 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -89,8 +89,7 @@ endif
>> +
>> + # $(call test-build, snippet, ret) -> ret if snippet compiles
>> + #                                  -> empty otherwise
>> +-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
>> +-	                  <<<'$1' && echo y), $2)
>> ++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
>> +
>> + # have udis86 disassembler library?
>> + udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>> new file mode 100644
>> index 0000000..79abad5
>> --- /dev/null
>> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>> @@ -0,0 +1,30 @@
>> +trace-cmd: fix syntax error of shell
>> +
>> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
>> +
>> +       Syntax error: redirection unexpected
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> +---
>> + Makefile |    3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index c1fa906..7973c53 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -89,8 +89,7 @@ endif
>> +
>> + # $(call test-build, snippet, ret) -> ret if snippet compiles
>> + #                                  -> empty otherwise
>> +-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
>> +-	                  <<<'$1' && echo y), $2)
>> ++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
>> +
>> + # have udis86 disassembler library?
>> + udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
>> index 74eafbb..a0c823b 100644
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
>> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>>              file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
>>              file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
>>              file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
>> +           file://trace-cmd-fix-syntax-error-of-shell.patch \
>>   "
>>   S = "${WORKDIR}/git"
>>   
>> -- 
>> 1.8.1.2
>>
>
>
>


