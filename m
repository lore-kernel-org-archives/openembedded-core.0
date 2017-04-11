Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C143877CDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:46:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B2ksUR000994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 19:46:54 -0700 (PDT)
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 19:46:53 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20170410031440.32220-1-kai.kang@windriver.com>
	<1491809280.17200.128.camel@linuxfoundation.org>
	<c0e094a3-8959-e9e6-4c9a-c47a97996646@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3d68078e-c9c6-1934-be98-000a047088ab@windriver.com>
Date: Tue, 11 Apr 2017 10:46:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <c0e094a3-8959-e9e6-4c9a-c47a97996646@gmail.com>
Subject: Re: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Tue, 11 Apr 2017 02:46:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年04月11日 03:51, Khem Raj wrote:
>
> On 4/10/17 12:28 AM, Richard Purdie wrote:
>> On Mon, 2017-04-10 at 11:14 +0800, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Disable check gcc option -Wdeclaration-after-statement for powerpc
>>> and
>>> powerpc64 which causes compile failures:
>>>
>>>>    CC     build/SDL_blit_N.lo
>>>> .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
>>>> 2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
>>>> .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-
>>>> 2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids
>>>> mixed declarations and code [-Werror=declaration-after-statement]
>>>>       const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00,
>>>> 0x00, 0x00,
>>>>       ^~~~~
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   ...able-check-gcc-Wdeclaration-after-statement.patch | 20
>>> ++++++++++++++++++++
>>>   meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb       |  2 ++
>>>   2 files changed, 22 insertions(+)
>>>   create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/disable-
>>> check-gcc-Wdeclaration-after-statement.patch
>>>
>>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
>>> Wdeclaration-after-statement.patch b/meta/recipes-
>>> graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-
>>> statement.patch
>>> new file mode 100644
>>> index 0000000..ad48af7
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-
>>> Wdeclaration-after-statement.patch
>>> @@ -0,0 +1,20 @@
>>> +Upstream-Status: Inappropriate [disable feature]
>> Given upstream explicitly enable this warning and the issue looks to be
>> in their code, surely upstream would want to fix this.
>>
>> Also, would it not be easier to patch the code and fix this than
>> disabling the warning?
> yes, I think it should be fixed in code unless we know that this warning
> is being wrongly generated for ppc64

I suppose this a gcc bug about powerpc/ppc64. gcc 6 uses default 
'-std=gnu11' to compile but it stills fails with 'ISO C90 forbids...'.
Compare to x86, it also compiles with -Wdeclaration-after-statement and 
-Werror=declaration-after-statement too but succeeds.


Regards,
Kai
>
>> Cheers,
>>
>> Richard
>>
>>
>>> +Disable check gcc option -Wdeclaration-after-statement for powerpc
>>> and
>>> +powerpc64 which causes compile failures.
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +---
>>> +diff --git a/configure.in b/configure.in
>>> +index e2ddc9c..73b10f5 100644
>>> +--- a/configure.in
>>> ++++ b/configure.in
>>> +@@ -2950,7 +2950,7 @@ case "$host" in
>>> +             *-*-minix*)         ARCH=minix ;;
>>> +         esac
>>> +         CheckVisibilityHidden
>>> +-        CheckDeclarationAfterStatement
>>> ++#        CheckDeclarationAfterStatement
>>> +         CheckDummyVideo
>>> +         CheckDiskAudio
>>> +         CheckDummyAudio
>>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>>> index d747cf1..33963c1 100644
>>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
>>> @@ -20,6 +20,8 @@ SRC_URI = " \
>>>       file://0001-prepend-our-sysroot-path-so-that-make-finds-our-
>>> wayl.patch \
>>>       file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>>>   "
>>> +SRC_URI_append_powerpc = " file://disable-check-gcc-Wdeclaration-
>>> after-statement.patch"
>>> +SRC_URI_append_powerpc64 = " file://disable-check-gcc-Wdeclaration-
>>> after-statement.patch"
>>>   
>>>   S = "${WORKDIR}/SDL2-${PV}"
>>>   
>>> -- 
>>> 2.10.1
>>>


-- 
Regards,
Neil | Kai Kang


