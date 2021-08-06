Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web12.7507.1628268253749642374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 09:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=SheuV5pA;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==852474de9cf==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1628268251-0fb3b001bf9b120001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id naQp4wUPas6RLpdQ; Fri, 06 Aug 2021 12:44:11 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=N+qX9CVj9CCPu4kY1QLSqRf2G8+8WtYzOGGnFrfDlRE=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=SheuV5pAXFqn7Dw1F6
	ers7UpKO4CPKKYLJft6Mwux4l7cvYrYC6iglH/exOWtEfVD3ahdX9XFtJ5UKRvjgdv9Wvi4jXkM4X
	LPEYagC63au75EhSdpBXr3BPpVptGFki5wffoR2T+CJgX0ifOm/0B0p1aPIrnUrQFr7AR0ZD7gnk=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11054636; Fri, 06 Aug 2021 12:44:11 -0400
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
X-ASG-Orig-Subj: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
 <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
From: "Tony Battersby" <tonyb@cybernetics.com>
Message-ID: <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
Date: Fri, 6 Aug 2021 12:44:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1628268251
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 5189
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/6/21 1:33 AM, Richard Purdie wrote:
> On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
>> On 8/5/21 6:21 AM, Richard Purdie wrote:
>>> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
>>>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
>>>>> Currently, enabling Link Time Optimization via:
>>>>>
>>>>> require conf/distro/include/lto.inc
>>>>> DISTRO_FEATURES_append =3D " lto"
>>>>>
>>>>> makes the build non-reproducible (as in
>>>>> https://reproducible-builds.org/).=C2=A0 This patch set fixes some =
of the
>>>>> problems, but is not yet a complete solution.
>>>>>
>>>>> This patch set addresses the following bugs:
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490
>>>>>
>>>>> openembedded-core patches
>>>>> 1/4: lto.inc: disable LTO for grub
>>>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
>>>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
>>>>>
>>>>> openembedded-devel patches
>>>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
>>>>>
>>>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
>>>>> TARGET_CFLAGS).=C2=A0 This could possibly be done differently, such=
 as by
>>>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
>>>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.=C2=A0 L=
et me know
>>>>> if there is a better/preferred way to do it.
>>>>>
>>>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I=
 have
>>>>> included a patch to fix that.=C2=A0 Other packages might have been =
broken as
>>>>> well, although I haven't found any others.
>>>>>
>>>>> With all these patches, there are still many shared libraries in /l=
ib
>>>>> and /usr/lib that are still not reproducible with LTO enabled becau=
se
>>>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags adde=
d by
>>>>> patch 3 when linking shared libraries.=C2=A0 /usr/lib/libbz2.so.1.0=
.6 from
>>>>> the libbz2 package from the bzip2 recipe is a good example.=C2=A0 I=
 do not
>>>>> have a patch for that problem.=C2=A0 I will leave that to someone e=
lse.
>>>>>
>>>>> So this is what we need to achieve reproducible LTO builds:
>>>>> *) This patch set
>>>>> *) A fix for libtool
>>>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
>>>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
>>>>> *) Fixes for individual packages, if needed
>>>>> *) Once everything works, update the documentation again (I previou=
sly
>>>>> requested a documentation change for this bug, which will eventuall=
y
>>>>> show up at
>>>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
>>>> This is certainly a few steps in the right direction with a good out=
line
>>>> of what's next.
>>>>
>>>> I suspect that Richard has been busy with other things like override=
s
>>>> and the update to glibc-2.34.
>>>>
>>>> Do you have any suggestions or questions about what we should do
>>>> with this patch series Richard?
>>> Thanks for the reminder, I've been meaning to queue/test this which I=
 will
>>> do. The gcc version has been bumped but I ported the patch forward to=
 it
>>> and the patches are in master-next for testing. It is great to see th=
is
>>> support moving forward.
>>>
>>> Much as it pains me to admit having any libtool knowledge, I may be a=
ble to
>>> help with that bit. There is an untested patch below which may addres=
s that
>>> issue, or at least give a good hint on how to do it if it doesn't wor=
k. I
>>> don't have an environment to test easily right now.
>>>
>>> Cheers,
>>>
>>> Richard
>> I tested your libtool patch in master-next with the bzip2 recipe.=C2=A0=
 It
>> works as intended; libbz2.so.1.0.6 and all the other output files are
>> now reproducible with LTO enabled.=C2=A0 I also verified that libtool =
is
>> passing the -f*-prefix-map flags to the link command in log.do_compile
>> as intended.
>>
>> I also verified that core-image-minimal builds successfully with the
>> libtool patch.
> Thanks for testing that, sounds like it helps that issue. I'll queue th=
at patch.
>
> Unfortunately even with the ruby fix I queued, we still see reproducibl=
ity
> issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and rub=
y-dbg=C2=A0
> packages:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/515/=
steps/12/logs/stdio
>
> We'll need to resolve those before I can merge the flags change.
>
> Diffoscope output:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210805-8j=
fd55ki/packages/diff-html/
>
> Basically LDFLAGS get encoded into a couple of scripts and the ruby bin=
ary.
>
> Cheers,
>
> Richard
>
It looks like the ruby problem is being caused by MJIT_DLDFLAGS in
build/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/build/mjit_config.h.=C2=A0
There is already a patch
poky/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-wri=
te-host-cross-cc-item.patch
that removes some of these items for the sake of reproducibiltiy.=C2=A0 B=
ut I
do not know ruby, so I do not know the implications of doing the same
thing for MJIT_DLDFLAGS.

Tony Battersby



