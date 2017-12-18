Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 21A8E71994
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:00:23 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id e204so9515356iof.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 04:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tckvHgXGjbTNByGFUKy+5yhKP0IE/VZ5RbnrGKixP8w=;
	b=1zWyEzXflNzwHcAkD/pCED+m9Pqx6997enUAKagwTcDcbgdzNBiDOeaOYArQXrRxdr
	gnpLxgXkMxBsJZwIQNP7Ay/VMfak11D364bARB8MOX5FG67grIDN5zlgfQD/lEktnPrw
	ohaUyZstceLexPoIwoXBxVlJOnY0qEmhY0eYnJ/Wkm2yN9wcfEzh+KRjvPnVAyByVcfk
	g0EhhYb1G+94fKAx1aB7E6bLKQDje0jVlCnhz/5d3bKj+fu1B37zFUJTaX1OTxw/Uqtw
	H/GYuleFMQmXh53cyh3zlh38+b8FvzTyjkdTYraV27hpral61s4nPVo46grgKWOkYiJf
	+e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tckvHgXGjbTNByGFUKy+5yhKP0IE/VZ5RbnrGKixP8w=;
	b=iFPTCQOWc9WYvFomeeVZyz6d3uvh54Zx55VylLK1BhIy1X+CAiN6wBmqxllAtrxkYL
	mVB7QwFSQ+se4t+bAcjYBWM7KsDhVzijaHBcGUsY1lfqKpefuhvwAZqFYD5vEeWVVXKy
	J6iSOhKX070JBnJTc4QukUu+Do6uLuyo1S4bWq1IBNzlB6mQu5HxtLAUJPqITIxYDiVC
	vsffetvvfqPl2OqAEHMwWDBRJYrjJLg7V8L+fQ/MF9zf+TpYwpK60LbiEPTfJxe78F1q
	mW8B3mcqQn1BRH/UmpMZ2ZN6BVCrXAiu5Okmrb4SmDruHLzU9TILfei7LFVSA5C5cQfx
	Pc0g==
X-Gm-Message-State: AKGB3mJcLQizexCO0c1HWchvyLBiBKJNOB1N4A77cH1FvjcJucZCYscY
	rgITAS107v6rHd2FRSIyeGP9Uwm89PXjxakdohdKPQ==
X-Google-Smtp-Source: ACJfBosmgAQT4932IcYrvh8LbXnSkrsQQjfXPVLudmEn8PqEM3WumHICanuk+iPykQ9RlrTLyjzCplq0O05hS35xBXM=
X-Received: by 10.107.83.19 with SMTP id h19mr16680376iob.208.1513598425130;
	Mon, 18 Dec 2017 04:00:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Mon, 18 Dec 2017 04:00:04 -0800 (PST)
In-Reply-To: <CAJTo0LaHRrqqXp6S5oni-mGVnBZvUYX68VUQd8EsemyLV3rM9g@mail.gmail.com>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
	<CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
	<CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
	<20171218110602.ppicezmskdv5emkq@axis.com>
	<CAJTo0LaHRrqqXp6S5oni-mGVnBZvUYX68VUQd8EsemyLV3rM9g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Dec 2017 12:00:04 +0000
Message-ID: <CAJTo0LY5CfVtFwiFHU476GrOU2y2WCb6r+tH+wkL1ecqAQJbEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 18 Dec 2017 12:00:24 -0000
Content-Type: multipart/alternative; boundary="089e08265ff87685b905609c18dc"

--089e08265ff87685b905609c18dc
Content-Type: text/plain; charset="UTF-8"

On 18 December 2017 at 11:28, Burton, Ross <ross.burton@intel.com> wrote:

> On 18 December 2017 at 11:06, Olof Johansson <olof.johansson@axis.com>
> wrote:
>
>> I'm so sorry, I missed your email; I am, but maybe not as quickly
>> as you are able to(?). My is_stripped looks kind of like yours,
>> but without the ShType.progbits. Thanks for the suggestion! I
>> were able to hackishly integrate the Elf class it with
>> staging.bbclass and package.bbclass.
>>
>> I did have a couple of questions; if I were to add an is_stripped
>> method, would that fit best in the Elf class itself or in some
>> wrapper?  Would renaming the elf class to "ElfParser" class make
>> more sense, and have an ELF class that wraps it? I can publish a
>> draft somewhere later today.
>>
>
> The Elf class is generated with kaitai struct so I'm trying to reduce the
> number of changes to it, but we can definitely move it into a subpackage
> like oe.parsers.elf and then have oe.elf for just the utility method.
>

Just pushed ross/elf with this change.  The next obvious step is to turn
lib/oe/qa.py into a new lib/oe/elf.py which has a better API and includes
the stripped function.

Ross

--089e08265ff87685b905609c18dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 December 2017 at 11:28, Burton, Ross <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burt=
on@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span clas=
s=3D"">On 18 December 2017 at 11:06, Olof Johansson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:olof.johansson@axis.com" target=3D"_blank">olof.johansson@=
axis.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m=
 so sorry, I missed your email; I am, but maybe not as quickly<br>
as you are able to(?). My is_stripped looks kind of like yours,<br>
but without the ShType.progbits. Thanks for the suggestion! I<br>
were able to hackishly integrate the Elf class it with<br>
staging.bbclass and package.bbclass.<br>
<br>
I did have a couple of questions; if I were to add an is_stripped<br>
method, would that fit best in the Elf class itself or in some<br>
wrapper?=C2=A0 Would renaming the elf class to &quot;ElfParser&quot; class =
make<br>
more sense, and have an ELF class that wraps it? I can publish a<br>
draft somewhere later today.<br></blockquote><div><br></div></span><div>The=
 Elf class is generated with kaitai struct so I&#39;m trying to reduce the =
number of changes to it, but we can definitely move it into a subpackage li=
ke oe.parsers.elf and then have oe.elf for just the utility method.</div></=
div></div></div></blockquote><div><br></div><div>Just pushed ross/elf with =
this change.=C2=A0 The next obvious step is to turn lib/oe/qa.py into a new=
 lib/oe/elf.py which has a better API and includes the stripped function.</=
div><div><br></div><div>Ross</div></div></div></div>

--089e08265ff87685b905609c18dc--
