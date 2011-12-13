Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDK-0000sc-2b
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:22 +0100
Received: by mail-fx0-f47.google.com with SMTP id a20so338376faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WNGx3yTaPeBDvBEF9aBBRUwgR8CjSfcfKuX+ZvLJ7GM=;
	b=qA9R6N3D7MiYWibBJnSxln73+5qmWOzO4wH8HsBXEDwnbs3e2o1byAHHs2DSvHMhYo
	6PLjJE8cs8wscf/FyB90nm1B83ukskKeKMA9HDH80a7PoKdsNGvte2R1UMX4ux1DYrAN
	3a4kfCYRsfIkEYxDGdi/Q4PcTrY3Jeh+m9KvA=
Received: by 10.180.102.233 with SMTP id fr9mr26856150wib.40.1323793282552;
	Tue, 13 Dec 2011 08:21:22 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.20
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:21 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:48 +0400
Message-Id: <1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 4/9] consolekit: fix sdk generation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 16:28:22 -0000

Currently sdk generation might fail with the following error:
| Collected errors:
|  * extract_archive: Cannot create symlink from ./var/log to
'volatile/log': File exists.
ERROR: Function 'do_populate_sdk' failed

This happens as consolekit package will include both /var/log/ConsoleKit
and /var/volatile/log/ConsoleKit files:
lumag@fangorn:~/OE-scripts$ dpkg-deb -c build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  | grep var
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/ConsoleKit/
lrwxrwxrwx root/root         0 2011-12-07 22:12 ./var/run -> volatile/run
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/

Inclusion of both log directories causes this error. Drop the
/var/log/ConsoleKit
in favour of /var/volatile/log

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 45f6ad3..9406d88 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r7"
+PR = "r8"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -24,7 +24,7 @@ EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
+FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 PACKAGES =+ "pam-plugin-ck-connector"
-- 
1.7.7.3



