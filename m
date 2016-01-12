Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 962A97316E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 22:02:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so33666474wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RwGm+AgTKr1XTJtUIQnhaIVoQxOiOveGyrm8hjhcfZY=;
	b=mWyw+qwMi0n9n6PswKIWY2XgCpW249AaoJdV7oENqTTDZ4KgcgJqUz1WFd1+pehQ/G
	+opGjyRYau8OHAY2niqrWIuAm6sYWCNOdGpb9Lu/QnnEH9cAabbmhoEgZlJKlAmlhG3h
	Nn7T4VRwNypFACTjtTTrJKWXDhZGBBDxpLjeOEY3SPyBsY9XRxyvWjeP+eyBWk4XNdXg
	sIPkxKINVs3RzNgyMHsgofw3aeEAaVkVZBChyIWI/FMAzSxGxqD3cNPdUKmX5fbagPdY
	PTQ4usLR8/v8x2moITJV7dcNSC+MKvYk0YUjmILJ1deMS7mX1j6yudgkfMrlIMg9P1rY
	Q3Og==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr143291119wjc.3.1452636124788;
	Tue, 12 Jan 2016 14:02:04 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 12 Jan 2016 14:02:04 -0800 (PST)
In-Reply-To: <1452634324.28375.24.camel@linuxfoundation.org>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
	<1452634324.28375.24.camel@linuxfoundation.org>
Date: Tue, 12 Jan 2016 14:02:04 -0800
Message-ID: <CAJ86T=VNzj0hSnd2sG77rEqi2T9FDU+PoBJrq_SkmeFLfRJtsA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] strace: misc fixes + update 4.10 -> 4.11
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
X-List-Received-Date: Tue, 12 Jan 2016 22:02:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 12, 2016 at 1:32 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-01-11 at 23:18 -0800, Andre McCurdy wrote:
>> Andre McCurdy (5):
>>   strace: drop unnecessary dependency on acl
>>   strace: fix --disable-aio configure option
>>   strace: remove need for git-version-gen script
>>   strace: fix ARCH definition in tests/Makefile
>>   strace: update 4.10 -> 4.11
>
> I included this in a -next build but it failed on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Details/27173/
> http://errors.yoctoproject.org/Errors/Details/27101/
> http://errors.yoctoproject.org/Errors/Details/27101/
>
> One is poky, one is poky-lsb, looks like it might be a debian system
> specific issue :/.

Looks like it's calling the host gcc with -isystem set to OE's
x86_64-linux sysroot, and then gets confused because host gcc seems to
be generating 32bit binaries by default.

Does adding "-m64" to the failing gcc command line fix it?

> Cheers,
>
> Richard
>

