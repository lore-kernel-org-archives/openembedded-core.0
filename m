Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BA0C48BCB
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web08.6341.1649857441854719579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 06:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id EB04724096;
	Wed, 13 Apr 2022 15:43:59 +0200 (CEST)
Message-ID: <1f5614ca-6021-62e7-209a-31c3519108ec@gmail.com>
Date: Wed, 13 Apr 2022 15:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH v3 1/1] apt: add apt selftest to test signed
 package feeds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Xavier Berger <xavier.berger@biologic.net>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220411205036.8298-1-fntoth@gmail.com>
 <20220411205036.8298-2-fntoth@gmail.com> <YlWJ1p+E/bTygFNo@mail.local>
 <6cb8d5aa-dd1f-40ab-8f10-50449f1e8438@gmail.com>
 <YlXzyOPuwW+vOQ63@mail.local>
 <2521f751cc6ff0682c41df568d5ac497a41dc60f.camel@linuxfoundation.org>
 <3993add1-31c5-0c2d-88ae-e4f11dfb3859@gmail.com>
 <YlX+kXROqKZgyaUI@mail.local>
 <4733d374d296d604526c7f01909d80431d173f05.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <4733d374d296d604526c7f01909d80431d173f05.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164323

Hi,

Op 13-04-2022 om 09:00 schreef Richard Purdie:
> On Wed, 2022-04-13 at 00:34 +0200, Alexandre Belloni wrote:
>> On 13/04/2022 00:20:40+0200, Ferry Toth wrote:
>>> Hi,
>>>
>>> Op 12-04-2022 om 23:51 schreef Richard Purdie:
>>>> On Tue, 2022-04-12 at 23:48 +0200, Alexandre Belloni wrote:
>>>>> On 12/04/2022 23:32:49+0200, Ferry Toth wrote:
>>>>>> Hi
>>>>>>
>>>>>> Op 12-04-2022 om 16:16 schreef Alexandre Belloni:
>>>>>>> Hello,
>>>>>>>
>>>>>>> On 11/04/2022 22:50:36+0200, Ferry Toth wrote:
>>>>>>>> From: Ferry Toth <ftoth@exalondelft.nl>
>>>>>>>>
>>>>>>>> Since Gatesgarth apt (1.8.2) has become more strict and doesn=E2=
=80=99t allow unsigned repositories by default.
>>>>>>>> Currently when building images this requirement is worked around=
 by using [allow-insecure=3Dyes] and
>>>>>>>> equivalently when performing selftest.
>>>>>>>>
>>>>>>>> Patches "gpg-sign: Add parameters to gpg signature function" and=
 "package_manager: sign DEB package feeds"
>>>>>>>> enable signed DEB package feeds. This patch adds a runtime test =
for apt derived from the test_testimage_dnf
>>>>>>>> test. It creates a signed deb package feed, runs a qemu image to=
 install the key and performs some package
>>>>>>>> management. To be able to install the key the gnupg package is a=
dded to the testimage.
>>>>>>>>
>>>>>>> This went through the autobuilders and it seems this still fails:
>>>>>> That is disappointing.
>>>>>>
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds=
/3437/steps/15/logs/stdio
>>>>>>>
>>>>>>> ERROR: package-index-1.0-r0 do_package_index: Could not get gpg v=
ersion: Command '['/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/=
build-st-34525/tmp/hosttools/gpg', '--agent-program=3D/home/pokybuild/yoc=
to-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/hosttools/gpg-agent=
|--auto-expand-secmem', '--version', '--no-permission-warning']' returned=
 non-zero exit status 2.
>>>>>>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker=
/oe-selftest-ubuntu/build/build-st-34525/tmp/work/core2-64-poky-linux/pac=
kage-index/1.0-r0/temp/log.do_package_index.53841
>>>>>>> NOTE: recipe package-index-1.0-r0: task do_package_index: Failed
>>>>>> In fact package_index is failing, which is outside this patch code=
.
>>>>>>
>>>>>>> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/buil=
d/meta/recipes-core/meta/package-index.bb:do_package_index) failed with e=
xit code '1'
>>>>>>>
>>>>>>> This was ubuntu 16.04 so maybe gpg on the distro is too old (1.4.=
20) but
>>>>>>> I'm not sure as I think you are using gnupg-native.
>>>>>> I would have expected gnupg-native, but the log line above shows h=
osttools
>>>>>> is being used. But the same would happen for signed rpm and ipk fe=
eds right?
>>>>>>
>>>>>> Did we get the correct one tested? I see 55173d in next and then r=
everted by
>>>>>> Richard. But that was v2.
>>>>>>
>>>>> This was https://git.yoctoproject.org/poky-contrib/commit/?id=3D5ab=
da438ce762fc7b8e065e3e9063820c758918e
>>> This is the correct one.
>>>
>>>>> Just to be sure, I've started on ubuntu1604 both master and this br=
anch,
>>>>> we'll see if this reproduces.
>>>> Firstly, this is occurring in the newly added test so this is being =
triggered by
>>>> the new code. I suspect what is happening is that gnupg-native isn't=
 being built
>>>> before the test and this means that it is falling back to the system=
 gpg. The
>>>> system gpg is too old on that worker so it fails.
>>> Certainly
>>>
>>>> You can probably reproduce locally by not having a gpg on your build=
 system
>>>> (move it out the way temporarily?).
>>> Thanks for the tip. Not sure if I can remove the package, but IIUC it=
's the
>>> executable that needs to be present so I can just move it out of the =
way.
>>>
>>>> If I'm right (and I'm just guessing), the fix is to add the missing =
dependency
>>>> to ensure gpg is one we've built.
You are right
>>> I know how to add dependency in a recipe, but where to add here?
>>>
>>> I already have 'bitbake('gnupg-native -c addto_recipe_sysroot')'
>>> Should I run 'bitbake('gnupg-native')' before that?
>>>
>>> I copied these lines from test_testimage_dnf, shouldn't that have sim=
ilar
>>> problems?
>>>
>> sign_rpm.bbclass has PACKAGE_WRITE_DEPS +=3D "gnupg-native", doesn't t=
hat
>> solve this issue?
> Perhaps sign_package_feed.bbclass needs something like:
>
> PACKAGEINDEXDEPS +=3D "gnupg-native:do_populate_sysroot"

I added this to the end of 'meta/classes/package_deb.bbclass' and that=20
works.

Do you agree this is the right place?

Should I squash with this patch or send in as a separate patch (fixes=20
0b4231b5=20
<https://git.yoctoproject.org/poky/commit/?id=3D0b4231b597618e18668b8340f=
4209cd364b2b2d0>=20
"package_manager: sign DEB package feeds")?

> I'm not sure why/how it works in the rpm case but it does seem like the
> dependency is missing in the deb one.
>
> Cheers,
>
> Richard
>
>

