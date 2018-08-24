Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD0A78EAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:00:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O20qU7010159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 19:00:52 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 23 Aug 2018 19:00:51 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180802025039.15748-1-hongzhi.song@windriver.com>
	<20180802025039.15748-2-hongzhi.song@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8f98707d-becd-ec40-8f1a-fb03f2114c21@windriver.com>
Date: Thu, 23 Aug 2018 22:00:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180802025039.15748-2-hongzhi.song@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v4 1/3] udev-extraconf/mount.sh: add support to systemd
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
X-List-Received-Date: Fri, 24 Aug 2018 02:00:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit


First, I have a few changes to make the log more clear.

On 08/01/2018 10:50 PM, Hongzhi.Song wrote:
> Udev-extraconf works correctly with sysvinit in the aspect of automounting
> block devices. But it has a serious problem in case of systemd. Block devices
s/. But it/ but it/


> automounted by udev is unaccessible to host space(out of udevd's private
s/is unaccessible/are not accessible/

s/host space(out of udevd's private namespace)/
  /host space(out of udevd's private namespace)/
> namespace). For example, we cannot format those block devices.
> 
> e.g.
>      root@qemux86:~# mkfs.ext4 /dev/sda1
>      mke2fs 1.43.8
>      /dev/sda1 contains a ext4 file system
>      last mounted on Tue Apr
>      Proceed anyway? (y,N) y
>      /dev/sda1 is apparently in use by the system; will not make a filesystem here!
> 
> Other distributions has no such problem, because they use a series of rules to
> manager block devices. Different types of block devices match different rules.
s/manager/manage/
> But udev-extraconf just use one rule, automount.rules, which results in this
s/But udev-extraconf just one rule/
   Note that udev-extraconf has just one file/

> problem.
> 
> The 'systemd-mount' command is recommended by the systemd community to solve such
> problems.
> 
> This patch makes use of 'systemd-mount' to solve the above problem.

Replace the two sentences above with:

As recommended by members of the systemd community, use the
'systemd-mount' command to resolve this problem since it's
intended purpose is to establish (and destroy) transient mount
or auto-mount points using the service manager job queue thereby
eliminating dependencies loops.


I wouldn't normally be so picky but changes to systemd should
be very clear since it's widely used.


Also, it would be good to explain, near the start of your log,
how you are able to reproduce these this defect.
If this is a regression identify where the problem was introduced.


systemd-mount was introduced in systemd-232:
    450442cf93
       add a new tool for creating transient mount and automount units

$ git tag --contains 450442cf93
v232
v233
v234
...

so it's puzzling that we're only getting around to such a change now.
Hopefully your use case will explain that.


> 
> [YOCTO #12644]
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta/recipes-core/udev/udev-extraconf/mount.sh | 55 +++++++++++++++++++++++---
>   1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index d760328a09..3a72c455e0 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -4,10 +4,26 @@
>   #
>   # Attempt to mount any added block devices and umount any removed devices >
> +BASE_INIT="`readlink "/sbin/init"`"
> +INIT_SYSTEMD="/lib/systemd/systemd"
> +
> +if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
> +        MOUNT="/usr/bin/systemd-mount"
> +        UMOUNT="/usr/bin/systemd-umount"
> +
> +        if [ -x $MOUNT ] && [ -x $UMOUNT ];
> +        then
> +                logger "Using systemd-mount to finish mount"
Should we be verbose on success?
Do other distros do this?
If not, you could leave the command as a comment for manual debugging,
if you think it's likely to be useful.

> +        else
> +                logger "Linux init is using systemd, so please install systemd-mount to finish mount"

Since systemd-[u]mount is part of the core systemd package,
    packages-split/systemd/usr/bin/systemd-mount
    packages-split/systemd/usr/bin/systemd-umount
this is only possible if we have filesystem corruption.
Best to say so:
    logger "/sbin/init is systemd but /usr/bin/systemd-mount not found."
    logger "Install systemd-mount to be able to mount all filesystems"


Since this will likely never happen, it's tempting to deal with
both systemd-mount and systemd-umount as a group but if by some
strange user error, systemd-umount was removed but systemd-mount
was still present, then we could enable the user to mount the image.
I'm not sure if that's wise since there could be corruption caused
by later failing to umount. It's probably best to require both but
maybe someone has a different point of view.


> +        fi
> +else
> +        MOUNT="/bin/mount"
> +        UMOUNT="/bin/umount"
> +fi
>   
> -MOUNT="/bin/mount"
>   PMOUNT="/usr/bin/pmount"
> -UMOUNT="/bin/umount"
> +
>   for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
>   do
>   	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
> @@ -17,6 +33,33 @@ do
>   	fi
>   done
>   
> +automount_systemd() {
> +	name="`basename "$DEVNAME"`"
> +
> +        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
> +        # Silent util-linux's version of mounting auto
> +        MOUNT="$MOUNT -o silent"
> +
> +        # If filesystem type is vfat, change the ownership group to 'disk', and
> +        # grant it with  w/r/x permissions.
> +        case $ID_FS_TYPE in
> +        vfat|fat)
> +                MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
> +                ;;
> +        # TODO

TODO?
How about
            # All other filesystem types fall though
If you are going to leave the TODO in,
outline what remains to be done in the log.

> +        *)
> +                ;;
> +        esac
> +
> +        if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
> +        then
> +                rm_dir "/run/media/$name"
> +        else
> +                logger "mount.sh/automount" "systemd-mount of [/run/media/$name] successful"
Do you need a space:
                    logger "mount.sh/automount "
to fix the format when the two strings are printed?

Again, are other distros so verbose?
I guess this log could be useful since it is specific:
     [/run/media/$name]
I don't really like the square brackets because I'm darn picky
but if that's in keeping with other systemd/udev-extraconf code,
you can keep it.

There's a long history of unix being quite terse when
there are no errors.

> +                touch "/tmp/.automount-$name"
> +        fi
> +}
> +
>   automount() {	
>   	name="`basename "$DEVNAME"`"
>   
> @@ -61,19 +104,21 @@ rm_dir() {
>   # No ID_FS_TYPE for cdrom device, yet it should be mounted
>   name="`basename "$DEVNAME"`"
>   [ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
> -
>   if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
>   	if [ -x "$PMOUNT" ]; then
>   		$PMOUNT $DEVNAME 2> /dev/null
>   	elif [ -x $MOUNT ]; then
>       		$MOUNT $DEVNAME 2> /dev/null
>   	fi
> -	
>   	# If the device isn't mounted at this point, it isn't
>   	# configured in fstab (note the root filesystem can show up as
>   	# /dev/root in /proc/mounts, so check the device number too)
>   	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
> -		grep -q "^$DEVNAME " /proc/mounts || automount
> +		if [ "`basename $MOUNT`" = "systemd-mount" ];then
> +			grep -q "^$DEVNAME " /proc/mounts || automount_systemd
> +		else
> +			grep -q "^$DEVNAME " /proc/mounts || automount
> +		fi
>   	fi
>   fi
>   
> 


I hope this review helps.
I suspect it was sitting on the list unprocessed in part because
the motivation for the change was not clear.

I don't have time to look at the other two commits tonight.
I can to that tomorrow if you like or you can work with a co-worker
to revise those changes along the lines of the comments I've
made here and send a v5.

-- 
# Randy MacLeod
# Wind River Linux

