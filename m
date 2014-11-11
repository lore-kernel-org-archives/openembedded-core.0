Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8D165CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 20:19:52 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id m20so8237235qcx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LV4x9fmEiakOANtBvrHrtCCoICulj12iiDJdtwHbr7c=;
	b=u27vGfUIq2mTpWljjfrPVJTKYWED1Bjy8q/ocwKz/WH9q/O2pEcdZAsJsw8bXpf4Uv
	opVPIznWQ7wRVDjyXTeCduKHskRxeUVqrL/OTW6spRJR9/P8CxkVrcsj5xWX/kUNXT27
	V9Em6V2GTvp0/3dnCCv3XAkaW5ArR/1v48rKbjl2xgNRFTsmcG7z5eDiFwHPBvJ/T2Dx
	qTvNdAFSvVZjTSvdRbql5GhsCQuVeD6I6uKF0NfgkI0pfMCiiXGsML4AqV6O5lgk2Zo9
	TjE+7r24GFQVsKdhsFLR2tI6qYefsUDdQiqx4/6uEH+lmjBn2KqJDFOcyByQVl7tUAYa
	89WQ==
X-Received: by 10.224.47.4 with SMTP id l4mr42676905qaf.36.1415737193097; Tue,
	11 Nov 2014 12:19:53 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Tue, 11 Nov 2014 12:19:11 -0800 (PST)
In-Reply-To: <CANyK_8fduuFa5=4aoF-3Zjd8zBpRr6ZZCSgj=9nNzKARoKzOeg@mail.gmail.com>
References: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
	<CAJTo0Lbf8q3z+dAZzpOu0Rgt4MVKjiCJ9fePOdZoTuK2Yf6ZyA@mail.gmail.com>
	<CANyK_8fduuFa5=4aoF-3Zjd8zBpRr6ZZCSgj=9nNzKARoKzOeg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 11 Nov 2014 20:19:11 +0000
X-Google-Sender-Auth: e8EDafiS4zLUkrORYtaFqV9jNdM
Message-ID: <CANyK_8evfrjQsTJ7sCKKN-JQwvnYwFOz0qC4B5G13EK6=CzfrQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: Upgrade to v0.2.3
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
X-List-Received-Date: Tue, 11 Nov 2014 20:19:55 -0000
Content-Type: text/plain; charset=UTF-8

On 10 November 2014 15:50, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 10 November 2014 15:27, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 31 October 2014 10:34, Paul Barker <paul@paulbarker.me.uk> wrote:
>>>
>>> The patches for opkg have been rebased using git so that they apply
>>> cleanly onto
>>> the new release.
>>
>>
>> Something appears to be broken with 0.2.3:
>>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
>> packagegroup-core-sdk:
>>  * perl-module-config * perl-module-config * (repeat)
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/97 is
>> a build on the autobuilder using current master, and
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/96 is
>> master plus your two opkg patches.
>>
>> Ross
>
> I'll try building core-image-sato-sdk myself tomorrow and see if I can
> reproduce this locally. I've probably introduced new bugs while
> solving old bugs in the dependency resolution code.
>
> I probably need a more comprehensive pre-release test for opkg. I
> currently build core-image-minimal, rebuild a few packages then check
> 'opkg update && opkg upgrade' works as expected. I'll expand that to
> build core-image-sato and core-image-sato-sdk for multiple
> architectures for the v0.2.4 release.
>

I've reproduced this and tracked the cause down to the
pkg_hash_fetch_best_installation_candidate function mis-handling an
obscure edge case. There are two providers of perl-module-config
(libperl5 and perl), but neither is actually called
'perl-module-config'. This triggers an "if (nmatching > 1)" branch
which causes the function to immediately return NULL instead of
selecting one of the matching packages to return. I kept this when
refactoring the old code but never understood why it was there in the
first place. Removing this branch fixes the problem but I need to
think through what other consequences that change may have.

I'll roll this fix into opkg v0.2.4 which I'm planning to release
ASAP. Then I'll resubmit a patch against oe-core which upgrades opkg
to v0.2.4.

In the meantime, the opkg-utils patch should be mergeable on its own.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

