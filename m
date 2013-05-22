Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0FA60984;
	Wed, 22 May 2013 08:47:58 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so1133329vcb.18
	for <multiple recipients>; Wed, 22 May 2013 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cgCg0ZxS7VXMc3VGTGoe+Ej8QVq00P9GK9JxjF/kQko=;
	b=sjcE4rPwPczM2tj5sbM5qsDR3A1Wu8sMWyhn7bgwOYmI7a+eGY+qIWecD3O0HID/Nh
	5bwLODFnekfcZ0vpY59QXBOI8rQTWZ/syYUKwYz3nfBoTRDA/e73lIZE2sTgjbSQ/P+F
	sVWdJuPdRITasRpBj23alYeLwz9/Qzkx0JDDq7bdSRzjSVhQv/AB6nbuR6rxOprk1+HU
	jugbTLYJ537jVWrRBQb6lqRF+mGsEErQgGusnhA4od98E+h/qlc1901sGwjOsO9z6UtO
	bI3ykp4jm7gs4vqvhbuyg6mtslimusZzFYFWDBxb7THyAH6k7gA8gJUgQLCtiwoTRDVA
	w8Cw==
X-Received: by 10.220.172.2 with SMTP id j2mr2444608vcz.17.1369212479450; Wed,
	22 May 2013 01:47:59 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Wed, 22 May 2013 01:47:39 -0700 (PDT)
In-Reply-To: <CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 22 May 2013 09:47:39 +0100
X-Google-Sender-Auth: bifhZ4LE1P0-6hBvqEXuv2VpNaE
Message-ID: <CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Wed, 22 May 2013 08:47:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 May 2013 00:02, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 15 May 2013 21:33, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>
>>
>> (e.g. when I include
>> meta-raspberrypi, it changes the psplash logo, regardless of whether I'm
>> building for the pi).
>>
>> In many ways the bbappend is too easy and encourages anti-social
>> behaviour. I would recommend bouncing meta-rpi as being non yocto
>> project compatible due to the psplash issue if it were to apply which it
>> has not.
>>
>
> I noticed the psplash logo when building a qemu image with
> meta-raspberrypi included, will look into fixing it so it only goes
> into MACHINE="raspberrypi" builds. Copying in yocto@ and Andrei as
> this is raspberrypi related.
>

I've just sent a patch to the yocto@ list to fix this but it's brought
up two things:

1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
'?='. I'm overriding this with '=' in
meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
overridden further in local.conf. Is this worth changing to '??=' in
image.bbclass, '?=' in the machine conf so that it can be overridden
with '=' in local.conf? Is my understanding of the overrides correct
here?

2) If you look at the patch I've basically added the raspberrypi logo
as an extra psplash image and overridden SPLASH in the machine conf to
make this the default for raspberrypi. Is this the intended approach
for customising psplash images? There's a lot of interesting logic in
the psplash recipe and it took me a while to figure out. If I've got
it right it may be worth adding some documentation comments to explain
this method. If I've got it wrong could someone correct me.

Both of these (assignment change and adding documentation) would be
patches to openembedded-core.

Thanks.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

