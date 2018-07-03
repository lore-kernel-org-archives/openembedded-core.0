Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18F3A6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 03:39:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w633cwjB010356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2018 20:38:58 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 2 Jul 2018 20:38:57 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1523948623-176242-1-git-send-email-hongzhi.song@windriver.com>
	<8f1e2332-a625-7720-c5dc-0f0e6d9a5d27@windriver.com>
	<14818289-63c3-8bdf-00fa-1dbd73449053@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <87690252-b0e8-5b82-e56f-98dad4dd3658@windriver.com>
Date: Tue, 3 Jul 2018 11:40:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <14818289-63c3-8bdf-00fa-1dbd73449053@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [PATCH v3] udev-extraconf: Add systemd-mount to udev-extraconf/mount.sh
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
X-List-Received-Date: Tue, 03 Jul 2018 03:39:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping.

The patch fixes the real problem. Please review it.

//Hongzhi


On 2018年04月24日 04:20, Randy MacLeod wrote:
> On 2018-04-22 11:37 PM, Hongzhi, Song wrote:
>> ping
>
> Please be patient.
>
> 0e-core-2.5 rc1 is being tested now and only critical blocking fixes 
> are being accepted.
>
> Once the results of 2.5 tests are good, then commits such as this one
> can be added to the master[-next] branch and then later cherry-picked 
> back to 2.5.1
> if needed.
>
> Give people a few days (or more if things don't go well) to get 2.5 
> out the door.
>
> ../Randy
>
>>
>> // Hongzhi
>>
>>
>> On 2018年04月17日 15:03, Hongzhi.Song wrote:
>>> Udev-extraconf works correctly with sysvinit in the aspect of 
>>> automounting
>>> block devices. But it has a serious problem in case of systemd. 
>>> Block devices
>>> automounted by udev is unaccessible to host space(out of udevd's 
>>> private
>>> namespace). For example, we cannot format those block devices.
>>>
>>> e.g.
>>>      root@qemux86:~# mkfs.ext4 /dev/sda1
>>>      mke2fs 1.43.8 (1-Jan-2018)
>>>      /dev/sda1 contains a ext4 file system
>>>      last mounted on Tue Apr  3 06:22:41 2018
>>>      Proceed anyway? (y,N) y
>>>      /dev/sda1 is apparently in use by the system; will not make a 
>>> filesystem here!
>>>
>>> Other distributions has no such problem, because they use a series 
>>> of rules to
>>> manager block devices. Different types of block devices match 
>>> different rules.
>>> But udev-extraconf just use one rule, automount.rules, which results 
>>> in this
>>> problem.
>>>
>>> The 'systemd-mount' command is recommended by the systemd community 
>>> to solve such
>>> problems.
>>>
>>> This patch makes use of 'systemd-mount' to solve the above problem.
>>>
>>> [YOCTO #12644]
>>>
>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> ---
>>>   meta/recipes-core/udev/udev-extraconf/mount.sh | 83 
>>> ++++++++++++++++++++------
>>>   meta/recipes-core/udev/udev-extraconf_1.1.bb   |  3 +
>>>   2 files changed, 69 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh 
>>> b/meta/recipes-core/udev/udev-extraconf/mount.sh
>>> index d760328..067d4e2 100644
>>> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
>>> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
>>> @@ -4,10 +4,28 @@
>>>   #
>>>   # Attempt to mount any added block devices and umount any removed 
>>> devices
>>>   +BASE_INIT="`readlink "@base_sbindir@/init"`"
>>> +INIT_SYSTEMD="@systemd_unitdir@/systemd"
>>> +
>>> +if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
>>> +    # systemd as init uses systemd-mount to mount block devices
>>> +    MOUNT="/usr/bin/systemd-mount"
>>> +    UMOUNT="/usr/bin/systemd-umount"
>>> +
>>> +    if [ -x $MOUNT ] && [ -x $UMOUNT ];
>>> +    then
>>> +        logger "Using systemd-mount to finish mount"
>>> +    else
>>> +        logger "Linux init is using systemd, so please install 
>>> systemd-mount to finish mount"
>>> +        exit 1
>>> +    fi
>>> +else
>>> +    MOUNT="/bin/mount"
>>> +    UMOUNT="/bin/umount"
>>> +fi
>>>   -MOUNT="/bin/mount"
>>>   PMOUNT="/usr/bin/pmount"
>>> -UMOUNT="/bin/umount"
>>> +
>>>   for line in `grep -h -v ^# /etc/udev/mount.blacklist 
>>> /etc/udev/mount.blacklist.d/*`
>>>   do
>>>       if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
>>> @@ -17,7 +35,35 @@ do
>>>       fi
>>>   done
>>>   -automount() {
>>> +automount_systemd() {
>>> +    name="`basename "$DEVNAME"`"
>>> +
>>> +    [ -d "/run/media/$name" ] || mkdir -p "/run/media/$name"
>>> +
>>> +    MOUNT="$MOUNT -o silent"
>>> +
>>> +    # If filesystemtype is vfat, change the ownership group to 
>>> 'disk', and
>>> +    # grant it with  w/r/x permissions.
>>> +    case $ID_FS_TYPE in
>>> +    vfat|fat)
>>> +        MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print 
>>> $3}' /etc/group`"
>>> +        ;;
>>> +    # TODO
>>> +    *)
>>> +        ;;
>>> +    esac
>>> +
>>> +    if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
>>> +    then
>>> +        #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME 
>>> \"/run/media/$name\" failed!"
>>> +        rm_dir "/run/media/$name"
>>> +    else
>>> +        logger "mount.sh/automount" "Auto-mount of 
>>> [/run/media/$name] successful"
>>> +        touch "/tmp/.automount-$name"
>>> +    fi
>>> +}
>>> +
>>> +automount() {
>>>       name="`basename "$DEVNAME"`"
>>>         ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
>>> @@ -26,7 +72,7 @@ automount() {
>>>       then
>>>           MOUNT="$MOUNT -o silent"
>>>       fi
>>> -
>>> +
>>>       # If filesystem type is vfat, change the ownership group to 
>>> 'disk', and
>>>       # grant it with  w/r/x permissions.
>>>       case $ID_FS_TYPE in
>>> @@ -68,23 +114,26 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] 
>>> && [ -n "$ID_FS_TYPE" -o "$media_t
>>>       elif [ -x $MOUNT ]; then
>>>               $MOUNT $DEVNAME 2> /dev/null
>>>       fi
>>> -
>>> +
>>>       # If the device isn't mounted at this point, it isn't
>>>       # configured in fstab (note the root filesystem can show up as
>>>       # /dev/root in /proc/mounts, so check the device number too)
>>> -    if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
>>> -        grep -q "^$DEVNAME " /proc/mounts || automount
>>> -    fi
>>> +    if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
>>> +        if [ "`basename $MOUNT`" = "systemd-mount" ];then
>>> +            grep -q "^$DEVNAME " /proc/mounts || automount_systemd
>>> +        else
>>> +            grep -q "^$DEVNAME " /proc/mounts || automount
>>> +        fi
>>> +    fi
>>>   fi
>>>   -
>>>   if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x 
>>> "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>>> -    for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>>> -    do
>>> -        $UMOUNT $mnt
>>> -    done
>>> -
>>> -    # Remove empty directories from auto-mounter
>>> -    name="`basename "$DEVNAME"`"
>>> -    test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
>>> +    for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>>> +    do
>>> +        $UMOUNT $mnt
>>> +    done
>>> +
>>> +    # Remove empty directories from auto-mounter
>>> +    name="`basename "$DEVNAME"`"
>>> +    test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
>>>   fi
>>> diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb 
>>> b/meta/recipes-core/udev/udev-extraconf_1.1.bb
>>> index 43a1cff..90f933d 100644
>>> --- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
>>> +++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
>>> @@ -29,6 +29,9 @@ do_install() {
>>>       install -d ${D}${sysconfdir}/udev/scripts/
>>>         install -m 0755 ${WORKDIR}/mount.sh 
>>> ${D}${sysconfdir}/udev/scripts/mount.sh
>>> +    sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' 
>>> ${D}${sysconfdir}/udev/scripts/mount.sh
>>> +    sed -i 's|@base_sbindir@|${base_sbindir}|g' 
>>> ${D}${sysconfdir}/udev/scripts/mount.sh
>>> +
>>>       install -m 0755 ${WORKDIR}/network.sh 
>>> ${D}${sysconfdir}/udev/scripts
>>>   }
>>
>


