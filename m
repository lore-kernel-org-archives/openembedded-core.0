Return-Path: <andreas.kling@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0832871AC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:15:39 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c4so4416161wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TIOu8c3VKVBbZe5QPxgoIS0g6seYJ48+Vt1PwIoJWMk=;
	b=a9KYJJp5qvemo2j8FY1Gbp1kJhUo84q+WCTeawfj3cDHv9f5PstSG6qiQU+cEpUHOf
	Z8zUrar8JnqHs7vNEoJmPEx1VdZSBN9ucfejj0HZmDWHTjx6L46nFMiIaSD70Ugo77Fa
	yRK9Wb/5ATNF1vUuYEk823S1PYWhJdV4AfA1VmxXHIOOT/+GcA0wiEnJCK/P2f6rx6O6
	MxY1/VVe4VnKWdi4Yk6qrSxM5FTh8GYdfSHujI0IBh3aQci106hb+UhI002ZUVOhAPgz
	+j+/dg0eCIYITa3kmNPQZeHzpwE/N5JTYsQN2EIu6fU5F3YlJY7I9lRLdj3Pcs0mr5Tc
	u+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TIOu8c3VKVBbZe5QPxgoIS0g6seYJ48+Vt1PwIoJWMk=;
	b=NUlu8GOS5z2W/JBL6CnlbmAU8iBDj3t4ehZjRp4kskRCBHwerhg2PFy6Gk4MMSDgjL
	LG9wAytBfHicfJb7h/+bilF1MUjkfBVFWbFl4NbIyDzkAFfY777K4QMGyBimdKA+vHBQ
	5bXzs3Zwi8FoBnARVcdU2sU02eAvy/Te+Whd67k47nN+j5rioC9TtyVjRLCfR4y0gDDv
	NzOPvtyNL1WhtBoq6j403rfz2iWaXX/5JeRi40mSBsq0TQ3cDhnAXidqtt0lQQfc1s3D
	mDZUNAAjGli90Hd9pAzU8ELS2lokGEf50we5/kJVjCP8vb7y5M2XCvpebm8ChE9c9GZL
	Z4Kg==
X-Gm-Message-State: AMke39lEg+St6brmIayUurv9oFCVmWz/SYDL1EXjguRHApWxswUl2rbBzcKW/Jc8OB8nhw==
X-Received: by 10.223.155.152 with SMTP id d24mr27892568wrc.17.1487139339505; 
	Tue, 14 Feb 2017 22:15:39 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id w44sm533172wrc.47.2017.02.14.22.15.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 22:15:38 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 07:15:16 +0100
Message-Id: <20170215061516.21356-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [PATCH] dbus: do not use systemctl from host for configure
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
X-List-Received-Date: Wed, 15 Feb 2017 06:15:43 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  configure.ac from dbus uses $PATH to get the location of systemctl.
  If it is not found /usr/bin/systemctl is used. It is possible to
  override the location by passing SYSTEMCTL=[value] to configure.
  The value is used to replace @SYSTEMCTL@ in systemd-user/dbus.socket.in.
  dbus.socket sets the environment variable DBUS_SESSION_BUS_ADDRESS
  using systemctl.

  dbus does not depend on systemd-systemctl-native, so location from
  host installation or the default value gets used. Adding
  systemd-systemctl to the build would give path from sysroot.

  Forcing SYSTEMCTL=${base_bindir}/systemctl for target gives the
  correct path there and the environment variable is set after a user
  session was opened.

[YOCTO #11002]

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-core/dbus/dbus_1.10.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.10.14.bb b/meta/recipes-core/dbus/dbus_1.10.14.bb
index e4f54ec734..75c8c41df8 100644
--- a/meta/recipes-core/dbus/dbus_1.10.14.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.14.bb
@@ -97,6 +97,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-libaudit \
                 "
 
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-- 
2.11.0


