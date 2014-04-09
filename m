Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B67765DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 07:49:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s397nOCH008223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Apr 2014 00:49:24 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 9 Apr 2014 00:49:23 -0700
Message-ID: <5344FB80.2010006@windriver.com>
Date: Wed, 9 Apr 2014 15:49:20 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1396600342.git.Chong.Lu@windriver.com>		
	<946d60db486d1ac1c5b3aecf64b029e8a15d42de.1396600342.git.Chong.Lu@windriver.com>	
	<1396608067.2910.110.camel@ted> <5343539B.3030808@windriver.com>
	<1396951684.24597.90.camel@ted>
In-Reply-To: <1396951684.24597.90.camel@ted>
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
X-List-Received-Date: Wed, 09 Apr 2014 07:49:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/08/2014 06:08 PM, Richard Purdie wrote:
> On Tue, 2014-04-08 at 09:40 +0800, Chong Lu wrote:
>> On 04/04/2014 06:41 PM, Richard Purdie wrote:
>>> On Fri, 2014-04-04 at 16:33 +0800, Chong Lu wrote:
>>>> Delete "<<<" syntax of bash in Makefile, else we would get following error:
>>>>
>>>>           Syntax error: redirection unexpected
>>>>
>>>> [YOCTO #6112]
>>>>
>>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
>>>>    .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ++++++++++++++++++++++
>>>>    .../trace-cmd-fix-syntax-error-of-shell.patch      | 30 ++++++++++++++++++++++
>>>>    meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
>>>>    4 files changed, 63 insertions(+), 1 deletion(-)
>>>>    create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>>>>    create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>>>>
>>>> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>>>> index 9268a50..d61097d 100644
>>>> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>>>> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>>>> @@ -15,7 +15,8 @@ inherit pkgconfig pythonnative
>>>>    SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>>>>               file://addldflags.patch \
>>>>               file://make-docs-optional.patch \
>>>> -           file://blktrace-api-compatibility.patch"
>>>> +           file://blktrace-api-compatibility.patch \
>>>> +           file://kernelshark-fix-syntax-error-of-shell.patch"
>>>>    S = "${WORKDIR}/git"
>>>>    
>>>>    EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
>>>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>>>> new file mode 100644
>>>> index 0000000..994a9fa
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>>>> @@ -0,0 +1,30 @@
>>>> +kernelshark: fix syntax error of shell
>>>> +
>>>> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
>>>> +
>>>> +	Syntax error: redirection unexpected
>>>> +
>>>> +Upstream-Status: Inappropriate [embedded specific]
>>> How is this embedded specific?
>>>
>>> Cheers,
>>>
>>> Richard
>> This issue only produced in yocto.
>> It is not problem for kernelshark and trace-cmd itself.
>> So I think this is embedded specific.
> I'm afraid I don't accept this explanation. Is Yocto's make different
> somehow which causes this error?
>
> I don't understand why yocto would see this error yet other systems
> (which use the same make as far as I know) would not.
>
> Cheers,
>
> Richard
>
Hi Richard,

I built kernelshark and trace-cmd in Ubuntu 12.04.
The dash is default shell in this distrobution.
So, this issue would produce only on host that the default shell is not 
bash.

Best Regards
Chong
>
>


