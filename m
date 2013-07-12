Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5628A6B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:29:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C9TZMb028200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:29:35 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 12 Jul 2013 02:29:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 17:29:25 +0800
Message-ID: <2b5a435eb3dcc6b7325364faa8c8eba9d8491195.1373599041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373599041.git.hongxu.jia@windriver.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] pmount: add version 0.9.23
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
X-List-Received-Date: Fri, 12 Jul 2013 09:29:34 -0000
Content-Type: text/plain

The pmount is a wrapper around the standard mount program which permits
normal users to mount removable devices without a matching /etc/fstab
entry.

Add option -f to mount already mounted device, while option -f is used,
if the device has already been mounted, it will umount the exist mountpoint
and then mount the current.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-option-f-to-mount-already-mounted-device.patch | 115 +++++++++++++++++++++
 meta/recipes-extended/pmount/pmount_0.9.23.bb      |  29 ++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch
 create mode 100644 meta/recipes-extended/pmount/pmount_0.9.23.bb

diff --git a/meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch b/meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch
new file mode 100644
index 0000000..ca6fbbc
--- /dev/null
+++ b/meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch
@@ -0,0 +1,115 @@
+pmount:add option -f to mount already mounted device
+
+While option -f is used, if the device has already been mounted,
+it will umount the exist mountpoint and then mount the current.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ src/pmount.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/src/pmount.c b/src/pmount.c
+--- a/src/pmount.c
++++ b/src/pmount.c
+@@ -79,6 +79,8 @@ usage( const char* exename )
+     puts( _("Options:\n"
+     "  -r          : force <device> to be mounted read-only\n"
+     "  -w          : force <device> to be mounted read-write\n"
++    "  -f          : force <device> to be mounted even if it has been mounted,\n"
++    "                the previous mounted will be umounted.\n"
+     "  -s, --sync  : mount <device> with the 'sync' option (default: 'async')\n"
+     "  -A, --noatime\n"
+     "                mount <device> with the 'noatime' option (default: 'atime')\n"
+@@ -102,6 +104,31 @@ usage( const char* exename )
+ }
+ 
+ /**
++ * Check whether the given device has already been mounted.
++ * @return 1 if mounted, 0 if not mounted, -1 on failure
++ */
++int
++check_device_mounted(const char* device)
++{
++    int result = device_valid( device ) &&
++        ( device_whitelisted( device ) || device_removable( device ) ) &&
++        !device_locked( device );
++
++    if ( result )
++    {
++        result = device_mounted( device, 0, NULL );
++        if ( result )
++            debug ( "device already mounted\n" );
++    }
++    else
++    {
++        result = -1;
++        perror( _("Error: check device failed") );
++    }
++    return result;
++}
++
++/**
+  * Check whether the user is allowed to mount the given device to the given
+  * mount point. Creates the mount point if it does not exist yet. 
+  * @return 0 on success, -1 on failure
+@@ -618,6 +645,7 @@ main( int argc, char** argv )
+     int noatime = 0;
+     int exec = 0;
+     int force_write = -1; /* 0: ro, 1: rw, -1: default */
++    int force_mount = 0; /* 0: not force mount, 1: force mount */
+     const char* use_fstype = NULL;
+     const char* iocharset = NULL;
+     const char* umask = NULL;
+@@ -646,6 +674,7 @@ main( int argc, char** argv )
+         { "passphrase", 1, NULL, 'p' },
+         { "read-only", 0, NULL, 'r' },
+         { "read-write", 0, NULL, 'w' },
++        { "force-mount", 0, NULL, 'f'},
+         { "version", 0, NULL, 'V' },
+         { NULL, 0, NULL, 0}
+     };
+@@ -678,7 +707,7 @@ main( int argc, char** argv )
+ 
+     /* parse command line options */
+     do {
+-        switch( option = getopt_long( argc, argv, "+hdelLsArwp:t:c:u:V", long_opts, NULL ) ) {
++        switch( option = getopt_long( argc, argv, "+hdelLsArwfp:t:c:u:V", long_opts, NULL ) ) {
+             case -1:  break;          /* end of arguments */
+             case ':':
+             case '?': return E_ARGS;  /* unknown argument */
+@@ -713,6 +742,8 @@ main( int argc, char** argv )
+ 
+             case 'w': force_write = 1; break;
+ 
++            case 'f': force_mount = 1; break;
++
+             case 'V': puts(VERSION); return 0;
+ 
+             default:
+@@ -829,6 +860,22 @@ main( int argc, char** argv )
+             /* clean stale locks */
+             clean_lock_dir( device );
+ 
++            /* if device has already been mounted, umount it */
++            if (force_mount)
++            {
++                result = check_device_mounted(device);
++                if (result < 0)
++                    return E_POLICY;
++                else if (result == 1)
++                {
++                    debug("device alreasy mounted, umount it\n");
++                    result = spawnl( SPAWN_EROOT|SPAWN_RROOT, UMOUNTPROG, UMOUNTPROG, device, NULL );
++                    if( result != 0 ) {
++                        fprintf( stderr, _("Error: umount failed at force mount moment\n") );
++                        return -1;
++                    }
++                }
++            }
+             if( check_mount_policy( device, mntpt )  )
+                 return E_POLICY;
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-extended/pmount/pmount_0.9.23.bb b/meta/recipes-extended/pmount/pmount_0.9.23.bb
new file mode 100644
index 0000000..0d357b9
--- /dev/null
+++ b/meta/recipes-extended/pmount/pmount_0.9.23.bb
@@ -0,0 +1,29 @@
+SUMMARY = "mount removable devices as normal user"
+DESCRIPTION = "pmount is a wrapper around the standard mount program which \
+permits normal users to mount removable devices without a matching /etc/fstab \
+entry. This provides a robust basis for automounting frameworks like GNOME's \
+Utopia project and confines the amount of code that runs as root to a minimum. \
+"
+HOMEPAGE = "http://pmount.alioth.debian.org/"
+SECTION = "console/utils"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = "${DEBIAN_MIRROR}/main/p/pmount/pmount_${PV}.orig.tar.bz2 \
+          file://pmount-add-option-f-to-mount-already-mounted-device.patch \
+"
+
+DEPENDS = "glib-2.0-native intltool-native util-linux virtual/libc"
+
+# 1) Busybox's mount/umount doesn't support pmount very well, so
+# explicitly choose util-linux's mount/umount.
+# 2) It needs the existence of `/var/lock, /etc/mtab, /etc/fstab', so
+# explicitly choose base-files.
+RDEPENDS_${PN} = "util-linux-mount \
+                  util-linux-umount \
+                  base-files \
+"
+
+inherit autotools
+
+SRC_URI[md5sum] = "db19f5bf3151b1b41705ec7bafa439d3"
+SRC_URI[sha256sum] = "db38fc290b710e8e9e9d442da2fb627d41e13b3ee80326c15cc2595ba00ea036"
-- 
1.8.1.2


