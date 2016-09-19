Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 100766014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 03:42:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J3g44Q007487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Sep 2016 20:42:04 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 20:42:03 -0700
To: Randy MacLeod <randy.macleod@windriver.com>, Christopher Larson
	<clarson@kergoth.com>
References: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
	<CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
	<82ab3d71-56c0-44b8-a892-91cfc90c0330@windriver.com>
	<CABcZANnnuemBFW_JFQJn-sVeao2vFviexrq-ps743M_V2264kw@mail.gmail.com>
	<3356320e-19eb-636a-5c32-c4bdc855aa99@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <71906ead-d7a3-c541-76e2-96824df5006c@windriver.com>
Date: Mon, 19 Sep 2016 11:42:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3356320e-19eb-636a-5c32-c4bdc855aa99@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Mon, 19 Sep 2016 03:42:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 09/19/2016 11:32 AM, Randy MacLeod wrote:
> On 2016-09-18 10:37 PM, Christopher Larson wrote:
>>
>> On Sun, Sep 18, 2016 at 7:32 PM, Randy MacLeod
>> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
>>
>>     On 2016-09-17 01:09 AM, Christopher Larson wrote:
>>
>>
>>         On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod
>>         <Randy.MacLeod@windriver.com
>>         <mailto:Randy.MacLeod@windriver.com>
>>         <mailto:Randy.MacLeod@windriver.com
>>         <mailto:Randy.MacLeod@windriver.com>>> wrote:
>>
>>             Without a packageconfig dependency for the file utility, there's
>>             a very rare compile faiure caused by a race where the magic.h
>>             header file is not found:
>>
>>              ../../../git/lib/support/plausible.c:33:19: fatal error:
>>         magic.h:
>>             No such file or directory
>>
>>             This file, plausible.c, is part of libsupport.a which is used by
>>             many binaries produced by the e2fsprogs package. plausible.c
>>         attempts
>>             to dynamically load libmagic.so if the e2fsprogs configure
>>         detects
>>             that magic was available. Adding the packageconfig will
>>         eliminate
>>             the build as well as the possible configure-time race condition.
>>
>>             Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>>         <mailto:Randy.MacLeod@windriver.com>
>>             <mailto:Randy.MacLeod@windriver.com
>>         <mailto:Randy.MacLeod@windriver.com>>>
>>             ---
>>              meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>         <http://e2fsprogs_1.43.bb>
>>             <http://e2fsprogs_1.43.bb> | 1 +
>>              1 file changed, 1 insertion(+)
>>
>>             diff --git
>>         a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>         <http://e2fsprogs_1.43.bb>
>>             <http://e2fsprogs_1.43.bb>
>>             b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>         <http://e2fsprogs_1.43.bb>
>>             <http://e2fsprogs_1.43.bb>
>>             index f4855bc..1707cb9 100644
>>             --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>         <http://e2fsprogs_1.43.bb>
>>             <http://e2fsprogs_1.43.bb>
>>             +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>         <http://e2fsprogs_1.43.bb>
>>             <http://e2fsprogs_1.43.bb>
>>             @@ -23,6 +23,7 @@ EXTRA_OECONF += "--libdir=${base_libdir}
>>             --sbindir=${base_sbindir} \
>>              EXTRA_OECONF_darwin = "--libdir=${base_libdir}
>>             --sbindir=${base_sbindir} --enable-bsd-shlibs"
>>
>>              PACKAGECONFIG ??= ""
>>             +PACKAGECONFIG[file] = ',,file'
>>
>>
>>         This isn’t going to be good enough. You aren’t explicitly
>>         enabling/disabling the option, so it’ll still detect based on
>>         what’s in
>>         the sysroot, so recipe build order will result in non-deterministic
>>         behavior.
>>
>>
>>     Hi Christopher,
>>
>>     Thanks for the response but I don't understand.
>>     I'm probably wrong so please explain.
>>     It seems that you're suggesting that I add:
>>      --with[out]-magic to e2fsprogs configure, and while
>>     I could do that, it does not seem to be needed.
>>
>>
>>     Short response:
>>
>>       This change forces 'file' to be built before e2fsprogs if 'file'
>>       is present in the image or world build. Then e2fsprogs will
>>       detect magic.h,libmagic.so and  the race is eliminated.
>>
>>
>> That’s only the case if ‘file’ is in PACKAGECONFIG, if not, it’ll still
>> behave the way it did before, and change its deps based on build order.
>> Our policy is to avoid floating deps period, regardless of
>> PACKAGECONFIG. If a given packageconfig is not enabled, then explicitly
>> disable the dependency, don’t detect and use it anyway.
>
> Ah right and now I see some uses where there would not be a
> package dependency required.
>
> I'll likely send a v2 adding just:
>    PACKAGECONFIG ??= "file"

I'm afraid that this can't fix the floating deps, if file is a must
and can't be disabled, you can set:

DEPENDS += "file"

rather than use a PACKAGECONFIG.

> since 'fuse' is in the meta-filesystems layer but

For fuse:
PACKAGECONFIG ??= ""
PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'

It is disabled by default, but other layers use a e2fsprogs.bbappend
or PACKAGECONFIG_pn-e2fsprogs = "fuse" in conf file to enable it.

> I don't understand how the fuse dependency gets fixed since

It is disabled by default (--disable-fuse2fs), this can fix the
floating deps issue.

// Robert

> it's not changed in meta-oe/meta-filesystems AFAIKT. Should the
> fuse dependency be added as well so that builds that add
> the meta-filesystems layer don't have this potential race?
> I could do some testing to find out but it's late here.
> Robert likely knows all about this so I'm
> CCing him since he also committed the fuse change.
>
> It seems unlikely but we could have a pile of clean-up
> to do...
>
> Thanks,
> ../Randy
>
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>
>

