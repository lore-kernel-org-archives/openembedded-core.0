Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9C07713F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 16:21:48 +0000 (UTC)
Received: by igvi2 with SMTP id i2so122522833igv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+o7Hiq+U7FvXKogGIOZI+kJvKGDvdyAD/x9LDICu+bk=;
	b=p/LLTdP3A96vfdjZgGYUVC43Kox6uWcQtMmjl0Be1p6FP1yXRuTk1IFI00VIBWe5Go
	RxApSDClCAjT6iqxn7ytZa6c7ngMF53EXfkZ99HxnOnO6CfFX7Cq/+NW3myKO2V8APay
	zTNhBYd66IHs7Feje1tMWcT7ig+TCUTKMJOPgkHm6TW9E8w6SW3+a5ta3onXcHR254FL
	dalkpUsj3gv9fQA2DuhfD8uYitzpnzmJcDM0fVrQJG/E1t9qoxn+wNdnPBiEFFRGoCXv
	/Mdj2CAqBwTBI6mTyWG46vyW8FI3gibLL2wyc5xOiIy69YZ0ws4Z98Lj8euc6IbPXfd1
	mXVw==
X-Received: by 10.50.156.103 with SMTP id wd7mr9574380igb.75.1447258907966;
	Wed, 11 Nov 2015 08:21:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 08:21:18 -0800 (PST)
In-Reply-To: <20151111123715.GK8060@bill-the-cat>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
	<CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
	<563B6674.1030106@pseudoterminal.org>
	<20151110130935.GU8499@bill-the-cat>
	<58549136-994C-4F05-9310-5235F4E2F618@gmail.com>
	<20151111123715.GK8060@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 08:21:18 -0800
Message-ID: <CAMKF1srEU3eSo2egf2es8qFxTq26xOJ8ogc8AWU7i0J13ubV=Q@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 11 Nov 2015 16:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 4:37 AM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Nov 10, 2015 at 07:59:03PM -0800, Khem Raj wrote:
>>
>> > On Nov 10, 2015, at 5:09 AM, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > On Thu, Nov 05, 2015 at 03:23:48PM +0100, Carlos Rafael Giani wrote:
>> >> On 11/05/2015 03:22 PM, Otavio Salvador wrote:
>> >>> Hello Carlos,
>> >>>
>> >>> On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
>> >>> <dv@pseudoterminal.org> wrote:
>> >>>> So, this is because of the TOOLCHAIN_OPTIONS ?
>> >>>> Also, what about the ${CC} ? Right now it won't work properly with =
clang for
>> >>>> example.
>> >>> The clang is problem might involve us to rework something but all th=
is
>> >>> needs to be based on last U-Boot releases; we shouldn't put
>> >>> workarounds and hacks on OE-Core without good reasons.
>> >>>
>> >>> Has the clang been tested with 2015.10?
>> >>
>> >> Still, then I'd add something to output an error message like
>> >> "U-Boot can only be compiled with gcc". Right now, the error
>> >> messages that would occur would be highly confusing and misleading.
>> >
>> > U-Boot supports clang, but it's not as well tested as other things.
>> > However, this patch is still wrong as we do not want to try and force
>> > flags to gcc, just like we don't with the kernel.  For more on U-Boot,
>> > see doc/README.clang (And then possibly do some fixups, I'm not having
>> > super luck with it right now, but I'm in a bit of a rush right now).
>> >
>>
>> This patch is however injecting flags externally, so in case you were to=
 use
>> clang with OE in context the TOOLCHAIN_OPTION will be appropriately set =
as well
>> so this should work fine. As far as u-boot=E2=80=99s own build architect=
ure is concerned
>> its fine. I think the real problem is arising due to toolchain defaults =
in OE
>> e.g. when we default to hard float gcc does not really use hard-float un=
less specified on commandline. One can argue that OE should be fixed for th=
at or gcc
>> should be using the right ABI as default which corresponds to default co=
nfigs as used for gcc in toolchain.
>>
>> One concern here I have is that when we switch float-abi like this, what=
 is the impact on u-boot itself, has it ever been build and tested with har=
d-float, as long as there are no float function arguments this should not d=
o anything to code
>> but then we need report on this.
>
> First, no, like the kernel, you do not go mucking with the float options
> that U-Boot wants to use.  OE is correctly today letting U-Boot enforce
> what it wants (and then from time to time exposing latent bug from cases
> where the toolchain ends up overriding us).
>

so here u-boot does have some expectations from toolchain, and at one
side it claims independence of hosted environment. So u-boot should be
adding -ffreestanding -nostdinc -nodefaultlibs  -nostdlib to its
compiler/linker flags otherwise toolchains can insert anything into
uboot
even without adding options on cmdline.

Radek, add -D__ARM_PCS_VFP to CFLAGS and that can get this going


> Second, it's currently a bit of a moot point as U-Boot for clang for ARM
> needs a bit of attention again as how we deal with global data is once
> again making clang unhappy and no one has gone and fixed it again.
>

Can you explain the problem a bit more ?

> --
> Tom

