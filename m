Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE4B6D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:02:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL72CWh012723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:02:12 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 23:02:11 -0800
Message-ID: <528DAFF3.2070006@windriver.com>
Date: Thu, 21 Nov 2013 01:02:11 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 07:02:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry I forgot to add, this requires the patch that was sent to the list 
2013-09-29 -- bind: run in the chrooted jail

On 11/21/13, 12:59 AM, Mark Hatle wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This patch adds support for read-only rootfs to the bind service.
>
> Now the init script will check a variable, ALLOW_ROOTFS_READ_ONLY,
> to see whether it should start the bind service in a read-only rootfs
> or not. The value is by default unset, thus disabling starting bind
> service in a read-only rootfs. If the variable is set to "yes", as
> stated in the configuration file, the init script would try to make
> necessary bind mounts so that the bind service could be started correctly.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-connectivity/bind/bind-9.8.1/bind9    |  3 +
>   .../init.d-add-support-for-read-only-rootfs.patch  | 70 +++++++++++++++++
>   .../bind/bind-9.8.1/init.d-fix-indentation.patch   | 90 ++++++++++++++++++++++
>   meta/recipes-connectivity/bind/bind_9.8.1.bb       |  3 +
>   4 files changed, 166 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-add-support-for-read-only-rootfs.patch
>   create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-fix-indentation.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind9 b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
> index 3d5b69b..2774334 100644
> --- a/meta/recipes-connectivity/bind/bind-9.8.1/bind9
> +++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
> @@ -28,3 +28,6 @@
>   ROOTDIR="/var/named/chroot"
>   OPTIONS="-u bind"
>
> +# When using a read-only rootfs additional setup may be required
> +# uncomment the following line to make bind start in read-only rootfs
> +#ALLOW_ROOTFS_READ_ONLY="yes"
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-add-support-for-read-only-rootfs.patch
> new file mode 100644
> index 0000000..13166da
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-add-support-for-read-only-rootfs.patch
> @@ -0,0 +1,70 @@
> +Subject: init.d: add support for read-only rootfs
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + init.d | 45 +++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 45 insertions(+)
> +
> +diff --git a/init.d b/init.d
> +index 4a1faaa..70e0219 100644
> +--- a/init.d
> ++++ b/init.d
> +@@ -6,8 +6,53 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
> + # Don't modify this line, change or create /etc/default/bind9.
> + OPTIONS=""
> +
> ++test -f /etc/default/rcS && . /etc/default/rcS
> + test -f /etc/default/bind9 && . /etc/default/bind9
> +
> ++# This function is here because it's possible that /var and / are on different partitions.
> ++is_on_read_only_partition () {
> ++    DIRECTORY=$1
> ++    dir=`readlink -f $DIRECTORY`
> ++    while true; do
> ++	if [ ! -d "$dir" ]; then
> ++	    echo "ERROR: $dir is not a directory"
> ++	    exit 1
> ++	else
> ++	    for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
> ++		END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
> ++		[ "$flag" = "FOUND" ] && partition="read-write"
> ++		[ "$flag" = "ro" ] && { partition="read-only"; break; }
> ++	    done
> ++	    if [ "$dir" = "/" -o -n "$partition" ]; then
> ++		break
> ++	    else
> ++		dir=`dirname $dir`
> ++	    fi
> ++	fi
> ++    done
> ++    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
> ++}
> ++
> ++bind_mount () {
> ++    olddir=$1
> ++    newdir=$2
> ++    mkdir -p $olddir
> ++    cp -a $newdir/* $olddir
> ++    mount --bind $olddir $newdir
> ++}
> ++
> ++# Deal with read-only rootfs
> ++if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
> ++    if [ "$ALLOW_ROOTFS_READ_ONLY" = "yes" ]; then
> ++	[ "$VERBOSE" != "no" ] && echo "WARN: start bind service in read-only rootfs"
> ++	[ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
> ++	[ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
> ++    else
> ++	[ "$VERBOSE" != "no" ] && echo "WARN: read-only rootfs, bind service disabled"
> ++	exit 0
> ++    fi
> ++fi
> ++
> + test -x /usr/sbin/rndc || exit 0
> +
> + if [ -n "$ROOTDIR" ]; then
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/init.d-fix-indentation.patch b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-fix-indentation.patch
> new file mode 100644
> index 0000000..0833685
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-fix-indentation.patch
> @@ -0,0 +1,90 @@
> +Subject: init.d: fix indentation
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + init.d | 64 ++++++++++++++++++++++++++++++++--------------------------------
> + 1 file changed, 32 insertions(+), 32 deletions(-)
> +
> +diff --git a/init.d b/init.d
> +index ff641ea..4a1faaa 100644
> +--- a/init.d
> ++++ b/init.d
> +@@ -22,41 +22,41 @@ ROOTDIR_MOUNT='/etc/bind /var/run/named /var/run/bind /var/cache/bind
> + /etc/localtime /dev/random /dev/zero /dev/null'
> +
> + mount_chroot_conf() {
> +-  if [ -n "$ROOTDIR" ]; then
> +-    for all in $ROOTDIR_MOUNT; do
> +-      # Skip nonexistant files
> +-      [ -e "$all" ] || continue
> +-
> +-      # If mount source is a file
> +-      if ! [ -d "$all" ]; then
> +-        # mount it only if it is not present in chroot or it is empty
> +-        if ! [ -e "$ROOTDIR$all" ] || [ `stat -c'%s' "$ROOTDIR$all"` -eq 0 ]; then
> +-          touch "$ROOTDIR$all"
> +-          mount --bind "$all" "$ROOTDIR$all"
> +-        fi
> +-      else
> +-        # Mount source is a directory. Mount it only if directory in chroot is
> +-        # empty.
> +-	if [ -e "$all" ] && [ `ls -1A $ROOTDIR$all | wc -l` -eq 0 ]; then
> +-          mount --bind "$all" "$ROOTDIR$all"
> +-	fi
> +-      fi
> +-    done
> +-  fi
> ++    if [ -n "$ROOTDIR" ]; then
> ++	for all in $ROOTDIR_MOUNT; do
> ++            # Skip nonexistant files
> ++	    [ -e "$all" ] || continue
> ++
> ++            # If mount source is a file
> ++	    if ! [ -d "$all" ]; then
> ++                # mount it only if it is not present in chroot or it is empty
> ++		if ! [ -e "$ROOTDIR$all" ] || [ `stat -c'%s' "$ROOTDIR$all"` -eq 0 ]; then
> ++		    touch "$ROOTDIR$all"
> ++		    mount --bind "$all" "$ROOTDIR$all"
> ++		fi
> ++	    else
> ++                # Mount source is a directory. Mount it only if directory in chroot is
> ++                # empty.
> ++		if [ -e "$all" ] && [ `ls -1A $ROOTDIR$all | wc -l` -eq 0 ]; then
> ++		    mount --bind "$all" "$ROOTDIR$all"
> ++		fi
> ++	    fi
> ++	done
> ++    fi
> + }
> +
> + umount_chroot_conf() {
> +-  if [ -n "$ROOTDIR" ]; then
> +-    for all in $ROOTDIR_MOUNT; do
> +-      # Check if file is mount target. Do not use /proc/mounts because detecting
> +-      # of modified mounted files can fail.
> +-      if mount | grep -q '.* on '"$ROOTDIR$all"' .*'; then
> +-        umount "$ROOTDIR$all"
> +-        # Remove temporary created files
> +-        [ -f "$all" ] && rm -f "$ROOTDIR$all"
> +-      fi
> +-    done
> +-  fi
> ++    if [ -n "$ROOTDIR" ]; then
> ++	for all in $ROOTDIR_MOUNT; do
> ++            # Check if file is mount target. Do not use /proc/mounts because detecting
> ++            # of modified mounted files can fail.
> ++	    if mount | grep -q '.* on '"$ROOTDIR$all"' .*'; then
> ++		umount "$ROOTDIR$all"
> ++                # Remove temporary created files
> ++		[ -f "$all" ] && rm -f "$ROOTDIR$all"
> ++	    fi
> ++	done
> ++    fi
> + }
> +
> + case "$1" in
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> index b28829b..66a092c 100644
> --- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> @@ -21,6 +21,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://mips1-not-support-opcode.diff \
>              file://bind9 \
>              file://setup-chroot-hooks.patch \
> +           file://init.d-fix-indentation.patch \
> +           file://init.d-add-support-for-read-only-rootfs.patch \
>   	   "
>
>   SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
> @@ -58,6 +60,7 @@ do_install_append() {
>   	rm "${D}${mandir}/man1/nslookup.1"
>   	rmdir "${D}${localstatedir}/run"
>   	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
> +	install -d "${D}${localstatedir}/cache/bind"
>   	install -d "${D}${sysconfdir}/bind"
>   	install -d "${D}${sysconfdir}/init.d"
>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>


