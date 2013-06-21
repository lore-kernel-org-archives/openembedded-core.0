Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3128F605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5L83NNM023075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jun 2013 01:03:23 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 21 Jun 2013 01:03:21 -0700
Message-ID: <51C408AF.7040804@windriver.com>
Date: Fri, 21 Jun 2013 16:02:55 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1371619993.git.kai.kang@windriver.com>
	<d1dac9ed8f9cfe6b533e5676d766e2efeb12195a.1371619993.git.kai.kang@windriver.com>
	<1371629601.20823.161.camel@ted> <51C19398.9080401@windriver.com>
	<1371643063.20823.171.camel@ted>
In-Reply-To: <1371643063.20823.171.camel@ted>
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: update to 4.8
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
X-List-Received-Date: Fri, 21 Jun 2013 08:03:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月19日 19:57, Richard Purdie wrote:
> On Wed, 2013-06-19 at 19:18 +0800, Kang Kai wrote:
>> On 2013年06月19日 16:13, Richard Purdie wrote:
>>> On Wed, 2013-06-19 at 13:34 +0800, Kai Kang wrote:
>>>> Update strace to 4.8.
>>>>
>>>> * Update License file.
>>>> * Remove the backport patches which are already in version 4.8.
>>>> * Add file git-version-gen from git repo. Without this file configure
>>>>     fails.
>>>> * Add libaio and acl to PACKAGECONFIG for target package. Make libaio as a
>>>>     dependency by default which could be covered easily.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> [...]
>>>
>>>> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
>>>> new file mode 100644
>>>> index 0000000..eb9f660
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
>>>> @@ -0,0 +1,32 @@
>>>> +DESCRIPTION = "strace is a system call tracing tool."
>>>> +HOMEPAGE = "http://strace.sourceforge.net"
>>>> +SECTION = "console/utils"
>>>> +LICENSE = "BSD"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
>>>> +PR = "r0"
>>>> +
>>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>>>> +           file://git-version-gen"
>>>> +
>>>> +SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
>>>> +SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
>>>> +inherit autotools
>>>> +
>>>> +PACKAGECONFIG_class-target ?= "libaio"
>>>> +PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
>>>> +
>>>> +PACKAGECONFIG[libaio] = ",,libaio,"
>>>> +PACKAGECONFIG[acl] = ",,acl,"
>>> Are there not --enable/--disable type options we can pass into configure
>>> here to ensure build are deterministic?
>> Configure just check headers, no such --enable/--disable  options.

Hi Richard,

> Then we have a problem since something like:
>
> bitbake acl
> bitbake strace
>
> will build strace with acl enabled even though its not set in
> DISTRO_FEATURES and this means builds are not deterministic. We need to
> fix that.
I am working to add configure options to enable/disable acl & libaio.

>
>>> Please also send this with move detection enabled in git so we get a
>>> diff rather than a file removal/addition correctly shown (-M option to
>>> git format-patch for example).
>> It maybe changes too much that git doesn't take that as 'rename'.
>> I will take 'git mv' as a seperate commit but that commit is not
>> buildable, I will say that in comment.
> You can set to a different threshold with -M30 or similar...

I did not quit understand you at the beginning, because I thought there 
are something wrong with git commits. :)
There is '-M40' in script create-pull-request, I'll change it.

Thanks,
Kai

>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Neil | Kai Kang


