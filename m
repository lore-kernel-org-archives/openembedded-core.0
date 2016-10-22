Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7472C719C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 11:08:16 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id m26so13781299uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cCX1WO45nkdxHfIRapgJidUgGHYfIr2wZgnzddCrBDg=;
	b=Lt3+VwyZhFVXeYXQvjYJSnIREs9BseEzXx7tzP2OuhQlmqYR1M5R429sVVi/O7QsFc
	GoDkYTsiDN5xqrijGZ26epSS5IqFyKUaQWms8S1NS/vWriqQGA6H1Vfoj87gI7cd3Wkh
	BB/VHmiASr5S96BhHdBV8B2jQDum7GaarhZmr8FbyUon/SGkmCvSfd7aPzPB89WCICMV
	2h6pxodT1hFf+j40RHJKmeQjJzcOW4j1XzhR4l5kHaCvINJaxjwDwEK8/zzFe2XCk8je
	pk2X3s36hqcYOsdrf2GCUhD3n7uuKhmcN7p47rSUAG2xV2kDoCjtRTp4HjNDARzCiwEr
	Dkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cCX1WO45nkdxHfIRapgJidUgGHYfIr2wZgnzddCrBDg=;
	b=SiH+FEd6WklTrXwloi1zBUXTcRR3F55BIAece7njegesNOf8bSn7oSMPf4CvoPo99L
	liTDY0Nvctl4fLm/oXOBsA640m5Io22DM3nU4L6r8Ic0NQ6aMCfrpErP9LAx1+2X5QYG
	9Lcj9d0FvVqT638peADr9pBG5JQCsWr3LbXIMOa4VjgHtmlnm5e3zRmKs8VuGvAEBEhY
	iAyjCMxtl/m/BPkug4edtH0wThdnfZnVBo6XHpEYRsZb+ti7+/CVl0fcj7Jpa3wsXFye
	GTaTX1PkycgrRr5yrmlw7zzVYegpuNrDlbF9S8neYpKJ2x6d/Hf3ydJHNN8RSrgbphOe
	pt9A==
X-Gm-Message-State: ABUngvdM/mXdm6nDkbbpUTiJRZapNahjBXQwSdNgZGcMvKr/OGUVbat8P198zK8GP3aRqbAj+ZRnkvABN1oZBQ==
X-Received: by 10.176.81.59 with SMTP id e56mr2434087uaa.167.1477134497630;
	Sat, 22 Oct 2016 04:08:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.153.194 with HTTP; Sat, 22 Oct 2016 04:08:17 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610220333510.8533@localhost.localdomain>
References: <alpine.LFD.2.20.1610220333510.8533@localhost.localdomain>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 22 Oct 2016 13:08:17 +0200
Message-ID: <CAFkk2KTbuq=gTjcWGxOa3FJ-yaQiK6gdAALxxGFhAPNTAL-edQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in what recipe context can "bb" show me TOOLCHAIN_HOST_TASK?
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
X-List-Received-Date: Sat, 22 Oct 2016 11:08:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Sat, Oct 22, 2016 at 9:39 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   a question about chris larson's nifty "bb" utility ... i recently
> figured out that, to get rpm-build into the SDK, i needed to add:
>
> TOOLCHAIN_HOST_TASK += "nativesdk-rpm-build"
>
> to my local.conf. now i'd like to use "bb" to display the full
> value of that variable, but i'm not sure what recipe context to use to
> do that. as in:
>
> $ bb show -r core-image-minimal TOOLCHAIN_HOST_TASK
> Parsing recipes..done.
> TOOLCHAIN_HOST_TASK=" nativesdk-rpm-build"
> $
>
> that just shows me what i appended. in what environment or recipe
> context could i run that command to get the full value of the variable
> when the SDK is being built?
>
> rday
>
> p.s. same question if i was using "bitbake -e".

You're seeing the final value of TOOLCHAIN_HOST_TASK (before any
changes to it within a single task anyway). To extend the default
value instead of replacing it, you would need to do the following
(note the space after the "):

  TOOLCHAIN_HOST_TASK_append = " nativesdk-rpm-build"

Below is an explanation of why this works:

Image recipes like core-image-minimal (indirectly) inherit
meta/classes/populate_sdk_base.bbclass, which sets the default value
of TOOLCHAIN_HOST_TASK as follows:

  TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host
packagegroup-cross-canadian-${MACHINE}"

Since the global configuration from .conf files like local.conf is
parsed before recipes (and the classes they inherit), using += means
that TOOLCHAIN_HOST_TASK will already have a value by the time the ?=
assignment is encountered, skipping the assignment. With _append, the
appending is delayed until the end of parsing, and the ?= assignment
won't be skipped.

I've submitted many changes to the 2.2 manuals that deal with
conceptual understanding by the way. If you're still reading the 2.1
manuals or earlier, you might want to switch.

 * To understand how variable "scopes" work in Yocto, see the note in
http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#usingpoky-debugging-viewing-variable-values.

 * To understand the motivation behind _append/_prepend/_remove, see
https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages.

 * One of the notes in
http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#usingpoky-debugging-others
includes a recursive search helper that might be handy.

 * Should be documented in the manuals, but currently isn't: To see
which recipes inherit a particular class (either directly or
indirectly), you can use a command like the following one:

     $ bitbake-layers show-recipes -i populate_sdk_base

The TOOLCHAIN_HOST_TASK and TOOLCHAIN_TARGET_TASK variables could use
some more documentation. Submitting documentation suggestions to
https://bugzilla.yoctoproject.org/enter_bug.cgi?classification=Documentation
for stuff that's unnecessarily cryptic is highly appreciated.

Cheers,
Ulf

