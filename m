Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5A260990
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 08:33:36 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so2098839lbh.37
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=M4GcU7VUoFno1mzHGlgXtLQA8rexcjlMXQGKxM6V7Rc=;
	b=pbJMgNjU2N7e98AOugUXEiF6AH56xcPmrPs3S+6CJyQOSUn9SO1KhjCrlLJzansOAi
	ejPLHm1RNoZxMtzghqo1+D0PJfZx3FiZ/JhGUq6v+8Mw1L0Sc5a0vkTjjEHTcZYC5R1L
	M/lRtiRyYkJVg7hyWzry8izA7XB8IBc6WuXZZO66WXVTlnyGgstl7eVZRrVNa7cz9AM4
	+TE8seIQx9CyV5dPqzE2bRWfUSMK/Jxe3C6FBLbwNaQl5HYCMI+Kx7Bgund8+/T+s4Fm
	wvhZSan+NESIqeVfmnf6rN16nBgQXw52nKBYThUSLKGj3x3sZiiF/uGd/RNx1bXUUs4Z
	qjVg==
MIME-Version: 1.0
X-Received: by 10.152.2.130 with SMTP id 2mr630014lau.35.1377506017189; Mon,
	26 Aug 2013 01:33:37 -0700 (PDT)
Received: by 10.112.209.40 with HTTP; Mon, 26 Aug 2013 01:33:37 -0700 (PDT)
In-Reply-To: <52175BE0.8010403@windriver.com>
References: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1sp9sfkrRCaU6JwzN0YESyP=pd5n1oUcGz_fNj3OTTv6-g@mail.gmail.com>
	<52175BE0.8010403@windriver.com>
Date: Mon, 26 Aug 2013 10:33:37 +0200
Message-ID: <CAAQYJAv7RiJZ8vPAx3cS7CDEbqQDWz5wCkY1hq37SBfv2R20wg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Mon, 26 Aug 2013 08:33:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 2:56 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> On 08/23/2013 01:16 AM, Khem Raj wrote:
>> On Thu, Aug 22, 2013 at 4:04 PM, Jason Wessel
>> <jason.wessel@windriver.com> wrote:
>>> This patch aims to fix the following two cases for the INITRAMFS genera=
tion.
>>>   1) Allow an image recipe to specify a paired INITRAMFS recipe such
>>>      as core-image-minimal-initramfs.  This allows building a base
>>>      image which always generates the needed initramfs image in one ste=
p
>>>   2) Allow building a single binary which contains a kernel and
>>>      the initramfs.
>> I think this could be a bit simpler. Have a full kernel image recipe (
>> kernel + initramfs)
>> separate. It fits into the equation nicely. The final image can bundle
>> initramfs which has modules from practically same kernel build is
>> staged step 1 of kernel build which
>> automatically happens today for any image build.
>
> The changes I put together are work around the circular dependency proble=
m.  Staging and using another recipe is certainly an option.
>
> What I really wanted to do was have just another image type not unlike cp=
io, ext3, etc...  But this was not possible because there was no way to get=
 back to the point that the kernel could be re-linked and make the call to =
the kernel methods and get the context correct.   I had tried using the int=
ernal method for exec_task from the image recipe context but there appeared=
 to be no direct way to get this to work.
>
>
>
>
>>
>> The new recipe for kernel+initramfs requires the existing kernel
>> recipes and tweaks the .config to enable INITRAMFS_IMAGE
>>
>> You can share the sources for both stages where kernel is built like
>> gcc is putting the sources under work-shared and building all gcc
>> recipes out of this location.
>
>
> Ideally we could use the sysroot to regenerate the combined image, but th=
is was not low hanging fruit.  If we came up with a way to generate the com=
bined kernel+initramfs image directly from the sysroot this could easily be=
 controlled by just having it as an IMAGE_FEATURE as opposed to making dist=
inct image types.
>
>
> Jason.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Some more thoughts:

I'd like to point out that we introduced a variable called INITRAMFS_FSTYPE=
S

http://cgit.openembedded.org/openembedded-core/commit/meta/conf/bitbake.con=
f?id=3D17f7f3a43e863d9e2a16dd02face5137a4f4b225


and that we have an initial initramfs framework (modular, similar to
the one in oe-classic) :

http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ini=
trdscripts?id=3D7b69ad2167a1f0e57db82817b98a0cbcb70a0dd3

Maybe this framework could be extended for the typical simple needs (
I know our linux-yocto-tiny-kexecboot is a rather complicated
example).

Cheers

Andrea

