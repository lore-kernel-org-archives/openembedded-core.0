Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-03.prod.phx3.secureserver.net
	(p3plsmtpa12-03.prod.phx3.secureserver.net [68.178.252.232])
	by mail.openembedded.org (Postfix) with ESMTP id 044A16B7BF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 06:31:32 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-03.prod.phx3.secureserver.net with 
	id 26XU1p0070BVjqb016XUg8; Sat, 11 Oct 2014 23:31:32 -0700
Message-ID: <543A203E.2000902@pabigot.com>
Date: Sun, 12 Oct 2014 01:31:26 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>, 
	openembedded-core@lists.openembedded.org, 
	Peter Seebach <peter.seebach@windriver.com>
References: <543965E7.3040806@pabigot.com> <54399CE0.5000807@mlbassoc.com>
	<5439B9EC.3010508@pabigot.com> <5439BCE9.80002@mlbassoc.com>
In-Reply-To: <5439BCE9.80002@mlbassoc.com>
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Sun, 12 Oct 2014 06:31:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2014 06:27 PM, Gary Thomas wrote:
> On 2014-10-11 17:14, Peter A. Bigot wrote:
>> On 10/11/2014 04:10 PM, Gary Thomas wrote:
>>> On 2014-10-11 11:16, Peter A. Bigot wrote:
>>>> Back at 
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053836.html 
>>>> it was noted that the dbus home directory /var/lib/dbus on the 
>>>> target was using the
>>>> build host uid/gid.  Various discussion agreed this shouldn't 
>>>> happen, but there was no resolution in the thread.
>>>>
>>>> I found https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 
>>>> which is marked fixed, but on a newly installed system I find:
>>>>
>>>> root@beaglebone:~# ls -l /var/lib
>>>> total 52
>>>> drwxr-xr-x 2 root root 4096 Oct 11  2014 alsa
>>>> drwxr-xr-x 2 root root 4096 Oct 11  2014 arpd
>>>> drwxr-xr-x 2 root root 4096 Oct 11 12:30 connman
>>>> drwxr-xr-x 2  102  105 4096 Oct 11  2014 dbus
>>>>
>>>> where the dbus uid/gid is from my host system as shown by:
>>>>
>>>> root@beaglebone:~# grep dbus /etc/passwd
>>>> messagebus:x:999:998::/var/lib/dbus:/bin/false
>>>> llc[140]$ grep dbus /etc/passwd
>>>> messagebus:x:102:105::/var/run/dbus:/bin/false
>>>>
>>>> This arises in an image extending core-image-base building 
>>>> meta-ti's version of beaglebone.  (I'm actually trying to fix the 
>>>> same problem arising in a patch intended to make sure
>>>> ntp's home directory exists, but the dbus one appears to be the 
>>>> same thing.)
>>>>
>>>> The suggested workaround for opkg of using a pkg_postinst script 
>>>> doesn't work in my case because the rpm post-install script gets 
>>>> run on the build host that's creating rootfs.The
>>>> ownership is wrong in the generated rootfs tar files whether or not 
>>>> there's a post-install script that tries to change it.
>>>>
>>>> For my ntp patch I verified that removing the package and 
>>>> installing it on the target does work as expected.
>>>>
>>>> Does anybody else see this sort of thing?
>>>>
>>>> If not, where in the image packaging code is the magic that's 
>>>> supposed to help pseudo record who's really supposed to own the 
>>>> files and re-apply that when the image packaging is
>>>> done?
>>>
>>> It does not happen in my builds which are more-or-less stock
>>> Poky (I have my own distro and BSP layers).  Must be something
>>> going on in the meta-ti layer?
>>>
>>> Are you using the latest OE-core (or Poky/Yocto) master?
>>
>> Thanks for the sanity check.
>>
>> I'm using master of poky and meta-openembedded, right at the point of 
>> dizzy branch.  The problem is reproduced with a fresh bitbake 
>> core-image-base with these layers:
>>
>> BBLAYERS ?= "\
>>      ${OE_META_SOURCES}/poky/meta \
>>      ${OE_META_SOURCES}/poky/meta-yocto \
>>      ${OE_META_SOURCES}/poky/meta-yocto-bsp \
>>      ${OE_META_SOURCES}/meta-openembedded/meta-filesystems \
>>      ${OE_META_SOURCES}/meta-openembedded/meta-networking \
>>      ${OE_META_SOURCES}/meta-openembedded/meta-oe \
>>      ${OE_META_SOURCES}/meta-openembedded/meta-systemd \
>>      ${OE_META_SOURCES}/meta-openembedded/meta-python \
>>      ${OE_META_SOURCES}/meta-qt3 \
>> "
>>
>> and these customizations options in local.conf:
>>
>> # Default machine
>> MACHINE ?= "beaglebone"
>>
>> # Want to try this distro, but it enables security_flags.inc which
>> # requires recipe changes.
>> #DISTRO = "poky-lsb"
>> # So instead do some of the pieces so we can still use core-image-lsb*
>> DISTRO = "poky"
>> DISTROOVERRIDES = "poky:linuxstdbase"
>> DISTRO_FEATURES_append = " pam largefile"
>>
>> # The future is systemd
>> DISTRO_FEATURES_append = " systemd"
>> VIRTUAL-RUNTIME_init_manager = "systemd"
>> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
>>
>> I did try commenting out the override for poky:linuxstdbase and it 
>> had no effect.  I'll try trimming out more stuff tomorrow.
>
> The other big item is that I use sysvinit, not systemd.

Nope.  Pulled out everything but DISTRO=poky and MACHINE=beaglebone, and 
bitbake core-image-base produces a nice sysvinit image with:

root@beaglebone:~# grep messag /etc/passwd
messagebus:x:997:996::/var/lib/dbus:/bin/false
root@beaglebone:~# ls -l /var/lib
drwxr-xr-x    2 root     root          4096 Oct 12 04:26 alsa
drwxr-xr-x    2 102      105           4096 Oct 12 04:29 dbus
drwxr-xr-x    2 root     root          4096 Oct 12 03:48 misc
drwxr-xr-x    2 root     root          4096 Jan  1  2000 urandom
drwxr-xr-x    3 root     root          4096 Oct 12 04:29 wdj

Interestingly, if pseudo is built --without-passwd-fallback, which 
prevents it from referencing the build host passwd/group files, dbus 
won't install:

DEBUG: Executing shell function useradd_sysroot
Running groupadd commands...
NOTE: Performing groupadd with [--root 
/prj/oe/omap/build-beaglesysv-master/tmp/sysroots/beaglebone -r netdev] 
and 10 times of retry
groupadd: cannot lock /etc/group; try again later.
WARNING: groupadd command did not succeed. Retrying...
groupadd: cannot lock /etc/group; try again later.
...
ERROR: Tried running groupadd command 10 times without scucess, giving up
WARNING: exit code 1 from a shell command.
ERROR: Function failed: useradd_sysroot (log file is located at 
/prj/oe/omap/build-beaglesysv-master/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.2-r0/temp/log.do_install.2960)

which is probably a clue.  Adding Peter Seebach in hopes something here 
rings a bell.

Peter

