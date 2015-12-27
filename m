Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A928660116
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 09:12:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p187so238516626wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 01:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HUccJ30x4Oaq9u6IEkgjv347SjwULwY6bRJohuud8UI=;
	b=LfFxfiiu36qiUh7DBHxYSB1eqqhJrkZ1CUKmPg6mFKx/VbRqvqRUFhJ6rFHN5u8ePu
	tW6P+SsfHjP4At1l5jUn9s2WuEAVy5ZW3W4yBedJ61b3ZL4CQH1a/+X4n7bYvTUO90+x
	Rm8juwz11xHA/OSpEd+yos/8IXc68NFX1xWHdwxhOvkh2/PfsCMbQlfjZ8QgYj5ycv9q
	qr2CyxXEnyR0dqr7vl4YSANW7/V37/EvsejW/6WO68LY/Ieyvz4tgnBVTzVo2gIcrHG1
	FLOOrS9CtIrBnVzsQeE8v1apz0jPCOgiKArRNmjBAznoIT9Og13Z2Jbas++3UPOErgxP
	BVYg==
MIME-Version: 1.0
X-Received: by 10.28.98.133 with SMTP id w127mr23732539wmb.4.1451207549789;
	Sun, 27 Dec 2015 01:12:29 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Sun, 27 Dec 2015 01:12:29 -0800 (PST)
In-Reply-To: <CAJTo0Lat-1Zsmn2SAdDfaXbUuSkZyAJT7u9i3-37UZKsEQpZQw@mail.gmail.com>
References: <1450827499-32386-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYLr=Qq1ETPdwTyjGddUNmuZvx+z7GtzTM5-N+EeNcHkQ@mail.gmail.com>
	<CAJ86T=XDVLVzraADPy6O=9SiKpcZai__8m9VY=8DCEC4u=RHrw@mail.gmail.com>
	<CAJTo0Lat-1Zsmn2SAdDfaXbUuSkZyAJT7u9i3-37UZKsEQpZQw@mail.gmail.com>
Date: Sun, 27 Dec 2015 01:12:29 -0800
Message-ID: <CAJ86T=X_KBBuZwZCVL8ZBuZwh_aoP2fPmUcRPLThkUAYFq=9iQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update 4.10 -> 4.11
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
X-List-Received-Date: Sun, 27 Dec 2015 09:12:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 23, 2015 at 1:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
> CCing Robert as he wrote the patch that introduced the ARCH assignment.
>
> On 23 December 2015 at 20:49, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Error is due to do_compile_ptest() forcing ARCH="${TARGET_ARCH}". The
>> tests Makefile uses ARCH to setup include paths but there isn't a
>> direct mapping between OE's arch values and the ones expected by
>> strace. In this case ARCH should be "i386" in order to find the header
>> file correctly, not "i586".
>>
>> Removing ARCH="${TARGET_ARCH}" from do_compile_ptest() and letting
>> strace auto detect fixes the build failure.
>>
>> Forcing ARCH was introduced here:
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=af76eb0405352d66dfd00d7f856f401d892855e1
>>
>> But I'm not 100% clear what the original problem was though, so I'm
>> not sure about just undoing that change without some more
>> investigation. Any thoughts?
>
> I guess if it autodetects correctly now then the workaround isn't required.
> Robert, what do you think?

Forcing ARCH (and OS) for strace 4.10 seems to be a purely cosmetic
fix to make the include paths on the compiler command lines look
prettier. None of the sources in tests seem to require the headers in
the $(OS)/$(ARCH) directories, so it doesn't matter if ARCH is
undefined or forced to something incorrect.

For strace 4.11, forcing OS and ARCH is wrong and should be removed.

The WIP change currently in mut is OK as a temporary solution, but
maybe I'll send a new patch series for strace 4.11 in the next few
days since I think some other things need fixing too (the configure.ac
patch and acl / libaio dependencies are no longer correct and the
git-version-gen script needs updating or dropping).

> Ross

