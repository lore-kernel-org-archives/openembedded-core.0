X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <394549e4-3ffb-a75a-bce8-dc6578ece827@pr.hu>
Date: Thu, 19 May 2022 10:25:47 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] python3-setuptools: Fix building python modules using cython
References: <20220518071525.4169607-1-zboszor@pr.hu>
 <PA4PR08MB741139CAFB8BBDFA572BA32DE8D19@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <588c0a97-4ea9-eb9a-833b-9d7fc2d97e17@pr.hu>
 <12ef2c6a-8e7d-d4d5-aea3-97728316fb86@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <12ef2c6a-8e7d-d4d5-aea3-97728316fb86@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

2022. 05. 18. 17:55 keltezéssel, Khem Raj írta:
> 
> 
> On 5/18/22 6:28 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> 2022. 05. 18. 14:32 keltezéssel, Ross Burton írta:
>>> I left a comment on the PR you filed, but the triplet thing seems to be a red herring 
>>> as the old code uses ‘in’ so a compiler called arm-poky-linux-gcc would still be 
>>> detected as gcc.
>>
>> The "in" is also a problem. Any command can have a
>> "gcc" substring somewhere in the middle.
>>
>> It's important that the command name ends in the pattern.
>>
>> Maybe compiler_name.endswith() would be a better choice
>> but a regex is less typing and more compact then spelling
>> out compiler_name.endswith() 4 times on the same line.
> 
> Sneaking clang under is_gcc() garb seems a bit dubious to me. Perhaps check if is_gcc is 
> meant to select some gcc'ness. Then you are better of detecting clang separately.

Python core has this particular quirk for some reason.
I thought is wasn't a big deal because of this.

But for this particular problem (passing "-Wl,-Rpath"
vs "-Rpath" to the compiler), the upstream distutils
has a different solution. It simply handles every other
system where GCC is not a thing then does -Wl,-R for
the remaining systems unconditionally.

It's just a matter of time when setuptools syncs with distutils.

> 
>>
>>>
>>> If this patch is just extending the logic to consider clang as gcc, then that should be 
>>> called out explicitly
> 
>>>
>>> Ross
>>>
>>> *From: *openembedded-core@lists.openembedded.org 
>>> <openembedded-core@lists.openembedded.org> on behalf of Zoltan Boszormenyi via 
>>> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org>
>>> *Date: *Wednesday, 18 May 2022 at 08:16
>>> *To: *openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>>> *Cc: *Zoltán Böszörményi <zboszor@gmail.com>
>>> *Subject: *[OE-core] [PATCH] python3-setuptools: Fix building python modules using cython
>>>
>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>
>>> The function _is_gcc() was not taking a machine triplet into
>>> account. Also handle clang and clang++ because they also
>>> want the rpath option via -Wl,-R instead of just -R.
>>>
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>>>   ...cross-compiler-prefixes-and-handle-c.patch | 31 +++++++++++++++++++
>>>   .../python/python3-setuptools_59.5.0.bb       |  1 +
>>>   2 files changed, 32 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch 
>>>
>>>
>>> diff --git 
>>> a/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch 
>>> b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch 
>>>
>>> new file mode 100644
>>> index 0000000000..7f91d8e6cd
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch 
>>>
>>> @@ -0,0 +1,31 @@
>>> +From 695800847eb519209c2b45e26fd65d3117a4efcd Mon Sep 17 00:00:00 2001
>>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>>> + <zboszor@gmail.com>
>>> +Date: Wed, 18 May 2022 06:51:22 +0200
>>> +Subject: [PATCH] Fix _is_gcc() for cross-compiler prefixes and handle
>>> + clang and clang++
>>> +
>>> +Upstream-Status: Submitted [https://github.com/pypa/setuptools/pull/3326 
>>> <https://github.com/pypa/setuptools/pull/3326>]
>>> +
>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> +---
>>> + setuptools/_distutils/unixccompiler.py | 3 ++-
>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/setuptools/_distutils/unixccompiler.py 
>>> b/setuptools/_distutils/unixccompiler.py
>>> +index 715408f5..3a4d642e 100644
>>> +--- a/setuptools/_distutils/unixccompiler.py
>>> ++++ b/setuptools/_distutils/unixccompiler.py
>>> +@@ -260,7 +260,8 @@ class UnixCCompiler(CCompiler):
>>> +         return "-L" + dir
>>> +
>>> +     def _is_gcc(self, compiler_name):
>>> +-        return "gcc" in compiler_name or "g++" in compiler_name
>>> ++        cnpat = re.compile('.*(gcc|g\+\+|clang|clang\+\+)$')
>>> ++        return not (cnpat.match(compiler_name) is None)
>>> +
>>> +     def runtime_library_dir_option(self, dir):
>>> +         # XXX Hackish, at the very least.  See Python bug #445902:
>>> +--
>>> +2.36.1
>>> +
>>> diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb 
>>> b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
>>> index f2810e18d3..20ecf5223d 100644
>>> --- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
>>> +++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
>>> @@ -11,6 +11,7 @@ SRC_URI:append:class-native = " 
>>> file://0001-conditionally-do-not-fetch-code-by-e 
>>> <file:///0001-conditionally-do-not-fetch-code-by-e>
>>>   SRC_URI += "\
>>> file://0001-change-shebang-to-python3.patch 
>>> <file:///0001-change-shebang-to-python3.patch> \
>>> file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch 
>>> <file:///0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch> \
>>> + file://0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch 
>>> <file:///0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch> \
>>>   "
>>>
>>>   SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
>>> -- 
>>> 2.36.1
>>>
>>> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and 
>>> may also be privileged. If you are not the intended recipient, please notify the sender 
>>> immediately and do not disclose the contents to any other person, use it for any 
>>> purpose, or store or copy the information in any medium. Thank you.
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>>
> 
> 
> 
> 

