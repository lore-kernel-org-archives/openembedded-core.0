Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QXeld-00021h-MY
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 21:31:45 +0200
Received: by gxk3 with SMTP id 3so1546213gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=255f6eKR2sh5WPtfRvYiTQxCN+df94sU17TppN+GIWc=;
	b=TKX3ZoPxJ+ucEbOoN03lJTp8q9fBmpUEj2sC7rfyH9emRKn/5AadcuK0NTDIH2kRHo
	NnghYFh/BDEd4zjPhBN4AyFmX7kWncZtQqmtE8bWLiRvnNjpSKCl5LyEM5kY2krqG/k2
	2VgjKBcorl5FGLdxT9oTn75+YeXov7uQC6Te0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pxkBafqS9R1Tm9U1y8ca5ox2UuES+2771I27YTRU8AfaciU3iKhvBUjWjS4O6FPfWX
	VC/QpM2G07htYOjlS1Z1HIUhLRjKb9fIaqO1nMh5E/wDROMmVRkIcLCE3yF/wcGx5gIx
	6Gex5il/XfNTao8WXwoFMnYhad7YRCE4xrzdU=
MIME-Version: 1.0
Received: by 10.90.239.17 with SMTP id m17mr2962241agh.138.1308338896131; Fri,
	17 Jun 2011 12:28:16 -0700 (PDT)
Received: by 10.90.80.13 with HTTP; Fri, 17 Jun 2011 12:28:16 -0700 (PDT)
In-Reply-To: <419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
	<BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
	<419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
Date: Fri, 17 Jun 2011 15:28:16 -0400
Message-ID: <BANLkTi=MtMnHDATPBFPO-MVaCY+_N_sndA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] qemu* kernel configs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2011 19:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 10:41 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 13 jun 2011, om 15:57 heeft Bruce Ashfield het volgende geschreven:
>
>> On Mon, Jun 13, 2011 at 9:27 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 13 jun 2011, om 14:54 heeft Bruce Ashfield het volgende geschreven:
>>>
>>>> On Mon, Jun 13, 2011 at 8:10 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>> Hi,
>>>>>
>>>>> After finding the bug Scott was running into with systemd-image (no D=
EVTMPFS support) I have a closer look at the qemarm kernel config and it lo=
oks dated to me. If we want to have tools like udev, powertop, iotop, laten=
cytop working we need to revisit the config. From a quick look I found the =
following items missing/incomplete:
>>>>>
>>>>> * devtmpfs + devtmpfs automounting. Recent udev versions require it
>>>>> * cgroups, systemd requires it
>>>>> * process accounting, *top uses it
>>>>> * fuse, gvfs requires it
>>>>> * autofs4, systemd works a lot better with it
>>>>>
>>>>> So what are people's thoughts on enabling the items that weren't set =
before and moving modules to built-in were > needed? And if it's wanted, do=
es anyone have a quickstart on how these changes should be done properly? M=
y 5 > minutes of google and 30 minutes of staring at the meta/ subdir didn'=
t yield results.
>>>>
>>>> Hi Koen,
>>>>
>>>> The base configuration for the qemu* machines is kept as minimal as
>>>> possible by design. It is supposed to be used as a building block, not
>>>> cater to all the different image types we can throw at them by default=
.
>>>
>>> It sounds we need to remove the qemu machines from OE-core and replace =
them with more useful ones if we
>>> want people to actually test images with the machine present in OE-core=
. The current kernel config blocks me
>>> from merging a recent udev and systemd into oe-core since it can't be t=
ested with only oe-core in bblayers.conf.
>>
>> I don't think we need to go this far. The configuration as it currently =
stands
>> is not a golden standard, and in fact is already scheduled for some impr=
ovements
>> in the yocto 1.1 timeframe.
>>
>> I'd consider this a suggestion for some new feature groups.
>>
>> I wouldn't considering enabling groups of functionality that the communi=
ty needs
>> for common higher level functional testing being extra or the kitchen
>> sink. If we
>> come up with feature groups, and name those groups, it is possible to
>> disable them
>> as well as enable them conditionally.
>>
>>> I've found minimalistic kernel configs a huge pain since you need to kn=
ow the mapping between "userspace error
>>> X" and "CONFIG_SOMETHING=3Dy", which most people don't know or want to =
know. With superset configs
>>> customers (and users) can tweak it till it breaks, instead of tweaking =
till it works.
>>
>> There's definitely two sides to this. Keeping the configuration tight
>> and minimal is
>> the embedded roots of these configurations. The problem with large
>> configurations
>> is the test matrix, which is something that we try to take seriously.
>> If there's an
>> explicitly enabled configuration, there's a known test for it and core
>> functionality that
>> can enable it (and for the record, I won't claim that this is 100%
>> followed, but that's
>> something we aim to improve).
>>
>> Having named groups (where they names are the high level functionality) =
that
>> provide optional configuration that can be enabled, tends to hit the
>> middle ground
>> between these two issues. Users can see the name and grab onto the
>> functionality,
>> while the core set of configs stays clean and small.
>>
>>>
>>> I'm not saying the qemu kernel configs needs to have everything enabled=
, since they are emulated machines
>>> which simply cannot have various extras (PCI cards) or have a hard time=
 using them (USB devices are a pain in
>>> qemu). But having 'basic' things like devtmpfs disabled is counterprodu=
ctive as Scott and I found out.
>>
>> Agreed. This goes back to the functionality to enable common use cases a=
nd
>> requirements. If you want to send suggestions via patches (config fragme=
nts
>> and SRC_URI updates) or just send lists of missing functionality and a m=
apping
>> to the higher level requirement, we can work together to enable what we =
need and
>> move the rest to optional features or other layers.
>
> The changes I made are (diffing the result from extract-ikconfig):

An update to this:

>
> devtmpfs:
>
> -# CONFIG_DEVTMPFS is not set
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy

These are good options to have. I've recently turned them on
for other kernels, for all arch. I'll be adding this in shortly.

>
> cgroups:
>
> -# CONFIG_CGROUPS is not set
> -# CONFIG_NAMESPACES is not set
> +CONFIG_CGROUPS=3Dy
> +CONFIG_CGROUP_DEBUG=3Dy
> +CONFIG_CGROUP_NS=3Dy
> +CONFIG_CGROUP_FREEZER=3Dy
> +CONFIG_CGROUP_DEVICE=3Dy
> +CONFIG_CPUSETS=3Dy
> +# CONFIG_PROC_PID_CPUSET is not set
> +CONFIG_CGROUP_CPUACCT=3Dy
> +CONFIG_RESOURCE_COUNTERS=3Dy
> +CONFIG_CGROUP_MEM_RES_CTLR=3Dy
> +CONFIG_CGROUP_MEM_RES_CTLR_SWAP=3Dy
> +CONFIG_CGROUP_MEM_RES_CTLR_SWAP_ENABLED=3Dy
> +CONFIG_CGROUP_SCHED=3Dy
> +CONFIG_FAIR_GROUP_SCHED=3Dy
> +# CONFIG_RT_GROUP_SCHED is not set
> +CONFIG_BLK_CGROUP=3Dy
> +# CONFIG_DEBUG_BLK_CGROUP is not set

For the most part these are all good as well, these used to be on
for 2.6.34 but were changed in 2.6.37, I've re-enabled the cgroups
features so they'll be back shortly.

> +CONFIG_NAMESPACES=3Dy
> +CONFIG_UTS_NS=3Dy
> +CONFIG_IPC_NS=3Dy
> +CONFIG_USER_NS=3Dy

This one is experimental, I'll consider it a bit longer. but as we all know=
,
just because something is experimental, doesn't really many anything the
tag tends to stay on things longer than necessary.

> +CONFIG_PID_NS=3Dy
> +CONFIG_NET_NS=3Dy

I'd prefer this one to be triggered by specific userspace functionality, bu=
t
am adding it in as something that can be enabled easily. Perhaps by
default, I'll need to look a bit more into this.

> -# CONFIG_FREEZER is not set
> +CONFIG_FREEZER=3Dy

Do you have some unit tests for this ? I don't have anything handy and
want to try this cross arch/cross configs. But this one looks fine to me.
>
> Fuse/cuse:
>
> -# CONFIG_FUSE_FS is not set
> +CONFIG_FUSE_FS=3Dy
> +CONFIG_CUSE=3Dy

Ack'd. No harm in this, I've had it on in the past, and it should still be =
on.

>
> taskstats:
>
> -# CONFIG_TASKSTATS is not set
> +CONFIG_TASKSTATS=3Dy
> +CONFIG_TASK_DELAY_ACCT=3Dy
> +CONFIG_TASK_XACCT=3Dy
> +CONFIG_TASK_IO_ACCOUNTING=3Dy

These are experimental, I need to run some tests with them, but they
can be a config group that is enabled on demand.

>
> Autofs:
>
> -CONFIG_AUTOFS4_FS=3Dm
> +CONFIG_AUTOFS4_FS=3Dy

ack'd, we can likely make this switch.

>
> So of those change I would group them as:
>
> needed: devtmpfs, cgroups
> nice to have, but not critical: taskstats
> nice to have as module, but not critical: fuse/cuse
> nice to have as builtin, but fine as module: autofs

fuse as a module make sense. So we are aligned here. I'll be
making these changes shortly and cooking up some simple tests.

Cheers,

Bruce

>
> I haven't touched the blockdev or netdev cgroup throttling since I have n=
o use for that yet. I can now boot systemd-GNOME in qemu-arm and have IO nu=
mbers in htop, so my itches have been scratched with the above.
>
> regards,
>
> Koen
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


