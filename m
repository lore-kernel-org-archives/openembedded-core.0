Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1E73C75947
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 14:34:47 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so12430748igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1NgP+CgcMNR4SIeTLrv1gWQuhKzkoVM99k0nz7zH0lw=;
	b=NaZkEyJCoCgTmtl/ovISasfNsws8gMwCtmpHaoj12QeGYebfnQ+4yuBuhR5j/nCBOO
	xGVwtoT0TOqzzSjmd0aauUBKtq2vtBf0ssPwYElnPH9ObaZXwWUAzY/asYV75hlNrLMI
	eV2DcSRf0G/DGP2al2FhsKHwAZRfsEEoHvkOCbKj0ClSajADHLTJ2nZRXiKL3N/Hgbm/
	sqXMa3HyTI4fZSfh32xVO/yFj22rGtXUUQ3ATr1iEZvPD51XQi7+8vIDDoZ65/o4PshF
	6M536yekx54DzAXanle/ly1mSm+tVrkyqxd6A/Sq1tl74CTWQ1IJoX9V/4gVtcWRGVVO
	RoSg==
X-Received: by 10.42.226.8 with SMTP id iu8mr16516443icb.17.1434119688731;
	Fri, 12 Jun 2015 07:34:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Fri, 12 Jun 2015 07:34:18 -0700 (PDT)
In-Reply-To: <CAPHZmLbqstteh_AV2FHbJo_kgcQX504D9UfoKv4ENXLCJyYDBw@mail.gmail.com>
References: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
	<CAMKF1srsEC8EmOzDPAowKozKPADozZn+QqtNsBtMTt-sexDyjg@mail.gmail.com>
	<CAPHZmLbqstteh_AV2FHbJo_kgcQX504D9UfoKv4ENXLCJyYDBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jun 2015 10:34:18 -0400
Message-ID: <CAMKF1sotB-+UGWUUwR3Q67YJuua8-ePs_xvSf8Zsnd5Bh7dQBg@mail.gmail.com>
To: Martin Stolpe <martinstolpe@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [fido] binutils: fix native builds when host has gcc5
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
X-List-Received-Date: Fri, 12 Jun 2015 14:34:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 11, 2015 at 1:27 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
> Yes, it would be better to fix these warnings. But on the other hand
> this patch would just restore the previous behavior. So as a long term
> solution I agree with you that these warnings should be fixed but why
> not use a workaround until the problems are fixed?

who will fix it ? you have a problem at hand you are tackling try to
see if it can be dealt with best possible way.

 I wouldn't dare to
> try to fix these warnings on my own as these are just my first steps
> with Yocto and programming and I wouldn't be confident that my changes
> would be correct.

Even if this workaround has to be persisted then just contain the
workaround to native variants, and only for fido, it should not go
into master at all.

>
> 2015-06-10 17:42 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>> On Wed, Jun 10, 2015 at 10:26 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
>>> Problem is that when building binutils using GCC >=5.0
>>> warnings will be treated as errors which will cause
>>> the build to fail.
>>>
>>> Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
>>> ---
>>>  meta/recipes-devtools/binutils/binutils_2.24.bb | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
>>> index 738aaee..bc34a14 100644
>>> --- a/meta/recipes-devtools/binutils/binutils_2.24.bb
>>> +++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
>>> @@ -7,12 +7,15 @@ EXTRA_OECONF += "--with-sysroot=/ \
>>>                  --enable-install-libbfd \
>>>                  --enable-install-libiberty \
>>>                  --enable-shared \
>>> +                --disable-werror \
>>>                  "
>>>
>>>  EXTRA_OECONF_class-native = "--enable-targets=all \
>>>                               --enable-64-bit-bfd \
>>>                               --enable-install-libiberty \
>>> -                             --enable-install-libbfd"
>>> +                             --enable-install-libbfd \
>>> +                             --disable-werror \
>>> +                             "
>>
>> lowering the guards is not the right approach. I understand you want
>> to compile fido with distros that are released after fido.
>> but better would be to backport relevant fixed into component itself.
>>
>>>
>>>  do_install_class-native () {
>>>         autotools_do_install
>>> --
>>> 2.4.2
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

