Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 063A6726D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 15:36:32 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hs14so5750316lab.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YsaihmaVmhbpERBXMtgzc57WEU7fXyTjwzRdAefBMSc=;
	b=O5Y8lSsEWEWMn5m8WWT0avrzcwU11SIE1l4Ix10qOBFTaUA2teIg9m8fe+YHOiN4Lr
	6/muvs7ISCpPW5ZRBdSprnO14fMtgi+68iB3xPukmafbsz1c70HFgrufstKmQcq75LJq
	XKl17jlseAtCKKlF3dgYGM+aBaxwbFvKzaLNkin/H+iqW/3I5yauuvL82oksGt5ds/7z
	8nHlyNFTFg77EF40YM5bsrUPy+8le9Uz+UpINH+cUxt+e2nMWxOBKuIZJ8qBqlql7RPz
	BIAMKF3zUUByuvd6dCBDZvr3PaAFa1L5FMPQEc1nbPmN+P6lqQI5odAF2CKrrl9lplgX
	4big==
MIME-Version: 1.0
X-Received: by 10.112.211.130 with SMTP id nc2mr28730582lbc.0.1419348990763;
	Tue, 23 Dec 2014 07:36:30 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 23 Dec 2014 07:36:30 -0800 (PST)
In-Reply-To: <lyd27aabb0.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
	<ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418991892.13316.12.camel@linuxfoundation.org>
	<lysig715l0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1419324878.1777.5.camel@linuxfoundation.org>
	<lyd27aabb0.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 23 Dec 2014 11:36:30 -0400
Message-ID: <CADkTA4Pcmas6t_90HOq9ESzLoN3VCi4FX8fokEtNEU0=vnAiTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Tue, 23 Dec 2014 15:36:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 23, 2014 at 6:51 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>
>>> > In summary, basically, yes. The kernel source is huge and we were
>>> > compressing/decompressing it in several places on the critical
>>> > path.  People were struggling to develop kernels using the system
>>> > due to the overhead.
>>>
>>> I do not see how the new system makes it easier to "develop kernels".
>>
>> One of the complaints I keep hearing is how long the populate_sysroot
>> and package tasks take. I also get complaints about the sstate footprint
>> of those tasks.
>
> Perhaps, it should be possible to disable sstate'ing for certain recipes?
> In case of the new kernel build system, you swap the expensive sstate'ing
> with an expensive unpacking.
>
>
>> Imagine you're doing a "bitbake virtual/kernel -c compile -f", hacking
>> on a module, you then package and install it onto the target to test.
>
> 1. Are there really people who are doing such things?  There are much
>    more effective ways to do kernel development with OE (you have the
>    overhead from bitbake reading its database; do_compile() does not
>    deploy images on TFTP server nor the modules in the NFS sysroot).

There are definitely people doing this. And if the build system wouldn't
get in the way .. more definitely could.

>
> 2. This usecase is not supported by the current classes:
>
>    1. the 'bitbake virtual/kernel -c compile -f' removes .config and
>       System.map from the kernel sources (else, do_compile() will fail)

This one is going to be fixed with the follow up patches I mentioned
in another email, since we can maintain the output artifacts separate
from ${B} and build against them, that keeps us working with rm_work
and keeps things light.

>
>    2. trying to build the module (with 'M=...')will fail because .config
>       + System.map are missing in the source

#2 shouldn't happen if the module depends on the kernel's do_install
(as we intended), since that puts the external module build artifacts
back in place.

>
>
>>> to polluting sources with .config and related files, KBUILD_OUTPUT/VPATH
>>> builds are not possible from this tree.
>>
>> Agreed and I'm actually not happy about this. I think going forward
>> we'll need a second directory for these so we do keep the output
>> separate and can recompile against it.
>
> 'cp -al' a template kernel and .config etc. into ${WORKDIR} should be
> pretty fast.

With a split source and build configuration .. this shouldn't be needed.
If we start copying these things back into WORKDIR .. then something
is wrong.

Bruce

>
>
> Enrico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

