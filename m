Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 80F917372B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 18:11:37 +0000 (UTC)
Received: by yhot59 with SMTP id t59so11605831yho.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5LZdti2YOEutXMqVCNp//tIDQ2AwmdgWHEHAsklHMvs=;
	b=E/5okBdRXxb28a7lLH6mpMhHEeoJlWn/aXfouLhE3kDUFOPWcHAk+TE4LOXG85/I7Y
	EKBTdKvWdazzMqwuDg/ahO3laOw8858/lHwBbz+IwQTWNdndnbDOvyz7vcULXybpsNV9
	DDbmV0dhg1fgcxa394CQ1hoEZSsYxnix+L8L0J6iChFK2kh25YXd9MbNDsT20TiKagDk
	rDoH9xH3z5MAsV0Ab9v0DuKWOpxlHDVbrNqz2R+uf+IT0pLw1ZAZaKVD2lbgQIjdBTOZ
	Xop75vdqlDVyciJcZu5Bzr8+j4ZIYs7moHMyv6u5YPUrRttrL+M4dDjRlYxqhjlpdFsz
	vNXQ==
MIME-Version: 1.0
X-Received: by 10.170.209.85 with SMTP id a82mr12195168ykf.99.1424715098566;
	Mon, 23 Feb 2015 10:11:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 23 Feb 2015 10:11:38 -0800 (PST)
In-Reply-To: <1424714778.26813.1.camel@linuxfoundation.org>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
	<5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKp4QG0iSUzUU8ZaAkKjsg34zo8FwHiXZkD-XoA_su1hpA@mail.gmail.com>
	<1424714778.26813.1.camel@linuxfoundation.org>
Date: Mon, 23 Feb 2015 15:11:38 -0300
X-Google-Sender-Auth: HELZpWTVINHXSDbxqcJqMOmxpXE
Message-ID: <CAP9ODKrUdLOyxr8NtGYMPMrmK0vY68VR3y483_nyCMJ8DhLOdw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 18:11:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 3:06 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-02-23 at 15:00 -0300, Otavio Salvador wrote:
>> On Mon, Feb 23, 2015 at 2:54 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Monday 23 February 2015 14:41:34 Otavio Salvador wrote:
>> >> On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
>> >> <paul.eggleton@linux.intel.com> wrote:
>> >> > From: Randy Witt <randy.e.witt@linux.intel.com>
>> >> >
>> >> > This bbclass will create an SDK with a copy of bitbake and the metadata
>> >> > and sstate for the target specified for the task. The idea is to let
>> >> > "system" developers both work on applications and then test adding them
>> >> > to an image without having to switch between workspaces or having to
>> >> > download separate items.
>> >> >
>> >> > Rather than running bitbake directly however, the primary way of running
>> >> > builds within the extensible SDK is to use the "devtool" command. The
>> >> > rest of the build system is fixed via locked shared state signatures,
>> >> > and thus only the recipes you have added get built.
>> >> >
>> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> >> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>> >> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> >>
>> >> Why another class? it could be tuned using SDKIMAGE_FEATURES
>> >
>> > If you look at what the class does it would be a bit messy to do it that way -
>> > I wanted to get something working with minimal impact. I don't doubt
>> > that it could be implemented as an SDKIMAGE_FEATURES item though
>> > with extra work.
>>
>> As far this does not gets merged I am fine with that. This is clearly
>> a WIP code and shouldn't be merged as is.
>
> This code adds in an alternative SDK format and it drives that using a
> different task target. Right now its hard for people to see where things
> are going, this puts it in easy reach whilst allowing the current SDK to
> continue to work too.
>
> I think a choice of two different task targets here makes sense to drive
> this configuration rather than SDKIMAGE_FEATURES and I agree with Paul
> that adding it the other way would be complex, error prone and
> confusing.

Well so why we don't add populate_sdk+dev-pkgs+dbg-pkgs.

Sorry ... it is clear that people wish this feature (and I also do)
and appreciate the hard work Paul has put on this (yes this is indeed
a good amount of work) but the extra task does not seem to fit how the
system is designed.

The SDKIMAGE_FEATURES[1] is described as:


Equivalent to IMAGE_FEATURES. However, this variable applies to the
SDK generated from an image using the following command:

     $ bitbake -c populate_sdk imagename

and it makes a lot of sense to have a 'extended' or 'devtool' or
another name for this feature.

1. http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SDKIMAGE_FEATURES

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

