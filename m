Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1BEB6C233
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Nov 2018 01:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAA1EVYR006799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 17:14:32 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 9 Nov 2018 17:14:31 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
Date: Sat, 10 Nov 2018 09:14:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Sat, 10 Nov 2018 01:14:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/11/10 上午6:50, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-11-09 at 17:12 +0800, Hongxu Jia wrote:
>> -PACKAGECONFIG = "libgcrypt"
>> +PACKAGECONFIG ??= "libgcrypt libjitterentropy"
>>   PACKAGECONFIG_libc-musl = "libargp"
>>   PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
>>   PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
>> +PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterntropy,libjitterentropy"
>> +
>> +# Refer autogen.sh in rng-tools
>> +do_configure_prepend() {
>> +    cp ${S}/README.md ${S}/README
>> +}
>>   
>>   do_install_append() {
>>       # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
> This fails on musl, likely as the libc-musl override wasn't tweaked. It
> also means that the no libjitterentropy case wasn't tested as there is
> a typo likely causing this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/190/steps/7/logs/step1b

Sorry, I am working on it

//Hongxu

> There are also other weird hangs being observed on the autobuilder
> after these changes. I can't prove its this patchset but I am
> suspicious and its something in master-next as things were working just
> fine until we started poking around all this again :(
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio
>
>
> Cheers,
>
> Richard
>
>
>


