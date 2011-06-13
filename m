Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW8Nw-0005o2-E9
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 16:45:00 +0200
Received: by wye20 with SMTP id 20so3701786wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 07:41:36 -0700 (PDT)
Received: by 10.227.5.210 with SMTP id 18mr5236287wbw.18.1307976096294;
	Mon, 13 Jun 2011 07:41:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm4304896wbh.55.2011.06.13.07.41.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 07:41:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
Date: Mon, 13 Jun 2011 16:41:33 +0200
Message-Id: <419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
	<BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
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
X-List-Received-Date: Mon, 13 Jun 2011 14:45:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 15:57 heeft Bruce Ashfield het volgende geschreven:

> On Mon, Jun 13, 2011 at 9:27 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 13 jun 2011, om 14:54 heeft Bruce Ashfield het volgende =
geschreven:
>>=20
>>> On Mon, Jun 13, 2011 at 8:10 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>> Hi,
>>>>=20
>>>> After finding the bug Scott was running into with systemd-image (no =
DEVTMPFS support) I have a closer look at the qemarm kernel config and =
it looks dated to me. If we want to have tools like udev, powertop, =
iotop, latencytop working we need to revisit the config. =46rom a quick =
look I found the following items missing/incomplete:
>>>>=20
>>>> * devtmpfs + devtmpfs automounting. Recent udev versions require it
>>>> * cgroups, systemd requires it
>>>> * process accounting, *top uses it
>>>> * fuse, gvfs requires it
>>>> * autofs4, systemd works a lot better with it
>>>>=20
>>>> So what are people's thoughts on enabling the items that weren't =
set before and moving modules to built-in were > needed? And if it's =
wanted, does anyone have a quickstart on how these changes should be =
done properly? My 5 > minutes of google and 30 minutes of staring at the =
meta/ subdir didn't yield results.
>>>=20
>>> Hi Koen,
>>>=20
>>> The base configuration for the qemu* machines is kept as minimal as
>>> possible by design. It is supposed to be used as a building block, =
not
>>> cater to all the different image types we can throw at them by =
default.
>>=20
>> It sounds we need to remove the qemu machines from OE-core and =
replace them with more useful ones if we
>> want people to actually test images with the machine present in =
OE-core. The current kernel config blocks me
>> from merging a recent udev and systemd into oe-core since it can't be =
tested with only oe-core in bblayers.conf.
>=20
> I don't think we need to go this far. The configuration as it =
currently stands
> is not a golden standard, and in fact is already scheduled for some =
improvements
> in the yocto 1.1 timeframe.
>=20
> I'd consider this a suggestion for some new feature groups.
>=20
> I wouldn't considering enabling groups of functionality that the =
community needs
> for common higher level functional testing being extra or the kitchen
> sink. If we
> come up with feature groups, and name those groups, it is possible to
> disable them
> as well as enable them conditionally.
>=20
>> I've found minimalistic kernel configs a huge pain since you need to =
know the mapping between "userspace error
>> X" and "CONFIG_SOMETHING=3Dy", which most people don't know or want =
to know. With superset configs
>> customers (and users) can tweak it till it breaks, instead of =
tweaking till it works.
>=20
> There's definitely two sides to this. Keeping the configuration tight
> and minimal is
> the embedded roots of these configurations. The problem with large
> configurations
> is the test matrix, which is something that we try to take seriously.
> If there's an
> explicitly enabled configuration, there's a known test for it and core
> functionality that
> can enable it (and for the record, I won't claim that this is 100%
> followed, but that's
> something we aim to improve).
>=20
> Having named groups (where they names are the high level =
functionality) that
> provide optional configuration that can be enabled, tends to hit the
> middle ground
> between these two issues. Users can see the name and grab onto the
> functionality,
> while the core set of configs stays clean and small.
>=20
>>=20
>> I'm not saying the qemu kernel configs needs to have everything =
enabled, since they are emulated machines
>> which simply cannot have various extras (PCI cards) or have a hard =
time using them (USB devices are a pain in
>> qemu). But having 'basic' things like devtmpfs disabled is =
counterproductive as Scott and I found out.
>=20
> Agreed. This goes back to the functionality to enable common use cases =
and
> requirements. If you want to send suggestions via patches (config =
fragments
> and SRC_URI updates) or just send lists of missing functionality and a =
mapping
> to the higher level requirement, we can work together to enable what =
we need and
> move the rest to optional features or other layers.

The changes I made are (diffing the result from extract-ikconfig):

devtmpfs:

-# CONFIG_DEVTMPFS is not set
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy

cgroups:

-# CONFIG_CGROUPS is not set
-# CONFIG_NAMESPACES is not set
+CONFIG_CGROUPS=3Dy
+CONFIG_CGROUP_DEBUG=3Dy
+CONFIG_CGROUP_NS=3Dy
+CONFIG_CGROUP_FREEZER=3Dy
+CONFIG_CGROUP_DEVICE=3Dy
+CONFIG_CPUSETS=3Dy
+# CONFIG_PROC_PID_CPUSET is not set
+CONFIG_CGROUP_CPUACCT=3Dy
+CONFIG_RESOURCE_COUNTERS=3Dy
+CONFIG_CGROUP_MEM_RES_CTLR=3Dy
+CONFIG_CGROUP_MEM_RES_CTLR_SWAP=3Dy
+CONFIG_CGROUP_MEM_RES_CTLR_SWAP_ENABLED=3Dy
+CONFIG_CGROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_BLK_CGROUP=3Dy
+# CONFIG_DEBUG_BLK_CGROUP is not set
+CONFIG_NAMESPACES=3Dy
+CONFIG_UTS_NS=3Dy
+CONFIG_IPC_NS=3Dy
+CONFIG_USER_NS=3Dy
+CONFIG_PID_NS=3Dy
+CONFIG_NET_NS=3Dy
-# CONFIG_FREEZER is not set
+CONFIG_FREEZER=3Dy

Fuse/cuse:

-# CONFIG_FUSE_FS is not set
+CONFIG_FUSE_FS=3Dy
+CONFIG_CUSE=3Dy

taskstats:

-# CONFIG_TASKSTATS is not set
+CONFIG_TASKSTATS=3Dy
+CONFIG_TASK_DELAY_ACCT=3Dy
+CONFIG_TASK_XACCT=3Dy
+CONFIG_TASK_IO_ACCOUNTING=3Dy

Autofs:

-CONFIG_AUTOFS4_FS=3Dm
+CONFIG_AUTOFS4_FS=3Dy

So of those change I would group them as:

needed: devtmpfs, cgroups
nice to have, but not critical: taskstats
nice to have as module, but not critical: fuse/cuse
nice to have as builtin, but fine as module: autofs

I haven't touched the blockdev or netdev cgroup throttling since I have =
no use for that yet. I can now boot systemd-GNOME in qemu-arm and have =
IO numbers in htop, so my itches have been scratched with the above.=20

regards,

Koen





