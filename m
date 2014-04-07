Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id D316B6E79A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 21:05:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3O00CJ3ILSTJ70@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 07 Apr 2014 16:05:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3AD10201AC; Mon,
	07 Apr 2014 17:05:50 -0400 (EDT)
Date: Mon, 07 Apr 2014 17:05:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Saul Wold <sgw@linux.intel.com>
Message-id: <20140407210549.GI3370@denix.org>
References: <1396324451-26983-1-git-send-email-denis@denix.org>
	<20140406224639.GD3370@denix.org> <5342C918.5030307@linux.intel.com>
MIME-version: 1.0
In-reply-to: <5342C918.5030307@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Mon, 07 Apr 2014 21:05:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 07, 2014 at 08:49:44AM -0700, Saul Wold wrote:
> On 04/06/2014 03:46 PM, Denys Dmytriyenko wrote:
> >ping
> >
> 
> This change is a little late for 1.6 as we are prepping for the
> final RC this week.  It's kind of an API change since it moves the
> mount location /media, should we be linking /media to /run/media?
> 
> There is also an issue with the Freescale PPC BSP, which has a
> bbappend for 1.0, so some coordination with them will be needed.
> 
> I can revisit this for 1.7 in a week or so.
> 
> Sau!

I understand the timing concern and am fine waiting another week for when 1.7 
window opens.

But I'm slightly confused as to since when OE-Core is concerned about breaking 
bbappends in other layers? I guess some layers are not created equal, eh? :)

-- 
Denys


> >On Mon, Mar 31, 2014 at 11:54:11PM -0400, Denys Dmytriyenko wrote:
> >>From: Denys Dmytriyenko <denys@ti.com>
> >>
> >>This is done to work around the issue of auto-mounting block devices
> >>(i.e. SD cards) when root filesystem is still in read-only mode and
> >>creating /media/<device> mount-points by udev is not possible. That
> >>is due to udev (/etc/rcS.d/S03udev) getting started earlier than
> >>checkroot (/etc/rcS.d/S10checkroot.sh) gets a chance to re-mount the
> >>rootfs as read-write.
> >>
> >>Although, canonical FHS specifies /media/<device> as a mount point
> >>for removable media devices, the latest 2.3 version was released in
> >>2004 and since then FreeDesktop/udisks and other tools adopted the
> >>new /run/media/<user>/<device> location. That was done to overcome
> >>read-only rootfs limitation, since /run is usually a tmpfs mounted
> >>partition, plus avoid name-clash between users.
> >>
> >>For our embedded systems environment we assume single-user operation
> >>and hence simplify mount point to just /run/media/<device>. But for
> >>proper per-user mounting to /run/media/<user>/<device>, some sort of
> >>session management is required along with the tool like udisks, that
> >>is out of scope of this simple udev-based auto-mounting.
> >>
> >>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>---
> >>v2 - drop PR, bump PV, elaborate on session/user mounting option
> >>
> >>  meta/recipes-core/udev/udev-extraconf/mount.sh             | 14 +++++++-------
> >>  .../udev/{udev-extraconf_1.0.bb => udev-extraconf_1.1.bb}  |  2 --
> >>  2 files changed, 7 insertions(+), 9 deletions(-)
> >>  rename meta/recipes-core/udev/{udev-extraconf_1.0.bb => udev-extraconf_1.1.bb} (99%)
> >>
> >>diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> >>index cb57e47..3e4f21f 100644
> >>--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> >>+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> >>@@ -20,7 +20,7 @@ done
> >>  automount() {	
> >>  	name="`basename "$DEVNAME"`"
> >>
> >>-	! test -d "/media/$name" && mkdir -p "/media/$name"
> >>+	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
> >>  	# Silent util-linux's version of mounting auto
> >>  	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
> >>  	then
> >>@@ -38,12 +38,12 @@ automount() {
> >>  		;;
> >>  	esac
> >>
> >>-	if ! $MOUNT -t auto $DEVNAME "/media/$name"
> >>+	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
> >>  	then
> >>-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
> >>-		rm_dir "/media/$name"
> >>+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
> >>+		rm_dir "/run/media/$name"
> >>  	else
> >>-		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
> >>+		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
> >>  		touch "/tmp/.automount-$name"
> >>  	fi
> >>  }
> >>@@ -60,7 +60,7 @@ rm_dir() {
> >>
> >>  # No ID_FS_TYPE for cdrom device, yet it should be mounted
> >>  name="`basename "$DEVNAME"`"
> >>-[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
> >>+[ -e /sys/block/$name/device/run/media ] && media_type=`cat /sys/block/$name/device/run/media`
> >>
> >>  if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
> >>  	if [ -x "$PMOUNT" ]; then
> >>@@ -87,5 +87,5 @@ if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
> >>  	
> >>  	# Remove empty directories from auto-mounter
> >>  	name="`basename "$DEVNAME"`"
> >>-	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
> >>+	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
> >>  fi
> >>diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
> >>similarity index 99%
> >>rename from meta/recipes-core/udev/udev-extraconf_1.0.bb
> >>rename to meta/recipes-core/udev/udev-extraconf_1.1.bb
> >>index 3810b28..d69056d 100644
> >>--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
> >>+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
> >>@@ -4,8 +4,6 @@ LICENSE = "MIT"
> >>  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
> >>                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> >>
> >>-PR = "r16"
> >>-
> >>  SRC_URI = " \
> >>         file://automount.rules \
> >>         file://mount.sh \
> >>--
> >>1.9.1
> >>
> >>--
> >>_______________________________________________
> >>Openembedded-core mailing list
> >>Openembedded-core@lists.openembedded.org
> >>http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

