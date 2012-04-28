Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1SO9N3-0003Ot-1a; Sat, 28 Apr 2012 17:15:37 +0200
Received: by dakh32 with SMTP id h32so2158399dak.9
	for <multiple recipients>; Sat, 28 Apr 2012 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=g7Ovy+oH5T3FI/wI9Ff69OBIepKjuErZTr1N7auLzpc=;
	b=wlQt3goisja+SGk2mKiT52JnM5HCfPQ0qAhMGAfiho1Bi60hJyzcdmYGkb1xrIspdn
	2Xbe2hSiwdOlzbQWeQoylKvr4/CROkhCvPdMmk1GMvhRShtROfQ0vAulB3otG9/MI1u3
	z8O67OViluooAzaee+xUdcnzVam+D7IedXQ7ClrKsAr9nZf9clhG81SKY9jrLa5F1mGZ
	gMcM263plXL+gPL/frPxp6mLrMwqdoIH17ECAGTjiOa+GAZUUZqFGw2KV31GK1z7rWIL
	x3n7T9GOR+igd41RrOYUhx2mKfKDUrD8izErueZWDtFQqngIwz0syRLkAXKIms+iVb06
	7pqA==
MIME-Version: 1.0
Received: by 10.68.189.168 with SMTP id gj8mr843746pbc.104.1335625556073; Sat,
	28 Apr 2012 08:05:56 -0700 (PDT)
Received: by 10.68.55.104 with HTTP; Sat, 28 Apr 2012 08:05:56 -0700 (PDT)
In-Reply-To: <03646974-A740-46EE-9C85-63302F61595E@dominion.thruhere.net>
References: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
	<4F9BFF8D.6040702@windriver.com>
	<03646974-A740-46EE-9C85-63302F61595E@dominion.thruhere.net>
Date: Sat, 28 Apr 2012 11:05:56 -0400
Message-ID: <CADkTA4PEsqyFvjsUkj_4zzRO7MtxLv-B7gKE7ZOYtjg=0WX19g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Sat, 28 Apr 2012 15:15:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2012 at 10:57 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 28 apr. 2012, om 16:32 heeft Bruce Ashfield het volgende geschreven:
>
>> On 12-04-27 4:06 AM, Koen Kooi wrote:
>>> The intent of the uImage code in this class includes the following
>>>
>>> 1) be able to specify custom load addresses without needing to patch th=
e kernel
>>> 2) add better information to the uImage description field
>>>
>>> The current state is a NOP anyway, the kernel will always build a uImag=
e when you tell it to 'make uImage'.
>>>
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> ---
>>> =A0meta-oe/classes/kernel.bbclass | =A0 =A02 +-
>>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bb=
class
>>> index b7e9f54..98320fe 100644
>>> --- a/meta-oe/classes/kernel.bbclass
>>> +++ b/meta-oe/classes/kernel.bbclass
>>> @@ -512,7 +512,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}=
-${MACHINE}"
>>>
>>> =A0do_uboot_mkimage() {
>>> =A0 =A0 =A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
>>> - =A0 =A0 =A0 =A0 =A0 =A0if test ! -e arch/${ARCH}/boot/uImage ; then
>>> + =A0 =A0 =A0 =A0 =A0 =A0if test "x${KEEPUIMAGE}" =3D "x" ; then
>>
>> I realize this is targeted meta-oe, and not directly to oe-core (but
>> openembedded-core is cc'd + it's Saturday morning with no coffee here
>> yet which means I may be misreading) .. so I thought I'd comment as
>> this whizzed past.
>>
>> The existing users on top of the oe-core class expect (whether they
>> know it or not) the opposite of this (i.e. do nothing, get the kernel's
>> uImage). To keep their old behaviour, they now need to explicitly set a
>> flag. I know that I'd have quite a few layers to update if this went
>> directly into oe-core.
>>
>> How are the current meta-oe and related BSPs currently overriding
>> the behaviour (I didn't go look, I'm invoking my Saturday morning clause
>> again :) ? Is it a class override ? If so, can the layers that
>> currently have an override set a flag (which is a simpler override) to
>> get the behaviour they used to have, while leaving the boards with no
>> override the behaviour that they used to have ?
>
> "used to have" is quite vague, since the OE-classic behaviour is to alway=
s replace the uImage. And that's where I'm migrating machines from.

That's why I referenced oe-core, that's all I'm talking about. It's
behaviour for
every tagged release has been what I'm talking about. This is a change in
that behaviour, and if that's the intended target for this, it is relevant.

Cheers,

Bruce

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


