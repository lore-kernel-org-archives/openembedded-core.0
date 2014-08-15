Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFAEC70C47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:56:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7FAuoMO026813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Aug 2014 03:56:50 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 03:56:49 -0700
Message-ID: <53EDE770.7000400@windriver.com>
Date: Fri, 15 Aug 2014 18:56:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1408092524.git.liezhi.yang@windriver.com>		<2209793d9f1cb962c181308634d3c2f36f9869fc.1408092524.git.liezhi.yang@windriver.com>	<1408092857.21596.7.camel@ted>
	<53EDE530.9090100@windriver.com>
In-Reply-To: <53EDE530.9090100@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gdb-cross-canadian: add nativesdk-ncurses-libncurses to RDEPENDS
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
X-List-Received-Date: Fri, 15 Aug 2014 10:56:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/15/2014 06:47 PM, Robert Yang wrote:
>
>
> On 08/15/2014 04:54 PM, Richard Purdie wrote:
>> On Fri, 2014-08-15 at 01:49 -0700, Robert Yang wrote:
>>> We had nativesdk-ncurses in the DEPENDS, also need add
>>> nativesdk-ncurses-libncurses to the RDEPENDS, otherwise libncurses.so.5
>>> is not in the rdepends chain.
>>
>> This doesn't make sense. Can you please give more information about the
>> problem you're solving here please?
>
> Sorry, I should put more info in the commit message. Yes, it doesn't
> make sense to package_rpm, but makes sense to package_ipk (verified)
> and package_deb (not yet verified).
>
> My host is X86_64 (doesn't matter)

(Sorry, I used a ctrl-X cut these mesasge, here is the set in local.conf
to reproduce the problem):

- Set these in local.conf:
   MACHINE = "qemux86-64"
   PACKAGE_CLASSES = "package_ipk"

// Robert

>
> # Make sure it is a clean build
> $ bitbake meta-toolchain -ccleansstate
>
> $ bitbake meta-toolchain
>
> $ find tmp/work/core2-64-poky-linux/meta-toolchain/1.0-r7/sdk/image/ | grep
> poky-linux-gdb
> tmp/work/core2-64-poky-linux/meta-toolchain/1.0-r7/sdk/image/opt/poky/1.6+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gdb
>
> #### Note gdb-cross has been installed
>
> $ find tmp/work/core2-64-poky-linux/meta-toolchain/1.0-r7/sdk/image/ | grep ncurses
> ### No output, libncurses.so isn't installed.
>
> And if we use PACKAGE_CLASSES = "package_rpm", we can see that libncurses.so
> is installed.
>
> This is because:
>
> $ rpm -qpR
> tmp/deploy/rpm/x86_64_nativesdk/gdb-cross-canadian-x86-64-7.7.1-r0.x86_64_nativesdk.rpm
> | grep ncurses
> libncurses.so.5()(64bit)
> ### There is a file depends (libncurses.so.5)
>
> $ dpkg-deb -I
> tmp/deploy/ipk/x86_64-nativesdk/gdb-cross-canadian-x86-64_7.7.1-r0_x86_64-nativesdk.ipk
> | grep ncurses
> ### No output, ipk knows nothing about the file depends (libncurses.so.5),
> ### so that it would not be  installed.
>
> I updated the commit message in the repo, please feel free to let me know if
> you have any questions.
>
> git://git.openembedded.org/openembedded-core-contrib rbt/python3-gdb
>
> We had nativesdk-ncurses in the DEPENDS, also need add
> nativesdk-ncurses-libncurses to the RDEPENDS, otherwise libncurses will
> not be installed when PACKAGE_CLASSES = "package_ipk" or deb.
>
> Fixed:
> - Set these in local.conf:
>    MACHINE = "qemux86-64"
>    PACKAGE_CLASSES = "package_ipk"
>
> $ bitbake meta-toolchain
> $ find tmp/work/core2-64-poky-linux/meta-toolchain/1.0-r7/sdk/image/ | grep ncurses
>    ## No output, ncurses isn't installed, but it should.
>
> // Robert
>
>>
>> If its a dynamically linked lib, the dependency should be detected
>> automatically.
>>
>> Cheers,
>>
>> Richard
>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc |    4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>>> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>>> index e594bb1..2be427a 100644
>>> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>>> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>>> @@ -7,7 +7,9 @@ BPN = "gdb"
>>>
>>>   DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext
>>> nativesdk-readline nativesdk-python"
>>>   RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang
>>> nativesdk-python-re \
>>> -                   nativesdk-python-codecs nativesdk-python-netclient"
>>> +                   nativesdk-python-codecs nativesdk-python-netclient \
>>> +                   nativesdk-ncurses-libncurses \
>>> +                  "
>>>
>>>   GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>>>
>>> --
>>> 1.7.9.5
>>>
>>
>>
>>
>>

