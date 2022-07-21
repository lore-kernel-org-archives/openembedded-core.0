Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2022e0a9-cd4e-fbf0-47ac-4a8beae2fee6@gmail.com>
Date: Thu, 21 Jul 2022 11:29:25 -0400
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to service
References: <20210917080804.2545478-1-ch@denx.de>
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
 <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
 <3aad56dc-ae73-6449-c680-b9da234830f0@denx.de>
 <CAFrQVPNeNPnOErKJN73gp-wrvVnWazfENppLoUey3AF5mzC4Ng@mail.gmail.com>
 <77cc90ef-6c06-caee-c0a1-599628a986f4@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <77cc90ef-6c06-caee-c0a1-599628a986f4@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: drew@moseleynet.net, Kyle Russell <bkylerussell@gmail.com>, Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Marek Vasut <marex@denx.de>, Alex Kiernan <alex.kiernan@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>



On 7/21/22 11:17 AM, Drew Moseley wrote:
> On 2/3/22 9:12 AM, Kyle Russell wrote:
> 
>> Thanks, Claudius.  I really appreciate your responses.  I'm not trying 
>> to be pedantic.  Since I don't have your test setup, I was just trying 
>> to make sure I understood the context of the problem as I figure out 
>> how to deal with issues this is causing in our setup.
>>
>> I was also hoping one of the recipe maintainers of either systemd or 
>> rng-tools would comment on systemd-udev-settle.
>>
>> I'll take a look at the caam module to see if I can understand how it 
>> works.
>>
>> On Thu, Feb 3, 2022 at 3:35 AM Claudius Heine <ch@denx.de> wrote:
>>
>>     On 2022-02-02 17:26, Kyle Russell wrote:
>>     > Thanks, Claudius.
>>     >
>>     > On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine <ch@denx.de
>>     > <mailto:ch@denx.de>> wrote:
>>     >
>>     >     Hi Kyle,
>>     >
>>     >     On 2022-02-02 13:38, Kyle Russell wrote:
>>     >      > Is this the correct approach?  Even the
>>     >     systemd-udev-settle.service man
>>     >      > pages recommends not using its service.  Were the kernel
>>     modules
>>     >     really
>>     >      > not loaded when rngd started?  Or is the original problem
>>     just a
>>     >     matter
>>     >      > of waiting for sufficient entropy?
>>     >
>>     >     IIRC, the rngd could not find any random source device node
>>     (/dev/hwrng
>>     >     in that case), so the service failed to start.
>>     >
>>     >
>>     > If /dev/hwrng didn't exist, this feels like the original problem
>>     was a
>>     > misconfigured
>>     > kernel or module that wasn't being loaded properly.
>>
>>     Yes, however it is a timing issue. The module was loaded properly at
>>     bootup, however at the time rngd was started the module was not
>>     loaded
>>     yet and thus the service fails to start. If it would be delayed until
>>     the module is loaded everything would be fine.
>>
>>     It does not happen if the module is compiled into the kernel or if a
>>     initramfs is used which loads the module (I think). I our case it
>>     happend with the caam module as an external module loaded on boot
>>     from
>>     the real root file system.
>>
>>     >     The patch you are commenting on only adds `Wants` weak
>>     dependency to
>>     >     make sure `systemd-udev-settle.service` is pulled in to the
>>     job queue,
>>     >     the `After` ordering rule was already there.
>>     >
>>     >
>>     > Correct.  Just because an `After` exists does not mean the
>>     service gets
>>     > pulled into
>>     > the job queue, so prior to this change no other service was
>>     causing the
>>     > deprecated
>>     > systemd-udev-settle.service to be run during boot.  But now, every
>>     > device including
>>     > openssh (which has a default PACKAGECONFIG option for rng-tools)
>>     now depends
>>     > on this deprecated service, which may cause unexpected boot delays.
>>     >
>>     >     So changing this service file to be triggered by a udev
>>     event or maybe
>>     >     wrap it in a script, which makes sure the right modules are
>>     loaded and
>>     >     device nodes are available, could be an improvement, but it
>>     would be
>>     >     out
>>     >     of scope of this patch IMO.
>>     >
>>     >
>>     > I'm more curious whether this change should be reverted from
>>     upstream.
>>     > It seems
>>     > like a drop-in file could have been applied to your distro
>>     instead of
>>     > adding a dependency
>>     > on a deprecated service for all openssh users.
>>
>>     This patch just adds a missing entry into the service file. If you
>>     have
>>     solved the described issue in some way and can revert this patch and
>>     remove the `Wants=systemd-udev-settle.service` then you can also
>>     remove
>>     the `After=systemd-udev-settle.service` at the same time and at that
>>     point you can just remove both of those entries directly in the patch
>>     that solved the timing issue.
>>
>>     I agree that `systemd-udev-settle.service` should probably not be
>>     used
>>     anymore, however that file already used it in a non-functional way
>>     and
>>     all this patch did was make it fulfill its intended function.
>>
>>     In retrospect I probably should have tried to find a way to remove
>>     the
>>     usage of `systemd-udev-settle.service` completely, when I looked into
>>     the issue, however all this patch in essence does is revive dead
>>     code,
>>     which was already in place.
>>
>>     Also I think at that time I couldn't find a more precise
>>     instrument in
>>     systemds massive toolbox to delay the start of rngd and services that
>>     should be started in succession until the just the hardware random
>>     generator device is ready and `After=systemd-udev-settle.service` was
>>     already there. I guess some `ExecStartPre=` script which delays the
>>     start until the conditions are met could be implemented, but that
>>     seems
>>     a bit hackish.
>>
>>     regards,
>>     Claudius
>>
> 
> We are getting report from our users that adding this "Wants" causes 
> extremely slow boots on systems where it did not happen before this 
> change. Has anyone looked further into this and whether this change is 
> truly necessary?
> 
> We have it reverted locally to work around the specific issue but I 
> wonder if there is a deeper issue here.

It seems the issue was that module load was racing with rngd in that 
case perhaps adding After=systemd-modules-load.service
might have been another choice to solve it. Using 
systemd-udev-settle.service is a bit heavy handed as it will wait for 
full h/w discovery which could vary from system to system.

> 
> Drew
> 
> -- 
> mailto:drew@moseleynet.net
> 
> 
> 
> 
> 
