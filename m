Return-Path: <aws.ismail@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id E086D606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:23:10 +0000 (UTC)
Received: by oiww189 with SMTP id w189so17022782oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sfIvFGEpFKVrZsuLeMWaBBH5OK/r4uL9QhM/VRxhDaw=;
	b=pNEzhdZVf3mkkv7Ih3N1JcgtQDx5Y8IixQHBUyOUu1jLDJiDgEXLDAjwKaMmHAgpKV
	8RoX934+mOjZBDXx/5z0rW2uxDhr7/s5SW3WOoY3d7+Kvi9z8iuHRFFxm+Rn10q46eRW
	PpHrXKlSZHYR1TBa/+tAwPU1nWtDGFAuIMMKhyrKzufNKI9ohE1LUKNkIzj+2aEwlyGj
	S8N3c62y3wwvkSfWYpjhAY1Jkd4a+n84remBABi3X1qi2VXsnqME9uNIY9rkyVWw1xTz
	QhglN1woyyV3tmgW5hOhot2SQpLRpuJur4Op8lfwq22eCrG/jtRoaaqLPYPzqRlLXbXC
	zrMg==
X-Received: by 10.202.105.144 with SMTP id e138mr26648031oic.77.1447813391068; 
	Tue, 17 Nov 2015 18:23:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Tue, 17 Nov 2015 18:22:51 -0800 (PST)
In-Reply-To: <CAMHMu0PVOvzso-rmN4nAk2bfQaRBiUTBeeBbfbxxj-1g_gp-gg@mail.gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
	<CAMHMu0MA7Sw2UbnrBZrtOYMZ141zN38+D4BU3DUeQVcV2teueQ@mail.gmail.com>
	<CAMHMu0NAHXA305mAv4uRw-o9eVrpHCL7FOnOVPCV9iymES36dg@mail.gmail.com>
	<1447763059.4741.32.camel@gmail.com>
	<CAMHMu0PVOvzso-rmN4nAk2bfQaRBiUTBeeBbfbxxj-1g_gp-gg@mail.gmail.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Tue, 17 Nov 2015 21:22:51 -0500
Message-ID: <CAMHMu0NXXcAkh8hy7hG+zJxhtvQ4=7L01dDnE84w15m2Zb4eVg@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Nov 2015 02:23:14 -0000
Content-Type: text/plain; charset=UTF-8

Adrian,

I just have to add one last note here. I had to use
runqemu-gen-tapdevs before runqemu to create the multiple tap devices
(3 in total, tap0 is the default one you've mentioned, and then tap1
and tap2). For example, I did this:

sudo runqemu-gen-tapdevs <my uid> <my guid> 3 <path to my build's
native sysroot>

My thinking was that runqemu would do that for me since I am asking
for two new extra netdev's but apparently not.

On Tue, Nov 17, 2015 at 2:40 PM, Aws Ismail <aws.ismail@gmail.com> wrote:
> Thanks Adrian for the explanation. I have tested it now and it works
> fine in my case. I think this should be merged upstream because it is
> an important feature to have specially if the user is planning to use
> the VM for extended use.
>
>
> Tested-by: Aws Ismail <aws.ismail@gmail.com>
>
>
>
> On Tue, Nov 17, 2015 at 7:24 AM, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
>> Hi Aws
>>
>> The interfaces of my virtual device are configured as:
>> eth0: static IP, 192.168.7.2 (This IP is hard coded in many scripts of poky.)
>>       This interface is for debugging purpose, it is not available
>>       on my physical devices running in a productive environment.
>>       The interface is configured by the kernel command line
>>       provided by the runqemu script. This interface should
>>       (or must in case of NFS rootfs) be ignored by connman, networkmanager
>>       or what ever manages the network settings of your device.
>> eth1: Configured by connman or networkmanager running on the virtual device.
>>       The part of the setup depends on the particular use case you need
>>       to emulate. In my setup the tap interfaces of the host ar part
>>       of a bridge. On the bridge a dnsmasq instance serves IP addresses.
>>       This part of my setup is not published. It is verry specific. But based
>>       on my patch set it should be easy to do something similar fitting your
>>       use case. The simplest approach might be a static IP address e.g.
>>       assigned by a bbappend file e.g. for connman.
>>
>> runqemu is started with additional parameters to create eth1:
>> runqemu hostonly qemuparams="-device virtio-net-pci,netdev=netif1,mac=${macaddr1} -netdev
>> tap,id=netif1,ifname=${HOST_TAP_NAME},script=no,downscript=no"
>>
>> Regards,
>> Adrian
>>
>> On Mon, 2015-11-16 at 17:16 -0500, Aws Ismail wrote:
>>> Hi Adrian,
>>>
>>> What's the runqemu line you are running with ?
>>>
>>> I am passing -net nic -net nic to the qemuparams line which works
>>> fine, but the the two devices come up with no IP addresses.
>>>
>>> My full qemu line is:
>>>
>>> ROOTFS=<path to qemu.ext4> runqemu qemux86-64 nographic
>>> qemuparams="-cpu host --enable-kvm -m 4096 -net nic -net nic"
>>>
>>> Aws\
>>>
>>> On Sun, Nov 15, 2015 at 1:01 AM, Aws Ismail <aws.ismail@gmail.com> wrote:
>>> > Thanks Adrian for the patchset. I will test it and get back to you.
>>> >
>>> > Aws\
>>> >
>>> > On Sat, Nov 14, 2015 at 4:35 PM, Adrian Freihofer
>>> > <adrian.freihofer@gmail.com> wrote:
>>> > > This patch series adds two features to runqemu:
>>> > > - Support the emulation of more than one NIC
>>> > > - Add a hostonly networking mode. This networking mode enables
>>> > >   the user to implement different virtual networking environments
>>> > >   such as a bridged network as discussed in #7887.
>>> > >
>>> > > Note: Without the first patch connman fails if the virtual device
>>> > >       provides more than one NIC.
>>> > >
>>> > > @Aws Ismail: I'm using this since more than one year. Would be great
>>> > >              if you could test this and provide feedback.
>>> > >
>>> > > Adrian Freihofer (3):
>>> > >   connman: fix qemu config
>>> > >   runqemu: add support for multiple NICs
>>> > >   runqemu: support hostonly net mode
>>> > >
>>> > >  .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
>>> > >  scripts/runqemu                                    |  7 +++-
>>> > >  scripts/runqemu-gen-tapdevs                        | 11 ++++---
>>> > >  scripts/runqemu-ifdown                             | 33 +++++++++++--------
>>> > >  scripts/runqemu-ifup                               | 38 +++++++++++++---------
>>> > >  scripts/runqemu-internal                           | 21 +++++++-----
>>> > >  6 files changed, 72 insertions(+), 44 deletions(-)
>>> > >
>>> > > --
>>> > > 2.4.3
>>> > >

