Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SOGNU-0005FH-DE; Sun, 29 Apr 2012 00:44:32 +0200
Received: by lbbgo4 with SMTP id go4so1221419lbb.6
	for <multiple recipients>; Sat, 28 Apr 2012 15:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YiCYo84/kn75+nurtuMu1tYRMDOApYBXtJWpbZ59Lc8=;
	b=CG8+AoCO31KkIztPokuCoLAAmLAGtH/Oj3BZp985O/5S4E1oIEBLa0zYpdC0ZmlSaN
	2vI0S4jxZ+AUAQn938i6PzdxKJzyfzD9xppd+AgqfEBUfGUZBlTZFg5cPc0fBI0ntghv
	X0B3WVSXDH3I6HyTXLqN5sVta3Xt1tdaG+F1b9aHAzGV2HHKJ+kQVzyNF9bZu/YN3Y37
	NQCjLg/CROZYKppRXR6g8/IcaEuSLNXkNcc1feGpwfAqxFujfSc7JQMyf9DRC/oMstGE
	o4SsSF8I7paPRvgYRbd0bBw/f5lG4gfA04fNsNmmytv96WN/2oIqmuGrs3l6QDvfElit
	UwQA==
Received: by 10.112.32.72 with SMTP id g8mr1674857lbi.43.1335652492051; Sat,
	28 Apr 2012 15:34:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 15:34:21 -0700 (PDT)
In-Reply-To: <CADkTA4PEsqyFvjsUkj_4zzRO7MtxLv-B7gKE7ZOYtjg=0WX19g@mail.gmail.com>
References: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
	<4F9BFF8D.6040702@windriver.com>
	<03646974-A740-46EE-9C85-63302F61595E@dominion.thruhere.net>
	<CADkTA4PEsqyFvjsUkj_4zzRO7MtxLv-B7gKE7ZOYtjg=0WX19g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 15:34:21 -0700
Message-ID: <CAMKF1sqr1b16vgQHNZ4+afqyu4dQH1e8y1p4E1YHb9=cGN4CZg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] kernel bbclass: recreate uImage unless KEEPUIMAGE is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Apr 2012 22:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2012 at 8:05 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sat, Apr 28, 2012 at 10:57 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>
>> Op 28 apr. 2012, om 16:32 heeft Bruce Ashfield het volgende geschreven:
>>
>>> On 12-04-27 4:06 AM, Koen Kooi wrote:
>>>> The intent of the uImage code in this class includes the following
>>>>
>>>> 1) be able to specify custom load addresses without needing to patch t=
he kernel
>>>> 2) add better information to the uImage description field
>>>>
>>>> The current state is a NOP anyway, the kernel will always build a uIma=
ge when you tell it to 'make uImage'.
>>>>
>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>> ---
>>>> =C2=A0meta-oe/classes/kernel.bbclass | =C2=A0 =C2=A02 +-
>>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.b=
bclass
>>>> index b7e9f54..98320fe 100644
>>>> --- a/meta-oe/classes/kernel.bbclass
>>>> +++ b/meta-oe/classes/kernel.bbclass
>>>> @@ -512,7 +512,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE=
}-${MACHINE}"
>>>>
>>>> =C2=A0do_uboot_mkimage() {
>>>> =C2=A0 =C2=A0 =C2=A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; the=
n
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test ! -e arch/${ARCH}/b=
oot/uImage ; then
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test "x${KEEPUIMAGE}" =
=3D "x" ; then
>>>
>>> I realize this is targeted meta-oe, and not directly to oe-core (but
>>> openembedded-core is cc'd + it's Saturday morning with no coffee here
>>> yet which means I may be misreading) .. so I thought I'd comment as
>>> this whizzed past.
>>>
>>> The existing users on top of the oe-core class expect (whether they
>>> know it or not) the opposite of this (i.e. do nothing, get the kernel's
>>> uImage). To keep their old behaviour, they now need to explicitly set a
>>> flag. I know that I'd have quite a few layers to update if this went
>>> directly into oe-core.
>>>
>>> How are the current meta-oe and related BSPs currently overriding
>>> the behaviour (I didn't go look, I'm invoking my Saturday morning claus=
e
>>> again :) ? Is it a class override ? If so, can the layers that
>>> currently have an override set a flag (which is a simpler override) to
>>> get the behaviour they used to have, while leaving the boards with no
>>> override the behaviour that they used to have ?
>>
>> "used to have" is quite vague, since the OE-classic behaviour is to alwa=
ys replace the uImage. And that's where I'm migrating machines from.
>
> That's why I referenced oe-core, that's all I'm talking about. It's
> behaviour for
> every tagged release has been what I'm talking about. This is a change in
> that behaviour, and if that's the intended target for this, it is relevan=
t.
>

I think keeping OE-Core's behavior and introducing a variable
(REDO_UIMAGE_BECAUSE_KERNEL_BUILT_UIMAGE_IS_CRAP_FOR_MY_MACHINE or
something) to indicate regenerate my uImage might be a better
compromise here.

> Cheers,
>
> Bruce
>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


