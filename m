Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id BBB0860C22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 22:30:24 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id b8so6423449lan.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gsu5zIQRfKykSZKVFlww4yD5eya0OPp+jV5p9sHlFUo=;
	b=uKfonew69RKOoIIxXHe6UxshAxBUABtiosOGX+Go9n/05gItDXPj1W3ORk9vSKl+zD
	GbdVq6ELujV0MtRKcwctpZwAnd0y5dE5DO+Xh3TEZFmCvaR+7iY23Agr1u+nDOEECzO3
	+hIi2zuzaNY9qW/RkXIHX2DcU/mAdNLA0F1SuZw6KxiR1gQ0N7iXmBmx2Mu2ox7JICHA
	uvBsRnPq1HjDYRjIzTpzyOl1p09/YlzzVunYaFhRczwDGp4+j+I0Iltbt8/uQiZ/xjo8
	GbBkyDvzwtkQ4aJ0Titc/UyZGxYIw1A1TXSOdSYO+zg7Ew0EIi/2yHDXeLERUhA10ut3
	cjtA==
MIME-Version: 1.0
X-Received: by 10.152.18.229 with SMTP id z5mr7622721lad.27.1396305024496;
	Mon, 31 Mar 2014 15:30:24 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Mon, 31 Mar 2014 15:30:24 -0700 (PDT)
In-Reply-To: <CADkTA4OYz=MoE-aKGp2m--A0Rt-CKubGfNYmxvoqCRZ4KbU=fQ@mail.gmail.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<CADkTA4OYz=MoE-aKGp2m--A0Rt-CKubGfNYmxvoqCRZ4KbU=fQ@mail.gmail.com>
Date: Mon, 31 Mar 2014 18:30:24 -0400
Message-ID: <CADkTA4OpdAfXh5JWYU0Wiejpii8gKdTUB0Pp2=9jvG8LHQ=UxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] lnux-yocto: 3.14 updates
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
X-List-Received-Date: Mon, 31 Mar 2014 22:30:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 31, 2014 at 5:09 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Mar 31, 2014 at 1:56 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> Richard/Saul,
>>
>> Here are the remaining changes from my previous pull request for linux-yocto
>> updates.
>>
>> Now that 3.14 has been released, we have the full 3.14 kernel and associated
>> libc-headers .. with no PV games.
>
> As a follow up to this, make sure that you have a clean sysroot when
> building, we've
> heard of a couple of perf build failures (again), that sound like the
> header file issues
> you'll see if an older kernel for a given machine is in the sysroot.

replying to myself before I head out for food! The build of perf that
broke here, was
indeed a sysroot with 3.10 and 3.14 conflicting header files. My clean of the
sysroot and a rebuild has worked. So I don't know of any reproducible perf build
errors at the moment.

Bruce

>
> I'm trying another build of qemux86 to see if I can duplicate any
> issues, but won't
> be around for a few hours to confirm or deny anything.
>
> Bruce
>
>>
>> There is one new change in the libc-headers series, to adapt to the xz compression
>> of new headers, but otherwise, it is the same as before.
>>
>> [
>>    Subject: [PATCH 2/5] linux-libc-headers: make compression format configurable
>>
>>    As of the 3.13 kernel bz2 compressed tarballs are not available. To support
>>    older header tarballs, and newer ones that require the 'xz' compressed
>>    bundles, we can break out a variable that allows versioned libc headers to
>>    select the archive format that works.
>>
>>    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ]
>>
>> I've built and booted qemu* for this, so everything appears to be sane.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> The following changes since commit 4f80de9a568bcf0280c7e8b8f89ee6c2adfa477d:
>>
>>   linux-yocto/3.10: fix qemuarm build failure (2014-03-30 23:53:00 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib zedd/kernel
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (5):
>>   linux-yocto/3.14: introduce versioned recipes
>>   linux-libc-headers: make compression format configurable
>>   linux-libc-headers: add 3.14 libc headers
>>   libc-headers: set TC default to 3.14
>>   linux-libc-headers: remove 3.10 recipe
>>
>>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>>  .../linux-libc-headers/linux-libc-headers.inc      |  4 +-
>>  ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch | 50 ------------------
>>  ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 -------------
>>  ...efile.headersinst-install-headers-from-sc.patch | 59 ----------------------
>>  .../linux-libc-headers/linux-libc-headers_3.10.bb  | 11 ----
>>  .../linux-libc-headers/linux-libc-headers_3.14.bb  |  7 +++
>>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++
>>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 37 ++++++++++++++
>>  9 files changed, 69 insertions(+), 156 deletions(-)
>>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
>>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
>>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
>>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb
>>
>> --
>> 1.8.1.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

