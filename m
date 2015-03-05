Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 21B9465C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:06:05 +0000 (UTC)
Received: by labgf13 with SMTP id gf13so27037641lab.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/955HLmHukKigwCztIJXXjAEpYzJ5odvnBYl/LYWSmQ=;
	b=KS+e27yz1BXVohWYfI89ViDR0ayJnzBlsQtp4x2DJN7y/NuCHxAefrYWzp6HWyj1TG
	9Rql2qs7tKY6gORL8YIBt8B75z32JydgN1h71OEozkL5YCX9a4ozOtpt2bZdoNgOgELn
	Y0+UJC4es4CXcRGDlsEIztw0XhunJtjsE5VYXgU/GyJ3oOxAVviCtjkVJp4pSHjxM4KU
	5fbYX91B1NtZvj1Lsf5hRVbVce+blfoS3fqkQ7zS3VUZgE+kvK6L5NHwJPj2yh/jwnab
	kP/zuf0WUv5C41ydKJlyUdgaxq9rhm/pj5v7YEoJ7OrtDW18cFTnEc1iLcvW7Bo79qni
	hurA==
X-Gm-Message-State: ALoCoQnwe9YWqGrOdxH0C/l8nV+1Ra5dShv+2KEo63a506G6y9YzU5FwkZM8Q98PEFm4ozI2f8mr
MIME-Version: 1.0
X-Received: by 10.112.146.66 with SMTP id ta2mr8358836lbb.0.1425564365877;
	Thu, 05 Mar 2015 06:06:05 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Thu, 5 Mar 2015 06:06:05 -0800 (PST)
In-Reply-To: <081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
	<081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
Date: Thu, 5 Mar 2015 19:36:05 +0530
Message-ID: <CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Mar 2015 14:06:06 -0000
Content-Type: text/plain; charset=UTF-8

On 4 March 2015 at 12:56, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On March 4, 2015 8:15:15 AM GMT+01:00, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>On 3 March 2015 at 23:27, Bernhard Reutner-Fischer
>><rep.dot.nop@gmail.com> wrote:
>>> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>>> Build iso image required syslinux package.  We have already skip the
>>syslinux
>>>> package.  Hence just skip the iso image build too.
>>>>
>>>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>>>> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
>>>> ---
>>>>  meta/classes/bootimg.bbclass |    6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/bootimg.bbclass
>>b/meta/classes/bootimg.bbclass
>>>> index a8e0c19..2edba3a 100644
>>>> --- a/meta/classes/bootimg.bbclass
>>>> +++ b/meta/classes/bootimg.bbclass
>>>> @@ -266,7 +266,11 @@ python do_bootimg() {
>>>>      if d.getVar("EFI", True) == "1":
>>>>          bb.build.exec_func('build_efi_cfg', d)
>>>>      bb.build.exec_func('build_hddimg', d)
>>>> -    bb.build.exec_func('build_iso', d)
>>>> +
>>>> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
>>>> +             return
>>>
>>> erm is this shell-code or python-code?
>>>
>>> For the former there is no "==" operator for POSIX-compliant test(1)
>>> implementations, for the latter the "[" looks suspicious.
>>>
>>> What am i missing?
>>> thanks,
>>
>>Ah my mistake, Probably I could have implemented as below
>>
>>if d.getVar('TARGET_ARCH', True) == "aarch64":
>>               return
>>
>>Does it make sense ?
>
> At least the parser should grok it.
> The change itself does not make sense to me either way.
I did this change because it does not make any sense to build the ISO
image for aarch64 architecture.  The HDD image should be sufficient.
Correct me if I am wrong.  I find a dependency of syslinux package to
build ISO image (isolinux.bin).  I have skipped the syslinux package
dependency @luvOS distribution.  The syslinux package contains lot of
x86 assembly code. That's the reason I just want to skip the ISO image
build for aarch64 architecture.

I will try to explain as much as possible in my next series patch
>
> Thanks,
>>
>>>> +    else:
>>>> +            bb.build.exec_func('build_iso', d)
>>>>  }
>>>>
>>>>  IMAGE_TYPEDEP_iso = "ext3"
>
>

