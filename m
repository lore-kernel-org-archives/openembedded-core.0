Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9807FC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 05:43:10 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.888.1652334187857363773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 22:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24C5h5Xw020114
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 22:43:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24C5h49X024695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 22:43:05 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 May 2022 22:43:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 22:43:04 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 May 2022 22:43:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] eudev: create static nodes from modules
Date: Thu, 12 May 2022 13:43:03 +0800
Message-ID: <20220512054303.429208-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 05:43:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165533

From: Changqing Li <changqing.li@windriver.com>

dev in modules.devname should be populated in /dev on boot.
remove create static mode from udevd will make these devices
cannot be populated. When use sysVinit, devices like /dev/net/tun
will not be created.

more info:
udevd in systemd also remove create static mode in udevd, but using
service kmod-static-nodes.service and
systemd-tmpfiles-setup-dev.service in systemd to create these node, so
systemd works well.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch

diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
new file mode 100644
index 0000000000..19611f4e89
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
@@ -0,0 +1,115 @@
+From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 10 May 2022 14:04:35 +0800
+Subject: [PATCH] eudev: create static nodes from modules
+
+Revert commit <src/udev/udevd.c: remove create static nodes from modules>
+https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Upstream intentionally remove create static nodes from modules, it is
+expected handled by tmpfiles services, refer [1].
+[1] https://github.com/eudev-project/eudev/issues/229 
+
+For yocto, when start with sysVinit, to enable systemd distro feature,
+and install systemd-tmpfiles is not proper, so revert this commit.
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/udev/udevd.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 71 insertions(+)
+
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index 7ffd174..ff53fe4 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -993,6 +993,76 @@ static void handle_signal(struct udev *udev, int signo) {
+         }
+ }
+ 
++static void static_dev_create_from_modules(struct udev *udev) {
++        struct utsname kernel;
++        char modules[UTIL_PATH_SIZE];
++        char buf[4096];
++        FILE *f;
++
++        if (uname(&kernel) < 0) {
++                log_error("uname failed: %m");
++                return;
++        }
++
++        strscpyl(modules, sizeof(modules), ROOTPREFIX "/lib/modules/", kernel.release, "/modules.devname", NULL);
++        f = fopen(modules, "re");
++        if (f == NULL)
++                return;
++
++        while (fgets(buf, sizeof(buf), f) != NULL) {
++                char *s;
++                const char *modname;
++                const char *devname;
++                const char *devno;
++                int maj, min;
++                char type;
++                mode_t mode;
++                char filename[UTIL_PATH_SIZE];
++
++                if (buf[0] == '#')
++                        continue;
++
++                modname = buf;
++                s = strchr(modname, ' ');
++                if (s == NULL)
++                        continue;
++                s[0] = '\0';
++
++                devname = &s[1];
++                s = strchr(devname, ' ');
++                if (s == NULL)
++                        continue;
++                s[0] = '\0';
++
++                devno = &s[1];
++                s = strchr(devno, ' ');
++                if (s == NULL)
++                        s = strchr(devno, '\n');
++                if (s != NULL)
++                        s[0] = '\0';
++                if (sscanf(devno, "%c%u:%u", &type, &maj, &min) != 3)
++                        continue;
++
++                mode  = 0600;
++                if (type == 'c')
++                        mode |= S_IFCHR;
++                else if (type == 'b')
++                        mode |= S_IFBLK;
++                else
++                        continue;
++
++                strscpyl(filename, sizeof(filename), "/dev/", devname, NULL);
++                mkdir_parents_label(filename, 0755);
++                mac_selinux_create_file_prepare(filename, mode);
++                log_debug("mknod '%s' %c%u:%u", filename, type, maj, min);
++                if (mknod(filename, mode, makedev(maj, min)) < 0 && errno == EEXIST)
++                        utimensat(AT_FDCWD, filename, NULL, 0);
++                mac_selinux_create_file_clear();
++        }
++
++        fclose(f);
++}
++
+ /*
+  * read the kernel command line, in case we need to get into debug mode
+  *   udev.log-priority=<level>                 syslog priority
+@@ -1199,6 +1269,7 @@ int main(int argc, char *argv[]) {
+         }
+ 
+         dev_setup(NULL, UID_INVALID, GID_INVALID);
++        static_dev_create_from_modules(udev);
+ 
+         /* before opening new files, make sure std{in,out,err} fds are in a sane state */
+         if (arg_daemonize) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 841039f6d7..deb6c90a82 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -12,6 +12,7 @@ PROVIDES = "udev"
 SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
+           file://0001-eudev-create-static-nodes-from-modules.patch \
 "
 
 SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
-- 
2.25.1


