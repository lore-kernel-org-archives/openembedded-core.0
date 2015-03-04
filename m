Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id EFD39738B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 07:26:21 +0000 (UTC)
Received: by wivz2 with SMTP id z2so8856756wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 23:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=jMvi5Ged1rMNt6cx2/b5LrRZU4alOwQdfmr8qA89Jug=;
	b=S3ro5vgfw05hJPW9vPCXAE1N6mngwEq0UU9mHqd8iR6SOTzRTehJ60fFsuKMgjPJ4k
	YwQRZThFXopK/ecg7DmCRgvv7Lyms6BBgGaduG6Z7clBuBMF3sPchUdWNPI5j8V/bjR3
	iSAAbvd9jHiyd76Zq8ZU4aoT6aEXhn8hwU2CILZPCKFLPwtq9wnl6hA7kV9TCa7QqzWY
	vDL/OSWbteIOGEqeaqS0I+iAY0qhzt8UPaHAf8act80C1Vy5HBXIeSDfQ5BchL+y+NJ/
	wzEzRdAuWkl4GYdUwBZ6xQisR4HWZg43s7iAfPyGzlo0SRvojI9stHNR4ivjlYcKmOfl
	6DxA==
X-Received: by 10.194.184.148 with SMTP id eu20mr4702936wjc.77.1425453981858; 
	Tue, 03 Mar 2015 23:26:21 -0800 (PST)
Received: from [10.34.113.24] (089144213024.atnat0022.highway.a1.net.
	[89.144.213.24])
	by mx.google.com with ESMTPSA id y3sm4643252wju.14.2015.03.03.23.26.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 23:26:21 -0800 (PST)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 04 Mar 2015 08:26:07 +0100
To: Naresh Bhat <naresh.bhat@linaro.org>
Message-ID: <081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
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
X-List-Received-Date: Wed, 04 Mar 2015 07:26:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 4, 2015 8:15:15 AM GMT+01:00, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>On 3 March 2015 at 23:27, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>> Build iso image required syslinux package.  We have already skip the
>syslinux
>>> package.  Hence just skip the iso image build too.
>>>
>>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>>> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
>>> ---
>>>  meta/classes/bootimg.bbclass |    6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/bootimg.bbclass
>b/meta/classes/bootimg.bbclass
>>> index a8e0c19..2edba3a 100644
>>> --- a/meta/classes/bootimg.bbclass
>>> +++ b/meta/classes/bootimg.bbclass
>>> @@ -266,7 +266,11 @@ python do_bootimg() {
>>>      if d.getVar("EFI", True) == "1":
>>>          bb.build.exec_func('build_efi_cfg', d)
>>>      bb.build.exec_func('build_hddimg', d)
>>> -    bb.build.exec_func('build_iso', d)
>>> +
>>> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
>>> +             return
>>
>> erm is this shell-code or python-code?
>>
>> For the former there is no "==" operator for POSIX-compliant test(1)
>> implementations, for the latter the "[" looks suspicious.
>>
>> What am i missing?
>> thanks,
>
>Ah my mistake, Probably I could have implemented as below
>
>if d.getVar('TARGET_ARCH', True) == "aarch64":
>               return
>
>Does it make sense ?

At least the parser should grok it.
The change itself does not make sense to me either way.

Thanks,
>
>>> +    else:
>>> +            bb.build.exec_func('build_iso', d)
>>>  }
>>>
>>>  IMAGE_TYPEDEP_iso = "ext3"



