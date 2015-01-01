Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id DE5A6601F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 19:21:15 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id A70228E49D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 20:21:14 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 20:21:14 +0100 (CET)
Message-ID: <54A59E2A.7020505@topic.nl>
Date: Thu, 01 Jan 2015 20:21:14 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>	<1418912251-3313-1-git-send-email-mike.looijmans@topic.nl>	<1418912251-3313-5-git-send-email-mike.looijmans@topic.nl>	<AD47BDE1-4736-43B8-B901-ACDCFAD1665B@gmail.com>	<54A50E3A.5010707@topic.nl>
	<54A546C0.8040101@pabigot.com>
In-Reply-To: <54A546C0.8040101@pabigot.com>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Subject: Re: [PATCH v2 4/4] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Thu, 01 Jan 2015 19:21:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 1-1-2015 14:08, Peter A. Bigot wrote:
> On 01/01/2015 03:07 AM, Mike Looijmans wrote:
>> On 01/01/2015 03:49 AM, Khem Raj wrote:
>>>
>>>> On Dec 18, 2014, at 6:17 AM, Mike Looijmans
>>>> <mike.looijmans@topic.nl> wrote:
>>>>
>>>> Upon inserting a USB stick or similar device, mdev will run
>>>> an automounter script that mounts valid partitions on
>>>> /media/<device>. The script first checks /etc/fstab entries
>>>> so that mounting on UUID or LABEL or using custom mount options
>>>> is still possible. If /etc/fstab does not contain particular
>>>> mount options, the script will create (and remove) the mountpoint
>>>> automatically.
>>>> The script also supports full disk partitions (devices without
>>>> partition table).
>>>>
>>>> The following environments can be set in /etc/default/mdev:
>>>> MDEV_AUTOMOUNT=n (Disables automounting completely)
>>>> MDEV_AUTOMOUNT_ROOT=/media (Change the mount root location)
>>>>
>>>> Automatic mounting for a particular device can be disabled by
>>>> creating a file "/dev/<device>.nomount". This is helpful in
>>>> scripts that create partitions for example, and want to perform
>>>> specific actions which require the device to remain unmounted.
>>>>
>>>> A more complex variation (using LABEL based mounts) on this script
>>>> has been in use in OpenPLi for many years now, and I've used this
>>>> one on many projects already, so it's about time to push this to
>>>> mainline.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>> meta/recipes-core/busybox/busybox.inc         |    1 +
>>>> meta/recipes-core/busybox/busybox_1.22.1.bb   |    1 +
>>>> meta/recipes-core/busybox/busybox_git.bb      |    1 +
>>>> meta/recipes-core/busybox/files/mdev-mount.sh |   63
>>>> +++++++++++++++++++++++++
>>>> meta/recipes-core/busybox/files/mdev.conf     |    3 ++
>>>> 5 files changed, 69 insertions(+)
>>>> create mode 100644 meta/recipes-core/busybox/files/mdev-mount.sh
>>>>
>>>> diff --git a/meta/recipes-core/busybox/busybox.inc
>>>> b/meta/recipes-core/busybox/busybox.inc
>>>> index deb2ee4..0769d92 100644
>>>> --- a/meta/recipes-core/busybox/busybox.inc
>>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>>> @@ -270,6 +270,7 @@ do_install () {
>>>>                         install -m 644 ${WORKDIR}/mdev.conf
>>>> ${D}${sysconfdir}/mdev.conf
>>>>                         install -d ${D}${sysconfdir}/mdev
>>>>                         install -m 0755
>>>> ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
>>>> +                       install -m 0755 ${WORKDIR}/mdev-mount.sh
>>>> ${D}${sysconfdir}/mdev
>>>>                 fi
>>>>     fi
>>>>
>>>> diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb
>>>> b/meta/recipes-core/busybox/busybox_1.22.1.bb
>>>> index 82f7f68..f379bb6 100644
>>>> --- a/meta/recipes-core/busybox/busybox_1.22.1.bb
>>>> +++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
>>>> @@ -20,6 +20,7 @@ SRC_URI =
>>>> "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>>>             file://busybox-syslog.default \
>>>>             file://mdev \
>>>>             file://mdev.conf \
>>>> +           file://mdev-mount.sh \
>>>>             file://umount.busybox \
>>>>             file://defconfig \
>>>>             file://busybox-syslog.service.in \
>>>> diff --git a/meta/recipes-core/busybox/busybox_git.bb
>>>> b/meta/recipes-core/busybox/busybox_git.bb
>>>> index f2cc119..f91b552 100644
>>>> --- a/meta/recipes-core/busybox/busybox_git.bb
>>>> +++ b/meta/recipes-core/busybox/busybox_git.bb
>>>> @@ -24,6 +24,7 @@ SRC_URI = "git://busybox.net/busybox.git \
>>>>             file://busybox-syslog.default \
>>>>             file://mdev \
>>>>             file://mdev.conf \
>>>> +           file://mdev-mount.sh \
>>>>             file://umount.busybox \
>>>>             file://defconfig \
>>>>             file://busybox-syslog.service.in \
>>>> diff --git a/meta/recipes-core/busybox/files/mdev-mount.sh
>>>> b/meta/recipes-core/busybox/files/mdev-mount.sh
>>>> new file mode 100644
>>>> index 0000000..d5d66d6
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/busybox/files/mdev-mount.sh
>>>> @@ -0,0 +1,63 @@
>>>> +#!/bin/sh
>>>> +MDEV_AUTOMOUNT=y
>>>> +MDEV_AUTOMOUNT_ROOT=/run/media
>>>> +[ -f /etc/default/mdev ] && . /etc/default/mdev
>>>> +if [ "${MDEV_AUTOMOUNT}" = "n" ] ; then
>>>> +    exit 0
>>>> +fi
>>>> +
>>>> +case "$ACTION" in
>>>> +    add|"")
>>>> +        ACTION="add"
>>>> +        # check if already mounted
>>>> +        if grep -q "^/dev/${MDEV} " /proc/mounts ; then
>>>> +            # Already mounted
>>>> +            exit 0
>>>> +        fi
>>>> +        DEVBASE=`expr substr $MDEV 1 3`
>>>> +        if [ "${DEVBASE}" == "mmc" ] ; then
>>>> +            DEVBASE=`expr substr $MDEV 1 7`
>>>> +        fi
>>>> +        # check for "please don't mount it" file
>>>> +        if [ -f "/dev/nomount.${DEVBASE}" ] ; then
>>>> +            # blocked
>>>> +            exit 0
>>>> +        fi
>>>> +        # check for full-disk partition
>>>> +        if [ "${DEVBASE}" == "${MDEV}" ] ; then
>>>
>>> bashism, get rid of it.
>>
>> please explain?
>
>  From
> http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html:
>
>
>
> string1 == string2
> string1 = string2
>
>      True if the strings are equal. ‘=’ should be used with the test
> command for POSIX conformance.

Ah, okay. I'll change s/==/=/g in the script, and submit a new version.


>
>>
>>>
>>>> +            if [ -d /sys/block/${DEVBASE}/${DEVBASE}*1 ] ; then
>>>> +                # Partition detected, just quit
>>>> +                exit 0
>>>> +            fi
>>>> +            if [ ! -f /sys/block/${DEVBASE}/size ] ; then
>>>> +                # No size at all
>>>> +                exit 0
>>>> +            fi
>>>> +            if [ `cat /sys/block/${DEVBASE}/size` == 0 ] ; then
>>>> +                # empty device, bail out
>>>> +                exit 0
>>>> +            fi
>>>> +        fi
>>>> +        # first allow fstab to determine the mountpoint
>>>> +        if ! mount /dev/$MDEV > /dev/null 2>&1
>>>> +        then
>>>> +            MOUNTPOINT="${MDEV_AUTOMOUNT_ROOT}/$MDEV"
>>>> +            mkdir "$MOUNTPOINT"
>>>> +            mount -t auto /dev/$MDEV "$MOUNTPOINT"
>>>> +        fi
>>>> +        ;;
>>>> +    remove)
>>>> +        MOUNTPOINT=`grep "^/dev/$MDEV\s" /proc/mounts | cut -d' '
>>>> -f 2`
>>>> +        if [ ! -z "$MOUNTPOINT" ]
>>>> +        then
>>>> +            umount "$MOUNTPOINT"
>>>> +            rmdir "$MOUNTPOINT"
>>>> +        else
>>>> +            umount /dev/$MDEV
>>>> +        fi
>>>> +        ;;
>>>> +    *)
>>>> +        # Unexpected keyword
>>>> +        exit 1
>>>> +        ;;
>>>> +esac
>>>> diff --git a/meta/recipes-core/busybox/files/mdev.conf
>>>> b/meta/recipes-core/busybox/files/mdev.conf
>>>> index 6dfd161..17e93da 100644
>>>> --- a/meta/recipes-core/busybox/files/mdev.conf
>>>> +++ b/meta/recipes-core/busybox/files/mdev.conf
>>>> @@ -37,3 +37,6 @@ input/mice 0:0 0660
>>>> input/mouse.* 0:0 0660
>>>>
>>>> tun[0-9]* 0:0 0660 =net/
>>>> +
>>>> +[hs]d[a-z][0-9]? 0:0 660 */etc/mdev/mdev-mount.sh
>>>> +mmcblk[0-9].* 0:0 660 */etc/mdev/mdev-mount.sh
>>>> --
>>>> 1.7.9.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>


-- 
Mike Looijmans

