Return-Path: <aws.ismail@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFE560043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 22:11:30 +0000 (UTC)
Received: by oige206 with SMTP id e206so33946495oig.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 14:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9yNc2TNTzLGx7XrVorFxqpalWpSdErGh88cy9lhktNQ=;
	b=xiQ4h0H7OYr4K0fKXICIO6GEWVGhNXKrUYOPSdQ++iPBu7geH2R9wG/DMlwLVFK8SV
	BLDrwO/OClTQVF5JEITdbFPseoH3ZV4D1dugZIffdP17/C6ru+M+TteTYjhIyWqwKU7Q
	liNjHASBSuKGpemXf0Y/so8vl89SbvRWfmYETiktdh3r7gjD9qyb1FffhN2E7yBtyrZ1
	HusOpcWu8dFlc0rGWKEaP9qsj997LNhuuv921+DS+KES/VggxGbNBCOoeAKbiqzmmBde
	Z0GV267/6Dh1bIeR1e7+jMRpup/yDZloQIEhD9n/HlZvtCn+ctxFqgmkSNrWqmg0STCU
	Vjdg==
X-Received: by 10.202.71.132 with SMTP id u126mr2626022oia.113.1447884691400; 
	Wed, 18 Nov 2015 14:11:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Wed, 18 Nov 2015 14:11:11 -0800 (PST)
In-Reply-To: <1447846594.2472.54.camel@gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
	<CAMHMu0MA7Sw2UbnrBZrtOYMZ141zN38+D4BU3DUeQVcV2teueQ@mail.gmail.com>
	<CAMHMu0NAHXA305mAv4uRw-o9eVrpHCL7FOnOVPCV9iymES36dg@mail.gmail.com>
	<1447763059.4741.32.camel@gmail.com>
	<CAMHMu0PVOvzso-rmN4nAk2bfQaRBiUTBeeBbfbxxj-1g_gp-gg@mail.gmail.com>
	<CAMHMu0NXXcAkh8hy7hG+zJxhtvQ4=7L01dDnE84w15m2Zb4eVg@mail.gmail.com>
	<1447846594.2472.54.camel@gmail.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Wed, 18 Nov 2015 17:11:11 -0500
Message-ID: <CAMHMu0Pg9ac3QOUcK3CNZj4rZ5EMBnh5DnfTNR0HBUfc218xmg@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] runqemu improve networking
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
X-List-Received-Date: Wed, 18 Nov 2015 22:11:31 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Adrian once again..

On Wed, Nov 18, 2015 at 6:36 AM, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> Hi Aws
>
> Creating tap devices, routes or changing the iptables requires extended permissions. runqemu-gen-tapdevs does the part
> of the setup which requires to be done with extended permissions. runqemu does the part which is allowed to be done by a
> regular user. Normally the tap devices can be "recycled" for many runs of runqemu. This allows to call runqemu-gen
> -tapdevs once at boot as the only command running with sudo on the host.
>
> runqemu-gen-tapdevs changes the iptables of the host. It configures a NAT rule to get the virtual device connected to
> the Internet. For most use cases this is fine. But the NAT route prevents use cases where for example a bridged setup is
> required. Therefore my patchset adds an optional parameter netmode, which makes runqemu-gen-tapdevs skipping the NAT
> setup. If I remember correctly, runqemu-gen-tapdevs creates the NAT route for each tap interface. This is probabely not
> what you want if you are going to connect more than one tap interface to one qemu instance. If you call runqemu-gen
> -tapdevs with netmode set to hostonly, the virtual devices will not have a route to the internet. If a route from a
> virtual device to the Internet is still required you need to setup the NAT route on one of the tap interfaces (e.g.
> write a wrapper script around runqemu-gen-tapdevs). Instead of setting up the route on a tap interface it might be
> better to add the tap interface to a bridge and to setup the route on the bridge.
>
> Basic idea of a wrapper script (sudo):
> # Setup a bridge with route to the Internet and dhcp/DNS server or what ever needed
> ip link add ${bridge_name} type bridge
> ip link set ${bridge_name} up
> # Create the tap for the hostonly connection (IP 192.168.7.2)
> runqemu-gen-tapdevs ${MYUID} ${MYGID} 1 ${sysroot_dir} hostonly
> # Create second tap interface connected to the bridge
> ip tuntap add ${tap_name} mode tap
> ip link set ${tap_name} up
> ip link set ${tap_name} master ${bridge_name}
>
>
> # Finally qemu can be started (without sudo)
> runqemu hostonly qemuparams="-device virtio-net-pci,netdev=netif1,mac=${macaddr1} -netdev
> tap,id=netif1,ifname=${tap_name},script=no,downscript=no"
>
>
> Regards,
> Adrian
>
> On Tue, 2015-11-17 at 21:22 -0500, Aws Ismail wrote:
>> Adrian,
>>
>> I just have to add one last note here. I had to use
>> runqemu-gen-tapdevs before runqemu to create the multiple tap devices
>> (3 in total, tap0 is the default one you've mentioned, and then tap1
>> and tap2). For example, I did this:
>>
>> sudo runqemu-gen-tapdevs <my uid> <my guid> 3 <path to my build's
>> native sysroot>
>>
>> My thinking was that runqemu would do that for me since I am asking
>> for two new extra netdev's but apparently not.
>>
>> On Tue, Nov 17, 2015 at 2:40 PM, Aws Ismail <aws.ismail@gmail.com> wrote:
>> > Thanks Adrian for the explanation. I have tested it now and it works
>> > fine in my case. I think this should be merged upstream because it is
>> > an important feature to have specially if the user is planning to use
>> > the VM for extended use.
>> >
>> >
>> > Tested-by: Aws Ismail <aws.ismail@gmail.com>
>> >
>> >
>> >
>> > On Tue, Nov 17, 2015 at 7:24 AM, Adrian Freihofer
>> > <adrian.freihofer@gmail.com> wrote:
>> > > Hi Aws
>> > >
>> > > The interfaces of my virtual device are configured as:
>> > > eth0: static IP, 192.168.7.2 (This IP is hard coded in many scripts of poky.)
>> > >       This interface is for debugging purpose, it is not available
>> > >       on my physical devices running in a productive environment.
>> > >       The interface is configured by the kernel command line
>> > >       provided by the runqemu script. This interface should
>> > >       (or must in case of NFS rootfs) be ignored by connman, networkmanager
>> > >       or what ever manages the network settings of your device.
>> > > eth1: Configured by connman or networkmanager running on the virtual device.
>> > >       The part of the setup depends on the particular use case you need
>> > >       to emulate. In my setup the tap interfaces of the host ar part
>> > >       of a bridge. On the bridge a dnsmasq instance serves IP addresses.
>> > >       This part of my setup is not published. It is verry specific. But based
>> > >       on my patch set it should be easy to do something similar fitting your
>> > >       use case. The simplest approach might be a static IP address e.g.
>> > >       assigned by a bbappend file e.g. for connman.
>> > >
>> > > runqemu is started with additional parameters to create eth1:
>> > > runqemu hostonly qemuparams="-device virtio-net-pci,netdev=netif1,mac=${macaddr1} -netdev
>> > > tap,id=netif1,ifname=${HOST_TAP_NAME},script=no,downscript=no"
>> > >
>> > > Regards,
>> > > Adrian
>> > >
>> > > On Mon, 2015-11-16 at 17:16 -0500, Aws Ismail wrote:
>> > > > Hi Adrian,
>> > > >
>> > > > What's the runqemu line you are running with ?
>> > > >
>> > > > I am passing -net nic -net nic to the qemuparams line which works
>> > > > fine, but the the two devices come up with no IP addresses.
>> > > >
>> > > > My full qemu line is:
>> > > >
>> > > > ROOTFS=<path to qemu.ext4> runqemu qemux86-64 nographic
>> > > > qemuparams="-cpu host --enable-kvm -m 4096 -net nic -net nic"
>> > > >
>> > > > Aws\
>> > > >
>> > > > On Sun, Nov 15, 2015 at 1:01 AM, Aws Ismail <aws.ismail@gmail.com> wrote:
>> > > > > Thanks Adrian for the patchset. I will test it and get back to you.
>> > > > >
>> > > > > Aws\
>> > > > >
>> > > > > On Sat, Nov 14, 2015 at 4:35 PM, Adrian Freihofer
>> > > > > <adrian.freihofer@gmail.com> wrote:
>> > > > > > This patch series adds two features to runqemu:
>> > > > > > - Support the emulation of more than one NIC
>> > > > > > - Add a hostonly networking mode. This networking mode enables
>> > > > > >   the user to implement different virtual networking environments
>> > > > > >   such as a bridged network as discussed in #7887.
>> > > > > >
>> > > > > > Note: Without the first patch connman fails if the virtual device
>> > > > > >       provides more than one NIC.
>> > > > > >
>> > > > > > @Aws Ismail: I'm using this since more than one year. Would be great
>> > > > > >              if you could test this and provide feedback.
>> > > > > >
>> > > > > > Adrian Freihofer (3):
>> > > > > >   connman: fix qemu config
>> > > > > >   runqemu: add support for multiple NICs
>> > > > > >   runqemu: support hostonly net mode
>> > > > > >
>> > > > > >  .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
>> > > > > >  scripts/runqemu                                    |  7 +++-
>> > > > > >  scripts/runqemu-gen-tapdevs                        | 11 ++++---
>> > > > > >  scripts/runqemu-ifdown                             | 33 +++++++++++--------
>> > > > > >  scripts/runqemu-ifup                               | 38 +++++++++++++---------
>> > > > > >  scripts/runqemu-internal                           | 21 +++++++-----
>> > > > > >  6 files changed, 72 insertions(+), 44 deletions(-)
>> > > > > >
>> > > > > > --
>> > > > > > 2.4.3
>> > > > > >

