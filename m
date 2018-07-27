Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEC878998
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:44:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R1iNjf009247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 18:44:23 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 26 Jul 2018 18:44:22 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ricardo Salveti
	<rsalveti@rsalveti.net>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
	<105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
	<90a08929e5fe482b9cde1599fa2585a2@XBOX02.axis.com>
	<CAHYQr0rsGOVc-4d-9ntLA0STTcZR2g+E8gqy9kpak1FD0Y6ztw@mail.gmail.com>
	<6220ed829b804d49b167503234a07fb0@XBOX02.axis.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <180e867a-1a86-7fb9-df86-b3a45424873d@windriver.com>
Date: Fri, 27 Jul 2018 09:48:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <6220ed829b804d49b167503234a07fb0@XBOX02.axis.com>
X-Originating-IP: [128.224.162.218]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Fri, 27 Jul 2018 01:44:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2018 11:07 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Ricardo Salveti <rsalveti@rsalveti.net>
>> Sent: den 26 juli 2018 16:37
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Cc: ChenQi <Qi.Chen@windriver.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
>>
>> On Thu, Jul 26, 2018 at 9:30 AM, Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>> <openembedded-
>>>> core-bounces@lists.openembedded.org> On Behalf Of ChenQi
>>>> Sent: den 26 juli 2018 07:51
>>>> To: Ricardo Salveti <rsalveti@rsalveti.net>
>>>> Cc: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
>>>>
>>>> On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
>>>>> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen@windriver.com>
>> wrote:
>>>>>> Upgrade systemd to 239.
>>> [cut]
>>>
>>>>>> 3. update-alternatives changes
>>>>>>     The utilities like shutdown, poweroff, etc. are now created as
>> symlinks
>>>>>>     at do_install. So there's no need to use update-alternatives
>> mechanism
>>>>>>     anymore to create the symlinks now. In addtion, I don't think
>> we> now
>>>>>>     support multiple init systems at one running system, so
>> there's really
>>>>>>     no need to use update-alternatives mechanism here.
>>>>> I noticed that reboot stopped working locally as I had busybox
>>>>> installed together with systemd, and the busybox version ended up
>>>>> being used as it was provided via update-alternatives.
>>>>>
>>>>> Looking for possible similar broken links, I found that
>>>>> update-alternatives ended up pointing reboot, halt and poweroff to
>> the
>>>>> busybox binary instead of systemctl. Should we revert the changes
>> and
>>>>> bring back update-alternatives for them?
>>>>>
>>>>> Thanks,
>>>> I think the correct direction to fix this problem is to make busybox
>>>> only provide init utilities (reboot, halt, etc) when init manager is
>>>> set to busybox.
>>>>
>>>> We current have in busybox recipe's SRC_URI:
>>>>              ${@["",
>>>> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
>>>> 'busybox')]} \
>>>>
>>>> I think the init utilities should be moved to init.cfg.
>>>>
>>>> Please check my logic to see if you can agree with it.
>>>> We have two facts here.
>>>> 1. Init utilities (reboot, halt, etc.) are tightly bond to the
>> specific
>>>> implementation of PID 1.
>>>> 2. We only allow one PID 1 in our image. (VIRTUAL-
>> RUNTIME_init_manager).
>>>> So we can conclude from the above two facts that it does not make
>> much
>>>> sense to have multiple providers of init utilities while we only
>> allow
>>>> one PID 1 provider on image.
>>>>
>>>> After all, we are using update-*alternatives*, things that this
>>>> mechanism manages are supposed to generally serve as alternatives to
>>>> each other.
>>>>
>>>> Best Regards,
>>>> Chen Qi
>>> For what it is worth, we have a package that installs wrappers for
>> init and
>>> reboot, which is now causing image creation to fail due to the change
>> to
>>> systemd since both packages now try to install init and reboot. I can
>> of
>>> course add a systemd_%.bbappend to remove init and reboot, but that
>> means
>>> the systemd package is broken unless the package with the wrappers is
>>> always installed.
>> Curious to why you need such wrappers, but wasn't it a problem before
> Well, to be honest, I did not know we had those wrappers until the image
> creation broke due to the change to the systemd recipe. I am not responsible
> for our use of systemd, so I have no idea why we have those wrappers...
>
>> even when we had update-alternatives for such utilities (e.g.
>> update-alternatives failing to link init/reboot because of your
>> wrappers when creating the rootfs)?
> I have not looked into it, but it seems the installation of the wrappers
> silently overwrites the links created by update-alternatives.

A wrappers is usually written like this:
<hook actions>
<actual call to the real binary>

sysv has the runlevel/service mechanism, and systemd has unit mechanism.
We'd better use such mechanisms to do the hook actions.

For reboot, you may want to look at rc6.d for sysvinit and reboot.target 
for systemd.
As an example on systemd, check 
/lib/systemd/system/reboot.target.wants/systemd-update-utmp-runlevel.service.

Best Regards,
Chen Qi

>> Cheers,
>> --
>> Ricardo Salveti de Araujo
> //Peter
>


