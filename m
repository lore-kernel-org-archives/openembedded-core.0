Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 923AD6C466
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 01:59:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x461xwtQ007099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 18:59:58 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 18:59:57 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
References: <20190430142351.92592-1-kai.kang@windriver.com>
	<9686ed6db87337e7f1a6c8ab72555f5d2ebadd02.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57ae95e7-939e-d5dc-983f-a35e8abfb13e@windriver.com>
Date: Mon, 6 May 2019 09:56:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9686ed6db87337e7f1a6c8ab72555f5d2ebadd02.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] virglrenderer: use gold linker for x86 if cflag -fvisibility=default set
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
X-List-Received-Date: Mon, 06 May 2019 01:59:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/30 下午10:46, Richard Purdie wrote:
> On Tue, 2019-04-30 at 10:23 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When gcc compile options '-fvisibility=default' is set in CFLAGS, it
>> fails to compile virglrenderer for x86:
>>
>>> i586-wrs-linux-libtool: link: i586-wrs-linux-gcc  -m32 -march=i586 ...
>>    -Wl,--whole-archive ./.libs/libvrend.a
>>    gallium/auxiliary/.libs/libgallium.a -Wl,--no-whole-archive ...
>>    -Wl,-Bsymbolic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>    -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now   -pthread
>>    -Wl,-soname -Wl,libvirglrenderer.so.0 -o .libs/libvirglrenderer.so.0.2.0
>>> ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
>>    R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
>>    when making a shared object
>>> ld: final link failed: bad value
>>> collect2: error: ld returned 1 exit status
>> It seems GNU bfd linker doesn't work well to handle option '-Bsymbolic'
>> and gcc option '-fvisibility=default'. Use gold instead under this
>> circumstance.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
>> index 225a0b8b0c..f72cfbd9b4 100644
>> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
>> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
>> @@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
>>   
>>   inherit autotools pkgconfig distro_features_check
>>   
>> +EXTRA_OEMAKE_x86 = "${@bb.utils.contains('CFLAGS', '-fvisibility=default', 'GM_LDFLAGS+=-fuse-ld=gold', '', d)}"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>>   
>>   REQUIRED_DISTRO_FEATURES = "opengl"
> Do we really want to start adding hacks to recipes to work around
> linker bugs like this?
>
> Has the bug been reported upstream? Why doesn't this happen on non-x86?

I have sent the v1 patch  to virglrenderer upstream

https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/213

And they said that link option  '-Bsymbolic' " just checks that all 
symbols are available, and if they are not you should hit a run-time 
error when the symbol is used,
in summary, the flag is there to make sure that we don't hit this kind 
of run-time error."

It also doesn't fail on x86-64. I suspect there is something wrong in 
gnu bfd linker for x86.


Regards,
Kai


>
> Cheers,
>
> Richard
>
>

-- 
Kai Kang


