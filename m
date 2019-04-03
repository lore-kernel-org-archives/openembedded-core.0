Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19A296C0F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 07:48:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x337lk4S029242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Apr 2019 00:48:33 -0700
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 3 Apr 2019 00:48:08 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <a48654bd-c4df-694c-ad1f-3b2740a3aae9@windriver.com>
	<CAMKF1sp6X16_wMgg0_GCL3TjjnyfzvfrGxJuYBYEPooD-4PcnQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5747d0ee-6068-937c-da2e-2946b97f87ce@windriver.com>
Date: Wed, 3 Apr 2019 15:47:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp6X16_wMgg0_GCL3TjjnyfzvfrGxJuYBYEPooD-4PcnQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Link issue of virglrenderer on x86 with gcc options '-O2 -fvisibility=default'
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
X-List-Received-Date: Wed, 03 Apr 2019 07:48:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/3 上午12:16, Khem Raj wrote:
> On Tue, Apr 2, 2019 at 8:46 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>> Hi Raj,
>>
>> I meet a link problem of virglrenderer with gcc options '-O2
>> -fvisibility=default' configured in local.conf:
>>
>> SELECTED_OPTIMIZATION = "-O2 -fvisibility=default"
>>
>> It fails on qemux86 but succeeds on x86-64.
>>
>> And the error message:
>>
>> | i586-poky-linux-libtool: link: i586-poky-linux-gcc  -m32 -march=i586
>> -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
>> -Werror=
>> format-security
>> --sysroot=/home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-sysroot
>> -shared  -fPIC -DPIC
>>    .libs/virglrenderer.o  *-Wl,--whole-archive* ./.libs/libvrend.a
>> gallium/auxiliary/.libs/libgallium.a *-Wl,--no-whole-archive*  -lm -ldrm
>> -lgbm -lepoxy -lX1
>> 1  -m32 -march=i586 -fstack-protector-strong
>> --sysroot=/home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-
>> sysroot -O2 -Wl,-Bsymbolic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now   -pthread
>> -Wl,-soname
>> -Wl,libvirglrenderer.so.0 -o .libs/libvirglrenderer.so.0.2.0
>> |
>> /home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-sysroot-native/usr/bin/i586-poky-linux/../../libexec/
>> i586-poky-linux/gcc/i586-poky-linux/8.3.0/ld:
>> gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
>> R_386_GOTOFF against undefined symbol `ut
>> il_cpu_caps' can not be used when making a shared object
>>
>> It could pass if options -Wl,--whole-archive and -Wl,--no-whole-archive
>> are removed.
>>
>> It says 'relocation R_386_GOTOFF' but when I check the file, it shows
>> relocation type is R_386_GOT32X:
>>
>> $ readelf --relocs ./util/.libs/u_cpu_detect.o | grep util_cpu_caps
>> 00000092  0000102b R_386_GOT32X      00000004   util_cpu_caps
>>
>> AFAIK R_386_GOT32X is not used with PIC. But I don't know why the type
>> is R_386_GOT32X that -fPIC has been applied already?
>>
>> Any suggestion is great appreciated. Thanks.
>>
> it seems you have to build PIC archive for libgallium.a, it might not
> be using the right -fPIC flags during compile/link phase.

Hi Raj,

Thanks a lot.

It turns out that caused by link option '-Bsymbolic'. Replace with 
'-Bdynamic' could resolve the issue. And I'll send a patch to upstream.


Regards,
Kai


>
>> --
>> Kai Kang
>>

-- 
Kai Kang


