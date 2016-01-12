Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 869A56FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 22:58:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b14so33849288wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b9DTfqFqfZYE7ZtoDdQFoGTAnmWS0OrkVosxemkvuDw=;
	b=JK6vzGDX93eOMCCCrITRhNi87wV4H6a+ujU/eiFN0KomBEO7H8rsgRbQlNm2tGSDYJ
	LiHU7+f8l754AVYHKJk07HGsFZtvha080QCngGRpKEJi2zj/FH9iutu52ErrOCM7dUnC
	oRrozYa6oMkKKOXXPNUk5oNNhl+mSvhAhadMu4QW74/pHroDHsYh+mj9KhDx++fOMIE4
	Ca4WNsvWzdFXt7A+xfWcGO8VE/fzHMxOsm7+hhszQju9y4QFBq7a//+m1PomdeMjxQwp
	7QJPVA7ERpgTwTNy2jjJQQOeUKMUcW+MDJ3mus6+ITgRK5jC6R1F/p1y5GpSdTFJuZvX
	nSuA==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr140503841wjf.43.1452639481601;
	Tue, 12 Jan 2016 14:58:01 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 12 Jan 2016 14:58:01 -0800 (PST)
In-Reply-To: <CAJ86T=VNzj0hSnd2sG77rEqi2T9FDU+PoBJrq_SkmeFLfRJtsA@mail.gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
	<1452634324.28375.24.camel@linuxfoundation.org>
	<CAJ86T=VNzj0hSnd2sG77rEqi2T9FDU+PoBJrq_SkmeFLfRJtsA@mail.gmail.com>
Date: Tue, 12 Jan 2016 14:58:01 -0800
Message-ID: <CAJ86T=VRr=pop7dDx3kRbWbM+zNzmEoPw7nMTNK-foNRRWg6QQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Jan 2016 22:58:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 12, 2016 at 2:02 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jan 12, 2016 at 1:32 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2016-01-11 at 23:18 -0800, Andre McCurdy wrote:
>>> Andre McCurdy (5):
>>>   strace: drop unnecessary dependency on acl
>>>   strace: fix --disable-aio configure option
>>>   strace: remove need for git-version-gen script
>>>   strace: fix ARCH definition in tests/Makefile
>>>   strace: update 4.10 -> 4.11
>>
>> I included this in a -next build but it failed on the autobuilder:
>>
>> http://errors.yoctoproject.org/Errors/Details/27173/
>> http://errors.yoctoproject.org/Errors/Details/27101/
>> http://errors.yoctoproject.org/Errors/Details/27101/
>>
>> One is poky, one is poky-lsb, looks like it might be a debian system
>> specific issue :/.
>
> Looks like it's calling the host gcc with -isystem set to OE's
> x86_64-linux sysroot, and then gets confused because host gcc seems to
> be generating 32bit binaries by default.
>
> Does adding "-m64" to the failing gcc command line fix it?

Clearing CFLAGS_FOR_BUILD, CPPFLAGS_FOR_BUILD and LDFLAGS_FOR_BUILD
from within the recipe looks like it's going to fix it.

  CPPFLAGS_FOR_BUILD = ""
  CFLAGS_FOR_BUILD = ""
  CXXFLAGS_FOR_BUILD=""
  LDFLAGS_FOR_BUILD = ""

It raises some questions though. We setup CFLAGS_FOR_BUILD etc
unconditionally from autotools.bbclass with -isystem pointing to the
native sysroot, but I don't see any default dependency to ensure that
the native sysroot actually contains anything. Should CFLAGS_FOR_BUILD
etc perhaps only be setup for packages which are known to need it,
when we know there's an appropriate dependency in place to populate
the native sysroot?


>> Cheers,
>>
>> Richard
>>

