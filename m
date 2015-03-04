Return-Path: <naresh.bhat@linaro.org>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id DD6CA65C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 07:15:15 +0000 (UTC)
Received: by lbvn10 with SMTP id n10so42282454lbv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 23:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EF3K9bPkmrtKeWCO061Fn2qmoAnGoLdYQ0ZSz/yr/h4=;
	b=j2S7neFVrmonvkEZ0LqZEl0OEf7hj/zE6Q2r18r6yTufkDUCSqSKuAs1Ictuk4JfFQ
	LMuYv49zOkbU0ZVWi33WEVh0MXBr6dpU/KOjHIM9+VHulQeGkpi4TUHMxfX9ziuqgj55
	zUom7LVGn25FshyUr087awk66b4sk93ZlfnqF3B9PMYuk+PlWxuAgYZr1q5Sk+9r3mG7
	JjAbE203qTincEUYKAc9hb0HfO0C8eAmjt2jR4lKGBNFImaNbcnj1ibnLpTfCeigOBtp
	+j3ePHh2uRIPlRbYJgWgXIElPiHb4312JVfLcszTArz9ciiXgAkMu+A7MPTP1hdv27a3
	w03w==
X-Gm-Message-State: ALoCoQkmJ2Jv4f6aar0JkzmtvenPETJJvqrHu4TrpSGOSZbzMeOc1su13UWdWJTW9wVKiHWgWXWP
MIME-Version: 1.0
X-Received: by 10.112.150.73 with SMTP id ug9mr2141557lbb.31.1425453315911;
	Tue, 03 Mar 2015 23:15:15 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Tue, 3 Mar 2015 23:15:15 -0800 (PST)
In-Reply-To: <CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
Date: Wed, 4 Mar 2015 12:45:15 +0530
Message-ID: <CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Wed, 04 Mar 2015 07:15:20 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 23:27, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Build iso image required syslinux package.  We have already skip the syslinux
>> package.  Hence just skip the iso image build too.
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
>> ---
>>  meta/classes/bootimg.bbclass |    6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index a8e0c19..2edba3a 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -266,7 +266,11 @@ python do_bootimg() {
>>      if d.getVar("EFI", True) == "1":
>>          bb.build.exec_func('build_efi_cfg', d)
>>      bb.build.exec_func('build_hddimg', d)
>> -    bb.build.exec_func('build_iso', d)
>> +
>> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
>> +             return
>
> erm is this shell-code or python-code?
>
> For the former there is no "==" operator for POSIX-compliant test(1)
> implementations, for the latter the "[" looks suspicious.
>
> What am i missing?
> thanks,

Ah my mistake, Probably I could have implemented as below

if d.getVar('TARGET_ARCH', True) == "aarch64":
               return

Does it make sense ?

>> +    else:
>> +            bb.build.exec_func('build_iso', d)
>>  }
>>
>>  IMAGE_TYPEDEP_iso = "ext3"

