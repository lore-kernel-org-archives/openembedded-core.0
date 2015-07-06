Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B43065CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 21:20:34 +0000 (UTC)
Received: by igcqs7 with SMTP id qs7so19464867igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=W1OhLDJshXlhJujFdLUBJ5mYEh72FmIpIvFiufzOmVU=;
	b=bC+CqzjB5Y7Zv5dLMuWQt7gmiGJgUeAIctbsZvviYiq6ekg1G7dWe2YWIMrFxmXEAg
	23xb2KZkz0fg9pUxMqlsZU2Lc45hGwMS5TxAoeOgrOxWPBrDUwoSy2Ot4yywxFyyc0ZU
	CwEgZ6/2Itvt2ul5HYzep6wXu6o6oZSy7MdgKMRFfQg4NPjFmPQJirePkyiM1QmmxUbB
	UKFKiJqgSAzrms4XnP3qkUtwZa+VY9pqjXmOQzIAuW3mWD7PtJPXdlTmaae2PGWSi1MF
	fqxFmUkrZs7gffB/KlCTIw72e8h96mQku9OBFCV1boWXgQ0+2UBmFOM5bCn0risEDEBN
	cG4w==
MIME-Version: 1.0
X-Received: by 10.50.62.148 with SMTP id y20mr70826072igr.17.1436217634408;
	Mon, 06 Jul 2015 14:20:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Mon, 6 Jul 2015 14:20:34 -0700 (PDT)
In-Reply-To: <559AF033.6090904@mlbassoc.com>
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
	<41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
	<20150706201018.GD2436@jama> <559AEEAC.8080005@linux.intel.com>
	<559AF033.6090904@mlbassoc.com>
Date: Mon, 6 Jul 2015 18:20:34 -0300
X-Google-Sender-Auth: p4EEdQFobH0bi5M6rNmO3FioW4k
Message-ID: <CAP9ODKrJtfUJhjk1b9XbphqAdRFoL6Eu1EmrSOG8Hu8_84H0rQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 21:20:38 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Mon, Jul 6, 2015 at 6:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-07-06 15:10, Alejandro Hernandez wrote:
>>
>> On 06/07/15 15:10, Martin Jansa wrote:
>>>
>>> On Mon, Jul 06, 2015 at 10:17:19AM +0000, Alejandro Hernandez wrote:
>>>
>>> +
>>> +This a similar behavior to the one on dpkg:
>>>
>>> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
>>> +
>>> +Upsteam-Status: Inappropriate
>>> Typo and why is it inappropriate? Looks like bugfix to me, even for
>>> issue which usually happens in OE way of using opkg-build.
>>
>>
>> It seemed inappropriate to me, since this behavior is not expected (number
>> of hardlinks changing), we can't say for sure that this error will be caused
>> by this reason on when using
>> opkg on another environment
>>>
>>> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
>>> +SRC_URI = "git://git.yoctoproject.org/opkg-utils "
>>> +
>>> +SRC_URI_append_class-native = "file://tar_ignore_error.patch"
>>> Add leading space in append not in original SRC_URI variable.
>>>
>>> Why is it applied only for native anyway?
>>
>>
>> Same argument as before, modifying the number of hardlinks while the tar
>> is created happens when building using bitbake, which should not happen on
>> target, if files changed when
>> creating an ipk for any other reason it shouldn't be ignored; space was a
>> typo
>
>
> Why is it happening when using bitbake?  This seems like an
> error to me - one should not be generating the tarball (i.e.
> packing up the final results) if the set of files being packaged
> is changing in any way.
>
> Note: I'm pretty sure that error can also happen if the inode
> changes in many different ways, not just the number of links
> changing.

I fully agree with Gary; this also makes unreproducible the number of
shared hard links in a final rootfs which is also important.

This (and dpkg related patch) seems to be covering the real bug.

(Adding Richard so he can also comment on this and to bring his
attention to the concerns exposed here)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

