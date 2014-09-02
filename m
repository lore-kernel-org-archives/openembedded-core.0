Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 773E26FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 03:33:25 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id f10so3849093yha.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 20:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=e23yzJ16mrfQsg4D1cSB3QM/26mfX5daj+OCmyiszuY=;
	b=hCnuc2UqppRIMbio4vTXcin3zDp+qF7BtHEDj+cDrs66ZsJwrT00uAHyGuXzg1vtTA
	qq5jdiQ/m9W/9/pCD27a9wAdPuESTL0vfYkmzOkDLmg9xSLGJt0g3qPz5z6ucCprXA+5
	qoL7pFS1yj3t5A3c+UZiN86nafJdzP47j84oGeA2VvrMhyb/A1YcZnhgVrPgoo2/4+bX
	BlIE3OSTaLgMsm81WMQNN4rUsMoDnWjKGDzonrP6ZBPDr/yBKbYS3T0pus6Xj2GeDsX1
	ut4zyWjiuakiCf6leiQEabJN4AbipXtobSwxIhED1KsTcm3MOiTzteJaJbMZvwb5sFKO
	5p4g==
MIME-Version: 1.0
X-Received: by 10.236.117.37 with SMTP id i25mr21392797yhh.85.1409628807098;
	Mon, 01 Sep 2014 20:33:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 1 Sep 2014 20:33:27 -0700 (PDT)
In-Reply-To: <540539E6.2030508@windriver.com>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
	<540539E6.2030508@windriver.com>
Date: Tue, 2 Sep 2014 00:33:27 -0300
X-Google-Sender-Auth: u8_tp6tH2V4xnKiQHsWltVMubOo
Message-ID: <CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 03:33:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 2, 2014 at 12:30 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 09/02/2014 11:17 AM, Otavio Salvador wrote:
>>
>> On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>>
>>> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
>>>>
>>>>
>>>> Hello,
>>>>
>>>> During our regression tests we found the following error:
>>>>
>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
>>>> PREFERRED_PROVIDER entry to match jpeg
>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
>>>> PROVIDES 'libxext-native' (but
>>>
>>>
>>>
>>> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
>>> doesn't provide native, but libxext_1.3.2.bb does.
>>>
>>> Seems that we need remove the git version since it is older:
>>>
>>> PV = "1.0.99.1+gitr${SRCPV}"
>>>
>>> And doesn't see a license issue.
>>
>>
>> This has been reproduced in our autobuilder.
>>
>> It removes:
>>
>> x11 and wayland
>>
>> and adds:
>>
>> directfb
>>
>> Can you try to reproduce it?
>>
>
> Yes, I can reproduce the error, sorry, please revert this as a quick
> workaround:
>
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Jul 29 01:02:44 2014 -0700
>
>     qemu-native: depends on libxext-native when enable sdl
>
>
> The DISTRO_FEATURES affects the native recipe, I'm not sure whether this is
> intended or not.

This is an error in our autobuilder for regression test; Richard,
could you revert this in OE-Core?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

