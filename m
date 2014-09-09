Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0180765E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 15:13:56 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id v10so9131595pde.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=T3IdND77LaoUNWFuHolGeOytx17DrqyGdgFGLfdsiks=;
	b=S3kpr1TzmS9BNKHpOW7ihgxnJ6VBIFaJf9Fm5qPXUU9FRWRxJaJ3l9IiatNSj9fn5O
	MySzRL3Ang89+iFFYe0cOGeCXrz/u/JD39dptU5Wsj6+uIMKJTg/KYbvL3sZkz4OZfKX
	3Pq9lOx03hMvZxyXVWw57bVx3a0GxzQQAp358iQdmey26x6809rnzpzQk95Ao0As9zzC
	Anb5sKQn+G06THb0m+N9oik3fQgmTg7TF1FTG0TkqczVyTJnqYM40+X1oFJ+GDZULOtl
	XR5sAYQTtlMlCkkeSpvxxeegZtfJ/inNYOYMYMhlXlicHriWS5bw/ek6j++mHsB8CTqj
	9Zlg==
X-Received: by 10.70.38.239 with SMTP id j15mr58599032pdk.109.1410275637943;
	Tue, 09 Sep 2014 08:13:57 -0700 (PDT)
Received: from [192.168.18.12] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	sd4sm11926280pbc.15.2014.09.09.08.13.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 08:13:56 -0700 (PDT)
Message-ID: <540F192A.8000401@gmail.com>
Date: Tue, 09 Sep 2014 08:13:46 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>	<1410227590-14190-2-git-send-email-akuster808@gmail.com>	<1410249927.19272.42.camel@ted>
	<540F12D0.3080900@windriver.com>
In-Reply-To: <540F12D0.3080900@windriver.com>
Subject: Re: [[PATCH] qemuppc64: add machine
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
X-List-Received-Date: Tue, 09 Sep 2014 15:13:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/09/2014 07:46 AM, Mark Hatle wrote:
> On 9/9/14, 3:05 AM, Richard Purdie wrote:
>> On Mon, 2014-09-08 at 18:53 -0700, Armin Kuster wrote:
>>> override USER_CLASSES as prelink does not currently
>>> work on ppc64
>>> ---
>>>   meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>   create mode 100644 meta/conf/machine/qemuppc64.conf
>>>
>>> diff --git a/meta/conf/machine/qemuppc64.conf
>>> b/meta/conf/machine/qemuppc64.conf
>>> new file mode 100644
>>> index 0000000..86916e5
>>> --- /dev/null
>>> +++ b/meta/conf/machine/qemuppc64.conf
>>> @@ -0,0 +1,16 @@
>>> +#@TYPE: Machine
>>> +#@NAME: qemu PPC 64 Emulator setup
>>> +#@DESCRIPTION: Machine configuration for running an PPC system under
>>> qemu emulation
>>> +
>>> +require conf/machine/include/qemu.inc
>>> +DEFAULTTUNE ?= "ppc64p6"
>>> +require conf/machine/include/tune-power6.inc
>>> +
>>> +#prelink broken
>>> +USER_CLASSES = "buildstats image-mklibs "
>>
>> This is horrible. Can we somehow blacklist qemuppc64 in the prelink
>> class itself?
>>
>> USER_CLASSES_remove = "prelink"
>>
>> would be better than overriding the users choice like above...
>
> I keep asking people who have access to the PPC 64 systems to
> investigate and help debug this.
>
> I don't expect it will be difficult to figure out, but I simply don't
> have access to this architecture to try.
>
> There is a YP bug, 1331
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=1331).
>
> So please, if you can help diagnose what is going wrong, I'd really like
> to fix this.

Will see what I can do.

- Armin

>
> --Mark
>
>> Cheers,
>>
>> Richard
>>
>>> +KERNEL_IMAGETYPE = "vmlinux"
>>> +
>>> +IMAGE_FSTYPES = "ext2 ext3"
>>> +
>>> +SERIAL_CONSOLE ?= "ttyS0"
>>> --
>>> 1.9.1
>>>
>>
>>
>

