Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8720774549
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 01:45:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3C1jXMB010123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Apr 2018 18:45:34 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 11 Apr 2018 18:45:32 -0700
To: Christopher Larson <kergoth@gmail.com>
References: <1523258914-12621-1-git-send-email-hongzhi.song@windriver.com>
	<CABcZAN==MwWu8GeuhRJC9vbQsk+7G7eHnuG7prp1wFRDY9JqRg@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <b6eca84c-e649-a678-d80f-dd53fff6823d@windriver.com>
Date: Thu, 12 Apr 2018 09:47:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN==MwWu8GeuhRJC9vbQsk+7G7eHnuG7prp1wFRDY9JqRg@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev-extraconf: Add systemd-mount to mount.sh
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
X-List-Received-Date: Thu, 12 Apr 2018 01:45:37 -0000
Content-Type: multipart/alternative;
	boundary="------------240BE18608E3AF900A68E146"
Content-Language: en-US

--------------240BE18608E3AF900A68E146
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

I am very sorry, this is my fault. My original idea is to modify 
udev-extraconf/mount.sh.

And I will remake a patch.

Sorry again. Please ignore this patch.



On 2018年04月12日 09:35, Christopher Larson wrote:
> Why are you adding a new mount.sh at meta/recipes-core/udev/mount.sh 
> rather than updating the existing one 
> at meta/recipes-core/udev/udev-extraconf/mount.sh?
>
> On Mon, Apr 9, 2018 at 12:28 AM, Hongzhi.Song 
> <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
>
>     This patch fixs the problem that block devices unable to be
>     formatted when
>     systemd and udev-extraconf recipes added into rootfs.
>
>     If we add systemd and udev-extraconf recipes into rootfs:
>         VIRTUAL-RUNTIME_init_manager = "systemd"
>         DISTRO_FEATURES_append = " systemd"
>         DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>         KERNEL_FEATURES_append = " cfg/systemd.scc"
>         IMAGE_INSTALL_append = " udev-extraconf"
>         IMAGE_FSTYPES += "tar.bz2 ext4"
>         IMAGE_INSTALL_append = " e2fsprogs-mke2fs"
>     then systemd-udevd.service will invoke udev rules to automount
>     block devices
>     any probed under itself private namespace, this behavior results
>     in host space
>     can't format those devices. And host space can't find where the
>     device is used.
>     Such as:
>         root@qemux86:~# mkfs.ext4 /dev/sda1
>         mke2fs 1.43.8 (1-Jan-2018)
>         /dev/sda1 contains a ext4 file system
>                 last mounted on Tue Apr  3 06:22:41 2018
>         Proceed anyway? (y,N) y
>         /dev/sda1 is apparently in use by the system; will not make a
>     filesystem here!
>
>     Command systemd-mount recommended by systemd maintainer instead of
>     command mount
>     will fix the problem brought with private namespace. Systemd-mount
>     request the
>     mount operation to be executed by PID 1, and hence host space can
>     access the block
>     devices.
>
>     [YOCTO #12644]
>
>     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>     <mailto:hongzhi.song@windriver.com>>
>     ---
>      meta/recipes-core/udev/mount.sh | 141
>     ++++++++++++++++++++++++++++++++++++++++
>      1 file changed, 141 insertions(+)
>      create mode 100644 meta/recipes-core/udev/mount.sh
>
>     diff --git a/meta/recipes-core/udev/mount.sh
>     b/meta/recipes-core/udev/mount.sh
>     new file mode 100644
>     index 0000000..2fa2925
>     --- /dev/null
>     +++ b/meta/recipes-core/udev/mount.sh
>     @@ -0,0 +1,141 @@
>     +#!/bin/sh
>     +#
>     +# Called from udev
>     +#
>     +# Attempt to mount any added block devices and umount any removed
>     devices
>     +
>     +
>     +BASE_INIT="`readlink "/sbin/init"`"
>     +INIT_SYSTEMD="/lib/systemd/systemd"
>     +
>     +if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
>     +       # systemd as init uses systemd-mount to mount block devices
>     +        MOUNT="/usr/bin/systemd-mount"
>     +        UMOUNT="/usr/bin/systemd-umount"
>     +
>     +        if [ -x $MOUNT ] && [ -x $UMOUNT ];
>     +        then
>     +                logger "Using systemd-mount to finish mount"
>     +        else
>     +                logger "Linux init is using systemd, so please
>     install systemd-mount to finish mount"
>     +               exit 1
>     +        fi
>     +else
>     +        MOUNT="/bin/mount"
>     +        UMOUNT="/bin/umount"
>     +fi
>     +
>     +PMOUNT="/usr/bin/pmount"
>     +
>     +for line in `grep -h -v ^# /etc/udev/mount.blacklist
>     /etc/udev/mount.blacklist.d/*`
>     +do
>     +       if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
>     +       then
>     +               logger "udev/mount.sh" "[$DEVNAME] is blacklisted,
>     ignoring"
>     +               exit 0
>     +       fi
>     +done
>     +
>     +automount_systemd() {
>     +        name="`basename "$DEVNAME"`"
>     +
>     +        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
>     +
>     +        MOUNT="$MOUNT -o silent"
>     +
>     +        # If filesystemtype is vfat, change the ownership group
>     to 'disk', and
>     +        # grant it with  w/r/x permissions.
>     +        case $ID_FS_TYPE in
>     +        vfat|fat)
>     +                MOUNT="$MOUNT -o umask=007,gid=`awk -F':'
>     '/^disk/{print $3}' /etc/group`"
>     +                ;;
>     +        # TODO
>     +        *)
>     +                ;;
>     +        esac
>     +
>     +        if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
>     +        then
>     +                #logger "mount.sh/automount
>     <http://mount.sh/automount>" "$MOUNT -t auto $DEVNAME
>     \"/run/media/$name\" failed!"
>     +                rm_dir "/run/media/$name"
>     +        else
>     +                logger "mount.sh/automount
>     <http://mount.sh/automount>" "Auto-mount of [/run/media/$name]
>     successful"
>     +                touch "/tmp/.automount-$name"
>     +        fi
>     +}
>     +
>     +automount() {
>     +       name="`basename "$DEVNAME"`"
>     +
>     +       ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
>     +       # Silent util-linux's version of mounting auto
>     +       if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
>     +       then
>     +               MOUNT="$MOUNT -o silent"
>     +       fi
>     +
>     +       # If filesystem type is vfat, change the ownership group
>     to 'disk', and
>     +       # grant it with  w/r/x permissions.
>     +       case $ID_FS_TYPE in
>     +       vfat|fat)
>     +               MOUNT="$MOUNT -o umask=007,gid=`awk -F':'
>     '/^disk/{print $3}' /etc/group`"
>     +               ;;
>     +       # TODO
>     +       *)
>     +               ;;
>     +       esac
>     +
>     +       if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
>     +       then
>     +               #logger "mount.sh/automount
>     <http://mount.sh/automount>" "$MOUNT -t auto $DEVNAME
>     \"/run/media/$name\" failed!"
>     +               rm_dir "/run/media/$name"
>     +       else
>     +               logger "mount.sh/automount
>     <http://mount.sh/automount>" "Auto-mount of [/run/media/$name]
>     successful"
>     +               touch "/tmp/.automount-$name"
>     +       fi
>     +}
>     +
>     +rm_dir() {
>     +       # We do not want to rm -r populated directories
>     +       if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
>     +       then
>     +               ! test -z "$1" && rm -r "$1"
>     +       else
>     +               logger "mount.sh/automount
>     <http://mount.sh/automount>" "Not removing non-empty directory [$1]"
>     +       fi
>     +}
>     +
>     +# No ID_FS_TYPE for cdrom device, yet it should be mounted
>     +name="`basename "$DEVNAME"`"
>     +[ -e /sys/block/$name/device/media ] && media_type=`cat
>     /sys/block/$name/device/media`
>     +
>     +if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n
>     "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
>     +       if [ -x "$PMOUNT" ]; then
>     +               $PMOUNT $DEVNAME 2> /dev/null
>     +       elif [ -x $MOUNT ]; then
>     +               $MOUNT $DEVNAME 2> /dev/null
>     +       fi
>     +
>     +       # If the device isn't mounted at this point, it isn't
>     +       # configured in fstab (note the root filesystem can show up as
>     +       # /dev/root in /proc/mounts, so check the device number too)
>     +        if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
>     +                if [ "`basename $MOUNT`" = "systemd-mount" ];then
>     +                        grep -q "^$DEVNAME " /proc/mounts ||
>     automount_systemd
>     +                else
>     +                        grep -q "^$DEVNAME " /proc/mounts ||
>     automount
>     +                fi
>     +        fi
>     +fi
>     +
>     +
>     +if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x
>     "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>     +       for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2
>     -d " " `
>     +       do
>     +               $UMOUNT $mnt
>     +       done
>     +
>     +       # Remove empty directories from auto-mounter
>     +       name="`basename "$DEVNAME"`"
>     +       test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
>     +fi
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


--------------240BE18608E3AF900A68E146
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I am very sorry, this is my fault. My original idea is to modify
      udev-extraconf/mount.sh. <br>
    </p>
    <p>And I will remake a patch.</p>
    <p>Sorry again. Please ignore this patch.<br>
    </p>
    <p><span style="color: rgb(255, 255, 255); font-family: Arial,
        &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti,
        &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;,
        sans-serif; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: nowrap; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(67, 149,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><br>
      </span></p>
    <br>
    <div class="moz-cite-prefix">On 2018年04月12日 09:35, Christopher
      Larson wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABcZAN==MwWu8GeuhRJC9vbQsk+7G7eHnuG7prp1wFRDY9JqRg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Why are you adding a new mount.sh at <span
          style="font-size:12.800000190734863px">meta/recipes-core/udev/mount.</span><wbr
          style="font-size:12.800000190734863px"><span
          style="font-size:12.800000190734863px">sh </span>rather than
        updating the existing one
        at meta/recipes-core/udev/udev-extraconf/mount.sh?</div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Mon, Apr 9, 2018 at 12:28 AM,
          Hongzhi.Song <span dir="ltr">&lt;<a
              href="mailto:hongzhi.song@windriver.com" target="_blank"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch
            fixs the problem that block devices unable to be formatted
            when<br>
            systemd and udev-extraconf recipes added into rootfs.<br>
            <br>
            If we add systemd and udev-extraconf recipes into rootfs:<br>
                VIRTUAL-RUNTIME_init_manager = "systemd"<br>
                DISTRO_FEATURES_append = " systemd"<br>
                DISTRO_FEATURES_BACKFILL_<wbr>CONSIDERED += "sysvinit"<br>
                KERNEL_FEATURES_append = " cfg/systemd.scc"<br>
                IMAGE_INSTALL_append = " udev-extraconf"<br>
                IMAGE_FSTYPES += "tar.bz2 ext4"<br>
                IMAGE_INSTALL_append = " e2fsprogs-mke2fs"<br>
            then systemd-udevd.service will invoke udev rules to
            automount block devices<br>
            any probed under itself private namespace, this behavior
            results in host space<br>
            can't format those devices. And host space can't find where
            the device is used.<br>
            Such as:<br>
                root@qemux86:~# mkfs.ext4 /dev/sda1<br>
                mke2fs 1.43.8 (1-Jan-2018)<br>
                /dev/sda1 contains a ext4 file system<br>
                        last mounted on Tue Apr  3 06:22:41 2018<br>
                Proceed anyway? (y,N) y<br>
                /dev/sda1 is apparently in use by the system; will not
            make a filesystem here!<br>
            <br>
            Command systemd-mount recommended by systemd maintainer
            instead of command mount<br>
            will fix the problem brought with private namespace.
            Systemd-mount request the<br>
            mount operation to be executed by PID 1, and hence host
            space can access the block<br>
            devices.<br>
            <br>
            [YOCTO #12644]<br>
            <br>
            Signed-off-by: Hongzhi.Song &lt;<a
              href="mailto:hongzhi.song@windriver.com"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-core/udev/mount.<wbr>sh | 141
            ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
             1 file changed, 141 insertions(+)<br>
             create mode 100644 meta/recipes-core/udev/mount.<wbr>sh<br>
            <br>
            diff --git a/meta/recipes-core/udev/<wbr>mount.sh
            b/meta/recipes-core/udev/<wbr>mount.sh<br>
            new file mode 100644<br>
            index 0000000..2fa2925<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/udev/<wbr>mount.sh<br>
            @@ -0,0 +1,141 @@<br>
            +#!/bin/sh<br>
            +#<br>
            +# Called from udev<br>
            +#<br>
            +# Attempt to mount any added block devices and umount any
            removed devices<br>
            +<br>
            +<br>
            +BASE_INIT="`readlink "/sbin/init"`"<br>
            +INIT_SYSTEMD="/lib/systemd/<wbr>systemd"<br>
            +<br>
            +if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then<br>
            +       # systemd as init uses systemd-mount to mount block
            devices<br>
            +        MOUNT="/usr/bin/systemd-mount"<br>
            +        UMOUNT="/usr/bin/systemd-<wbr>umount"<br>
            +<br>
            +        if [ -x $MOUNT ] &amp;&amp; [ -x $UMOUNT ];<br>
            +        then<br>
            +                logger "Using systemd-mount to finish
            mount"<br>
            +        else<br>
            +                logger "Linux init is using systemd, so
            please install systemd-mount to finish mount"<br>
            +               exit 1<br>
            +        fi<br>
            +else<br>
            +        MOUNT="/bin/mount"<br>
            +        UMOUNT="/bin/umount"<br>
            +fi<br>
            +<br>
            +PMOUNT="/usr/bin/pmount"<br>
            +<br>
            +for line in `grep -h -v ^# /etc/udev/mount.blacklist
            /etc/udev/mount.blacklist.d/*`<br>
            +do<br>
            +       if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];<br>
            +       then<br>
            +               logger "udev/mount.sh" "[$DEVNAME] is
            blacklisted, ignoring"<br>
            +               exit 0<br>
            +       fi<br>
            +done<br>
            +<br>
            +automount_systemd() {<br>
            +        name="`basename "$DEVNAME"`"<br>
            +<br>
            +        ! test -d "/run/media/$name" &amp;&amp; mkdir -p
            "/run/media/$name"<br>
            +<br>
            +        MOUNT="$MOUNT -o silent"<br>
            +<br>
            +        # If filesystemtype is vfat, change the ownership
            group to 'disk', and<br>
            +        # grant it with  w/r/x permissions.<br>
            +        case $ID_FS_TYPE in<br>
            +        vfat|fat)<br>
            +                MOUNT="$MOUNT -o umask=007,gid=`awk -F':'
            '/^disk/{print $3}' /etc/group`"<br>
            +                ;;<br>
            +        # TODO<br>
            +        *)<br>
            +                ;;<br>
            +        esac<br>
            +<br>
            +        if ! $MOUNT --no-block -t auto $DEVNAME
            "/run/media/$name"<br>
            +        then<br>
            +                #logger "<a
              href="http://mount.sh/automount" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mount.sh/automount</a>"
            "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"<br>
            +                rm_dir "/run/media/$name"<br>
            +        else<br>
            +                logger "<a href="http://mount.sh/automount"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mount.sh/automount</a>"
            "Auto-mount of [/run/media/$name] successful"<br>
            +                touch "/tmp/.automount-$name"<br>
            +        fi<br>
            +}<br>
            +<br>
            +automount() {<br>
            +       name="`basename "$DEVNAME"`"<br>
            +<br>
            +       ! test -d "/run/media/$name" &amp;&amp; mkdir -p
            "/run/media/$name"<br>
            +       # Silent util-linux's version of mounting auto<br>
            +       if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux"
            ] ;<br>
            +       then<br>
            +               MOUNT="$MOUNT -o silent"<br>
            +       fi<br>
            +<br>
            +       # If filesystem type is vfat, change the ownership
            group to 'disk', and<br>
            +       # grant it with  w/r/x permissions.<br>
            +       case $ID_FS_TYPE in<br>
            +       vfat|fat)<br>
            +               MOUNT="$MOUNT -o umask=007,gid=`awk -F':'
            '/^disk/{print $3}' /etc/group`"<br>
            +               ;;<br>
            +       # TODO<br>
            +       *)<br>
            +               ;;<br>
            +       esac<br>
            +<br>
            +       if ! $MOUNT -t auto $DEVNAME "/run/media/$name"<br>
            +       then<br>
            +               #logger "<a href="http://mount.sh/automount"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mount.sh/automount</a>"
            "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"<br>
            +               rm_dir "/run/media/$name"<br>
            +       else<br>
            +               logger "<a href="http://mount.sh/automount"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mount.sh/automount</a>"
            "Auto-mount of [/run/media/$name] successful"<br>
            +               touch "/tmp/.automount-$name"<br>
            +       fi<br>
            +}<br>
            +<br>
            +rm_dir() {<br>
            +       # We do not want to rm -r populated directories<br>
            +       if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a
            -d "$1"<br>
            +       then<br>
            +               ! test -z "$1" &amp;&amp; rm -r "$1"<br>
            +       else<br>
            +               logger "<a href="http://mount.sh/automount"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mount.sh/automount</a>"
            "Not removing non-empty directory [$1]"<br>
            +       fi<br>
            +}<br>
            +<br>
            +# No ID_FS_TYPE for cdrom device, yet it should be mounted<br>
            +name="`basename "$DEVNAME"`"<br>
            +[ -e /sys/block/$name/device/media ] &amp;&amp;
            media_type=`cat /sys/block/$name/device/media`<br>
            +<br>
            +if [ "$ACTION" = "add" ] &amp;&amp; [ -n "$DEVNAME" ]
            &amp;&amp; [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ];
            then<br>
            +       if [ -x "$PMOUNT" ]; then<br>
            +               $PMOUNT $DEVNAME 2&gt; /dev/null<br>
            +       elif [ -x $MOUNT ]; then<br>
            +               $MOUNT $DEVNAME 2&gt; /dev/null<br>
            +       fi<br>
            +<br>
            +       # If the device isn't mounted at this point, it
            isn't<br>
            +       # configured in fstab (note the root filesystem can
            show up as<br>
            +       # /dev/root in /proc/mounts, so check the device
            number too)<br>
            +        if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`;
            then<br>
            +                if [ "`basename $MOUNT`" = "systemd-mount"
            ];then<br>
            +                        grep -q "^$DEVNAME " /proc/mounts
            || automount_systemd<br>
            +                else<br>
            +                        grep -q "^$DEVNAME " /proc/mounts
            || automount<br>
            +                fi<br>
            +        fi<br>
            +fi<br>
            +<br>
            +<br>
            +if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ]
            &amp;&amp; [ -x "$UMOUNT" ] &amp;&amp; [ -n "$DEVNAME" ];
            then<br>
            +       for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut
            -f 2 -d " " `<br>
            +       do<br>
            +               $UMOUNT $mnt<br>
            +       done<br>
            +<br>
            +       # Remove empty directories from auto-mounter<br>
            +       name="`basename "$DEVNAME"`"<br>
            +       test -e "/tmp/.automount-$name" &amp;&amp; rm_dir
            "/run/media/$name"<br>
            +fi<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.8.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div class="gmail_signature" data-smartmail="gmail_signature">
          <div dir="ltr">
            <div>
              <div dir="ltr">Christopher Larson<br>
                kergoth at gmail dot com<br>
                Founder - BitBake, OpenEmbedded, OpenZaurus<br>
                Senior Software Engineer, Mentor Graphics</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------240BE18608E3AF900A68E146--
